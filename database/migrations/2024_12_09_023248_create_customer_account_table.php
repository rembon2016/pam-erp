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
        Schema::create('finance.customer_account', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer')
                ->onDelete('cascade');

            $table->foreignUuid('chart_of_account_id')
                ->nullable()
                ->references('id')
                ->on('finance.chart_of_accounts')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreignUuid('currency_id')
                ->nullable()
                ->references('id')
                ->on('finance.currencies')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('lov_status')->nullable();
            $table->text('notes')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_account');
    }
};
