<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Unit;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

final class UpdateUnitRequest extends FormRequest
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
            'unit_code' => ['required', 'string'],
            'unit_name' => ['required', 'string', 'unique:pgsql.master.unit,unit_name,'.$this->id]
        ];
    }
}