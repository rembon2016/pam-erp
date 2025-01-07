<?php

namespace App\Exports\MasterData;

use App\Service\Finance\MasterData\AgentContractService;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class AgentContractExport implements FromCollection, WithHeadings, WithMapping
{
    protected $agentContractService;

    public function __construct()
    {
        $this->agentContractService = new AgentContractService;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return $this->agentContractService->getAgentContracts();
    }

    public function map($item): array
    {
        return [
            $item->contract_no,
            $item->customer?->customer_code,
            $item->customer?->customer_name,
            $item->contract_date?->format('d/m/Y'),
            $item->contract_start?->format('d/m/Y'),
            $item->contract_end?->format('d/m/Y'),
            $item->contract_description,
        ];
    }

    public function headings(): array
    {
        return [
            'Contract No',
            'Customer Code',
            'Customer Name',
            'Contract Date',
            'Contract Start Date',
            'Contract End Date',
            'Description',
        ];
    }
}
