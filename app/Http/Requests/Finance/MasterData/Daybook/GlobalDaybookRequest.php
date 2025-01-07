<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Daybook;

use Illuminate\Foundation\Http\FormRequest;

final class GlobalDaybookRequest extends FormRequest
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
            'code' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:255',
            'description' => 'required|string',
        ];
    }

    public function attributes(): array
    {
        return [
            'code' => 'Daybook Code',
            'name' => 'Daybook Name',
            'type' => 'Type',
            'description' => 'Description',
        ];
    }
}
