<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Models\Currency;
use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\CurrencyExport;
use App\Service\Finance\MasterData\CurrencyService;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use App\Http\Requests\Finance\Currency\GlobalCurrencyRequest;

final class CurrencyController extends Controller
{
    /**
     * Constructs a new instance of the ProfileController class, injecting the ProfileService dependency.
     *
     * @param CurrencyService $currencyService The CurrencyService instance to be used by this controller.
     */
    public function __construct(
        protected CurrencyService $currencyService,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.currency.index');
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
        $currencys = Currency::orderBy('currency_code', 'ASC')->get();
        return DataTables::of($currencys)
            ->addIndexColumn()
            ->editColumn('currency_date', function ($item) {
                return $item->currency_date?->format('d-m-Y');
            })
            ->addColumn('action', function ($item) {
                return Utility::generateTableActions([
                    'edit' => route('finance.master-data.currency.edit', $item->id),
                    'delete' => route('finance.master-data.currency.destroy', $item->id),
                ]);
            })
            ->rawColumns(['action'])
            ->toJson();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Currency',
            'action' => route('finance.master-data.currency.store'),
            'method' => 'POST',
         ];

        $currency = new Currency;

         return view('pages.finance.master-data.currency.form', compact('data', 'currency'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalCurrencyRequest $request): RedirectResponse
    {
        $response = $this->currencyService->createCurrency($request->validated());

        return $response->success
            ? to_route('finance.master-data.currency.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $currency = Currency::where('id', $id)->first();

        if (is_null($currency)) return to_route('finance.master-data.currency.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Currency'])
        );

        $data = [
            'page' => 'Edit Currency',
            'action' => route('finance.master-data.currency.update', $id),
            'method' => 'PUT',
         ];

         return view('pages.finance.master-data.currency.form', compact('data', 'currency'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalCurrencyRequest $request, string $id): RedirectResponse
    {
        $response = $this->currencyService->updateCurrency($request->validated() + ['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.currency.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $response = $this->currencyService->deleteCurrency(['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.currency.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Export the list of currencies to a PDF file.
     *
     * This method generates a PDF file containing the list of currencies ordered by currency code in ascending order.
     * The generated PDF file is then downloaded with the filename "list_currency_{timestamp}.pdf".
     */
    public function exportPdf()
    {
        $data = Currency::orderBy('currency_code', 'ASC')->get();
        $pdf = Pdf::loadView('exports.pdf.currency', compact('data'));
        $file_name = 'list_currency_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    /**
     * Export the list of currencies to an Excel file.
     *
     * This method generates an Excel file containing the list of currencies ordered by currency code in ascending order.
     * The generated Excel file is then downloaded with the filename "list_currency_{timestamp}.xlsx".
     */
    public function exportExcel()
    {
        $file_name = 'list_currency_' . time() . '.xlsx';
        return Excel::download(new CurrencyExport, $file_name);
    }

    /**
     * Export the list of currencies to a CSV file.
     *
     * This method generates a CSV file containing the list of currencies ordered by currency code in ascending order.
     * The generated CSV file is then downloaded with the filename "list_currency_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_currency_' . time() . '.csv';
        return Excel::download(new CurrencyExport, $file_name);
    }
}
