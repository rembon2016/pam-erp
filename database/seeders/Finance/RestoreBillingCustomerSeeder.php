<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use App\Constants\Customer\CustomerType;
use App\Models\Operation\Master\CustomerBilling;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Finance\Customer as FinanceCustomer;

final class RestoreBillingCustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $customerBilling = CustomerBilling::query()
            ->whereNull('finance_customer_id')
            ->where('status', '1')
            ->get();

        foreach ($customerBilling as $billingCustomer) {
            $customer = FinanceCustomer::firstOrCreate([
                'customer_code' => $billingCustomer->customer_code,
                'customer_name' => $billingCustomer->customer_name,
                'eori_number' => null,
                'credit_terms' => null,
                'credit_limit' => null,
                'overseas' => null,
                'currency_id' => null,
            ]);

            $billingCustomer->update(['finance_customer_id' => $customer->id]);
            $billingCustomerTypeName = $billingCustomer->customerTypeDetail?->customer_type_name ?? CustomerType::BILLING_CUSTOMER;
            $customer->customerTypes()->firstOrCreate([
                'name' => $billingCustomerTypeName
            ]);
        }
    }
}
