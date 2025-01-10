<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Origin;


use App\Models\Operation\Origin\JobOrder;
use Illuminate\Http\Request;

final class FilterService
{
    public function getVessel(Request $request)
    {
       $vessel = JobOrder::select('lr.vessel_id','lr.vessel_name')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->groupBy('lr.vessel_id','lr.vessel_name')
            ->where('origin.job_order.status','!=',3);
            if(!empty($request->search)){
                $vessel->where('lr.vessel_name','ilike',"%".$request->search."%");
            }
            if(!empty($request->voyage_number)){
                $vessel->where('lr.voyage_number','=',$request->voyage_number);
            }
            if(!empty($request->origin_id)){
                $vessel->where('lr.origin_office_id','=',$request->origin_office_id);
            }
        $vessel = $vessel->get();
        return $vessel;
    }

    public function getVoyage(Request $request)
    {
        $voyage = JobOrder::select('lr.voyage_number')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->groupBy('lr.voyage_number')
            ->where('origin.job_order.status','!=',3);
        if(!empty($request->search)){
            $voyage->where('lr.voyage_number','ilike',"%".$request->search."%");
        }
        if(!empty($request->vessel_id)){
            $voyage->where('lr.vessel_id','=',$request->vessel_id);
        }
        if(!empty($request->origin_id)){
            $voyage->where('lr.origin_office_id','=',$request->origin_office_id);
        }
        $voyage = $voyage->get();
        return $voyage;
    }

    public function getOrigin(Request $request)
    {
        $origin = JobOrder::select('lr.origin_office_id','of.office_name')
            ->join('origin.loading_report as lr','lr.loading_id','=','origin.job_order.loading_plan_id')
            ->join('master.office of','of.office_id','=','lr.origin_office_id')
            ->groupBy('lr.origin_office_id')
            ->where('origin.job_order.status','!=',3);
        if(!empty($request->search)){
            $origin->where('of.office_name','ilike',"%".$request->search."%");
        }
        if(!empty($request->vessel_id)){
            $origin->where('lr.vessel_id','=',$request->vessel_id);
        }
        if(!empty($request->voyage_number)){
            $origin->where('lr.voyage_number','=',$request->voyage_number);
        }
        $origin = $origin->get();
        return $origin;
    }


}
