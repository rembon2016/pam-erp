<?php

namespace App\Functions;

final class Utility
{
    public static function generateTableActions(array $actions)
    {
        $tableActions = '<div class="d-flex flex-wrap align-items-center justify-content-center gap-3">';

        foreach ($actions as $type => $url) {
            $tableActions .= self::generateActionButton($type, $url);
        }

        $tableActions .= "</div>";

        return $tableActions;
    }

    public static function generateActionButton(string $type, string $url)
    {
        $button = "";
        switch ($type) {
            case 'edit':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-edit text-action-warning"></i></a>';
                break;

            case 'delete':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-trash text-action-danger"></i></a>';
                break;

            case 'detail':
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-info-circle text-action-info"></i></a>';
                break;

            case 'download':
                $button = '<a href="'.$url.'" class="action-btn btn-icon" download><i class="bx bx-download text-action-success"></i></a>';
                break;

            default:
                $button = '<a href="'.$url.'" class="action-btn btn-icon"><i class="bx bx-loader text-action-primary"></i></a>';
                break;
        }

        return $button;
    }
}