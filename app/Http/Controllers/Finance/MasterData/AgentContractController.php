<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Models\History;
use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Traits\Eloquent\Historable;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Finance\AgentContract;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Finance\AgentContractDocument;
use App\Exports\MasterData\AgentContractExport;
use App\Service\Finance\MasterData\PortService;
use App\Service\Finance\MasterData\UnitService;
use App\Service\Finance\MasterData\ChargeService;
use App\Service\Finance\MasterData\CarrierService;
use App\Service\Finance\MasterData\CountryService;
use App\Service\Finance\MasterData\CurrencyService;
use App\Service\Finance\MasterData\CustomerService;
use App\Models\Finance\CustomerContractChargeDetail;
use App\Service\Finance\MasterData\ServiceTypeService;
use App\Service\Finance\MasterData\AgentContractService;
use App\Http\Requests\Finance\MasterData\AgentContract\StoreAgentContractRequest;
use App\Http\Requests\Finance\MasterData\AgentContract\UpdateAgentContractRequest;
use Carbon\Carbon;

final class AgentContractController extends Controller
{
    use Historable;

    public function __construct(
        protected AgentContractService $agentContractService,
        protected CustomerService $customerService,
        protected ServiceTypeService $serviceTypeService,
        protected CountryService $countryService,
        protected ChargeService $chargeService,
        protected UnitService $unitService,
        protected CurrencyService $currrencyService,
        protected CarrierService $carrierService,
        protected PortService $portService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $services = $this->serviceTypeService->getServiceTypes()->data->serviceTypes;

        return view('pages.finance.master-data.agent-contract.index', compact('services'));
    }

    /**
     * Display a listing of the resource history.
     *
     * @param string $id
     * @return View
     */
    public function history(string $id): View
    {
        // dd($this->agentContractService->getAgentContractHistories($id));
        return view('pages.finance.master-data.agent-contract.history', compact('id'));
    }

    /**
     * Display a listing of the resource detail history.
     *
     * @param string $id
     * @return View
     */
    public function detailHistory(string $id, string $historyId): View
    {
        $history = History::with('childs')->where('modelable_id', $id)->where('id', $historyId)->firstOrFail();
        // dd($this->getAgentContractService($historyId));

        return view('pages.finance.master-data.agent-contract.detail-history', [
            'history' => $history,
            'customer' => $this->getCustomer($history->payload['customer_id']),
            'documents' => $this->getAgentHistoricalDocuments($historyId),
            'services' => $this->getAgentContractService($historyId),
        ]);
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->agentContractService->getAgentContracts(
                    filters: request()->query(),
                    get_data: false
                ))
                ->addIndexColumn()
                ->editColumn('contract_no', function ($item) {
                    $is_expired = now()->gt($item->contract_end);
                    $contract_no = $is_expired
                        ? "<span class='badge badge-danger badge-lg'>{$item->contract_no}</span>"
                        : $item->contract_no;

                    return $contract_no;
                })
                ->addColumn('customer_code', function ($item) {
                    return $item->customer?->customer_code;
                })
                ->editColumn('customer_id', function ($item) {
                    return $item->customer?->customer_name;
                })
                ->editColumn('service_type_id', function ($item) {
                    return $item->serviceType?->service_code ?? "N/A";
                })
                ->editColumn('contract_date', function ($item) {
                    return $item->contract_date?->format('d/m/Y');
                })
                ->editColumn('contract_start', function ($item) {
                    return $item->contract_start?->format('d/m/Y');
                })
                ->editColumn('contract_end', function ($item) {
                    return $item->contract_end?->format('d/m/Y');
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'detail' => route('finance.master-data.agent-contract.detail', $item->id),
                        'edit' => route('finance.master-data.agent-contract.edit', $item->id),
                        'history' => route('finance.master-data.agent-contract.history', $item->id),
                        // 'delete' => route('finance.master-data.agent-contract.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['action', 'contract_no'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function listHistory(string $id): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->agentContractService->getAgentContractHistories($id))
                ->addIndexColumn()
                ->editColumn('contract_no', function ($item) {
                    $is_expired = now()->gt($item['contract_end']);
                    $contract_no = $is_expired
                        ? "<span class='badge badge-danger badge-lg'>{$item['contract_no']}</span>"
                        : $item['contract_no'];

                    return $contract_no;
                })
                ->addColumn('customer_code', function ($item) {
                    return $item['customer']['customer_code'];
                })
                ->editColumn('customer_id', function ($item) {
                    return $item['customer']['customer_name'];
                })
                ->editColumn('service_type_id', function ($item) {
                    return $item['service_type']['service_code'] ?? "N/A";
                })
                ->editColumn('contract_date', function ($item) {
                    return Carbon::parse($item['contract_date'])->format('d/m/Y');
                })
                ->editColumn('contract_start', function ($item) {
                    return Carbon::parse($item['contract_start'])->format('d/m/Y');
                })
                ->editColumn('contract_end', function ($item) {
                    return Carbon::parse($item['contract_end'])->format('d/m/Y');
                })
                ->addColumn('action', function ($item) use ($id) {
                    return Utility::generateTableActions([
                        'detail' => route('finance.master-data.agent-contract.history-detail', ['id' => $id, 'history' => $item['history_id']]),
                        // 'delete' => route('finance.master-data.agent-contract.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['action', 'contract_no'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function show(string $id)
    {
        $getAgentContractResponse = $this->agentContractService->getAgentContractById($id);
        if (! $getAgentContractResponse->success) {
            return to_route('finance.master-data.agent-contract.index')->with('toastError', $getAgentContractResponse->message);
        }

        $currencies = $this->currrencyService->getCurrencies()->data->currencies;

        return view('pages.finance.master-data.agent-contract.detail', [
            'agent_contract' => $getAgentContractResponse->data,
            'currencies' => $currencies,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Agent Contract',
            'action' => route('finance.master-data.agent-contract.store'),
            'method' => 'POST',
        ];

        $agent_contract = new AgentContract;
        $customers = $this->customerService->getCustomers()->data->customers;
        $serviceVendors = $this->serviceTypeService->getServiceTypes()->data->serviceTypes;
        $countries = $this->countryService->getCountries()->data->countries;
        $charges = [];
        $units = $this->unitService->getUnitCollections();
        $carriers = $this->carrierService->getCarriers();
        $currencies = $this->currrencyService->getCurrencies()->data->currencies;
        $container_types = CustomerContractChargeDetail::CONTAINER_TYPES;
        $routedTransits = [
            ['label' => 'DUBAI', 'value' => 'DUBAI'],
            ['label' => 'SINGAPORE', 'value' => 'SINGAPORE'],
            ['label' => 'LA', 'value' => 'LOS ANGELES'],
            ['label' => 'SEATTLE', 'value' => 'SEATTLE'],
            ['label' => 'None of above (manual input)', 'value' => 'NONE'],
        ];

        return view(
            'pages.finance.master-data.agent-contract.form',
            compact('data', 'agent_contract', 'customers', 'serviceVendors', 'countries', 'routedTransits', 'carriers', 'charges', 'units', 'currencies', 'container_types')
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreAgentContractRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createAgentContractResponse = $this->agentContractService->createAgentContract(
            dto: $requestDTO
        );

        return $createAgentContractResponse->success
            ? to_route('finance.master-data.agent-contract.index')->with('toastSuccess', $createAgentContractResponse->message)
            : back()->with('toastError', $createAgentContractResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getAgentContractResponse = $this->agentContractService->getAgentContractById($id);
        if (! $getAgentContractResponse->success) {
            return to_route('finance.master-data.agent-contract.index')->with('toastError', $getAgentContractResponse->message);
        }

        $data = [
            'page' => 'Edit Agent Contract',
            'action' => route('finance.master-data.agent-contract.update', $id),
            'method' => 'PUT',
        ];

        $customers = $this->customerService->getCustomers()->data->customers;
        $serviceVendors = $this->serviceTypeService->getServiceTypes()->data->serviceTypes;
        $countries = $this->countryService->getCountries()->data->countries;
        $charges = $this->chargeService->getCharges([
            'service_type_id' => $getAgentContractResponse->data->service_type_id,
        ])->data->charges;
        $units = $this->unitService->getUnitCollections();
        $currencies = $this->currrencyService->getCurrencies()->data->currencies;
        $carriers = $this->carrierService->getCarriers();
        $ports = $this->portService->getPorts()->data->ports;
        $container_types = CustomerContractChargeDetail::CONTAINER_TYPES;
        $routedTransits = [
            ['label' => 'DUBAI', 'value' => 'DUBAI'],
            ['label' => 'SINGAPORE', 'value' => 'SINGAPORE'],
            ['label' => 'LA', 'value' => 'LOS ANGELES'],
            ['label' => 'SEATTLE', 'value' => 'SEATTLE'],
            ['label' => 'None of above (manual input)', 'value' => 'NONE'],
        ];

        return view('pages.finance.master-data.agent-contract.form', [
            'data' => $data,
            'agent_contract' => $getAgentContractResponse->data,
            'customers' => $customers,
            'serviceVendors' => $serviceVendors,
            'countries' => $countries,
            'routedTransits' => $routedTransits,
            'carriers' => $carriers,
            'charges' => $charges,
            'units' => $units,
            'currencies' => $currencies,
            'ports' => $ports,
            'container_types' => $container_types,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateAgentContractRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateAgentContractResponse = $this->agentContractService->updateAgentContract(
            id: $id,
            dto: $requestDTO
        );

        return $updateAgentContractResponse->success
            ? to_route('finance.master-data.agent-contract.index')->with('toastSuccess', $updateAgentContractResponse->message)
            : back()->with('toastError', $updateAgentContractResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deleteAgentContractResponse = $this->agentContractService->deleteAgentContract(
            id: $id,
        );

        return to_route('finance.master-data.agent-contract.index')->with(
            $deleteAgentContractResponse->success ? 'toastSuccess' : 'toastError',
            $deleteAgentContractResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->agentContractService->getAgentContracts();
        $pdf = Pdf::loadView('exports.pdf.agent-contract', compact('data'));
        $file_name = 'list_agent_contract_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_agent_contract_'.time().'.xlsx';

        return Excel::download(new AgentContractExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_agent_contract_'.time().'.csv';

        return Excel::download(new AgentContractExport, $file_name);
    }

    public function deleteDocument(string $document_id): JsonResponse
    {
        try {
            $document = AgentContractDocument::findOrFail($document_id);
            $document->delete();

            $folderPrefix = AgentContract::FOLDER_NAME;

            if (Storage::disk('public')->exists("{$folderPrefix}/".$document->contract_file)) {
                Storage::disk('public')->delete("{$folderPrefix}/".$document->contract_file);
            }

            return ResponseJson::success(
                code: Response::HTTP_OK,
                message: __('crud.deleted', ['name' => 'Agent Contract Document'])
            );
        } catch (\Throwable $th) {
            return ResponseJson::error(
                code: Response::HTTP_INTERNAL_SERVER_ERROR,
                message: __('crud.error_delete', ['name' => 'Agent Contract Document']),
                errors: $th->getTraceAsString()
            );
        }
    }
}
