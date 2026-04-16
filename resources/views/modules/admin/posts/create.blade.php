<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Create Post</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-4xl sm:px-6 lg:px-8">
            <form method="POST" action="{{ route('admin.posts.store') }}" enctype="multipart/form-data">
                @include('modules.admin.posts._form', ['submitLabel' => 'Create Post'])
            </form>
        </div>
    </div>
</x-app-layout>
