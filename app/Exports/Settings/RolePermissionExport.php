<?php

namespace App\Exports\Settings;

use App\Models\Role;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class RolePermissionExport implements FromCollection, WithHeadings, WithMapping
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return Role::latest()->get();
    }

    public function map($item): array
    {
        return [
            $item->name,
            $item->guard_name,
        ];
    }

    public function headings(): array
    {
        return [
            'Role Name',
            'Guard Name',
        ];
    }
}
