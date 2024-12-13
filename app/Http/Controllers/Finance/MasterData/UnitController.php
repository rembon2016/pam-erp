<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Operation\Master\Unit;
use Illuminate\Http\RedirectResponse;
use App\Exports\MasterData\UnitExport;
use Yajra\DataTables\Facades\DataTables;
use App\Service\Finance\MasterData\UnitService;
use App\Http\Requests\Finance\MasterData\Unit\StoreUnitRequest;
use App\Http\Requests\Finance\MasterData\Unit\UpdateUnitRequest;

final class UnitController extends Controller
{
    public function __construct(
        protected UnitService $unitService,
    ) {}

    /**
     * Renders the index view for the Unit management page.
     *
     * @return \Illuminate\View\View
     */
    public function index(): View
    {
        $units = $this->unitService->getUnitCollections();
        return view('pages.finance.master-data.unit.index', compact('units'));
    }

    /**
     * Retrieves a JSON response containing a list of units.
     *
     * This method is used to populate a data table with the list of units. It checks if the request is
     * made via AJAX, and if so, it returns a JSON response containing the unit data. If the request is
     * not made via AJAX, it returns an error response with an "Access Unauthorized" message.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->unitService->getUnitCollections(request()->query()))
                ->addIndexColumn()
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.unit.edit', $item->unit_id),
                        'delete' => route('finance.master-data.unit.destroy', $item->unit_id),
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
     * Renders the view for creating a new unit.
     *
     * This method sets up the necessary data for the "Add Unit" form view and returns the view.
     *
     * @return \Illuminate\View\View
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Unit',
            'action' => route('finance.master-data.unit.store'),
            'method' => 'POST',
         ];

         $unit = new Unit;

        return view('pages.finance.master-data.unit.form', compact('data', 'unit'));
    }

    /**
     * Handles the creation of a new unit.
     *
     * This method processes the validated request data from the "Add Unit" form and creates a new unit
     * using the `createUnit` method of the `$this->unitService`. If the creation is successful, it
     * redirects the user to the unit index page with a success message. If the creation fails, it
     * redirects the user back to the form with an error message and the input data.
     *
     * @param StoreUnitRequest $request The validated request data.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(StoreUnitRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createUnitResponse = $this->unitService->createUnit(
            dto: $requestDTO
        );

        return $createUnitResponse->success
            ? to_route('finance.master-data.unit.index')->with('toastSuccess', $createUnitResponse->message)
            : back()->with('toastError', $createUnitResponse->message)->withInput();
    }

    /**
     * Renders the view for editing an existing unit.
     *
     * This method retrieves the unit data by the given ID using the `getUnitById` method of the `$this->unitService`.
     * If the retrieval is successful, it sets up the necessary data for the "Edit Unit" form view and returns the view.
     * If the retrieval fails, it redirects the user to the unit index page with an error message.
     *
     * @param int $id The ID of the unit to be edited.
     * @return \Illuminate\View\View|\Illuminate\Http\RedirectResponse
     */
    public function edit(int $id): View|RedirectResponse
    {
        $getUnitResponse = $this->unitService->getUnitById(id: $id);

        if (!$getUnitResponse->success) return to_route('finance.master-data.unit.index')->with('toastError', $getUnitResponse->message);

        $data = [
            'page' => 'Edit Unit',
            'action' => route('finance.master-data.unit.update', $id),
            'method' => 'PUT',
         ];

        return view('pages.finance.master-data.unit.form', [
            'data' => $data,
            'unit' => $getUnitResponse->data,
        ]);
    }

    /**
     * Updates an existing unit.
     *
     * This method processes the validated request data from the "Edit Unit" form and updates an existing unit
     * using the `updateUnit` method of the `$this->unitService`. If the update is successful, it
     * redirects the user to the unit index page with a success message. If the update fails, it
     * redirects the user back to the form with an error message and the input data.
     *
     * @param UpdateUnitRequest $request The validated request data.
     * @param int $id The ID of the unit to be updated.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(UpdateUnitRequest $request, int $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateUnitResponse = $this->unitService->updateUnit(
            id: $id,
            dto: $requestDTO
        );

        return $updateUnitResponse->success
            ? to_route('finance.master-data.unit.index')->with('toastSuccess', $updateUnitResponse->message)
            : back()->with('toastError', $updateUnitResponse->message)->withInput();
    }

    /**
     * Deletes an existing unit.
     *
     * This method processes the deletion of a unit by the given ID using the `deleteUnit` method of the `$this->unitService`.
     * If the deletion is successful, it redirects the user to the unit index page with a success message.
     * If the deletion fails, it redirects the user to the unit index page with an error message.
     *
     * @param int $id The ID of the unit to be deleted.
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(int $id): RedirectResponse
    {
        $deleteUnitResponse = $this->unitService->deleteUnit(
            id: $id,
        );

        return to_route('finance.master-data.unit.index')->with(
            $deleteUnitResponse->success ? 'toastSuccess' : 'toastError',
            $deleteUnitResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->unitService->getUnitCollections();
        $pdf = Pdf::loadView('exports.pdf.unit', compact('data'));
        $file_name = 'list_unit_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_unit_' . time() . '.xlsx';
        return Excel::download(new UnitExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_unit_' . time() . '.csv';
        return Excel::download(new UnitExport, $file_name);
    }
}
