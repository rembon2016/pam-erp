<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Charge;

use Illuminate\Foundation\Http\FormRequest;

final class GlobalChargeRequest extends FormRequest
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
            'charge_code' => 'required|string|max:255',
            'charge_name' => 'required|string|max:255',
            'transport_type' => 'required|string|max:255',
            'is_agreed_rate' => 'required|boolean',
            'unit_id' => 'nullable',
            'cost_id' => 'nullable',
            'revenue_id' => 'nullable',
        ];
    }

    public function attributes(): array
    {
        return [
            'charge_code' => 'Charge Code',
            'charge_name' => 'Charge Name',
            'transport_type' => 'Transport Type',
            'unit_id' => 'Unit',
            'revenue_id' => 'Revenue Account',
            'cost_id' => 'Cost Account',
            'is_agreed_rate' => 'Agreed Rate Charge',
        ];
    }
}
