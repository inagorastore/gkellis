<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class MediaItem extends Model
{
    protected $fillable = [
        'title',
        'slug',
        'description',
        'type',
        'file_path',
        'thumbnail_path',
        'source_url',
        'published_on',
        'is_featured',
    ];

    protected $casts = [
        'published_on' => 'date',
        'is_featured' => 'boolean',
    ];

    public function scopeFeatured(Builder $query): Builder
    {
        return $query->where('is_featured', true);
    }
}
