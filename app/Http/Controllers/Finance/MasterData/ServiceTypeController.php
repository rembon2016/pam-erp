<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use App\Models\ServiceType;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\ServiceTypeExport;
use App\Http\Requests\Finance\ServiceType\GlobalServiceTypeRequest;

final class ServiceTypeController extends Controller
{
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
        $requestDTO = $request->validated();

        try {
            ServiceType::create($requestDTO);
            return to_route('finance.master-data.service-type.index')->with('toastSuccess', __('crud.created', ['name' => 'Service Type']));
        } catch (\Throwable $th) {
            return back()->with('toastError', __('crud.error_create', ['name' => 'Service Type']));
        }
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
        $requestDTO = $request->validated();
        $service_type = ServiceType::where('id', $id)->first();
        if (is_null($service_type)) return to_route('finance.master-data.service-type.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Service Type'])
        );

        try {
            $service_type->update($requestDTO);
            return to_route('finance.master-data.service-type.index')->with('toastSuccess', __('crud.updated', ['name' => 'Service Type']));
        } catch (\Throwable $th) {
            return back()->with('toastError', __('crud.error_update', ['name' => 'Service Type']));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $service_type = ServiceType::where('id', $id)->first();
        if (is_null($service_type)) return to_route('finance.master-data.service-type.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Service Type'])
        );

        try {
            $service_type->delete();
            return to_route('finance.master-data.service-type.index')->with('toastSuccess', __('crud.deleted', ['name' => 'Service Type']));
        } catch (\Throwable $th) {
            return to_route('finance.master-data.service-type.index')->with('toastError', __('crud.error_delete', ['name' => 'Service Type']));
        }
    }

    public function exportPdf()
    {
        $data = ServiceType::orderBy('service_code', 'ASC')->get();
        $pdf = Pdf::loadView('exports.pdf.service-type', compact('data'));
        $file_name = 'list_service_type_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_service_type_' . time() . '.xlsx';
        return Excel::download(new ServiceTypeExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_service_type_' . time() . '.csv';
        return Excel::download(new ServiceTypeExport, $file_name);
    }
}
