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
            $table->bigInteger('from')->nullable();
            $table->bigInteger('to')->nullable();
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
