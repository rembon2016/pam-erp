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
            $table->string('service_type')->nullable();
            $table->integer('origin_country_id')->nullable();
            $table->uuid('origin_port_id')->nullable();
            $table->integer('destination_country_id')->nullable();
            $table->uuid('destination_port_id')->nullable();
            $table->string('origin_port')->nullable();
            $table->string('destination_port')->nullable();
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
