<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('finance.costing_special', function (Blueprint $table) {
            if (!Schema::hasColumn('finance.costing_special', 'costing_type')) {
                $table->string('costing_type')->nullable();
            }

            if (!Schema::hasColumn('finance.costing_special', 'currency_id')) {
                $table->uuid('currency_id')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
