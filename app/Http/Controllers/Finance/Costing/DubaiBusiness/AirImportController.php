<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing\DubaiBusiness;

use App\Exports\Costing\DubaiBusiness\AirImportExport;
use App\Functions\Convert;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Models\Finance\Costing;
use App\Models\Operation\Dxb\JobOrder;
use App\Models\Operation\Dxb\LoadingPlanDocument;
use App\Models\Operation\Dxb\OperationDocument;
use App\Models\Operation\Master\Port;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class AirImportController extends Controller
{
    public function index(): View
    {
        return view('pages.finance.costing.dubai-business.air-import.index');
    }

    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('job_order_type', 'AIRIMPORT')->where('status', '!=', 3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loadingplan','costing','lpdetail','lparrival'])->where('job_order_type', 'AIRIMPORT')->where('status', '!=', 3);
            $joborder->when(! empty($request['search']['value']), function ($query) use ($request) {
                $search = $request['search']['value'];

                $query->where('job_order_code', 'ilike', "%{$search}%");

            });
            $joborder->when(!empty($request['mawb_number_filter']), function ($query) use ($request) {
                return $query->whereHas('loadingplan', function ($query) use ($request) {
                    return $query->where('mawb_number', 'ilike', "%{$request['mawb_number_filter']}%");
                });
            });
            $joborder->when(!empty($request['carrier_filter']), function ($query) use ($request) {
                return $query->whereHas('loadingplan', function ($query) use ($request) {
                    return $query->where('carrier_id', $request['carrier_filter']);
                });
            });
            $count_filter = $joborder->count();
            $data = $joborder->skip($start)->take($pageSize)->orderBy('date_order', 'DESC')->get();

            return DataTables::of($data)
                ->addIndexColumn()
                ->with([
                    'draw' => $draw,
                    'recordsTotal' => $count_total,
                    'recordsFiltered' => $count_filter,
                ])
                ->editColumn('mawb_number', function ($item) {
                    return $item->loadingplan->mawb_number ?? '';
                })
                ->editColumn('carrier', function ($item) {
                    return $item->loadingplan->carrier_name ?? '';
                })
                ->editColumn('etd', function ($item) {
                    return Convert::date($item->lpdetail->date_departure) ?? '';
                })
                ->editColumn('eta', function ($item) {
                    return Convert::date($item->lparrival->date_arival) ?? '';
                })
                ->editColumn('job_order_date', function ($item) {
                    return Convert::date($item->date_created) ?? '';
                })
                ->editColumn('status', function ($item) {
                    if (! empty($item->costing)) {
                        if ($item->costing->status == 1 || $item->costing->status == 3) {
                            return 'Open';
                        } else {
                            return 'Closed';
                        }
                    } else {
                        return '';
                    }
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'show' => route('finance.costing.dubai-business.air-import.show', $item->job_order_id),
                        'cost' => route('finance.costing.dubai-business.air-import.cost', $item->job_order_id),
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

    public function show($id)
    {
        $joborder = JobOrder::with(['detail', 'loading', 'doc'])->findOrFail($id);
        $cost = Costing::where('job_order_id', $joborder->job_order_id);
        if ($cost->exists()) {
            $costing = $cost->first();
        } else {
            $costing = null;
        }
        $op = OperationDocument::where('job_order_id', $id)->first();
        $lpdoc = LoadingPlanDocument::where('loading_id', $joborder->loading_plan_id)->get();

        return view('pages.finance.costing.dubai-business.air-import.show', compact('id', 'joborder', 'op', 'lpdoc', 'costing'));
    }

    public function port(Request $request)
    {
        $query = Port::query();

        // Apply search filter
        if ($search = $request->input('search')) {
            $query->where('port_code', 'ilike', '%'.$search.'%');
            $query->orWhere('port_name', 'ilike', '%'.$search.'%');
        }

        // Paginate the results
        $options = $query->orderBy('port_code', 'ASC')->paginate(1000); // Adjust the pagination size as needed

        return response()->json([
            'results' => $options->items(),
            'pagination' => ['more' => $options->hasMorePages()],
        ]);
    }

    public function cost($id) {}

    public function exportCsv()
    {
        $file_name = 'list_costing_air_import_'.time().'.csv';

        return Excel::download(new AirImportExport, $file_name);
    }
}
