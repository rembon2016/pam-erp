<?php

declare(strict_types=1);

use App\Http\Controllers\Api\Finance\MasterData\ApiChargeController;
use App\Http\Controllers\Api\Finance\MasterData\ApiPortController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn () => 'Api @v1')->name('index');

Route::group([
    'prefix' => 'finance',
    'as' => 'finance.',
], function () {
    Route::group([
        'prefix' => 'master-data',
        'as' => 'master-data.',
    ], function () {
        // Port Route
        Route::group([
            'prefix' => 'port',
            'as' => 'port.',
        ], function () {
            Route::get('/', [ApiPortController::class, 'list'])->name('list');
        });

        // Charge Route
        Route::group([
            'prefix' => 'charge',
            'as' => 'charge.',
        ], function () {
            Route::get('/', [ApiChargeController::class, 'list'])->name('list');
            Route::get('/{id}', [ApiChargeController::class, 'show'])->name('show');
        });
    });
});
