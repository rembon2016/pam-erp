<?php

declare(strict_types=1);

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\LoginSSOController;
use App\Http\Controllers\Auth\LogoutController;
use Illuminate\Support\Facades\Route;

Route::group(['as' => 'auth.', 'middleware' => ['guest']], function () {

    Route::get('/', [LoginController::class, 'login'])->name('login');
    Route::post('/', [LoginController::class, 'authenticate'])->name('authenticate');

    Route::get('/login-operation', [LoginSSOController::class, 'redirectToOperation'])->name('redirect.operation')
        ->withoutMiddleware(['guest'])
        ->middleware(['auth']);

    Route::get('/login-operation-to-erp', [LoginSSOController::class, 'redirectToErp'])
        ->withoutMiddleware(['guest'])
        ->name('redirect.erp');

    Route::get('/logout', [LogoutController::class, 'logout'])
        ->name('logout')
        ->withoutMiddleware(['guest'])
        ->middleware(['auth']);
});
