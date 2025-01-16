<?php

declare(strict_types=1);

namespace App\Functions;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

final class ResponseJson
{
    /**
     * A list of HTTP status codes that are considered successful responses.
     * These codes indicate that the request was processed successfully and the
     * client can expect a valid response.
     *
     * @var array<int>
     */
    const ACCEPTED_SUCCESS_CODE = [
        Response::HTTP_OK,
        Response::HTTP_CREATED,
        Response::HTTP_ACCEPTED,
        Response::HTTP_NON_AUTHORITATIVE_INFORMATION,
        Response::HTTP_NO_CONTENT,
        Response::HTTP_RESET_CONTENT,
        Response::HTTP_PARTIAL_CONTENT,
        Response::HTTP_MULTI_STATUS,
        Response::HTTP_ALREADY_REPORTED,
        Response::HTTP_IM_USED,
        Response::HTTP_MULTIPLE_CHOICES,
    ];

    /**
     * A list of HTTP status codes that are considered failed responses.
     * These codes indicate that the request was not processed successfully and the
     * client should expect an error response.
     *
     * @var array<int>
     */
    const ACCEPTED_FAIL_CODE = [
        Response::HTTP_BAD_REQUEST,
        Response::HTTP_UNAUTHORIZED,
        Response::HTTP_FORBIDDEN,
        Response::HTTP_NOT_FOUND,
        Response::HTTP_METHOD_NOT_ALLOWED,
        Response::HTTP_NOT_ACCEPTABLE,
        Response::HTTP_PROXY_AUTHENTICATION_REQUIRED,
        Response::HTTP_REQUEST_TIMEOUT,
        Response::HTTP_CONFLICT,
        Response::HTTP_GONE,
        Response::HTTP_LENGTH_REQUIRED,
        Response::HTTP_PRECONDITION_FAILED,
        Response::HTTP_UNSUPPORTED_MEDIA_TYPE,
        Response::HTTP_EXPECTATION_FAILED,
        Response::HTTP_I_AM_A_TEAPOT,
        Response::HTTP_MISDIRECTED_REQUEST,
        Response::HTTP_UNPROCESSABLE_ENTITY,
        Response::HTTP_LOCKED,
        Response::HTTP_FAILED_DEPENDENCY,
        Response::HTTP_INTERNAL_SERVER_ERROR
    ];

    /**
     * Returns a successful JSON response with the provided code, message, and data.
     *
     * @param  int  $code  The HTTP status code for the response.
     * @param  string  $message  The message to include in the response.
     * @param  mixed  $data  The data to include in the response.
     * @return \Illuminate\Http\JsonResponse The JSON response.
     *
     * @throws \InvalidArgumentException If the provided code is not a valid success code.
     */
    public static function success(int $code, string $message, mixed $data = []): JsonResponse
    {
        if (! in_array($code, self::ACCEPTED_SUCCESS_CODE)) {
            throw new \InvalidArgumentException('The provided code is not a valid success code.');
        }

        return response()->json([
            'code' => $code,
            'ok' => true,
            'message' => $message,
            'data' => $data,
        ]);
    }

    /**
     * Returns an error JSON response with the provided code, message, and data.
     *
     * This method is used to generate a JSON response for an error condition. The
     * provided code should be a valid HTTP error status code, and the message and
     * data parameters will be included in the response.
     *
     * @param  int  $code  The HTTP status code for the error response.
     * @param  string  $message  The message to include in the error response.
     * @param  mixed  $errors  The error data to include in the error response.
     * @return \Illuminate\Http\JsonResponse The JSON error response.
     *
     * @throws \InvalidArgumentException If the provided code is not a valid error code.
     */
    public static function error(int $code, string $message, mixed $errors = null): JsonResponse
    {
        if (! in_array($code, self::ACCEPTED_FAIL_CODE)) {
            throw new \InvalidArgumentException('The provided code is not a valid fail code.');
        }

        return response()->json([
            'code' => $code,
            'ok' => false,
            'message' => $message,
            'errors' => $errors,
        ]);
    }

    public static function fromObject(object $response): JsonResponse
    {
        return $response->success
            ? self::success($response->code, $response->message, $response->data)
            : self::error($response->code, $response->message, $response->errors);
    }
}
