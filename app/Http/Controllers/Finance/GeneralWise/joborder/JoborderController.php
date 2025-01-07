<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralWise\Joborder;

use App\Http\Controllers\Controller;
use Illuminate\View\View;

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
