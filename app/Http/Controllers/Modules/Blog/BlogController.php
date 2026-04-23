<?php

namespace App\Http\Controllers\Modules\Blog;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Contracts\View\View;

class BlogController extends Controller
{
    public function index(): View
    {
        return $this->renderIndex();
    }

    public function indexByCategory(Category $category): View
    {
        return $this->renderIndex($category->slug);
    }

    private function renderIndex(string $categorySlug = ''): View
    {
        $tag = request()->string('tag')->toString();
        $activeCategory = $categorySlug !== '' ? $categorySlug : request()->string('category')->toString();

        return view('modules.blog.index', [
            'posts' => Post::query()
                ->with(['category', 'tags'])
                ->published()
                ->when($activeCategory !== '', function ($query) use ($activeCategory) {
                    $query->whereHas('category', fn ($categoryQuery) => $categoryQuery->where('slug', $activeCategory));
                })
                ->when($tag !== '', function ($query) use ($tag) {
                    $query->whereHas('tags', fn ($tagQuery) => $tagQuery->where('slug', $tag));
                })
                ->latest('published_at')
                ->paginate(6)
                ->withQueryString(),
            'activeCategory' => $activeCategory,
            'activeTag' => $tag,
        ]);
    }

    public function show(Post $post): View
    {
        abort_unless($post->is_published, 404);
        $post->loadMissing(['category', 'tags']);

        return view('modules.blog.show', compact('post'));
    }
}
