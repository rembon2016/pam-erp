<?php

declare(strict_types=1);

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
        Schema::create('finance.agent_contract_charge_detail', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('agent_contract_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreignUuid('agent_contract_service_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract_service')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreignUuid('agent_contract_charge_id')
                ->nullable()
                ->references('id')
                ->on('finance.agent_contract_charge')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('from')->nullable();
            $table->string('to')->nullable();
            $table->text('value')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.agent_contract_charge_detail');
    }
};
