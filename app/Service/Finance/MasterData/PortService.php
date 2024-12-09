<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Operation\Master\Port;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

final class PortService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Retrieves all ports ordered by name in ascending order.
     *
     * @return Collection The retrieved ports, or an error response if the operation fails.
     */
    public function getPorts(): Collection
    {
        return Port::with('country')->orderBy('port_name', 'asc')->get();
    }

    /**
     * Retrieves a port by its ID.
     *
     * @param string $id The ID of the port to retrieve.
     * @return object The retrieved port, or an error response if the port is not found.
     */
    public function getPortById(string $id): object
    {
        $port = Port::where('port_id', $id)->first();

        return !is_null($port)
            ? ObjectResponse::success(message: __('crud.fetched', ['name' => 'Port']), data: $port)
            : ObjectResponse::error(message: __('crud.not_found', ['name' => 'Port']), statusCode: 404);
    }

    /**
     * Creates a new port.
     *
     * @param array $dto An array of data to create the new port.
     * @return object The created port, or an error response if the creation fails.
     */
    public function createPort(array $dto): object
    {
        $port = Port::create($dto);

        return ObjectResponse::success(
            message: __('crud.created', ['name' => 'Port']),
            data: $port
        );
    }

    /**
     * Updates an existing port.
     *
     * @param array $dto An array of data to update the port with.
     * @param string $id The ID of the port to update.
     * @return object The updated port, or an error response if the update fails.
     */
    public function updatePort(array $dto, string $id): object
    {
        try {
            $getPortResponse = $this->getPortById(id: $id);
            $getPortResponse->data->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Port']),
                data: $getPortResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    /**
     * Deletes a port by its ID.
     *
     * @param string $id The ID of the port to delete.
     * @return object The deleted port, or an error response if the deletion fails.
     */
    public function deletePort(string $id): object
    {
        try {
            $getPortResponse = $this->getPortById(id: $id);
            $getPortResponse->data->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Port']),
                data: $getPortResponse->data
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
