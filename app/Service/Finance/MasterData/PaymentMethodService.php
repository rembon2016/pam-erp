<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\PaymentMethod;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;

final class PaymentMethodService
{
    public function getPaymentMethods($filters = [])
    {
        $paymentMethods = PaymentMethod::when(! empty($filters['payment_terms']), function ($query) use ($filters) {
            return $query->where('payment_terms', $filters['payment_terms']);
        })->orderBy('payment_terms', 'DESC');

        $totalRecords = PaymentMethod::count();
        $filteredRecords = $paymentMethods->count();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Payment Method']),
            statusCode: Response::HTTP_OK,
            data: (object) [
                'paymentMethods' => $paymentMethods->get(),
                'paymentMethodDatatables' => $paymentMethods->skip(request()->get('start', 0))
                    ->take(request()->get('length', 10))
                    ->orderBy('created_at', 'DESC')
                    ->get(),
                'totalRecords' => $totalRecords,
                'filteredRecords' => $filteredRecords
            ]
        );
    }

    public function getPaymentMethodById(string $id): object
    {
        $data = PaymentMethod::where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Payment Method']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Payment Method']), Response::HTTP_NOT_FOUND);
    }

    public function createPaymentMethod(array $dto): object
    {
        try {
            $createdPaymentMethod = PaymentMethod::create($dto);

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Payment Method']),
                Response::HTTP_CREATED,
                $createdPaymentMethod
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Payment Method']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updatePaymentMethod(string $id, array $dto): object
    {
        $getPaymentMethodResponse = $this->getPaymentMethodById($id);
        if (! $getPaymentMethodResponse->success) {
            return $getPaymentMethodResponse;
        }

        try {
            $getPaymentMethodResponse->data->update($dto);

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Payment Method']),
                Response::HTTP_OK,
                $getPaymentMethodResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Payment Method']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deletePaymentMethod(string $id): object
    {
        $getPaymentMethodResponse = $this->getPaymentMethodById($id);
        if (! $getPaymentMethodResponse->success) {
            return $getPaymentMethodResponse;
        }

        try {
            $getPaymentMethodResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Payment Method']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Payment Method']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }
}
