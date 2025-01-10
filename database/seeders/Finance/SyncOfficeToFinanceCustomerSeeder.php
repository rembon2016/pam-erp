<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use App\Constants\Customer\CustomerType;
use Illuminate\Database\Schema\Blueprint;
use App\Models\Finance\Customer as FinanceCustomer;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class SyncOfficeToFinanceCustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Schema::whenTableDoesntHaveColumn(
            table: 'master.offices',
            column: 'finance_customer_id',
            callback: function (Blueprint $table): void {
                $table->foreignUuid('finance_customer_id')
                    ->nullable()
                    ->references('id')
                    ->on('finance.customer')
                    ->nullOnDelete();
            }
        );

        $offices = \App\Models\Operation\Master\Office::query()
            ->where('status', '1')
            ->get();

        foreach ($offices as $office) {
            $customer = FinanceCustomer::firstOrCreate([
                'customer_code' => $office->office_code ?? null,
                'customer_name' => $office->office_name,
                'eori_number' => null,
                'credit_terms' => null,
                'credit_limit' => null,
                'overseas' => null,
                'currency_id' => null,
            ]);

            $office->update(['finance_customer_id' => $customer->id]);
            $customer->customerTypes()->firstOrCreate([
                'name' => CustomerType::OFFICE,
            ]);
        }
    }
}
