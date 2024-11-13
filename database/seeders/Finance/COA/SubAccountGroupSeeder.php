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
                    'account_group_id' => $this->findAccountGroupByCode(code: $account['code'][0]),
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
                'code' => '11',
                'name' => 'Current Assets'
            ],
            [
                'code' => '12',
                'name' => 'Fixed Assets'
            ],
            [
                'code' => '21',
                'name' => 'Current Liabilities'
            ],
            [
                'code' => '22',
                'name' => 'Longterm Liabilities'
            ],
            [
                'code' => '31',
                'name' => 'Share'
            ],
            [
                'code' => '32',
                'name' => "Current Year's Profit and Loss"
            ]
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
