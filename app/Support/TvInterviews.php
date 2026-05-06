<?php

declare(strict_types=1);

namespace App\Support;

use Carbon\Carbon;
use Illuminate\Support\Arr;

final class TvInterviews
{
    /**
     * @return list<array{occurred_at: Carbon, channel: string, description: string, url: string, thumbnail: string}>
     */
    public static function all(): array
    {
        $raw = [
            [
                'occurred_at' => '2026-03-11',
                'channel' => 'ΔΕΛΤΑ Τηλεόραση',
                'description' => 'Ζωντανή σύνδεση στο δελτίο ειδήσεων.',
                'url' => 'https://www.youtube.com/watch?v=BugGSX2fd80&t=2178s',
            ],
            [
                'occurred_at' => '2026-02-04',
                'channel' => 'Thraki-Net',
                'description' => 'Συνέντευξη στο γραφείο του Συντονιστή Αποκατάστασης και Ανασυγκρότησης Έβρου - προβολή στο κεντρικό δελτίο ειδήσεων.',
                'url' => 'https://www.youtube.com/watch?v=6oLuSu7kXCs&t=1s',
            ],
            [
                'occurred_at' => '2026-01-28',
                'channel' => 'Ena Channel',
                'description' => 'Ζωντανή σύνδεση στην εκπομπή «Εξελίξεις» με τον Γιάννη Χατζηεμμανουήλ και παρουσία του Τένη Καμαρίδη.',
                'url' => 'https://www.youtube.com/live/meRw9ohy_rk?t=250s',
            ],
            [
                'occurred_at' => '2025-07-17',
                'channel' => 'ΔΕΛΤΑ TV',
                'description' => 'Ρεπορτάζ της ΔΕΛΤΑ TV.',
                'url' => 'https://www.youtube.com/watch?v=pOo8RswbrgI',
            ],
            [
                'occurred_at' => '2024-11-28',
                'channel' => 'ΔΕΛΤΑ Τηλεόραση',
                'description' => 'Ζωντανή σύνδεση στο δελτίο ειδήσεων.',
                'url' => 'https://www.youtube.com/watch?v=JC_HlUgdmQk',
            ],
            [
                'occurred_at' => '2024-10-30',
                'channel' => 'ΔΕΛΤΑ Τηλεόραση',
                'description' => 'Κεντρικό δελτίο ειδήσεων.',
                'url' => 'https://www.youtube.com/watch?v=PJoZz1BcvYU',
            ],
            [
                'occurred_at' => '2024-09-25',
                'channel' => 'ΔΕΛΤΑ TV',
                'description' => 'Ανακοίνωση διορισμού Συντονιστή Αποκατάστασης και Ανασυγκρότησης Έβρου.',
                'url' => 'https://www.youtube.com/watch?v=4FrevyRDhnY',
            ],
        ];

        $items = array_map(function (array $row): array {
            $occurredAt = Carbon::parse(Arr::get($row, 'occurred_at'));
            $url = (string) Arr::get($row, 'url');
            $videoId = self::extractYoutubeVideoId($url);

            return [
                'occurred_at' => $occurredAt,
                'channel' => (string) Arr::get($row, 'channel'),
                'description' => (string) Arr::get($row, 'description'),
                'url' => $url,
                'thumbnail' => $videoId !== null
                    ? "https://img.youtube.com/vi/{$videoId}/hqdefault.jpg"
                    : '',
            ];
        }, $raw);

        usort($items, static fn (array $a, array $b): int => $b['occurred_at'] <=> $a['occurred_at']);

        return $items;
    }

    private static function extractYoutubeVideoId(string $url): ?string
    {
        $parsed = parse_url($url);
        $host = strtolower((string) ($parsed['host'] ?? ''));
        $path = (string) ($parsed['path'] ?? '');
        $query = (string) ($parsed['query'] ?? '');

        if ($host === 'youtu.be' && $path !== '') {
            return self::normalizeYoutubeId(basename($path));
        }

        if (str_contains($host, 'youtube.com')) {
            if (preg_match('#^/live/([^/?]+)#', $path, $m)) {
                return self::normalizeYoutubeId($m[1]);
            }

            parse_str($query, $params);
            if (! empty($params['v'])) {
                return self::normalizeYoutubeId((string) $params['v']);
            }
        }

        return null;
    }

    private static function normalizeYoutubeId(string $id): string
    {
        return preg_replace('/[^a-zA-Z0-9_-]/', '', $id) ?? '';
    }
}
