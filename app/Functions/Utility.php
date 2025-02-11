<?php

namespace App\Functions;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

final class Utility
{
    public static function generateTableActions(array $actions)
    {
        $tableActions = '<div class="dropdown dropdown-action d-flex align-items-center justify-content-center">';
        $tableActions .= '<a href="#" class="btn-action-icon show" data-bs-toggle="dropdown" aria-expanded="true"><i class="fas fa-ellipsis-v"></i></a>';
        $tableActions .= '<div class="dropdown-menu dropdown-menu-end" data-popper-placement="bottom-end" style="position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate3d(0px, 30px, 0px);">';
        $tableActions .= '<ul>';

        foreach ($actions as $type => $url) {
            $tableActions .= self::generateActionButton($type, $url);
        }

        $tableActions .= '</ul>';
        $tableActions .= '</div>';
        $tableActions .= '</div>';

        return $tableActions;
    }

    public static function generateActionButton(string $type, string $url)
    {
        $button = '<li>';
        switch ($type) {
            case 'edit':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="far fa-edit me-2"></i> Edit</a>';
                break;

            case 'delete':
                $button .= '<a href="'.$url.'" class="dropdown-item" onclick="deleteConfirmation(event)"><i class="far fa-trash-alt me-2"></i> Delete</a>';
                break;

            case 'detail':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="far fa-eye me-2"></i> View</a>';
                break;

            case 'show':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="bx bx-show text-action-info"></i></a>';
                break;

            case 'cost':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="bx bx-dollar text-action-success"></i></a>';
                break;

            case 'download':
                $button .= '<a href="'.$url.'" class="dropdown-item" download><i class="fa fa-download"></i> Download</a>';
                break;

            case 'download-link':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="fa fa-download"></i> Download</a>';
                break;

            case 'cancel':
                $button .= '<button data-href="'.$url.'" class="dropdown-item rounded confirm-btn"><i class="bx bx-x-circle text-action-danger"></i></buttonn>';
                break;

            case 'history':
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="bx bx-history text-action-info"></i></a>';
                break;

            default:
                $button .= '<a href="'.$url.'" class="dropdown-item"><i class="bx bx-loader text-action-primary"></i></a>';
                break;
        }

        $button .= '</li>';

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
