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
            $data = $joborder->skip($start)->take($pageSize)->latest()->get();

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

        return view('pages.finance.costing.sea-air.cost', compact('id','joborder','loading','port','vendor_truck','vendor_port','vendor_air','vendor_line','charge','currency','bl','loadingplan'));
    }

    public function store(Request $request){
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
                $vendor_name = $request->vendor_truck_name[$k];
                $data_vendor_trucking = [
                    'costing_id' => $costing->id,
                    'container_no'=> $row->container_no,
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
                $vendor_name = $request->vendor_air_name[$k];
                $data_vendor_agent = [
                    'costing_id' => $costing->id,
                    'mawb'=> $row->mawb,
                    'vendor_id'=> $row,
                    'vendor_name'=> $vendor_name,
                    'created_by' => auth()->user()->email
                ];
                CostingVendorAgent::create($data_air_agent);
            }
        }

        if(!empty($request->vendor_special_import_id)){
            foreach($request->vendor_special_import_id as $k => $row){
                $vendor_name = $request->vendor_special_import_name[$k];
                $charge_id = $request->charge_special_import_id[$k];
                $charge_name = $request->charge_special_import_name[$k];
                $currency_id = $request->currency_special_import_id[$k];
                $rate = $request->rate_special_import[$k];
                $amount = $request->amount_special_import[$k];
                $local_amount = $request->local_amount_special_import[$k];
                $status = $request->status_amount_special_import[$k];
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
                $vendor_name = $request->vendor_special_export_name[$k];
                $charge_id = $request->charge_special_export_id[$k];
                $charge_name = $request->charge_special_export_name[$k];
                $currency_id = $request->currency_special_export_id[$k];
                $rate = $request->rate_special_export[$k];
                $amount = $request->amount_special_export[$k];
                $local_amount = $request->local_amount_special_export[$k];
                $status = $request->status_amount_special_export[$k];
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


    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_air_' . time() . '.csv';
        return Excel::download(new SeaAirExport, $file_name);
    }





}
