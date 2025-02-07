<?php

declare(strict_types=1);

namespace App\Service\Finance\GeneralWise;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

final class GeneralWiseService
{
    public function getVessels($filters = []): object
    {
        $originVessel = DB::table('origin.shipping_instruction')->select([
                'mother_vessel_name',
                'mother_vessel_id',
                'voyage_number_mother',
                'port_of_destination',
                'loading_id'
            ])
            ->whereNotNull('mother_vessel_name')
            ->where("status","!=",3)
            ->when(!empty($filters['q']), function ($query) use ($filters) {
                return $query->where(DB::raw("CONCAT(COALESCE(mother_vessel_name, ''), ' - ' ,COALESCE(voyage_number_mother, ''))"), 'ILIKE', "%{$filters['q']}%");
            })
            ->distinct();

        $dxbVessel = DB::table('dxb.shipping_instruction')->select([
                'mother_vessel_name',
                'mother_vessel_id',
                'voyage_number_mother',
                'port_of_destination',
                'loading_id'
            ])
            ->whereNotNull('mother_vessel_name')
            ->where("status","!=",3)
            ->when(!empty($filters['q']), function ($query) use ($filters) {
                return $query->where(DB::raw("CONCAT(COALESCE(mother_vessel_name, ''), ' - ' ,COALESCE(voyage_number_mother, ''))"), 'ILIKE', "%{$filters['q']}%");
            })
            ->distinct();

        $vesselData = $originVessel->union($dxbVessel)->get();

        $vesselData = $vesselData->unique(function($i, $key){
            return $i->mother_vessel_name.$i->mother_vessel_id.($i->voyage_number_mother ?? "");
        })->sortBy('mother_vessel_name')->values();

        return ObjectResponse::success(
            message: 'Successfully Fetch Vessel sData from API!',
            statusCode: Response::HTTP_OK,
            data: $vesselData
        );
    }

    public function getOrigins($filters = []): object
    {
        $originCountry = DB::table('origin.shipping_instruction')->select([
                'origin_name'
            ])
            ->whereNotNull('origin_name')
            ->where("status","!=",3)
            ->when(!empty($filters['q']), function ($query) use ($filters) {
                return $query->where('origin_name', 'ilike', '%' . $filters['q'] . '%');
            })
            ->orderBy('origin_name','ASC')
            ->distinct('origin_name');

        $originData = $originCountry->get();

        return ObjectResponse::success(
            message: 'Successfully Fetch Origin Data from API!',
            statusCode: Response::HTTP_OK,
            data: $originData
        );
    }

    public function getVoyages($filters = []): object
    {
        $originVoyage = DB::table('origin.shipping_instruction')->select([
                'port_of_destination',
                'voyage_number_mother',
                'loading_id',
                'to_consignee'
            ])
            ->whereNotNull('voyage_number_mother')
            ->where("status","!=",3)
            ->when(!empty($filters['q']), function ($query) use ($filters) {
                return $query->where('voyage_number_mother', 'ilike', '%' . $filters['q'] . '%');
            })
            ->distinct('voyage_number_mother');

        $dxbVoyage = DB::table('dxb.shipping_instruction')->select([
                'port_of_destination',
                'voyage_number_mother',
                'loading_id',
                'to_consignee'
            ])
            ->whereNotNull('voyage_number_mother')
            ->where("status","!=",3)
            ->when(!empty($filters['q']), function ($query) use ($filters) {
                return $query->where('voyage_number_mother', 'ilike', '%' . $filters['q'] . '%');
            })
            ->distinct('voyage_number_mother');

        $voyageData = $originVoyage->union($dxbVoyage)->get();

        return ObjectResponse::success(
            message: 'Successfully Fetch Voyage Data from API!',
            statusCode: Response::HTTP_OK,
            data: $voyageData
        );
    }
}
