<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralWise\Joborder;

use Illuminate\View\View;
use App\Functions\Utility;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\RedirectResponse;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use Carbon\Carbon;

final class JoborderController extends Controller
{


    /**
     * Display a listing of the resource.
     */
    public function index($type): View
    {

        return view(
            'pages.finance.general-wise.joborder.index',
            compact('type', 'page', 'shipment_by')
        );
    }
}
