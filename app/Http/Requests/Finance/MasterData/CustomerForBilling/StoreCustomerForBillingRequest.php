<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\CustomerForBilling;

use Illuminate\Foundation\Http\FormRequest;

final class StoreCustomerForBillingRequest extends FormRequest
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
            'customer_name' => 'required|string|max:255',
            'customer_address' => 'required',
            'customer_code' => 'nullable',
            'customer_group_id' => 'nullable',
            'customer_type' => 'required',
            'customer_email' => 'nullable',
            'customer_phone' => 'nullable',
            'customer_telp' => 'nullable',
            'customer_tax_id' => 'nullable',
            'customer_contact_person' => 'nullable',
            'country_id' => 'required',
        ];
    }

    public function attributes(): array
    {
        return [
            'customer_name' => 'Customer Name',
        ];
    }
}
