<?php

namespace App\Functions;

final class Utility
{
    public static function generateTableActions(array $actions)
    {
        $tableActions = '<div class="d-flex flex-wrap align-items-center justify-content-center gap-1">';

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
                $button = '<a href="'.$url.'" class="action-btn btn btn-success btn-sm btn-icon"><i class="bx bx-edit"></i></a>';
                break;

            case 'delete':
                $button = '<a href="'.$url.'" class="action-btn btn btn-danger btn-sm btn-icon" onclick="deleteConfirmation(event)"><i class="bx bx-trash"></i></a>';
                break;

            case 'detail':
                $button = '<a href="'.$url.'" class="action-btn btn btn-info btn-sm btn-icon"><i class="bx bx-info-circle"></i></a>';
                break;

            default:
                $button = '<a href="'.$url.'" class="action-btn btn btn-info btn-sm btn-icon"><i class="bx bx-loader"></i></a>';
                break;
        }

        return $button;
    }
}
