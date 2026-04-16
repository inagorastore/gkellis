<?php

namespace App\Http\Controllers\Modules\Admin;

use App\Http\Controllers\Controller;
use App\Models\MediaItem;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\View\View;

class AdminMediaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('modules.admin.media.index', [
            'mediaItems' => MediaItem::query()->latest()->paginate(15),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        return view('modules.admin.media.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'unique:media_items,slug'],
            'description' => ['nullable', 'string'],
            'type' => ['required', 'in:image,video,article,interview'],
            'file' => ['required', 'file', 'max:8192'],
            'source_url' => ['nullable', 'url', 'max:255'],
            'published_on' => ['nullable', 'date'],
            'is_featured' => ['nullable', 'boolean'],
        ]);

        $path = $request->file('file')?->store('media', 'public');

        MediaItem::create([
            ...$validated,
            'slug' => $validated['slug'] ?? Str::slug($validated['title']),
            'file_path' => (string) $path,
            'is_featured' => (bool) ($validated['is_featured'] ?? false),
        ]);

        return redirect()->route('admin.media.index')->with('status', 'Media uploaded.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MediaItem $medium): View
    {
        return view('modules.admin.media.edit', ['mediaItem' => $medium]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, MediaItem $medium): RedirectResponse
    {
        $validated = $request->validate([
            'title' => ['required', 'string', 'max:255'],
            'slug' => ['nullable', 'string', 'max:255', 'unique:media_items,slug,'.$medium->id],
            'description' => ['nullable', 'string'],
            'type' => ['required', 'in:image,video,article,interview'],
            'file' => ['nullable', 'file', 'max:8192'],
            'source_url' => ['nullable', 'url', 'max:255'],
            'published_on' => ['nullable', 'date'],
            'is_featured' => ['nullable', 'boolean'],
        ]);

        if ($request->hasFile('file')) {
            Storage::disk('public')->delete($medium->file_path);
            $medium->file_path = (string) $request->file('file')?->store('media', 'public');
        }

        $medium->fill([
            ...$validated,
            'slug' => $validated['slug'] ?? Str::slug($validated['title']),
            'is_featured' => (bool) ($validated['is_featured'] ?? false),
        ])->save();

        return redirect()->route('admin.media.index')->with('status', 'Media updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(MediaItem $medium): RedirectResponse
    {
        Storage::disk('public')->delete($medium->file_path);
        $medium->delete();

        return back()->with('status', 'Media deleted.');
    }
}
