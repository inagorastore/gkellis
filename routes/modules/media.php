<?php

declare(strict_types=1);

use App\Http\Controllers\Modules\Media\MediaController;
use Illuminate\Support\Facades\Route;

Route::get('/media-archive', [MediaController::class, 'index'])->name('media.index');
Route::get('/media', fn () => redirect()->route('media.index'));
