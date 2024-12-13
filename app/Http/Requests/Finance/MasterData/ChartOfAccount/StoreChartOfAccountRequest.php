<?php

declare(strict_types=1);

namespace App\Http\Requests\Finance\MasterData\ChartOfAccount;

use App\Constants\COA\CashflowType;
use Illuminate\Foundation\Http\FormRequest;

final class StoreChartOfAccountRequest extends FormRequest
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
            'account_group_id' => ['required', 'string', 'exists:pgsql.finance.account_groups,id'],
            'sub_account_group_id' => ['required', 'string', 'exists:pgsql.finance.sub_account_groups,id'],
            'account_number' => ['required', 'string', 'max_digits:10'],
            'account_name' => ['required', 'string', 'max:255'],
            'subledger_code' => ['nullable', 'string', 'max:255'],
            'subledger_name' => ['nullable', 'string', 'max:255'],
            'is_cashflow' => ['required', 'boolean'],
            'cashflow_type' => ['nullable', 'string', 'in:'.implode(',', CashflowType::COLLECT)],
            'account_position' => ['required', 'string', 'in:debit,credit']
        ];
    }

    /**
     * Prepares the account number field for validation by padding it with leading zeros to a length of 10 characters.
     */
    public function prepareForValidation()
    {
        $this->merge([
            'account_number' => str_replace('.', '', str_pad($this->account_number, 10, '0', STR_PAD_RIGHT)),
        ]);
    }
}
