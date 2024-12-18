<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing;

use App\Models\Operation\Origin\JobOrderAir;
use App\Models\Operation\Origin\OperationDocument;
use App\Models\Operation\Origin\LoadingPlanDocument;

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
use App\Exports\Costing\CrossAirExport;

final class CrossAirController extends Controller
{

    public function index(): View
    {
        return view('pages.finance.costing.cross-air.index');
    }


    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrderAir::select('job_order_id')->where('status','!=',3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrderAir::with(['detail', 'loadingplan','lpdetail','lparrival'])->where('status','!=',3);
            $joborder->when(!empty($request['search']['value']), function ($query) use ($request) {
                $search = $request['search']['value'];

                $q->where('job_order_code', 'ilike', "%{$search}%");

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
                ->editColumn('mawb_number', function ($item) {
                    return $item->loadingplan->mawb_number ?? "";
                })
                ->editColumn('carrier', function ($item) {
                    return $item->loadingplan->carrier_name ?? "";
                })
                ->editColumn('etd', function ($item) {
                    return Convert::date($item->lpdetail->date_departure) ?? "";
                })
                ->editColumn('eta', function ($item) {
                    return Convert::date($item->lparrival->date_arival) ?? "";
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
                        'show' => route('finance.costing.cross-air.show', $item->job_order_id),
                        'cost' => route('finance.costing.cross-air.cost', $item->job_order_id),
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
        $joborder = JobOrderAir::with(['detail', 'loading','doc'])->findOrFail($id);
        $op = OperationDocument::where('job_order_id', $id)->first();
        $lpdoc = LoadingPlanDocument::where('loading_id', $joborder->loading_plan_id)->get();
        return view('pages.finance.costing.cross-air.show', compact('id','joborder','op','lpdoc'));
    }

    public function cost($id){

    }

    public function exportCsv()
    {
        $file_name = 'list_costing_cross_air_' . time() . '.csv';
        return Excel::download(new CrossAirExport, $file_name);
    }





}
