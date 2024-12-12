<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\Customer;
use App\Models\Finance\CustomerAccount;
use App\Models\Finance\CustomerAddress;
use App\Models\Finance\CustomerBank;
use App\Models\Finance\CustomerEmail;
use App\Models\Finance\CustomerSales;
use App\Models\Finance\CustomerVat;
use App\Models\Operation\Master\Carrier;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Operation\Master\CustomerType;
use App\Models\Operation\Master\Vendor;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

final class CustomerService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    public function getCustomers(): Collection
    {
        return Customer::orderBy('customer_name', 'asc')->get();
    }

    public function getCustomerById(string $id): object
    {
        $customer = Customer::where('id', $id)->first();

        return !empty($customer)
            ? ObjectResponse::success(message: __('crud.fetched', ['name' => 'Customer']), data: $customer)
            : ObjectResponse::error(message: __('crud.not_found', ['name' => 'Customer']));
    }

    public function createCustomer(array $dto): object
    {
        DB::beginTransaction();
        try {
            $customer = Customer::create([
                'customer_code' => $dto['customer_code'],
                'customer_name' => $dto['customer_name'],
                'eori_number' => $dto['eori_number'],
                'credit_terms' => $dto['credit_terms'],
                'overseas' => $dto['overseas'],
                'currency_id' => $dto['currency_id'],
                'credit_limit' => $dto['credit_limit'],
            ]);

            // Customer Type
            if (!empty($dto['customer_type'])) $this->storeDataBasedOnCustomerType(customerTypesDto: $dto['customer_type'], customerModel: $customer);

            // Customer Address
            if (!empty($dto['customer_address']['address_type'])) $this->syncCustomerAddress(customerAddress: $customer->customerAddress,customerAddressDto: $dto['customer_address']);

            // Customer VAT
            if (!empty($dto['customer_vat']['vat_number'])) $this->syncCustomerVat(customerVat: $customer->customerVat, customerVatDto: $dto['customer_vat']);

            // Customer Email
            if (!empty($dto['customer_email']['email'][0])) $this->syncCustomerEmail(customerEmailDto: $dto['customer_email']);

            // Customer Sales
            if (!empty($dto['customer_sales']['salesman'])) $this->syncCustomerSales(customerSales: $customer->customerSales, customerSalesDto: $dto['customer_sales']);

            // Customer Bank
            if (!empty($dto['customer_bank']['account_number'])) $this->syncCustomerBank(customerBank: $customer->customerBank, customerBankDto: $dto['customer_bank']);

            // Customer Account
            if (!empty($dto['customer_account']['chart_of_account_id'][0])) $this->syncCustomerAccount(customerAccountDto: $dto['customer_account']);

            DB::commit();

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Customer']),
                data: $customer
            );

        } catch (\Throwable $th) {
            DB::rollBack();

            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    public function updateCustomer(array $dto, string $id): object
    {
        try {
            //
        } catch (\Throwable $th) {
        //
        }
    }

    public function deleteCustomer(array $dto, string $id): object
    {
        try {
            //
        } catch (\Throwable $th) {
            //
        }
    }

    /**
     * Synchronizes the customer address information.
     *
     * @param ?CustomerAddress $customerAddress The existing customer address model, or null if it doesn't exist.
     * @param array $customerAddressDto The customer address data to be synchronized.
     * @return void
     */
    private function syncCustomerAddress(?CustomerAddress $customerAddress, array $customerAddressDto)
    {
        if (!empty($customerAddressDto['contact_informations']['contact_person_name'][0])) {
            $customerAddressDto['contact_informations'] = collect($customerAddressDto['contact_informations']['contact_person_name'])->map(function ($name, $index) use ($customerAddressDto) {
                return [
                    'contact_person_name' => $name,
                    'contact_person_number' => $customerAddressDto['contact_informations']['contact_person_number'][$index] ?? null,
                    'contact_person_email' => $customerAddressDto['contact_informations']['contact_person_email'][$index] ?? null,
                    'contact_person_address' => $customerAddressDto['contact_informations']['contact_person_address'][$index] ?? null
                ];
            });

            $customerAddressDto['contact_informations'] = json_encode($customerAddressDto['contact_informations']);
        }

        empty($customerAddress)
            ? CustomerAddress::create($customerAddressDto)
            : $customerAddress->update($customerAddressDto);
    }

    /**
     * Synchronizes the customer VAT information.
     *
     * @param ?CustomerVat $customerVat The existing customer VAT model, or null if it doesn't exist.
     * @param array $customerVatDto The customer VAT data to be synchronized.
     * @return void
     */
    private function syncCustomerVat(?CustomerVat $customerVat, array $customerVatDto)
    {
        empty($customerVat)
            ? CustomerVat::create($customerVatDto)
            : $customerVat->update($customerVatDto);
    }

    /**
     * Synchronizes the customer email information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @return void
     */
    private function syncCustomerEmail(array $customerEmailDto)
    {
        foreach ($customerEmailDto['email_id'] as $key => $emailId) {
            $customerEmailModel = CustomerEmail::where('id', $emailId)->first();

            empty($customerEmailModel)
                ? CustomerEmail::create(['email' => $customerEmailDto['email'][$key]])
                : $customerEmailModel->update(['email' => $customerEmailDto['email'][$key]]);
        }
    }

    /**
     * Synchronizes the customer sales information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @return void
     */
    private function syncCustomerSales(?CustomerSales $customerSales, array $customerSalesDto)
    {
        empty($customerSales)
            ? CustomerSales::create($customerSalesDto)
            : $customerSales->update($customerSalesDto);
    }

    /**
     * Synchronizes the customer bank information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @return void
     */
    private function syncCustomerBank(?CustomerBank $customerBank, array $customerBankDto)
    {
        empty($customerBank)
            ? CustomerBank::create($customerBankDto)
            : $customerBank->update($customerBankDto);
    }

    /**
     * Synchronizes the customer account information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @return void
     */
    private function syncCustomerAccount(array $customerAccountDto)
    {
        foreach ($customerAccountDto['chart_of_account_id'] as $key => $coaId) {
            $customerAccount = CustomerAccount::where('id', $customerAccountDto['customer_account_id'][$key])->first();

            empty($customerAccount)
                ? CustomerAccount::create([
                    'chart_of_account_id' => $coaId,
                    'currency_id' => $customerAccountDto['currency_id'][$key],
                    'lov_status' => $customerAccountDto['lov_status'][$key],
                    'notes' => $customerAccountDto['notes'][$key],
                ])
                : $customerAccount->update([
                    'chart_of_account_id' => $coaId,
                    'currency_id' => $customerAccountDto['currency_id'][$key],
                    'lov_status' => $customerAccountDto['lov_status'][$key],
                    'notes' => $customerAccountDto['notes'][$key],
                ]);
        }
    }

    public function storeDataBasedOnCustomerType(array $customerTypesDto, Customer $customerModel)
    {
        $customerTypeModel = CustomerType::whereIn('customer_type_name', $customerTypesDto)->get();
        foreach ($customerTypesDto as $key => $customerType) {
            $customerTypeId = $customerTypeModel[$key]->customer_type_id;
            if ($customerType == 'Billing Customer') {
                CustomerBilling::create([
                    'customer_code' => $customerModel->customer_code,
                    'customer_name' => $customerModel->customer_name,
                    'customer_type' => $customerTypeId,
                    'finance_customer_id' => $customerModel->id
                ]);
            } else if ($customerType == 'Carrier Agent') {
                Carrier::create([
                    'carrier_code' => $customerModel->customer_code,
                    'carrier_name' => $customerModel->customer_name,
                    'finance_customer_id' => $customerModel->id
                ]);
            } else {
                Vendor::create([
                    'vendor_code' => $customerModel->customer_code,
                    'vendor_name' => $customerModel->customer_name,
                    'vendor_type_id' => $customerTypeId,
                    'finance_customer_id' => $customerModel->id
                ]);
            }
        }
    }
}
