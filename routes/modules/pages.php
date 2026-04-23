<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Pages\PageController;
use Illuminate\Support\Facades\Route;

Route::get('/', [PageController::class, 'home'])->name('pages.home');
Route::get('/biography', fn () => redirect()->route('pages.biography', status: 301));
Route::get('/giorgos-kellis-biography', [PageController::class, 'biography'])->name('pages.biography');
Route::get('/privacy-policy', [PageController::class, 'privacy'])->name('pages.privacy');
Route::get('/cookies-policy', [PageController::class, 'cookies'])->name('pages.cookies');
Route::post('/cookie-consent', [PageController::class, 'consentCookies'])->name('pages.cookie-consent');
