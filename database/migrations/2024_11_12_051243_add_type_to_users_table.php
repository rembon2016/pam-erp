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
        Schema::table('usr.users', function (Blueprint $table) {
            $table->enum('type', ['erp', 'operation'])->default('erp');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('usr.users', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
};