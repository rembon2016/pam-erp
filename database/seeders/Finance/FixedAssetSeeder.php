<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Database\Seeders\Finance\FixedAsset\FixedAssetTypeSeeder;
use Database\Seeders\Finance\FixedAsset\FixedAssetStatusSeeder;

final class FixedAssetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call([
            FixedAssetTypeSeeder::class,
            FixedAssetStatusSeeder::class,
        ]);
    }
}
