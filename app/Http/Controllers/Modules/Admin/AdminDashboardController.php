<?php

namespace App\Http\Controllers\Modules\Admin;

use App\Http\Controllers\Controller;
use App\Models\MediaItem;
use App\Models\Page;
use App\Models\Post;
use Illuminate\Contracts\View\View;

class AdminDashboardController extends Controller
{
    public function __invoke(): View
    {
        return view('modules.admin.dashboard', [
            'stats' => [
                'pages' => Page::count(),
                'posts' => Post::count(),
                'media' => MediaItem::count(),
            ],
        ]);
    }
}
