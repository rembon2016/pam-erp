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
        Schema::create('finance.invoice_shipment_charge', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->foreignUuid('invoice_id')
                ->nullable()
                ->references('id')
                ->on('finance.invoice')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreignUuid('invoice_shipment_id')
                ->nullable()
                ->references('id')
                ->on('finance.invoice_shipment')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreignUuid('currency_id')
                ->nullable()
                ->references('id')
                ->on('finance.currencies')
                ->nullOnDelete();
            $table->uuid('charge_id')->nullable();
            $table->string('charge_name')->nullable();
            $table->double('rate')->nullable();
            $table->uuid('unit_id')->nullable();
            $table->double('chw')->nullable();
            $table->double('amount')->nullable();
            $table->double('local_amount')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.invoice_shipment_charge');
    }
};
