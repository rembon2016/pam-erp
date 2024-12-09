<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('CREATE SCHEMA accounting');
        DB::statement('CREATE SCHEMA crm');
        DB::statement('CREATE SCHEMA dxb');
        DB::statement('CREATE SCHEMA finance');
        DB::statement('CREATE SCHEMA hrm');
        DB::statement('CREATE SCHEMA master');
        DB::statement('CREATE SCHEMA origin');
        DB::statement('CREATE SCHEMA user');
        DB::statement('CREATE SCHEMA usr');
        DB::statement('CREATE SCHEMA usrs');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Schema::dropIfExists('schema_migration');
    }
};
