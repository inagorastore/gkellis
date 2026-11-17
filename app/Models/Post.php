<?php

declare(strict_types=1);

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Support\Facades\Storage;

class Post extends Model
{
    protected $fillable = [
        'user_id',
        'category_id',
        'title',
        'slug',
        'excerpt',
        'body',
        'cover_image_path',
        'og_image',
        'meta_title',
        'meta_description',
        'published_at',
        'is_published',
        'facebook_post_id',
        'facebook_published_at',
    ];

    protected $casts = [
        'published_at' => 'datetime',
        'is_published' => 'boolean',
        'facebook_published_at' => 'datetime',
    ];

    public function author(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function tags(): BelongsToMany
    {
        return $this->belongsToMany(Tag::class);
    }

    public function scopePublished(Builder $query): Builder
    {
        return $query
            ->where('is_published', true)
            ->whereNotNull('published_at');
    }

    public function hasBeenPublishedToFacebook(): bool
    {
        return filled($this->facebook_post_id);
    }

    public function facebookShareUrl(): ?string
    {
        if (! $this->hasBeenPublishedToFacebook()) {
            return null;
        }

        return 'https://www.facebook.com/'.$this->facebook_post_id;
    }

    public function resolveSocialImageUrl(bool $absolute = true): string
    {
        if (filled($this->og_image)) {
            return $this->normalizeMediaUrl((string) $this->og_image, $absolute);
        }

        if (filled($this->cover_image_path)) {
            return $this->normalizeMediaUrl((string) $this->cover_image_path, $absolute);
        }

        $fallback = (string) config('services.facebook.fallback_image', 'images/gkellis-facebook-fallback.jpg');

        return $absolute ? asset($fallback) : '/'.ltrim($fallback, '/');
    }

    /**
     * @return array{width: int, height: int}
     */
    public function resolveSocialImageDimensions(): array
    {
        $localPath = $this->resolveSocialImageLocalPath();

        if ($localPath !== null) {
            $size = @getimagesize($localPath);

            if (is_array($size) && ($size[0] ?? 0) > 0 && ($size[1] ?? 0) > 0) {
                return [
                    'width' => (int) $size[0],
                    'height' => (int) $size[1],
                ];
            }
        }

        return [
            'width' => 1200,
            'height' => 630,
        ];
    }

    private function resolveSocialImageLocalPath(): ?string
    {
        if (filled($this->og_image)) {
            return $this->localPathForMediaValue((string) $this->og_image);
        }

        if (filled($this->cover_image_path)) {
            return $this->localPathForMediaValue((string) $this->cover_image_path);
        }

        $fallback = (string) config('services.facebook.fallback_image', 'images/gkellis-facebook-fallback.jpg');
        $publicPath = public_path(ltrim($fallback, '/'));

        return is_file($publicPath) ? $publicPath : null;
    }

    private function localPathForMediaValue(string $value): ?string
    {
        if (str_starts_with($value, 'http://') || str_starts_with($value, 'https://')) {
            return null;
        }

        $storagePath = Storage::disk('public')->path($value);

        return is_file($storagePath) ? $storagePath : null;
    }

    private function normalizeMediaUrl(string $value, bool $absolute): string
    {
        if (str_starts_with($value, 'http://') || str_starts_with($value, 'https://')) {
            return $value;
        }

        $storageUrl = Storage::url($value);

        return $absolute ? url($storageUrl) : $storageUrl;
    }
}
