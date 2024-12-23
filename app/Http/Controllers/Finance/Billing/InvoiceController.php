<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Billing;

use App\Http\Requests\Finance\Billing\Invoice\StoreInvoiceRequest;
use App\Http\Requests\Finance\Billing\Invoice\StoreNotLinkedCustomer;
use App\Service\Finance\MasterData\PortService;
use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use App\Models\Finance\Invoice;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\Billing\InvoiceService;
use App\Service\Finance\MasterData\UnitService;
use App\Service\Finance\MasterData\ChargeService;
use App\Service\Finance\MasterData\CurrencyService;
use App\Service\Finance\MasterData\CustomerService;
use App\Service\Finance\MasterData\ServiceTypeService;
use App\Service\Finance\GeneralWise\GeneralWiseService;
use App\Service\Operation\Origin\ShippingInstructionService;

final class InvoiceController extends Controller
{
    public function __construct(
        protected InvoiceService $invoiceService,
        protected GeneralWiseService $generalWiseService,
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
                ->addColumn('approval', function ($item) {
                    return "-";
                })
                ->addColumn('status', function ($item) {
                    return "-";
                })
                ->addColumn('action', function ($item) {
                    return "-";
                })
                ->addIndexColumn()
                ->rawColumns(['action'])
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

        if (request()->ajax()) {
            $instructions = $this->shippingInstructionService
                ->getShippingInstructionByCustomerCondition(condition: $billingCustomerCondition);

            return DataTables::of($instructions->data)
                ->addColumn('row_checkbox', function ($col) {
                    return "<input type='checkbox' class='row-checkbox' value='{$col->job_id}' />";
                })
                ->addColumn('billing_customer_name', function ($col) {
                    return $col->billingCustomer?->customer_name ?? '-';
                })
                ->addColumn('job_order_code', function ($col) {
                    $jobOrderCode = $col->shipment_by == 'SEAAIR'
                        ? $col->jobOrder->job_order_code ?? '-'
                        : $col->jobOrderAir->job_order_code ?? '-';

                    return $jobOrderCode;
                })
                ->addColumn('origin_name', function ($col) {
                    $jobOrderOriginName = $col->origin_name;

                    return $jobOrderOriginName;
                })
                ->addColumn('qty', function ($col) {
                    return $col->order->qty ?? '-';
                })
                ->addColumn('chw', function ($col) {
                    return $col->order->chw ?? '-';
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

    public function createNotLinked(): View
    {
        $service_types = $this->serviceTypeService->getServiceTypes();
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(15);
        $vessels = $this->generalWiseService->getVessels();
        $origins = $this->generalWiseService->getOrigins();
        $voyages = $this->generalWiseService->getVoyages();
        $customers = $this->customerService->getBillingCustomers();

        return view('pages.finance.billing.invoice.form-not-linked', compact('months', 'years', 'service_types', 'vessels', 'origins', 'voyages', 'customers'));
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
        $service_types = $this->serviceTypeService->getServiceTypes();
        $months = Utility::getListOfMonths();
        $years = Utility::getListOfYears(15);
        $vessels = $this->generalWiseService->getVessels();
        $origins = $this->generalWiseService->getOrigins();
        $voyages = $this->generalWiseService->getVoyages();
        $customers = $this->customerService->getBillingCustomers();

        return view('pages.finance.billing.invoice.form-linked', compact('months', 'years', 'service_types', 'customers', 'vessels', 'origins', 'voyages'));
    }

    public function viewGenerate(Request $request)
    {
        $list_of_job_orders = explode(',' , (request()->query('selected') ?? ""));
        if (
            count($list_of_job_orders) < 1 ||
            (count($list_of_job_orders) > 0 && $list_of_job_orders[0] == "")
        ) {
            return to_route('finance.billing.invoice.create.linked-billing-customer')->with('toastError', 'Please Select at least 1 CTD!');
        }

        $shippings = $this->shippingInstructionService->getShippingInstructionsByJobId($list_of_job_orders);

        if ($shippings->count() < 1) {
            return to_route('finance.billing.invoice.create.linked-billing-customer')->with('toastError', 'Please Select at least 1 CTD!');
        }

        $invoice = new Invoice;
        $charges = $this->chargeService->getCharges();
        $currencies = $this->currencyService->getCurrencies();
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
}
