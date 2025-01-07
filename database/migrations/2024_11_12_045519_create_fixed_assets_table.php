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
        Schema::create('finance.fixed_assets', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('asset_code');
            $table->string('asset_name');
            $table->foreignUuid('fixed_asset_type_id')
                ->nullable()
                ->references('id')
                ->on('finance.fixed_asset_types')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->date('acquisition_date')->nullable();
            $table->decimal('purchase_price', 10, 4)->default(0);
            $table->string('useful_life')->nullable();
            $table->foreignUuid('fixed_asset_status_id')
                ->nullable()
                ->references('id')
                ->on('finance.fixed_asset_statuses')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->text('notes')->nullable();

            TableTimestamps::set($table);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.fixed_assets');
    }
};
