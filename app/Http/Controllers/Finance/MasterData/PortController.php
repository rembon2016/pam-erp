<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\Operation\Master\Port;
use Illuminate\Http\RedirectResponse;
use App\Models\Operation\Master\Region;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\MasterData\CurrencyExport;
use App\Exports\MasterData\PortExport;
use App\Models\Operation\Master\Countries;
use App\Service\Finance\MasterData\PortService;
use App\Http\Requests\Finance\MasterData\Port\StorePortRequest;
use App\Http\Requests\Finance\MasterData\Port\UpdatePortRequest;

final class PortController extends Controller
{
    public function __construct(
        protected PortService $portService,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $ports = $this->portService->getPorts();
        return view('pages.finance.master-data.port.index', compact('ports'));
    }

    /**
     * Retrieves a list of ports and returns a JSON response for use with a DataTables library.
     *
     * This method is called when the list of ports needs to be displayed in a table. It fetches the
     * port data from the PortService, adds additional columns for the country name and status, and
     * generates table actions for editing and deleting the ports. The response is formatted as a
     * JSON object that can be consumed by a DataTables library.
     *
     * If the request is not made via AJAX, the method returns an unauthorized error response.
     */
    public function list()
    {
        if (request()->ajax()) {
            return DataTables::of($this->portService->getPorts(request()->query()))
                ->addIndexColumn()
                ->addColumn('country_name', function ($item) {
                    return $item->country?->country_name;
                })
                ->addColumn('status', function ($item) {
                    return $item->getStatusLabel();
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.port.edit', $item->port_id),
                        'delete' => route('finance.master-data.port.destroy', $item->port_id),
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
            'page' => 'Add Port',
            'action' => route('finance.master-data.port.store'),
            'method' => 'POST',
         ];

        $regions = Region::whereNotIn('status', ['2', '3'])->orderBy('region_name', 'asc')->get();
        $transportMode = Port::TRANSPORT_MODE;
        $countries = Countries::whereNotIn('status', ['2', '3'])->orderBy('country_name', 'asc')->get();

        return view('pages.finance.master-data.port.form', compact('regions', 'transportMode', 'countries', 'data'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StorePortRequest $request): RedirectResponse
    {
        $dto = $request->validated();
        $portResponse = $this->portService->createPort(dto: $dto);

        return to_route('finance.master-data.port.index')
            ->with('toastSuccess', $portResponse->message);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): View
    {
        $data = [
            'page' => 'Edit Port',
            'action' => route('finance.master-data.port.update', $id),
            'method' => 'PUT',
         ];

        $port = $this->portService->getPortById(id: $id)->data;
        $regions = Region::whereNotIn('status', ['2', '3'])->orderBy('region_name', 'asc')->get();
        $transportMode = Port::TRANSPORT_MODE;
        $countries = Countries::whereNotIn('status', ['2', '3'])->orderBy('country_name', 'asc')->get();

        return view('pages.finance.master-data.port.form', compact('regions', 'transportMode', 'countries', 'data', 'port'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatePortRequest $request, string $id): RedirectResponse
    {
        $dto = $request->validated();
        $portResponse = $this->portService->updatePort(dto: $dto, id: $id);

        if (!$portResponse->success) return back()->with('toastError', $portResponse->message);

        return to_route('finance.master-data.port.index')
            ->with('toastSuccess', $portResponse->message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): RedirectResponse
    {
        $portResponse = $this->portService->deletePort(id: $id);

        if (!$portResponse->success) return back()->with('toastError', $portResponse->message);

        return to_route('finance.master-data.port.index')
            ->with('toastSuccess', $portResponse->message);
    }

    /**
     * Export the list of currencies to a PDF file.
     *
     * This method generates a PDF file containing the list of currencies ordered by currency code in ascending order.
     * The generated PDF file is then downloaded with the filename "list_currency_{timestamp}.pdf".
     */
    public function exportPdf()
    {
        $data = $this->portService->getPorts();
        $pdf = Pdf::loadView('exports.pdf.port', compact('data'));
        $file_name = 'list_port_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    /**
     * Export the list of currencies to an Excel file.
     *
     * This method generates an Excel file containing the list of currencies ordered by currency code in ascending order.
     * The generated Excel file is then downloaded with the filename "list_currency_{timestamp}.xlsx".
     */
    public function exportExcel()
    {
        $file_name = 'list_port_' . time() . '.xlsx';

        return Excel::download(new PortExport, $file_name);
    }

    /**
     * Export the list of currencies to a CSV file.
     *
     * This method generates a CSV file containing the list of currencies ordered by currency code in ascending order.
     * The generated CSV file is then downloaded with the filename "list_currency_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_port_' . time() . '.csv';

        return Excel::download(new PortExport, $file_name);
    }
}
