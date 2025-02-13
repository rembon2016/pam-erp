<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Finance\Daybook;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;

final class DaybookService
{
    public function getDaybooks($filters = [])
    {
        $daybooks = Daybook::when(! empty($filters['daybook_code']), function ($query) use ($filters) {
            $query->where('code', $filters['daybook_code']);
        })->orderBy('code', 'ASC');

        $totalRecords = Daybook::count();

        $daybookCollections = $daybooks->get();

        $filteredRecords = count($daybookCollections);

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Daybook']),
            statusCode: Response::HTTP_OK,
            data: (object) [
                'daybooks' => $daybookCollections,
                'daybookDatatables' => $daybooks->skip(request()->get('start', 0))
                    ->take(request()->get('length', 10))
                    ->orderBy('created_at', 'DESC'),
                'totalRecords' => $totalRecords,
                'filteredRecords' => $filteredRecords
            ]
        );
    }

    public function getDaybookById(string $id): object
    {
        $data = Daybook::where('id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Daybook']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Daybook']), Response::HTTP_NOT_FOUND);
    }

    public function createDaybook(array $dto): object
    {
        try {
            $createdDaybook = Daybook::create($dto);

            return ObjectResponse::success(
                __('crud.created', ['name' => 'Daybook']),
                Response::HTTP_CREATED,
                $createdDaybook
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Daybook']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updateDaybook(string $id, array $dto): object
    {
        $getDaybookResponse = $this->getDaybookById($id);
        if (! $getDaybookResponse->success) {
            return $getDaybookResponse;
        }

        try {
            $getDaybookResponse->data->update($dto);

            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Daybook']),
                Response::HTTP_OK,
                $getDaybookResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Daybook']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deleteDaybook(string $id): object
    {
        $getDaybookResponse = $this->getDaybookById($id);
        if (! $getDaybookResponse->success) {
            return $getDaybookResponse;
        }

        try {
            $getDaybookResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Daybook']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Daybook']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }
}
