<?php

declare(strict_types=1);

namespace App\Services;

use Illuminate\Support\Facades\Http;

class RecaptchaVerifier
{
    public function verify(?string $token, ?string $ip = null): bool
    {
        if (blank($token) || blank(config('services.recaptcha.secret_key'))) {
            return false;
        }

        $response = Http::asForm()
            ->timeout(5)
            ->post('https://www.google.com/recaptcha/api/siteverify', [
                'secret' => config('services.recaptcha.secret_key'),
                'response' => $token,
                'remoteip' => $ip,
            ]);

        if (! $response->ok()) {
            return false;
        }

        return (bool) data_get($response->json(), 'success', false);
    }
}
