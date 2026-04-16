<!doctype html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Νέο μήνυμα επικοινωνίας</title>
</head>
<body style="font-family: Arial, sans-serif; color: #111827; line-height: 1.5;">
    <h2 style="margin-bottom: 16px;">Νέο μήνυμα από τη φόρμα επικοινωνίας</h2>

    <p><strong>Ονοματεπώνυμο:</strong> {{ $contactMessage->name }}</p>
    <p><strong>Email:</strong> {{ $contactMessage->email }}</p>
    <p><strong>Θέμα:</strong> {{ $contactMessage->subject }}</p>
    <p><strong>Ημερομηνία:</strong> {{ $contactMessage->created_at?->format('d/m/Y H:i') }}</p>

    <hr style="margin: 16px 0; border: 0; border-top: 1px solid #e5e7eb;">

    <p><strong>Μήνυμα:</strong></p>
    <p style="white-space: pre-wrap;">{{ $contactMessage->message }}</p>

    <hr style="margin: 16px 0; border: 0; border-top: 1px solid #e5e7eb;">

    <p style="font-size: 12px; color: #6b7280;">
        IP: {{ $contactMessage->ip_address ?? 'N/A' }}<br>
        User Agent: {{ $contactMessage->user_agent ?? 'N/A' }}
    </p>
</body>
</html>
