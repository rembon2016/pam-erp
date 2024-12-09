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
        Schema::create('finance.customer_bank', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer')
                ->onDelete('cascade');
            $table->string('account_number')->nullable();
            $table->string('account_name')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('iban_number')->nullable();
            $table->string('swift_code')->nullable();
            $table->text('bank_address')->nullable();
            $table->string('bank_guarantee_ac_number')->nullable();
            $table->string('blz_number_sort_code')->nullable();
            $table->string('paye_beneficiary_id')->nullable();
            $table->string('payment_type')->nullable();
            $table->string('beneficiary_code')->nullable();
            $table->string('beneficiary_ac_number')->nullable();
            $table->string('beneficiary_ac_type')->nullable();
            $table->string('beneficiary_name')->nullable();
            $table->integer('beneficiary_address')->nullable();
            $table->string('beneficiary_first_address')->nullable();
            $table->integer('beneficiary_second_a')->nullable();
            $table->string('beneficiary_second_address')->nullable();
            $table->string('beneficiary_third_address')->nullable();
            $table->string('beneficiary_city')->nullable();
            $table->string('beneficiary_state')->nullable();
            $table->string('beneficiary_pincode')->nullable();
            $table->string('ifsc_code')->nullable();
            $table->string('beneficiary_mobile_number')->nullable();
            $table->string('beneficiary_bank_number')->nullable();
            $table->string('beneficiary_bank_name')->nullable();
            $table->string('beneficiary_bank_branch_name')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_bank');
    }
};
