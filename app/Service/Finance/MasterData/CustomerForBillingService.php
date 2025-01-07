<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Functions\ObjectResponse;
use App\Models\Operation\Master\CustomerBilling;

final class CustomerForBillingService
{
    /**
     * Create a new class instance.
     */
    public function __construct() {}

    /**
     * Creates a new customer billing record in the database.
     *
     * @param  array  $dto  An associative array containing the data for the new customer billing.
     * @return object An ObjectResponse instance containing the success message and the created customer billing object.
     *
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
     * Updates an existing customer billing record in the database.
     *
     * @param  array  $dto  An associative array containing the updated data for the customer billing.
     * @return object An ObjectResponse instance containing the success message and the updated customer billing object.
     *
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
     * Deletes an existing customer billing record from the database.
     *
     * @param  array  $dto  An associative array containing the ID of the customer billing to be deleted.
     * @return object An ObjectResponse instance containing the success message and the deleted customer billing object.
     *
     * @throws \Throwable If an exception occurs during the deletion process.
     */
    public function deleteCustomer(array $dto): object
    {
        try {
            $customer = CustomerBilling::findOrFail($dto['id']);
            $customer->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Customer For Billing']),
                data: $customer
            );

        } catch (\Throwable $th) {
            return ObjectResponse::error(
                message: $th->getMessage(),
                errors: $th->getTrace()
            );
        }
    }
}
