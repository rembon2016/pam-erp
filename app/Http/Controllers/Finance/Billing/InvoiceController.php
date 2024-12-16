<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Billing;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\Billing\InvoiceService;

final class InvoiceController extends Controller
{
    public function __construct(
        protected InvoiceService $invoiceService,
    ) {}
    public function index(): View
    {
        return view('pages.finance.billing.invoice.index');
    }

    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            $currencies = $this->invoiceService->getInvoices(request()->query());

            return DataTables::of($currencies)
                ->addIndexColumn()
                // ->editColumn('currency_date', function ($item) {
                //     return $item->currency_date?->format('d-m-Y');
                // })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.currency.edit', $item->id),
                        'delete' => route('finance.master-data.currency.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function createNotLinked(): View
    {
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(25);

        return view('pages.finance.billing.invoice.form-not-linked', compact('months', 'years'));
    }

    public function storeNotLinked(Request $request): RedirectResponse
    {
        dd($request);
    }
}
