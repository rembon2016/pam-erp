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
        Schema::create('finance.chart_of_accounts', function (Blueprint $table) {
            $table->uuid('id')->primary();

            $table->foreignUuid('sub_account_group_id')
                ->references('id')
                ->on('finance.sub_account_groups')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('account_number');
            $table->string('account_name');
            $table->string('subledger_code');
            $table->string('subledger_name');

            $table->boolean('is_cashflow')->default(false);

            $table->enum('account_position', ['debit', 'credit'])->default('debit');
            $table->enum('cashflow_type', ['operating', 'financing', 'investing'])->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.chart_of_accounts');
    }
};
