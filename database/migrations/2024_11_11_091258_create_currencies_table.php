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
        Schema::create('finance.currencies', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->char('currency_code', 8);
            $table->string('currency_name');
            $table->date('currency_date')->nullable();
            $table->decimal('buy_rate', 10, 4)->default(0);
            $table->decimal('sell_rate', 10, 4)->default(0);
            $table->text('notes')->nullable();

            TableTimestamps::set($table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.currencies');
    }
};