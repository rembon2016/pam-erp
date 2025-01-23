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
            if (Schema::hasColumn('finance.customer_contract', 'service_type')) $table->dropColumn('service_type');
            if (Schema::hasColumn('finance.customer_contract', 'origin_country_id')) $table->dropColumn('origin_country_id');
            if (Schema::hasColumn('finance.customer_contract', 'origin_port_id')) $table->dropColumn('origin_port_id');
            if (Schema::hasColumn('finance.customer_contract', 'origin_port')) $table->dropColumn('origin_port');
            if (Schema::hasColumn('finance.customer_contract', 'destination_country_id')) $table->dropColumn('destination_country_id');
            if (Schema::hasColumn('finance.customer_contract', 'destination_port_id')) $table->dropColumn('destination_port_id');
            if (Schema::hasColumn('finance.customer_contract', 'destination_port')) $table->dropColumn('destination_port');
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
