<?php

namespace Database\Seeders;

use App\Models\MediaItem;
use App\Models\Page;
use App\Models\Post;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $admin = User::query()->updateOrCreate([
            'email' => 'admin@general-site.test',
        ], [
            'name' => 'Site Administrator',
            'password' => Hash::make('password'),
        ]);

        Page::query()->updateOrCreate([
            'slug' => 'biography',
        ], [
            'title' => 'Biography',
            'content' => 'Retired Lieutenant General with decades of national and international command experience.',
            'is_published' => true,
        ]);

        Post::query()->updateOrCreate([
            'slug' => 'leadership-and-service',
        ], [
            'user_id' => $admin->id,
            'title' => 'Leadership and Public Service',
            'excerpt' => 'Lessons from command for institutions and citizens.',
            'body' => 'This initial post showcases the editorial structure for thought leadership articles.',
            'is_published' => true,
            'published_at' => now(),
        ]);

        MediaItem::query()->updateOrCreate([
            'slug' => 'national-broadcast-interview',
        ], [
            'title' => 'National Broadcast Interview',
            'description' => 'Discussion on defense strategy and civic unity.',
            'type' => 'interview',
            'file_path' => 'media/sample-interview.jpg',
            'is_featured' => true,
            'published_on' => now(),
        ]);
    }
}
