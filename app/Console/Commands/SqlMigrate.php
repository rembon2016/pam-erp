<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Illuminate\Console\Command;

final class SqlMigrate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'pds:sql-migrate {--dbusername=} {--dbname=} {--filename=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Running .sql File';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        try {
            $databaseUsername = $this->option('dbusername');
            $databaseName = $this->option('dbname');
            $filepath = database_path("sql/{$this->option('filename')}.sql");

            // dd($this->option('dbusername'), $this->option('dbname'), $filepath);

            shell_exec("psql -U {$databaseUsername} -d {$databaseName} -a -f {$filepath}");

            $this->info('Migration Process Complete!');
        } catch (\Exception $ex) {
            $this->info($ex->getMessage());
        }
    }
}
