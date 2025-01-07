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
        Schema::table('finance.chart_of_accounts', function (Blueprint $table) {
            if (! Schema::hasColumn('finance.chart_of_accounts', 'account_group_id')) {
                $table->foreignUuid('account_group_id')
                    ->nullable()
                    ->references('id')
                    ->on('finance.account_groups')
                    ->onUpdate('cascade')
                    ->onDelete('cascade');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('chart_of_accounts', function (Blueprint $table) {
            //
        });
    }
};
