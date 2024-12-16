<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use Illuminate\Database\Seeder;
use Database\Seeders\Finance\COA\AccountGroupSeeder;
use Database\Seeders\Finance\COA\ChartOfAccountSeeder as COASeeder;
use Database\Seeders\Finance\COA\SubAccountGroupSeeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class ChartOfAccountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call([
            AccountGroupSeeder::class,
            SubAccountGroupSeeder::class,
            // COASeeder::class,
        ]);
    }
}
