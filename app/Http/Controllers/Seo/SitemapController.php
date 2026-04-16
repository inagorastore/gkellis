<?php

declare(strict_types=1);

namespace App\Http\Controllers\Seo;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Models\Post;
use Illuminate\Http\Response;

class SitemapController extends Controller
{
    public function __invoke(): Response
    {
        $postUrls = Post::published()
            ->pluck('slug')
            ->filter(fn ($slug): bool => is_string($slug) && filled($slug))
            ->map(fn ($slug): string => route('blog.show', ['post' => $slug]));

        $pageUrls = Page::published()
            ->pluck('slug')
            ->filter(fn ($slug): bool => is_string($slug) && filled($slug))
            ->map(fn ($slug): string => url('/'.$slug));

        $urls = collect([
            url('/'),
            route('pages.biography'),
            route('blog.index'),
            route('media.index'),
            route('contact.index'),
            route('pages.privacy'),
            route('pages.cookies'),
        ])->merge($postUrls)
            ->merge($pageUrls)
            ->unique()
            ->values();

        return response()
            ->view('seo.sitemap', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }
}
