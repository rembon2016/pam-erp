<?php

declare(strict_types=1);

namespace App\Service\Operation\Origin;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Benchmark;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Collection;
use App\Models\Operation\Origin\ShippingInstruction;
use App\Models\Operation\Dxb\ShippingInstruction as OriginShippingInstruction;

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
        $customer_column = $condition == 'exists' ? 'c.customer_name' : 'si.customer_name';
        $originQuery = DB::table('origin.shipping_instruction as si')->select([
            'si.job_id',
            'si.ctd_number as ctd_number',
            DB::raw("$customer_column AS customer_name"),
            'si.origin_name as origin_name',
            'sio.qty as qty',
            'sio.chw as chw',
            DB::raw('COALESCE(jo.job_order_code, joa.job_order_code) AS job_order_code'),
        ])
        ->join('origin.si_order as sio', 'si.job_id', '=', 'sio.job_id')
        ->join(DB::raw('origin.job_order_detail as jod'), 'si.job_id', '=', 'jod.job_id')
        ->leftJoin(DB::raw('origin.job_order as jo'), function ($join) {
            $join->on('jo.job_order_id', '=', 'jod.job_order_id')->where('si.shipment_by', '=', 'SEAAIR');
        })
        ->leftJoin(DB::raw('origin.job_order_air as joa'), function ($join) {
            $join->on('joa.job_order_id', '=', 'jod.job_order_id')->where('si.shipment_by', '=', 'AIR');
        })
        ->where(function ($query) {
            $query->whereNotNull('jo.job_order_code')->orWhereNotNull('joa.job_order_code');
        })->when($condition == 'empty', function ($query) {
            return $query->whereNull('si.customer_id');
        })
        ->when($condition == 'exists', function ($query) {
            return $query->whereNotNull('si.customer_id')->join('accounting.customer as c', 'si.customer_id', '=', 'c.customer_id');
        })->orderBy('si.date_created', 'desc');

        $dxbQuery = DB::table('dxb.shipping_instruction as si')->select([
            'si.job_id',
            'si.ctd_number as ctd_number',
            DB::raw("$customer_column AS customer_name"),
            'si.origin_name as origin_name',
            'sio.qty as qty',
            'sio.chw as chw',
            DB::raw('jo.job_order_code AS job_order_code'),
        ])
        ->join('dxb.si_order as sio', 'si.job_id', '=', 'sio.job_id')
        ->join(DB::raw('dxb.job_order_detail as jod'), 'si.job_id', '=', 'jod.job_id')
        ->leftJoin('dxb.job_order as jo', 'jo.job_order_id', '=', 'jod.job_order_id')
        ->when($condition == 'empty', function ($query) {
            return $query->whereNull('si.customer_id');
        })
        ->when($condition == 'exists', function ($query) {
            return $query->whereNotNull('si.customer_id')->join('accounting.customer as c', 'si.customer_id', '=', 'c.customer_id');
        })->orderBy('si.date_created', 'desc');

        $shippingInstructions = $originQuery->union($dxbQuery)->get();

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
