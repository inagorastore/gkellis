<?php

namespace App\Http\Controllers\Modules\Blog;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Contracts\View\View;

class BlogController extends Controller
{
    public function index(): View
    {
        $category = request()->string('category')->toString();
        $tag = request()->string('tag')->toString();

        return view('modules.blog.index', [
            'posts' => Post::query()
                ->with(['category', 'tags'])
                ->published()
                ->when($category !== '', function ($query) use ($category) {
                    $query->whereHas('category', fn ($categoryQuery) => $categoryQuery->where('slug', $category));
                })
                ->when($tag !== '', function ($query) use ($tag) {
                    $query->whereHas('tags', fn ($tagQuery) => $tagQuery->where('slug', $tag));
                })
                ->latest('published_at')
                ->paginate(6)
                ->withQueryString(),
            'activeCategory' => $category,
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
