<?php

declare(strict_types=1);

namespace Database\Seeders\Finance\COA;

use App\Models\Finance\AccountGroup;
use Illuminate\Database\Seeder;

final class AccountGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        collect($this->accountGroupCollectibleData())
            ->each(function ($account) {
                AccountGroup::create([
                    'code' => $account['code'],
                    'name' => $account['name'],
                ]);
            });
    }

    /**
     * Collects the data for the account groups.
     *
     * @return array An array of account group data, including the code and name for each group.
     */
    private function accountGroupCollectibleData(): array
    {
        return [
            [
                'code' => '1',
                'name' => 'ASSETS',
            ],
            [
                'code' => '2',
                'name' => 'LIABILITIES',
            ],
            [
                'code' => '3',
                'name' => 'INCOME',
            ],
            [
                'code' => '4',
                'name' => 'EXPENDITURE',
            ],
        ];
    }
}
