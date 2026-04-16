<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Manage Posts</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-7xl space-y-4 sm:px-6 lg:px-8">
            <a href="{{ route('admin.posts.create') }}" class="inline-block rounded bg-blue-800 px-4 py-2 text-sm text-white">New Post</a>
            <div class="overflow-hidden rounded bg-white shadow">
                <table class="min-w-full text-sm">
                    <thead>
                        <tr class="border-b bg-gray-50 text-left text-xs uppercase tracking-wide text-gray-500">
                            <th class="px-4 py-3">Title</th>
                            <th class="px-4 py-3">Published At</th>
                            <th class="px-4 py-3">Status</th>
                            <th class="px-4 py-3 text-right">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach ($posts as $post)
                        <tr class="border-b">
                            <td class="px-4 py-3">{{ $post->title }}</td>
                            <td class="px-4 py-3">
                                {{ $post->published_at ? $post->published_at->format('d/m/Y H:i') : '—' }}
                            </td>
                            <td class="px-4 py-3">{{ $post->is_published ? 'Published' : 'Draft' }}</td>
                            <td class="px-4 py-3 text-right"><a href="{{ route('admin.posts.edit', $post) }}" class="text-blue-700">Edit</a></td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
            {{ $posts->links() }}
        </div>
    </div>
</x-app-layout>
