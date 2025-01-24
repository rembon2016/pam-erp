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
        Schema::table('finance.agent_contract', function (Blueprint $table) {
            if (!Schema::hasColumn('finance.agent_contract', 'service_type_id')) $table->foreignUuid('service_type_id')
                ->nullable()
                ->references('id')
                ->on('finance.service_types')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.agent_contract', function (Blueprint $table) {
            //
        });
    }
};
