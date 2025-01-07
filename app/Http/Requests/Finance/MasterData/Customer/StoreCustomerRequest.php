<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Customer;

use App\Constants\Customer\CustomerType;
use App\Models\Finance\Customer;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

final class StoreCustomerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return array_merge(
            $this->getBaseFinanceCustomerField(),
            $this->getFinanceCustomerAddressField(),
            $this->getFinanceCustomerVatField(),
            $this->getFinanceCustomerEmailField(),
            $this->getFinanceCustomerSalesField(),
            $this->getFinanceCustomerBankField(),
            $this->getFinanceCustomerAccountField(),
        );
    }

    private function getBaseFinanceCustomerField(): array
    {
        return [
            // 'customer_code' => ['required', 'string', 'max:255'],
            'customer_name' => ['required', 'string', 'max:255'],
            'eori_number' => ['nullable', 'string', 'max:255'],
            'credit_terms' => ['nullable', 'string'],
            'overseas' => ['nullable', 'string'],
            'currency_id' => ['nullable', 'string', 'exists:pgsql.finance.currencies,id'],
            'credit_limit' => ['nullable', 'string'],
            'customer_type' => ['required', 'array'],
            'customer_type.*' => ['in:'.implode(',', CustomerType::COLLECT)]
        ];
    }

    private function getFinanceCustomerAddressField(): array
    {
        return [
            'customer_address' => ['nullable', 'array'],
            'customer_address.address_type' => ['nullable', 'string', 'max:255'],
            'customer_address.bank_dlr_code' => ['nullable', 'string', 'max:255'],
            'customer_address.city' => ['nullable', 'string', 'max:255'],
            'customer_address.state' => ['nullable', 'string', 'max:255'],
            'customer_address.address' => ['nullable', 'string'],
            'customer_address.country' => ['nullable', 'string', 'max:255'],
            'customer_address.zip_code' => ['nullable', 'numeric'],
            'customer_address.po_box' => ['nullable', 'numeric'],
            'customer_address.phone_number' => ['nullable', 'string', 'max:255'],
            'customer_address.fax_number' => ['nullable', 'string', 'max:255'],
            'customer_address.warehouse_provider' => ['nullable', 'string', 'max:255'],
            'customer_address.contact_informations' => ['nullable', 'array'],
            'customer_address.contact_informations.contact_person_name' => ['nullable'],
            'customer_address.contact_informations.contact_person_number' => ['nullable'],
            'customer_address.contact_informations.contact_person_email' => ['nullable'],
            'customer_address.contact_informations.contact_person_address' => ['nullable'],
        ];
    }

    private function getFinanceCustomerVatField(): array
    {
        return [
            'customer_vat' => ['nullable', 'array'],
            'customer_vat.vat_number' => ['nullable', 'string', 'max:255'],
            'customer_vat.local_vat_number' => ['nullable', 'string', 'max:255'],
            'customer_vat.vat_excemted' => ['nullable', 'string', 'max:255'],
            'customer_vat.excemted_reason' => ['nullable', 'string'],
            'customer_vat.ait_number' => ['nullable', 'string'],
        ];
    }

    private function getFinanceCustomerEmailField(): array
    {
        return [
            'customer_email' => ['nullable', 'array'],
            'customer_email.email_id' => ['nullable', 'array'],
            'customer_email.email_id.*' => ['nullable', 'string'],
            'customer_email.email' => ['nullable', 'array'],
            'customer_email.email.*' => ['nullable', 'email', 'max:255'],
        ];
    }

    private function getFinanceCustomerSalesField(): array
    {
        return [
            'customer_sales' => ['nullable', 'array'],
            'customer_sales.location' => ['nullable', 'string', 'max:255'],
            'customer_sales.segment' => ['nullable', 'string', 'max:255'],
            'customer_sales.salesman' => ['nullable', 'string', 'max:255'],
            'customer_sales.customer_services' => ['nullable', 'string', 'max:255'],
            'customer_sales.credit_days' => ['nullable', 'numeric'],
            'customer_sales.limit_amount' => ['nullable', 'string'],
            'customer_sales.publish_credit_days' => ['nullable', 'numeric'],
            'customer_sales.publish_amount' => ['nullable', 'string'],
            'customer_sales.review_date' => ['nullable', 'date'],
            'customer_sales.override_amount' => ['nullable', 'string'],
            'customer_sales.allowed_days' => ['nullable', 'numeric'],
            'customer_sales.tos' => ['nullable', 'string', 'max:255'],
            'customer_sales.contact_person' => ['nullable', 'string', 'max:255'],
            'customer_sales.customer_email' => ['nullable', 'string', 'max:255'],
            'customer_sales.auto_more_than_percentage' => ['nullable', 'numeric'],
            'customer_sales.email_days' => ['nullable', 'numeric'],
            'customer_sales.automatic_email_to' => ['nullable', 'string', 'max:255'],
            'customer_sales.sales_coordinator' => ['nullable', 'string', 'max:255'],
            'customer_sales.acc_handling_person' => ['nullable', 'string', 'max:255'],
            'customer_sales.note' => ['nullable', 'string'],
            'customer_sales.invoices_to_email' => ['nullable', 'string', 'max:255'],
            'customer_sales.clearance_email' => ['nullable', 'string', 'max:255'],
        ];
    }

    private function getFinanceCustomerBankField(): array
    {
        return [
            'customer_bank' => ['nullable', 'array'],
            'customer_bank.account_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.account_name' => ['nullable', 'string', 'max:255'],
            'customer_bank.bank_name' => ['nullable', 'string', 'max:255'],
            'customer_bank.iban_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.swift_code' => ['nullable', 'string', 'max:255'],
            'customer_bank.bank_address' => ['nullable', 'string', 'max:255'],
            'customer_bank.bank_guarantee_ac_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.blz_number_sort_code' => ['nullable', 'string', 'max:255'],
            'customer_bank.paye_beneficiary_id' => ['nullable', 'string', 'max:255'],
            'customer_bank.payment_type' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_code' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_ac_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_ac_type' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_name' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_first_address' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_second_address' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_third_address' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_city' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_state' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_pincode' => ['nullable', 'string', 'max:255'],
            'customer_bank.ifsc_code' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_mobile_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_bank_number' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_bank_name' => ['nullable', 'string', 'max:255'],
            'customer_bank.beneficiary_bank_branch_name' => ['nullable', 'string', 'max:255'],
        ];
    }

    private function getFinanceCustomerAccountField(): array
    {
        return [
            'customer_account' => ['nullable', 'array'],
            'customer_account.customer_account_id' => ['nullable', 'array'],
            'customer_account.customer_account_id.*' => ['nullable', 'string'],
            'customer_account.chart_of_account_id' => ['nullable', 'array'],
            'customer_account.chart_of_account_id.*' => ['nullable', 'exists:pgsql.finance.chart_of_accounts,id'],
        ];
    }
}
