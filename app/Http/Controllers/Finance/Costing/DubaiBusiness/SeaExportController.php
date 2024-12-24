<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing\DubaiBusiness;

use App\Models\Operation\Dxb\JobOrder;
use App\Models\Operation\Dxb\OperationDocument;
use App\Models\Operation\Dxb\LoadingPlanDocument;
use App\Models\Operation\Dxb\LoadingReportDetail;
use App\Models\Operation\Dxb\LoadingReportBL;
use App\Models\Operation\Dxb\ShippingInstruction;
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
use App\Exports\Costing\DubaiBusiness\SeaExportExport;

final class SeaExportController extends Controller
{

    public function index(): View
    {
        return view('pages.finance.costing.dubai-business.sea-export.index');
    }


    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('job_order_type','SEAEXPORT')->where('status','!=',3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loading'])->where('job_order_type','SEAEXPORT')->where('status','!=',3);
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
                        'show' => route('finance.costing.dubai-business.sea-import.show', $item->job_order_id),
                        'cost' => route('finance.costing.dubai-business.sea-import.cost', $item->job_order_id),
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
        return view('pages.finance.costing.dubai-business.sea-export.show', compact('id','joborder','op','lpdoc','costing'));
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

    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_export_' . time() . '.csv';
        return Excel::download(new SeaExportExport, $file_name);
    }
}
