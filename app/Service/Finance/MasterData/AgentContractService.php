<?php

declare(strict_types=1);

namespace App\Service\Finance\MasterData;

use App\Traits\HandleUploadedFile;
use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Facades\DB;
use App\Models\Finance\AgentContract;
use Illuminate\Database\Eloquent\Collection;

final class AgentContractService
{
    use HandleUploadedFile;

    public function getAgentContracts(): Collection
    {
        return AgentContract::orderBy('contract_no', 'DESC')->get();
    }

    public function getAgentContractById(string $id): object
    {
        $data = AgentContract::where('id', $id)->first();
        return !is_null($data)
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Agent Contract']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Agent Contract']), Response::HTTP_NOT_FOUND);
    }

    public function createAgentContract(array $dto): object
    {
        DB::beginTransaction();
        try {
            $service_data = $dto['service_data'];
            unset($dto['service_data']);

            if (!empty($dto['contract_file'])) $dto['contract_file'] = $this->uploadFile(
                file: $dto['contract_file'],
                folderPrefix: AgentContract::FOLDER_NAME
            );

            $createdAgentContract = AgentContract::create($dto);
            $this->upsertAgentContractService($createdAgentContract, $service_data);

            DB::commit();
            return ObjectResponse::success(
                __('crud.created', ['name' => 'Agent Contract']),
                Response::HTTP_CREATED,
                $createdAgentContract
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            dd($th);
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Agent Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function updateAgentContract(string $id, array $dto): object
    {
        $getAgentContractResponse = $this->getAgentContractById($id);
        if (!$getAgentContractResponse->success) return $getAgentContractResponse;

        DB::beginTransaction();
        try {
            $service_data = $dto['service_data'];
            unset($dto['service_data']);

            if (!empty($dto['contract_file'])) {
                if (!is_null($getAgentContractResponse->data->contract_file)) {
                    $dto['contract_file'] = $this->syncUploadFile(
                        file: $dto['contract_file'],
                        old_file_name: $getAgentContractResponse->data->contract_file,
                        folderPrefix: AgentContract::FOLDER_NAME
                    );
                } else {
                    $dto['contract_file'] = $this->uploadFile(
                        file: $dto['contract_file'],
                        folderPrefix: AgentContract::FOLDER_NAME
                    );
                }
            } else {
                $dto['contract_file'] = $getAgentContractResponse->data->contract_file;
            }

            $getAgentContractResponse->data->update($dto);
            $this->upsertAgentContractService($getAgentContractResponse->data, $service_data);

            DB::commit();
            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Agent Contract']),
                Response::HTTP_OK,
                $getAgentContractResponse->data
            );
        } catch (\Throwable $th) {
            DB::rollback();
            dd($th);
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Agent Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }

    public function deleteAgentContract(string $id): object
    {
        $getAgentContractResponse = $this->getAgentContractById($id);
        if (!$getAgentContractResponse->success) return $getAgentContractResponse;

        try {
            $getAgentContractResponse->data->delete();

            return ObjectResponse::success(
                __('crud.deleted', ['name' => 'Agent Contract']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Agent Contract']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }


    public function upsertAgentContractService($agentContract, $serviceData): void
    {
        foreach ($serviceData as $serviceKey => $service) {
            $serviceContractData = [
                'service_type_id' => $service['service'],
                'por_country_id' => $service['por_country'],
                'por_port_id' => $service['por_port'],
                'fdc_country_id' => $service['fdc_country'],
                'fdc_port_id' => $service['fdc_port'],
                'tos' => $service['tos'],
                'tos_name' => $service['tos_name'],
                'transit_via' => $service['transit'] ?? null,
                'manual_input_transit' => $service['manual_input_transit'] ?? null,
                'carrier_id' => $service['carrier_id'],
                'carrier_name' => $service['carrier_name'],
                'party' => $service['party'],
                'notes' => $service['service_note'],
            ];

            if (!empty($service['service_id'])) {
                $serviceContract = $agentContract
                    ->serviceContract()
                    ->where('id', $service['service_id'])
                    ->firstOrFail();

                $serviceContract->update($serviceContractData);

                $this->syncServiceContractChargeData($serviceData[$serviceKey]['charge_data'], $serviceContract, $agentContract);
            } else {
                $serviceContract = $agentContract->serviceContract()->create($serviceContractData);
                $this->syncServiceContractChargeData($serviceData[$serviceKey]['charge_data'], $serviceContract, $agentContract);
            }
        }

        // return (object) [
        //     'success' => true,
        //     'data' => [
        //         'contract_agent' => $agentContract,
        //     ],
        // ];
    }

    /**
     * @param $arrayOfCharges
     * @param $serviceContract
     * @param $agentContract
     * @return object
     */
    private function syncServiceContractChargeData($arrayOfCharges, $serviceContract, $agentContract): void
    {
        foreach ($arrayOfCharges as $charge) {
            if (!isset($charge['amount_per_unit'])) $charge['amount_per_unit'] = null;
            if (!isset($charge['minimum_amount'])) $charge['minimum_amount'] = null;
            if (!isset($charge['via_port'])) $charge['via_port'] = null;

            $chargeData = [
                'agent_contract_service_id' => $serviceContract->id,
                'agent_contract_id' => $agentContract->id,
                'charge_id' => $charge['charge_id'],
                'charge_name' => $charge['charge_name'],
                'currency_id' => $charge['currency'],
                'unit_id' => $charge['unit_id'],
                'amount_per_unit' => $charge['amount_per_unit'],
                'minimum_amount' => $charge['minimum_amount'],
                'por' => $charge['por'],
                'fdc' => $charge['fdc'],
                'pp_cc' => $charge['pp_cc'],
                'routed' => $charge['routed'] ?? null,
                'imco' => $charge['imco'],
                'commodity' => $charge['commodity'],
                'crn' => $charge['c_r_n'],
                'loading_bay' => $charge['loading_bay'],
                'valid_from_date' => $charge['valid_from_date'],
                'valid_to_date' => $charge['valid_to_date'],

                'from_0_to_44' => $charge['from_0_to_44'] ?? 0,
                'from_45_to_99' => $charge['from_45_to_99'] ?? 0,
                'from_100_to_299' => $charge['from_100_to_299'] ?? 0,
                'from_300_to_499' => $charge['from_300_to_499'] ?? 0,
                'from_500_to_999' => $charge['from_500_to_999'] ?? 0,
                'from_1000_to_infinity' => $charge['from_1000_to_infinity'] ?? 0,

                'twenty_feet' => $charge['20_feet'] ?? 0,
                'forty_feet' => $charge['40_feet'] ?? 0,
                'forty_five_feet_hc' => $charge['45_feet_hc'] ?? 0,
                'forty_five_feet' => $charge['45_feet'] ?? 0,

                'manual_input_routed' => $charge['manual_input_routed'] ?? null,
                'via_port' => $charge['via_port'],
            ];

            if (!empty($charge['contract_agent_charge_id'])) {
                $serviceContract
                    ->contractAgentCharge()
                    ->where('id', $charge['contract_agent_charge_id'])
                    ->update($chargeData);
            } else {
                $serviceContract->contractAgentCharge()->create($chargeData);
            }
        }
    }
}
