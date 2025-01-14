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
        Schema::table('finance.customer_contract_charge', function (Blueprint $table) {
            if (Schema::hasColumn('finance.customer_contract_charge', 'rate')) $table->dropColumn('rate');
            if (Schema::hasColumn('finance.customer_contract_charge', 'currency_id')) $table->dropColumn('currency_id');
            if (Schema::hasColumn('finance.customer_contract_charge', 'quantity')) $table->dropColumn('quantity');
            if (Schema::hasColumn('finance.customer_contract_charge', 'amount')) $table->dropColumn('amount');
            if (Schema::hasColumn('finance.customer_contract_charge', 'from')) $table->dropColumn('from');
            if (Schema::hasColumn('finance.customer_contract_charge', 'to')) $table->dropColumn('to');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.customer_contract_charge', function (Blueprint $table) {
            //
        });
    }
};
