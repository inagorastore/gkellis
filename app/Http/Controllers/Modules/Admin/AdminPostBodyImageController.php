<?php

declare(strict_types=1);

namespace App\Http\Controllers\Modules\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminPostBodyImageController extends Controller
{
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'image' => ['required', 'image', 'mimes:jpeg,jpg,png,webp,gif', 'max:5120'],
        ]);

        $path = $validated['image']->store('posts/body', 'public');

        return response()->json([
            'url' => url(Storage::disk('public')->url($path)),
        ]);
    }
}
