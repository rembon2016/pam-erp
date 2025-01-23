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
        Schema::table('finance.histories', function (Blueprint $table) {
            $table->foreignUuid('parent_id')
                ->nullable()
                ->references('id')
                ->on('finance.histories')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.histories', function (Blueprint $table) {
            $table->dropColumn('parent_id');
        });
    }
};
