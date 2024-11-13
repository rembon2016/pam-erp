<?php

declare(strict_types=1);

namespace Database\Seeders\Finance\COA;

use App\Models\Finance\ChartOfAccount;
use App\Models\Finance\SubAccountGroup;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

final class ChartOfAccountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        collect($this->chartOfAccountCollectibleData())
            ->each(function ($account) {
                $accountNumber = $this->findSubAccountGroupByCode(code: $account['sub_account_code'])->getCollectibleAccountNumber().".{$account['code']}";

                $subledgerCode = substr(str_replace('.', '', $accountNumber), 0, 6);

                ChartOfAccount::create([
                    'sub_account_group_id' => $this->findSubAccountGroupByCode(code: $account['sub_account_code'])->id,
                    'account_number' => $accountNumber,
                    'account_name' => $account['name'],
                    'subledger_code' => $subledgerCode,
                    'subledger_name' => $account['subledger_name'],
                    'is_cashflow' => $account['is_cashflow'],
                    'account_position' => $account['account_position']
                ]);
            });
    }

    /**
     * Returns an array of chart of account data that can be used to seed the database.
     *
     * The array contains objects with the following properties:
     * - sub_account_code: The code of the sub-account group.
     * - code: The code of the chart of account.
     * - name: The name of the chart of account.
     * - subledger_name: The name of the subledger.
     * - is_cashflow: A boolean indicating whether the account is a cash flow account.
     * - account_position: The position of the account (debit or credit).
     *
     * @return array An array of chart of account data.
     */
    private function chartOfAccountCollectibleData(): array
    {
        return [
            [
                'sub_account_code' => '12',
                'code' => '12',
                'name' => 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS',
                'subledger_name' => 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS',
                'is_cashflow' => false,
                'account_position' => 'debit',
            ],
            [
                'sub_account_code' => '12',
                'code' => '12.0001',
                'name' => 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS',
                'subledger_name' => 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS',
                'is_cashflow' => false,
                'account_position' => 'debit',
            ],
            [
                'sub_account_code' => '21',
                'code' => '01',
                'name' => 'SUNDRY CREDITORS',
                'subledger_name' => 'SUNDRY CREDITORS',
                'is_cashflow' => false,
                'account_position' => 'credit'
            ],
            [
                'sub_account_code' => '21',
                'code' => '01.0001',
                'name' => 'CREDITORS LOCAL',
                'subledger_name' => 'SUNDRY CREDITORS',
                'is_cashflow' => false,
                'account_position' => 'credit'
            ]
        ];
    }

    /**
     * Finds a SubAccountGroup by its code.
     *
     * @param string $code The code of the SubAccountGroup to find.
     * @return mixed The SubAccountGroup with the given code, or null if not found.
     */
    private function findSubAccountGroupByCode(string $code): mixed
    {
        return SubAccountGroup::select('id', 'code', 'name')
            ->where('code', $code)
            ->first();
    }
}
