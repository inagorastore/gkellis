<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;

Route::get('/media', fn () => redirect()->route('pages.home', status: 301));
