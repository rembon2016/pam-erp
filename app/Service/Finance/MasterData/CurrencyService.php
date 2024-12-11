<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Models\Finance\Currency;
use App\Functions\ObjectResponse;
use Illuminate\Database\Eloquent\Collection;

final class CurrencyService
{
    /**
     * Create a new class instance.
     */
    public function __construct(){}


    public function getCurrencies(): Collection
    {
        return Currency::orderBy('currency_code', 'ASC')->get();
    }

    /**
     * Creates a new currency record in the database.
     *
     * @param array $dto An associative array containing the data for the new currency.
     * @return object An ObjectResponse instance containing the success message and the created currency object.
     * @throws \Throwable If an exception occurs during the creation process.
     */
    public function createCurrency(array $dto): object
    {
        try {
            $currency = Currency::create($dto);

            return ObjectResponse::success(
                message: __('crud.created', ['name' => 'Currency']),
                data: $currency
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
    public function updateCurrency(array $dto): object
    {
        try {
            $currency = Currency::findOrFail($dto['id']);
            $currency->update($dto);

            return ObjectResponse::success(
                message: __('crud.updated', ['name' => 'Currency']),
                data: $currency
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
    public function deleteCurrency(array $dto): object
    {
        try {
            $currency = Currency::findOrFail($dto['id']);
            $currency->delete();

            return ObjectResponse::success(
                message: __('crud.deleted', ['name' => 'Currency']),
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
