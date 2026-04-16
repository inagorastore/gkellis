<x-app-layout>
    <x-slot name="header"><h2 class="text-xl font-semibold text-gray-800">Create Page</h2></x-slot>
    <div class="py-8">
        <div class="mx-auto max-w-4xl sm:px-6 lg:px-8">
            <form method="POST" action="{{ route('admin.pages.store') }}">
                @include('modules.admin.pages._form', ['submitLabel' => 'Create Page'])
            </form>
        </div>
    </div>
</x-app-layout>
