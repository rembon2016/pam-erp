<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\AgentContract;

use Illuminate\Foundation\Http\FormRequest;

final class UpdateAgentContractRequest extends FormRequest
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
            'contract_no' => 'required|string|max:255',
            'customer_id' => 'required|exists:pgsql.finance.customer,id',
            'contract_date' => 'required|date',
            'contract_start' => 'required|date',
            'contract_end' => 'required|date',
            'contract_file' => 'nullable|file',
            'contract_description' => 'nullable|string',
            'service_data' => 'required|array',
        ];
    }

    public function attributes(): array
    {
        return [
            'contract_no' => 'Contract No',
            'customer_id' => 'Customer',
            'contract_date' => 'Contract Date',
            'contract_start' => 'Start Contract Date',
            'contract_end' => 'End Contract Date',
            'contract_file' => 'Document (Attachment)',
            'contract_description' => 'Description',
            'service_data' => 'Agent Contract Services & Charges',
        ];
    }
}
