<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Edit Post</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-4xl space-y-4 sm:px-6 lg:px-8">
            <form method="POST" action="{{ route('admin.posts.update', $post) }}" enctype="multipart/form-data">
                @method('PUT')
                @include('modules.admin.posts._form', ['submitLabel' => 'Save Changes'])
            </form>
            <form method="POST" action="{{ route('admin.posts.destroy', $post) }}">
                @csrf
                @method('DELETE')
                <button class="rounded border border-red-200 px-4 py-2 text-sm text-red-600">Delete Post</button>
            </form>
        </div>
    </div>
</x-app-layout>
