<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Exports\MasterData\ChargeExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\Charge\GlobalChargeRequest;
use App\Models\Finance\Charge;
use App\Service\Finance\MasterData\ChargeService;
use App\Service\Finance\MasterData\ChartOfAccountService;
use App\Service\Finance\MasterData\UnitService;
use App\Service\Finance\MasterData\ServiceTypeService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class ChargeController extends Controller
{
    public function __construct(
        protected ChargeService $chargeService,
        protected UnitService $unitService,
        protected ChartOfAccountService $coaService,
        protected ServiceTypeService $serviceType
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $charges = $this->chargeService->getCharges();

        return view('pages.finance.master-data.charge.index', compact('charges'));
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->chargeService->getChargeQueries(request()->query()))
                ->addIndexColumn()
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.charge.edit', $item->id),
                        'delete' => route('finance.master-data.charge.destroy', $item->id),
                    ]);
                })
                ->editColumn('is_agreed_rate', function ($item) {
                    return $item->is_agreed_rate == 1 ? 'Yes' : 'No';
                })
                ->editColumn('revenue_id', function ($item) {
                    return $item?->revenue?->account_name ?? '-';
                })
                ->editColumn('transport_type', function ($item) {
                    return $item?->service?->service_code ?? '-';
                })
                ->editColumn('cost_id', function ($item) {
                    return $item?->cost?->account_name ?? '-';
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Charge',
            'action' => route('finance.master-data.charge.store'),
            'method' => 'POST',
        ];

        $charge = new Charge;
        $accounts = $this->coaService->getChartOfAccounts();
        $units = $this->unitService->getUnitCollections();
        $service = $this->serviceType->getServiceTypes();

        return view('pages.finance.master-data.charge.form', compact('data', 'charge', 'accounts', 'units','service'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalChargeRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createChargeResponse = $this->chargeService->createCharge(
            dto: $requestDTO
        );

        return $createChargeResponse->success
            ? to_route('finance.master-data.charge.index')->with('toastSuccess', $createChargeResponse->message)
            : back()->with('toastError', $createChargeResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getChargeResponse = $this->chargeService->getChargeById($id);
        if (! $getChargeResponse->success) {
            return to_route('finance.master-data.charge.index')->with('toastError', $getChargeResponse->message);
        }

        $accounts = $this->coaService->getChartOfAccounts();
        $units = $this->unitService->getUnitCollections();
        $service = $this->serviceType->getServiceTypes();

        $data = [
            'page' => 'Edit Charge',
            'action' => route('finance.master-data.charge.update', $id),
            'method' => 'PUT',
        ];

        return view('pages.finance.master-data.charge.form', [
            'data' => $data,
            'charge' => $getChargeResponse->data,
            'accounts' => $accounts,
            'units' => $units,
            'service'=>$service,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalChargeRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateChargeResponse = $this->chargeService->updateCharge(
            id: $id,
            dto: $requestDTO
        );

        return $updateChargeResponse->success
            ? to_route('finance.master-data.charge.index')->with('toastSuccess', $updateChargeResponse->message)
            : back()->with('toastError', $updateChargeResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deleteChargeResponse = $this->chargeService->deleteCharge(
            id: $id,
        );

        return to_route('finance.master-data.charge.index')->with(
            $deleteChargeResponse->success ? 'toastSuccess' : 'toastError',
            $deleteChargeResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->chargeService->getCharges();
        $pdf = Pdf::loadView('exports.pdf.charge', compact('data'));
        $file_name = 'list_charge_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_charge_'.time().'.xlsx';

        return Excel::download(new ChargeExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_charge_'.time().'.csv';

        return Excel::download(new ChargeExport, $file_name);
    }
}
