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
        Schema::create('finance.customer_contract_charge', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer_contract')
                ->onDelete('cascade');
            $table->uuid('charge_id')->nullable();
            $table->string('cahrge_name')->nullable();
            $table->integer('rate')->nullable();
            $table->uuid('unit_id')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_contract_charge');
    }
};
