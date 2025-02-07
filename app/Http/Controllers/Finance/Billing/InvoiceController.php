<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Billing;

use App\Exports\Billing\InvoiceExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\Billing\Invoice\StoreInvoiceRequest;
use App\Http\Requests\Finance\Billing\Invoice\StoreNotLinkedCustomer;
use App\Models\Finance\Invoice;
use App\Service\Finance\Billing\InvoiceService;
use App\Service\Finance\MasterData\ChargeService;
use App\Service\Finance\MasterData\CurrencyService;
use App\Service\Finance\MasterData\CustomerService;
use App\Service\Finance\MasterData\ServiceTypeService;
use App\Service\Finance\MasterData\UnitService;
use App\Service\Operation\Origin\ShippingInstructionService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class InvoiceController extends Controller
{
    public function __construct(
        protected InvoiceService $invoiceService,
        protected ServiceTypeService $serviceTypeService,
        protected CustomerService $customerService,
        protected ChargeService $chargeService,
        protected CurrencyService $currencyService,
        protected UnitService $unitService,
        protected ShippingInstructionService $shippingInstructionService,
    ) {}

    public function index(): View
    {
        return view('pages.finance.billing.invoice.index');
    }

    public function list()
    {
        if (request()->ajax()) {
            $data = $this->invoiceService->getInvoices();

            return DataTables::of($data)
                ->editColumn('invoice_date', function ($item) {
                    return $item->invoice_date?->format('d/m/y');
                })
                ->editColumn('invoice_due_date', function ($item) {
                    return $item->invoice_due_date?->format('d/m/y');
                })
                ->editColumn('customer_billing_id', function ($item) {
                    return $item->customer?->customer_name;
                })
                ->addColumn('is_approved', function ($item) {
                    $approval = "<div class='d-flex align-items-center justify-content-center'>";
                    $approval .= $item->is_approved == 1 ? "<i class='bx bx-check-square' style='font-size: 2rem; color: #13BA18;'></i>" : '-';
                    $approval .= '</div>';

                    return $approval;
                })
                ->addColumn('status', function ($item) {
                    $status = $item->status ?? '-';

                    return "<div class='d-flex align-items-center justify-content-center'>$status</div>";
                })
                ->addColumn('action', function ($item) {
                    $actionButtons = [
                        'detail' => route('finance.billing.invoice.detail', $item->id),
                        'download' => '/',
                    ];

                    if ($item->status != Invoice::CANCEL_STATUS) {
                        $actionButtons['cancel'] = route('finance.billing.invoice.cancel', $item->id);
                    }

                    return Utility::generateTableActions($actionButtons);
                })
                ->addIndexColumn()
                ->rawColumns(['action', 'is_approved', 'status'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function shipmentList(): JsonResponse
    {
        $billingCustomerCondition = request()->get('billing-customer') == 'not-linked'
            ? 'empty'
            : 'exists';

            $shippingFilters = collect(request()->query())->only([
                'service_type',
                'month',
                'year',
                'start_date',
                'end_date',
                'mother_vessel_name',
                'voyage',
                'origin',
                'customer'
            ])->toArray();

        if (request()->ajax()) {
            $instructions = $this->shippingInstructionService->getShippingInstructionByCustomerCondition(condition: $billingCustomerCondition, filters: $shippingFilters);

            return DataTables::of($instructions->data)
                ->addColumn('row_checkbox', function ($col) {
                    return "<input type='checkbox' class='row-checkbox' value='{$col->job_id}' />";
                })
                ->addColumn('billing_customer_name', function ($col) {
                    return $col->customer_name ?? '-';
                })
                ->addIndexColumn()
                ->rawColumns(['row_checkbox'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    public function detail(string $id): View|RedirectResponse
    {
        $getInvoiceResponse = $this->invoiceService->getInvoiceById($id);

        return $getInvoiceResponse->success
            ? view('pages.finance.billing.invoice.detail', [
                'data' => $getInvoiceResponse->data,
            ])
            : redirect()->route('finance.billing.invoice.index')->with('error', $getInvoiceResponse->message);
    }

    public function createNotLinked(): View
    {
        $service_types = Invoice::SERVICE_TYPES;
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(15);

        return view('pages.finance.billing.invoice.form-not-linked', compact('months', 'years', 'service_types'));
    }

    public function storeNotLinked(StoreNotLinkedCustomer $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $list_of_job_id = json_decode($requestDTO['data'], true);

        $updateCustomerResponse = $this->shippingInstructionService->updateBillingCustomer(
            customer_id: $requestDTO['customer_id'],
            job_orders: $list_of_job_id
        );

        return to_route('finance.billing.invoice.create.not-linked-billing-customer')->with(
            $updateCustomerResponse->success ? 'toastSuccess' : 'toastError',
            $updateCustomerResponse->message
        );
    }

    public function createLinked(): View
    {
        $service_types = Invoice::SERVICE_TYPES;
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(15);
        $customers = $this->customerService->getBillingCustomers();

        return view('pages.finance.billing.invoice.form-linked', compact('months', 'years', 'service_types', 'customers'));
    }

    public function viewGenerate(Request $request)
    {
        $list_of_job_orders = explode(',', (request()->query('selected') ?? ''));
        if (
            count($list_of_job_orders) < 1 ||
            (count($list_of_job_orders) > 0 && $list_of_job_orders[0] == '')
        ) {
            return to_route('finance.billing.invoice.create.linked-billing-customer')->with('toastError', 'Please Select at least 1 CTD!');
        }

        $shippings = $this->shippingInstructionService->getShippingInstructionsByJobId($list_of_job_orders);

        if ($shippings->count() < 1) {
            return to_route('finance.billing.invoice.create.linked-billing-customer')->with('toastError', 'Please Select at least 1 CTD!');
        }

        $invoice = new Invoice;
        $charges = $this->chargeService->getCharges([
            'is_agreed_rate' => true,
        ])->data->charges;
        $currencies = $this->currencyService->getCurrencies()->data->currencies;
        $units = $this->unitService->getUnitCollections();

        return view('pages.finance.billing.invoice.generate', compact('invoice', 'charges', 'currencies', 'units', 'shippings'));
    }

    public function storeGenerate(StoreInvoiceRequest $request)
    {
        $requestDTO = $request->validated();
        $createInvoiceResponse = $this->invoiceService->createInvoice($requestDTO);

        return $createInvoiceResponse->success
            ? to_route('finance.billing.invoice.index')->with('toastSuccess', $createInvoiceResponse->message)
            : back()->with('toastError', $createInvoiceResponse->message)->withInput();
    }

    public function approve(string $id): RedirectResponse
    {
        $updateInvoiceResponse = $this->invoiceService->updateInvoice($id, [
            'is_approved' => true,
        ]);

        return $updateInvoiceResponse->success
            ? to_route('finance.billing.invoice.index')->with('toastSuccess', $updateInvoiceResponse->message)
            : back()->with('toastError', $updateInvoiceResponse->message);
    }

    public function cancel(string $id): RedirectResponse
    {
        $updateInvoiceResponse = $this->invoiceService->updateInvoice($id, [
            'status' => 'Cancel',
        ]);

        return $updateInvoiceResponse->success
            ? to_route('finance.billing.invoice.index')->with('toastSuccess', $updateInvoiceResponse->message)
            : back()->with('toastError', $updateInvoiceResponse->message);
    }

    public function exportPdf()
    {
        $data = $this->invoiceService->getInvoices();
        $pdf = Pdf::loadView('exports.pdf.invoice', compact('data'));
        $file_name = 'list_invoice_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_invoice_'.time().'.xlsx';

        return Excel::download(new InvoiceExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_invoice_'.time().'.csv';

        return Excel::download(new InvoiceExport, $file_name);
    }
}
