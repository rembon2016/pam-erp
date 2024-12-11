<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Finance\Customer;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class CustomerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Customer::create([
            'customer_code' => "CUS-001",
            'customer_name' => 'Example Customer',
            'eori_number' => '123',
            'credit_terms' => 'test',
            'credit_limit' => 1000,
            'overseas' => 'overseas',
        ]);
    }
}
