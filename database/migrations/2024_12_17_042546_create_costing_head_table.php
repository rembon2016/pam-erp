<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Functions\TableTimestamps;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('finance.costing_head', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->foreignUuid('costing_id')
                ->references('id')
                ->on('finance.costing')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->string('costing_value')->nullable();
            $table->string('costing_type')->nullable();
            $table->string('shipment_type')->nullable();
            $table->uuid('reference_id')->nullable();
            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.costing_head');
    }
};