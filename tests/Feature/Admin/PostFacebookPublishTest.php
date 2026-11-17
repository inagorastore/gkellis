<?php

declare(strict_types=1);

namespace Tests\Feature\Admin;

use App\Models\Post;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Tests\TestCase;

class PostFacebookPublishTest extends TestCase
{
    use RefreshDatabase;

    public function test_admin_can_publish_existing_post_to_facebook(): void
    {
        config([
            'services.facebook.page_id' => '123456789',
            'services.facebook.page_access_token' => 'test-token',
            'services.facebook.graph_version' => 'v25.0',
        ]);

        Http::fake([
            'graph.facebook.com/*' => Http::response(['id' => '123456789_987654321'], 200),
        ]);

        $user = User::factory()->create();
        $post = Post::query()->create([
            'user_id' => $user->id,
            'title' => 'Δοκιμαστικό άρθρο',
            'slug' => 'dokimastiko-arthro',
            'excerpt' => '<p>Σύντομη περιγραφή</p>',
            'body' => '<p>Περιεχόμενο άρθρου</p>',
            'is_published' => true,
            'published_at' => now()->subDays(3),
        ]);

        $response = $this->actingAs($user)->put(route('admin.posts.update', $post), [
            'title' => $post->title,
            'slug' => $post->slug,
            'excerpt' => $post->excerpt,
            'body' => $post->body,
            'is_published' => '1',
            'published_at' => $post->published_at?->format('Y-m-d H:i:s'),
            'publish_to_facebook' => '1',
        ]);

        $response->assertRedirect(route('admin.posts.index'));

        $post->refresh();

        $this->assertSame('123456789_987654321', $post->facebook_post_id);
        $this->assertNotNull($post->facebook_published_at);

        Http::assertSent(function ($request): bool {
            return str_contains($request->url(), 'graph.facebook.com/v25.0/123456789/feed')
                && $request['message'] !== null
                && $request['link'] !== null
                && $request['access_token'] === 'test-token';
        });
    }

    public function test_facebook_checkbox_is_ignored_when_already_published(): void
    {
        config([
            'services.facebook.page_id' => '123456789',
            'services.facebook.page_access_token' => 'test-token',
        ]);

        Http::fake();

        $user = User::factory()->create();
        $post = Post::query()->create([
            'user_id' => $user->id,
            'title' => 'Ήδη στο Facebook',
            'slug' => 'idi-sto-facebook',
            'excerpt' => '<p>Excerpt</p>',
            'body' => '<p>Body</p>',
            'is_published' => true,
            'published_at' => now(),
            'facebook_post_id' => '111_222',
            'facebook_published_at' => now()->subDay(),
        ]);

        $this->actingAs($user)->put(route('admin.posts.update', $post), [
            'title' => $post->title,
            'slug' => $post->slug,
            'excerpt' => $post->excerpt,
            'body' => $post->body,
            'is_published' => '1',
            'published_at' => $post->published_at?->format('Y-m-d H:i:s'),
            'publish_to_facebook' => '1',
        ])->assertRedirect(route('admin.posts.index'));

        Http::assertNothingSent();
        $this->assertSame('111_222', $post->fresh()->facebook_post_id);
    }

    public function test_admin_can_republish_post_to_facebook(): void
    {
        config([
            'services.facebook.page_id' => '123456789',
            'services.facebook.page_access_token' => 'test-token',
            'services.facebook.graph_version' => 'v25.0',
        ]);

        Http::fake([
            'graph.facebook.com/*' => Http::response(['id' => '123456789_999888777'], 200),
        ]);

        $user = User::factory()->create();
        $post = Post::query()->create([
            'user_id' => $user->id,
            'title' => 'Επαναδημοσίευση',
            'slug' => 'epanadimosiefsi',
            'excerpt' => '<p>Περιγραφή&nbsp;με&nbsp;nbsp</p>',
            'body' => '<p>Body</p>',
            'is_published' => true,
            'published_at' => now(),
            'facebook_post_id' => '111_222',
            'facebook_published_at' => now()->subDay(),
        ]);

        $this->actingAs($user)
            ->post(route('admin.posts.republish-facebook', $post))
            ->assertRedirect(route('admin.posts.edit', $post));

        $post->refresh();

        $this->assertSame('123456789_999888777', $post->facebook_post_id);
        $this->assertNotNull($post->facebook_published_at);

        Http::assertSent(function ($request): bool {
            return str_contains($request->url(), 'graph.facebook.com/v25.0/123456789/feed')
                && $request['access_token'] === 'test-token'
                && ! str_contains((string) $request['message'], '&nbsp;');
        });
    }

    public function test_post_social_image_falls_back_to_brand_image(): void
    {
        $post = new Post([
            'title' => 'Χωρίς εικόνα',
            'slug' => 'xoris-eikona',
            'excerpt' => '<p>Excerpt</p>',
            'body' => '<p>Body</p>',
        ]);

        $url = $post->resolveSocialImageUrl();

        $this->assertStringContainsString('gkellis-facebook-fallback.jpg', $url);
    }

    public function test_post_social_image_dimensions_default_to_facebook_ratio(): void
    {
        $post = new Post([
            'title' => 'Χωρίς τοπική εικόνα',
            'slug' => 'xoris-topiki-eikona',
            'excerpt' => '<p>Excerpt</p>',
            'body' => '<p>Body</p>',
            'og_image' => 'https://example.com/remote-og.jpg',
        ]);

        $this->assertSame([
            'width' => 1200,
            'height' => 630,
        ], $post->resolveSocialImageDimensions());
    }

    public function test_update_keeps_uploaded_og_image_when_url_field_is_blank(): void
    {
        $user = User::factory()->create();
        $post = Post::query()->create([
            'user_id' => $user->id,
            'title' => 'Άρθρο με OG upload',
            'slug' => 'arthro-me-og-upload',
            'excerpt' => '<p>Excerpt</p>',
            'body' => '<p>Body</p>',
            'og_image' => 'posts/og/existing-og.jpg',
            'is_published' => true,
            'published_at' => now(),
        ]);

        $this->actingAs($user)->put(route('admin.posts.update', $post), [
            'title' => $post->title,
            'slug' => $post->slug,
            'excerpt' => $post->excerpt,
            'body' => $post->body,
            'og_image' => '',
            'is_published' => '1',
            'published_at' => $post->published_at?->format('Y-m-d H:i:s'),
        ])->assertRedirect(route('admin.posts.index'));

        $this->assertSame('posts/og/existing-og.jpg', $post->fresh()->og_image);
    }

    public function test_update_rejects_non_url_og_image_text(): void
    {
        $user = User::factory()->create();
        $post = Post::query()->create([
            'user_id' => $user->id,
            'title' => 'Άρθρο OG',
            'slug' => 'arthro-og',
            'excerpt' => '<p>Excerpt</p>',
            'body' => '<p>Body</p>',
            'og_image' => 'posts/og/existing-og.jpg',
            'is_published' => true,
            'published_at' => now(),
        ]);

        $this->actingAs($user)->from(route('admin.posts.edit', $post))->put(route('admin.posts.update', $post), [
            'title' => $post->title,
            'slug' => $post->slug,
            'excerpt' => $post->excerpt,
            'body' => $post->body,
            'og_image' => 'posts/og/not-a-full-url.jpg',
            'is_published' => '1',
            'published_at' => $post->published_at?->format('Y-m-d H:i:s'),
        ])->assertRedirect(route('admin.posts.edit', $post))
            ->assertSessionHasErrors('og_image');

        $this->assertSame('posts/og/existing-og.jpg', $post->fresh()->og_image);
    }
}
