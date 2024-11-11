<?php

namespace App\Functions;

final class Convert
{
    public static function convertToTitleCase(string $text, string $delimiter = '_'): string
    {
        $text = str_replace('_', ' ', $text);
        $text = ucwords(strtolower($text));

        return $text;
    }
}
