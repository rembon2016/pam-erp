<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use App\Models\Operation\Master\Carrier;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Operation\Master\Vendor;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;

final class SyncColumnDataFromCustomer extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Schema::whenTableDoesntHaveColumn(
            table: 'finance.customer',
            column: 'data_from',
            callback: function (Blueprint $table): void {
                $table->enum('data_from', ['erp', 'operation'])
                    ->nullable()
                    ->default('erp');
            }
        );

        CustomerBilling::query()
            ->where('status', '1')
            ->each(function ($billingCustomer): void {
                $billingCustomer->financeCustomer()->update([
                    'data_from' => 'operation',
                ]);
            });

        Vendor::query()
            ->where('status', '1')
            ->each(function ($vendorCustomer): void {
                $vendorCustomer->financeCustomer()->update([
                    'data_from' => 'operation',
                ]);
            });

        Carrier::query()
            ->where('status', '1')
            ->each(function ($carrierCustomer): void {
                $carrierCustomer->financeCustomer()->update([
                    'data_from' => 'operation',
                ]);
            });
    }
}
