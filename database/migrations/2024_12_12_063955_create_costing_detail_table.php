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
        Schema::create('finance.costing_detail', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->foreignUuid('costing_id')
                ->nullable()
                ->references('id')
                ->on('finance.costing')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->string('shipment_type')->nullable();
            $table->string('costing_type')->nullable();
            $table->string('costing_value')->nullable();
            $table->date('transaction_date')->nullable();
            $table->uuid('vendor_id')->nullable();
            $table->string('vendor_name')->nullable();
            $table->uuid('charge_id')->nullable();
            $table->string('charge_name')->nullable();
            $table->double('rate')->nullable();
            $table->double('amount')->nullable();
            $table->double('local_amount')->nullable();
            $table->string('status')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.costing_detail');
    }
};
