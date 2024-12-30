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
use App\Models\Finance\Customer;
use App\Models\Finance\AgentContract;
use App\Models\Finance\AgentContractService;
use App\Models\Finance\AgentContractCharge;
use App\Models\Finance\AgentContractChargeDetail;


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
                        if($item->costing->status == 1 || $item->costing->status == 3){
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
        $cost = Costing::where("job_order_id",$joborder->job_order_id);
        if($cost->exists()){
            $costing = $cost->first();
        }else{
            $costing = null;
        }
        $op = OperationDocument::where('job_order_id', $id)->first();
        $lpdoc = LoadingPlanDocument::where('loading_id', $joborder->loading_plan_id)->get();
        return view('pages.finance.costing.sea-air.show', compact('id','joborder','op','lpdoc','costing'));
    }

    public function port(Request $request){
        $query = Port::query();

        // Apply search filter
        if ($search = $request->input('search')) {
            $query->where('port_code', 'ilike', '%' . $search . '%');
            $query->orWhere('port_name', 'ilike', '%' . $search . '%');
        }

        // Paginate the results
        $options = $query->orderBy('port_code','ASC')->paginate(1000); // Adjust the pagination size as needed

        return response()->json([
            'results' => $options->items(),
            'pagination' => ['more' => $options->hasMorePages()]
        ]);
    }

    public function cost($id){

        $joborder = JobOrder::with(['detail', 'loading','doc'])->findOrFail($id);

        $loading = LoadingReportDetail::with('bl')->where('status',"!=",3)->where('bl_id', $joborder->loading_plan_id)->get();

        //$port = Port::where('status',"!=",3)->get();
        $vendor_all = Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->get();

        $vendor_truck = Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->whereHas("customerTypes", function ($query) {
            $query->where("name", "Trucking Company");
        })->get();

        $vendor_port = Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->whereHas("customerTypes", function ($query) {
            $query->where("name", "Dubai Port");
        })->get();
        $vendor_air = Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->whereHas("customerTypes", function ($query) {
            $query->where("name", "Carrier Agent");
        })->get();
        $vendor_line = Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->whereHas("customerTypes", function ($query) {
            $query->where("name", "Shipping Line");
        })->get();

        $charge = Charge::whereNull('deleted_at')->get();
        $currency = Currency::whereNull('deleted_at')->get();
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $joborder->loading_plan_id)->where('status','!=',3)->get();

        $ship = ShippingInstruction::where("status", "!=", 3)
        ->where("loading_id", $joborder->loading_plan_id)
        ->get();

        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();

        $loadingplan = LoadingPlan::with(['shipping' => function($q) use ($ship) {
            $jobIds = $ship->pluck('job_id')->toArray();
            $q->whereIn('job_id', $jobIds);
        }])->whereIn('plan_id', $loading_plan_dxb)->get();
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
        return view('pages.finance.costing.sea-air.cost', compact('id','joborder','loading','vendor_truck','vendor_port','vendor_air','vendor_line','charge','currency','bl','loadingplan','costing','data','vendor_all'));
    }

    public function store(Request $request){

        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status','!=',3)->get();
        $ship = ShippingInstruction::where("status","!=",3)->where("loading_id", $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
       //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'status' => $request->status_costing,
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
        dd($request->all());
        $costing = Costing::find($id);
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status','!=',3)->get();
        $ship = ShippingInstruction::where("status","!=",3)->where("loading_id", $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
       //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'notes'=> $request->notes,
            'status' => $request->status_costing,
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
                    $type = $request["type_bl_{$j}"][$k] ?? null;
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
                         'transaction_date'=>$transaction_date,
                         'type'=>$type
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
                             'transaction_date'=>$transaction_date,
                             'type'=>'manual'
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
                    $type = $request["type_mawb_{$j}"][$k] ?? null;
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
                         'transaction_date'=>$transaction_date,
                         'type'=>$type
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

    public function contractbl($id, $bl_number, $type){
        $bl = LoadingReportBl::where("bl_number", $bl_number)->first();
        $container = LoadingReportDetail::where("loading_report_bl_id", $bl->loading_report_bl_id)->get();
        $contract = AgentContract::where("customer_id",$id)->first();
        if($contract == null){
            $charge_bl = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
        }
        $ship = ShippingInstruction::where("loading_report_bl_id", $bl->loading_report_bl_id)->first();

            $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($type, $ship) {
                if($type == 'or'){
                    $query->where("service_code", $ship->loading_type);
                }else if($type == 'all'){
                    $query->whereIn('service_code',['LCL','FCL','LAND']);
                }else{
                    $query->where("service_code", $type);
                }
            })->where('por_country_id', $ship->origin->country_id)->where('por_port_id',$ship->port_of_loading);
            if($service->exists()){
                $service = $service->first();
            }else{
                $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($type, $ship) {
                    if($type == 'or'){
                        $query->where("service_code", $ship->loading_type);
                    }else if($type == 'all'){
                        $query->whereIn('service_code',['LCL','FCL','LAND']);
                    }else{
                        $query->where("service_code", $type);
                    }
                })->first();
            }
            if($service == null){
                $charge_bl = null;
                    return response()->json([
                        "status"=>false,
                        "data"=>$charge_bl
                    ]);
            }

            $charge = AgentContractCharge::with(['charge','unit'])->where("agent_contract_service_id", $service->id)->get();
            $charge_bl = [];
            //return response()->json($charge);
            foreach($charge as $row){
                $shipping = ShippingInstruction::where("loading_report_bl_id", $bl->loading_report_bl_id)->get();
                if($row->unit->unit_name == "KG"){
                    $chw = $shipping->sum(fn($r) => $r->order->chw);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $row->amount_per_unit * $chw;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $chw;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }else if($row->unit->unit_name == "SHIPMENT"){
                    $count = count($shipping);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){

                        $amount_in_usd = $row->amount_per_unit * $count;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $count;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }else if($row->unit->unit_name == "CONTAINER"){
                    $currency = Currency::find($row->currency_id);
                    $jum = 0;

                    foreach($container as $x){

                        if (substr($x->container_type, 0, 5) == '20 FT') {
                            if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->twenty_feet_goh;
                            } else {
                                $jum += $row->twenty_feet;
                            }
                        } else if (substr($x->container_type, 0, 5) == '40 FT') {

                            if (strpos($x->container_type, 'HC GOH') !== false) {
                                $jum += $row->forty_feet_hc_goh;
                            } else if (strpos($x->container_type, 'HC') !== false) {
                                $jum += $row->forty_feet_hc;
                            } else if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->forty_feet_goh;
                            } else {
                                $jum += $row->forty_feet;
                            }
                        } else if (substr($x->container_type, 0, 5) == '45 FT') {
                            if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->forty_five_feet_goh;
                            } else {
                                $jum += $row->forty_five_feet;
                            }
                        }
                    }

                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $jum;
                        $amount_in_aed = $jum * 3.67;
                    }else{
                        $amount_in_aed = $jum;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $jum;
                }
                $charge_bl[] = [
                    "charge_id"=>$row->charge_id,
                    "charge_name"=>$row->charge->charge_name,
                    "charge_code"=>$row->charge->charge_code,
                    "currency_id"=>$row->currency_id,
                    "rate"=>$rate,
                    "amount_in_usd"=> $amount_in_usd,
                    "amount_in_aed"=>$amount_in_aed,
                    "status"=>'Debit'
                ];
            }

            if(!empty($charge_bl)){
                return response()->json([
                    "status"=>true,
                    "data"=>$charge_bl
                ]);
            }else{
                $charge_bl = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
            }

    }

    public function contractmawb($id, $mawb_number){
        $lp = LoadingPlan::where("mawb_number", $mawb_number)->first();
        $contract = AgentContract::where("customer_id",$id)->first();
        if($contract == null){
            $charge_mawb = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
        }
        $ship = ShippingInstruction::where("loading_plan_dxb", $lp->plan_id)->first();

            $service = AgentContractService::where("agent_contract_id", $contract->id)->where('carrier_id',$lp->carrier_id)->whereHas('serviceType', function ($query) use ($ship) {
                $query->where("service_code", 'AIR');
            })->where('por_country_id', $ship->origin->country_id)->where('por_port_id',$ship->port_of_loading);
            if($service->exists()){
                $service = $service->first();
            }else{
                $service = AgentContractService::where("agent_contract_id", $contract->id)->where('carrier_id',$lp->carrier_id)->whereHas('serviceType', function ($query) use ($ship) {
                    $query->where("service_code", 'AIR');
                })->first();
                if(!$service){
                    $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($ship) {
                    })->first();
                }
            }

            if($service == null){
                $charge_mawb = null;
                    return response()->json([
                        "status"=>false,
                        "data"=>$charge_mawb
                    ]);
            }

            $charge = AgentContractCharge::with(['charge','unit'])->where("agent_contract_service_id", $service->id)->get();
            $charge_mawb = [];
            foreach($charge as $row){
                $shipping = ShippingInstruction::where("loading_plan_dxb", $lp->plan_id)->get();
                if($row->unit->unit_name == "KG"){
                    // $chw = 0.0;
                    // foreach($shipping as $r){
                    //     $chw = $chw + $r->order->chw;
                    // }
                    $chw = $shipping->sum(fn($r) => $r->order->chw);
                    $currency = Currency::find($row->currency_id);
                    $detail = AgentContractChargeDetail::where("agent_contract_charge_id", $row->id)->where('from','<=', $chw)->where('to','>=', $chw)->first();
                    $jum = $detail->value ?? 0;
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $jum;
                        $amount_in_aed = $jum * 3.67;
                    }else{
                        $amount_in_aed = $jum;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $jum;
                }else if($row->unit->unit_name == "SHIPMENT"){
                    $count = count($shipping);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $row->amount_per_unit * $count;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $count;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }
                $charge_mawb[] = [
                    "charge_id"=>$row->charge_id,
                    "charge_name"=>$row->charge->charge_name,
                    "charge_code"=>$row->charge->charge_code,
                    "currency_id"=>$row->currency_id,
                    "rate"=>$rate,
                    "amount_in_usd"=> $amount_in_usd,
                    "amount_in_aed"=>$amount_in_aed,
                    "status"=>'Debit'
                ];
            }

            if(!empty($charge_mawb)){
                return response()->json([
                    "status"=>true,
                    "data"=>$charge_mawb
                ]);
            }else{
                $charge_mawb = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_mawb
                ]);
            }

    }

    public function contractlp($id, $loading_id){
        $bl = LoadingReportBl::where("loading_id", $loading_id)->first();
        $container = LoadingReportDetail::where("bl_id", $loading_id)->get();
        $contract = AgentContract::where("customer_id",$id)->first();
        if($contract == null){
            $charge_bl = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
        }
            $ship = ShippingInstruction::where("loading_id", $loading_id)->first();

            $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($ship) {

                    $query->whereIn('service_code',['LCL','FCL','LAND']);

            })->where('por_country_id', $ship->origin->country_id)->where('por_port_id',$ship->port_of_loading);
            if($service->exists()){
                $service = $service->first();
            }else{
                $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($ship) {

                        $query->whereIn('service_code',['LCL','FCL','LAND']);

                })->first();
            }
            if($service == null){
                $charge_bl = null;
                    return response()->json([
                        "status"=>false,
                        "data"=>$charge_bl
                    ]);
            }

            $charge = AgentContractCharge::with(['charge','unit'])->where("agent_contract_service_id", $service->id)->get();
            $charge_bl = [];
            //return response()->json($charge);
            foreach($charge as $row){
                $shipping = ShippingInstruction::where("loading_report_bl_id", $bl->loading_report_bl_id)->get();
                if($row->unit->unit_name == "KG"){
                    $chw = $shipping->sum(fn($r) => $r->order->chw);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $row->amount_per_unit * $chw;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $chw;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }else if($row->unit->unit_name == "SHIPMENT"){
                    $count = count($shipping);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){

                        $amount_in_usd = $row->amount_per_unit * $count;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $count;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }else if($row->unit->unit_name == "CONTAINER"){
                    $currency = Currency::find($row->currency_id);
                    $jum = 0;

                    foreach($container as $x){

                        if (substr($x->container_type, 0, 5) == '20 FT') {
                            if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->twenty_feet_goh;
                            } else {
                                $jum += $row->twenty_feet;
                            }
                        } else if (substr($x->container_type, 0, 5) == '40 FT') {

                            if (strpos($x->container_type, 'HC GOH') !== false) {
                                $jum += $row->forty_feet_hc_goh;
                            } else if (strpos($x->container_type, 'HC') !== false) {
                                $jum += $row->forty_feet_hc;
                            } else if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->forty_feet_goh;
                            } else {
                                $jum += $row->forty_feet;
                            }
                        } else if (substr($x->container_type, 0, 5) == '45 FT') {
                            if (strpos($x->container_type, 'GOH') !== false) {
                                $jum += $row->forty_five_feet_goh;
                            } else {
                                $jum += $row->forty_five_feet;
                            }
                        }
                    }

                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $jum;
                        $amount_in_aed = $jum * 3.67;
                    }else{
                        $amount_in_aed = $jum;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $jum;
                }
                $charge_bl[] = [
                    "charge_id"=>$row->charge_id,
                    "charge_name"=>$row->charge->charge_name,
                    "charge_code"=>$row->charge->charge_code,
                    "currency_id"=>$row->currency_id,
                    "rate"=>$rate,
                    "amount_in_usd"=> $amount_in_usd,
                    "amount_in_aed"=>$amount_in_aed,
                    "status"=>'Debit'
                ];
            }

            if(!empty($charge_bl)){
                return response()->json([
                    "status"=>true,
                    "data"=>$charge_bl
                ]);
            }else{
                $charge_bl = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
            }

    }

    public function contractlpdxb($id, $loading_id){
        $shipment = ShippingInstruction::where("status", "!=", 3)
        ->where("loading_id", $loading_id)
        ->get();

        $loading_plan_dxb = $shipment->pluck('loading_plan_dxb')->toArray();

        $lp = LoadingPlan::with(['shipping' => function($q) use ($shipment) {
            $jobIds = $shipment->pluck('job_id')->toArray();
            $q->whereIn('job_id', $jobIds);
        }])->whereIn('plan_id', $loading_plan_dxb)->get();

        $contract = AgentContract::where("customer_id",$id)->first();

        if($contract == null){
            $charge_mawb = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_bl
                ]);
        }

        $ship = ShippingInstruction::whereIn("loading_plan_dxb", $loading_plan_dxb)->first();

            $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($ship) {

            })->where('por_country_id', $ship->origin->country_id)->where('por_port_id',$ship->port_of_loading);
            if($service->exists()){
                $service = $service->first();
            }else{
                $service = AgentContractService::where("agent_contract_id", $contract->id)->whereHas('serviceType', function ($query) use ($ship) {

                })->first();
            }

            if($service == null){
                $charge_mawb = null;
                    return response()->json([
                        "status"=>false,
                        "data"=>$charge_mawb
                    ]);
            }

            $charge = AgentContractCharge::with(['charge','unit'])->where("agent_contract_service_id", $service->id)->get();
            $charge_mawb = [];
            foreach($charge as $row){
                $shipping = ShippingInstruction::whereIn("loading_plan_dxb", $loading_plan_dxb)->get();
                if($row->unit->unit_name == "KG"){
                    // $chw = 0.0;
                    // foreach($shipping as $r){
                    //     $chw = $chw + $r->order->chw;
                    // }
                    $chw = $shipping->sum(fn($r) => $r->order->chw);
                    $currency = Currency::find($row->currency_id);
                    $detail = AgentContractChargeDetail::where("agent_contract_charge_id", $row->id)->where('from','<=', $chw)->where('to','>=', $chw)->first();
                    $jum = $detail->value ?? 0;
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $jum;
                        $amount_in_aed = $jum * 3.67;
                    }else{
                        $amount_in_aed = $jum;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $jum;
                }else if($row->unit->unit_name == "SHIPMENT"){
                    $count = count($shipping);
                    $currency = Currency::find($row->currency_id);
                    if($currency->currency_code == "USD"){
                        $amount_in_usd = $row->amount_per_unit * $count;
                        $amount_in_aed = $amount_in_usd * 3.67;
                    }else{
                        $amount_in_aed = $row->amount_per_unit * $count;
                        $amount_in_usd = $amount_in_aed / 3.67;
                    }
                    $rate = $row->amount_per_unit;
                }

                $charge_mawb[] = [
                    "charge_id"=>$row->charge_id,
                    "charge_name"=>$row->charge->charge_name,
                    "charge_code"=>$row->charge->charge_code,
                    "currency_id"=>$row->currency_id,
                    "rate"=>$rate,
                    "amount_in_usd"=> $amount_in_usd,
                    "amount_in_aed"=>$amount_in_aed,
                    "status"=>'Debit'
                ];
            }

            if(!empty($charge_mawb)){
                return response()->json([
                    "status"=>true,
                    "data"=>$charge_mawb
                ]);
            }else{
                $charge_mawb = null;
                return response()->json([
                    "status"=>false,
                    "data"=>$charge_mawb
                ]);
            }

    }

    public function status($id, $status){
        $costing = Costing::find($id);
        $costing->status = $status;
        $costing->save();
        return to_route('finance.costing.sea-air.show',$costing->job_order_id)->with('toastSuccess', "Update Success");
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_air_' . time() . '.csv';
        return Excel::download(new SeaAirExport, $file_name);
    }





}
