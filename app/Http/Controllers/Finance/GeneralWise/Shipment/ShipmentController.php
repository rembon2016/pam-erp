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
        // Initialize default values
        $page = '';
        $shipment_by = '';

        // Set page and shipment_by based on type
        switch($type) {
            case "seaair":
                $page = 'SEA AIR';
                $shipment_by = 'SEAAIR';
                break;
            case "crossair":
                $page = 'CROSS AIR';
                $shipment_by = 'AIR';
                break;
            case "seaimport":
                $page = 'SEA IMPORT';
                $shipment_by = 'SEAIMPORT';
                break;
            case "seaexport":
                $page = 'SEA EXPORT';
                $shipment_by = 'SEAEXPORT';
                break;
            case "airimport":
                $page = 'AIR IMPORT';
                $shipment_by = 'AIRIMPORT';
                break;
            case "airexport":
                $page = 'AIR EXPORT';
                $shipment_by = 'AIREXPORT';
                break;
            case "warehouse":
                $page = 'WAREHOUSE';
                $shipment_by = 'WAREHOUSE';
                break;
            case "trucking":
                $page = 'TRUCKING';
                $shipment_by = 'TRUCKING';
                break;
            case "courier":
                $page = 'COURIER';
                $shipment_by = 'COURIER';
                break;
            default:
                $page = 'UNKNOWN';
                $shipment_by = 'UNKNOWN';
        }

        return view('pages.finance.general-wise.shipment.index', 
            compact('type', 'page', 'shipment_by'));
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

        $search = $request->input('search');
        if (is_array($search)) {
            $search = $search['value'] ?? '';
        }

        $params = [
            'page' => $page,
            'limit' => $limit,
            'search' => $search,
            'status' => 6,
            'shipment_by' => $shipment_by,
        ];

        // Add status_shipment to params if it exists in request
        if ($request->filled('status_shipment')) {
            $params['status_shipment'] = $request->status_shipment;
        }

        if ($request->filled('origin_name')) {
            $params['origin_name'] = $request->origin_name;
        }

        if ($request->filled('port_destination_name')) {
            $params['port_destination_name'] = $request->port_destination_name;
        }

        if ($request->filled('mother_vessel_name')) {
            $params['mother_vessel_name'] = $request->mother_vessel_name;
        }

        if ($request->filled('eta')) {
            $params['eta'] = $request->eta;
        }

        if ($request->filled('voyage_number_mother')) {
            $params['voyage_number_mother'] = $request->voyage_number_mother;
        }

        if ($request->filled('mother_vessel_id')) {
            $params['mother_vessel_id'] = $request->mother_vessel_id;
        }

        if ($request->filled('carrier_id')) {
            $params['carrier_id'] = $request->carrier_id;
        }

        if ($request->filled('shipper_id')) {
            $params['from_shipper'] = $request->shipper_id;
        }

        if ($request->filled('consignee_id')) {
            $params['to_consignee'] = $request->consignee_id;
        }

        if ($request->has('etd')) {
            $etdValue = is_array($request->etd) ? implode(',', $request->etd) : $request->etd;
            $params['etd'] = $etdValue;

            $queryString = http_build_query(array_filter($params));
            $queryString = str_replace('etd=', 'etd[]=', $queryString);
            $queryString = str_replace('%2C', ',', $queryString);
            $fullUrl = $apiUrl . '?' . $queryString;
        }

        $queryString = http_build_query(array_filter($params));
        $queryString = str_replace('etd=', 'etd[]=', $queryString);
        $fullUrl = $apiUrl . '?' . $queryString;

        \Log::info('Full URL:', ['url' => $fullUrl]);

        $response = Http::withHeaders([
            'Accept' => 'application/json',
        ])->get($fullUrl);


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
                    $item['DT_RowIndex'] = $index + 1;
                    $item['checkbox'] = '<input type="checkbox" class="row-checkbox" value="' . $item['job_id'] . '" />';
                    $item['action'] = '';

                    // Handle nested properties with null coalescing operator
                    $item['order'] = $item['order'] ?? [];
                    $item['order']['qty'] = $item['order']['qty'] ?? '-';
                    $item['order']['pkgs'] = $item['order']['pkgs'] ?? '-';
                    $item['order']['gross_weight'] = $item['order']['gross_weight'] ?? '-';
                    $item['order']['chw'] = $item['order']['chw'] ?? '-';
                    $item['order']['chargeableWeight'] = $item['order']['chargeableWeight'] ?? '-';
                    $item['order']['measurement'] = $item['order']['measurement'] ?? '-';

                    // Handle days_closed.days
                    if (isset($item['days_closed']) && isset($item['days_closed']['days'])) {
                        $item['days_closed']['days'] = $item['days_closed']['days'];
                    } else {
                        // Create the structure if it doesn't exist
                        $item['days_closed'] = ['days' => '-'];
                    }

                    // Rest of your transformations
                    if($item["shipment_by"] == "SEAAIR"){
                        $ship = "SA";
                        $destination = $item['port_destination_code'] ?? '-';
                        $item['eta'] = $item['eta'] != null ? Carbon::parse($item['eta'])->format('d M Y') : '-';
                    }else if($item["shipment_by"] == "AIR"){
                        $ship = "CA";
                        $destination = $item['port_destination_code'] ?? '-';
                        $item['eta'] = $item['eta'] != null ? Carbon::parse($item['eta'])->format('d M Y') : '-';
                    }else{
                        $ship = $item['shipment_by'] ?? '-';
                        $destination = $item['port_destination_name'] ?? '-';
                        $item['eta'] = $item['eta_new'] != null ? Carbon::parse($item['eta_new'])->format('d M Y') : '-';
                    }

                    $item['estimated_time_departure'] = $item['estimated_time_departure'] != null ? 
                        Carbon::parse($item['estimated_time_departure'])->format('d M Y') : '-';

                    $item['destination_name'] = $destination;
                    $item['shipment_type'] = $ship;

                    // Handle vessel_voyage with null checks
                    $motherVesselName = $item['mother_vessel_name'] ?? '';
                    $voyageNumberMother = $item['voyage_number_mother'] ?? '';
                    $voyageVesselOrigin = $item['voyage_vessel_origin'] ?? '';
                    
                    $item['vessel_voyage'] = $motherVesselName . '-' . $voyageNumberMother . 
                        ($voyageVesselOrigin ? '/' . $voyageVesselOrigin : '');

                    if(isset($item['feeder_vessel_name']) && $item['feeder_vessel_name'] != null){
                        $feederVesselName = $item['feeder_vessel_name'];
                        $voyageNumberFeeder = $item['voyage_number_feeder'] ?? '';
                        $item['vessel_voyage'] .= '<br>' . $feederVesselName . '-' . $voyageNumberFeeder;
                    }

                    // Handle departed and arrived dates
                    $item['atd'] = isset($item['departed']['tgl_aktual']) ?
                        Carbon::parse($item['departed']['tgl_aktual'])->format('d M Y') : '-';

                    $item['ata'] = isset($item['arrived']['tgl_aktual']) ?
                        Carbon::parse($item['arrived']['tgl_aktual'])->format('d M Y') : '-';

                    return $item;
                }, $data, array_keys($data)),
                'input' => $request->all()
            ];
            return response()->json($result);

        }

        // Handle API request failure
        return response()->json(['error' => 'Failed to fetch data from API'], 500);
    }

    public function origin(Request $request){
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

        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        
        if ($type == "seaair" || $type == "crossair") {
            $origin_url = $base . "/api/shippinginstruction/origin/name";
        } else {
            $origin_url = $base . "/api/shippinginstruction/origin?shipment_by=" . $shipment_by;
        }
    
        $response_origin = Http::get($origin_url, [
            'shipment_by' => $shipment_by,
        ]);
    
        if ($response_origin->successful()) {
            $apiData = $response_origin->json();
            return response()->json([
                'status' => 200,
                'data' => $apiData['data']
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'error' => 'Failed to fetch data from API'
            ], 500);
        }
    }

    public function destination(Request $request){
        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }

        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        $origin_url = $base . "/api/shippinginstruction/portdestination";
        $response_origin = Http::get($origin_url, [
            'shipment_by' => $shipment_by ?? "",
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
        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        if ($request->type == "seaair" || $request->type == "crossair") {
            $base = env('API_ORIGIN');
        } else {
            $base = env('API_DXB');
        }
        $origin_url = $base . "/api/shippinginstruction/etamerge";
        $response_origin = Http::get($origin_url, [
            'shipment_by'=>$shipment_by ?? "",
        ]);


        \Log::info('Response:', ['response' => $response_origin]);
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
        $base = ($type == "seaair" || $type == "air") ? env('API_ORIGIN') : env('API_DXB');
        
        $finalUrl = $base . "/api/shippinginstruction/{$uuid}";
        $shipmentResponse = Http::get($finalUrl);
        

        if (!$shipmentResponse->successful()) {
            abort(404);
        }

        $shipment = $shipmentResponse->successful() ? $shipmentResponse->json()['data'] : null;

        $orderDetailResponse = Http::get($base . "/api/orderdetail/{$uuid}");

        if (!$orderDetailResponse->successful()) {
            abort(404);
        }

        $dimensionResponse = Http::get($base . "/api/dimension/{$uuid}");

        if (!$dimensionResponse->successful()) {
            abort(404);
        }

        // Get loading plan ID from shipment response
        if ($type == 'air') {
            $loadingPlanId = $shipment['loading_id'] ?? null;
            $baseEnv = 'API_ORIGIN';
        } else {
            $loadingPlanId = $shipment['loading_plan_dxb'] ?? null;
            $baseEnv = 'API_DXB';
        }
        
        if ($loadingPlanId) {
            $url = env($baseEnv) . "/api/loadingplan/{$loadingPlanId}";
            $loadingPlanResponse = Http::get($url);

            if (!$loadingPlanResponse->successful()) {
                abort(404);
            }
            $loadingPlan = $loadingPlanResponse->json()['data'] ?? null;

            // Get loading plan detail
            $loadingPlanDetailUrl = env($baseEnv) . "/api/loadingplandetail/{$loadingPlanId}";
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

        try {
            $orderDetail = $orderDetailResponse->json()['data'] ?? null;
            $dimension = $dimensionResponse->json()['data'] ?? null;
        } catch (\Exception $e) {
            $orderDetail = null;
            $dimension = null;
        }

        $shipment['order_detail'] = $orderDetail;
        $shipment['dimension'] = $dimension;
        $shipment['loading_plan'] = $loadingPlan ?? null;
        $shipment['loading_plan_detail'] = $loadingPlanDetail ?? null;
        $shipment['jobtruckdelivery'] = $jobtruckdelivery ?? null;
        $shipment['destination_handling_agent'] = $controlOffice ?? null;
        $shipment['destination_partner'] = $destinationPartner ?? null;
        $shipment['sales_office'] = $salesOffice ?? null;
        $shipment['sales_person'] = $salesPerson ?? null;
        $shipment['order_document'] = $orderDocument ?? null;
        $shipment['chat_origin'] = $chatOrigin ?? null;
        $shipment['chat_dxb'] = $chatDxb ?? null;
        $shipment['chat_agent'] = $chatAgent ?? null;
        
        return view('pages.finance.general-wise.shipment.detail', compact('shipment', 'type'));
    }

    public function downloadDocuments(Request $request)
    {
        $base = ($request->type == "seaair" || $request->type == "crossair") ? env('API_ORIGIN') : env('API_DXB');

        $data = $request->validate([
            'job_id' => 'required|array',
            'type_document' => 'required|array',
            'prefix' => 'required|string',
            'type' => 'required|string'
        ]);

        $data['role_id'] = '18'; // Set the role_id as needed

        $response = Http::post("{$base}/api/orderdocument/downloadmultiple", $data);

        if ($response->ok()) {
            return response()->streamDownload(function () use ($response) {
                echo $response->body(); // Stream the file content
            }, 'Selected-Documents.zip');
        } else {
            return response()->json([
                'error' => 'Failed to send request',
                'status' => $response->status(),
            ], $response->status());
        }
    }

    public function statusShipment(Request $request)
    {
        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        $base = ($request->type == "seaair" || $request->type == "crossair") ? env('API_ORIGIN') : env('API_DXB');
        $status_url = $base . "/api/status?shipment_type=" . $shipment_by;
        $response_status = Http::get($status_url);

        if ($response_status->successful()) {
            $apiData = $response_status->json();
            return response()->json([
                'status' => 200,
                'data' => $apiData['data']
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'error' => 'Failed to fetch data from API'
            ], 500);
        }
    }

    public function carrier(Request $request)
    {
        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        $base = ($request->type == "seaair" || $request->type == "crossair") ? env('API_ORIGIN') : env('API_DXB');
        $instruction_url = $base . "/api/shippinginstruction/carrier?shipment_by=" . $shipment_by;
        $response_instruction = Http::get($instruction_url);

        if ($response_instruction->successful()) {
            $apiData = $response_instruction->json();
            return response()->json([
                'status' => 200,
                'data' => $apiData['data']
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'error' => 'Failed to fetch data from API'
            ], 500);
        }
    }

    public function shipper(Request $request)
    {
        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        $base = ($request->type == "seaair" || $request->type == "crossair") ? env('API_ORIGIN') : env('API_DXB');
        $instruction_url = $base . "/api/shippinginstruction/shipper?shipment_by=" . $shipment_by;
        $response_instruction = Http::get($instruction_url);

        if ($response_instruction->successful()) {
            $apiData = $response_instruction->json();
            return response()->json([
                'status' => 200,
                'data' => $apiData['data']
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'error' => 'Failed to fetch data from API'
            ], 500);
        }
    }

    public function consignee(Request $request)
    {
        $type = $request->type;
        if ($type == "seaair") {
            $shipment_by = 'SEAAIR';
        } else if ($type == "crossair") {
            $shipment_by = 'AIR';
        } else if ($type == "seaimport") {
            $shipment_by = 'SEAIMPORT';
        } else if ($type == "seaexport") {
            $shipment_by = 'SEAEXPORT';
        } else if ($type == "airimport") {
            $shipment_by = 'AIRIMPORT';
        } else if ($type == "airexport") {
            $shipment_by = 'AIREXPORT';
        } else if ($type == "warehouse") {
            $shipment_by = 'WAREHOUSE';
        } else if ($type == "trucking") {
            $shipment_by = 'TRUCKING';
        } else if ($type == "courier") {
            $shipment_by = 'COURIER';
        }

        $base = ($request->type == "seaair" || $request->type == "crossair") ? env('API_ORIGIN') : env('API_DXB');
        $instruction_url = $base . "/api/shippinginstruction/consignee?shipment_by=" . $shipment_by;
        $response_instruction = Http::get($instruction_url);

        if ($response_instruction->successful()) {
            $apiData = $response_instruction->json();
            return response()->json([
                'status' => 200,
                'data' => $apiData['data']
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'error' => 'Failed to fetch data from API'
            ], 500);
        }
    }

}
