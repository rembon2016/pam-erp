<?php

declare(strict_types=1);

namespace App\Service\Operation\Origin;

use App\Functions\ObjectResponse;
use Illuminate\Support\Benchmark;
use App\Models\Operation\Origin\ShippingInstruction;

final class ShippingInstructionService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Get the shipping instruction data by customer_id field condition
     * Whether the data are empty or exist
     *
     * @param string $condition: exists,empty
     * @param array $columns select only specific columns
     *
     * @return object
     */
    public function getShippingInstructionByCustomerCondition(string $condition = 'exists'): object
    {
        $shippingInstructions = ShippingInstruction::query()
            ->select(['job_id', 'shipment_by', 'origin_name', 'ctd_number', 'customer_id', 'customer_name', 'date_created'])
            ->{$condition == 'exists' ? "whereNotNull" : "whereNull"}('customer_id')
            ->orderBy('date_created', 'desc')
            ->paginate(10);

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Shipping Instruction']),
            data: $shippingInstructions
        );
    }
}
