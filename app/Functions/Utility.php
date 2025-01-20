<?php

namespace App\Functions;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

final class Utility
{
    public static function generateTableActions(array $actions)
    {
        $tableActions = '<div class="d-flex flex-wrap align-items-center justify-content-center gap-3">';

        foreach ($actions as $type => $url) {
            $tableActions .= self::generateActionButton($type, $url);
        }

        $tableActions .= '</div>';

        return $tableActions;
    }

    public static function generateActionButton(string $type, string $url)
    {
        $button = '';
        switch ($type) {
            case 'edit':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-edit text-action-warning"></i></a>';
                break;

            case 'delete':
                $button = '<a href="'.$url.'" class="action-btn btn-icon" onclick="deleteConfirmation(event)"><i class="bx bx-trash text-action-danger"></i></a>';
                break;

            case 'detail':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-info-circle text-action-info"></i></a>';
                break;

            case 'show':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-show text-action-info"></i></a>';
                break;

            case 'cost':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-dollar text-action-success"></i></a>';
                break;

            case 'download':
                $button = '<a href="'.$url.'" class="action-btn btn-icon" download><i class="bx bx-download text-action-success"></i></a>';
                break;

            case 'download-link':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-download text-action-success"></i></a>';
                break;

            case 'cancel':
                $button = '<button data-href="'.$url.'" class="action-btn btn-icon rounded confirm-btn"><i class="bx bx-x-circle text-action-danger"></i></buttonn>';
                break;

            default:
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-loader text-action-primary"></i></a>';
                break;
        }

        return $button;
    }

    public static function generateUniqueCode(
        $table,
        $field,
        $length,
        $prefix,
    ) {
        // Dapatkan ID terakhir berdasarkan skema, tabel, dan kolom tertentu
        $lastRecord = DB::table("$table")
            ->select($field)
            ->orderBy($field, 'desc')
            ->first();

        // Ambil angka terakhir dari ID sebelumnya
        $lastNumber = $lastRecord ? (int) str_replace($prefix.'-', '', $lastRecord->$field) : 0;

        // Hitung ID berikutnya
        $nextNumber = $lastNumber + 1;

        // Format ID baru dengan padding
        $newId = $prefix.'-'.str_pad($nextNumber, $length - strlen($prefix) - 1, '0', STR_PAD_LEFT);

        return $newId;
    }

    public static function getListOfMonths(): array
    {
        $months = array_map(fn ($month) => Carbon::create(null, $month)->format('F'), range(1, 12));

        return $months;
    }

    public static function getListOfYears($bottom_year = 10, $top_year = 0): array
    {
        $years = array_map(fn ($year) => Carbon::create($year, null)->format('Y'), range(date('Y') - $bottom_year, date('Y') + $top_year));

        return $years;
    }
}
