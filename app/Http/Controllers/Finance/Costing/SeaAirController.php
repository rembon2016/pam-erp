<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing;

use App\Exports\Costing\SeaAirExport;
use App\Functions\Convert;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Models\Finance\Charge;
use App\Models\Finance\Costing;
use App\Models\Finance\CostingDetail;
use App\Models\Finance\Currency;
use App\Models\Operation\Dxb\LoadingPlan;
use App\Models\Operation\Origin\JobOrder;
use App\Models\Operation\Origin\LoadingPlanDocument;
use App\Models\Operation\Origin\LoadingReportBL;
use App\Models\Operation\Origin\LoadingReportDetail;
use App\Models\Operation\Origin\OperationDocument;
use App\Models\Operation\Origin\ShippingInstruction;
use App\Service\Finance\Costing\CostingService;
use App\Service\Finance\Costing\DataService;
use App\Service\Finance\Costing\Origin\CalculationService;
use App\Service\Finance\Costing\Origin\FilterService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Cache;

final class SeaAirController extends Controller
{
    public function __construct(
        protected CostingService $costingService,
        protected CalculationService $calculationService,
        protected DataService $dataService

    ) {}

    public function index(FilterService $filterService): View
    {
        return view('pages.finance.costing.sea-air.index');
    }

    public function list(Request $request): JsonResponse
    {
        $data = $this->dataService->getJobOrders($request);

        if (request()->ajax()) {
            return DataTables::of($data['data'])
                ->addIndexColumn()
                ->with([
                    'draw' => $request->query('draw'),
                    'recordsTotal' => $data['totalRecords'],
                    'recordsFiltered' => $data['filteredRecords'],
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
                        'show' => route('finance.costing.sea-air.show', $item->job_order_id),
                        'cost' => route('finance.costing.sea-air.cost', $item->job_order_id),
                    ]);
                })
                ->rawColumns(['action'])
                ->setTotalRecords($data['totalRecords'])
                ->setFilteredRecords($data['filteredRecords'])
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

        return view('pages.finance.costing.sea-air.show', compact('id', 'joborder', 'op', 'lpdoc', 'costing'));
    }

    public function port(Request $request)
    {
        $result = $this->dataService->getPort($request);

        return response()->json($result);
    }

    public function cost($id)
    {

        $joborder = JobOrder::with(['detail', 'loading', 'doc'])->findOrFail($id);

        $loading = LoadingReportDetail::with('bl')->where('status', '!=', 3)->where('bl_id', $joborder->loading_plan_id)->get();

        $vendors = $this->dataService->getCustomers();


        [
            'vendor_all'   => $vendor_all,
            'vendor_truck' => $vendor_truck,
            'vendor_port'  => $vendor_port,
            'vendor_air'   => $vendor_air,
            'vendor_line'  => $vendor_line
        ] = $vendors;



        $charge = Cache::remember('charges', now()->addMinutes(5), function () {
            return Charge::select('id', 'charge_code', 'charge_name')
                ->whereNull('deleted_at')
                ->get();
        });
        $currency = Currency::select('id','currency_code')->whereNull('deleted_at')->get();
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $joborder->loading_plan_id)->where('status', '!=', 3)->get();

        $ship = ShippingInstruction::where('status', '!=', 3)
            ->where('loading_id', $joborder->loading_plan_id)
            ->get();

        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();

        $loadingplan = LoadingPlan::with(['shipping' => function ($q) use ($ship) {
            $jobIds = $ship->pluck('job_id')->toArray();
            $q->whereIn('job_id', $jobIds);
        }])->whereIn('plan_id', $loading_plan_dxb)->get();
        $cost = Costing::with(['truck', 'port', 'agent', 'special', 'head', 'head.detail'])->where('job_order_id', $joborder->job_order_id);
        if ($cost->exists()) {
            $costing = $cost->first();
            $details = CostingDetail::with('currency')->selectRaw('costing_id,vendor_id,vendor_name, SUM(amount) as total_amount,currency_id')
                ->groupBy('costing_id', 'vendor_id', 'vendor_name', 'currency_id')
                ->where('costing_id', $costing->id)
                ->get();
            // return response()->json($details);
            $data = [
                'action' => route('finance.costing.sea-air.update', $costing->id),
                'method' => 'PUT',
            ];
        } else {
            $costing = null;
            $details = null;
            $data = [
                'action' => route('finance.costing.sea-air.store'),
                'method' => 'POST',
            ];
        }

        return view('pages.finance.costing.sea-air.cost', compact('id', 'joborder', 'loading', 'vendor_truck', 'vendor_port', 'vendor_air', 'vendor_line', 'charge', 'currency', 'bl', 'loadingplan', 'costing', 'data', 'vendor_all', 'details'));
    }

    public function store(Request $request)
    {

        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status', '!=', 3)->get();
        $ship = ShippingInstruction::where('status', '!=', 3)->where('loading_id', $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
        //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $shipment_by = 'SEAAIR';
        $costing = $this->costingService->createCosting($request);

        $this->costingService->createCostingTruck($request, $costing->id);

        $this->costingService->createCostingPort($request, $costing->id);

        $this->costingService->createCostingAgent($request, $costing->id);

        $this->costingService->createCostingSpecialImport($request, $costing->id);

        $this->costingService->createCostingSpecialExport($request, $costing->id);

        foreach ($bl as $j => $rx) {
            if (! empty($request["vendor_bl_{$j}_id"])) {
                $costing_head = $this->costingService->createCostingHead($request, $costing->id, $rx->bl_number, 'bl', 'SEAAIR', $rx->loading_report_bl_id);

                $this->costingService->createCostingDetailBl($request, $costing->id, $rx->bl_number, $shipment_by, $costing_head->id, $j);

                foreach ($rx->shipping as $m => $r) {
                    $this->costingService->createCostingDetailCtd($request, $costing->id, $r->ctd_number, $shipment_by, $costing_head->id, $m);
                }
            }
        }

        foreach ($loadingplan as $j => $rx) {
            if (! empty($request["vendor_mawb_{$j}_id"])) {
                $costing_head = $this->costingService->createCostingHead($request, $costing->id, $rx->mawb_number, 'mawb', 'SEAAIR', $rx->plan_id);

                $this->costingService->createCostingDetailMawb($request, $costing->id, $rx->mawb_number, $shipment_by, $costing_head->id, $j);
            }
        }

        return to_route('finance.costing.sea-air.index')->with('toastSuccess', 'Costing Success');
    }

    public function update($id, Request $request)
    {
        $costing = Costing::find($id);
        $bl = LoadingReportBl::with('shipping')->where('loading_id', $request->loading_plan_id)->where('status', '!=', 3)->get();
        $ship = ShippingInstruction::where('status', '!=', 3)->where('loading_id', $request->loading_plan_id)->get();
        $loading_plan_dxb = $ship->pluck('loading_plan_dxb')->toArray();
        //return response()->json($ship);
        $loadingplan = LoadingPlan::with('shipping')->whereIn('plan_id', $loading_plan_dxb)->get();
        $shipment_by = 'SEAAIR';
        $costing = $this->costingService->updateCosting($request, $id);

        $this->costingService->updateCostingTruck($request, $id);

        $this->costingService->updateCostingPort($request, $id);

        $this->costingService->updateCostingAgent($request, $id);

        $this->costingService->updateCostingSpecialImport($request, $id);

        $this->costingService->updateCostingSpecialExport($request, $id);

        foreach ($bl as $j => $rx) {
            if (! empty($request["vendor_bl_{$j}_id"])) {

                $costing_head = $this->costingService->updateCostingHead($request, $id, $rx->bl_number, 'bl', 'SEAAIR', $rx->loading_report_bl_id);

                $this->costingService->updateCostingDetailBl($request, $id, $rx->bl_number, $shipment_by, $costing_head->id, $j);

                foreach ($rx->shipping as $m => $r) {
                    $this->costingService->updateCostingDetailCtd($request, $id, $r->ctd_number, $shipment_by, $costing_head->id, $m);
                }
            }
        }

        foreach ($loadingplan as $j => $rx) {
            if (! empty($request["vendor_mawb_{$j}_id"])) {

                $costing_head = $this->costingService->updateCostingHead($request, $id, $rx->mawb_number, 'mawb', 'SEAAIR', $rx->plan_id);

                $this->costingService->updateCostingDetailMawb($request, $id, $rx->mawb_number, $shipment_by, $costing_head->id, $j);

            }
        }

        return to_route('finance.costing.sea-air.index')->with('toastSuccess', 'Update Success');
    }

    public function contractbl($id, $bl_number, $type)
    {
        $result = $this->calculationService->getChargeByBl($id, $bl_number, $type);

        return response()->json($result);
    }

    public function contractmawb($id, $mawb_number, $type)
    {
        $result = $this->calculationService->getChargeByMawb($id, $mawb_number, $type, 'SEAAIR');

        return response()->json($result);

    }

    public function contractlp($id, $loading_id)
    {
        $result = $this->calculationService->getChargeImportByLp($id, $loading_id);

        return response()->json($result);

    }

    public function contractlpdxb($id, $loading_id)
    {
        $result = $this->calculationService->getChargeExportByLp($id, $loading_id, 'SEAAIR');

        return response()->json($result);
    }

    public function status($id, $status)
    {
        $costing = Costing::find($id);
        $costing->status = $status;
        $costing->save();

        return to_route('finance.costing.sea-air.show', $costing->job_order_id)->with('toastSuccess', 'Update Success');
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_sea_air_'.time().'.csv';

        return Excel::download(new SeaAirExport, $file_name);
    }
}
