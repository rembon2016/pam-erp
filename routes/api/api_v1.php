<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Finance\Costing\ApiSeaAirController;
use App\Http\Controllers\Api\Finance\Billing\ApiInvoiceController;
use App\Http\Controllers\Api\Finance\MasterData\ApiPortController;
use App\Http\Controllers\Api\Finance\Costing\ApiCrossAirController;
use App\Http\Controllers\Api\Finance\Costing\DubaiBusiness\ApiAirExportController;
use App\Http\Controllers\Api\Finance\Costing\DubaiBusiness\ApiAirImportController;
use App\Http\Controllers\Api\Finance\Costing\DubaiBusiness\ApiSeaExportController;
use App\Http\Controllers\Api\Finance\Costing\DubaiBusiness\ApiSeaImportController;
use App\Http\Controllers\Api\Finance\MasterData\ApiChargeController;
use App\Http\Controllers\Api\Finance\MasterData\ApiCountryController;
use App\Http\Controllers\Api\Finance\MasterData\ApiCustomerController;
use App\Http\Controllers\Api\Finance\GeneralWise\ApiGeneralWiseController;

Route::get('/', fn () => 'Api @v1')->name('index');

Route::group([
    'prefix' => 'finance',
    'as' => 'finance.',
], function () {
    Route::group([
        'prefix' => 'master-data',
        'as' => 'master-data.',
    ], function () {
        // Customer Route
        Route::group([
            'prefix' => 'customer',
            'as' => 'customer.',
        ], function () {
            Route::get('/', [ApiCustomerController::class, 'getCustomers'])->name('list');
            Route::get('/billing-customer', [ApiCustomerController::class, 'getBillingCustomers'])->name('billing.list');

            // Filters
            Route::get('/customer-filter', [ApiCustomerController::class, 'getCustomerForFilters'])->name('filter-data');
        });

        // Port Route
        Route::group([
            'prefix' => 'port',
            'as' => 'port.',
        ], function () {
            Route::get('/', [ApiPortController::class, 'list'])->name('list');
            Route::get('/{column}/get', [ApiPortController::class, 'getPortFilterData'])->name('data_filter');
        });

        // Port Route
        Route::group([
            'prefix' => 'country',
            'as' => 'country.',
        ], function () {
            Route::get('/', [ApiCountryController::class, 'list'])->name('list');
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

    Route::group([
        'prefix' => 'general-wise',
        'as' => 'general-wise.',
    ], function () {
        Route::get('/vessel', [ApiGeneralWiseController::class, 'vessel'])->name('vessel');
        Route::get('/voyage', [ApiGeneralWiseController::class, 'voyage'])->name('voyage');
        Route::get('/origin', [ApiGeneralWiseController::class, 'origin'])->name('origin');
    });

    Route::group([
        'prefix' => 'billing',
        'as' => 'billing.',
    ], function () {

        Route::group([
            'prefix' => 'invoice',
            'as' => 'invoice.',
        ], function () {
            Route::get('/not-linked-list', [ApiInvoiceController::class, 'notLinkedList'])->name('not_linked_list');
            Route::get('/linked-list', [ApiInvoiceController::class, 'linkedList'])->name('linked_list');
        });

    });

    Route::group([
        'prefix' => 'costing',
        'as' => 'costing.'
    ], function () {

        Route::group([
            'prefix' => 'sea-air',
            'as' => 'sea_air.'
        ], function () {
            Route::get('/{column}/get', [ApiSeaAirController::class, 'getSeaData'])->name('data_filter');
            Route::get('/{vesselId}/get-voyage', [ApiSeaAirController::class, 'getVoyageByVessel'])->name('voyage');
        });

        Route::group([
            'prefix' => 'cross-air',
            'as' => 'cross_air.'
        ], function () {
            Route::get('/{column}/get', [ApiCrossAirController::class, 'getAirData'])->name('data_filter');
        });

        Route::group([
            'prefix' => 'dubai-business',
            'as' => 'dubai_business.'
        ], function () {

            // Sea Import
            Route::group([
                'prefix' => 'sea-import',
                'as' => 'sea_import.'
            ], function () {
                Route::get('/{column}/get', [ApiSeaImportController::class, 'getSeaData'])->name('data_filter');
                Route::get('/{vesselId}/get-voyage', [ApiSeaImportController::class, 'getVoyageByVessel'])->name('voyage');
            });

            // Sea Export
            Route::group([
                'prefix' => 'sea-export',
                'as' => 'sea_export.'
            ], function () {
                Route::get('/{column}/get', [ApiSeaExportController::class, 'getSeaData'])->name('data_filter');
                Route::get('/{vesselId}/get-voyage', [ApiSeaExportController::class, 'getVoyageByVessel'])->name('voyage');
            });

            // Air Import
            Route::group([
                'prefix' => 'air-import',
                'as' => 'air_import.'
            ], function () {
                Route::get('/{column}/get', [ApiAirImportController::class, 'getAirData'])->name('data_filter');
            });

            // Air Export
            Route::group([
                'prefix' => 'air-export',
                'as' => 'air_export.'
            ], function () {
                Route::get('/{column}/get', [ApiAirExportController::class, 'getAirData'])->name('data_filter');
            });

        });

    });
});
