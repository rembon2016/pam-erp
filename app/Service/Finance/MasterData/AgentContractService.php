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
            ? ObjectResponse::success(__('crud.fetched', ['name' => 'Payment Method']), Response::HTTP_OK, $data)
            : ObjectResponse::error(__('crud.not_found', ['name' => 'Payment Method']), Response::HTTP_NOT_FOUND);
    }

    public function createAgentContract(array $dto): object
    {
        DB::beginTransaction();
        try {
            if (!empty($dto['contract_file'])) $dto['contract_file'] = $this->uploadFile(
                file: $dto['contract_file'],
                folderPrefix: AgentContract::FOLDER_NAME
            );
            $createdAgentContract = AgentContract::create($dto);

            DB::commit();
            return ObjectResponse::success(
                __('crud.created', ['name' => 'Payment Method']),
                Response::HTTP_CREATED,
                $createdAgentContract
            );
        } catch (\Throwable $th) {
            DB::rollBack();
            return ObjectResponse::error(
                __('crud.error_create', ['name' => 'Payment Method']),
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

            DB::commit();
            return ObjectResponse::success(
                __('crud.updated', ['name' => 'Payment Method']),
                Response::HTTP_OK,
                $getAgentContractResponse->data
            );
        } catch (\Throwable $th) {
            DB::rollback();
            return ObjectResponse::error(
                __('crud.error_update', ['name' => 'Payment Method']),
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
                __('crud.deleted', ['name' => 'Payment Method']),
                Response::HTTP_OK,
            );
        } catch (\Throwable $th) {
            return ObjectResponse::error(
                __('crud.error_delete', ['name' => 'Payment Method']),
                Response::HTTP_INTERNAL_SERVER_ERROR,
                $th->getTrace()
            );
        }
    }
}
