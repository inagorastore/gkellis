<?php

namespace App\Http\Controllers\Modules\Contact;

use App\Http\Controllers\Controller;
use App\Http\Requests\ContactMessageRequest;
use App\Models\ContactMessage;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;

class ContactController extends Controller
{
    public function index(): View
    {
        return view('modules.contact.index');
    }

    public function store(ContactMessageRequest $request): RedirectResponse
    {
        $validated = $request->safe()->except('privacy_policy_accepted');

        ContactMessage::create([
            ...$validated,
            'ip_address' => $request->ip(),
            'user_agent' => (string) $request->userAgent(),
            'consented_at' => now(),
        ]);

        return back()->with('status', 'Your message has been received.');
    }
}
