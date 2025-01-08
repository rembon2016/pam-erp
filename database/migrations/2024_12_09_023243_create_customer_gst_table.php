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
        Schema::create('finance.customer_gst', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer')
                ->onDelete('cascade');
            $table->string('address_type')->nullable();
            $table->integer('arn_number')->nullable();
            $table->string('msme')->nullable();
            $table->string('city')->nullable();
            $table->integer('hs')->nullable();
            $table->string('hsn_codes')->nullable();
            $table->string('uam_number')->nullable();
            $table->string('state')->nullable();
            $table->string('nac_codes')->nullable();
            $table->string('type_of_enterprise')->nullable();
            $table->text('address')->nullable();
            $table->string('uin_number')->nullable();
            $table->string('pan_mandatory')->nullable();
            $table->string('composit_regular')->nullable();
            $table->string('sez_valid_from_date')->nullable();
            $table->string('sez')->nullable();
            $table->string('pan_number')->nullable();
            $table->string('sez_valid_to_date')->nullable();
            $table->string('gst_registration_status')->nullable();
            $table->string('passport_number')->nullable();
            $table->string('tan_number')->nullable();
            $table->string('gsg_id')->nullable();
            $table->string('gsg_provisional_id')->nullable();
            $table->string('gsd_id')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_gst');
    }
};
