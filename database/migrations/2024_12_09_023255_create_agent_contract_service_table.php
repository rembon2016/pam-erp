<?php

use App\Functions\TableTimestamps;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('finance.agent_contract_service', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('agent_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract')
                ->onDelete('cascade');
            $table->foreignUuid('service_type_id')
                ->nullable()
                ->references('id')
                ->on('finance.service_type')
                ->onDelete('cascade');
            $table->integer('port')->nullable();
            $table->integer('por_country_id')->nullable();
            $table->uuid('por_port_id')->nullable();
            $table->integer('fdc_country_id')->nullable();
            $table->uuid('fdc_port_id')->nullable();
            $table->string('tos')->nullable();
            $table->string('tos_name')->nullable();
            $table->string('transit_via')->nullable();
            $table->uuid('carrier_id')->nullable();
            $table->string('carrier_name')->nullable();
            $table->string('party')->nullable();
            $table->text('notes')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.agent_contract_service');
    }
};
