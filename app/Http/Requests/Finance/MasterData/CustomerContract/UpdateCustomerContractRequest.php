<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\CustomerContract;

use Illuminate\Validation\Rule;
use App\Models\Finance\CustomerContract;
use Illuminate\Foundation\Http\FormRequest;

final class UpdateCustomerContractRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'customer_id' => 'required|exists:pgsql.finance.customer,id',
            'contract_start' => 'required|date',
            'contract_end' => 'required|date',
            'contract_file' => 'nullable|array',
            'contract_file.*' => 'required|file',
            'currency_id' => 'required|exists:pgsql.finance.currencies,id',
            'contract_description' => 'nullable|string',
            'services.*.customer_contract_service_id' => 'nullable',
            'services.*.service_type' => ['required', Rule::in(array_keys(CustomerContract::SERVICES))],
            'services.*.origin_country_id' => 'required',
            'services.*.origin_port_id' => 'nullable',
            'services.*.origin_port' => 'nullable',
            'services.*.destination_country_id' => 'required',
            'services.*.destination_port_id' => 'nullable',
            'services.*.destination_port' => 'nullable',
            'services.*.charges' => 'required|array',
            'services.*.charges.*.customer_contract_charge_id' => 'nullable',
            'services.*.charges.*.charge_id' => 'required',
            'services.*.charges.*.rates' => 'required|array',
            'services.*.charges.*.rates.*.customer_contract_charge_detail_id' => 'nullable',
            'services.*.charges.*.rates.*.container_type' => 'nullable|string',
            'services.*.charges.*.rates.*.from' => 'nullable|numeric|min:0',
            'services.*.charges.*.rates.*.to' => 'nullable|numeric|min:0',
            'services.*.charges.*.rates.*.rate' => 'required|numeric|min:0',
            'services.*.charges.*.rates.*.unit_code' => 'required|string',
        ];
    }

    public function attributes()
    {
        return [
            'customer_id' => 'Customer',
            'contract_from' => 'Contract From',
            'contract_to' => 'Contract To',
            'contract_start' => 'Contract Validity From',
            'contract_end' => 'Contract Validity To',
            'contract_description' => 'Description',
            'contract_file' => 'Documents',
            'contract_file.*' => 'Document',
            'currency_id' => 'Currency',
            'services.*.customer_contract_service_id' => 'Service ID of Customer Contract',
            'services.*.service_type' => 'Service',
            'services.*.origin_country_id' => 'Country Origin',
            'services.*.origin_port_id' => 'Port Origin',
            'services.*.origin_port' => 'Port Origin',
            'services.*.destination_country_id' => 'Country Destination',
            'services.*.destination_port_id' => 'Port Destination',
            'services.*.destination_port' => 'Port Destination',
            'services.*.charges' => 'Charges',
            'services.*.charges.*.customer_contract_charge_id' => 'Charge ID of Customer Contract',
            'services.*.charges.*.charge_id' => 'Charge Name',
            'services.*.charges.*.rates' => 'Charge Rates',
            'services.*.charges.*.rates.*.customer_contract_charge_detail_id' => 'Charge Detail ID of Customer Contract',
            'services.*.charges.*.rates.*.container_type' => 'Container Type',
            'services.*.charges.*.rates.*.from' => 'From',
            'services.*.charges.*.rates.*.to' => 'To',
            'services.*.charges.*.rates.*.rate' => 'Rate',
            'services.*.charges.*.rates.*.unit_code' => 'Unit Code',
        ];
    }
}
