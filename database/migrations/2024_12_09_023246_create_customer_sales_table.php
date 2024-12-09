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
        Schema::create('finance.customer_sales', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('location')->nullable();
            $table->string('segment')->nullable();
            $table->string('salesman')->nullable();
            $table->string('customer_services')->nullable();
            $table->bigInteger('credit_days')->nullable();
            $table->double('limit_amount')->nullable();
            $table->bigInteger('publish_credit_days')->nullable();
            $table->double('publish_amount')->nullable();
            $table->date('review_date')->nullable();
            $table->double('override_amount')->nullable();
            $table->integer('allowed_days')->nullable();
            $table->string('tos')->nullable();
            $table->string('contact_person')->nullable();
            $table->string('customer_email')->nullable();
            $table->integer('auto_more_than_percentage')->nullable();
            $table->integer('email_days')->nullable();
            $table->string('automatic_email_to')->nullable();
            $table->string('sales_coordinator')->nullable();
            $table->string('acc_handling_person')->nullable();
            $table->text('note')->nullable();
            $table->string('invoices_to_email')->nullable();
            $table->string('clearance_email')->nullable();
            $table->foreignUuid('customer_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer')
                ->onDelete('cascade');

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_sales');
    }
};
