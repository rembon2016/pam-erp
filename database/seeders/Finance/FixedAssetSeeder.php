<?php

declare(strict_types=1);

namespace Database\Seeders\Finance;

use Database\Seeders\Finance\FixedAsset\FixedAssetStatusSeeder;
use Database\Seeders\Finance\FixedAsset\FixedAssetTypeSeeder;
use Illuminate\Database\Seeder;

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
