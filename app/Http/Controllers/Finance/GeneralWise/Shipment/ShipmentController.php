<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralWise\Shipment;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Carbon\Carbon;

final class ShipmentController extends Controller
{


    /**
     * Display a listing of the resource.
     */
    public function index($type): View
    {
        if($type == "seaair"){
            $page = 'SEA AIR';
        }else if($type == "crossair"){
            $page = 'CROSS AIR';
        }else if($type == "seaimport"){
            $page = 'SEA IMPORT';
        }else if($type == "seaexport"){
            $page = 'SEA EXPORT';
        }else if($type == "airimport"){
            $page = 'AIR IMPORT';
        }else if($type == "airexport"){
            $page = 'AIR EXPORT';
        }else if($type == "warehouse"){
            $page = 'WAREHOUSE';
        }else if($type == "trucking"){
            $page = 'TRUCKING';
        }else if($type == "courier"){
            $page = 'COURIER';
        }
        return view('pages.finance.general-wise.shipment.index',compact('type','page'));
    }


    public function list(Request $request)
    {
        // Determine the base URL based on the request type
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $type = $request->type;
        if($type == "seaair"){
            $shipment_by = 'SEAAIR';
        }else if($type == "crossair"){
            $shipment_by = 'AIR';
        }else if($type == "seaimport"){
            $shipment_by = 'SEAIMPORT';
        }else if($type == "seaexport"){
            $shipment_by = 'SEAEXPORT';
        }else if($type == "airimport"){
            $shipment_by = 'AIRIMPORT';
        }else if($type == "airexport"){
            $shipment_by = 'AIREXPORT';
        }else if($type == "warehouse"){
            $shipment_by = 'WAREHOUSE';
        }else if($type == "trucking"){
            $shipment_by = 'TRUCKING';
        }else if($type == "courier"){
            $shipment_by = 'COURIER';
        }

        $apiUrl = $base . "/api/shippinginstruction";

        // Correct page calculation
        $page = ($request->input('start') / $request->input('length')) + 1;
        $limit = $request->input('length');
        $search = $request->input('search')['value'] ?? '';

        // Make the API request
        $response = Http::get($apiUrl, [
            'page' => $page,
            'limit' => $limit,
            'search' => $search,
            'status' => 6,
            'shipment_by'=>$shipment_by,
        ]);

        if ($response->successful()) {
            $apiData = $response->json();

            // Check if the expected data structure is present
            $data = $apiData['data'] ?? [];
            $recordsTotal = $apiData['records']['totalRecord'] ?? 0; // Total records
            $recordsFiltered = $apiData['records']['totalData'] ?? 0; // Filtered records

            // Prepare the response structure
            $result = [
                'draw' => intval($request->input('draw')),
                'recordsTotal' => $recordsTotal,
                'recordsFiltered' => $recordsFiltered,
                'data' => array_map(function ($item, $index) {
                    // Add DT_RowIndex to each item
                    $item['DT_RowIndex'] = $index + 1; // Adjust index for display
                    $item['checkbox'] = '<input type="checkbox" class="row-checkbox" value="' . $item['job_id'] . '" />';
                    // Add action buttons or links
                    $item['action'] = '';




                    $item['order']['qty'] = $item['order']['qty'] ?? ''; // Handle order.qty
                    $item['order']['pkgs'] = $item['order']['pkgs'] ?? ''; // Handle order.pkgs
                    $item['order']['gross_weight'] = $item['order']['gross_weight'] ?? ''; // Handle order.gross_weight
                     $item['order']['chw'] = $item['order']['chw'] ?? ''; // Handle order.chw
                    $item['order']['measurement'] = $item['order']['measurement'] ?? ''; // Handle order.measurement
                    if($item["shipment_by"] == "SEAAIR"){
                        $ship = "SA";
                        $destination = $item['port_destination_code'];
                        $item['eta'] = $item['eta'] != null ? Carbon::parse($item['eta'])->format('d M Y') : '-';
                    }else if($item["shipment_by"] == "AIR"){
                        $ship = "CA";
                        $destination = $item['port_destination_code'];
                        $item['eta'] = $item['eta'] != null ? Carbon::parse($item['eta'])->format('d M Y') : '-';
                    }else{
                        $ship = $item['shipment_by'];
                        $destination = $item['port_destination_name'];

                        $item['eta'] = $item['eta_new'] != null ? Carbon::parse($item['eta_new'])->format('d M Y') : '-';
                    }

                    $item['estimated_time_departure'] = $item['estimated_time_departure'] != null ? Carbon::parse($item['estimated_time_departure'])->format('d M Y') : '-';

                    $item['destination_name'] = $destination;

                    $item['shipment_type'] = $ship;
                    $item['vessel_voyage'] = $item['mother_vessel_name'].'-'.$item['voyage_number_mother'].(($item['voyage_vessel_origin'] ?? null) == null ? '' : '/'.$item['voyage_vessel_origin']);
                    if($item['feeder_vessel_name'] != null){
                        $item['vessel_voyage'] = $item['vessel_voyage'].'<br>'.$item['feeder_vessel_name'].'-'.$item['voyage_number_feeder'];
                    }

                    $item['atd'] = isset($item['departed']['tgl_aktual'])
                    ? Carbon::parse($item['departed']['tgl_aktual'])->format('d M Y')
                    : '-';

                    $item['ata'] = isset($item['arrived']['tgl_aktual'])
                    ? Carbon::parse($item['arrived']['tgl_aktual'])->format('d M Y')
                    : '-';

                    return $item;
                }, $data, array_keys($data)),
                'input' => $request->all() // Include the input data
            ];

            return response()->json($result);
        }

        // Handle API request failure
        return response()->json(['error' => 'Failed to fetch data from API'], 500);
    }

    public function origin(Request $request){
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $origin_url = $base . "/api/shippinginstruction/origin/name";
        $response_origin = Http::get($origin_url, [
            'shipment_by'=>$request->shipment_by ?? "",
        ]);

        if ($response_origin->successful()) {
            $apiData = $response_origin->json();
            return response()->json(
                [
                    'status'=>200,
                    'data'=>$apiData['data']
                ]);
        }else{
            return response()->json([status=>500,'error' => 'Failed to fetch data from API'], 500);
        }


    }

    public function destination(Request $request){
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $origin_url = $base . "/api/shippinginstruction/portdestination";
        $response_origin = Http::get($origin_url, [
            'shipment_by'=>$request->shipment_by ?? "",
        ]);

        if ($response_origin->successful()) {
            $apiData = $response_origin->json();
            return response()->json(
                [
                    'status'=>200,
                    'data'=>$apiData['data']
                ]);
        }else{
            return response()->json([status=>500,'error' => 'Failed to fetch data from API'], 500);
        }


    }

    public function vessel(Request $request){
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $origin_url = $base . "/api/shippinginstruction/vessel";
        $response_origin = Http::get($origin_url, [
            'shipment_by'=>$request->shipment_by ?? "",
        ]);

        if ($response_origin->successful()) {
            $apiData = $response_origin->json();
            return response()->json(
                [
                    'status'=>200,
                    'data'=>$apiData['data']
                ]);
        }else{
            return response()->json([status=>500,'error' => 'Failed to fetch data from API'], 500);
        }


    }

    public function etamerge(Request $request){
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $origin_url = $base . "/api/shippinginstruction/etamerge";
        $response_origin = Http::get($origin_url, [
            'shipment_by'=>$request->shipment_by ?? "",
        ]);

        if ($response_origin->successful()) {
            $apiData = $response_origin->json();
            return response()->json(
                [
                    'status'=>200,
                    'data'=>$apiData['data']
                ]);
        }else{
            return response()->json([status=>500,'error' => 'Failed to fetch data from API'], 500);
        }

    }

    public function detail(string $type, string $uuid): View
    {
        $base = ($type == "seaair" || $type == "crossair") ? env('API_ORIGIN') : env('API_DXB');
        
        $shipmentResponse = Http::get($base . "/api/shippinginstruction/{$uuid}");
        
        if (!$shipmentResponse->successful()) {
            abort(404);
        }

        $shipment = $shipmentResponse->json()['data'];

        $orderDetailResponse = Http::get($base . "/api/orderdetail/{$uuid}");
        
        if (!$orderDetailResponse->successful()) {
            abort(404);
        }

        $dimensionResponse = Http::get($base . "/api/dimension/{$uuid}");

        if (!$dimensionResponse->successful()) {
            abort(404);
        }

        // Get loading plan ID from shipment response
        $loadingPlanId = $shipment['loading_plan_dxb'] ?? null;
        
        if ($loadingPlanId) {
            $url = env('API_DXB') . "/api/loadingplan/{$loadingPlanId}";
            $loadingPlanResponse = Http::get($url);

            if (!$loadingPlanResponse->successful()) {
                abort(404); 
            }
            $loadingPlan = $loadingPlanResponse->json()['data'] ?? null;

            // Get loading plan detail
            $loadingPlanDetailUrl = env('API_DXB') . "/api/loadingplandetail/{$loadingPlanId}";
            $loadingPlanDetailResponse = Http::get($loadingPlanDetailUrl);

            if (!$loadingPlanDetailResponse->successful()) {
                $loadingPlanDetail = null;
            } else {
                $loadingPlanDetail = $loadingPlanDetailResponse->json()['data'] ?? null;
            }
        } else {
            $loadingPlan = null;
            $loadingPlanDetail = null;
        }

        $ctdNumber = $shipment['ctd_number'] ?? null;

        if($ctdNumber){
            $jobtruckdeliveryResponse = Http::get($base . "/api/jobtruckdelivery?ctd_number={$ctdNumber}");
            if($jobtruckdeliveryResponse->successful()){
                $jobtruckdelivery = $jobtruckdeliveryResponse->json()['data'] ?? null;
            }
        }

        // Get destination handling agent data
        $controlOfficeResponse = Http::get($base . "/api/controloffice/{$uuid}");
        if ($controlOfficeResponse->successful()) {
            $controlOffice = $controlOfficeResponse->json()['data'] ?? null;
        } else {
            $controlOffice = null;
        }

        // Get destination partner data
        $destinationPartnerResponse = Http::get($base . "/api/patner/{$uuid}");
        if ($destinationPartnerResponse->successful()) {
            $destinationPartner = $destinationPartnerResponse->json()['data'] ?? null;
        } else {
            $destinationPartner = null;
        }

        // Get sales office data
        $salesOfficeResponse = Http::get($base . "/api/salesoffice/{$uuid}");
        if ($salesOfficeResponse->successful()) {
            $salesOffice = $salesOfficeResponse->json()['data'] ?? null;
        } else {
            $salesOffice = null;
        }

        // Get sales person data
        $salesPersonResponse = Http::get($base . "/api/salesperson/{$uuid}");
        if ($salesPersonResponse->successful()) {
            $salesPerson = $salesPersonResponse->json()['data'] ?? null;
        } else {
            $salesPerson = null;
        }

        // Get order document data
        $orderDocumentResponse = Http::get($base . "/api/orderdocument?job_id={$uuid}");
        if ($orderDocumentResponse->successful()) {
            $orderDocument = $orderDocumentResponse->json()['data'] ?? null;
        } else {
            $orderDocument = null;
        }

        // Get chat section data
        $chatOriginResponse = Http::get($base . "/api/notedsection?job_id={$uuid}&chat_section=1");
        if ($chatOriginResponse->successful()) {
            $chatOrigin = $chatOriginResponse->json()['data'] ?? null;
        } else {
            $chatOrigin = null;
        }

        $chatDxbResponse = Http::get($base . "/api/notedsection?job_id={$uuid}&chat_section=2"); 
        if ($chatDxbResponse->successful()) {
            $chatDxb = $chatDxbResponse->json()['data'] ?? null;
        } else {
            $chatDxb = null;
        }

        $chatAgentResponse = Http::get($base . "/api/notedsection?job_id={$uuid}&chat_section=3");
        if ($chatAgentResponse->successful()) {
            $chatAgent = $chatAgentResponse->json()['data'] ?? null;
        } else {
            $chatAgent = null;
        }

        // Get onboard date (status_id = 7, Vessel Departed)
        $onboardResponse = Http::get($base . "/api/historijob", [
            'status_id' => '7',
            'job_id' => $uuid,
            'is_deleted' => 'false'
        ]);
        if ($onboardResponse->successful()) {
            $onboardData = $onboardResponse->json()['data'][0] ?? null;
            $shipment['onBoardDate'] = $onboardData['tgl_aktual'] ?? null;
        }

        // Get actual arrival date (status_id = 30, Arrived In Jebel Ali/Arrived in Transit Hub) 
        $actualArrivalResponse = Http::get($base . "/api/historijob", [
            'status_id' => '30',
            'job_id' => $uuid,
            'is_deleted' => 'false'
        ]);
        if ($actualArrivalResponse->successful()) {
            $actualArrivalData = $actualArrivalResponse->json()['data'][0] ?? null;
            $shipment['actualArrivalDate'] = $actualArrivalData['tgl_aktual'] ?? null;
        }

        $orderDetail = $orderDetailResponse->json()['data'];
        $dimension = $dimensionResponse->json()['data'];
        
        $shipment['order_detail'] = $orderDetail;
        $shipment['dimension'] = $dimension;
        $shipment['loading_plan'] = $loadingPlan;
        $shipment['loading_plan_detail'] = $loadingPlanDetail;
        $shipment['jobtruckdelivery'] = $jobtruckdelivery;
        $shipment['destination_handling_agent'] = $controlOffice;
        $shipment['destination_partner'] = $destinationPartner;
        $shipment['sales_office'] = $salesOffice;
        $shipment['sales_person'] = $salesPerson;
        $shipment['order_document'] = $orderDocument;
        $shipment['chat_origin'] = $chatOrigin;
        $shipment['chat_dxb'] = $chatDxb;
        $shipment['chat_agent'] = $chatAgent;
        
        return view('pages.finance.general-wise.shipment.detail', compact('shipment', 'type'));
    }



}
