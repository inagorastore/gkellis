@php
    $metaImage = null;

    if (!empty($post->og_image)) {
        $metaImage = str_starts_with($post->og_image, 'http://') || str_starts_with($post->og_image, 'https://')
            ? $post->og_image
            : url(\Illuminate\Support\Facades\Storage::url($post->og_image));
    } elseif (!empty($post->cover_image_path)) {
        $metaImage = url(\Illuminate\Support\Facades\Storage::url($post->cover_image_path));
    }
@endphp

<x-layouts.campaign
    :meta-title="$post->meta_title ?: $post->title"
    :meta-description="$post->meta_description ?: strip_tags($post->excerpt)"
    :meta-image="$metaImage"
>
    <style>
        .article-hero {
            padding: 56px 0 38px;
            background: linear-gradient(120deg, #0d1533 0%, #1d2f72 65%, #324fb3 100%);
            color: #fff;
        }

        .article-kicker {
            color: #ff958f;
            text-transform: uppercase;
            letter-spacing: .12em;
            font-size: .78rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .article-title {
            margin: 0;
            font-size: clamp(1.8rem, 4.5vw, 3.2rem);
            line-height: 1.08;
            letter-spacing: -.02em;
        }

        .article-meta {
            margin: 14px 0 0;
            color: #d2dcff;
            font-size: .95rem;
        }

        .article-shell {
            padding: 34px 0 18px;
        }

        .article-cover {
            margin: 0 0 24px;
        }

        .article-cover img {
            display: block;
            width: 100%;
            max-height: 520px;
            object-fit: cover;
            border-radius: 18px;
        }

        .article-card {
            background: #fff;
            border: 1px solid #edf0fb;
            border-radius: 22px;
            box-shadow: 0 14px 32px rgba(0, 0, 0, .08);
            padding: 28px;
        }

        .article-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin: 0 0 18px;
        }

        .article-chip {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: .78rem;
            text-decoration: none;
        }

        .article-chip.category {
            background: #eef2ff;
            color: #3730a3;
        }

        .article-chip.tag {
            background: #f1f5f9;
            color: #334155;
        }

        .article-content {
            color: var(--muted);
            font-size: 1.05rem;
            overflow-wrap: anywhere;
        }

        .article-content p {
            margin: 0 0 16px;
        }

        .article-content img,
        .article-content iframe,
        .article-content table {
            max-width: 100%;
        }

        .article-back {
            margin-top: 20px;
        }

        @media (max-width: 980px) {
            .article-card {
                padding: 20px;
                border-radius: 16px;
            }
        }
    </style>

    <section class="article-hero">
        <div class="container">
            <p class="article-kicker">Άρθρο</p>
            <h1 class="article-title">{{ $post->title }}</h1>
            <p class="article-meta">{{ optional($post->published_at)->format('d/m/Y') }}</p>
        </div>
    </section>

    <section class="article-shell">
        <div class="container">
            <article class="article-card">
                @if (!empty($post->cover_image_path))
                    <div class="article-cover">
                        <img
                            src="{{ \Illuminate\Support\Facades\Storage::url($post->cover_image_path) }}"
                            alt="{{ $post->title }}"
                        >
                    </div>
                @endif
                <div class="article-tags">
                    @if ($post->category)
                        <a href="{{ route('blog.category', ['category' => $post->category->slug]) }}" class="article-chip category">
                            {{ $post->category->name }}
                        </a>
                    @endif
                    @foreach ($post->tags as $tag)
                        <a href="{{ route('blog.index', ['tag' => $tag->slug]) }}" class="article-chip tag">
                            #{{ $tag->name }}
                        </a>
                    @endforeach
                </div>
                <div class="article-content">
                    {!! $post->body !!}
                </div>
                <div class="article-back">
                    <a href="{{ route('blog.index') }}" class="btn">Επιστροφή στα άρθρα</a>
                </div>
            </article>
        </div>
    </section>
</x-layouts.campaign>
