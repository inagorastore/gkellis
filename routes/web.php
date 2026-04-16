<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Seo\SitemapController;
use Illuminate\Support\Facades\Route;

Route::get('/dashboard', fn () => redirect()->route('admin.dashboard'))
    ->middleware('auth')
    ->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
require __DIR__.'/modules/pages.php';
require __DIR__.'/modules/blog.php';
require __DIR__.'/modules/media.php';
require __DIR__.'/modules/contact.php';
require __DIR__.'/modules/admin.php';

Route::get('/sitemap.xml', SitemapController::class)->name('seo.sitemap');
