<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Manage Media</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-7xl space-y-4 sm:px-6 lg:px-8">
            <a href="{{ route('admin.media.create') }}" class="inline-block rounded bg-blue-800 px-4 py-2 text-sm text-white">Upload Media</a>
            <div class="overflow-hidden rounded bg-white shadow">
                <table class="min-w-full text-sm">
                    @foreach ($mediaItems as $item)
                        <tr class="border-b">
                            <td class="px-4 py-3">{{ $item->title }}</td>
                            <td class="px-4 py-3">{{ $item->type }}</td>
                            <td class="px-4 py-3 text-right"><a href="{{ route('admin.media.edit', $item) }}" class="text-blue-700">Edit</a></td>
                        </tr>
                    @endforeach
                </table>
            </div>
            {{ $mediaItems->links() }}
        </div>
    </div>
</x-app-layout>
