<?php

namespace App\Http\Controllers\Modules\Media;

use App\Http\Controllers\Controller;
use App\Support\TvInterviews;
use Illuminate\Contracts\View\View;

class MediaController extends Controller
{
    public function index(): View
    {
        return view('modules.media.index', [
            'tvInterviews' => TvInterviews::all(),
        ]);
    }
}
