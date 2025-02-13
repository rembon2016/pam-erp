<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\CustomerForBilling;

use Illuminate\Foundation\Http\FormRequest;

final class UpdateCustomerForBillingRequest extends FormRequest
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
        ];
    }

    public function attributes(): array
    {
        return [
            'customer_name' => 'Customer Name',
        ];
    }
}
