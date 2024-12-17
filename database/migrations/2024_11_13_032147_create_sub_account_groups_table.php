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
        Schema::create('finance.sub_account_groups', function (Blueprint $table) {
            $table->uuid('id')->primary();

            $table->foreignUuid('account_group_id')
                ->references('id')
                ->on('finance.account_groups')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->char('code', 20);
            $table->string('name')->unique();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('finance.sub_account_groups');
    }
};
