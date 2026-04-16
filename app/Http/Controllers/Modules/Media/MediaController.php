<?php

namespace App\Http\Controllers\Modules\Media;

use App\Http\Controllers\Controller;
use App\Models\MediaItem;
use Illuminate\Contracts\View\View;

class MediaController extends Controller
{
    public function index(): View
    {
        return view('modules.media.index', [
            'mediaItems' => MediaItem::query()->latest('published_on')->paginate(12),
        ]);
    }
}
