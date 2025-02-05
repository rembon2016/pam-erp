<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Support\Str;
use Illuminate\Http\Response;
use App\Models\Finance\Charge;
use App\Functions\ObjectResponse;
use App\Models\Finance\ServiceType;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;

final class ChargeService
{
    public function getCharges($filters = [])
    {
        $charges = Charge::with(['unit'])->when(! empty($filters['charge_code']), function ($query) use ($filters) {
            return $query->where('charge_code', $filters['charge_code']);
        })->when(! empty($filters['charge_name']), function ($query) use ($filters) {
            return $query->where('charge_name', $filters['charge_name']);
        })->when(! empty($filters['is_agreed_rate']), function ($query) use ($filters) {
            return $query->where('is_agreed_rate', true);
        })->when(!empty($filters['service_type_id']), function ($query) use ($filters) {
            return $query->where('transport_type_id', $filters['service_type_id']);
        })->when(!empty($filters['revenue']), function ($query) use ($filters) {
            return $query->where('revenue_id', $filters['revenue']);
        })->when(!empty($filters['cost']), function ($query) use ($filters) {
            return $query->where('cost_id', $filters['cost']);
        })->orderBy('charge_code', 'ASC');

        $totalRecords = Charge::count();
        $filteredRecords = $charges->count();

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'GL Charge']),
            statusCode: Response::HTTP_OK,
            data: (object) [
                'charges' => $charges->get(),
                'chargeDatatables' => $charges->skip(request()->get('start', 0))
                    ->take(request()->get('length', 10))
                    ->orderBy('created_at', 'DESC')
                    ->get(),
                'totalRecords' => $totalRecords,
                'filteredRecords' => $filteredRecords
            ]
        );
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
            $service = ServiceType::findOrFail($dto["transport_type_id"]);
            $dto["transport_type"] = $service->service_code;
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

    public function createMultipleCharge(array $dto)
    {
        try {
            $service = ServiceType::findOrFail($dto["transport_type_id"]);
            $dto["transport_type"] = $service->service_code;
            $charges = collect($dto['charges'])->map(function ($item) use ($dto) {
                $item['id'] = Str::uuid();
                $item['transport_type'] = $dto['transport_type'];
                $item['is_agreed_rate'] = $dto['is_agreed_rate'];
                $item['unit_id'] = $dto['unit_id'];
                $item['cost_id'] = $dto['cost_id'];
                $item['revenue_id'] = $dto['revenue_id'];
                $item['created_at'] = now();

                return $item;
            });

            Charge::insert($charges->toArray());

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Charge']),
                statusCode: Response::HTTP_CREATED,
            );
        } catch (\Throwable $th) {
            dd($th);
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
            $service = ServiceType::findOrFail($dto["transport_type_id"]);
            $dto["transport_type"] = $service->service_code;
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
