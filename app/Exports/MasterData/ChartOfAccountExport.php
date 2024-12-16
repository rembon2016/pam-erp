<?php

namespace App\Exports\MasterData;

use App\Models\Finance\ChartOfAccount;
use Maatwebsite\Excel\Concerns\FromCollection;

class ChartOfAccountExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $chartOfAccounts = ChartOfAccount::orderBy('account_code', 'asc')->get();

        return $chartOfAccounts;
    }

    public function map($item): array
    {
        return [
            $item->accountGroup->code . ': ' . $item->accountGroup->name,
            $item->subAccountGroup->code . ': ' . $item->subAccountGroup->name,
            $item->account_number,
            $item->account_name,
            $item?->subledger_code ?? '-',
            $item?->subledger_name ?? '-',
            $item->is_cashflow ? 'Yes' : 'No',
            $item?->cashflow_type ?? '-',
            $item->account_position,
        ];
    }

    public function headings(): array
    {
        return [
            'GL Head Name',
            'Sub Account Group',
            'Account Number',
            'Account Name',
            'Subledger Code',
            'Subledger Name',
            'Is Cashflow?',
            'Cashflow Type',
            'Account Position',
        ];
    }
}
