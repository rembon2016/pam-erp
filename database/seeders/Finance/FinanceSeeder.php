<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use Illuminate\Database\Seeder;
use Database\Seeders\Finance\FixedAssetSeeder;
use Database\Seeders\Finance\ChartOfAccountSeeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class FinanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call([
            FixedAssetSeeder::class,
            ChartOfAccountSeeder::class
        ]);
    }
}
