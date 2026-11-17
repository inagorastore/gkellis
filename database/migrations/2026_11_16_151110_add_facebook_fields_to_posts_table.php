<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->string('facebook_post_id')->nullable()->after('is_published');
            $table->timestamp('facebook_published_at')->nullable()->after('facebook_post_id');
        });
    }

    public function down(): void
    {
        Schema::table('posts', function (Blueprint $table) {
            $table->dropColumn(['facebook_post_id', 'facebook_published_at']);
        });
    }
};
