<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralTransaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

final class JournalVoucherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('pages.finance.general-transaction.journal-voucher.index');
    }

    /**
     * Display a listing of the resource.
     */
    public function list()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $data = [
            'page' => 'Add Journal Voucher',
            'action' => route('finance.general-transaction.creditor-journal-voucher.create'),
            'method' => 'POST',
        ];

        return view("pages.finance.general-transaction.journal-voucher.create", compact('data'));
    }
}
