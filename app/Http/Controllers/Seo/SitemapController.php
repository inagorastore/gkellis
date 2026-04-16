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
        $urls = collect([
            url('/'),
            route('pages.biography'),
            route('blog.index'),
            route('media.index'),
            route('contact.index'),
            route('pages.privacy'),
            route('pages.cookies'),
        ])->merge(
            Post::published()->pluck('slug')->map(fn (string $slug): string => route('blog.show', $slug))
        )->merge(
            Page::published()->pluck('slug')->map(fn (string $slug): string => url('/'.$slug))
        )->unique()->values();

        return response()
            ->view('seo.sitemap', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }
}
