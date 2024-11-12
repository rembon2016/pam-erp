<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\MasterData\CurrencyController;
use App\Http\Controllers\MasterData\ServiceTypeController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\Settings\RolePermissionController;

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/reset-password', [ResetPasswordController::class, 'index'])->name('reset_password.index');
    Route::post('/reset-password', [ResetPasswordController::class, 'update'])->name('reset_password.update');


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

            // Export Route
            Route::get('/export/pdf', [ServiceTypeController::class, 'exportPdf'])->name('export.pdf');
            Route::get('/export/excel', [ServiceTypeController::class, 'exportExcel'])->name('export.excel');
            Route::get('/export/csv', [ServiceTypeController::class, 'exportCsv'])->name('export.csv');
        });

        Route::group([
            'prefix' => 'currency',
            'as' => 'currency.'
        ], function () {
            Route::get('/', [CurrencyController::class, 'index'])->name('index');
            Route::get('/list', [CurrencyController::class, 'list'])->name('list');
            Route::get('/create', [CurrencyController::class, 'create'])->name('create');
            Route::post('/', [CurrencyController::class, 'store'])->name('store');
            Route::get('/{id}/edit', [CurrencyController::class, 'edit'])->name('edit');
            Route::put('/{id}', [CurrencyController::class, 'update'])->name('update');
            Route::get('/{id}/delete', [CurrencyController::class, 'destroy'])->name('destroy');

            // Export Route
            Route::get('/export/pdf', [CurrencyController::class, 'exportPdf'])->name('export.pdf');
            Route::get('/export/excel', [CurrencyController::class, 'exportExcel'])->name('export.excel');
            Route::get('/export/csv', [CurrencyController::class, 'exportCsv'])->name('export.csv');
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

            // Export Route
            Route::get('/export/pdf', [RolePermissionController::class, 'exportPdf'])->name('export.pdf');
            Route::get('/export/excel', [RolePermissionController::class, 'exportExcel'])->name('export.excel');
            Route::get('/export/csv', [RolePermissionController::class, 'exportCsv'])->name('export.csv');
        });
    });
});
