<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\Port;

use App\Models\Operation\Master\Port;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

final class StorePortRequest extends FormRequest
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
            'port_name' => ['required', 'string', 'max:255'],
            'port_code' => ['required', 'string', 'max:255', 'unique:pgsql.master.port,port_code'],
            'region_sector' => ['required', 'integer', 'exists:pgsql.master.region,region_id'],
            'edi_port_code' => ['nullable', 'string', 'max:255'],
            'transport_mode' => ['required', 'string', 'in:'.implode(',', Port::TRANSPORT_MODE)],
            'prefix' => ['required', 'string', 'max:20'],
            'is_dry_port' => ['required', 'in:0,1'],
            'group_name' => ['nullable', 'string', 'max:255'],
            'sailing_day' => ['nullable', 'string', 'max:255'],
            'visibility' => ['nullable', 'string', 'max:255'],
            'custom_available' => ['nullable', 'string', 'max:255'],
            'state_code' => ['nullable', 'string', 'max:255'],
            'location_code' => ['nullable', 'string', 'max:255'],
            'country_id' => ['required', 'string', 'exists:pgsql.master.countries,country_id'],
            'city' => ['required', 'string', 'max:100'],
            'note' => ['nullable', 'string'],
            'status' => ['nullable', 'in:1,2,3']
        ];
    }
}
