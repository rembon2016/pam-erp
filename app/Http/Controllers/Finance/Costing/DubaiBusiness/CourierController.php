<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Costing\DubaiBusiness;

use App\Exports\Costing\DubaiBusiness\CourierExport;
use App\Functions\Convert;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Models\Finance\Costing;
use App\Models\Operation\Dxb\JobOrder;
use App\Models\Operation\Dxb\LoadingPlanDocument;
use App\Models\Operation\Dxb\OperationDocument;
use App\Models\Operation\Master\Port;
use App\Models\Finance\Charge;
use App\Models\Finance\CostingDetail;
use App\Models\Finance\Currency;
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

final class CourierController extends Controller
{
    public function __construct(
        protected CostingService $costingService,
        protected CalculationService $calculationService,
        protected DataService $dataService

    ) {}
    public function index(): View
    {
        return view('pages.finance.costing.dubai-business.courier.index');
    }

    public function list(Request $request): JsonResponse
    {
        if (request()->ajax()) {
            $count_total = JobOrder::select('job_order_id')->where('job_order_type', 'COURIER')->where('status', '!=', 3)->count();
            $start = ($request->start) ? $request->start : 0;
            $pageSize = ($request->length) ? $request->length : 10;
            $draw = $request->query('draw');

            $joborder = JobOrder::with(['detail', 'loading','costing'])->where('job_order_type', 'COURIER')->where('status', '!=', 3);
            $joborder->when(! empty($request['search']['value']), function ($query) use ($request) {
                $search = $request['search']['value'];

                $query->where('job_order_code', 'ilike', "%{$search}%");

            });
            $joborder->when(!empty(request()->get('status_filter')), function ($query) {
                return $query->whereHas('costing', function ($query) {
                    return $query
                        ->when(request()->get('status_filter') == 'open', function ($query) {
                            return $query->whereIn('status', [1, 3]);
                        })
                        ->when(request()->get('status_filter') == 'closed', function ($query) {
                            return $query->where('status', 2);
                        });
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
                ->editColumn('courier_no', function ($item) {
                    return $item->loading_plan_number ?? '';
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
                        'show' => route('finance.costing.dubai-business.courier.show', $item->job_order_id),
                        'cost' => route('finance.costing.dubai-business.courier.cost', $item->job_order_id),
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

        return view('pages.finance.costing.dubai-business.courier.show', compact('id', 'joborder', 'op', 'lpdoc', 'costing'));
    }

    public function port(Request $request)
    {
        $result = $this->dataService->getPort($request);

        return response()->json($result);
    }

    public function cost($id) {
        $joborder = JobOrder::with(['detail', 'loading', 'doc','detail.shipping'])->findOrFail($id);

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

        $cost = Costing::with(['truck', 'port', 'agent', 'special', 'head', 'head.detail'])->where('job_order_id', $joborder->job_order_id);
        if ($cost->exists()) {
            $costing = $cost->first();
            $details = CostingDetail::with('currency')->selectRaw('costing_id,vendor_id,vendor_name, SUM(amount) as total_amount,currency_id')
                ->groupBy('costing_id', 'vendor_id', 'vendor_name', 'currency_id')
                ->where('costing_id', $costing->id)
                ->get();
            // return response()->json($details);
            $data = [
                'action' => route('finance.costing.dubai-business.courier.update', $costing->id),
                'method' => 'PUT',
            ];
        } else {
            $costing = null;
            $details = null;
            $data = [
                'action' => route('finance.costing.dubai-business.courier.store'),
                'method' => 'POST',
            ];
        }

        return view('pages.finance.costing.dubai-business.courier.cost', compact('id', 'joborder','vendor_truck', 'vendor_port', 'vendor_air', 'vendor_line', 'charge', 'currency','costing', 'data', 'vendor_all', 'details'));
    }

    public function store(Request $request)
    {

        $joborder = JobOrder::find($request->job_order_id);
        $shipment_by = 'COURIER';
        $costing = $this->costingService->createCosting($request);

        $this->costingService->createCostingSpecialOther($request, $costing->id);


            if (! empty($request["vendor_other_0_id"])) {
                $costing_head = $this->costingService->createCostingHead($request, $costing->id, $joborder->loading_plan_number, 'other', 'COURIER', null);

                $this->costingService->createCostingDetailOther($request, $costing->id,$joborder->loading_plan_number, $shipment_by, $costing_head->id, 0);
            }


        return to_route('finance.costing.dubai-business.courier.index')->with('toastSuccess', 'Costing Success');
    }


    public function update($id, Request $request)
    {
        $costing = Costing::find($id);
        $joborder = JobOrder::find($request->job_order_id);
        $shipment_by = 'COURIER';
        $costing = $this->costingService->updateCosting($request, $id);
        $this->costingService->updateCostingSpecialOther($request, $id);

            if (! empty($request["vendor_other_0_id"])) {

                $costing_head = $this->costingService->updateCostingHead($request, $id, $joborder->loading_plan_number, 'other', 'COURIER', null);

                $this->costingService->updateCostingDetailOther($request, $id, $joborder->loading_plan_number, $shipment_by, $costing_head->id, 0);
            }



        return to_route('finance.costing.dubai-business.courier.index')->with('toastSuccess', 'Update Success');
    }

    public function contract($id, $numbers, $type)
    {
        $result = $this->calculationService->getChargeByCourier($id, $numbers, $type);

        return response()->json($result);
    }

    public function exportCsv()
    {
        $file_name = 'list_costing_courier_'.time().'.csv';

        return Excel::download(new CourierExport, $file_name);
    }
}
