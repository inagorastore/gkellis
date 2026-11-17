<?php

declare(strict_types=1);

namespace App\Services;

use App\Models\Post;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use RuntimeException;

class FacebookPagePublisher
{
    public function isConfigured(): bool
    {
        return filled(config('services.facebook.page_id'))
            && filled(config('services.facebook.page_access_token'));
    }

    public function publish(Post $post): string
    {
        if (! $this->isConfigured()) {
            throw new RuntimeException('Η σύνδεση Facebook δεν είναι ρυθμισμένη (.env).');
        }

        if (! $post->is_published) {
            throw new RuntimeException('Το άρθρο πρέπει να είναι δημοσιευμένο στο site πριν ανέβει στο Facebook.');
        }

        if (filled($post->facebook_post_id)) {
            throw new RuntimeException('Το άρθρο έχει ήδη δημοσιευτεί στο Facebook.');
        }

        $pageId = (string) config('services.facebook.page_id');
        $token = (string) config('services.facebook.page_access_token');
        $version = (string) config('services.facebook.graph_version', 'v25.0');
        $url = sprintf('https://graph.facebook.com/%s/%s/feed', $version, $pageId);

        $response = Http::asForm()
            ->timeout(20)
            ->post($url, [
                'message' => $this->buildMessage($post),
                'link' => route('blog.show', ['post' => $post->slug]),
                'access_token' => $token,
            ]);

        if (! $response->successful()) {
            $error = data_get($response->json(), 'error.message', $response->body());

            Log::warning('Facebook page publish failed', [
                'post_id' => $post->id,
                'status' => $response->status(),
                'error' => $error,
            ]);

            throw new RuntimeException('Αποτυχία δημοσίευσης στο Facebook: '.$error);
        }

        $facebookPostId = (string) data_get($response->json(), 'id', '');

        if ($facebookPostId === '') {
            throw new RuntimeException('Το Facebook δεν επέστρεψε ID δημοσίευσης.');
        }

        $post->forceFill([
            'facebook_post_id' => $facebookPostId,
            'facebook_published_at' => now(),
        ])->save();

        return $facebookPostId;
    }

    private function buildMessage(Post $post): string
    {
        $excerpt = trim(preg_replace('/\s+/u', ' ', strip_tags((string) $post->excerpt)) ?? '');
        $parts = array_filter([
            trim((string) $post->title),
            $excerpt !== '' ? $excerpt : null,
        ]);

        return implode("\n\n", $parts);
    }
}
