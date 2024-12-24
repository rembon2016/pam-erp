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
        Schema::table('finance.agent_contract_charge', function (Blueprint $table) {
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_45')) $table->dropColumn('from_45');
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_100_to')) $table->dropColumn('from_100_to');
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_300')) $table->dropColumn('from_300');
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_300_to_')) $table->dropColumn('from_300_to_');
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_300_')) $table->dropColumn('from_300_');
            if (Schema::hasColumn('finance.agent_contract_charge', 'from_1000')) $table->dropColumn('from_1000');
            if (Schema::hasColumn('finance.agent_contract_charge', 'twenty')) $table->dropColumn('twenty');
            if (Schema::hasColumn('finance.agent_contract_charge', 'forty_five_feet_integer')) $table->dropColumn('forty_five_feet_integer');

            $table->double('twenty_feet_goh')->nullable();

            $table->double('forty_feet_goh')->nullable();
            $table->double('forty_feet_hc')->nullable();
            $table->double('forty_feet_hc_goh')->nullable();

            $table->double('forty_five_feet_goh')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.agent_contract_charge', function (Blueprint $table) {
            //
        });
    }
};
