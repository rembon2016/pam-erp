<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use App\Models\Finance\ServiceType;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\ServiceTypeExport;
use App\Http\Requests\Finance\ServiceType\GlobalServiceTypeRequest;
use App\Service\Finance\MasterData\ServiceTypeService;

final class ServiceTypeController extends Controller
{
    /**
     * Constructs a new instance of the ServiceTypeController class, injecting the ServiceTypeService dependency.
     *
     * @param ServiceTypeService $serviceTypeService The ServiceTypeService instance to be used by this controller.
     */
    public function __construct(
        protected ServiceTypeService $serviceTypeService,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.service-type.index');
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
        $service_types = ServiceType::orderBy('service_code', 'ASC')->get();
        return DataTables::of($service_types)
            ->addIndexColumn()
            ->addColumn('action', function ($item) {
                return Utility::generateTableActions([
                    'edit' => route('finance.master-data.service-type.edit', $item->id),
                    'delete' => route('finance.master-data.service-type.destroy', $item->id),
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
            'page' => 'Add Service Type',
            'action' => route('finance.master-data.service-type.store'),
            'method' => 'POST',
         ];

        $service_type = new ServiceType;

         return view('pages.finance.master-data.service-type.form', compact('data', 'service_type'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalServiceTypeRequest $request): RedirectResponse
    {
        $response = $this->serviceTypeService->createServiceType($request->validated());

        return $response->success
            ? to_route('finance.master-data.service-type.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $service_type = ServiceType::where('id', $id)->first();

        if (is_null($service_type)) return to_route('finance.master-data.service-type.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Service Type'])
        );

        $data = [
            'page' => 'Edit Service Type',
            'action' => route('finance.master-data.service-type.update', $id),
            'method' => 'PUT',
         ];

         return view('pages.finance.master-data.service-type.form', compact('data', 'service_type'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalServiceTypeRequest $request, string $id): RedirectResponse
    {
        $response = $this->serviceTypeService->updateServiceType($request->validated() + ['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.service-type.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $response = $this->serviceTypeService->deleteServiceType(['id' => $id]);

        return $response->success
            ? to_route('finance.master-data.service-type.index')
                ->with('toastSuccess', $response->message)
            : back()
                ->with('toastError', $response->message);
    }

    /**
     * Export the list of service type to a PDF file.
     *
     * This method generates a PDF file containing the list of currencies ordered by service type in ascending order.
     * The generated PDF file is then downloaded with the filename "list_service_type_{timestamp}.pdf".
     */
    public function exportPdf()
    {
        $data = ServiceType::orderBy('service_code', 'ASC')->get();
        $pdf = Pdf::loadView('exports.pdf.service-type', compact('data'));
        $file_name = 'list_service_type_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    /**
     * Export the list of service type to an Excel file.
     *
     * This method generates an Excel file containing the list of currencies ordered by service type in ascending order.
     * The generated Excel file is then downloaded with the filename "list_service_type_{timestamp}.xlsx".
     */
    public function exportExcel()
    {
        $file_name = 'list_service_type_' . time() . '.xlsx';
        return Excel::download(new ServiceTypeExport, $file_name);
    }

    /**
     * Export the list of service type to a CSV file.
     *
     * This method generates a CSV file containing the list of service types ordered by service type in ascending order.
     * The generated CSV file is then downloaded with the filename "list_service_type_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_service_type_' . time() . '.csv';
        return Excel::download(new ServiceTypeExport, $file_name);
    }
}
