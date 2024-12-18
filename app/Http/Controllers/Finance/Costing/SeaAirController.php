<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing;

use App\Models\Operation\Origin\JobOrder;
use App\Models\Operation\Origin\OperationDocument;
use App\Models\Operation\Origin\LoadingPlanDocument;
use App\Models\Operation\Origin\LoadingReportDetail;
use App\Models\Operation\Origin\LoadingReportBL;
use App\Models\Operation\Origin\ShippingInstruction;
use App\Models\Operation\Dxb\LoadingPlan;
use App\Models\Operation\Master\Port;
use App\Models\Operation\Master\Vendor;
use App\Models\Finance\Charge;
use App\Models\Finance\Currency;
use App\Models\Finance\Costing;
use App\Models\Finance\CostingDetail;
use App\Models\Finance\CostingHead;
use App\Models\Finance\CostingSpecial;
use App\Models\Finance\CostingVendorAgent;
use App\Models\Finance\CostingVendorPort;
use App\Models\Finance\CostingVendorTrucking;


use Illuminate\View\View;
use App\Functions\Convert;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\Costing\SeaAirExport;

final class SeaAirController extends Controller
{

    public function index(): View
    {
        return view('pages.finance.costing.sea-air.index');
    }


    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('status','!=',3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loading'])->where('status','!=',3);
            $joborder->when(!empty($request['search']['value']), function ($query) use ($request) {
                $search = $request['search']['value'];

                $query->where('job_order_code', 'ilike', "%{$search}%");

            });
            $count_filter = $joborder->count();
            $data = $joborder->skip($start)->take($pageSize)->orderBy('date_order','DESC')->get();

            return DataTables::of($data)
                ->addIndexColumn()
                ->with([
                    "draw"=>$draw,
                    "recordsTotal" => $count_total,
                    "recordsFiltered" => $count_filter,
                    ])
                ->editColumn('origin', function ($item) {
                    return $item->origin->city ?? "";
                })
                ->editColumn('vessel', function ($item) {
                    return $item->loading->vessel_name ?? "";
                })
                ->editColumn('voyage', function ($item) {
                    return $item->loading->voyage_number ?? "";
                })
                ->editColumn('eta', function ($item) {
                    return Convert::date($item->eta_dubai) ?? "";
                })
                ->editColumn('job_order_date', function ($item) {
                    return Convert::date($item->date_created) ?? "";
                })
                ->editColumn('status', function ($item) {
                    if(!empty($item->costing)){
                        if($item->costing->status == 1){
                            return 'Open';
                        }else{
                            return 'Closed';
                        }
                    }else{
                        return '';
                    }
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'show' => route('finance.costing.sea-air.show', $item->job_order_id),
                        'cost' => route('finance.costing.sea-air.cost', $item->job_order_id),
                    ]);
                })
                ->rawColumns(['action'])
                ->setTotalRecords($count_total)
                ->setFilteredRecords($count_filter)
                ->skipPaging()
                ->make(true);
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function show($id){
        $joborder = JobOrder::with(['detail', 'loading','doc'])->findOrFail($id);
        $op = OperationDocument::where('job_order_id', $id)->first();
        $lpdoc = LoadingPlanDocument::where('loading_id', $joborder->loading_plan_id)->get();
        return view('pages.finance.costing.sea-air.show', compact('id','joborder','op','lpdoc'));
    }

    public function cost($id){
        $joborder = JobOrder::with(['detail', 'loading','doc'])->findOrFail($id);
        $loading = LoadingReportDetail::where('status',"!=",3)->where('bl_id', $joborder->loading_plan_id)->get();
        $port = Port::where('status',"!=",3)->get();
        $vendor_truck = Vendor::where('status',"!=",3)->where('vendor_type_id','08dc64df-4210-4c93-bf19-8ed8b0dc6658')->get();
        $vendor_port = Vendor::where('status',"!=",3)->where('vendor_type_id','e1aa4b6f-e035-4f28-9887-b70bd18166b6')->get();
        $vendor_air = Vendor::where('status',"!=",3)->where('vendor_type_id','bd809e96-71f9-42ab-b431-4c975df8c140')->get();
        $vendor_line = Vendor::where('status',"!=",3)->where('vendor_type_id','f0bbc26c-a6ca-11ed-99ce-b7de90ac3f73')->get();
        $charge = Charge::whereNull('deleted_at')->get();
        $currency = Currency::whereNull('deleted_at')->get();
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $joborder->loading_plan_id)->where('status','!=',3)->get();
        $ship = ShippingInstruction::where("status","!=",3)->where("loading_id", $joborder->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
       //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $cost = Costing::with(['truck','port','agent','special','head','head.detail'])->where("job_order_id",$joborder->job_order_id);
        if($cost->exists()){
            $costing = $cost->first();
           //return response()->json($costing);
            $data = [
                'action' => route('finance.costing.sea-air.update', $costing->id),
                'method' => 'PUT',
             ];
        }else{
            $costing = null;
            $data = [
                'action' => route('finance.costing.sea-air.store'),
                'method' => 'POST',
             ];
        }
        return view('pages.finance.costing.sea-air.cost', compact('id','joborder','loading','port','vendor_truck','vendor_port','vendor_air','vendor_line','charge','currency','bl','loadingplan','costing','data'));
    }

    public function store(Request $request){

        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status','!=',3)->get();
        $ship = ShippingInstruction::where("status","!=",3)->where("loading_id", $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
       //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'status' => 1,
            'type'=> 'SEAAIR',
            'notes'=> $request->notes,
            'created_by' => auth()->user()->email
        ];
        $costing = Costing::create($data_costing);
        if(!empty($request->vendor_truck_id)){
            foreach($request->vendor_truck_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $vendor_name = $request->vendor_truck_name[$k];
                $container_no = $request->container_number[$k];
                $data_vendor_trucking = [
                    'costing_id' => $costing->id,
                    'container_no'=> $container_no,
                    'vendor_id'=> $row,
                    'vendor_name'=> $vendor_name,
                    'created_by' => auth()->user()->email
                ];
                CostingVendorTrucking::create($data_vendor_trucking);
            }
        }

        if(!empty($request->vendor_port_id)){
            $data_port = [
                'costing_id' => $costing->id,
                'port_id'=> $request->port_id,
                'port_code'=> $request->port_code,
                'vendor_id' => $request->vendor_port_id,
                'vendor_name' => $request->vendor_port_name,
                'created_by' => auth()->user()->email
            ];
            CostingVendorPort::create($data_port);
        }
        if(!empty($request->vendor_air_id)){
            foreach($request->vendor_air_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $vendor_name = $request->vendor_air_name[$k];
                $mawb = $request->mawb[$k];
                $data_vendor_agent = [
                    'costing_id' => $costing->id,
                    'mawb'=> $mawb,
                    'vendor_id'=> $row,
                    'vendor_name'=> $vendor_name,
                    'created_by' => auth()->user()->email
                ];
                CostingVendorAgent::create($data_vendor_agent);
            }
        }

        if(!empty($request->vendor_special_import_id)){
            foreach($request->vendor_special_import_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $vendor_name = $request->vendor_special_import_name[$k];
                $charge_id = $request->charge_special_import_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_import_id[$k];
                $rate = $request->rate_special_import[$k];
                $amount = $request->amount_special_import[$k];
                $local_amount = $request->local_amount_special_import[$k];
                $status = $request->status_special_import[$k];
                $email = auth()->user()->email;
                $data_special_import = [
                    'costing_id'=> $costing->id,
                    'costing_type'=>'import',
                    'vendor_id'=> $row,
                    'vendor_name'=>$vendor_name,
                     'charge_id'=>$charge_id,
                     'charge_name'=>$charge_name,
                     'currency_id'=>$currency_id,
                     'rate'=>$rate,
                     'amount'=>$amount,
                     'local_amount'=>$local_amount,
                     'status'=>$status,
                     'created_by'=>$email,
                ];

                CostingSpecial::create($data_special_import);
            }
        }

        if(!empty($request->vendor_special_export_id)){
            foreach($request->vendor_special_export_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $vendor_name = $request->vendor_special_export_name[$k];
                $charge_id = $request->charge_special_export_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_export_id[$k];
                $rate = $request->rate_special_export[$k];
                $amount = $request->amount_special_export[$k];
                $local_amount = $request->local_amount_special_export[$k];
                $status = $request->status_special_export[$k];
                $email = auth()->user()->email;
                $data_special_export = [
                    'costing_id'=> $costing->id,
                    'costing_type'=>'export',
                    'vendor_id'=> $row,
                    'vendor_name'=>$vendor_name,
                     'charge_id'=>$charge_id,
                     'charge_name'=>$charge_name,
                     'currency_id'=>$currency_id,
                     'rate'=>$rate,
                     'amount'=>$amount,
                     'local_amount'=>$local_amount,
                     'status'=>$status,
                     'created_by'=>$email,
                ];

                CostingSpecial::create($data_special_export);
            }
        }

        foreach($bl as $j => $rx){
            if (!empty($request["vendor_bl_{$j}_id"])) {
                $costing_head = CostingHead::create([
                    'costing_id'=> $costing->id,
                    'costing_type'=>'bl',
                    'costing_value'=>$rx->bl_number,
                    'created_by' => auth()->user()->email,
                    'reference_id'=>$rx->loading_report_bl_id,
                    'shipment_type'=>'SEAAIR'
                ]);
                foreach($request["vendor_bl_{$j}_id"] as $k => $row){
                    $vendor_name = $request["vendor_bl_{$j}_name"][$k] ?? null;
                    $charge_id = $request["charge_bl_{$j}_id"][$k] ?? null;
                    if($charge_id != null){
                        $charge = Charge::find($charge_id);
                        $charge_name = $charge->charge_name ?? "";
                    }else{
                        $charge_name = "";
                    }
                    $currency_id = $request["currency_bl_{$j}_id"][$k] ?? null;
                    $rate = $request["rate_bl_{$j}"][$k] ?? null;
                    $amount = $request["amount_bl_{$j}"][$k] ?? null;
                    $local_amount = $request["local_amount_bl_{$j}"][$k] ?? null;
                    $status = $request["status_bl_{$j}"][$k] ?? null;
                    $email = auth()->user()->email;
                    $transaction_date = $request->transaction_date_import;
                    $data_special_export = [
                        'costing_id'=> $costing->id,
                        'costing_head_id'=>$costing_head->id,
                        'shipment_type'=>'SEAAIR',
                        'costing_type'=>'bl',
                        'costing_value'=>$rx->bl_number,
                        'vendor_id'=> $row,
                        'vendor_name'=>$vendor_name,
                         'charge_id'=>$charge_id,
                         'charge_name'=>$charge_name,
                         'currency_id'=>$currency_id,
                         'rate'=>$rate,
                         'amount'=>$amount,
                         'local_amount'=>$local_amount,
                         'status'=>$status,
                         'created_by'=>$email,
                         'transaction_date'=>$transaction_date
                    ];

                    CostingDetail::create($data_special_export);
                }
            }

            foreach($rx->shipping as $m => $r){
                if (!empty($request["vendor_ctd_{$m}_id"])) {
                    foreach($request["vendor_ctd_{$m}_id"] as $z => $rz){
                        if($rz == "Select"){
                            continue;
                        }
                        $vendor_name = $request["vendor_ctd_{$m}_name"][$z] ?? null;
                        $charge_id = $request["charge_ctd_{$m}_id"][$z] ?? null;
                        if($charge_id != null){
                            $charge = Charge::find($charge_id);
                            $charge_name = $charge->charge_name ?? "";
                        }else{
                            $charge_name = "";
                        }
                        $charge_name = $charge->charge_name ?? "";
                        $currency_id = $request["currency_ctd_{$m}_id"][$z] ?? null;
                        $rate = $request["rate_ctd_{$m}"][$z] ?? null;
                        $amount = $request["amount_ctd_{$m}"][$z] ?? null;
                        $local_amount = $request["local_amount_ctd_{$m}"][$z] ?? null;
                        $status = $request["status_ctd_{$m}"][$z] ?? null;
                        $email = auth()->user()->email;
                        $transaction_date = $request->transaction_date_import;
                        $data_special_export = [
                            'costing_id'=> $costing->id,
                            'costing_head_id'=>$costing_head->id,
                            'shipment_type'=>'SEAAIR',
                            'costing_type'=>'bl_ctd',
                            'costing_value'=>$r->ctd_number,
                            'vendor_id'=> $rz,
                            'vendor_name'=>$vendor_name,
                             'charge_id'=>$charge_id,
                             'charge_name'=>$charge_name,
                             'currency_id'=>$currency_id,
                             'rate'=>$rate,
                             'amount'=>$amount,
                             'local_amount'=>$local_amount,
                             'status'=>$status,
                             'created_by'=>$email,
                             'transaction_date'=>$transaction_date
                        ];

                        CostingDetail::create($data_special_export);
                    }
                }
            }
        }

        foreach($loadingplan as $j => $rx){
            if (!empty($request["vendor_mawb_{$j}_id"])) {
                $costing_head = CostingHead::create([
                    'costing_id'=> $costing->id,
                    'costing_type'=>'mawb',
                    'costing_value'=>$rx->mawb_number,
                    'created_by' => auth()->user()->email,
                    'reference_id'=>$rx->plan_id,
                    'shipment_type'=>'SEAAIR'
                ]);
                foreach($request["vendor_mawb_{$j}_id"] as $k => $row){

                    $vendor_name = $request["vendor_mawb_{$j}_name"][$k] ?? null;
                    $charge_id = $request["charge_mawb_{$j}_id"][$k] ?? null;
                    if($charge_id != null){
                        $charge = Charge::find($charge_id);
                        $charge_name = $charge->charge_name ?? "";
                    }else{
                        $charge_name = "";
                    }
                    $currency_id = $request["currency_mawb_{$j}_id"][$k] ?? null;
                    $rate = $request["rate_mawb_{$j}"][$k] ?? null;
                    $amount = $request["amount_mawb_{$j}"][$k] ?? null;
                    $local_amount = $request["local_amount_mawb_{$j}"][$k] ?? null;
                    $status = $request["status_mawb_{$j}"][$k] ?? null;
                    $transaction_date = $request->transaction_date_import;
                    $data_special_export = [
                        'costing_id'=> $costing->id,
                        'costing_head_id'=> $costing_head->id,
                        'shipment_type'=>'SEAAIR',
                        'costing_type'=>'mawb',
                        'costing_value'=>$rx->mawb_number,
                        'vendor_id'=> $row,
                        'vendor_name'=>$vendor_name,
                         'charge_id'=>$charge_id,
                         'charge_name'=>$charge_name,
                         'currency_id'=>$currency_id,
                         'rate'=>$rate,
                         'amount'=>$amount,
                         'local_amount'=>$local_amount,
                         'status'=>$status,
                         'created_by'=>$email,
                         'transaction_date'=>$transaction_date
                    ];

                    CostingDetail::create($data_special_export);
                }
            }
        }

        return to_route('finance.costing.sea-air.index')->with('toastSuccess', "Costing Success");
    }

    public function update($id, Request $request){
        $costing = Costing::find($id);
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status','!=',3)->get();
        $ship = ShippingInstruction::where("status","!=",3)->where("loading_id", $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
       //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'notes'=> $request->notes,
            'updated_by' => auth()->user()->email
        ];
        $costing = Costing::find($id)->update($data_costing);
        if(!empty($request->vendor_truck_id)){
            foreach($request->vendor_truck_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $costing_truck_id = $request->costing_vendor_truck_id[$k] ?? null;
                $vendor_name = $request->vendor_truck_name[$k];
                $container_no = $request->container_number[$k];
                $data_vendor_trucking = [
                    'costing_id' => $id,
                    'container_no'=> $container_no,
                    'vendor_id'=> $row,
                    'vendor_name'=> $vendor_name,
                ];
                if($costing_truck_id != null){
                    $data_vendor_trucking["updated_by"] = auth()->user()->email;
                    CostingVendorTrucking::find($costing_truck_id)->update($data_vendor_trucking);
                }else{
                    $data_vendor_trucking["created_by"] = auth()->user()->email;
                    CostingVendorTrucking::create($data_vendor_trucking);
                }
            }
        }

        if(!empty($request->vendor_port_id)){
            $costing_vendor_port_id = $request->costing_vendor_port_id ?? null;
            $data_port = [
                'costing_id' => $id,
                'port_id'=> $request->port_id,
                'port_code'=> $request->port_code,
                'vendor_id' => $request->vendor_port_id,
                'vendor_name' => $request->vendor_port_name,
            ];
            if($costing_vendor_port_id != null){
                $data_port["updated_by"] = auth()->user()->email;
                CostingVendorPort::find($costing_vendor_port_id)->update($data_port);
            }else{
                $data_port["created_by"] = auth()->user()->email;
                CostingVendorPort::create($data_port);
            }

        }
        if(!empty($request->vendor_air_id)){
            foreach($request->vendor_air_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $costing_vendor_agent_id = $request->costing_vendor_agent_id[$k] ?? null;
                $costing_vendor_agent_delete_id = $request->costing_vendor_agent_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_air_name[$k];
                $mawb = $request->mawb[$k];
                $data_vendor_agent = [
                    'costing_id' => $id,
                    'mawb'=> $mawb,
                    'vendor_id'=> $row,
                    'vendor_name'=> $vendor_name,
                ];
                if($costing_vendor_agent_id != null){
                    $data_vendor_agent["updated_by"] = auth()->user()->email;
                    if($costing_vendor_agent_delete_id != null){
                        CostingVendorAgent::find($costing_vendor_agent_delete_id)->delete();
                    }else{
                        CostingVendorAgent::find($costing_vendor_agent_id)->update($data_vendor_agent);
                    }
                }else{
                    $data_vendor_agent["created_by"] = auth()->user()->email;
                    CostingVendorAgent::create($data_vendor_agent);
                }

            }
        }

        if(!empty($request->vendor_special_import_id)){
            foreach($request->vendor_special_import_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $costing_special_import_id = $request->costing_special_import_id[$k] ?? null;
                $costing_special_import_delete_id = $request->costing_special_import_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_special_import_name[$k];
                $charge_id = $request->charge_special_import_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_import_id[$k];
                $rate = $request->rate_special_import[$k];
                $amount = $request->amount_special_import[$k];
                $local_amount = $request->local_amount_special_import[$k];
                $status = $request->status_special_import[$k];
                $email = auth()->user()->email;
                $data_special_import = [
                    'costing_id'=> $id,
                    'costing_type'=>'import',
                    'vendor_id'=> $row,
                    'vendor_name'=>$vendor_name,
                     'charge_id'=>$charge_id,
                     'charge_name'=>$charge_name,
                     'currency_id'=>$currency_id,
                     'rate'=>$rate,
                     'amount'=>$amount,
                     'local_amount'=>$local_amount,
                     'status'=>$status,
                     'created_by'=>$email,
                ];
                if($costing_special_import_id != null){
                    $data_special_import["updated_by"] = auth()->user()->email;
                    if($costing_special_import_delete_id != null){
                        CostingSpecial::find($costing_special_import_delete_id)->delete();
                    }else{
                        CostingSpecial::find($costing_special_import_id)->update($data_special_import);
                    }
                }else{
                    $data_special_import["created_by"] = auth()->user()->email;
                    CostingSpecial::create($data_special_import);
                }


            }
        }

        if(!empty($request->vendor_special_export_id)){
            foreach($request->vendor_special_export_id as $k => $row){
                if($row == "Select"){
                    continue;
                }
                $costing_special_export_id = $request->costing_special_export_id[$k] ?? null;
                $costing_special_export_delete_id = $request->costing_special_export_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_special_export_name[$k];
                $charge_id = $request->charge_special_export_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_export_id[$k];
                $rate = $request->rate_special_export[$k];
                $amount = $request->amount_special_export[$k];
                $local_amount = $request->local_amount_special_export[$k];
                $status = $request->status_special_export[$k];
                $email = auth()->user()->email;
                $data_special_export = [
                    'costing_id'=> $id,
                    'costing_type'=>'export',
                    'vendor_id'=> $row,
                    'vendor_name'=>$vendor_name,
                     'charge_id'=>$charge_id,
                     'charge_name'=>$charge_name,
                     'currency_id'=>$currency_id,
                     'rate'=>$rate,
                     'amount'=>$amount,
                     'local_amount'=>$local_amount,
                     'status'=>$status,
                     'created_by'=>$email,
                ];
                if($costing_special_export_id != null){
                    $data_special_export["updated_by"] = auth()->user()->email;
                    if($costing_special_export_delete_id != null){
                        CostingSpecial::find($costing_special_export_delete_id)->delete();
                    }else{
                        CostingSpecial::find($costing_special_export_id)->update($data_special_export);
                    }
                }else{
                    $data_special_export["created_by"] = auth()->user()->email;
                    CostingSpecial::create($data_special_export);
                }

            }
        }

        foreach($bl as $j => $rx){
            if (!empty($request["vendor_bl_{$j}_id"])) {
                $head = CostingHead::where("costing_type", "bl")->where("shipment_type", "SEAAIR")->where("costing_id", $id)->where('reference_id', $rx->loading_report_bl_id);
                if($head->exists()){
                    $costing_head = $head->first();
                    CostingHead::find($costing_head->id)->update([
                        'costing_id'=> $id,
                        'costing_type'=>'bl',
                        'costing_value'=>$rx->bl_number,
                        'updated_by' => auth()->user()->email,
                        'reference_id'=>$rx->loading_report_bl_id,
                        'shipment_type'=>'SEAAIR'
                    ]);

                }else{
                    $costing_head = CostingHead::create([
                        'costing_id'=> $id,
                        'costing_type'=>'bl',
                        'costing_value'=>$rx->bl_number,
                        'created_by' => auth()->user()->email,
                        'reference_id'=>$rx->loading_report_bl_id,
                        'shipment_type'=>'SEAAIR'
                    ]);
                }

                foreach($request["vendor_bl_{$j}_id"] as $k => $row){
                    $costing_detail_id = $request["costing_detail_bl_{$j}_id"][$k] ?? null;
                    $costing_detail_delete_id = $request["costing_detail_bl_{$j}_delete_id"][$k] ?? null;
                    $vendor_name = $request["vendor_bl_{$j}_name"][$k] ?? null;
                    $charge_id = $request["charge_bl_{$j}_id"][$k] ?? null;
                    if($charge_id != null){
                        $charge = Charge::find($charge_id);
                        $charge_name = $charge->charge_name ?? "";
                    }else{
                        $charge_name = "";
                    }
                    $currency_id = $request["currency_bl_{$j}_id"][$k] ?? null;
                    $rate = $request["rate_bl_{$j}"][$k] ?? null;
                    $amount = $request["amount_bl_{$j}"][$k] ?? null;
                    $local_amount = $request["local_amount_bl_{$j}"][$k] ?? null;
                    $status = $request["status_bl_{$j}"][$k] ?? null;
                    $email = auth()->user()->email;
                    $transaction_date = $request->transaction_date_import;
                    $data_special_export = [
                        'costing_id'=> $id,
                        'costing_head_id'=>$costing_head->id,
                        'shipment_type'=>'SEAAIR',
                        'costing_type'=>'bl',
                        'costing_value'=>$rx->bl_number,
                        'vendor_id'=> $row,
                        'vendor_name'=>$vendor_name,
                         'charge_id'=>$charge_id,
                         'charge_name'=>$charge_name,
                         'currency_id'=>$currency_id,
                         'rate'=>$rate,
                         'amount'=>$amount,
                         'local_amount'=>$local_amount,
                         'status'=>$status,
                         'transaction_date'=>$transaction_date
                    ];
                    if($costing_detail_id != null){
                        $data_special_export["updated_by"] = auth()->user()->email;
                        if($costing_detail_delete_id != null){
                            CostingDetail::find($costing_detail_delete_id)->delete();
                        }else{
                            CostingDetail::find($costing_detail_id)->update($data_special_export);
                        }
                    }else{
                        $data_special_export["created_by"] = auth()->user()->email;
                        CostingDetail::create($data_special_export);
                    }
                }
            }

            foreach($rx->shipping as $m => $r){
                if (!empty($request["vendor_ctd_{$m}_id"])) {
                    foreach($request["vendor_ctd_{$m}_id"] as $z => $rz){
                        if($rz == "Select"){
                            continue;
                        }
                        $costing_detail_id = $request["costing_detail_ctd_{$m}_id"][$z] ?? null;
                        $costing_detail_delete_id = $request["costing_detail_ctd_{$j}_delete_id"][$k] ?? null;
                        $vendor_name = $request["vendor_ctd_{$m}_name"][$z] ?? null;
                        $charge_id = $request["charge_ctd_{$m}_id"][$z] ?? null;
                        if($charge_id != null){
                            $charge = Charge::find($charge_id);
                            $charge_name = $charge->charge_name ?? "";
                        }else{
                            $charge_name = "";
                        }
                        $charge_name = $charge->charge_name ?? "";
                        $currency_id = $request["currency_ctd_{$m}_id"][$z] ?? null;
                        $rate = $request["rate_ctd_{$m}"][$z] ?? null;
                        $amount = $request["amount_ctd_{$m}"][$z] ?? null;
                        $local_amount = $request["local_amount_ctd_{$m}"][$z] ?? null;
                        $status = $request["status_ctd_{$m}"][$z] ?? null;
                        $email = auth()->user()->email;
                        $transaction_date = $request->transaction_date_import;
                        $data_special_export = [
                            'costing_id'=> $id,
                            'costing_head_id'=>$costing_head->id,
                            'shipment_type'=>'SEAAIR',
                            'costing_type'=>'bl_ctd',
                            'costing_value'=>$r->ctd_number,
                            'vendor_id'=> $rz,
                            'vendor_name'=>$vendor_name,
                             'charge_id'=>$charge_id,
                             'charge_name'=>$charge_name,
                             'currency_id'=>$currency_id,
                             'rate'=>$rate,
                             'amount'=>$amount,
                             'local_amount'=>$local_amount,
                             'status'=>$status,
                             'transaction_date'=>$transaction_date
                        ];
                        if($costing_detail_id != null){
                            $data_special_export["updated_by"] = auth()->user()->email;
                            if($costing_detail_delete_id != null){
                                CostingDetail::find($costing_detail_delete_id)->delete();
                            }else{
                                CostingDetail::find($costing_detail_id)->update($data_special_export);
                            }
                        }else{
                            $data_special_export["created_by"] = auth()->user()->email;
                            CostingDetail::create($data_special_export);
                        }
                    }
                }
            }
        }

        foreach($loadingplan as $j => $rx){
            if (!empty($request["vendor_mawb_{$j}_id"])) {
                $head = CostingHead::where("costing_type", "mawb")->where("shipment_type", "SEAAIR")->where("costing_id", $id)->where('reference_id', $rx->loading_report_bl_id);
                if($head->exists()){
                    $costing_head = $head->id;
                    CostingHead::find($costing_head->id)->update([
                        'costing_id'=> $id,
                        'costing_type'=>'mawb',
                        'costing_value'=>$rx->mawb_number,
                        'updated_by' => auth()->user()->email,
                        'reference_id'=>$rx->plan_id,
                        'shipment_type'=>'SEAAIR'
                    ]);

                }else{
                    $costing_head = CostingHead::create([
                        'costing_id'=> $id,
                        'costing_type'=>'mawb',
                        'costing_value'=>$rx->mawb_number,
                        'created_by' => auth()->user()->email,
                        'reference_id'=>$rx->plan_id,
                        'shipment_type'=>'SEAAIR'
                    ]);
                }

                foreach($request["vendor_mawb_{$j}_id"] as $k => $row){
                    $costing_detail_id = $request["costing_detail_mawb_{$j}_id"][$k] ?? null;
                    $costing_detail_delete_id = $request["costing_detail_mawb_{$j}_delete_id"][$k] ?? null;
                    $vendor_name = $request["vendor_mawb_{$j}_name"][$k] ?? null;
                    $charge_id = $request["charge_mawb_{$j}_id"][$k] ?? null;
                    if($charge_id != null){
                        $charge = Charge::find($charge_id);
                        $charge_name = $charge->charge_name ?? "";
                    }else{
                        $charge_name = "";
                    }
                    $currency_id = $request["currency_mawb_{$j}_id"][$k] ?? null;
                    $rate = $request["rate_mawb_{$j}"][$k] ?? null;
                    $amount = $request["amount_mawb_{$j}"][$k] ?? null;
                    $local_amount = $request["local_amount_mawb_{$j}"][$k] ?? null;
                    $status = $request["status_mawb_{$j}"][$k] ?? null;
                    $transaction_date = $request->transaction_date_import;
                    $data_special_export = [
                        'costing_id'=> $id,
                       'costing_head_id'=>$costing_head->id,
                        'shipment_type'=>'SEAAIR',
                        'costing_type'=>'mawb',
                        'costing_value'=>$rx->mawb_number,
                        'vendor_id'=> $row,
                        'vendor_name'=>$vendor_name,
                         'charge_id'=>$charge_id,
                         'charge_name'=>$charge_name,
                         'currency_id'=>$currency_id,
                         'rate'=>$rate,
                         'amount'=>$amount,
                         'local_amount'=>$local_amount,
                         'status'=>$status,
                         'transaction_date'=>$transaction_date
                    ];
                    if($costing_detail_id != null){
                        $data_special_export["updated_by"] = auth()->user()->email;
                        if($costing_detail_delete_id != null){
                            CostingDetail::find($costing_detail_delete_id)->delete();
                        }else{
                            CostingDetail::find($costing_detail_id)->update($data_special_export);
                        }
                    }else{
                        $data_special_export["created_by"] = auth()->user()->email;
                        CostingDetail::create($data_special_export);
                    }


                }
            }
        }

        return to_route('finance.costing.sea-air.index')->with('toastSuccess', "Update Success");
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_air_' . time() . '.csv';
        return Excel::download(new SeaAirExport, $file_name);
    }





}
