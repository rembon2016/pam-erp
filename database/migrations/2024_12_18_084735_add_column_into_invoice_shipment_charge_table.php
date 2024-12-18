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
        Schema::table('finance.invoice_shipment_charge', function (Blueprint $table) {
            if (Schema::hasColumn('finance.invoice_shipment_charge', 'unit_id')) {
                $table->dropColumn('unit_id');
            }

            $table->bigInteger('unit_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.invoice_shipment_charge', function (Blueprint $table) {
            //
        });
    }
};
