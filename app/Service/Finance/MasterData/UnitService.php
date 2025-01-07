<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Operation\Master\Unit;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Response;

final class UnitService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Retrieves all unit records ordered by unit name in ascending order.
     *
     * @return \Illuminate\Database\Eloquent\Collection A collection of Unit models.
     */
    public function getUnitCollections($filters = []): Collection
    {
        return Unit::when(! empty($filters['unit_code']), function ($query) use ($filters) {
            return $query->where('unit_name', $filters['unit_code']);
        })->when(! empty($filters['unit_name']), function ($query) use ($filters) {
            return $query->where('description', $filters['unit_name']);
        })->orderBy('date_created', 'DESC')->get();
    }

    /**
     * Retrieves a unit record by its ID.
     *
     * @param  int  $id  The ID of the unit to retrieve.
     * @return object An ObjectResponse instance containing the success message and the retrieved unit object
     */
    public function getUnitById(int $id): object
    {
        $data = Unit::where('unit_id', $id)->first();

        return ! is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Unit']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Unit']), Response::HTTP_NOT_FOUND);
    }

    /**
     * Creates a new unit record in the database.
     *
     * @param  array  $dto  An associative array containing the data for the new unit.
     * @return object An ObjectResponse instance containing the success message and the created unit object.
     *
     * @throws \Throwable If an exception occurs during the creation process.
     */
    public function createUnit(array $dto): object
    {
        try {
            $unit = Unit::create($dto);

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Unit']),
                data: $unit
            );

        } catch (\Throwable $th) {
            dd($th);

            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace(),
            );
        }
    }

    /**
     * Updates an existing unit record in the database.
     *
     * @param  array  $dto  An associative array containing the updated data for the unit.
     * @return object An ObjectResponse instance containing the success message and the updated unit object.
     *
     * @throws \Throwable If an exception occurs during the update process.
     */
    public function updateUnit(int $id, array $dto): object
    {
        try {
            $unit = Unit::where('unit_id', $id)->first();
            $unit->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Unit']),
                data: $unit
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    /**
     * Deletes an existing unit record from the database.
     *
     * @param  array  $dto  An associative array containing the ID of the unit to be deleted.
     * @return object An ObjectResponse instance containing the success message and the deleted unit object.
     *
     * @throws \Throwable If an exception occurs during the deletion process.
     */
    public function deleteUnit(int $id): object
    {
        try {
            $unit = Unit::findOrFail($id);
            $unit->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Unit']),
                data: $unit
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
