<?php

declare(strict_types=1);

use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Route;

Route::group(['as' => 'auth.'], function () {

    Route::get('/', [LoginController::class, 'login'])->name('login');
    Route::post('/', [LoginController::class, 'authenticate'])->name('authenticate');
});
