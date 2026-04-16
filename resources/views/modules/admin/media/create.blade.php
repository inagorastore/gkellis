<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Upload Media</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-4xl sm:px-6 lg:px-8">
            <form method="POST" enctype="multipart/form-data" action="{{ route('admin.media.store') }}">
                @include('modules.admin.media._form', ['submitLabel' => 'Upload'])
            </form>
        </div>
    </div>
</x-app-layout>
