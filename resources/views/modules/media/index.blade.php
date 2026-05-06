<x-layouts.campaign
  meta-title="Media Archive | Γιώργος Κέλλης"
  meta-description="Αρχείο τηλεοπτικών εμφανίσεων και συνεντεύξεων του Γιώργου Κέλλη."
>
  <x-slot:head>
    <link rel="canonical" href="https://gkellis.gr/media-archive">
  </x-slot:head>

  <section class="hero" style="padding:72px 0 56px;">
    <div class="container">
      <div class="hero-kicker">Media Archive</div>
      <h1>TV συνεντεύξεις &amp; παρουσίες</h1>
      <p>Όλες οι τηλεοπτικές εμφανίσεις σε ένα σημείο, με χρονολογική σειρά.</p>
    </div>
  </section>

  <section class="section">
    <div class="container">
      <h2 class="section-title">Όλο το αρχείο media</h2>
      <p class="section-subtitle">Επιλέξτε ένα απόσπασμα για να ανοίξει στο YouTube σε νέα καρτέλα.</p>

      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:18px;">
        @foreach ($tvInterviews as $interview)
          <article class="card" style="display:grid;grid-template-rows:auto 1fr auto;gap:12px;padding:0;overflow:hidden;">
            <a href="{{ $interview['url'] }}" target="_blank" rel="noopener noreferrer" style="display:block;line-height:0;background:#0f1738;">
              @if (filled($interview['thumbnail']))
                <img
                  src="{{ $interview['thumbnail'] }}"
                  alt="Προεπισκόπηση βίντεο — {{ \Illuminate\Support\Str::limit($interview['description'], 120) }}"
                  width="480"
                  height="360"
                  loading="lazy"
                  decoding="async"
                  style="width:100%;aspect-ratio:16/9;object-fit:cover;"
                >
              @else
                <div style="aspect-ratio:16/9;background:#1d2f72;display:flex;align-items:center;justify-content:center;color:#d2dcff;font-size:.9rem;padding:12px;text-align:center;">
                  Δείτε το βίντεο
                </div>
              @endif
            </a>
            <div style="padding:0 22px;">
              <p class="small" style="margin:0 0 6px;">
                <time datetime="{{ $interview['occurred_at']->toDateString() }}">{{ $interview['occurred_at']->format('d/m/Y') }}</time>
                <span style="display:inline-block;margin-left:8px;padding:2px 10px;border-radius:999px;background:#eef3ff;color:#324fb3;font-size:.78rem;font-weight:600;">{{ $interview['channel'] }}</span>
              </p>
              <p style="margin:0;font-size:1rem;line-height:1.45;color:var(--text);">{{ $interview['description'] }}</p>
            </div>
            <div style="padding:0 22px 22px;">
              <a class="btn" href="{{ $interview['url'] }}" target="_blank" rel="noopener noreferrer" style="width:100%;text-align:center;display:block;">Δες το απόσπασμα</a>
            </div>
          </article>
        @endforeach
      </div>
    </div>
  </section>
</x-layouts.campaign>
