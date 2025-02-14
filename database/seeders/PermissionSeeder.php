<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;

final class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
        // $list_of_permissions = collect(config('permission.list'));
        // $permissions = $list_of_permissions->map(function ($value, $index) {
        //     $returning_data = collect();
        //     collect($value)->each(function ($permission, $key) use ($returning_data, $index) {
        //         $returning_data->push([
        //             'id' => \Illuminate\Support\Str::uuid(),
        //             'name' => $permission,
        //             'guard_name' => 'web',
        //             'type' => $index,
        //         ]);
        //     });

        //     return $returning_data;
        // });

        // $permissions->flatten(1)->each(fn ($permission) => Permission::insert($permission));

        $list_of_permissions = config('permission.list');
        $permissions = collect();

        collect($list_of_permissions)->each(function ($features, $type) use ($permissions) {
            collect($features)->each(function ($value, $group_name) use ($permissions, $type) {
                if (is_array($value)) {
                    collect($value)->each(function ($label_name, $name_of_feature) use ($permissions, $type, $group_name) {
                        $permissions->push([
                            'id' => \Illuminate\Support\Str::uuid(),
                            'name' => $name_of_feature,
                            'guard_name' => 'web',
                            'type' => $type,
                            'group_name' => $group_name,
                            'feature_type' => $label_name
                        ]);
                    });
                } else {
                    $permissions->push([
                        'id' => \Illuminate\Support\Str::uuid(),
                        'name' => $value,
                        'guard_name' => 'web',
                        'type' => $type,
                        'group_name' => NULL,
                        'feature_type' => NULL
                    ]);
                }
            });

            return $permissions;
        });

        Permission::insert($permissions->toArray());
    }
}
