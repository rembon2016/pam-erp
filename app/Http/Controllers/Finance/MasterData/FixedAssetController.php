<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use App\Models\Finance\FixedAsset;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use App\Models\Finance\FixedAssetType;
use App\Models\Finance\FixedAssetStatus;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\FixedAssetExport;
use App\Service\Finance\MasterData\FixedAssetService;
use App\Http\Requests\Finance\MasterData\FixedAsset\StoreFixedAssetRequest;
use App\Http\Requests\Finance\MasterData\FixedAsset\UpdateFixedAssetRequest;

final class FixedAssetController extends Controller
{
    public function __construct(
        protected FixedAssetService $fixedAssetService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('pages.finance.master-data.fixed-asset.index');
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
        if (request()->ajax()) {
            return DataTables::of($this->fixedAssetService->getFixedAssets())
                ->addIndexColumn()
                ->editColumn('acquisition_date', function ($item) {
                    return $item->acquisition_date?->format('d-m-Y');
                })
                ->addColumn('type', function ($item) {
                    return $item->type?->type_name;
                })
                ->addColumn('status', function ($item) {
                    return $item->status?->status_name;
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.fixed-asset.edit', $item->id),
                        'delete' => route('finance.master-data.fixed-asset.destroy', $item->id),
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
            'page' => 'Add Fixed Asset',
            'action' => route('finance.master-data.fixed-asset.store'),
            'method' => 'POST',
         ];

        $fixed_asset = new FixedAsset;
        $types = FixedAssetType::orderBy('type_name', 'ASC')->get();
        $statuses = FixedAssetStatus::orderBy('status_name', 'ASC')->get();

         return view('pages.finance.master-data.fixed-asset.form', compact('data', 'fixed_asset', 'types', 'statuses'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreFixedAssetRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createFixedAssetResponse = $this->fixedAssetService->createFixedAsset(
            dto: $requestDTO
        );

        return $createFixedAssetResponse->success
            ? to_route('finance.master-data.fixed-asset.index')->with('toastSuccess', $createFixedAssetResponse->message)
            : back()->with('toastError', $createFixedAssetResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getFixedAssetResponse = $this->fixedAssetService->getFixedAssetById($id);
        if (!$getFixedAssetResponse->success) return to_route('finance.master-data.fixed-asset.index')->with('toastError', $getFixedAssetResponse->message);

        $data = [
            'page' => 'Edit Fixed Asset',
            'action' => route('finance.master-data.fixed-asset.update', $id),
            'method' => 'PUT',
         ];

        $types = FixedAssetType::orderBy('type_name', 'ASC')->get();
        $statuses = FixedAssetStatus::orderBy('status_name', 'ASC')->get();

         return view('pages.finance.master-data.fixed-asset.form', [
            'data' => $data,
            'fixed_asset' => $getFixedAssetResponse->data,
            'types' => $types,
            'statuses' => $statuses
         ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateFixedAssetRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateFixedAssetResponse = $this->fixedAssetService->updateFixedAsset(
            id: $id,
            dto: $requestDTO
        );

        return $updateFixedAssetResponse->success
            ? to_route('finance.master-data.fixed-asset.index')->with('toastSuccess', $updateFixedAssetResponse->message)
            : back()->with('toastError', $updateFixedAssetResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deleteFixedAssetResponse = $this->fixedAssetService->deleteFixedAsset(
            id: $id,
        );

        return to_route('finance.master-data.fixed-asset.index')->with(
            $deleteFixedAssetResponse->success ? 'toastSuccess' : 'toastError',
            $deleteFixedAssetResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->fixedAssetService->getFixedAssets();
        $pdf = Pdf::loadView('exports.pdf.fixed-asset', compact('data'));
        $file_name = 'list_fixed_asset_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_fixed_asset_' . time() . '.xlsx';
        return Excel::download(new FixedAssetExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_fixed_asset_' . time() . '.csv';
        return Excel::download(new FixedAssetExport, $file_name);
    }
}
