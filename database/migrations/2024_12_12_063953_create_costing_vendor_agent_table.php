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
        Schema::create('finance.costing_vendor_agent', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->foreignUuid('costing_id')
                ->nullable()
                ->references('id')
                ->on('finance.costing')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->string('mawb')->nullable();
            $table->uuid('vendor_id')->nullable();
            $table->string('vendor_name')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.costing_vendor_agent');
    }
};