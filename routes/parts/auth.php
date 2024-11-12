<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\Auth\LoginSSOController;

Route::group(['as' => 'auth.', 'middleware' => ['guest']], function () {

    Route::get('/', [LoginController::class, 'login'])->name('login');
    Route::post('/', [LoginController::class, 'authenticate'])->name('authenticate');

    Route::get('/login-operation', [LoginSSOController::class, 'redirectToOperation'])->name('redirect.operation')
        ->withoutMiddleware(['guest'])
        ->middleware(['auth']);

    Route::get('/logout', [LogoutController::class, 'logout'])
        ->name('logout')
        ->withoutMiddleware(['guest'])
        ->middleware(['auth']);
});
