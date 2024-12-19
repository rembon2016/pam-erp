<?php

declare(strict_types=1);

namespace App\Service\Finance\Billing;

use Illuminate\Http\Response;
use App\Models\Finance\Invoice;
use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Collection;
use App\Functions\Utility;

final class InvoiceService
{
    public function getInvoices(array $filters = []): Collection
    {
        return Invoice::orderBy('invoice_no', 'DESC')->get();
    }

    public function createInvoice(array $dto): object
    {
        // dd($dto);
        DB::beginTransaction();
        try {
            $ctd_data = $dto['data'];
            unset($dto['data']);
            $dto['invoice_no'] = Utility::generateUniqueCode(
                table: (new Invoice)->getTable(),
                field: "invoice_no",
                length: 10,
                prefix: "INV"
            );

            $createdInvoice = Invoice::create($dto);

            foreach ($ctd_data as $ctd_number => $item) {
                $createdInvoiceShipment = $createdInvoice->invoiceShipment()->create([
                    'ctd_number' => $item['ctd_number'],
                    'job_id' => null
                ]);

                foreach ($item['charges'] as $charge) {
                    $charge['invoice_id'] = $createdInvoice->id;
                    $createdInvoiceShipment->invoiceShipmentCharge()->create($charge);
                }
            }

            DB::commit();
            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Invoice']),
                statusCode: Response::HTTP_CREATED,
                data: $createdInvoice
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
            return ObjectResponse::error(
                message: __('crud.error_create', ['name' => 'Invoice']),
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR,
                errors: $th->getTrace()
            );
        }
    }
}
