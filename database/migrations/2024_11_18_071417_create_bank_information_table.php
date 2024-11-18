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
        Schema::create('finance.bank_information', function (Blueprint $table) {
            $table->uuid('id')->primary();

            $table->string('customer_id');
            $table->string('customer_type')->nullable();

            $table->string('bank_account_number');
            $table->string('bank_account_name');
            $table->string('bank_name');
            $table->string('bank_branch')->nullable();

            $table->string('contact_person_name')->nullable();
            $table->string('contact_person_number')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.bank_information');
    }
};
