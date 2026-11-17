@php
    $pageUrl = trim((string) config('services.facebook.page_url', ''));
    $pageId = trim((string) config('services.facebook.page_id', ''));
    $appId = trim((string) config('services.facebook.app_id', ''));
    $graphVersion = trim((string) config('services.facebook.graph_version', 'v25.0'));

    if ($pageUrl === '' && $pageId !== '') {
        $pageUrl = 'https://www.facebook.com/'.$pageId;
    }

    $canEmbedLike = ($hasCookieConsent ?? false) && $pageUrl !== '' && $appId !== '';
@endphp

@if ($pageUrl !== '')
    <aside {{ $attributes->class('facebook-follow-cta') }} aria-label="Ακολουθήστε στο Facebook">
        <div class="facebook-follow-cta__copy">
            <p class="facebook-follow-cta__title">Ακολουθήστε μας στο Facebook</p>
            <p class="facebook-follow-cta__text">
                Μάθετε τα νέα πρώτοι — πατήστε Like / Follow στη σελίδα για άμεση ενημέρωση.
            </p>
        </div>

        <div class="facebook-follow-cta__actions">
            <a
                href="{{ $pageUrl }}"
                class="facebook-follow-cta__button"
                target="_blank"
                rel="noopener noreferrer"
            >
                <svg class="facebook-follow-cta__icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
                    <path fill="currentColor" d="M22 12.07C22 6.48 17.52 2 11.93 2S1.86 6.48 1.86 12.07c0 5.02 3.66 9.18 8.44 9.93v-7.03H7.9v-2.9h2.4V9.85c0-2.37 1.41-3.68 3.57-3.68 1.03 0 2.12.18 2.12.18v2.33h-1.19c-1.18 0-1.54.73-1.54 1.48v1.78h2.63l-.42 2.9h-2.21V22c4.78-.75 8.44-4.91 8.44-9.93z"/>
                </svg>
                <span>Ακολουθήστε στο Facebook</span>
            </a>

            @if ($canEmbedLike)
                <div class="facebook-follow-cta__like">
                    <div
                        class="fb-like"
                        data-href="{{ $pageUrl }}"
                        data-width=""
                        data-layout="button_count"
                        data-action="like"
                        data-size="large"
                        data-share="false"
                    ></div>
                </div>
            @endif
        </div>
    </aside>

    @if ($canEmbedLike)
        @once('facebook-sdk')
            <div id="fb-root"></div>
            <script>
                window.fbAsyncInit = function () {
                    FB.init({
                        appId: @json($appId),
                        xfbml: true,
                        version: @json($graphVersion),
                    });
                };
            </script>
            <script
                async
                defer
                crossorigin="anonymous"
                src="https://connect.facebook.net/el_GR/sdk.js"
            ></script>
        @endonce
    @endif
@endif
