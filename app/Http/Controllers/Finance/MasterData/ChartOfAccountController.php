<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Constants\COA\CashflowType;
use App\Http\Controllers\Controller;
use App\Models\Finance\AccountGroup;
use Illuminate\Http\RedirectResponse;
use App\Models\Finance\SubAccountGroup;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\MasterData\ChartOfAccountService;
use App\Http\Requests\Finance\MasterData\ChartOfAccount\StoreChartOfAccountRequest;
use App\Http\Requests\Finance\MasterData\ChartOfAccount\UpdateChartOfAccountRequest;

final class ChartOfAccountController extends Controller
{
    public function __construct(
        protected ChartOfAccountService $coaService
    ) {}

    public function index(): View
    {
        $accountGroups = $this->coaService->getAccountGroups();

        return view('pages.finance.master-data.chart-of-account.index', compact('accountGroups'));
    }

    public function create(): View
    {
        $data = [
            'page' => 'Add Chart of Account',
            'action' => route('finance.master-data.chart-of-account.store'),
            'method' => 'POST',
         ];

         $accountGroups = AccountGroup::orderBy('code', 'ASC')->get();
         $subAccountGroups = SubAccountGroup::orderBy('code', 'ASC')->get();
         $cashflowTypes = CashflowType::COLLECT;

        return view('pages.finance.master-data.chart-of-account.form', compact('data',  'accountGroups', 'subAccountGroups', 'cashflowTypes'));
    }

    public function store(StoreChartOfAccountRequest $request): RedirectResponse
    {
        $dto = $request->validated();
        $createCoaResponse = $this->coaService->createCoa($dto);

        return $createCoaResponse->success
            ? to_route('finance.master-data.chart-of-account.index')->with('toastSuccess', $createCoaResponse->message)
            : back()->with('toastError', $createCoaResponse->message)->withInput();
    }

    public function edit(string $id): View|RedirectResponse
    {
        $data = [
            'page' => 'Edit Chart of Account',
            'action' => route('finance.master-data.chart-of-account.update', $id),
            'method' => 'PUT',
         ];

        $getCoaResponse = $this->coaService->getCoaById($id);

        if (!$getCoaResponse->success) return to_route('finance.master-data.chart-of-account.index')->with('toastError', $getCoaResponse->message);

        $accountGroups = AccountGroup::orderBy('code', 'ASC')->get();
        $subAccountGroups = SubAccountGroup::orderBy('code', 'ASC')->get();
        $cashflowTypes = CashflowType::COLLECT;

        return view('pages.finance.master-data.chart-of-account.form', [
            'data' => $data,
            'coa' => $getCoaResponse->data,
            'accountGroups' => $accountGroups,
            'subAccountGroups' => $subAccountGroups,
            'cashflowTypes' => $cashflowTypes,
        ]);
    }

    public function update(UpdateChartOfAccountRequest $request, string $id): RedirectResponse
    {
        $dto = $request->validated();
        $updateCoaResponse = $this->coaService->updateCoa(
            dto: $dto,
            id: $id,
        );

        return $updateCoaResponse->success
            ? to_route('finance.master-data.chart-of-account.index')->with('toastSuccess', $updateCoaResponse->message)
            : back()->with('toastError', $updateCoaResponse->message)->withInput();
    }

    public function destroy(string $id): RedirectResponse
    {
        $deleteCoaResponse = $this->coaService->deleteCoa($id);

        return to_route('finance.master-data.chart-of-account.index')->with(
            $deleteCoaResponse->success ? 'toastSuccess' : 'toastError',
            $deleteCoaResponse->messsage
        );
    }
}
