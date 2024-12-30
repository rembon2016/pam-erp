<?php

declare(strict_types=1);

namespace App\Service\Finance\GeneralWise;

use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Benchmark;
use Illuminate\Support\Facades\Http;

final class GeneralWiseService
{
    public function getVessels(): object
    {
        $response = $this->processApiRequest('api/shippinginstruction/vessel');
        return $response;
    }

    public function getOrigins(): object
    {
        $response = $this->processApiRequest('api/shippinginstruction/origin/name');
        return $response;
    }

    public function getVoyages(): object
    {
        $response = $this->processApiRequest('api/shippinginstruction/voyage');
        return $response;
    }

    private function processApiRequest(string $url)
    {
        // Temporary disable
        // $base_url = (request()->query('type') == "seaair" || request()->query('type') == "crossair")
        //     ? config('pds-operation.api.origin')
        //     : config('pds-operation.api.dxb');

        $base_url = config('pds-operation.api.origin');

        $api_url = "{$base_url}/{$url}";
        $api_response = Http::get($api_url, [
            'shipment_by' => request()->query('shipment_by') ?? "",
        ]);

        if ($api_response->successful()) {
            $response_data = $api_response->json();
            return ObjectResponse::success(
                message: "Successfully Fetch Data from API!",
                statusCode: Response::HTTP_OK,
                data: $response_data['data']
            );
        }else{
            return ObjectResponse::error(
                message: "Failed to Fetch Data from API!",
                statusCode: Response::HTTP_INTERNAL_SERVER_ERROR,
            );
        }
    }
}
