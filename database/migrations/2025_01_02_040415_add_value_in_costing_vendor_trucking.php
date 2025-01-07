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
        Schema::table('finance.costing_vendor_trucking', function (Blueprint $table) {
            if (! Schema::hasColumn('finance.costing_vendor_trucking', 'value')) {
                $table->string('value')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.costing_vendor_trucking', function (Blueprint $table) {
            //
        });
    }
};
