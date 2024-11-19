<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\Master\FixedAsset;

use Illuminate\Foundation\Http\FormRequest;

final class UpdateFixedAssetRequest extends FormRequest
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
            'asset_code' => 'required|string|max:255',
            'asset_name' => 'required|string|max:255',
            'fixed_asset_type_id' => 'required|string|exists:pgsql.finance.fixed_asset_types,id',
            'acquisition_date' => 'required|date',
            'purchase_price' => 'required|numeric|min:0',
            'useful_life' => 'required|string|max:255',
            'fixed_asset_status_id' => 'required|string|exists:pgsql.finance.fixed_asset_statuses,id',
            'notes' => 'nullable|string'
        ];
    }

    public function attributes(): array
    {
        return [
            'asset_code' => 'Asset Code',
            'asset_name' => 'Asset Name',
            'fixed_asset_type_id' => 'Asset type',
            'acquisition_date' => 'Acquisition Date',
            'purchase_price' => 'Purchase Price',
            'useful_life' => 'Asset Useful Life',
            'fixed_asset_status_id' => 'Status',
            'notes' => 'Notes'
         ];
    }
}
