<?php

declare(strict_types=1);

namespace App\Http\Requests\ServiceType;

use Illuminate\Foundation\Http\FormRequest;

final class GlobalServiceTypeRequest extends FormRequest
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
            'service_code' => 'required|string|max:255',
            'service_name' => 'required|string|max:255',
        ];
    }

    public function attributes(): array
    {
        return [
            'service_code' => 'Service Code',
            'service_name' => 'Service Name',
        ];
    }
}
