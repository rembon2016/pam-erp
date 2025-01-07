<?php

declare(strict_types=1);

namespace Database\Seeders\Finance\FixedAsset;

use App\Models\Finance\FixedAssetType;
use Illuminate\Database\Seeder;

final class FixedAssetTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $types = [
            [
                'type_name' => 'Computer Equipment',
                'type_code' => 'CE',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Furniture and Fixtures',
                'type_code' => 'FF',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Office Equipment',
                'type_code' => 'OE',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Leasehold Improvement',
                'type_code' => 'LI',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Intangible Asset',
                'type_code' => 'IA',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Vehicle',
                'type_code' => 'V',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Building',
                'type_code' => 'B',
                'created_at' => now(),
            ],
            [
                'type_name' => 'Land',
                'type_code' => 'L',
                'created_at' => now(),
            ],
        ];

        foreach ($types as $type) {
            FixedAssetType::create($type);
        }
    }
}
