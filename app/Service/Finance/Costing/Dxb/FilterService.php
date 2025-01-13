<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Dxb;


use App\Models\Operation\Dxb\JobOrder;
use Illuminate\Http\Request;

final class FilterService
{
    public function getVessel(?array $filters = [])
    {
       $vessel = JobOrder::select('lr.vessel_id','lr.vessel_name')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->groupBy('lr.vessel_id','lr.vessel_name')
            ->where('dxb.job_order.status','!=',3);
            if(!empty($filters['search'])){
                $vessel->where('lr.vessel_name','ilike',"%".$filters['search']."%");
            }
            if(!empty($filters['voyage_number'])){
                $vessel->where('lr.voyage_number','=',$filters['voyage_number']);
            }
            if(!empty($filters['city'])){
                $vessel->where('of.city','=',$filters['city']);
            }
            if(!empty($filters['job_order_type'])){
                $vessel->where('dxb.job_order.job_order_type','=',$filters['job_order_type']);
            }
        $vessel = $vessel->get();
        return $vessel;
    }

    public function getVoyage(?array $filters = [])
    {
        $voyage = JobOrder::select('lr.voyage_number')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.offices as of','of.office_id','=','lr.origin_office_id')
            ->groupBy('lr.voyage_number')
            ->where('dxb.job_order.status','!=',3);
        if(!empty($filters['search'])){
            $voyage->where('lr.voyage_number','ilike',"%".$filters['search']."%");
        }
        if(!empty($filters['vessel_id'])){
            $voyage->where('lr.vessel_id','=',$filters['vessel_id']);
        }
        if(!empty($filters['city'])){
            $voyage->where('of.city','=',$filters['city']);
        }
        if(!empty($filters['job_order_type'])){
            $voyage->where('dxb.job_order.job_order_type','=',$filters['job_order_type']);
        }
        $voyage = $voyage->get();
        return $voyage;
    }

    public function getOrigin(?array $filters = [])
    {
        $origin = JobOrder::select('of.city')
            ->join('dxb.loading_report as lr','lr.loading_id','=','dxb.job_order.loading_plan_id')
            ->join('master.office of','of.office_id','=','lr.origin_office_id')
            ->groupBy('of.city')
            ->where('dxb.job_order.status','!=',3);
        if(!empty($filters['search'])){
            $origin->where('of.city','ilike',"%".$filters['search']."%");
        }
        if(!empty($filters['vessel_id'])){
            $origin->where('lr.vessel_id','=',$filters['vessel_id']);
        }
        if(!empty($filters['voyage_number'])){
            $origin->where('lr.voyage_number','=',$filters['voyage_number']);
        }
        if(!empty($filters['job_order_type'])){
            $origin->where('dxb.job_order.job_order_type','=',$filters['job_order_type']);
        }
        $origin = $origin->get();
        return $origin;
    }

    public function getMawb(?array $filters = [])
    {
        $mawb = JobOrder::select('lp.mawb_number')
                ->join('dxb.loading_plan as lp','lp.plan_id','=','dxb.job_order_air.loading_plan_id')
                ->groupBy('mawb_number')
                ->where('dxb.job_order_air.status','!=',3);
        if(!empty($filters['search'])){
            $mawb->where('lp.mawb_number','ilike',"%".$filters['search']."%");
        }
        if(!empty($filters['carrier_id'])){
            $mawb->where('lp.carrier_id','=',$filters['carrier_id']);
        }
        if(!empty($filters['job_order_type'])){
            $mawb->where('dxb.job_order.job_order_type','=',$filters['job_order_type']);
        }
        $mawb = $mawb->get();

        return $mawb;
    }

    public function getCarrier(?array $filters = [])
    {
        $carrier = JobOrder::select('lp.carrier_id','lp.carrier_name')
                ->join('dxb.loading_plan as lp','lp.plan_id','=','dxb.job_order_air.loading_plan_id')
                ->groupBy('lp.carrier_id','lp.carrier_name')
                ->where('dxb.job_order_air.status','!=',3);
        if(!empty($filters['search'])){
            $carrier->where('lp.carrier_name','ilike',"%".$filters['search']."%");
        }
        if(!empty($filters['mawb_number'])){
            $carrier->where('lp.mawb_number','=',$filters['mawb_number']);
        }
        if(!empty($filters['job_order_type'])){
            $carrier->where('dxb.job_order.job_order_type','=',$filters['job_order_type']);
        }
        $carrier = $carrier->get();
        return $carrier;
    }



}
