<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Http\Response;
use App\Models\Finance\Charge;
use App\Functions\ObjectResponse;
use Illuminate\Database\Eloquent\Collection;

final class ChargeService
{
    public function getCharges(): Collection
    {
        return Charge::orderBy('charge_code', 'ASC')->get();
    }

    public function getChargeById(string $id): object
    {
        $data = Charge::where('id', $id)->first();
        return !is_null($data)
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
        if (!$getChargeResponse->success) return $getChargeResponse;

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
        if (!$getChargeResponse->success) return $getChargeResponse;

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