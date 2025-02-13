<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\AccountGroup;
use App\Models\Finance\ChartOfAccount;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Pipeline;
use Illuminate\Support\Str;

final class ChartOfAccountService
{
    public function getChartOfAccounts(): Collection
    {
        $data = ChartOfAccount::select([
            'id',
            'account_number as code',
            'account_name',
        ])->orderBy('account_number', 'asc')->get();

        return $data;
    }

    public function getAccountGroups(): Collection
    {
        $searchTerm = request('search');

        $accountGroupQueries = AccountGroup::query()
            ->select('id', 'code', 'name')
            ->with([
                'subAccountGroups' => function ($query) use ($searchTerm) {
                    $query->select('id', 'account_group_id', 'code', 'name')
                        ->orderBy('code', 'asc')
                        ->when($searchTerm, function ($q) use ($searchTerm) {
                            $q->where(function ($sq) use ($searchTerm) {
                                $sq->where('name', 'ilike', '%' . $searchTerm . '%')
                                    ->orWhere('code', 'ilike', '%' . $searchTerm . '%')
                                    ->orWhereHas('chartOfAccounts', function ($cq) use ($searchTerm) {
                                        $cq->where('account_name', 'ilike', '%' . $searchTerm . '%')
                                            ->orWhere('account_number', 'ilike', '%' . $searchTerm . '%');
                                    });
                            });
                        });
                },
                'subAccountGroups.chartOfAccounts' => function ($query) use ($searchTerm) {
                    $query->select('id', 'sub_account_group_id', 'account_number', 'account_name')
                        ->orderBy('account_number', 'asc')
                        ->when($searchTerm, function ($q) use ($searchTerm) {
                            $q->where(function ($cq) use ($searchTerm) {
                                $cq->where('account_name', 'ilike', '%' . $searchTerm . '%')
                                    ->orWhere('account_number', 'ilike', '%' . $searchTerm . '%');
                            });
                        });
                }
            ])
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

        return ! is_null($coa)
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

    public function createMultipleCoa(array $dto): object
    {
        try {
            $accounts = collect($dto['accounts'])->map(function ($item) use ($dto) {
                $item['id'] = Str::uuid();
                $item['account_number'] = str_replace('.', '', str_pad($item['account_number'], 10, '0', STR_PAD_RIGHT));
                $item['account_group_id'] = $dto['account_group_id'];
                $item['sub_account_group_id'] = $dto['sub_account_group_id'];
                $item['is_cashflow'] = $dto['is_cashflow'];
                $item['cashflow_type'] = ! empty($dto['cashflow_type']) ? $dto['cashflow_type'] : null;
                $item['account_position'] = ! empty($dto['account_position']) ? $dto['account_position'] : null;
                $item['created_at'] = now();

                return $item;
            });

            ChartOfAccount::insert($accounts->toArray());

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Chart of Account']),
                statusCode: Response::HTTP_CREATED,
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
        if (! $getCoaResponse->success) {
            return $getCoaResponse;
        }

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
        if (! $getCoaResponse->success) {
            return $getCoaResponse;
        }

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
