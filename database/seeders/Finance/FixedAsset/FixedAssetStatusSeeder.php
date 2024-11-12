<?php

declare(strict_types=1);

namespace Database\Seeders\Finance\FixedAsset;

use Illuminate\Database\Seeder;
use App\Models\Finance\FixedAssetStatus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class FixedAssetStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $statuses = [
            [
                'status_name' => 'Owned',
                'created_at' => now()
            ],
            [
                'status_name' => 'Rent',
                'created_at' => now()
            ],
            [
                'status_name' => 'Lease Purchase',
                'created_at' => now()
            ],
        ];

        foreach ($statuses as $status) {
            FixedAssetStatus::create($status);
        }
    }
}
