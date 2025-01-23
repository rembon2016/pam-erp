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
        Schema::table('finance.customer_contract_charge', function (Blueprint $table) {
            $table->foreignUuid('customer_contract_service_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer_contract_service')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.customer_contract_charge', function (Blueprint $table) {
            //
        });
    }
};
