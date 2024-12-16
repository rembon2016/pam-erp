<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use App\Models\Finance\AccountGroup;
use App\Models\Finance\ChartOfAccount;
use Illuminate\Support\Facades\Pipeline;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Builder;

final class ChartOfAccountService
{
    public function getAccountGroups(): Collection
    {
        $accountGroupQueries = AccountGroup::query()
            ->with(['subAccountGroups', 'chartOfAccounts'])
            ->orderBy('code', 'asc');

        $accountGroups = Pipeline::send($accountGroupQueries)
            ->through([
                \App\Http\Filters\COA\SearchFilter::class,
            ])
            ->thenReturn()
            ->get();

        return $accountGroups;
    }

    public function getCoaById(string $id): object
    {
        $coa = ChartOfAccount::where('id', $id)->first();
        return !is_null($coa)
            ? ObjectResponse::success(
                message: __('crud.fetched', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_OK,
                data: $coa
            )
            : ObjectResponse::error(
                message: __('crud.not_found', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_NOT_FOUND
            );
    }

    public function createCoa(array $dto): object
    {
        try {
            $coa = ChartOfAccount::create($dto);

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_CREATED,
                data: $coa
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: __('crud.error_create', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR,
                errors: $th->getTrace(),
            );
        }
    }

    public function updateCoa(array $dto, string $id): object
    {
        $getCoaResponse = $this->getCoaById($id);
        if (!$getCoaResponse->success) return $getCoaResponse;

        try {
            $getCoaResponse->data->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_OK,
                data: $getCoaResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: __('crud.error_update', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR,
                errors: $th->getTrace(),
            );
        }
    }

    public function deleteCoa(string $id): object
    {
        $getCoaResponse = $this->getCoaById($id);
        if (!$getCoaResponse->success) return $getCoaResponse;

        try {
            $getCoaResponse->data->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: __('crud.error_delete', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR,
                errors: $th->getTrace(),
            );
        }
    }
}
