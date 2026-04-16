<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Contact\ContactController;
use Illuminate\Support\Facades\Route;

Route::prefix('contact')->name('contact.')->group(function (): void {
    Route::get('/', [ContactController::class, 'index'])->name('index');
    Route::post('/', [ContactController::class, 'store'])
        ->middleware('throttle:contact')
        ->name('store');
});
