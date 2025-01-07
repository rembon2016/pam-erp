<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Exports\MasterData\DaybookExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\Daybook\GlobalDaybookRequest;
use App\Models\Finance\Daybook;
use App\Service\Finance\MasterData\DaybookService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class DaybookController extends Controller
{
    public function __construct(
        protected DaybookService $daybookService
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $daybook_codes = $this->daybookService->getDaybooks()->pluck('code');

        return view('pages.finance.master-data.daybook.index', compact('daybook_codes'));
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            return DataTables::of($this->daybookService->getDaybooks(request()->query()))
                ->addIndexColumn()
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.daybook.edit', $item->id),
                        'delete' => route('finance.master-data.daybook.destroy', $item->id),
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
            'page' => 'Add Daybook',
            'action' => route('finance.master-data.daybook.store'),
            'method' => 'POST',
        ];

        $daybook = new Daybook;

        return view('pages.finance.master-data.daybook.form', compact('data', 'daybook'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalDaybookRequest $request): RedirectResponse
    {
        $requestDTO = $request->validated();
        $createDaybookResponse = $this->daybookService->createDaybook(
            dto: $requestDTO
        );

        return $createDaybookResponse->success
            ? to_route('finance.master-data.daybook.index')->with('toastSuccess', $createDaybookResponse->message)
            : back()->with('toastError', $createDaybookResponse->message)->withInput();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View|RedirectResponse
    {
        $getDaybookResponse = $this->daybookService->getDaybookById($id);
        if (! $getDaybookResponse->success) {
            return to_route('finance.master-data.daybook.index')->with('toastError', $getDaybookResponse->message);
        }

        $data = [
            'page' => 'Edit Daybook',
            'action' => route('finance.master-data.daybook.update', $id),
            'method' => 'PUT',
        ];

        return view('pages.finance.master-data.daybook.form', [
            'data' => $data,
            'daybook' => $getDaybookResponse->data,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalDaybookRequest $request, string $id): RedirectResponse
    {
        $requestDTO = $request->validated();
        $updateDaybookResponse = $this->daybookService->updateDaybook(
            id: $id,
            dto: $requestDTO
        );

        return $updateDaybookResponse->success
            ? to_route('finance.master-data.daybook.index')->with('toastSuccess', $updateDaybookResponse->message)
            : back()->with('toastError', $updateDaybookResponse->message)->withInput();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $deleteDaybookResponse = $this->daybookService->deleteDaybook(
            id: $id,
        );

        return to_route('finance.master-data.daybook.index')->with(
            $deleteDaybookResponse->success ? 'toastSuccess' : 'toastError',
            $deleteDaybookResponse->message
        );
    }

    public function exportPdf()
    {
        $data = $this->daybookService->getDaybooks();
        $pdf = Pdf::loadView('exports.pdf.daybook', compact('data'));
        $file_name = 'list_daybook_'.time().'.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_daybook_'.time().'.xlsx';

        return Excel::download(new DaybookExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_daybook_'.time().'.csv';

        return Excel::download(new DaybookExport, $file_name);
    }
}
