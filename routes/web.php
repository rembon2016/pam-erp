<?php

declare(strict_types=1);

use App\Http\Controllers\DashboardController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});
