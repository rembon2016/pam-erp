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
        Schema::table('finance.customer_contract', function (Blueprint $table) {
            if (Schema::hasColumn('finance.customer_contract', 'total_amount')) $table->dropColumn('total_amount');
            if (Schema::hasColumn('finance.customer_contract', 'charge_id')) $table->dropColumn('charge_id');
            if (Schema::hasColumn('finance.customer_contract', 'unit_id')) $table->dropColumn('unit_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.customer_contract', function (Blueprint $table) {
            //
        });
    }
};
