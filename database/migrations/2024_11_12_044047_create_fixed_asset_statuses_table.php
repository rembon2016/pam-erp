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
        Schema::create('finance.fixed_asset_statuses', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('status_name');

            TableTimestamps::set($table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.fixed_asset_statuses');
    }
};
