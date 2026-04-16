@csrf
<div class="space-y-4 rounded-lg bg-white p-6 shadow">
    <input name="title" value="{{ old('title', $mediaItem->title ?? '') }}" placeholder="Title" required class="w-full rounded border-gray-300">
    <input name="slug" value="{{ old('slug', $mediaItem->slug ?? '') }}" placeholder="Slug" class="w-full rounded border-gray-300">
    <textarea name="description" rows="4" placeholder="Description" class="w-full rounded border-gray-300">{{ old('description', $mediaItem->description ?? '') }}</textarea>
    <select name="type" class="w-full rounded border-gray-300">
        @foreach (['image', 'video', 'article', 'interview'] as $type)
            <option value="{{ $type }}" @selected(old('type', $mediaItem->type ?? 'image') === $type)>{{ ucfirst($type) }}</option>
        @endforeach
    </select>
    <input type="file" name="file" @if(!isset($mediaItem)) required @endif class="w-full rounded border-gray-300">
    <input type="url" name="source_url" value="{{ old('source_url', $mediaItem->source_url ?? '') }}" placeholder="Source URL" class="w-full rounded border-gray-300">
    <input type="date" name="published_on" value="{{ old('published_on', isset($mediaItem) && $mediaItem->published_on ? $mediaItem->published_on->format('Y-m-d') : '') }}" class="w-full rounded border-gray-300">
    <label class="inline-flex items-center gap-2 text-sm">
        <input type="checkbox" name="is_featured" value="1" @checked(old('is_featured', $mediaItem->is_featured ?? false))>
        Featured
    </label>
    <button class="rounded bg-blue-800 px-4 py-2 text-sm text-white">{{ $submitLabel }}</button>
</div>
