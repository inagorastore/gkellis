<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold leading-tight text-gray-800">Admin Dashboard</h2>
    </x-slot>

    <div class="py-8">
        <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
            <div class="mb-4">
                <a href="{{ route('admin.posts.index') }}" class="inline-block rounded bg-blue-800 px-4 py-2 text-sm text-white">
                    Manage Posts
                </a>
            </div>
            <div class="grid gap-4 md:grid-cols-3">
                @foreach ($stats as $label => $value)
                    @php
                        $normalizedLabel = strtolower($label);
                        $cardRoute = match ($normalizedLabel) {
                            'posts' => 'admin.posts.index',
                            'media' => 'admin.media.index',
                            default => null,
                        };
                    @endphp
                    @if ($cardRoute)
                        <a href="{{ route($cardRoute) }}"
                            class="block rounded-lg bg-white p-6 shadow transition hover:shadow-md focus:outline-none focus:ring-2 focus:ring-blue-800 focus:ring-offset-2">
                            <p class="text-sm uppercase tracking-wide text-gray-500">{{ $label }}</p>
                            <p class="mt-2 text-3xl font-bold text-gray-900">{{ $value }}</p>
                        </a>
                    @else
                        <div class="rounded-lg bg-white p-6 shadow">
                            <p class="text-sm uppercase tracking-wide text-gray-500">{{ $label }}</p>
                            <p class="mt-2 text-3xl font-bold text-gray-900">{{ $value }}</p>
                        </div>
                    @endif
                @endforeach
            </div>
        </div>
    </div>
</x-app-layout>
