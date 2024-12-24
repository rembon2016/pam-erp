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

    public function getAgentContracts($filters = []): Collection
    {
        return AgentContract::when(!empty($filters['contract_no']), function ($query) use ($filters) {
            return $query->where('contract_no', $filters['contract_no']);
        })->orderBy('contract_no', 'DESC')->get();
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
        $includedServiceId = collect($serviceData)->pluck('service_id')->filter(fn ($item) => $item != null || $item != '')->values();
        if ($includedServiceId->count() > 0) $agentContract->serviceContract()->whereNotIn('id', $includedServiceId)->delete();

        foreach ($serviceData as $serviceKey => $service) {
            $serviceContractData = [
                'service_type_id' => $service['service'],
                'por_country_id' => isset($service['por_country']) ? $service['por_country'] : null,
                'por_port_id' => isset($service['por_port']) ? $service['por_port'] : null,
                'fdc_country_id' => isset($service['fdc_country']) ? $service['fdc_country'] : null,
                'fdc_port_id' => isset($service['fdc_port']) ? $service['fdc_port'] : null,
                'tos' => isset($service['tos']) ? $service['tos'] : null,
                'tos_name' => isset($service['tos_name']) ? $service['tos_name'] : null,
                'transit_via' => isset($service['transit']) ? $service['transit'] : null,
                'manual_input_transit' => isset($service['manual_input_transit']) ? $service['manual_input_transit'] : null,
                'carrier_id' => isset($service['carrier_id']) ? $service['carrier_id'] : null,
                'carrier_name' => isset($service['carrier_name']) ? $service['carrier_name'] : null,
                'party' => isset($service['party']) ? $service['party'] : null,
                'notes' => isset($service['service_note']) ? $service['service_note'] : null,
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
    }

    /**
     * @param $arrayOfCharges
     * @param $serviceContract
     * @param $agentContract
     * @return void
     */
    private function syncServiceContractChargeData($arrayOfCharges, $serviceContract, $agentContract): void
    {
        $includedChargeId = collect($arrayOfCharges)->pluck('contract_agent_charge_id')->filter(fn ($item) => $item != null || $item != '')->values();
        if ($includedChargeId->count() > 0) $serviceContract->contractAgentCharge()->whereNotIn('id', $includedChargeId)->delete();

        foreach ($arrayOfCharges as $charge) {
            $chargeData = [
                'agent_contract_service_id' => $serviceContract->id,
                'agent_contract_id' => $agentContract->id,
                'charge_id' => isset($charge['charge_id']) ? $charge['charge_id'] : null,
                'charge_name' => isset($charge['charge_name']) ? $charge['charge_name'] : null,
                'currency_id' => isset($charge['currency']) ? $charge['currency'] : null,
                'unit_id' => isset($charge['unit_id']) ? $charge['unit_id'] : null,
                'amount_per_unit' => isset($charge['amount_per_unit']) ? $charge['amount_per_unit'] : null,
                'minimum_amount' => isset($charge['minimum_amount']) ? $charge['minimum_amount'] : null,
                'por' => isset($charge['por']) ? $charge['por'] : null,
                'fdc' => isset($charge['fdc']) ? $charge['fdc'] : null,
                'pp_cc' => isset($charge['pp_cc']) ? $charge['pp_cc'] : null,
                'routed' => isset($charge['routed']) ? $charge['routed'] : null,
                'imco' => isset($charge['imco']) ? $charge['imco'] : null,
                'commodity' => isset($charge['commodity']) ? $charge['commodity'] : null,
                'crn' => isset($charge['c_r_n']) ? $charge['c_r_n'] : null,
                'loading_bay' => isset($charge['loading_bay']) ? $charge['loading_bay'] : null,
                'valid_from_date' => isset($charge['valid_from_date']) ? $charge['valid_from_date'] : null,
                'valid_to_date' => isset($charge['valid_to_date']) ? $charge['valid_to_date'] : null,

                'from_0_to_44' => isset($charge['from_0_to_44']) ? $charge['from_0_to_44'] : 0,
                'from_45_to_99' => isset($charge['from_45_to_99']) ? $charge['from_45_to_99'] : 0,
                'from_100_to_299' => isset($charge['from_100_to_299']) ? $charge['from_100_to_299'] : 0,
                'from_300_to_499' => isset($charge['from_300_to_499']) ? $charge['from_300_to_499'] : 0,
                'from_500_to_999' => isset($charge['from_500_to_999']) ? $charge['from_500_to_999'] : 0,
                'from_1000_to_infinity' => isset($charge['from_1000_to_infinity']) ? $charge['from_1000_to_infinity'] : 0,

                'twenty_feet' => isset($charge['20_feet']) ? $charge['20_feet'] : 0,
                'twenty_feet_goh' => isset($charge['20_feet_goh']) ? $charge['20_feet_goh'] : 0,

                'forty_feet' => isset($charge['40_feet']) ? $charge['40_feet'] : 0,
                'forty_feet_goh' => isset($charge['40_feet_goh']) ? $charge['40_feet_goh'] : 0,
                'forty_feet_hc' => isset($charge['40_feet_hc']) ? $charge['40_feet_hc'] : 0,
                'forty_feet_hc_goh' => isset($charge['40_feet_hc_goh']) ? $charge['40_feet_hc_goh'] : 0,

                'forty_five_feet_goh' => isset($charge['45_feet_goh']) ? $charge['45_feet_goh'] : 0,
                'forty_five_feet' => isset($charge['45_feet']) ? $charge['45_feet'] : 0,

                'manual_input_routed' => isset($charge['manual_input_routed']) ? $charge['manual_input_routed'] : null,
                'via_port' => isset($charge['via_port']) ? $charge['via_port'] : null,
            ];

            if (!empty($charge['contract_agent_charge_id'])) {
                $serviceCharge = $serviceContract
                    ->contractAgentCharge()
                    ->where('id', $charge['contract_agent_charge_id'])
                    ->firstOrFail();

                $serviceCharge->update($chargeData);
                $this->syncServiceContractChargeDetailData($charge['charge_detail_data'], $serviceContract, $agentContract, $serviceCharge);
            } else {
                $serviceCharge = $serviceContract->contractAgentCharge()->create($chargeData);
                $this->syncServiceContractChargeDetailData($charge['charge_detail_data'], $serviceContract, $agentContract, $serviceCharge);
            }
        }
    }

    private function syncServiceContractChargeDetailData($arrayOfDetails, $serviceContract, $agentContract, $serviceCharge): void
    {
        $includedDetailId = collect($arrayOfDetails)->pluck('contract_agent_charge_detail_id')->filter(fn ($item) => $item != null || $item != '')->values();
        if ($includedDetailId->count() > 0) $serviceCharge->chargeDetails()->whereNotIn('id', $includedDetailId)->delete();

        foreach ($arrayOfDetails as $detail) {
            $chargeDetailData = [
                'agent_contract_id' => $agentContract->id,
                'agent_contract_service_id' => $serviceContract->id,
                'from' => isset($detail['from']) ? $detail['from'] : null,
                'to' => isset($detail['to']) ? $detail['to'] : null,
                'value' => isset($detail['value']) ? $detail['value'] : null,
            ];

            if (!empty($detail['contract_agent_charge_detail_id'])) {
                $serviceCharge
                    ->chargeDetails()
                    ->where('id', $detail['contract_agent_charge_detail_id'])
                    ->update($chargeDetailData);
            } else {
                $serviceCharge->chargeDetails()->create($chargeDetailData);
            }
        }
    }
}
