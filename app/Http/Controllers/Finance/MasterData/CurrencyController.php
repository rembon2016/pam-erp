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
use App\Http\Requests\Finance\Currency\GlobalCurrencyRequest;

final class CurrencyController extends Controller
{
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
        $requestDTO = $request->validated();

        try {
            Currency::create($requestDTO);
            return to_route('finance.master-data.currency.index')->with('toastSuccess', __('crud.created', ['name' => 'Currency']));
        } catch (\Throwable $th) {
            return back()->with('toastError', __('crud.error_create', ['name' => 'Currency']));
        }
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
        $requestDTO = $request->validated();
        $currency = Currency::where('id', $id)->first();
        if (is_null($currency)) return to_route('finance.master-data.currency.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Currency'])
        );

        try {
            $currency->update($requestDTO);
            return to_route('finance.master-data.currency.index')->with('toastSuccess', __('crud.updated', ['name' => 'Currency']));
        } catch (\Throwable $th) {
            return back()->with('toastError', __('crud.error_update', ['name' => 'Currency']));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $currency = Currency::where('id', $id)->first();
        if (is_null($currency)) return to_route('finance.master-data.currency.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Currency'])
        );

        try {
            $currency->delete();
            return to_route('finance.master-data.currency.index')->with('toastSuccess', __('crud.deleted', ['name' => 'Currency']));
        } catch (\Throwable $th) {
            return to_route('finance.master-data.currency.index')->with('toastError', __('crud.error_delete', ['name' => 'Currency']));
        }
    }

    public function exportPdf()
    {
        $data = Currency::orderBy('currency_code', 'ASC')->get();
        $pdf = Pdf::loadView('exports.pdf.currency', compact('data'));
        $file_name = 'list_currency_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_currency_' . time() . '.xlsx';
        return Excel::download(new CurrencyExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_currency_' . time() . '.csv';
        return Excel::download(new CurrencyExport, $file_name);
    }
}
