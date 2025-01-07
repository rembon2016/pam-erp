<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use App\Constants\Customer\CustomerType as CustomerTypeConstants;
use App\Models\Finance\Customer as FinanceCustomer;
use App\Models\Operation\Master\Carrier;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Operation\Master\Vendor;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

final class RecoverCustomerSeeder extends Seeder
{
    /**
     * An array of record status values that should be ignored.
     *
     * @var array
     */
    protected $ignoredRecordStatus = ['2', '3'];

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $billingCustomers = CustomerBilling::whereNotIn('status', $this->ignoredRecordStatus)->get();
        $vendors = Vendor::whereNotIn('status', $this->ignoredRecordStatus)->get();
        $carriers = Carrier::whereNotIn('status', $this->ignoredRecordStatus)->get();

        $this->createFinanceCustomerFromBillingCustomer(billingCustomerCollection: $billingCustomers);
        $this->createFinanceCustomerFromVendor(vendorCollection: $vendors);
        $this->createFinanceCustomerFromCarrier(carrierCollection: $carriers);
    }

    private function createFinanceCustomerFromBillingCustomer(Collection $billingCustomerCollection)
    {
        DB::beginTransaction();
        try {
            foreach ($billingCustomerCollection as $billingCustomer) {
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
                $billingCustomerTypeName = $billingCustomer->customerTypeDetail?->customer_type_name;
                $customer->customerTypes()->firstOrCreate([
                    'name' => $billingCustomerTypeName,
                ]);

                DB::commit();
            }
        } catch (\Throwable $th) {
            dd($th);
            DB::rollBack();
        }
    }

    private function createFinanceCustomerFromVendor(Collection $vendorCollection)
    {
        DB::beginTransaction();
        try {
            foreach ($vendorCollection as $vendor) {
                $customer = FinanceCustomer::firstOrCreate([
                    'customer_code' => $vendor->vendor_code,
                    'customer_name' => $vendor->vendor_name,
                    'eori_number' => null,
                    'credit_terms' => null,
                    'credit_limit' => null,
                    'overseas' => null,
                    'currency_id' => null,
                ]);

                $vendor->update(['finance_customer_id' => $customer->id]);
                $vendorTypeName = $vendor->customerTypeDetail?->customer_type_name;
                $customer->customerTypes()->firstOrCreate([
                    'name' => $vendorTypeName,
                ]);

                DB::commit();
            }
        } catch (\Throwable $th) {
            dd($th);
            DB::rollBack();
        }
    }

    private function createFinanceCustomerFromCarrier(Collection $carrierCollection)
    {
        DB::beginTransaction();
        try {
            foreach ($carrierCollection as $carrier) {
                $customer = FinanceCustomer::firstOrCreate([
                    'customer_code' => $carrier->vendor_code,
                    'customer_name' => $carrier->carrier_name,
                    'eori_number' => null,
                    'credit_terms' => null,
                    'credit_limit' => null,
                    'overseas' => null,
                    'currency_id' => null,
                ]);

                $carrier->update(['finance_customer_id' => $customer->id]);
                $customer->customerTypes()->firstOrCreate([
                    'name' => CustomerTypeConstants::CARRIER_AGENT,
                ]);

                DB::commit();
            }
        } catch (\Throwable $th) {
            dd($th);
            DB::rollBack();
        }
    }
}
