<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Exports\MasterData\CountryExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\MasterData\Country\StoreCountryRequest;
use App\Http\Requests\Finance\MasterData\Country\UpdateCountryRequest;
use App\Models\Operation\Master\Region;
use App\Service\Finance\MasterData\CountryService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class CountryController extends Controller
{
    public function __construct(
        protected CountryService $countryService,
    ) {}

    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        $countries = $this->countryService->getCountries();

        return view('pages.finance.master-data.country.index', compact('countries'));
    }

    /**
     * Retrieves a list of countries and returns a JSON response for a DataTables request.
     *
     * This method is used to populate a DataTables table with a list of countries. It retrieves the countries from the `CountryService`,
     * adds additional columns for the region name and status label, and generates table actions for editing and deleting the countries.
     * If the request is not an AJAX request, it returns an unauthorized error response.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list()
    {
        if (request()->ajax()) {
            return DataTables::of($this->countryService->getCountryQueries(request()->query()))
                ->addIndexColumn()
                ->addColumn('region_name', function ($item) {
                    return $item->region?->region_name ?? '-';
                })
                ->addColumn('status', function ($item) {
                    return $item->getStatusLabel();
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('finance.master-data.country.edit', $item->country_id),
                        'delete' => route('finance.master-data.country.destroy', $item->country_id),
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
            'page' => 'Add Country',
            'action' => route('finance.master-data.country.store'),
            'method' => 'POST',
        ];

        $regions = Region::whereNotIn('status', ['2', '3'])->orderBy('region_name', 'asc')->get();

        return view('pages.finance.master-data.country.form', compact('data', 'regions'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCountryRequest $request): RedirectResponse
    {
        $dto = $request->validated();
        $countryResponse = $this->countryService->createCountry(dto: $dto);

        return to_route('finance.master-data.country.index')
            ->with('toastSuccess', $countryResponse->message);
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(int $id): View
    {
        $data = [
            'page' => 'Edit Country',
            'action' => route('finance.master-data.country.update', $id),
            'method' => 'PUT',
        ];

        $country = $this->countryService->getCountryById(id: $id)->data;
        $regions = Region::whereNotIn('status', ['2', '3'])->orderBy('region_name', 'asc')->get();

        return view('pages.finance.master-data.country.form', compact('data', 'country', 'regions'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCountryRequest $request, int $id): RedirectResponse
    {
        $dto = $request->validated();
        $countryResponse = $this->countryService->updateCountry(dto: $dto, id: $id);

        if (! $countryResponse->success) {
            return back()->with('toastError', $countryResponse->message);
        }

        return to_route('finance.master-data.country.index')
            ->with('toastSuccess', $countryResponse->message);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id): RedirectResponse
    {
        $countryResponse = $this->countryService->deleteCountry(id: $id);

        if (! $countryResponse->success) {
            return back()->with('toastError', $countryResponse->message);
        }

        return to_route('finance.master-data.country.index')
            ->with('toastSuccess', $countryResponse->message);
    }

    /**
     * Export the list of currencies to a PDF file.
     *
     * This method generates a PDF file containing the list of currencies ordered by currency code in ascending order.
     * The generated PDF file is then downloaded with the filename "list_currency_{timestamp}.pdf".
     */
    public function exportPdf()
    {
        $data = $this->countryService->getCountries();
        $pdf = Pdf::loadView('exports.pdf.country', compact('data'));
        $file_name = 'list_country_'.time().'.pdf';

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
        $file_name = 'list_country_'.time().'.xlsx';

        return Excel::download(new CountryExport, $file_name);
    }

    /**
     * Export the list of currencies to a CSV file.
     *
     * This method generates a CSV file containing the list of currencies ordered by currency code in ascending order.
     * The generated CSV file is then downloaded with the filename "list_currency_{timestamp}.csv".
     */
    public function exportCsv()
    {
        $file_name = 'list_country_'.time().'.csv';

        return Excel::download(new CountryExport, $file_name);
    }
}
