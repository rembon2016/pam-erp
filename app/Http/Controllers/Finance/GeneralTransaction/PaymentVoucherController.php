<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\GeneralTransaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

final class PaymentVoucherController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(string $type)
    {
        return view("pages.finance.general-transaction.payment-voucher.{$type}.index");
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
            'page' => 'Add Payment Voucher ' . ucfirst($type),
            'action' => route('finance.general-transaction.creditor-journal-voucher.create'),
            'method' => 'POST',
        ];

        return view("pages.finance.general-transaction.payment-voucher.{$type}.create", compact('data'));
    }
}
