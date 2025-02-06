<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralTransaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

final class ReceiptVoucherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(string $type)
    {
        return view("pages.finance.general-transaction.receipt-voucher.{$type}.index");
    }

    /**
     * Display a listing of the resource.
     */
    public function list(string $type)
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(string $type)
    {
        $data = [
            'page' => 'Add Receipt Voucher ' . ucfirst($type),
            'action' => route('finance.general-transaction.creditor-journal-voucher.create'),
            'method' => 'POST',
        ];

        return view("pages.finance.general-transaction.receipt-voucher.{$type}.create", compact('data'));
    }
}
