<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Media\MediaController;
use Illuminate\Support\Facades\Route;

Route::prefix('media')->name('media.')->group(function (): void {
    Route::get('/', [MediaController::class, 'index'])->name('index');
});
