<?php

declare(strict_types=1);

namespace App\Http\Controllers\Seo;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Models\Post;
use Illuminate\Http\Response;
use Illuminate\Support\Str;

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
            route('contact.index'),
            route('pages.privacy'),
            route('pages.cookies'),
        ])->merge($postUrls)
            ->merge($pageUrls)
            ->reject(fn (string $url): bool => rtrim($url, '/') === url('/biography'))
            ->unique()
            ->values();

        $xml = $this->buildSitemapXml($urls->all());

        return response($xml, 200, ['Content-Type' => 'application/xml; charset=UTF-8']);
    }

    /**
     * @param array<int, string> $urls
     */
    private function buildSitemapXml(array $urls): string
    {
        $entries = collect($urls)
            ->map(function (string $url): string {
                $escaped = e($url);

                return "<url>\n<loc>{$escaped}</loc>\n</url>";
            })
            ->implode("\n");

        return Str::of('<?xml version="1.0" encoding="UTF-8"?>')
            ->append("\n")
            ->append('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">')
            ->append("\n")
            ->append($entries)
            ->append("\n")
            ->append('</urlset>')
            ->toString();
    }
}
