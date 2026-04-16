<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Edit Media</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-4xl space-y-4 sm:px-6 lg:px-8">
            <form method="POST" enctype="multipart/form-data" action="{{ route('admin.media.update', $mediaItem) }}">
                @method('PUT')
                @include('modules.admin.media._form', ['submitLabel' => 'Save Changes'])
            </form>
            <form method="POST" action="{{ route('admin.media.destroy', $mediaItem) }}">
                @csrf
                @method('DELETE')
                <button class="rounded border border-red-200 px-4 py-2 text-sm text-red-600">Delete Media</button>
            </form>
        </div>
    </div>
</x-app-layout>
