<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing\DubaiBusiness;

use App\Exports\Costing\DubaiBusiness\AirExportExport;
use App\Functions\Convert;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Models\Finance\Charge;
use App\Models\Finance\Costing;
use App\Models\Finance\Currency;
use App\Models\Operation\Dxb\JobOrder;
use App\Models\Operation\Dxb\LoadingPlanLocal as LoadingPlan;
use App\Models\Operation\Dxb\LoadingPlanDocument;
use App\Models\Operation\Dxb\OperationDocument;
use App\Service\Finance\Costing\CostingService;
use App\Service\Finance\Costing\DataService;
use App\Service\Finance\Costing\Dxb\CalculationService;
use App\Models\Operation\Master\Port;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Cache;

final class AirExportController extends Controller
{
    public function __construct(
        protected CostingService $costingService,
        protected CalculationService $calculationService,
        protected DataService $dataService

    ) {}
    public function index(): View
    {
        return view('pages.finance.costing.dubai-business.air-export.index');
    }

    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('job_order_type', 'AIREXPORT')->where('status', '!=', 3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loadingplan','costing','lpdetail','lparrival'])->where('job_order_type', 'AIREXPORT')->where('status', '!=', 3);
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
                        'show' => route('finance.costing.dubai-business.air-export.show', $item->job_order_id),
                        'cost' => route('finance.costing.dubai-business.air-export.cost', $item->job_order_id),
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

        return view('pages.finance.costing.dubai-business.air-export.show', compact('id', 'joborder', 'op', 'lpdoc', 'costing'));
    }

    public function port(Request $request)
    {
        $result = $this->dataService->getPort($request);

        return response()->json($result);
    }

    public function cost($id)
    {
        $joborder = JobOrder::with(['detail', 'loading', 'doc'])->findOrFail($id);

        $vendors = $this->dataService->getCustomers();

        $vendor_all   = $vendors['vendor_all'];
        $vendor_truck = $vendors['vendor_truck'];
        $vendor_port  = $vendors['vendor_port'];
        $vendor_air   = $vendors['vendor_air'];
        $vendor_line  = $vendors['vendor_line'];

        $charge = Cache::remember('charges', now()->addMinutes(5), function () {
            return Charge::select('id', 'charge_code', 'charge_name')
                ->whereNull('deleted_at')
                ->get();
        });
        $currency = Currency::whereNull('deleted_at')->get();

        $loadingplan = LoadingPlan::where('plan_id', $joborder->loading_plan_id)->get();
        $loading = LoadingPlan::where('plan_id', $joborder->loading_plan_id)->first();

        $cost = Costing::with(['truck', 'port', 'agent', 'special', 'head', 'head.detail'])->where('job_order_id', $joborder->job_order_id);
        if ($cost->exists()) {
            $costing = $cost->first();
            //return response()->json($costing);
            $data = [
                'action' => route('finance.costing.dubai-business.air-export.update', $costing->id),
                'method' => 'PUT',
            ];
        } else {
            $costing = null;
            $data = [
                'action' => route('finance.costing.dubai-business.air-export.store'),
                'method' => 'POST',
            ];
        }

        return view('pages.finance.costing.dubai-business.air-export.cost', compact('joborder', 'vendor_all', 'vendor_truck', 'vendor_port', 'vendor_air', 'vendor_line', 'charge', 'currency', 'loadingplan', 'costing', 'data', 'loading'));

    }

    public function store(Request $request)
    {
        $loadingplan = LoadingPlan::with('shipping')->where('plan_id', $request->loading_plan_id)->get();
        $shipment_by = 'AIREXPORT';
        $costing = $this->costingService->createCosting($request);

        //$this->costingService->createCostingTruck($request, $costing->id);
        $this->costingService->createCostingAgent($request, $costing->id);
        $this->costingService->createCostingSpecialExport($request, $costing->id);

        foreach ($loadingplan as $j => $rx) {
            if (! empty($request["vendor_mawb_{$j}_id"])) {
                $costing_head = $this->costingService->createCostingHead($request, $costing->id, $rx->mawb_number, 'mawb', 'AIREXPORT', $rx->plan_id);

                $this->costingService->createCostingDetailMawb($request, $costing->id, $rx->mawb_number, $shipment_by, $costing_head->id, $j);
            }
        }

        return to_route('finance.costing.dubai-business.air-export.index')->with('toastSuccess', 'Costing Success');
    }

    public function update($id, Request $request)
    {
        $costing = Costing::find($id);
        $loadingplan = LoadingPlan::with('shipping')->where('plan_id', $request->loading_plan_id)->get();
        $shipment_by = 'AIREXPORT';
        $costing = $this->costingService->updateCosting($request, $id);

        //$this->costingService->updateCostingTruck($request, $id);
        $this->costingService->updateCostingAgent($request, $id);
        $this->costingService->updateCostingSpecialExport($request, $id);

        foreach ($loadingplan as $j => $rx) {
            if (! empty($request["vendor_mawb_{$j}_id"])) {

                $costing_head = $this->costingService->updateCostingHead($request, $id, $rx->mawb_number, 'mawb', 'AIREXPORT', $rx->plan_id);

                $this->costingService->updateCostingDetailMawb($request, $id, $rx->mawb_number, $shipment_by, $costing_head->id, $j);

            }
        }

        return to_route('finance.costing.dubai-business.air-export.index')->with('toastSuccess', 'Update Success');
    }

    public function contractmawb($id, $mawb_number, $type)
    {
        $result = $this->calculationService->getChargeByMawb($id, $mawb_number, $type, 'AIREXPORT');

        return response()->json($result);

    }

    public function contractlpdxb($id, $loading_id)
    {
        $result = $this->calculationService->getChargeExportByLp($id, $loading_id, 'AIREXPORT');

        return response()->json($result);
    }

    public function status($id, $status)
    {
        $costing = Costing::find($id);
        $costing->status = $status;
        $costing->save();

        return to_route('finance.costing.dubai-business.air-export.show', $costing->job_order_id)->with('toastSuccess', 'Update Success');
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_air_export_'.time().'.csv';

        return Excel::download(new AirExportExport, $file_name);
    }
}
