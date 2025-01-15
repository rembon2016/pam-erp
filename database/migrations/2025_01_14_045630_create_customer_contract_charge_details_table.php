<?php

declare(strict_types=1);

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
        Schema::create('finance.customer_contract_charge_detail', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer_contract')
                ->onDelete('cascade');
            $table->foreignUuid('customer_contract_charge_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer_contract_charge')
                ->onDelete('cascade');
            $table->string('container_type')->nullable();
            $table->bigInteger('from')->nullable();
            $table->bigInteger('to')->nullable();
            $table->bigInteger('rate')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_contract_charge_detail');
    }
};
