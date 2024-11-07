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
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();
        $list_of_permissions = collect(config('permission.list'));
        $permissions = $list_of_permissions->map(function ($value, $index) {
            $returning_data = collect();
            collect($value)->each(function ($permission, $key) use ($returning_data, $index) {
                $returning_data->push([
                    'id' => \Illuminate\Support\Str::uuid(),
                    'name' => $permission,
                    'guard_name' => 'web',
                    'type' => $index,
                ]);
            });

            return $returning_data;
        });

        $permissions->flatten(1)->each(fn ($permission) => Permission::insert($permission));
    }
}
