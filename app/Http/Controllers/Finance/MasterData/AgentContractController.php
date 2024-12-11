<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Finance\AgentContract;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\AgentContractExport;
use App\Service\Finance\MasterData\CustomerService;
use App\Service\Finance\MasterData\AgentContractService;
use App\Http\Requests\Finance\MasterData\AgentContract\StoreAgentContractRequest;
use App\Http\Requests\Finance\MasterData\AgentContract\UpdateAgentContractRequest;

final class AgentContractController extends Controller
{
    public function __construct(
        protected AgentContractService $agentContractService,
        protected CustomerService $customerService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.agent-contract.index');
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list(): JsonResponse
    {
        // if (request()->ajax()) {
            return DataTables::of($this->agentContractService->getAgentContracts())
                ->addIndexColumn()
                ->addColumn('customer_code', function ($item) {
                    return $item->customer?->customer_code;
                })
                ->editColumn('customer_id', function ($item) {
                    return $item->customer?->customer_name;
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
                        'edit' => route('finance.master-data.agent-contract.edit', $item->id),
                        'delete' => route('finance.master-data.agent-contract.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['action'])
                ->toJson();
        // }

        // return ResponseJson::error(
        //     Response::HTTP_UNAUTHORIZED,
        //     'Access Unauthorized',
        // );
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
        $customers = $this->customerService->getCustomers();

         return view('pages.finance.master-data.agent-contract.form', compact('data', 'agent_contract', 'customers'));
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
        if (!$getAgentContractResponse->success) return to_route('finance.master-data.agent-contract.index')->with('toastError', $getAgentContractResponse->message);

        $data = [
            'page' => 'Edit Agent Contract',
            'action' => route('finance.master-data.agent-contract.update', $id),
            'method' => 'PUT',
         ];

        $customers = $this->customerService->getCustomers();

         return view('pages.finance.master-data.agent-contract.form', [
            'data' => $data,
            'agent_contract' => $getAgentContractResponse->data,
            'customers' => $customers,
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
        $file_name = 'list_agent_contract_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_agent_contract_' . time() . '.xlsx';
        return Excel::download(new AgentContractExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_agent_contract_' . time() . '.csv';
        return Excel::download(new AgentContractExport, $file_name);
    }
}
