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
        Schema::create('finance.charges', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('charge_code');
            $table->string('charge_name');
            $table->string('transport_type')->nullable();
            $table->bigInteger('unit_id')->nullable();
            $table->uuid('revenue_id')->nullable();
            $table->uuid('cost_id')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.charges');
    }
};
