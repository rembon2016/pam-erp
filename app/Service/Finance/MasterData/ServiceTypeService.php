<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use App\Models\Finance\ServiceType;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;

final class ServiceTypeService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    public function getServiceTypes($filters = [])
    {
        $serviceTypes = ServiceType::when(! empty($filters['service_code']), function ($query) use ($filters) {
            return $query->where('service_code', $filters['service_code']);
        })->when(! empty($filters['service_name']), function ($query) use ($filters) {
            return $query->where('service_name', $filters['service_name']);
        })->orderBy('service_code', 'ASC')->orderBy('created_at', 'DESC');

        $totalRecords = ServiceType::count();

        $serviceTypeCollections = $serviceTypes->get();

        $filteredRecords = count($serviceTypeCollections);

        return ObjectResponse::success(
            message: __('crud.fetched', ['name' => 'Service Type']),
            statusCode: Response::HTTP_OK,
            data: (object) [
                'serviceTypes' => $serviceTypeCollections,
                'serviceTypeDatatables' => $serviceTypes->skip(request()->get('start', 0))
                    ->take(request()->get('length', 10))
                    ->get(),
                'totalRecords' => $totalRecords,
                'filteredRecords' => $filteredRecords
            ]
        );
    }

    /**
     * Creates a new service type record in the database.
     *
     * @param  array  $dto  An associative array containing the data for the new service type.
     * @return object An ObjectResponse instance containing the success message and the created service type object.
     *
     * @throws \Throwable If an exception occurs during the creation process.
     */
    public function createServiceType(array $dto): object
    {
        try {
            $serviceType = ServiceType::create($dto);

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Service Type']),
                data: $serviceType
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace(),
            );
        }
    }

    /**
     * Updates an existing service type record in the database.
     *
     * @param  array  $dto  An associative array containing the updated data for the service type.
     * @return object An ObjectResponse instance containing the success message and the updated service type object.
     *
     * @throws \Throwable If an exception occurs during the update process.
     */
    public function updateServiceType(array $dto): object
    {
        try {
            $serviceType = ServiceType::findOrFail($dto['id']);
            $serviceType->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Service Type']),
                data: $serviceType
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    /**
     * Deletes an existing service type record from the database.
     *
     * @param  array  $dto  An associative array containing the ID of the service type to be deleted.
     * @return object An ObjectResponse instance containing the success message and the deleted service type object.
     *
     * @throws \Throwable If an exception occurs during the deletion process.
     */
    public function deleteServiceType(array $dto): object
    {
        try {
            $serviceType = ServiceType::findOrFail($dto['id']);
            $serviceType->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Service Type']),
                data: $serviceType
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
