<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\FixedAsset;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;

final class FixedAssetService
{
    public function getFixedAssets(): Collection
    {
        return FixedAsset::orderBy('asset_code', 'ASC')->get();
    }

    public function getFixedAssetById(string $id): object
    {
        $data = FixedAsset::where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Fixed Asset']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Fixed Asset']), Response::HTTP_NOT_FOUND);
    }

    public function createFixedAsset(array $dto): object
    {
        try {
            $createdFixedAsset = FixedAsset::create($dto);

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Fixed Asset']),
                Response::HTTP_CREATED,
                $createdFixedAsset
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Fixed Asset']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updateFixedAsset(string $id, array $dto): object
    {
        $getFixedAssetResponse = $this->getFixedAssetById($id);
        if (! $getFixedAssetResponse->success) {
            return $getFixedAssetResponse;
        }

        try {
            $getFixedAssetResponse->data->update($dto);

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Fixed Asset']),
                Response::HTTP_OK,
                $getFixedAssetResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Fixed Asset']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deleteFixedAsset(string $id): object
    {
        $getFixedAssetResponse = $this->getFixedAssetById($id);
        if (! $getFixedAssetResponse->success) {
            return $getFixedAssetResponse;
        }

        try {
            $getFixedAssetResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Fixed Asset']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Fixed Asset']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }
}
