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
        Schema::table('finance.currencies', function (Blueprint $table) {
            if (Schema::hasColumn('finance.currencies', 'currency_date')) {
                $table->dropColumn('currency_date');
            }
            if (Schema::hasColumn('finance.currencies', 'buy_rate')) {
                $table->dropColumn('buy_rate');
            }
            if (Schema::hasColumn('finance.currencies', 'sell_rate')) {
                $table->dropColumn('sell_rate');
            }
            if (Schema::hasColumn('finance.currencies', 'notes')) {
                $table->dropColumn('notes');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('finance.currencies', function (Blueprint $table) {
            //
        });
    }
};
