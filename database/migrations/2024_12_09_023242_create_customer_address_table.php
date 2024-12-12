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
        Schema::create('finance.customer_address', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer')
                ->onDelete('cascade');

            $table->string('address_type')->nullable();
            $table->string('bank_dlr_code')->nullable();
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->text('address')->nullable();
            $table->string('country')->nullable();
            $table->bigInteger('zip')->nullable();
            $table->bigInteger('po_box')->nullable();
            $table->string('phone_number')->nullable();
            $table->string('fax_number')->nullable();
            $table->string('warehouse_provider')->nullable();

            $table->json('contact_informations')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_address');
    }
};
