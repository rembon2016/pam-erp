<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\Charge;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;

final class ChargeService
{
    public function getChargeQueries(?array $filters = []): Builder
    {
        return Charge::when(! empty($filters['charge_code']), function ($query) use ($filters) {
            return $query->where('charge_code', $filters['charge_code']);
        })->when(! empty($filters['charge_name']), function ($query) use ($filters) {
            return $query->where('charge_name', $filters['charge_name']);
        })->when(! empty($filters['is_agreed_rate']), function ($query) use ($filters) {
            return $query->where('is_agreed_rate', $filters['is_agreed_rate']);
        })->orderBy('charge_code', 'ASC');
    }

    public function getCharges($filters = []): Collection
    {
        return $this->getChargeQueries($filters)->get();
    }

    public function getChargeById(string $id): object
    {
        $data = Charge::where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Charge']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Charge']), Response::HTTP_NOT_FOUND);
    }

    public function createCharge(array $dto): object
    {
        try {
            $createdCharge = Charge::create($dto);

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Charge']),
                Response::HTTP_CREATED,
                $createdCharge
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Charge']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updateCharge(string $id, array $dto): object
    {
        $getChargeResponse = $this->getChargeById($id);
        if (! $getChargeResponse->success) {
            return $getChargeResponse;
        }

        try {
            $getChargeResponse->data->update($dto);

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Charge']),
                Response::HTTP_OK,
                $getChargeResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Charge']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deleteCharge(string $id): object
    {
        $getChargeResponse = $this->getChargeById($id);
        if (! $getChargeResponse->success) {
            return $getChargeResponse;
        }

        try {
            $getChargeResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Charge']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Charge']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }
}
