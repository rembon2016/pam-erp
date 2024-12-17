<?php

declare(strict_types=1);

namespace Database\Seeders\Finance\COA;

use App\Models\Finance\AccountGroup;
use App\Models\Finance\SubAccountGroup;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

final class SubAccountGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        collect($this->subAccountGroupCollectibleData())
            ->each(function ($account) {

                SubAccountGroup::create([
                    'account_group_id' => $this->findAccountGroupByCode(code: $account['account_group_code']),
                    'code' => $account['code'],
                    'name' => $account['name']
                ]);

            });
    }

    /**
     * Collects the data for the sub-account groups.
     *
     * This method returns an array of sub-account group data, including the code and name for each group.
     * The data is used to seed the database with the initial sub-account group records.
     *
     * @return array An array of sub-account group data.
     */
    private function subAccountGroupCollectibleData(): array
    {
        return [
            [
                'code' => '00',
                'name' => 'ASSET',
                'account_group_code' => '1',
            ],
            [
                'code' => '01',
                'name' => 'FIXED ASSET',
                'account_group_code' => '1',
            ],
            [
                'code' => '05',
                'name' => 'INVESTMENTS',
                'account_group_code' => '1',
            ],
            [
                'code' => '10',
                'name' => 'CURRENT ASSETS',
                'account_group_code' => '1',
            ],
            [
                'code' => '15',
                'name' => 'MISCELLANEOUS EXPENDITURE',
                'account_group_code' => '1',
            ],
            [
                'code' => '00',
                'name' => 'LIABILITIES',
                'account_group_code' => '2',
            ],
            [
                'code' => '01',
                'name' => 'SHARE HOLDER FUNDS',
                'account_group_code' => '2',
            ],
            [
                'code' => '05',
                'name' => 'LOAN FUNDS',
                'account_group_code' => '2',
            ],
            [
                'code' => '10',
                'name' => 'CURRENT LIABILITIES',
                'account_group_code' => '2',
            ],
            [
                'code' => '15',
                'name' => 'PAYABLES PROVISIONS',
                'account_group_code' => '2',
            ],
            [
                'code' => '00',
                'name' => 'INCOME',
                'account_group_code' => '3',
            ],
            [
                'code' => '01',
                'name' => 'TRADE INCOME',
                'account_group_code' => '3',
            ],
            [
                'code' => '05',
                'name' => 'NON TRADE INCOME',
                'account_group_code' => '3',
            ],
            [
                'code' => '00',
                'name' => 'EXPENDITURE',
                'account_group_code' => '4',
            ],
            [
                'code' => '01',
                'name' => 'COST OF SALES',
                'account_group_code' => '4',
            ],
            [
                'code' => '05',
                'name' => 'PERSONNEL ADMINISTRATIVE OVERHEADS',
                'account_group_code' => '4',
            ],
            [
                'code' => '06',
                'name' => 'ENTERTAINMENT EXPENSES',
                'account_group_code' => '4',
            ],
            [
                'code' => '07',
                'name' => 'INSURANCE',
                'account_group_code' => '4',
            ],
            [
                'code' => '08',
                'name' => 'LEGAL STATUTORY COST',
                'account_group_code' => '4',
            ],
            [
                'code' => '10',
                'name' => 'FINANCE EXPENSES',
                'account_group_code' => '4',
            ],
            [
                'code' => '15',
                'name' => 'NON CASH COST',
                'account_group_code' => '4',
            ],
            [
                'code' => '20',
                'name' => 'BAD DOUBTFUL DEBTS',
                'account_group_code' => '4',
            ],
            [
                'code' => '25',
                'name' => 'TAXES',
                'account_group_code' => '4',
            ],
            [
                'code' => '30',
                'name' => 'DIVIDEND',
                'account_group_code' => '4',
            ],
            [
                'code' => '50',
                'name' => 'DIRECT ALLOCATED COSTS',
                'account_group_code' => '4',
            ],
        ];
    }

    /**
     * Finds an AccountGroup by its code.
     *
     * @param string $code The code of the AccountGroup to find.
     * @return string
     */
    private function findAccountGroupByCode(string $code): string
    {
        return AccountGroup::select('id', 'code', 'name')
            ->where('code', $code)
            ->first()
            ->id;
    }
}
