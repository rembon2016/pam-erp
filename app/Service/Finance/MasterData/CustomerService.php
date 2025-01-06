<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Support\Str;
use App\Models\Finance\Customer;
use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\DB;
use App\Models\Finance\CustomerVat;
use App\Models\Finance\CustomerBank;
use Illuminate\Support\Facades\Auth;
use App\Models\Finance\CustomerEmail;
use App\Models\Finance\CustomerSales;
use App\Models\Finance\CustomerAccount;
use App\Models\Finance\CustomerAddress;
use App\Models\Operation\Master\Vendor;
use App\Models\Operation\Master\Carrier;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Operation\Master\CustomerType;
use App\Models\Operation\Master\CustomerBilling;
use App\Models\Finance\CustomerType as FinanceCustomerType;
use Illuminate\Support\Facades\Cache;

final class CustomerService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Get all customers ordered by customer name in ascending order.
     *
     * @param array $filters
     *
     * @return \Illuminate\Database\Eloquent\Builder A collection of all customers.
     */
    public function getCustomers($filters = []): Builder
    {
        $customer = Customer::query()
            ->when(!empty($filters['customer_name']), fn ($query)
                => $query->where('customer_name',$filters['customer_name']))
            ->when(!empty($filters['customer_type_name']), fn ($query)
                => $query->whereHas('customerTypes', fn ($q) => $q->whereIn('name', $filters['customer_type_name'])))
            ->orderBy('customer_name', 'asc');

        return $customer;
    }

    /**
     * Get Billing Customers Collections
     *
     * @param array $columns = []
     *
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getBillingCustomers(array $columns = []): Collection
    {
        return Cache::remember('biling-customers-select2', 60 * 5, function () use ($columns) {
            return CustomerBilling::query()
                ->when(empty($columns), function ($query) {
                    return $query->select('customer_id', 'customer_code', 'customer_name', 'status');
                })
                ->when(!empty($columns), function ($query) use ($columns) {
                    return $query->select($columns);
                })
                ->where('status', 1)
                ->get();
        });
    }

    /**
     * Get the customer by id.
     *
     * @param string $id The ID of the customer.
     * @return object The customer object.
     */
    public function getCustomerById(string $id): object
    {
        $customer = Customer::where('id', $id)->first();

        return !empty($customer)
            ? ObjectResponse::success(message: __('crud.fetched', ['name' => 'Customer']), data: $customer)
            : ObjectResponse::error(message: __('crud.not_found', ['name' => 'Customer']));
    }

    /**
     * Create a new customer.
     *
     * @param array $dto An array of customer data.
     * @return object The created customer object.
     */
    public function createCustomer(array $dto): object
    {
        DB::beginTransaction();
        try {
            $customer_code_query = DB::select("SELECT finance.customer_code_finance()");
            $customer_code = count($customer_code_query) > 0 ? $customer_code_query[0]->customer_code_finance : NULL;

            $customer = Customer::create([
                'customer_name' => $dto['customer_name'],
                'customer_code' => $customer_code,
                'eori_number' => $dto['eori_number'],
                'credit_terms' => $dto['credit_terms'],
                'overseas' => $dto['overseas'],
                'currency_id' => $dto['currency_id'],
                'credit_limit' => $dto['credit_limit'],
            ]);

            // Customer Type
            $this->storeDataBasedOnCustomerType(customerTypesDto: $dto['customer_type'], customerModel: $customer);

            // Customer Address
            if (!empty($dto['customer_address']['address_type'])) $this->syncCustomerAddress(customerAddress: $customer->customerAddress,customerAddressDto: $dto['customer_address'], customerId: $customer->id);

            // Customer VAT
            if (!empty($dto['customer_vat']['vat_number'])) $this->syncCustomerVat(customerVat: $customer->customerVat, customerVatDto: $dto['customer_vat'], customerId: $customer->id);

            // Customer Email
            if (!empty($dto['customer_email']['email'][0])) $this->syncCustomerEmail(customerEmailDto: $dto['customer_email'], customerId: $customer->id);

            // Customer Sales
            if (!empty($dto['customer_sales']['salesman'])) $this->syncCustomerSales(customerSales: $customer->customerSales, customerSalesDto: $dto['customer_sales'], customerId: $customer->id);

            // Customer Bank
            if (!empty($dto['customer_bank']['account_number'])) $this->syncCustomerBank(customerBank: $customer->customerBank, customerBankDto: $dto['customer_bank'], customerId: $customer->id);

            // Customer Account
            if (!empty($dto['customer_account']['chart_of_account_id'][0])) $this->syncCustomerAccount(customerAccountDto: $dto['customer_account'], customerId: $customer->id);

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

    /**
     * Updates an existing customer in the system.
     *
     * @param array $dto An associative array containing the updated customer data.
     * @param string $id The ID of the customer to be updated.
     * @return object The updated customer object.
     */
    public function updateCustomer(array $dto, string $id): object
    {
        DB::beginTransaction();
        try {
            $customer = Customer::findOrFail($id);

            $customer->update([
                'customer_name' => $dto['customer_name'],
                'eori_number' => $dto['eori_number'],
                'credit_terms' => $dto['credit_terms'],
                'overseas' => $dto['overseas'],
                'currency_id' => $dto['currency_id'],
                'credit_limit' => $dto['credit_limit'],
            ]);

            // Customer Type
            $this->storeDataBasedOnCustomerType(customerTypesDto: $dto['customer_type'], customerModel: $customer);

            // Customer Address
            if (!empty($dto['customer_address']['address_type'])) $this->syncCustomerAddress(customerAddress: $customer->customerAddress,customerAddressDto: $dto['customer_address'], customerId: $customer->id);

            // Customer VAT
            if (!empty($dto['customer_vat']['vat_number'])) $this->syncCustomerVat(customerVat: $customer->customerVat, customerVatDto: $dto['customer_vat'], customerId: $customer->id);

            // Customer Email
            if (!empty($dto['customer_email']['email'][0])) $this->syncCustomerEmail(customerEmailDto: $dto['customer_email'], customerId: $customer->id);

            // Customer Sales
            if (!empty($dto['customer_sales']['salesman'])) $this->syncCustomerSales(customerSales: $customer->customerSales, customerSalesDto: $dto['customer_sales'], customerId: $customer->id);

            // Customer Bank
            if (!empty($dto['customer_bank']['account_number'])) $this->syncCustomerBank(customerBank: $customer->customerBank, customerBankDto: $dto['customer_bank'], customerId: $customer->id);

            // Customer Account
            if (!empty($dto['customer_account']['chart_of_account_id'][0])) $this->syncCustomerAccount(customerAccountDto: $dto['customer_account'], customerId: $customer->id);

            DB::commit();

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Customer']),
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

    /**
     * Deletes a customer by the given ID.
     *
     * @param string $id The ID of the customer to be deleted.
     * @return object The response object containing the success message and the deleted customer data.
     */
    public function deleteCustomer(string $id): object
    {
        try {
            $customer = Customer::findOrFail($id);
            $customer->forceDelete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Customer']),
                data: $customer
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: __('crud.deleted', ['name' => 'Customer']),
                errors: $th->getTrace()
            );
        }
    }

    /**
     * Synchronizes the customer address information.
     *
     * @param ?CustomerAddress $customerAddress The existing customer address model, or null if it doesn't exist.
     * @param array $customerAddressDto The customer address data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerAddress(?CustomerAddress $customerAddress, array $customerAddressDto, string $customerId)
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
        } else {
            $customerAddressDto['contact_informations'] = null;
        }

        $customerAddressDto['customer_id'] = $customerId;

        if (empty($customerAddress)) {
            CustomerAddress::create($customerAddressDto);
        } else {
            $customerAddress->update($customerAddressDto);
        }
    }

    /**
     * Synchronizes the customer VAT information.
     *
     * @param ?CustomerVat $customerVat The existing customer VAT model, or null if it doesn't exist.
     * @param array $customerVatDto The customer VAT data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerVat(?CustomerVat $customerVat, array $customerVatDto, string $customerId)
    {
        $customerVatDto['customer_id'] = $customerId;
        empty($customerVat)
            ? CustomerVat::create($customerVatDto)
            : $customerVat->update($customerVatDto);
    }

    /**
     * Synchronizes the customer email information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerEmail(array $customerEmailDto, string $customerId)
    {
        foreach ($customerEmailDto['email_id'] as $key => $emailId) {
            $customerEmailModel = CustomerEmail::where('id', $emailId)->first();

            empty($customerEmailModel)
                ? CustomerEmail::create(['customer_id' => $customerId, 'email' => $customerEmailDto['email'][$key]])
                : $customerEmailModel->update(['customer_id' => $customerId, 'email' => $customerEmailDto['email'][$key]]);
        }
    }

    /**
     * Synchronizes the customer sales information.
     *
     * @param ?CustomerSales $customerSales The existing customer sales model, or null if it doesn't exist.
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerSales(?CustomerSales $customerSales, array $customerSalesDto, string $customerId)
    {
        $customerSalesDto['customer_id'] = $customerId;
        empty($customerSales)
            ? CustomerSales::create($customerSalesDto)
            : $customerSales->update($customerSalesDto);
    }

    /**
     * Synchronizes the customer bank information.
     *
     * @param ?CustomerBank $customerBank The existing customer bank model, or null if it doesn't exist.
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerBank(?CustomerBank $customerBank, array $customerBankDto, string $customerId)
    {
        $customerBankDto['customer_id'] = $customerId;
        empty($customerBank)
            ? CustomerBank::create($customerBankDto)
            : $customerBank->update($customerBankDto);
    }

    /**
     * Synchronizes the customer account information.
     *
     * @param array $customerEmailDto The customer email data to be synchronized.
     * @param string $customerId The ID of the customer.
     * @return void
     */
    private function syncCustomerAccount(array $customerAccountDto, string $customerId)
    {
        foreach ($customerAccountDto['chart_of_account_id'] as $key => $coaId) {
            $customerAccount = CustomerAccount::where('id', $customerAccountDto['customer_account_id'][$key])->first();

            empty($customerAccount)
                ? CustomerAccount::create([
                    'customer_id' => $customerId,
                    'chart_of_account_id' => $coaId,
                    'currency_id' => $customerAccountDto['currency_id'][$key],
                    'lov_status' => $customerAccountDto['lov_status'][$key],
                    'notes' => $customerAccountDto['notes'][$key],
                ])
                : $customerAccount->update([
                    'customer_id' => $customerId,
                    'chart_of_account_id' => $coaId,
                    'currency_id' => $customerAccountDto['currency_id'][$key],
                    'lov_status' => $customerAccountDto['lov_status'][$key],
                    'notes' => $customerAccountDto['notes'][$key],
                ]);
        }
    }

    /**
     * Stores data based on the customer type.
     *
     * @param array $customerTypesDto The customer types data transfer object.
     * @param Customer $customerModel The customer model instance.
     * @return void
     */
    public function storeDataBasedOnCustomerType(array $customerTypesDto, Customer $customerModel)
    {
        $customerTypeModel = CustomerType::whereIn('customer_type_name', $customerTypesDto)->get();
        $customerTypes = collect($customerTypesDto)->map(function ($item) use ($customerModel) {
            return [
                'id' => Str::uuid(),
                'customer_id' => $customerModel->id,
                'name' => $item,
                'created_at' => now(),
                'updated_at' => now(),
                'created_by' => Auth::user()->email,
                'updated_by' => Auth::user()->email,
            ];
        })->toArray();

        FinanceCustomerType::query()->where('customer_id', $customerModel->id)->forceDelete();
        FinanceCustomerType::insert($customerTypes);

        $customerBillingTypeData = array();
        $carrierAgentTypeData = array();
        $otherTypeData = array();

        foreach ($customerTypesDto as $key => $customerType) {
            $customerTypeId = $customerTypeModel[$key]->customer_type_id;
            if ($customerType == 'Billing Customer') {
                $customerBillingTypeData[] = [
                    'customer_id' => Str::uuid(),
                    'customer_code' => $customerModel->customer_code,
                    'customer_name' => $customerModel->customer_name,
                    'customer_type' => $customerTypeId,
                    'finance_customer_id' => $customerModel->id,
                    'date_created' => now(),
                    'date_modified' => now(),
                    'created_by' => Auth::user()->email,
                    'status' => 1,
                ];
            } else if ($customerType == 'Carrier Agent') {
                $carrierAgentTypeData[] = [
                    'carrier_id' => Str::uuid(),
                    'carrier_code' => $customerModel->customer_code,
                    'carrier_name' => $customerModel->customer_name,
                    'finance_customer_id' => $customerModel->id,
                    'date_created' => now(),
                    'date_modified' => now(),
                    'created_by' => Auth::user()->email,
                    'status' => 1,
                ];
            } else {
                $otherTypeData[] = [
                    'vendor_id' => Str::uuid(),
                    'vendor_code' => $customerModel->customer_code,
                    'vendor_name' => $customerModel->customer_name,
                    'vendor_type_id' => $customerTypeId,
                    'finance_customer_id' => $customerModel->id,
                    'created_date' => now(),
                    'date_modified' => now(),
                    'created_by' => Auth::user()->email,
                    'status' => 1,
                ];
            }
        }

        if (!empty($customerBillingTypeData)) {
            CustomerBilling::where('finance_customer_id', $customerModel->id)->delete();
            CustomerBilling::insert($customerBillingTypeData);
        }

        if (!empty($carrierAgentTypeData)) {
            Carrier::where('finance_customer_id', $customerModel->id)->delete();
            Carrier::insert($carrierAgentTypeData);
        }

        if (!empty($otherTypeData)) {
            Vendor::where('finance_customer_id', $customerModel->id)->delete();
            Vendor::insert($otherTypeData);
        }
    }
}
