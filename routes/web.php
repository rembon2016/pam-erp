<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\MasterData\ServiceTypeController;
use App\Http\Controllers\Settings\RolePermissionController;

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');


    Route::group([
        'prefix' => 'master-data',
        'as' => 'master-data.'
    ], function () {
        Route::group([
            'prefix' => 'service-type',
            'as' => 'service-type.'
        ], function () {
            Route::get('/', [ServiceTypeController::class, 'index'])->name('index');
            Route::get('/list', [ServiceTypeController::class, 'list'])->name('list');
            Route::get('/create', [ServiceTypeController::class, 'create'])->name('create');
            Route::post('/', [ServiceTypeController::class, 'store'])->name('store');
            Route::get('/{id}/edit', [ServiceTypeController::class, 'edit'])->name('edit');
            Route::put('/{id}', [ServiceTypeController::class, 'update'])->name('update');
            Route::get('/{id}/delete', [ServiceTypeController::class, 'destroy'])->name('destroy');
        });
    });

    Route::group([
        'prefix' => 'settings',
        'as' => 'settings.'
    ], function () {
        Route::group([
            'prefix' => 'role-permission',
            'as' => 'role-permission.'
        ], function () {
            Route::get('/', [RolePermissionController::class, 'index'])->name('index');
            Route::get('/list', [RolePermissionController::class, 'list'])->name('list');
            Route::get('/create', [RolePermissionController::class, 'create'])->name('create');
            Route::post('/', [RolePermissionController::class, 'store'])->name('store');
            Route::get('/{id}/edit', [RolePermissionController::class, 'edit'])->name('edit');
            Route::put('/{id}', [RolePermissionController::class, 'update'])->name('update');
            Route::get('/{id}/delete', [RolePermissionController::class, 'destroy'])->name('destroy');
        });
    });
});
