<?php

namespace Tests\Feature\Admin;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class PostBodyImageUploadTest extends TestCase
{
    use RefreshDatabase;

    public function test_guest_cannot_upload_body_image(): void
    {
        $response = $this->post(route('admin.posts.body-images.store'), [
            'image' => UploadedFile::fake()->image('photo.jpg'),
        ]);

        $response->assertRedirect();
    }

    public function test_authenticated_user_can_upload_body_image(): void
    {
        Storage::fake('public');

        $user = User::factory()->create();

        $response = $this->actingAs($user)->post(route('admin.posts.body-images.store'), [
            'image' => UploadedFile::fake()->image('photo.jpg', 800, 600),
        ]);

        $response
            ->assertOk()
            ->assertJsonStructure(['url']);

        $this->assertStringContainsString('/storage/posts/body/', $response->json('url'));
    }
}
