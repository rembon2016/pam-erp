<?php

namespace App\Exports\Settings;

use App\Models\User;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;

class UserExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return User::with('roles')->latest()->get();
    }

    public function map($item): array
    {
        return [
            $item->name,
            $item->guard_name,
            $item->roles->pluck('name')->join(', ')
        ];
    }

    public function headings() : array
    {
        return [
            'Name',
            'Email',
            'Role'
        ];
    }
}
