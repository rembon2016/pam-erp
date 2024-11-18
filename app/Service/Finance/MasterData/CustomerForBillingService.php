<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Models\Operation\Master\CustomerBilling;
use App\Functions\ObjectResponse;

final class CustomerForBillingService
{
    /**
     * Create a new class instance.
     */
    public function __construct(){}

    /**
     * Creates a new currency record in the database.
     *
     * @param array $dto An associative array containing the data for the new currency.
     * @return object An ObjectResponse instance containing the success message and the created currency object.
     * @throws \Throwable If an exception occurs during the creation process.
     */
    public function createCustomer(array $dto): object
    {
        try {
            $customer = CustomerBilling::create($dto);

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Customer For Billing']),
                data: $customer
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace(),
            );
        }
    }

    /**
     * Updates an existing currency record in the database.
     *
     * @param array $dto An associative array containing the updated data for the currency.
     * @return object An ObjectResponse instance containing the success message and the updated currency object.
     * @throws \Throwable If an exception occurs during the update process.
     */
    public function updateCustomer(array $dto): object
    {
        try {
            $customer = CustomerBilling::findOrFail($dto['id']);
            $customer->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Customer For Billing']),
                data: $customer
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }

    /**
     * Deletes an existing currency record from the database.
     *
     * @param array $dto An associative array containing the ID of the currency to be deleted.
     * @return object An ObjectResponse instance containing the success message and the deleted currency object.
     * @throws \Throwable If an exception occurs during the deletion process.
     */
    public function deleteCustomer(array $dto): object
    {
        try {
            $currency = Currency::findOrFail($dto['id']);
            $currency->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Customer For Billing']),
                data: $currency
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
