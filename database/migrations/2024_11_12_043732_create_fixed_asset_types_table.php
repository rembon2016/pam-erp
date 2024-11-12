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
        Schema::create('finance.fixed_asset_types', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('type_name');
            $table->string('type_code')->nullable();

            TableTimestamps::set($table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.fixed_asset_types');
    }
};
