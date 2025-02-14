<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Role;
use App\Models\Permission;
use Illuminate\Database\Seeder;
use Database\Seeders\RoleSeeder;
use Illuminate\Support\Facades\DB;
use Database\Seeders\PermissionSeeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

final class ResetRolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Artisan::call('permission:cache-reset');
        DB::table('usrs.role_has_permissions')->truncate();
        DB::table('usrs.model_has_roles')->truncate();
        DB::table('usrs.model_has_permissions')->truncate();
        Role::truncate();
        Permission::truncate();

        $this->call([
            PermissionSeeder::class,
            RoleSeeder::class,
        ]);

    }
}
