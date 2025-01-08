<?php

declare(strict_types=1);

namespace App\Traits;

use App\Functions\ResponseJson;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

trait HandleJsonValidation
{
    /**
     * pass if validation failed to public validator instance.
     *
     * @return void
     */
    protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator)
    {
        if ($this->is('api*')) {
            throw new ValidationException($validator, ResponseJson::error(
                code: Response::HTTP_UNPROCESSABLE_ENTITY,
                message: 'Invalid Request Payload',
                errors: $validator->getMessageBag()
            ));
        }

        if (request()->routeIs('auth.redirect.erp')) {
            throw new ValidationException($validator, ResponseJson::error(
                code: Response::HTTP_UNPROCESSABLE_ENTITY,
                message: 'Invalid Request Payload',
                errors: $validator->getMessageBag()
            ));
        }
    }
}
