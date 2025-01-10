<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Origin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use App\Models\Operation\Origin\JobOrder;

final class FilterService
{
    public function getVessel(?array $filters = []): object
    {
       $vessel = JobOrder::select('lr.vessel_id','lr.vessel_name')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->activeOrders('origin.job_order.status')
            ->when(!empty($filters['search']), function ($query) use ($filters) {
                return $query->where('lr.vessel_name','ilike',"%".$filters['search']."%");
            })
            ->when(!empty($filters['voyage_number']), function ($query) use ($filters) {
                return $query->where('lr.voyage_number','=',$filters['voyage_number']);
            })
            ->when(!empty($filters['origin_id']), function ($query) use ($filters) {
                return $query->where('lr.origin_office_id','=',$filters['origin_office_id']);
            })
            ->groupBy(['lr.vessel_id', 'lr.vessel_name'])
            ->get();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Vessel']),
            statusCode: Response::HTTP_OK,
            data: $vessel,
        );
    }

    public function getVoyage(?array $filters = [])
    {
        $voyages = JobOrder::select('lr.voyage_number')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->activeOrders('origin.job_order.status')
            ->when(!empty($filters['search']), function ($query) use ($filters) {
                return $query->where('lr.voyage_number','ilike',"%".$filters['search']."%");
            })
            ->when(!empty($filters['vessel_id']), function ($query) use ($filters) {
                return $query->where('lr.vessel_id','=',$filters['vessel_id']);
            })
            ->when(!empty($filters['origin_id']), function ($query) use ($filters) {
                return $query->where('lr.origin_office_id','=',$filters['origin_office_id']);
            })
            ->groupBy('lr.voyage_number')
            ->get();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Voyage']),
            statusCode: Response::HTTP_OK,
            data: $voyages,
        );
    }

    public function getOrigin(?array $filters = [])
    {
        $origin = JobOrder::select('lr.origin_office_id','of.city')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->activeOrders('origin.job_order.status')
            ->when(!empty($filters['search']), function ($query) use ($filters) {
                return $query->where('of.city','ilike',"%".$filters['search']."%");
            })
            ->when(!empty($filters['vessel_id']), function ($query) use ($filters) {
                return $query->where('lr.vessel_id','=',$filters['vessel_id']);
            })
            ->when(!empty($filters['voyage_number']), function ($query) use ($filters) {
                return $query->where('lr.voyage_number','=',$filters['voyage_number']);
            })
            ->groupBy(['lr.origin_office_id', 'of.city'])
            ->get();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Voyage']),
            statusCode: Response::HTTP_OK,
            data: $origin,
        );
    }


}
