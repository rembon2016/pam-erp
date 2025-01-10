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
            'contract_from' => 'nullable',
            'contract_to' => 'nullable',
            'contract_start' => 'required|date',
            'contract_end' => 'required|date',
            'contract_file' => 'nullable|file',
            'contract_description' => 'nullable|string',
            'service_type' => ['required', Rule::in(array_keys(CustomerContract::SERVICES))],
            'origin_country_id' => 'required',
            'origin_port_id' => 'nullable',
            'origin_port' => 'nullable',
            'destination_country_id' => 'required',
            'destination_port_id' => 'nullable',
            'destination_port' => 'nullable',
            'charge_id' => 'required|exists:pgsql.finance.charges,id',
            'currency_id' => 'required|exists:pgsql.finance.currencies,id',
            'charges' => 'required|array',
            'charges.*.from' => 'required|numeric|min:0',
            'charges.*.to' => 'required|numeric|min:0',
            'charges.*.rate' => 'required|numeric|min:0',
            // 'charges.*.unit_id' => 'nullable',
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
            'service_type' => 'Service',
            'origin_country_id' => 'Country Origin',
            'origin_port_id' => 'Port Origin',
            'origin_port' => 'Port Origin',
            'destination_country_id' => 'Country Destination',
            'destination_port_id' => 'Port Destination',
            'destination_port' => 'Port Destination',
            'charge_id' => 'Charge Name',
            'currency_id' => 'Currency',
            'charges.*.rate' => 'Rate',
            'charges.*.quantity' => 'Quantity',
            'charges.*.from' => 'From',
            'charges.*.to' => 'To',
            //  'charges.*.unit_id' => 'Unit',
        ];
    }
}
