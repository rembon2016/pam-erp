<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
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
        return view('pages.finance.master-data.chart-of-account.index');
    }

    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of([])
                ->addIndexColumn()
                ->rawColumns(['action'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function create(): View
    {
        $data = [
            'page' => 'Add Chart of Account',
            'action' => route('finance.master-data.chart-of-account.store'),
            'method' => 'POST',
         ];

         $coa = null;
         $account_groups = AccountGroup::orderBy('code', 'ASC')->get();
         $sub_account_groups = SubAccountGroup::orderBy('code', 'ASC')->get();

        return view('pages.finance.master-data.chart-of-account.form', compact('data', 'coa', 'account_groups', 'sub_account_groups'));
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

         $account_groups = AccountGroup::orderBy('code', 'ASC')->get();
         $sub_account_groups = SubAccountGroup::orderBy('code', 'ASC')->get();

        return view('pages.finance.master-data.chart-of-account.form', [
            'data' => $data,
            'coa' => $getCoaResponse->data,
            'account_groups' => $account_groups,
            'sub_account_groups' => $sub_account_groups,
        ]);
    }

    public function update(UpdateChartOfAccountRequest $request, string $id): RedirectResponse
    {
        $dto = $request->validated();
        $updateCoaResponse = $this->coaService->updateCoa(
            id: $id,
            dto: $dto
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
