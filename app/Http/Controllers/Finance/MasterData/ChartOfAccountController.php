<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Constants\COA\CashflowType;
use App\Exports\MasterData\ChartOfAccountExport;
use App\Http\Controllers\Controller;
use App\Models\Finance\AccountGroup;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use App\Models\Finance\SubAccountGroup;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\CountryExport;
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

    /**
     * Export the list of chart of account to a PDF file.
     *
     * This method generates a PDF file containing the list of chart of account ordered by chart of account code in ascending order.
     * The generated PDF file is then downloaded with the filename "list_currency_{timestamp}.pdf".
     */
    public function exportPdf()
    {
        $accountGroups = $this->coaService->getAccountGroups();
        $pdf = Pdf::loadView('exports.pdf.chart-of-account', compact('accountGroups'));
        $file_name = 'list_chart_of_accounts_' . time() . '.pdf';

        return $pdf
            ->setPaper('a4', 'landscape')
            ->download($file_name);
    }

    /**
     * Export the list of chart of account to an Excel file.
     *
     * This method generates an Excel file containing the list of chart of account ordered by currency code in ascending order.
     * The generated Excel file is then downloaded with the filename "list_chart of account_{timestamp}.xlsx".
     */
    public function exportExcel()
    {
        $file_name = 'list_chart_of_accounts_' . time() . '.xlsx';

        return Excel::download(new ChartOfAccountExport, $file_name);
    }

    /**
     * Export the list of chart of account to a CSV file.
     *
     * This method generates a CSV file containing the list of chart of account ordered by chart of account code in ascending order.
     * The generated CSV file is then downloaded with the filename "list_chart of account_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_chart_of_accounts_' . time() . '.csv';

        return Excel::download(new ChartOfAccountExport, $file_name);
    }

}
