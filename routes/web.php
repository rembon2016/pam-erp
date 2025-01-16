<?php

declare(strict_types=1);

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Finance\Billing\InvoiceController;
use App\Http\Controllers\Finance\Costing\CrossAirController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\AirExportController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\AirImportController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\CourierController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\SeaExportController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\SeaImportController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\TruckingController;
use App\Http\Controllers\Finance\Costing\DubaiBusiness\WarehouseController;
use App\Http\Controllers\Finance\Costing\SeaAirController;
use App\Http\Controllers\Finance\GeneralWise\Shipment\ShipmentController;
use App\Http\Controllers\Finance\MasterData\AgentContractController;
use App\Http\Controllers\Finance\MasterData\ChargeController;
use App\Http\Controllers\Finance\MasterData\ChartOfAccountController;
use App\Http\Controllers\Finance\MasterData\CountryController;
use App\Http\Controllers\Finance\MasterData\CurrencyController;
use App\Http\Controllers\Finance\MasterData\CustomerContractController;
use App\Http\Controllers\Finance\MasterData\CustomerController;
use App\Http\Controllers\Finance\MasterData\CustomerForBillingController;
use App\Http\Controllers\Finance\MasterData\DaybookController;
use App\Http\Controllers\Finance\MasterData\FixedAssetController;
use App\Http\Controllers\Finance\MasterData\PaymentMethodController;
use App\Http\Controllers\Finance\MasterData\PortController;
use App\Http\Controllers\Finance\MasterData\ServiceTypeController;
use App\Http\Controllers\Finance\MasterData\UnitController;
use App\Http\Controllers\Finance\Settings\RolePermissionController;
use App\Http\Controllers\Finance\Settings\UserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ResetPasswordController;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => ['auth']], function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/reset-password', [ResetPasswordController::class, 'index'])->name('reset_password.index');
    Route::post('/reset-password', [ResetPasswordController::class, 'update'])->name('reset_password.update');

    Route::group([
        'prefix' => 'finance',
        'as' => 'finance.',
    ], function () {
        Route::group([
            'prefix' => 'master-data',
            'as' => 'master-data.',
        ], function () {

            Route::group([
                'prefix' => 'customer',
                'as' => 'customer.',
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
                'as' => 'customer-contract.',
            ], function () {
                Route::get('/', [CustomerContractController::class, 'index'])->name('index');
                Route::get('/detail/{id}', [CustomerContractController::class, 'show'])->name('detail');
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

                // Document Route
                Route::delete('/document/{id}/delete', [CustomerContractController::class, 'deleteDocument'])->name('document.delete');
            });

            Route::group([
                'prefix' => 'agent-contract',
                'as' => 'agent-contract.',
            ], function () {
                Route::get('/', [AgentContractController::class, 'index'])->name('index');
                Route::get('/detail/{id}', [AgentContractController::class, 'show'])->name('detail');
                Route::get('/list', [AgentContractController::class, 'list'])->name('list');
                Route::get('/create', [AgentContractController::class, 'create'])->name('create');
                Route::post('/', [AgentContractController::class, 'store'])->name('store');
                Route::get('/{id}/edit', [AgentContractController::class, 'edit'])->name('edit');
                Route::put('/{id}', [AgentContractController::class, 'update'])->name('update');
                Route::get('/{id}/delete', [AgentContractController::class, 'destroy'])->name('destroy');

                // Export Route
                Route::get('/export/pdf', [AgentContractController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [AgentContractController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [AgentContractController::class, 'exportCsv'])->name('export.csv');

                // Document Route
                Route::delete('/document/{id}/delete', [AgentContractController::class, 'deleteDocument'])->name('document.delete');
            });

            Route::group([
                'prefix' => 'service-type',
                'as' => 'service-type.',
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
                'as' => 'currency.',
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
                'as' => 'customerforbilling.',
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
                'as' => 'fixed-asset.',
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
                'as' => 'chart-of-account.',
            ], function () {
                Route::get('/', [ChartOfAccountController::class, 'index'])->name('index');
                Route::get('/list', [ChartOfAccountController::class, 'list'])->name('list');
                Route::get('/create', [ChartOfAccountController::class, 'create'])->name('create');
                Route::post('/', [ChartOfAccountController::class, 'store'])->name('store');
                Route::get('/create/multiple', [ChartOfAccountController::class, 'createMultiple'])->name('create.multiple');
                Route::post('/multiple', [ChartOfAccountController::class, 'storeMultiple'])->name('store.multiple');
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
                'as' => 'charge.',
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
                'as' => 'unit.',
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
                'as' => 'payment-method.',
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
                'as' => 'country.',
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
                'as' => 'port.',
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
                'as' => 'daybook.',
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
            'as' => 'general-wise.',
        ], function () {
            Route::group([
                'prefix' => 'shipment',
                'as' => 'shipment.',
            ], function () {
                Route::get('/filter/origin', [ShipmentController::class, 'origin'])->name('origin');
                Route::get('/filter/destination', [ShipmentController::class, 'destination'])->name('destination');
                Route::get('/filter/vessel', [ShipmentController::class, 'vessel'])->name('vessel');
                Route::get('/filter/eta', [ShipmentController::class, 'etamerge'])->name('eta');
                Route::get('/filter/statusShipment', [ShipmentController::class, 'statusShipment'])->name('statusShipment');
                Route::get('/filter/carrier', [ShipmentController::class, 'carrier'])->name('carrier');
                Route::get('/filter/shipper', [ShipmentController::class, 'shipper'])->name('shipper');
                Route::get('/filter/consignee', [ShipmentController::class, 'consignee'])->name('consignee');
                Route::get('/list', [ShipmentController::class, 'list'])->name('list');
                Route::get('/{type}', [ShipmentController::class, 'index'])->name('index');
                Route::get('/{type}/{uuid}', [ShipmentController::class, 'detail'])->name('detail');
                Route::post('/api/download-documents', [ShipmentController::class, 'downloadDocuments'])->name('download-documents');
            });
        });

        Route::group([
            'prefix' => 'billing',
            'as' => 'billing.',
        ], function () {
            Route::group([
                'prefix' => 'invoice',
                'as' => 'invoice.',
            ], function () {
                Route::get('/', [InvoiceController::class, 'index'])->name('index');
                Route::get('/list', [InvoiceController::class, 'list'])->name('list');
                Route::get('/shipment/list', [InvoiceController::class, 'shipmentList'])->name('shipment.list');
                Route::get('/detail/{id}', [InvoiceController::class, 'detail'])->name('detail');
                Route::get('/form/not-linked-billing-customer', [InvoiceController::class, 'createNotLinked'])->name('create.not-linked-billing-customer');
                Route::post('/not-linked-billing-customer', [InvoiceController::class, 'storeNotLinked'])->name('store.not-linked-billing-customer');
                Route::get('/form/linked-billing-customer', [InvoiceController::class, 'createLinked'])->name('create.linked-billing-customer');
                Route::get('/generate', [InvoiceController::class, 'viewGenerate'])->name('generate');
                Route::post('/generate', [InvoiceController::class, 'storeGenerate'])->name('generate');

                Route::get('/approve/{id}', [InvoiceController::class, 'approve'])->name('approve');
                Route::get('/cancel/{id}', [InvoiceController::class, 'cancel'])->name('cancel');

                // Export Route
                Route::get('/export/pdf', [InvoiceController::class, 'exportPdf'])->name('export.pdf');
                Route::get('/export/excel', [InvoiceController::class, 'exportExcel'])->name('export.excel');
                Route::get('/export/csv', [InvoiceController::class, 'exportCsv'])->name('export.csv');
            });
        });

        Route::group([
            'prefix' => 'costing',
            'as' => 'costing.',
        ], function () {
            Route::group([
                'prefix' => 'sea-air',
                'as' => 'sea-air.',
            ], function () {
                Route::get('/', [SeaAirController::class, 'index'])->name('index');
                Route::get('/port', [SeaAirController::class, 'port'])->name('port');
                Route::get('/contractbl/{id}/{bl_number}/{type}', [SeaAirController::class, 'contractbl'])->name('contractbl');
                Route::get('/contractmawb/{id}/{bl_number}/{type}', [SeaAirController::class, 'contractmawb'])->name('contractmawb');
                Route::get('/contractlp/{id}/{loading_id}', [SeaAirController::class, 'contractlp'])->name('contractlp');
                Route::get('/contractlpdxb/{id}/{loading_id}', [SeaAirController::class, 'contractlpdxb'])->name('contractlpdxb');
                Route::get('/list', [SeaAirController::class, 'list'])->name('list');
                Route::post('/store', [SeaAirController::class, 'store'])->name('store');
                Route::get('/status/{id}/{status}', [SeaAirController::class, 'status'])->name('status');
                Route::put('/update/{id}', [SeaAirController::class, 'update'])->name('update');
                Route::get('/show/{id}', [SeaAirController::class, 'show'])->name('show');
                Route::get('/cost/{id}', [SeaAirController::class, 'cost'])->name('cost');
                Route::get('/export/csv', [SeaAirController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'cross-air',
                'as' => 'cross-air.',
            ], function () {

                Route::get('/', [CrossAirController::class, 'index'])->name('index');
                Route::get('/port', [CrossAirController::class, 'port'])->name('port');
                Route::get('/contractmawb/{id}/{bl_number}/{type}', [CrossAirController::class, 'contractmawb'])->name('contractmawb');
                Route::get('/contractlpdxb/{id}/{loading_id}', [CrossAirController::class, 'contractlpdxb'])->name('contractlpdxb');
                Route::get('/list', [CrossAirController::class, 'list'])->name('list');
                Route::post('/store', [CrossAirController::class, 'store'])->name('store');
                Route::get('/status/{id}/{status}', [CrossAirController::class, 'status'])->name('status');
                Route::put('/update/{id}', [CrossAirController::class, 'update'])->name('update');
                Route::get('/show/{id}', [CrossAirController::class, 'show'])->name('show');
                Route::get('/cost/{id}', [CrossAirController::class, 'cost'])->name('cost');
                Route::get('/export/csv', [CrossAirController::class, 'exportCsv'])->name('export.csv');
            });

            Route::group([
                'prefix' => 'dubai-business',
                'as' => 'dubai-business.',
            ], function () {
                Route::group([
                    'prefix' => 'sea-import',
                    'as' => 'sea-import.',
                ], function () {
                    Route::get('/', [SeaImportController::class, 'index'])->name('index');
                    Route::get('/list', [SeaImportController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [SeaImportController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [SeaImportController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [SeaImportController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'sea-export',
                    'as' => 'sea-export.',
                ], function () {
                    Route::get('/', [SeaExportController::class, 'index'])->name('index');
                    Route::get('/list', [SeaExportController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [SeaExportController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [SeaExportController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [SeaExportController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'air-import',
                    'as' => 'air-import.',
                ], function () {
                    Route::get('/', [AirImportController::class, 'index'])->name('index');
                    Route::get('/list', [AirImportController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [AirImportController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [AirImportController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [AirImportController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'air-export',
                    'as' => 'air-export.',
                ], function () {
                    Route::get('/', [AirExportController::class, 'index'])->name('index');
                    Route::get('/list', [AirExportController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [AirExportController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [AirExportController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [AirExportController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'warehouse',
                    'as' => 'warehouse.',
                ], function () {
                    Route::get('/', [WarehouseController::class, 'index'])->name('index');
                    Route::get('/list', [WarehouseController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [WarehouseController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [WarehouseController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [WarehouseController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'trucking',
                    'as' => 'trucking.',
                ], function () {
                    Route::get('/', [TruckingController::class, 'index'])->name('index');
                    Route::get('/list', [TruckingController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [TruckingController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [TruckingController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [TruckingController::class, 'exportCsv'])->name('export.csv');
                });

                Route::group([
                    'prefix' => 'courier',
                    'as' => 'courier.',
                ], function () {
                    Route::get('/', [CourierController::class, 'index'])->name('index');
                    Route::get('/list', [CourierController::class, 'list'])->name('list');
                    Route::get('/show/{id}', [CourierController::class, 'show'])->name('show');
                    Route::get('/cost/{id}', [CourierController::class, 'cost'])->name('cost');
                    Route::get('/export/csv', [CourierController::class, 'exportCsv'])->name('export.csv');
                });
            });
        });
    });

    Route::group([
        'prefix' => 'settings',
        'as' => 'settings.',
    ], function () {
        Route::group([
            'prefix' => 'role-permission',
            'as' => 'role-permission.',
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

        Route::group([
            'prefix' => 'user',
            'as' => 'user.',
        ], function () {
            Route::get('/', [UserController::class, 'index'])->name('index');
            Route::get('/list', [UserController::class, 'list'])->name('list');
            Route::get('/create', [UserController::class, 'create'])->name('create');
            Route::post('/', [UserController::class, 'store'])->name('store');
            Route::get('/{id}/edit', [UserController::class, 'edit'])->name('edit');
            Route::put('/{id}', [UserController::class, 'update'])->name('update');
            Route::get('/{id}/delete', [UserController::class, 'destroy'])->name('destroy');

            // Export Route
            Route::get('/export/csv', [UserController::class, 'exportCsv'])->name('export.csv');
        });
    });
});
