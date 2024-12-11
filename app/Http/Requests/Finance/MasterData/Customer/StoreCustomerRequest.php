<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Customer;

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
            $this->getFinanceCustomerGstField(),
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
            'customer_code' => ['required', 'string', 'max:255'],
            'customer_name' => ['required', 'string', 'max:255'],
            'eori_number' => ['required', 'string', 'max:255'],
            'credit_terms' => ['nullable', 'string'],
            'overseas' => ['nullable', 'string'],
            'currency_id' => ['nullable', 'string', 'exists:pgsql.finance.currencies,id'],
            'credit_limit' => ['nullable', 'string'],
            'customer_type' => ['required', 'array'],
            'customer_type.' => ['']
        ];
    }

    private function getFinanceCustomerAddressField(): array
    {
        return [
            'address_type' => ['nullable', 'string', 'max:255'],
            'bank_dlr_code' => ['nullable', 'string', 'max:255'],
            'city' => ['nullable', 'string', 'max:255'],
            'state' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'country' => ['nullable', 'string', 'max:255'],
            'zip' => ['nullable', 'numeric'],
            'po_box' => ['nullable', 'numeric'],
            'phone_number' => ['nullable', 'string', 'max:255'],
            'fax_number' => ['nullable', 'string', 'max:255'],
            'warehouse_provider' => ['nullable', 'string', 'max:255'],
            'contact_informations' => ['nullable', 'array'],
        ];
    }

    private function getFinanceCustomerGstField(): array
    {
        return [
            'address_type' => ['nullable', 'string', 'max:255'],
            'arn_number' => ['nullable', 'numeric'],
            'msme' => ['nullable', 'string', 'max:255'],
            'city' => ['nullable', 'string', 'max:255'],
            'hs' => ['nullable', 'numeric'],
            'hsn_codes' => ['nullable', 'string', 'max:255'],
            'uam_number' => ['nullable', 'string', 'max:255'],
            'state' => ['nullable', 'string', 'max:255'],
            'nac_codes' => ['nullable', 'string', 'max:255'],
            'type_of_enterprise' => ['nullable', 'string', 'max:255'],
            'address' => ['nullable', 'string'],
            'uin_number' => ['nullable', 'string'],
            'pan_mandatory' => ['nullable', 'string'],
            'composit_regular' => ['nullable', 'string'],
            'sez' => ['nullable', 'string', 'max:255'],
            'pan_number' => ['nullable', 'string', 'max:255'],
            'sez_valid_from_date' => ['nullable', 'date'],
            'sez_valid_to_date' => ['nullable', 'date', 'after:sez_valid_from_date'],
            'gst_registration_status' => ['nullable', 'string', 'max:255'],
            'passport_number' => ['nullable', 'string', 'max:255'],
            'tan_number' => ['nullable', 'string', 'max:255'],
            'gsg_id' => ['nullable', 'string', 'max:255'],
            'gsg_provisional_id' => ['nullable', 'string', 'max:255'],
            'gsd_id' => ['nullable', 'string', 'max:255'],
        ];
    }

    private function getFinanceCustomerVatField(): array
    {
        return [
            'vat_number' => ['nullable', 'string', 'max:255'],
            'local_vat_number' => ['nullable', 'string', 'max:255'],
            'vat_excemted' => ['nullable', 'string', 'max:255'],
            'excemted_reason' => ['nullable', 'string'],
            'ait_number' => ['nullable', 'string'],
        ];
    }

    private function getFinanceCustomerEmailField(): array
    {
        return [
            'email' => ['nullable', 'array'],
            'email.*' => ['email', 'max:255'],
        ];
    }

    private function getFinanceCustomerSalesField(): array
    {
        return [
            'location' => ['nullable', 'string', 'max:255'],
            'segment' => ['nullable', 'string', 'max:255'],
            'salesman' => ['nullable', 'string', 'max:255'],
            'customer_services' => ['nullable', 'string', 'max:255'],
            'credit_days' => ['nullable', 'numeric'],
            'limit_amount' => ['nullable', 'string'],
            'publish_credit_days' => ['nullable', 'numeric'],
            'publish_amount' => ['nullable', 'string'],
            'review_date' => ['nullable', 'date'],
            'override_amount' => ['nullable', 'string'],
            'allowed_days' => ['nullable', 'numeric'],
            'tos' => ['nullable', 'string', 'max:255'],
            'contact_person' => ['nullable', 'string', 'max:255'],
            'customer_email' => ['nullable', 'string', 'max:255'],
            'auto_more_than_percentage' => ['nullable', 'numeric'],
            'email_days' => ['nullable', 'numeric'],
            'automatic_email_to' => ['nullable', 'string', 'max:255'],
            'sales_coordinator' => ['nullable', 'string', 'max:255'],
            'acc_handling_person' => ['nullable', 'string', 'max:255'],
            'note' => ['nullable', 'string'],
            'invoices_to_email' => ['nullable', 'string', 'max:255'],
            'clearance_email' => ['nullable', 'string', 'max:255'],
        ];
    }

    private function getFinanceCustomerBankField(): array
    {
        return [
            'account_number' => ['nullable', 'string', 'max:255'],
            'account_name' => ['nullable', 'string', 'max:255'],
            'bank_name' => ['nullable', 'string', 'max:255'],
            'iban_number' => ['nullable', 'string', 'max:255'],
            'swift_code' => ['nullable', 'string', 'max:255'],
            'bank_address' => ['nullable', 'string', 'max:255'],
            'bank_guarantee_ac_number' => ['nullable', 'string', 'max:255'],
            'blz_number_sort_code' => ['nullable', 'string', 'max:255'],
            'paye_beneficiary_id' => ['nullable', 'string', 'max:255'],
            'payment_type' => ['nullable', 'string', 'max:255'],
            'beneficiary_code' => ['nullable', 'string', 'max:255'],
            'beneficiary_ac_number' => ['nullable', 'string', 'max:255'],
            'beneficiary_ac_type' => ['nullable', 'string', 'max:255'],
            'beneficiary_name' => ['nullable', 'string', 'max:255'],
            'beneficiary_first_address' => ['nullable', 'string', 'max:255'],
            'beneficiary_second_address' => ['nullable', 'string', 'max:255'],
            'beneficiary_third_address' => ['nullable', 'string', 'max:255'],
            'beneficiary_city' => ['nullable', 'string', 'max:255'],
            'beneficiary_state' => ['nullable', 'string', 'max:255'],
            'beneficiary_pincode' => ['nullable', 'string', 'max:255'],
            'ifsc_code' => ['nullable', 'string', 'max:255'],
            'beneficiary_mobile_number' => ['nullable', 'string', 'max:255'],
            'beneficiary_bank_number' => ['nullable', 'string', 'max:255'],
            'beneficiary_bank_name' => ['nullable', 'string', 'max:255'],
            'beneficiary_bank_branch_name' => ['nullable', 'string', 'max:255'],
        ];
    }

    private function getFinanceCustomerAccountField(): array
    {
        return [
            'chart_of_account_id' => ['nullable', 'array'],
            'chart_of_account_id.*' => ['exists:pgsql.finance.chart_of_accounts,id'],
            'currency_id' => ['nullable', 'array'],
            'currency_id.*' => ['exists:pgsql.finance.currencies,id'],
            'lov_status' => ['nullable', 'array'],
            'lov_status.*' => ['nullable', 'string'],
            'notes' => ['nullable', 'array'],
            'notes.*' => ['nullable', 'string'],
        ];
    }
}
