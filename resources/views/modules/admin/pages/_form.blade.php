@csrf
<div class="space-y-4 rounded-lg bg-white p-6 shadow">
    <div>
        <label class="text-sm font-medium text-gray-700">Title</label>
        <input name="title" value="{{ old('title', $page->title ?? '') }}" required class="mt-1 w-full rounded border-gray-300">
    </div>
    <div>
        <label class="text-sm font-medium text-gray-700">Slug</label>
        <input name="slug" value="{{ old('slug', $page->slug ?? '') }}" class="mt-1 w-full rounded border-gray-300">
    </div>
    <div>
        <label class="text-sm font-medium text-gray-700">Meta Title</label>
        <input name="meta_title" value="{{ old('meta_title', $page->meta_title ?? '') }}" class="mt-1 w-full rounded border-gray-300">
    </div>
    <div>
        <label class="text-sm font-medium text-gray-700">Meta Description</label>
        <input name="meta_description" value="{{ old('meta_description', $page->meta_description ?? '') }}" class="mt-1 w-full rounded border-gray-300">
    </div>
    <div>
        <label class="text-sm font-medium text-gray-700">Content</label>
        <textarea name="content" rows="10" required class="mt-1 w-full rounded border-gray-300">{{ old('content', $page->content ?? '') }}</textarea>
    </div>
    <label class="inline-flex items-center gap-2 text-sm text-gray-700">
        <input type="checkbox" name="is_published" value="1" @checked(old('is_published', $page->is_published ?? false))>
        Publish immediately
    </label>
    <button class="rounded bg-blue-800 px-4 py-2 text-sm font-medium text-white">{{ $submitLabel }}</button>
</div>
