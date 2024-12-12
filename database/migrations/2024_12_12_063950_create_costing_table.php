<?php

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
        Schema::create('finance.costing', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->uuid('job_order_id')->nullable();
            $table->text('type')->nullable();
            $table->smallInteger('status')->nullable();
            $table->text('notes')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.costing');
    }
};
