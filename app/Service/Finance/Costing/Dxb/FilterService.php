<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Dxb;


use App\Models\Operation\Dxb\JobOrder;
use Illuminate\Http\Request;

final class FilterService
{
    public function getVessel(Request $request)
    {
       $vessel = JobOrder::select('lr.vessel_id','lr.vessel_name')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->groupBy('lr.vessel_id','lr.vessel_name')
            ->where('dxb.job_order.status','!=',3);
            if(!empty($request->search)){
                $vessel->where('lr.vessel_name','ilike',"%".$request->search."%");
            }
            if(!empty($request->voyage_number)){
                $vessel->where('lr.voyage_number','=',$request->voyage_number);
            }
            if(!empty($request->city)){
                $vessel->where('of.city','=',$request->city);
            }
            if(!empty($request->job_order_type)){
                $vessel->where('dxb.job_order.job_order_type','=',$request->job_order_type);
            }
        $vessel = $vessel->get();
        return $vessel;
    }

    public function getVoyage(Request $request)
    {
        $voyage = JobOrder::select('lr.voyage_number')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->groupBy('lr.voyage_number')
            ->where('dxb.job_order.status','!=',3);
        if(!empty($request->search)){
            $voyage->where('lr.voyage_number','ilike',"%".$request->search."%");
        }
        if(!empty($request->vessel_id)){
            $voyage->where('lr.vessel_id','=',$request->vessel_id);
        }
        if(!empty($request->city)){
            $voyage->where('of.city','=',$request->city);
        }
        if(!empty($request->job_order_type)){
            $vessel->where('dxb.job_order.job_order_type','=',$request->job_order_type);
        }
        $voyage = $voyage->get();
        return $voyage;
    }

    public function getOrigin(Request $request)
    {
        $origin = JobOrder::select('of.city')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.office of','of.office_id','=','lr.origin_office_id')
            ->groupBy('of.city')
            ->where('dxb.job_order.status','!=',3);
        if(!empty($request->search)){
            $origin->where('of.city','ilike',"%".$request->search."%");
        }
        if(!empty($request->vessel_id)){
            $origin->where('lr.vessel_id','=',$request->vessel_id);
        }
        if(!empty($request->voyage_number)){
            $origin->where('lr.voyage_number','=',$request->voyage_number);
        }
        if(!empty($request->job_order_type)){
            $vessel->where('dxb.job_order.job_order_type','=',$request->job_order_type);
        }
        $origin = $origin->get();
        return $origin;
    }

    public function getMawb(Request $request)
    {
        $mawb = JobOrder::select('lp.mawb_number')
                ->join('dxb.loading_plan as lp','lp.plan_id','=','dxb.job_order_air.loading_plan_id')
                ->groupBy('mawb_number')
                ->where('dxb.job_order_air.status','!=',3);
        if(!empty($request->search)){
            $mawb->where('lp.mawb_number','ilike',"%".$request->search."%");
        }
        if(!empty($request->carrier_id)){
            $mawb->where('lp.carrier_id','=',$request->carrier_id);
        }
        if(!empty($request->job_order_type)){
            $vessel->where('dxb.job_order.job_order_type','=',$request->job_order_type);
        }
        $mawb = $mawb->get();
    }

    public function getCarrier(Request $request)
    {
        $carrier = JobOrder::select('lp.carrier_id','lp.carrier_name')
                ->join('dxb.loading_plan as lp','lp.plan_id','=','dxb.job_order_air.loading_plan_id')
                ->groupBy('lp.carrier_id','lp.carrier_name')
                ->where('dxb.job_order_air.status','!=',3);
        if(!empty($request->search)){
            $carrier->where('lp.carrier_name','ilike',"%".$request->search."%");
        }
        if(!empty($request->mawb_number)){
            $carrier->where('lp.mawb_number','=',$request->mawb_number);
        }
        if(!empty($request->job_order_type)){
            $vessel->where('dxb.job_order.job_order_type','=',$request->job_order_type);
        }
        $carrier = $carrier->get();
        return $carrier;
    }



}
