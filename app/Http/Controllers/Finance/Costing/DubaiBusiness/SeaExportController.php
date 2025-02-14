<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing\DubaiBusiness;

use App\Exports\Costing\DubaiBusiness\SeaExportExport;
use App\Functions\Convert;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Models\Finance\Costing;
use App\Models\Operation\Dxb\JobOrder;
use App\Models\Operation\Dxb\LoadingPlanDocument;
use App\Models\Operation\Dxb\LoadingReportDetail;
use App\Models\Operation\Dxb\OperationDocument;
use App\Models\Operation\Dxb\ShippingInstruction;
use App\Models\Operation\Dxb\LoadingReportBl;
use App\Models\Finance\Charge;
use App\Models\Finance\CostingDetail;
use App\Models\Finance\Currency;
use App\Models\Operation\Master\Port;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\Costing\CostingService;
use App\Service\Finance\Costing\DataService;
use App\Service\Finance\Costing\Dxb\CalculationService;
use Illuminate\Support\Facades\Cache;

final class SeaExportController extends Controller
{
    public function __construct(
        protected CostingService $costingService,
        protected CalculationService $calculationService,
        protected DataService $dataService

    ) {}

    public function index(): View
    {
        return view('pages.finance.costing.dubai-business.sea-export.index');
    }

    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('job_order_type', 'SEAEXPORT')->where('status', '!=', 3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loading','origin','costing'])->where('job_order_type', 'SEAEXPORT')->where('status', '!=', 3);
            $joborder->when(! empty($request['search']['value']), function ($query) use ($request) {
                $search = $request['search']['value'];

                $query->where('job_order_code', 'ilike', "%{$search}%");

            });
            $joborder->when(!empty(request()->get('vessel_filter')), function ($query) {
                return $query->where('vessel_id', request()->get('vessel_filter'));
            });
            $joborder->when(!empty(request()->get('voyage_filter')), function ($query) {
                return $query->whereHas('loading', function ($query) {
                    return $query->where('voyage_number', request()->get('voyage_filter'));
                });
            });
            $joborder->when(!empty(request()->get('origin_filter')), function ($query) {
                return $query->where('origin_name', 'ilike', "%".request()->get('origin_filter')."%");
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
                ->editColumn('origin', function ($item) {
                    return $item->origin->city ?? '';
                })
                ->editColumn('vessel', function ($item) {
                    return $item->loading->vessel_name ?? '';
                })
                ->editColumn('voyage', function ($item) {
                    return $item->loading->voyage_number ?? '';
                })
                ->editColumn('eta', function ($item) {
                    return Convert::date($item->eta_dubai) ?? '';
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
                        'show' => route('finance.costing.dubai-business.sea-export.show', $item->job_order_id),
                        'cost' => route('finance.costing.dubai-business.sea-export.cost', $item->job_order_id),
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

        return view('pages.finance.costing.dubai-business.sea-export.show', compact('id', 'joborder', 'op', 'lpdoc', 'costing'));
    }

    public function port(Request $request)
    {
        $result = $this->dataService->getPort($request);

        return response()->json($result);
    }

    public function cost($id) {
        $joborder = JobOrder::with(['detail', 'loading', 'doc'])->findOrFail($id);

        $loading = LoadingReportDetail::with('bl')->where('status', '!=', 3)->where('bl_id', $joborder->loading_plan_id)->get();



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
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $joborder->loading_plan_id)->where('status', '!=', 3)->get();


        $cost = Costing::with(['truck', 'port', 'agent', 'special', 'head', 'head.detail'])->where('job_order_id', $joborder->job_order_id);
        if ($cost->exists()) {
            $costing = $cost->first();
            $details = CostingDetail::with('currency')->selectRaw('costing_id,vendor_id,vendor_name, SUM(amount) as total_amount,currency_id')
                ->groupBy('costing_id', 'vendor_id', 'vendor_name', 'currency_id')
                ->where('costing_id', $costing->id)
                ->get();
            // return response()->json($details);
            $data = [
                'action' => route('finance.costing.dubai-business.sea-export.update', $costing->id),
                'method' => 'PUT',
            ];
        } else {
            $costing = null;
            $details = null;
            $data = [
                'action' => route('finance.costing.dubai-business.sea-export.store'),
                'method' => 'POST',
            ];
        }

        return view('pages.finance.costing.dubai-business.sea-export.cost', compact('id', 'joborder', 'loading', 'vendor_truck', 'vendor_port', 'vendor_air', 'vendor_line', 'charge', 'currency', 'bl','costing', 'data', 'vendor_all', 'details'));
    }

    public function store(Request $request)
    {

        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status', '!=', 3)->get();
        $shipment_by = 'SEAEXPORT';
        $costing = $this->costingService->createCosting($request);

        $this->costingService->createCostingTruck($request, $costing->id);

        $this->costingService->createCostingPort($request, $costing->id);


        $this->costingService->createCostingSpecialImport($request, $costing->id);

        foreach ($bl as $j => $rx) {
            if (! empty($request["vendor_bl_{$j}_id"])) {
                $costing_head = $this->costingService->createCostingHead($request, $costing->id, $rx->bl_number, 'bl', 'SEAEXPORT', $rx->loading_report_bl_id);

                $this->costingService->createCostingDetailBl($request, $costing->id, $rx->bl_number, $shipment_by, $costing_head->id, $j);

                foreach ($rx->shipping as $m => $r) {
                    $this->costingService->createCostingDetailCtd($request, $costing->id, $r->ctd_number, $shipment_by, $costing_head->id, $m);
                }
            }
        }

        return to_route('finance.costing.dubai-business.sea-export.index')->with('toastSuccess', 'Costing Success');
    }

    public function update($id, Request $request)
    {
        $costing = Costing::find($id);
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status', '!=', 3)->get();
        $shipment_by = 'SEAEXPORT';
        $costing = $this->costingService->updateCosting($request, $id);

        $this->costingService->updateCostingTruck($request, $id);

        $this->costingService->updateCostingPort($request, $id);

        $this->costingService->updateCostingAgent($request, $id);

        $this->costingService->updateCostingSpecialImport($request, $id);

        $this->costingService->updateCostingSpecialExport($request, $id);

        foreach ($bl as $j => $rx) {
            if (! empty($request["vendor_bl_{$j}_id"])) {

                $costing_head = $this->costingService->updateCostingHead($request, $id, $rx->bl_number, 'bl', 'SEAEXPORT', $rx->loading_report_bl_id);

                $this->costingService->updateCostingDetailBl($request, $id, $rx->bl_number, $shipment_by, $costing_head->id, $j);

                foreach ($rx->shipping as $m => $r) {
                    $this->costingService->updateCostingDetailCtd($request, $id, $r->ctd_number, $shipment_by, $costing_head->id, $m);
                }
            }
        }


        return to_route('finance.costing.dubai-business.sea-export.index')->with('toastSuccess', 'Update Success');
    }

    public function contractbl($id, $bl_number, $type)
    {
        $result = $this->calculationService->getChargeByBl($id, $bl_number, $type);

        return response()->json($result);
    }



    public function contractlp($id, $loading_id)
    {
        $result = $this->calculationService->getChargeImportByLp($id, $loading_id);

        return response()->json($result);

    }

    public function status($id, $status)
    {
        $costing = Costing::find($id);
        $costing->status = $status;
        $costing->save();

        return to_route('finance.costing.dubai-business.sea-export.show', $costing->job_order_id)->with('toastSuccess', 'Update Success');
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_export_'.time().'.csv';

        return Excel::download(new SeaExportExport, $file_name);
    }
}
