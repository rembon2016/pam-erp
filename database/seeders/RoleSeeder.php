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
        // app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
        collect(User::ROLES)
            ->each(function ($role) {
                $createdRole = Role::create([
                    'name' => $role,
                ]);

                $configPermission = $role == User::ADMIN_ROLE
                    ? 'permission.list'
                    : ($role == User::SALES_ROLE ? 'permission.list.crm' : "permission.list.{$role}");


                $permissions = $this->generatePermissionList($configPermission);
                $createdRole->syncPermissions($permissions);
            });
    }

    private function generatePermissionList($config_name): array
    {
        $list_of_permissions = config($config_name);
        $permissions = collect();

        if ($config_name == "permission.list") {
            collect($list_of_permissions)->each(function ($features) use ($permissions) {
                collect($features)->each(function ($value, $index) use ($permissions) {
                    if (is_array($value)) {
                        collect($value)->each(function ($label_name, $name_of_feature) use ($permissions) {
                            $permissions->push($name_of_feature);
                        });
                    } else {
                        $permissions->push($value);
                    }
                });

                return $permissions;
            });
        } else {
            collect($list_of_permissions)->each(function ($value, $index) use ($permissions) {
                if (is_array($value)) {
                    collect($value)->each(function ($label_name, $name_of_feature) use ($permissions) {
                        $permissions->push($name_of_feature);
                    });
                } else {
                    $permissions->push($value);
                }
            });
        }

        return $permissions->toArray();
    }
}
