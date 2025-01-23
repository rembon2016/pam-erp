<?php

declare(strict_types=1);

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
        Schema::create('finance.customer_contract_service', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('customer_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.customer_contract')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->string('service_type')->nullable();
            $table->integer('origin_country_id')->nullable();
            $table->uuid('origin_port_id')->nullable();
            $table->integer('destination_country_id')->nullable();
            $table->uuid('destination_port_id')->nullable();
            $table->string('origin_port')->nullable();
            $table->string('destination_port')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.customer_contract_service');
    }
};
