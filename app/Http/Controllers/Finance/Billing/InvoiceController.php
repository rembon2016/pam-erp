<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Billing;

use App\Service\Finance\GeneralWise\GeneralWiseService;
use App\Service\Finance\MasterData\CustomerService;
use App\Service\Finance\MasterData\ServiceTypeService;
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
        protected GeneralWiseService $generalWiseService,
        protected ServiceTypeService $serviceTypeService,
        protected CustomerService $customerService
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
        $service_types = $this->serviceTypeService->getServiceTypes();
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(25);
        $vessels = $this->generalWiseService->getVessels();
        $origins = $this->generalWiseService->getOrigins();
        $voyages = $this->generalWiseService->getVoyages();

        return view('pages.finance.billing.invoice.form-not-linked', compact('months', 'years', 'service_types', 'vessels', 'origins', 'voyages'));
    }

    public function storeNotLinked(Request $request): RedirectResponse
    {
        dd($request);
    }

    public function createLinked(): View
    {
        $service_types = $this->serviceTypeService->getServiceTypes();
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(15);
        $vessels = $this->generalWiseService->getVessels();
        $origins = $this->generalWiseService->getOrigins();
        $voyages = $this->generalWiseService->getVoyages();
        $customers = $this->customerService->getCustomers();

        return view('pages.finance.billing.invoice.form-linked', compact('months', 'years', 'service_types', 'customers', 'vessels', 'origins', 'voyages'));
    }

    public function storeLinked(Request $request): RedirectResponse
    {
        dd($request);
    }
}