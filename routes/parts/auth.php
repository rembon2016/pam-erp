<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;

Route::group(['as' => 'auth.', 'middleware' => ['guest']], function () {

    Route::get('/', [LoginController::class, 'login'])->name('login');
    Route::post('/', [LoginController::class, 'authenticate'])->name('authenticate');

    Route::get('/logout', [LogoutController::class, 'logout'])
        ->name('logout')
        ->withoutMiddleware(['guest'])
        ->middleware(['auth']);
});
