<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Models\Finance\Customer;
use Illuminate\Database\Eloquent\Collection;

final class CustomerService
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    public function getCustomers(): Collection
    {
        return Customer::orderBy('customer_name', 'asc')->get();
    }
}
