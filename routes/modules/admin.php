<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Admin\AdminDashboardController;
use App\Http\Controllers\Modules\Admin\AdminDatabaseExportController;
use App\Http\Controllers\Modules\Admin\AdminMediaController;
use App\Http\Controllers\Modules\Admin\AdminPageController;
use App\Http\Controllers\Modules\Admin\AdminPostBodyImageController;
use App\Http\Controllers\Modules\Admin\AdminPostController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth'])->prefix('admin')->name('admin.')->group(function (): void {
    Route::get('/', AdminDashboardController::class)->name('dashboard');
    Route::post('/database-export', AdminDatabaseExportController::class)->name('database.export');
    Route::resource('pages', AdminPageController::class)->except(['show']);
    Route::post('posts/body-images', [AdminPostBodyImageController::class, 'store'])
        ->name('posts.body-images.store');
    Route::resource('posts', AdminPostController::class)->except(['show']);
    Route::resource('media', AdminMediaController::class)->except(['show']);
});
