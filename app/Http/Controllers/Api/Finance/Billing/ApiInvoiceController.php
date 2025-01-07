<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Finance\Billing;

use App\Functions\ResponseJson;
use App\Http\Controllers\Controller;
use App\Service\Finance\Billing\InvoiceService;
use App\Service\Operation\Origin\ShippingInstructionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

final class ApiInvoiceController extends Controller
{
    public function __construct(
        protected InvoiceService $invoiceService,
        protected ShippingInstructionService $shippingInstructionService
    ) {}

    public function notLinkedList(): JsonResponse
    {
        $shippingInstructionResponse = $this->shippingInstructionService
            ->getShippingInstructionByCustomerCondition(condition: 'empty');

        return ResponseJson::success(
            code: Response::HTTP_OK,
            message: __('crud.fetched', ['name' => 'Not Linked Invoice']),
            data: $shippingInstructionResponse->data
        );
    }

    public function linkedList(): JsonResponse
    {
        $shippingInstructionResponse = $this->shippingInstructionService
            ->getShippingInstructionByCustomerCondition(condition: 'exists');

        return ResponseJson::success(
            code: Response::HTTP_OK,
            message: __('crud.fetched', ['name' => 'Linked Invoice']),
            data: $shippingInstructionResponse->data
        );
    }
}
