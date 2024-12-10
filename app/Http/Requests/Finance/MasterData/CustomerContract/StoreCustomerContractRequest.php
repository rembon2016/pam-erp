<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\CustomerContract;

use Illuminate\Foundation\Http\FormRequest;

final class StoreCustomerContractRequest extends FormRequest
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
            'contract_description' => 'required|string',
            'charges' => 'required|array',
            'charges.*.charge_id' => 'required|exists:pgsql.finance.charges,id',
            'charges.*.currency_id' => 'required|exists:pgsql.finance.currencies,id',
            'charges.*.rate' => 'required|numeric|min:0',
            'charges.*.unit_id' => 'nullable',
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
            'charges.*.charge_id' => 'Charge Name',
            'charges.*.currency_id' => 'Currency',
            'charges.*.rate' => 'Rate',
            'charges.*.unit_id' => 'Unit',
        ];
    }
}
