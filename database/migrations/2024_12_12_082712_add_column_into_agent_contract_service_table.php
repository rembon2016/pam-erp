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
        Schema::table('finance.agent_contract_service', function (Blueprint $table) {
            if (!Schema::hasColumn('finance.agent_contract_service', 'manual_input_transit')) {
                $table->string('manual_input_transit')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.agent_contract_service', function (Blueprint $table) {
            //
        });
    }
};
