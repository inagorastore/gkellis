@if ($paginator->hasPages())
    <nav class="campaign-pagination" role="navigation" aria-label="Σελιδοποίηση">
        <p class="campaign-pagination__summary">
            Εμφάνιση
            <strong>{{ $paginator->firstItem() ?? 0 }}–{{ $paginator->lastItem() ?? 0 }}</strong>
            από
            <strong>{{ $paginator->total() }}</strong>
            άρθρα
        </p>

        <div class="campaign-pagination__controls">
            @if ($paginator->onFirstPage())
                <span class="campaign-pagination__btn is-disabled" aria-disabled="true">← Προηγούμενο</span>
            @else
                <a href="{{ $paginator->previousPageUrl() }}" class="campaign-pagination__btn" rel="prev">← Προηγούμενο</a>
            @endif

            <div class="campaign-pagination__pages" aria-label="Σελίδες">
                @foreach ($elements as $element)
                    @if (is_string($element))
                        <span class="campaign-pagination__dots">{{ $element }}</span>
                    @endif

                    @if (is_array($element))
                        @foreach ($element as $page => $url)
                            @if ($page == $paginator->currentPage())
                                <span class="campaign-pagination__page is-active" aria-current="page">{{ $page }}</span>
                            @else
                                <a href="{{ $url }}" class="campaign-pagination__page">{{ $page }}</a>
                            @endif
                        @endforeach
                    @endif
                @endforeach
            </div>

            @if ($paginator->hasMorePages())
                <a href="{{ $paginator->nextPageUrl() }}" class="campaign-pagination__btn" rel="next">Επόμενο →</a>
            @else
                <span class="campaign-pagination__btn is-disabled" aria-disabled="true">Επόμενο →</span>
            @endif
        </div>
    </nav>
@endif
