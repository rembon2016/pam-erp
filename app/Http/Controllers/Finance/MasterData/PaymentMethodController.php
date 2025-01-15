<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Exports\MasterData\PaymentMethodExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\PaymentMethod\GlobalPaymentMethodRequest;
use App\Models\Finance\PaymentMethod;
use App\Service\Finance\MasterData\PaymentMethodService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class PaymentMethodController extends Controller
{
    public function __construct(
        protected PaymentMethodService $paymentMethodService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $payment_terms = $this->paymentMethodService->getPaymentMethods()->pluck('payment_terms');

        return view('pages.finance.master-data.payment-method.index', compact('payment_terms'));
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->paymentMethodService->getPaymentMethodQueries(request()->query()))
                ->addIndexColumn()
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.payment-method.edit', $item->id),
                        'delete' => route('finance.master-data.payment-method.destroy', $item->id),
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

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Payment Method',
            'action' => route('finance.master-data.payment-method.store'),
            'method' => 'POST',
        ];

        $payment_method = new PaymentMethod;

        return view('pages.finance.master-data.payment-method.form', compact('data', 'payment_method'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalPaymentMethodRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createPaymentMethodResponse = $this->paymentMethodService->createPaymentMethod(
            dto: $requestDTO
        );

        return $createPaymentMethodResponse->success
            ? to_route('finance.master-data.payment-method.index')->with('toastSuccess', $createPaymentMethodResponse->message)
            : back()->with('toastError', $createPaymentMethodResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getPaymentMethodResponse = $this->paymentMethodService->getPaymentMethodById($id);
        if (! $getPaymentMethodResponse->success) {
            return to_route('finance.master-data.payment-method.index')->with('toastError', $getPaymentMethodResponse->message);
        }

        $data = [
            'page' => 'Edit Payment Method',
            'action' => route('finance.master-data.payment-method.update', $id),
            'method' => 'PUT',
        ];

        return view('pages.finance.master-data.payment-method.form', [
            'data' => $data,
            'payment_method' => $getPaymentMethodResponse->data,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalPaymentMethodRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updatePaymentMethodResponse = $this->paymentMethodService->updatePaymentMethod(
            id: $id,
            dto: $requestDTO
        );

        return $updatePaymentMethodResponse->success
            ? to_route('finance.master-data.payment-method.index')->with('toastSuccess', $updatePaymentMethodResponse->message)
            : back()->with('toastError', $updatePaymentMethodResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deletePaymentMethodResponse = $this->paymentMethodService->deletePaymentMethod(
            id: $id,
        );

        return to_route('finance.master-data.payment-method.index')->with(
            $deletePaymentMethodResponse->success ? 'toastSuccess' : 'toastError',
            $deletePaymentMethodResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->paymentMethodService->getPaymentMethods();
        $pdf = Pdf::loadView('exports.pdf.payment-method', compact('data'));
        $file_name = 'list_payment_method_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_payment_method_'.time().'.xlsx';

        return Excel::download(new PaymentMethodExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_payment_method_'.time().'.csv';

        return Excel::download(new PaymentMethodExport, $file_name);
    }
}
