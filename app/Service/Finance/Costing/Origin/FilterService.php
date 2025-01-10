<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Origin;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use App\Models\Operation\Origin\JobOrder;
use App\Models\Operation\Origin\JobOrderAir;
use Illuminate\Http\Request;

final class FilterService
{
    public function getVessel(?array $filters = []): object
    {
       $vessel = JobOrder::select('lr.vessel_id','lr.vessel_name')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->activeOrders('origin.job_order.status')
            ->when(!empty($filters['search']), function ($query) use ($filters) {
                return $query->where('lr.vessel_name','ilike',"%".$filters['search']."%");
            })
            ->when(!empty($filters['voyage_number']), function ($query) use ($filters) {
                return $query->where('lr.voyage_number','=',$filters['voyage_number']);
            })
            ->when(!empty($filters['city']), function ($query) use ($filters) {
                return $query->where('of.city','=',$filters['city']);
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
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->activeOrders('origin.job_order.status')
            ->when(!empty($filters['search']), function ($query) use ($filters) {
                return $query->where('lr.voyage_number','ilike',"%".$filters['search']."%");
            })
            ->when(!empty($filters['vessel_id']), function ($query) use ($filters) {
                return $query->where('lr.vessel_id','=',$filters['vessel_id']);
            })
            ->when(!empty($filters['city']), function ($query) use ($filters) {
                return $query->where('lr.city','=',$filters['city']);
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
        $origin = JobOrder::select('of.city')
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
            ->groupBy(['of.city'])
            ->get();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Origin']),
            statusCode: Response::HTTP_OK,
            data: $origin,
        );
    }

    public function getMawb(Request $request)
    {
        $mawb = JobOrderAir::select('lp.mawb_number')
                ->join('origin.loading_plan as lp','lp.plan_id','=','origin.job_order_air.loading_plan_id')
                ->groupBy('mawb_number')
                ->where('origin.job_order_air.status','!=',3);
        if(!empty($request->search)){
            $mawb->where('lp.mawb_number','ilike',"%".$request->search."%");
        }
        if(!empty($request->carrier_id)){
            $mawb->where('lp.carrier_id','=',$request->carrier_id);
        }
        $mawb = $mawb->get();
    }

    public function getCarrier(Request $request)
    {
        $carrier = JobOrderAir::select('lp.carrier_id','lp.carrier_name')
                ->join('origin.loading_plan as lp','lp.plan_id','=','origin.job_order_air.loading_plan_id')
                ->groupBy('lp.carrier_id','lp.carrier_name')
                ->where('origin.job_order_air.status','!=',3);
        if(!empty($request->search)){
            $carrier->where('lp.carrier_name','ilike',"%".$request->search."%");
        }
        if(!empty($request->mawb_number)){
            $carrier->where('lp.mawb_number','=',$request->mawb_number);
        }
        $carrier = $carrier->get();

        return $carrier;
    }
}
