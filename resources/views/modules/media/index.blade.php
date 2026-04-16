<x-layouts.public meta-title="Media Presence" meta-description="Interviews, appearances, and media archive.">
    <h1 class="text-3xl font-bold text-slate-900">Media Presence</h1>
    <div class="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        @forelse ($mediaItems as $item)
            <article class="rounded-lg border border-slate-200 bg-white p-5 shadow-sm">
                <p class="text-xs uppercase tracking-wide text-blue-700">{{ strtoupper($item->type) }}</p>
                <h2 class="mt-2 text-lg font-semibold text-slate-900">{{ $item->title }}</h2>
                <p class="mt-2 text-sm text-slate-600">{{ $item->description }}</p>
                @if ($item->source_url)
                    <a href="{{ $item->source_url }}" target="_blank" rel="noopener noreferrer" class="mt-3 inline-block text-sm text-blue-700">View source</a>
                @endif
            </article>
        @empty
            <p class="text-slate-500">No media records available yet.</p>
        @endforelse
    </div>
    <div class="mt-6">{{ $mediaItems->links() }}</div>
</x-layouts.public>
