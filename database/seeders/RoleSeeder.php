<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Arr;

final class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
        collect(User::ROLES)
            ->each(function ($role) {
                $createdRole = Role::create([
                    'name' => $role,
                ]);

                $configPermission = $role == User::ADMIN_ROLE
                    ? 'permission.list'
                    : ($role == User::SALES_ROLE ? 'permission.list.crm' : "permission.list.{$role}");

                $createdRole->syncPermissions(Arr::flatten(config($configPermission)));
            });
    }
}
