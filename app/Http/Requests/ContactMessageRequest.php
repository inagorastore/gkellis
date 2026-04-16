<?php

declare(strict_types=1);

namespace App\Http\Requests;

use App\Services\RecaptchaVerifier;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Validator;

class ContactMessageRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $rules = [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email:rfc,dns', 'max:255'],
            'subject' => ['required', 'string', 'max:255'],
            'message' => ['required', 'string', 'max:3000'],
            'privacy_policy_accepted' => ['accepted'],
        ];

        if ($this->isRecaptchaEnabled()) {
            $rules['g-recaptcha-response'] = ['required', 'string'];
        }

        return $rules;
    }

    public function messages(): array
    {
        return [
            'privacy_policy_accepted.accepted' => 'Πρέπει να αποδεχτείτε την πολιτική απορρήτου.',
            'g-recaptcha-response.required' => 'Παρακαλώ επιβεβαιώστε ότι δεν είστε ρομπότ.',
        ];
    }

    public function withValidator($validator): void
    {
        if (! $this->isRecaptchaEnabled()) {
            return;
        }

        $validator->after(function (Validator $validator): void {
            $verifier = app(RecaptchaVerifier::class);

            $isValid = $verifier->verify(
                token: (string) $this->input('g-recaptcha-response'),
                ip: $this->ip()
            );

            if (! $isValid) {
                $validator->errors()->add(
                    'g-recaptcha-response',
                    'Η επαλήθευση reCAPTCHA απέτυχε. Προσπαθήστε ξανά.'
                );
            }
        });
    }

    private function isRecaptchaEnabled(): bool
    {
        return filled(config('services.recaptcha.site_key'))
            && filled(config('services.recaptcha.secret_key'));
    }
}
