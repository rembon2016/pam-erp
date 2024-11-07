<?php

declare(strict_types=1);

if (! function_exists('helper')) {

    /**
     * Returns the provided value as a string.
     *
     * @param string $value The value to return as a string.
     * @return string The provided value as a string.
     */
    function helper($value = null): string
    {
        return $value ?? 'Hello World this is Global Helper Function';
    }

}
