<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            ['name' => 'News', 'slug' => 'news'],
            ['name' => 'Ανακοινώσεις', 'slug' => 'anakoinoseis'],
            ['name' => 'Συνεντεύξεις', 'slug' => 'synentefxeis'],
            ['name' => 'Απόψεις', 'slug' => 'apopseis'],
        ];

        foreach ($categories as $category) {
            Category::query()->updateOrCreate(
                ['slug' => $category['slug']],
                ['name' => $category['name']]
            );
        }
    }
}
