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
                            <img src="{{ \Illuminate\Support\Facades\Storage::url($post->cover_image_path) }}"
                                 alt="{{ $post->title }}"
                                 class="blog-cover-image">
                        @endif
                        <p style="margin:0;color:var(--muted);font-size:.86rem;text-transform:uppercase;letter-spacing:.08em;">
                            {{ optional($post->published_at)->format('d/m/Y') }}
                        </p>
                        <h3 class="blog-post-title">{{ $post->title }}</h3>
                        <div style="display:flex;flex-wrap:wrap;gap:8px;margin:0 0 10px;">
                            @if ($post->category)
                                <a href="{{ route('blog.index', ['category' => $post->category->slug]) }}"
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
                {{ $posts->links() }}
            </div>
        </div>
    </section>
</x-layouts.campaign>
