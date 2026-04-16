<?php

declare(strict_types=1);

namespace App\Http\Controllers\Modules\Contact;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContactMessageRequest;
use App\Mail\ContactMessageReceived;
use App\Models\ContactMessage;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Throwable;

class ContactController extends Controller
{
    public function index(): View
    {
        return view('modules.contact.index');
    }

    public function store(ContactMessageRequest $request): RedirectResponse
    {
        $validated = $request->safe()->except('privacy_policy_accepted');

        $contactMessage = ContactMessage::create([
            ...$validated,
            'ip_address' => $request->ip(),
            'user_agent' => (string) $request->userAgent(),
            'consented_at' => now(),
        ]);

        try {
            Mail::to('info@gkellis.gr')->send(new ContactMessageReceived($contactMessage));
        } catch (Throwable $exception) {
            Log::error('Contact message email delivery failed.', [
                'contact_message_id' => $contactMessage->id,
                'error' => $exception->getMessage(),
            ]);
        }

        return back()->with('status', 'Your message has been received.');
    }
}
