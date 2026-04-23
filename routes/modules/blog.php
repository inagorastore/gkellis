<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Blog\BlogController;
use Illuminate\Support\Facades\Route;

Route::get('/category/{category:slug}', [BlogController::class, 'indexByCategory'])->name('blog.category');

Route::prefix('blog')->name('blog.')->group(function (): void {
    Route::get('/', [BlogController::class, 'index'])->name('index');
    Route::get('/{post:slug}', [BlogController::class, 'show'])->name('show');
});
