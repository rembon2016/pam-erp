<?php

namespace App\Functions;

use Carbon\Carbon;

final class Convert
{
    public static function convertToTitleCase(string $text, string $delimiter = '_'): string
    {
        $text = str_replace('_', ' ', $text);
        $text = ucwords(strtolower($text));

        return $text;
    }

    public static function date($date)
    {
        return Carbon::parse($date)->format('d M Y') ?? '';
    }
}
