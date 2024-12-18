<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Database\Schema\Blueprint;

final class DumpRemoteSqlFileSeeder extends Seeder
{
    /**
     * An array of accepted customer tables for the migration.
     *
     * @var array
     */
    protected $acceptedAllTypeOfCustomerTables = ['master.vendor', 'accounting.customer', 'master.carrier'];

    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $dbHost = env('DB_HOST');
        $dbUsername = env('DB_USERNAME');
        $dbName = env('DB_DATABASE');
        $dbPort = env('DB_PORT');

        foreach ($this->getSqlList() as $filename) {
            Artisan::call('pds:remote-sql-migrate', ['--dbhost' => $dbHost, '--dbusername' => $dbUsername, '--dbport' => $dbPort, '--dbname' => $dbName, '--filename' => $filename]);
        }

        foreach ($this->acceptedAllTypeOfCustomerTables as $customerTable) {
            if (Schema::hasTable($customerTable)) {
                Schema::table($customerTable, function (Blueprint $table) {
                    $table->foreignUuid('finance_customer_id')
                        ->nullable()
                        ->references('id')
                        ->on('finance.customer')
                        ->nullOnDelete();
                });
            }
        }
    }

    /**
     * Returns a list of SQL file names to be processed.
     *
     * @return array The list of SQL file names.
     */
    private function getSqlList(): array
    {
        return [
            'accounting',
            'crm',
            'dxb',
            'hrm',
            'master',
            'origin',
            'public',
            'user',
            'usr',
            'usrs'
        ];
    }
}
