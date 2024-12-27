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
        Schema::table('finance.customer_contract', function (Blueprint $table) {
            $table->foreignUuid('charge_id')
                ->nullable()
                ->references('id')
                ->on('finance.charges')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->foreignUuid('currency_id')
                ->nullable()
                ->references('id')
                ->on('finance.currencies')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->bigInteger('unit_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.customer_contract', function (Blueprint $table) {
            //
        });
    }
};
