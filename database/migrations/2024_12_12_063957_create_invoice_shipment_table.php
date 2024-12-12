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
        Schema::create('finance.invoice_shipment', function (Blueprint $table) {
            $table->uuid('id')->primary()->unique();
            $table->foreignUuid('invoice_id')
                ->nullable()
                ->on('finance.invoice')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->uuid('job_id')->nullable();
            $table->string('ctd_number')->nullable();

            TableTimestamps::set(table: $table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.invoice_shipment');
    }
};
