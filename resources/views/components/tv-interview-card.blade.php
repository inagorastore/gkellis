@props([
    'interview',
    'snap' => false,
])

<article class="card" style="display:grid;grid-template-rows:auto 1fr auto;gap:12px;padding:0;overflow:hidden;{{ $snap ? 'scroll-snap-align:start;' : '' }}">
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
