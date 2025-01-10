<?php

declare(strict_types=1);

use App\Http\Controllers\Api\Finance\Billing\ApiInvoiceController;
use App\Http\Controllers\Api\Finance\GeneralWise\ApiGeneralWiseController;
use App\Http\Controllers\Api\Finance\MasterData\ApiChargeController;
use App\Http\Controllers\Api\Finance\MasterData\ApiCustomerController;
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
        // Customer Route
        Route::group([
            'prefix' => 'customer',
            'as' => 'customer.',
        ], function () {
            Route::get('/', [ApiCustomerController::class, 'getCustomers'])->name('list');
            Route::get('/billing-customer', [ApiCustomerController::class, 'getBillingCustomers'])->name('billing.list');
        });

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
            // Route::get('/')
        });

    });
});
