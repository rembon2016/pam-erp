<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Country;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

final class UpdateCountryRequest extends FormRequest
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
        return [
            'country_name' => ['required', 'string', 'max:150'],
            'country_code' => ['required', 'string', 'max:5'],
            'region_id' => ['required', 'integer', 'exists:pgsql.master.region,region_id'],
            'status' => ['nullable', 'in:1,2,3']
        ];
    }
}
