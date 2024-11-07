<?php

declare(strict_types=1);

namespace App\Functions;

use Illuminate\Database\Schema\Blueprint;

final class TableTimestamps
{
    /**
     * Set the timestamps and soft deletes for the table.
     *
     * @param \Illuminate\Database\Schema\Blueprint $table
     * @return void
     */
    public static function set(Blueprint $table)
    {
        $table->timestamps();
        $table->softDeletes();
        $table->string('created_by')->nullable();
        $table->string('updated_by')->nullable();
        $table->string('deleted_by')->nullable();
    }
}
