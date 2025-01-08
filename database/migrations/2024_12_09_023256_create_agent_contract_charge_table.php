<?php

use App\Functions\TableTimestamps;
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
        Schema::create('finance.agent_contract_charge', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('agent_contract_service_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract_service')
                ->onDelete('cascade');
            $table->foreignUuid('agent_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract')
                ->onDelete('cascade');
            $table->uuid('charge_id')->nullable();
            $table->string('charge_name')->nullable();
            $table->uuid('currency_id')->nullable();
            $table->uuid('unit_id')->nullable();
            $table->double('amount_per_unit')->nullable();
            $table->double('minimum_amount')->nullable();
            $table->string('por')->nullable();
            $table->string('fdc')->nullable();
            $table->string('pp_cc')->nullable();
            $table->string('routed')->nullable();
            $table->string('imco')->nullable();
            $table->string('commodity')->nullable();
            $table->string('crn')->nullable();
            $table->string('loading_bay')->nullable();
            $table->date('valid_from_date')->nullable();
            $table->date('valid_to_date')->nullable();
            $table->double('from_0_to_44')->nullable();
            $table->integer('from_45')->nullable();
            $table->double('from_45_to_99')->nullable();
            $table->integer('from_100_to')->nullable();
            $table->double('from_100_to_299')->nullable();
            $table->integer('from_300')->nullable();
            $table->integer('from_300_to_')->nullable();
            $table->integer('from_300_')->nullable();
            $table->double('from_300_to_499')->nullable();
            $table->integer('from_500')->nullable();
            $table->double('from_500_to_999')->nullable();
            $table->integer('from_1000')->nullable();
            $table->double('from_1000_to_infinity')->nullable();
            $table->integer('twenty')->nullable();
            $table->double('twenty_feet')->nullable();
            $table->double('forty_feet')->nullable();
            $table->double('forty_five_feet')->nullable();
            $table->integer('forty_five_feet_integer')->nullable();
            $table->double('forty_five_feet_hc')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.agent_contract_charge');
    }
};
