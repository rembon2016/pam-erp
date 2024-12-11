<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Controllers\Finance\MasterData\PortController;
use App\Http\Controllers\Finance\MasterData\UnitController;
use App\Http\Controllers\Finance\MasterData\ChargeController;
use App\Http\Controllers\Finance\MasterData\CountryController;
use App\Http\Controllers\Finance\MasterData\DaybookController;
use App\Http\Controllers\Finance\MasterData\CurrencyController;
use App\Http\Controllers\Finance\MasterData\CustomerController;
use App\Http\Controllers\Finance\MasterData\FixedAssetController;
use App\Http\Controllers\Finance\MasterData\ServiceTypeController;
use App\Http\Controllers\Finance\Settings\RolePermissionController;
use App\Http\Controllers\Finance\MasterData\PaymentMethodController;
use App\Http\Controllers\Finance\MasterData\ChartOfAccountController;
use App\Http\Controllers\Finance\MasterData\CustomerContractController;
use App\Http\Controllers\Finance\MasterData\CustomerForBillingController;
use App\Http\Controllers\Finance\GeneralWise\Shipment\ShipmentController;

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/reset-password', [ResetPasswordController::class, 'index'])->name('reset_password.index');
    Route::post('/reset-password', [ResetPasswordController::class, 'update'])->name('reset_password.update');


    Route::group([
        'prefix' => 'finance',
        'as' => 'finance.'
    ], function () {
        Route::group([
            'prefix' => 'master-data',
            'as' => 'master-data.'
        ], function () {

            Route::group([
                'prefix' => 'customer',
                'as' => 'customer.'
            ], function () {
                Route::get('/', [CustomerController::class, 'index'])->name('index');
                Route::get('/list', [CustomerController::class, 'list'])->name('list');
                Route::get('/create', [CustomerController::class, 'create'])->name('create');
                Route::post('/', [CustomerController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [CustomerController::class, 'edit'])->name('edit');
                Route::put('/{id}', [CustomerController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [CustomerController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [CustomerController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [CustomerController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [CustomerController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'customer-contract',
                'as' => 'customer-contract.'
            ], function () {
                Route::get('/', [CustomerContractController::class, 'index'])->name('index');
                Route::get('/list', [CustomerContractController::class, 'list'])->name('list');
                Route::get('/create', [CustomerContractController::class, 'create'])->name('create');
                Route::post('/', [CustomerContractController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [CustomerContractController::class, 'edit'])->name('edit');
                Route::put('/{id}', [CustomerContractController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [CustomerContractController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [CustomerContractController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [CustomerContractController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [CustomerContractController::class, 'exportCsv'])->name('export.csv');
            });

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

            Route::group([
                'prefix' => 'customer-for-billing',
                'as' => 'customerforbilling.'
            ], function () {
                Route::get('/export/csv', [CustomerForBillingController::class, 'exportCsv'])->name('export.csv');

                Route::get('/', [CustomerForBillingController::class, 'index'])->name('index');
                Route::get('/list', [CustomerForBillingController::class, 'list'])->name('list');
                Route::get('/create', [CustomerForBillingController::class, 'create'])->name('create');
                Route::post('/', [CustomerForBillingController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [CustomerForBillingController::class, 'edit'])->name('edit');
                Route::put('/{id}', [CustomerForBillingController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [CustomerForBillingController::class, 'destroy'])->name('destroy');

                // // Export Route
                // Route::get('/export/pdf', [CurrencyController::class, 'exportPdf'])->name('export.pdf');
                // Route::get('/export/excel', [CurrencyController::class, 'exportExcel'])->name('export.excel');

            });

            Route::group([
                'prefix' => 'fixed-asset',
                'as' => 'fixed-asset.'
            ], function () {
                Route::get('/', [FixedAssetController::class, 'index'])->name('index');
                Route::get('/list', [FixedAssetController::class, 'list'])->name('list');
                Route::get('/create', [FixedAssetController::class, 'create'])->name('create');
                Route::post('/', [FixedAssetController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [FixedAssetController::class, 'edit'])->name('edit');
                Route::put('/{id}', [FixedAssetController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [FixedAssetController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [FixedAssetController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [FixedAssetController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [FixedAssetController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'chart-of-account',
                'as' => 'chart-of-account.'
            ], function () {
                Route::get('/', [ChartOfAccountController::class, 'index'])->name('index');
                Route::get('/list', [ChartOfAccountController::class, 'list'])->name('list');
                Route::get('/create', [ChartOfAccountController::class, 'create'])->name('create');
                Route::post('/', [ChartOfAccountController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [ChartOfAccountController::class, 'edit'])->name('edit');
                Route::put('/{id}', [ChartOfAccountController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [ChartOfAccountController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [ChartOfAccountController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [ChartOfAccountController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [ChartOfAccountController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'charge',
                'as' => 'charge.'
            ], function () {
                Route::get('/', [ChargeController::class, 'index'])->name('index');
                Route::get('/list', [ChargeController::class, 'list'])->name('list');
                Route::get('/create', [ChargeController::class, 'create'])->name('create');
                Route::post('/', [ChargeController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [ChargeController::class, 'edit'])->name('edit');
                Route::put('/{id}', [ChargeController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [ChargeController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [ChargeController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [ChargeController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [ChargeController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'unit',
                'as' => 'unit.'
            ], function () {
                Route::get('/', [UnitController::class, 'index'])->name('index');
                Route::get('/list', [UnitController::class, 'list'])->name('list');
                Route::get('/create', [UnitController::class, 'create'])->name('create');
                Route::post('/', [UnitController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [UnitController::class, 'edit'])->name('edit');
                Route::put('/{id}', [UnitController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [UnitController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [UnitController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [UnitController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [UnitController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'payment-method',
                'as' => 'payment-method.'
            ], function () {
                Route::get('/', [PaymentMethodController::class, 'index'])->name('index');
                Route::get('/list', [PaymentMethodController::class, 'list'])->name('list');
                Route::get('/create', [PaymentMethodController::class, 'create'])->name('create');
                Route::post('/', [PaymentMethodController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [PaymentMethodController::class, 'edit'])->name('edit');
                Route::put('/{id}', [PaymentMethodController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [PaymentMethodController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [PaymentMethodController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [PaymentMethodController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [PaymentMethodController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'country',
                'as' => 'country.'
            ], function () {
                Route::get('/', [CountryController::class, 'index'])->name('index');
                Route::get('/list', [CountryController::class, 'list'])->name('list');
                Route::get('/create', [CountryController::class, 'create'])->name('create');
                Route::post('/', [CountryController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [CountryController::class, 'edit'])->name('edit');
                Route::put('/{id}', [CountryController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [CountryController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [CountryController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [CountryController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [CountryController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'port',
                'as' => 'port.'
            ], function () {
                Route::get('/', [PortController::class, 'index'])->name('index');
                Route::get('/list', [PortController::class, 'list'])->name('list');
                Route::get('/create', [PortController::class, 'create'])->name('create');
                Route::post('/', [PortController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [PortController::class, 'edit'])->name('edit');
                Route::put('/{id}', [PortController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [PortController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [PortController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [PortController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [PortController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'daybook',
                'as' => 'daybook.'
            ], function () {
                Route::get('/', [DaybookController::class, 'index'])->name('index');
                Route::get('/list', [DaybookController::class, 'list'])->name('list');
                Route::get('/create', [DaybookController::class, 'create'])->name('create');
                Route::post('/', [DaybookController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [DaybookController::class, 'edit'])->name('edit');
                Route::put('/{id}', [DaybookController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [DaybookController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [DaybookController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [DaybookController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [DaybookController::class, 'exportCsv'])->name('export.csv');
            });
        });

        Route::group([
            'prefix' => 'general-wise',
            'as' => 'general-wise.'
        ], function () {
            Route::group([
                'prefix' => 'shipment',
                'as' => 'shipment.'
            ], function () {
                Route::get('/filter/origin', [ShipmentController::class, 'origin'])->name('origin');
                Route::get('/filter/destination', [ShipmentController::class, 'destination'])->name('destination');
                Route::get('/filter/vessel', [ShipmentController::class, 'vessel'])->name('vessel');
                Route::get('/filter/eta', [ShipmentController::class, 'etamerge'])->name('eta');
                Route::get('/list', [ShipmentController::class, 'list'])->name('list');
                Route::get('/{type}', [ShipmentController::class, 'index'])->name('index');

            });
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
