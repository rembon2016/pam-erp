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
        Schema::create('finance.invoice', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->string('invoice_no')->nullable();
            $table->date('invoice_date')->nullable();
            $table->date('invoice_due_date')->nullable();
            $table->uuid('customer_billing_id')->nullable();
            $table->double('chw')->nullable();
            $table->double('total')->nullable();
            $table->text('description')->nullable();
            $table->boolean('revenue_recognition')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.invoice');
    }
};
