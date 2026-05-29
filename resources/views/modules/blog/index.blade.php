<x-layouts.campaign meta-title="Άρθρα | Γιώργος Κέλλης" meta-description="Άρθρα, παρεμβάσεις και σκέψεις για ζητήματα ευθύνης, προσφοράς και προοπτικής.">
    <style>
        .blog-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .blog-post-card {
            padding: 22px;
        }

        .blog-cover-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 12px;
            margin: 0 0 14px;
        }

        .blog-post-title {
            margin: 10px 0 8px;
            font-size: 1.28rem;
            line-height: 1.3;
            word-break: break-word;
        }

        .blog-post-excerpt {
            margin: 0 0 14px;
            color: var(--muted);
            overflow-wrap: anywhere;
        }

        .blog-post-excerpt img,
        .blog-post-excerpt iframe,
        .blog-post-excerpt table {
            max-width: 100%;
        }

        .campaign-pagination {
            display: grid;
            gap: 12px;
        }

        .campaign-pagination__summary {
            margin: 0;
            color: var(--muted);
            font-size: .92rem;
        }

        .campaign-pagination__controls {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .campaign-pagination__btn,
        .campaign-pagination__page {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 40px;
            padding: 8px 14px;
            border: 1px solid #d9e1f5;
            border-radius: 10px;
            background: #fff;
            color: var(--text);
            font-size: .92rem;
            font-weight: 600;
            line-height: 1.2;
            text-decoration: none;
            transition: .2s;
        }

        .campaign-pagination__btn:hover,
        .campaign-pagination__page:hover {
            border-color: #8ca3e9;
            background: #f5f7ff;
        }

        .campaign-pagination__btn.is-disabled {
            opacity: .45;
            cursor: not-allowed;
            pointer-events: none;
        }

        .campaign-pagination__pages {
            display: inline-flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .campaign-pagination__page {
            min-width: 40px;
            padding-inline: 12px;
        }

        .campaign-pagination__page.is-active {
            border-color: #324fb3;
            background: #324fb3;
            color: #fff;
        }

        .campaign-pagination__dots {
            padding: 0 4px;
            color: var(--muted);
            font-size: .92rem;
        }

        @media (max-width: 640px) {
            .campaign-pagination__controls {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 8px;
            }

            .campaign-pagination__pages {
                grid-column: 1 / -1;
                order: -1;
            }

            .campaign-pagination__btn {
                width: 100%;
            }
        }

        @media (max-width: 980px) {
            .blog-grid {
                grid-template-columns: 1fr;
                gap: 14px;
            }

            .blog-post-card {
                padding: 18px;
            }

            .blog-cover-image {
                height: 190px;
            }
        }
    </style>

    <section class="hero" style="padding:72px 0 56px;">
        <div class="container">
            <div class="hero-kicker">Άρθρα</div>
            <h1>Σκέψεις με ευθύνη και προοπτική</h1>
            <p>Κείμενα και παρεμβάσεις για θέματα δημόσιου ενδιαφέροντος, θεσμικής ευθύνης και κοινωνικής συνοχής.</p>
        </div>
    </section>

    <section class="section">
        <div class="container">
            <h2 class="section-title">Τελευταία άρθρα</h2>
            <p class="section-subtitle">Ενημέρωση και θέσεις με καθαρό λόγο, συνέπεια και σεβασμό στον πολίτη.</p>
            @if ($activeCategory || $activeTag)
                <p style="margin:0 0 16px;color:var(--muted);">
                    Φίλτρα:
                    @if ($activeCategory)
                        <strong>Κατηγορία: {{ $activeCategory }}</strong>
                    @endif
                    @if ($activeTag)
                        <strong>Tag: {{ $activeTag }}</strong>
                    @endif
                    <a href="{{ route('blog.index') }}">Καθαρισμός</a>
                </p>
            @endif

            <div class="blog-grid">
                @forelse ($posts as $post)
                    <article class="card blog-post-card">
                        @if ($post->cover_image_path)
                            <a href="{{ route('blog.show', $post) }}" aria-label="Δείτε το άρθρο: {{ $post->title }}" style="display:block;">
                                <img src="{{ \Illuminate\Support\Facades\Storage::url($post->cover_image_path) }}"
                                     alt="{{ $post->title }}"
                                     class="blog-cover-image">
                            </a>
                        @endif
                        <p style="margin:0;color:var(--muted);font-size:.86rem;text-transform:uppercase;letter-spacing:.08em;">
                            {{ optional($post->published_at)->format('d/m/Y') }}
                        </p>
                        <h3 class="blog-post-title">{{ $post->title }}</h3>
                        <div style="display:flex;flex-wrap:wrap;gap:8px;margin:0 0 10px;">
                            @if ($post->category)
                                <a href="{{ route('blog.category', ['category' => $post->category->slug]) }}"
                                   style="display:inline-block;padding:4px 10px;border-radius:999px;background:#eef2ff;color:#3730a3;font-size:.78rem;text-decoration:none;">
                                    {{ $post->category->name }}
                                </a>
                            @endif
                            @foreach ($post->tags as $tag)
                                <a href="{{ route('blog.index', ['tag' => $tag->slug]) }}"
                                   style="display:inline-block;padding:4px 10px;border-radius:999px;background:#f1f5f9;color:#334155;font-size:.78rem;text-decoration:none;">
                                    #{{ $tag->name }}
                                </a>
                            @endforeach
                        </div>
                        <div class="blog-post-excerpt">
                            {!! $post->excerpt !!}
                        </div>
                        <a href="{{ route('blog.show', $post) }}" class="btn">Διαβάστε περισσότερα</a>
                    </article>
                @empty
                    <p style="color:var(--muted);">Δεν υπάρχουν δημοσιευμένα άρθρα ακόμη.</p>
                @endforelse
            </div>

            <div style="margin-top:22px;">
                {{ $posts->links('vendor.pagination.campaign') }}
            </div>
        </div>
    </section>
</x-layouts.campaign>
