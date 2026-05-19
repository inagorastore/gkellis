<?php

namespace App\Http\Controllers\Modules\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\View\View;

class AdminPostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('modules.admin.posts.index', [
            'posts' => Post::query()
                ->orderByDesc('published_at')
                ->orderByDesc('created_at')
                ->paginate(15),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        return view('modules.admin.posts.create', [
            'categories' => Category::query()->orderBy('name')->get(),
            'existingTags' => Tag::query()->orderBy('name')->pluck('name'),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'category_id' => ['nullable', 'integer', 'exists:categories,id'],
            'category_name' => ['nullable', 'string', 'max:100'],
            'tags' => ['nullable', 'string', 'max:500'],
            'title' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'unique:posts,slug'],
            'excerpt' => ['nullable', 'string', 'max:5000'],
            'body' => ['required', 'string'],
            'meta_title' => ['nullable', 'string', 'max:255'],
            'meta_description' => ['nullable', 'string', 'max:160'],
            'og_image' => ['nullable', 'url', 'max:2048'],
            'og_image_upload' => ['nullable', 'image', 'max:4096'],
            'remove_og_image' => ['nullable', 'boolean'],
            'published_at' => ['nullable', 'date'],
            'cover_image' => ['nullable', 'image', 'max:4096'],
            'is_published' => ['nullable', 'boolean'],
        ]);

        $validated['slug'] = $this->resolveSlug($validated['slug'] ?? null, $validated['title']);
        $validated['user_id'] = $request->user()?->id;
        $validated['category_id'] = $this->resolveCategoryId(
            $validated['category_id'] ?? null,
            $validated['category_name'] ?? null
        );
        $validated['is_published'] = (bool) ($validated['is_published'] ?? false);
        $validated['published_at'] = $validated['is_published']
            ? ($validated['published_at'] ?? now())
            : null;
        $validated['body'] = $this->sanitizeRichText($validated['body']);
        $validated['excerpt'] = $this->resolveExcerpt($validated['excerpt'] ?? null, $validated['body']);
        $validated['meta_title'] = $this->resolveMetaTitle($validated['meta_title'] ?? null, $validated['body']);
        $validated['meta_description'] = $this->resolveMetaDescription(
            $validated['meta_description'] ?? null,
            $validated['body']
        );

        if ($request->hasFile('cover_image')) {
            $validated['cover_image_path'] = $request->file('cover_image')->store('posts/covers', 'public');
        }

        if ($request->hasFile('og_image_upload')) {
            $validated['og_image'] = $request->file('og_image_upload')->store('posts/og', 'public');
        }

        $post = Post::create($validated);
        $post->tags()->sync($this->resolveTagIds($validated['tags'] ?? null));

        return redirect()->route('admin.posts.index')->with('status', 'Post created.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post): View
    {
        return view('modules.admin.posts.edit', [
            'post' => $post->load('tags'),
            'categories' => Category::query()->orderBy('name')->get(),
            'existingTags' => Tag::query()->orderBy('name')->pluck('name'),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post): RedirectResponse
    {
        $validated = $request->validate([
            'category_id' => ['nullable', 'integer', 'exists:categories,id'],
            'category_name' => ['nullable', 'string', 'max:100'],
            'tags' => ['nullable', 'string', 'max:500'],
            'title' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'unique:posts,slug,'.$post->id],
            'excerpt' => ['nullable', 'string', 'max:5000'],
            'body' => ['required', 'string'],
            'meta_title' => ['nullable', 'string', 'max:255'],
            'meta_description' => ['nullable', 'string', 'max:160'],
            'og_image' => ['nullable', 'url', 'max:2048'],
            'og_image_upload' => ['nullable', 'image', 'max:4096'],
            'remove_og_image' => ['nullable', 'boolean'],
            'published_at' => ['nullable', 'date'],
            'cover_image' => ['nullable', 'image', 'max:4096'],
            'is_published' => ['nullable', 'boolean'],
        ]);

        $validated['slug'] = $this->resolveSlug($validated['slug'] ?? null, $validated['title']);
        $validated['category_id'] = $this->resolveCategoryId(
            $validated['category_id'] ?? null,
            $validated['category_name'] ?? null
        );
        $validated['is_published'] = (bool) ($validated['is_published'] ?? false);
        $validated['published_at'] = $validated['is_published']
            ? ($validated['published_at'] ?? $post->published_at ?? now())
            : null;
        $validated['body'] = $this->sanitizeRichText($validated['body']);
        $validated['excerpt'] = $this->resolveExcerpt($validated['excerpt'] ?? null, $validated['body']);
        $validated['meta_title'] = $this->resolveMetaTitle($validated['meta_title'] ?? null, $validated['body']);
        $validated['meta_description'] = $this->resolveMetaDescription(
            $validated['meta_description'] ?? null,
            $validated['body']
        );

        if ($request->hasFile('cover_image')) {
            if (! empty($post->cover_image_path)) {
                Storage::disk('public')->delete($post->cover_image_path);
            }

            $validated['cover_image_path'] = $request->file('cover_image')->store('posts/covers', 'public');
        }

        if ($request->hasFile('og_image_upload')) {
            $this->deleteStoredOgImage($post->og_image);
            $validated['og_image'] = $request->file('og_image_upload')->store('posts/og', 'public');
        } elseif ((bool) ($validated['remove_og_image'] ?? false)) {
            $this->deleteStoredOgImage($post->og_image);
            $validated['og_image'] = null;
        } elseif (array_key_exists('og_image', $validated) && $validated['og_image'] !== $post->og_image) {
            $this->deleteStoredOgImage($post->og_image);
        }

        $post->update($validated);
        $post->tags()->sync($this->resolveTagIds($validated['tags'] ?? null));

        return redirect()->route('admin.posts.index')->with('status', 'Post updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post): RedirectResponse
    {
        if (! empty($post->cover_image_path)) {
            Storage::disk('public')->delete($post->cover_image_path);
        }
        $this->deleteStoredOgImage($post->og_image);

        $post->delete();

        return redirect()->route('admin.posts.index')->with('status', 'Post deleted.');
    }

    private function sanitizeRichText(string $value): string
    {
        $sanitized = preg_replace('/<(script|style)\b[^>]*>.*?<\/\1>/is', '', $value) ?? '';
        $sanitized = preg_replace('/\s*on\w+\s*=\s*(".*?"|\'.*?\'|[^\s>]+)/i', '', $sanitized) ?? '';
        $sanitized = preg_replace('/\s*(href|src)\s*=\s*([\'"])\s*javascript:[^\'"]*\2/i', '', $sanitized) ?? '';
        $sanitized = preg_replace('/\s*data-trix-[^=]*=(["\']).*?\1/i', '', $sanitized) ?? '';
        $sanitized = strip_tags(
            $sanitized,
            '<p><br><strong><b><em><i><u><a><ul><ol><li><blockquote><h1><h2><h3><h4><code><pre><img><figure><figcaption>'
        );

        $sanitized = $this->sanitizeRichTextImages($sanitized);

        return trim($sanitized);
    }

    private function sanitizeRichTextImages(string $html): string
    {
        $appUrl = rtrim((string) config('app.url'), '/');
        $allowedPrefix = '/storage/posts/body/';

        return preg_replace_callback(
            '/<img\b[^>]*\bsrc=(["\'])(.*?)\1[^>]*>/i',
            function (array $matches) use ($appUrl, $allowedPrefix): string {
                $src = html_entity_decode($matches[2], ENT_QUOTES | ENT_HTML5);

                if (! $this->isAllowedBodyImageSrc($src, $appUrl, $allowedPrefix)) {
                    return '';
                }

                $alt = '';
                if (preg_match('/\balt=(["\'])(.*?)\1/i', $matches[0], $altMatch)) {
                    $alt = ' alt="'.e(html_entity_decode($altMatch[2], ENT_QUOTES | ENT_HTML5)).'"';
                }

                return '<img src="'.e($src).'"'.$alt.' loading="lazy" decoding="async" style="max-width:100%;height:auto;border-radius:12px;">';
            },
            $html
        ) ?? $html;
    }

    private function isAllowedBodyImageSrc(string $src, string $appUrl, string $allowedPrefix): bool
    {
        if (str_starts_with($src, $allowedPrefix)) {
            return true;
        }

        if (str_starts_with($src, $appUrl.$allowedPrefix)) {
            return true;
        }

        return false;
    }

    private function resolveExcerpt(?string $excerpt, string $body): string
    {
        if (filled($excerpt)) {
            return $this->sanitizeRichText($excerpt);
        }

        $plainBody = trim(preg_replace('/\s+/', ' ', strip_tags($body)) ?? '');
        $generated = Str::limit($plainBody, 320);

        return '<p>'.e($generated).'</p>';
    }

    private function resolveMetaTitle(?string $metaTitle, string $body): string
    {
        if (filled($metaTitle)) {
            return trim($metaTitle);
        }

        $plainBody = trim(preg_replace('/\s+/', ' ', strip_tags($body)) ?? '');

        return Str::limit($plainBody, 60, '');
    }

    private function resolveMetaDescription(?string $metaDescription, string $body): string
    {
        if (filled($metaDescription)) {
            return trim($metaDescription);
        }

        $plainBody = trim(preg_replace('/\s+/', ' ', strip_tags($body)) ?? '');

        return Str::limit($plainBody, 160, '');
    }

    private function resolveSlug(?string $slug, string $title): string
    {
        $source = filled($slug) ? $slug : $title;
        $source = $this->transliterateGreek($source);
        $resolved = Str::slug($source);

        return filled($resolved) ? $resolved : 'post-'.Str::lower(Str::random(8));
    }

    private function transliterateGreek(string $value): string
    {
        $normalized = mb_strtolower(trim($value));

        $digraphs = [
            'αι' => 'ai',
            'ει' => 'ei',
            'οι' => 'oi',
            'ου' => 'ou',
            'ευ' => 'eu',
            'αυ' => 'au',
            'γγ' => 'ng',
            'γκ' => 'gk',
            'ντ' => 'nt',
            'μπ' => 'mp',
            'τσ' => 'ts',
            'τζ' => 'tz',
        ];

        $letters = [
            'ά' => 'a', 'α' => 'a', 'β' => 'v', 'γ' => 'g', 'δ' => 'd',
            'έ' => 'e', 'ε' => 'e', 'ζ' => 'z', 'ή' => 'i', 'η' => 'i',
            'ί' => 'i', 'ϊ' => 'i', 'ΐ' => 'i', 'ι' => 'i', 'κ' => 'k',
            'λ' => 'l', 'μ' => 'm', 'ν' => 'n', 'ξ' => 'x', 'ό' => 'o',
            'ο' => 'o', 'π' => 'p', 'ρ' => 'r', 'σ' => 's', 'ς' => 's',
            'τ' => 't', 'ύ' => 'y', 'ϋ' => 'y', 'ΰ' => 'y', 'υ' => 'y',
            'φ' => 'f', 'χ' => 'ch', 'ψ' => 'ps', 'ώ' => 'o', 'ω' => 'o',
        ];

        return strtr(strtr($normalized, $digraphs), $letters);
    }

    private function resolveCategoryId(?int $categoryId, ?string $categoryName): ?int
    {
        if ($categoryId) {
            return $categoryId;
        }

        if (! filled($categoryName)) {
            return null;
        }

        $category = Category::query()->firstOrCreate(
            ['slug' => Str::slug($categoryName)],
            ['name' => trim($categoryName)]
        );

        return $category->id;
    }

    private function resolveTagIds(?string $tags): array
    {
        if (! filled($tags)) {
            return [];
        }

        $normalizedTags = collect(explode(',', $tags))
            ->map(fn (string $tag): string => trim($tag))
            ->filter()
            ->unique()
            ->values();

        return $normalizedTags->map(function (string $tag): int {
            $model = Tag::query()->firstOrCreate(
                ['slug' => Str::slug($tag)],
                ['name' => $tag]
            );

            return $model->id;
        })->all();
    }

    private function deleteStoredOgImage(?string $value): void
    {
        if (! filled($value)) {
            return;
        }

        if (str_starts_with($value, 'http://') || str_starts_with($value, 'https://')) {
            return;
        }

        Storage::disk('public')->delete($value);
    }
}
