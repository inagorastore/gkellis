<?php

namespace App\Http\Controllers\Modules\Pages;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Models\Post;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function home(): View
    {
        return view('modules.pages.home', [
            'featuredPosts' => Post::published()->latest('published_at')->take(3)->get(),
        ]);
    }

    public function biography(): View
    {
        $biographyPage = Page::published()->where('slug', 'biography')->first();

        return view('modules.pages.biography', compact('biographyPage'));
    }

    public function privacy(): View
    {
        return view('modules.pages.privacy-policy');
    }

    public function cookies(): View
    {
        return view('modules.pages.cookies-policy');
    }

    public function consentCookies(Request $request): RedirectResponse
    {
        $value = $request->boolean('accepted') ? '1' : '0';

        return back()->withCookie(cookie('cookie_consent', $value, 60 * 24 * 365));
    }
}
