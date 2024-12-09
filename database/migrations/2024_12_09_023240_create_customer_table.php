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
        Schema::create('finance.customer', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('customer_code')->nullable();
            $table->string('customer_name')->nullable();
            $table->string('eori_number')->nullable();
            $table->string('credit_terms')->nullable();
            $table->integer('credit_limit')->nullable();
            $table->string('overseas')->nullable();
            $table->uuid('currency_id')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer');
    }
};
