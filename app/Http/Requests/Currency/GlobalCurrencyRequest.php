<?php

declare(strict_types=1);

namespace App\Http\Requests\Currency;

use Illuminate\Foundation\Http\FormRequest;

final class GlobalCurrencyRequest extends FormRequest
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
            'currency_code' => 'required|string|max:8',
            'currency_name' => 'required|string|max:255',
            'currency_date' => 'required|date',
            'buy_rate' => 'required|numeric|min:0',
            'sell_rate' => 'required|numeric|min:0',
            'notes' => 'nullable|string|max:500'
        ];
    }

    public function attributes(): array
    {
        return [
            'currency_code' => 'Currency Code',
            'currency_name' => 'Currency Name',
            'currency_date' => 'Currency Date',
            'buy_rate' => 'Buy Rate',
            'sell_rate' => 'Sell Rate',
            'notes' => 'Notes'
        ];
    }
}
