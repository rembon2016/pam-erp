<?php

declare(strict_types=1);

namespace App\Http\Requests\Auth;

use App\Traits\HandleJsonValidation;
use Illuminate\Support\Str;
use Illuminate\Foundation\Http\FormRequest;

final class LoginSSORequest extends FormRequest
{
    use HandleJsonValidation;

    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'email' => ['required', 'email', 'exists:pgsql.user.account,username'],
            'signature' => [
                'required',
                function ($attribute, $value, $fail) {
                    $explodeValue = explode('|', base64_decode($value));
                    $epochFormat = $explodeValue[0];
                    $salt = $explodeValue[1];

                    $checkEpochFormat = $this->isValidUnixTimestamp(intval($epochFormat));
                    $checkSalt = strlen($salt) == 25;

                    if (!$checkEpochFormat || !$checkSalt) {
                        $fail('Invalid Signature Format, Please Check your Payload');
                    }

                }
            ]
        ];
    }

    /**
     * Check if the given timestamp is a valid Unix timestamp.
     *
     * @param string|int $timestamp
     * @return bool
     */
    private function isValidUnixTimestamp(string|int $timestamp)
    {
        // Check if the input is numeric and non-negative
        if (!is_numeric($timestamp) || $timestamp < 0) {
            return false;
        }

        // Determine if it's in seconds or milliseconds
        $length = strlen((string) $timestamp);
        if ($length === 13) {
            $timestampInSeconds = floor($timestamp / 1000); // Convert milliseconds to seconds
        } elseif ($length === 10) {
            $timestampInSeconds = $timestamp; // Already in seconds
        } else {
            return false; // Invalid length
        }

        // Validate the timestamp range
        if ($timestampInSeconds < 0 || $timestampInSeconds > 32503680000) { // Beyond year 3000
            return false;
        }

        // Use DateTime for robust validation
        try {
            (new \DateTime())->setTimestamp(intval($timestampInSeconds));
            return true;
        } catch (\Exception $e) {
            return false; // Invalid timestamp
        }
    }

}
