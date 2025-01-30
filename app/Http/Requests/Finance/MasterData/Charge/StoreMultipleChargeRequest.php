<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Charge;

use Illuminate\Foundation\Http\FormRequest;

final class StoreMultipleChargeRequest extends FormRequest
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
            'transport_type_id' => 'required',
            'is_agreed_rate' => 'required|boolean',
            'unit_id' => 'nullable',
            'cost_id' => 'nullable',
            'revenue_id' => 'nullable',
            'charges' => 'required|array',
            'charges.*.charge_code' => 'required|string|max:255',
            'charges.*.charge_name' => 'required|string|max:255',
        ];
    }

    public function attributes(): array
    {
        return [
            'charges' => 'Charges',
            'charges.*.charge_code' => 'Charge Code',
            'charges.*.charge_name' => 'Charge Name',
            'transport_type_id' => 'Transport Type',
            'unit_id' => 'Unit',
            'revenue_id' => 'Revenue Account',
            'cost_id' => 'Cost Account',
            'is_agreed_rate' => 'Agreed Rate Charge',
        ];
    }
}
