<?php

declare(strict_types=1);

namespace App\Service\Operation\Origin;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Benchmark;
use Illuminate\Database\Eloquent\Collection;
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
            ->with(['jobOrder', 'jobOrderAir', 'jobOrderDetail', 'billingCustomer'])
            ->when($condition == 'empty', function ($query) {
                return $query->whereNull('customer_id');
            })
            ->when($condition == 'exists', function ($query) {
                return $query
                    ->whereNotNull('customer_id')
                    ->whereHas('billingCustomer');
            })
            ->where(function ($query) {
                return $query
                    ->whereHas('jobOrder')
                    ->orWhereHas('jobOrderAir');
            })
            ->orderBy('date_created', 'desc');

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Shipping Instruction']),
            data: $shippingInstructions
        );
    }

    public function getShippingInstructionsByJobId(string|array $job_orders): Collection
    {
        $data = ShippingInstruction::select(['job_id', 'ctd_number', 'customer_id'])
            ->withSum('order', 'chw')
            ->with(['billingCustomer'])
            ->whereHas('billingCustomer')
            ->whereIn('job_id', is_array($job_orders) ? $job_orders : [$job_orders])
            ->get();

        return $data;
    }

    public function updateBillingCustomer(string $customer_id, array|string $job_orders): object
    {
        try {
            ShippingInstruction::whereIn('job_id', is_array($job_orders) ? $job_orders : [$job_orders])->update([
                'customer_id' => $customer_id
            ]);

            return ObjectResponse::success(
                message: "Billing Customer Successfully Updated to Related CTD",
                statusCode: Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: "Failed to Update Billing Customer on Related CTD",
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR
            );
        }
    }
}
