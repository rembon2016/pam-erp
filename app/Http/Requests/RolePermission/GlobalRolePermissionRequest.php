<?php

declare(strict_types=1);

namespace App\Http\Requests\RolePermission;

use Illuminate\Foundation\Http\FormRequest;

final class GlobalRolePermissionRequest extends FormRequest
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
            'name' => 'required|string|max:255',
            'permission' => 'required|array',
            'permission.*' => 'required|string|max:255',
        ];
    }

    public function attributes(): array
    {
        return [
            'name' => 'Role Name',
            'permission' => 'Permission',
            'permission.*' => 'Permission',
        ];
    }
}