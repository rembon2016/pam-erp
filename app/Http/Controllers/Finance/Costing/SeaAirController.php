<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing;

use App\Models\Operation\Origin\JobOrder;
use App\Models\Operation\Origin\OperationDocument;
use App\Models\Operation\Origin\LoadingPlanDocument;
use App\Models\Operation\Origin\LoadingReportDetail;
use App\Models\Operation\Master\Port;
use App\Models\Operation\Master\Vendor;
use App\Models\Finance\Charge;
use App\Models\Finance\Currency;

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

                $q->where('job_order_code', 'ilike', "%{$search}%");

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
        return view('pages.finance.costing.sea-air.cost', compact('id','joborder','loading','port','vendor_truck','vendor_port','vendor_air','vendor_line','charge','currency'));
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_air_' . time() . '.csv';
        return Excel::download(new SeaAirExport, $file_name);
    }





}
