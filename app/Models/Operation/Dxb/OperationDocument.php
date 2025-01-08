<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class OperationDocument extends Model
{
    protected $table = 'dxb.operation_document';

    public $timestamps = false;

    protected $primaryKey = 'document_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['document_id', 'vessel_id', 'vessel_name_voyage', 'operation_chart', 'seaway_bill', 'shipping_line_invoices', 'origin_debit_note', 'transport_invoices', 'shipping_line_do', 'custom_bill_entry', 'custom_inpection', 'final_mawb_copy', 'calogi_invoices', 'airline_agreed_rate', 'dg_handler_invoices', 'dca_approval', 'cash_voucher', 'agreed_rate', 'created_by', 'modified_by', 'origin_id', 'origin_name', 'eta_dubai', 'job_order_id', 'others'];
}
