<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $metaTitle ?? 'Lt. General (Ret.) Website' }}</title>
    <meta name="description" content="{{ $metaDescription ?? 'Official biography, media presence, and publications.' }}">
    <meta property="og:type" content="website">
    <meta property="og:title" content="{{ $metaTitle ?? 'Lt. General (Ret.) Website' }}">
    <meta property="og:description" content="{{ $metaDescription ?? 'Official biography, media presence, and publications.' }}">
    <meta property="og:url" content="{{ url()->current() }}">
    <meta property="fb:app_id" content="937493685856349">
    <meta name="robots" content="index,follow">
    <link rel="canonical" href="{{ url()->current() }}">
    <link rel="icon" type="image/png" href="{{ asset('images/favicon.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('images/favicon.png') }}">
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=inter:400,500,600,700&display=swap" rel="stylesheet" />
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    @if (!empty($structuredData))
        <script type="application/ld+json">{!! json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE) !!}</script>
    @endif
</head>
<body class="bg-slate-50 text-slate-800 font-['Inter'] antialiased">
    <header class="border-b border-slate-200 bg-white/95 backdrop-blur">
        <div class="mx-auto flex max-w-6xl items-center justify-between px-4 py-4 sm:px-6">
            <a href="{{ route('pages.home') }}" class="text-sm font-semibold tracking-wide text-blue-900">Lt. General (Ret.)</a>
            <nav class="flex items-center gap-4 text-sm text-slate-600">
                <a href="{{ route('pages.biography') }}" class="hover:text-blue-900">Biography</a>
                <a href="{{ route('blog.index') }}" class="hover:text-blue-900">Blog</a>
                <a href="{{ route('contact.index') }}" class="hover:text-blue-900">Contact</a>
                @auth
                    <a href="{{ route('admin.dashboard') }}" class="rounded bg-blue-800 px-3 py-1.5 text-white">Admin</a>
                @endauth
            </nav>
        </div>
    </header>

    <main class="mx-auto min-h-[70vh] max-w-6xl px-4 py-10 sm:px-6">
        @if (session('status'))
            <div class="mb-6 rounded border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm text-emerald-700">
                {{ session('status') }}
            </div>
        @endif
        {{ $slot }}
    </main>

    <footer class="border-t border-slate-200 bg-white">
        <div class="mx-auto max-w-6xl px-4 py-6 text-sm text-slate-500 sm:px-6">
            <div class="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                <p>Γιώργος Κέλλης</p>
                <div class="flex gap-4">
                    <a href="{{ route('pages.privacy') }}" class="hover:text-blue-900">Privacy Policy</a>
                    <a href="{{ route('pages.cookies') }}" class="hover:text-blue-900">Cookies Policy</a>
                    <a href="{{ route('seo.sitemap') }}" class="hover:text-blue-900">Sitemap</a>
                </div>
            </div>
        </div>
    </footer>

    <div
        x-data="{ open: {{ $hasCookieConsent ? 'false' : 'true' }} }"
        x-show="open"
        x-cloak
        class="fixed inset-x-0 bottom-0 z-50 border-t border-slate-200 bg-white p-4 shadow-lg"
    >
        <div class="mx-auto flex max-w-6xl flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <p class="text-sm text-slate-600">This website uses cookies for analytics and performance. You can accept or decline non-essential cookies.</p>
            <div class="flex gap-2">
                <form method="POST" action="{{ route('pages.cookie-consent') }}">
                    @csrf
                    <input type="hidden" name="accepted" value="0">
                    <button type="submit" @click="open = false" class="rounded border border-slate-300 px-3 py-2 text-sm">Decline</button>
                </form>
                <form method="POST" action="{{ route('pages.cookie-consent') }}">
                    @csrf
                    <input type="hidden" name="accepted" value="1">
                    <button type="submit" @click="open = false" class="rounded bg-blue-800 px-3 py-2 text-sm text-white">Accept</button>
                </form>
            </div>
        </div>
    </div>

    @if ($hasCookieConsent && filled(env('GA_MEASUREMENT_ID')))
        <script async src="https://www.googletagmanager.com/gtag/js?id={{ env('GA_MEASUREMENT_ID') }}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', '{{ env('GA_MEASUREMENT_ID') }}');
        </script>
    @endif
</body>
</html>
