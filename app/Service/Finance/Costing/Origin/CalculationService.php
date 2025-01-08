<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing\Origin;

use App\Models\Finance\AgentContract;
use App\Models\Finance\AgentContractCharge;
use App\Models\Finance\AgentContractChargeDetail;
use App\Models\Finance\AgentContractService;
use App\Models\Finance\Currency;
use App\Models\Operation\Dxb\LoadingPlan;
use App\Models\Operation\Origin\LoadingPlan as LoadingPlanOrigin;
use App\Models\Operation\Origin\LoadingReportBL;
use App\Models\Operation\Origin\LoadingReportDetail;
use App\Models\Operation\Origin\ShippingInstruction;
use Illuminate\Http\Response;

final class CalculationService
{
    public function getChargeByBl($id, $bl_number, $type)
    {
        $bl = LoadingReportBl::where('bl_number', $bl_number)->first();
        $container = LoadingReportDetail::where('loading_report_bl_id', $bl->loading_report_bl_id)->get();
        $contract = AgentContract::where('customer_id', $id)->first();

        if ($contract == null) {
            $charge_bl = null;
            $result = [
                'status' => false,
                'data' => $charge_bl,
            ];

            return $result;

        }
        $ship = ShippingInstruction::where('loading_report_bl_id', $bl->loading_report_bl_id)->first();

        $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) use ($type, $ship) {
            if ($type == 'or') {
                $query->whereIn('service_code', [$ship->loading_type, 'LAND']);
            } elseif ($type == 'all') {
                $query->whereIn('service_code', ['LCL', 'FCL', 'LAND']);
            } else {
                $query->where('service_code', $type);
            }
        })->where('por_country_id', $ship->origin->country_id)->where('por_port_id', $ship->port_of_loading);
        if ($service->exists()) {
            $service = $service->first();
        } else {
            $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) use ($type, $ship) {
                if ($type == 'or') {
                    $query->whereIn('service_code', [$ship->loading_type, 'LAND']);
                } elseif ($type == 'all') {
                    $query->whereIn('service_code', ['LCL', 'FCL', 'LAND']);
                } else {
                    $query->where('service_code', $type);
                }
            })->first();
        }
        if ($service == null) {
            $charge_bl = null;
            $result = [
                'status' => false,
                'data' => $charge_bl,
            ];

            return $result;
        }

        $charge = AgentContractCharge::with(['charge', 'unit'])->where('agent_contract_service_id', $service->id)->get();
        $charge_bl = [];
        //return response()->json($charge);
        foreach ($charge as $row) {
            $shipping = ShippingInstruction::where('loading_report_bl_id', $bl->loading_report_bl_id)->get();
            if ($row->unit->unit_name == 'KG') {
                $chw = $shipping->sum(fn ($r) => $r->order->chw);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $row->amount_per_unit * $chw;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $chw;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            } elseif ($row->unit->unit_name == 'SHIPMENT') {
                $count = count($shipping);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {

                    $amount_in_usd = $row->amount_per_unit * $count;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $count;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            } elseif ($row->unit->unit_name == 'CONTAINER') {
                $currency = Currency::find($row->currency_id);
                $jum = 0;

                foreach ($container as $x) {

                    if (substr($x->container_type, 0, 5) == '20 FT') {
                        if (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->twenty_feet_goh;
                        } else {
                            $jum += $row->twenty_feet;
                        }
                    } elseif (substr($x->container_type, 0, 5) == '40 FT') {

                        if (strpos($x->container_type, 'HC GOH') !== false) {
                            $jum += $row->forty_feet_hc_goh;
                        } elseif (strpos($x->container_type, 'HC') !== false) {
                            $jum += $row->forty_feet_hc;
                        } elseif (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->forty_feet_goh;
                        } else {
                            $jum += $row->forty_feet;
                        }
                    } elseif (substr($x->container_type, 0, 5) == '45 FT') {
                        if (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->forty_five_feet_goh;
                        } else {
                            $jum += $row->forty_five_feet;
                        }
                    }
                }

                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $jum;
                    $amount_in_aed = $jum * 3.67;
                } else {
                    $amount_in_aed = $jum;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $jum;
            }
            $charge_bl[] = [
                'charge_id' => $row->charge_id,
                'charge_name' => $row->charge->charge_name,
                'charge_code' => $row->charge->charge_code,
                'currency_id' => $row->currency_id,
                'rate' => $rate,
                'amount_in_usd' => $amount_in_usd,
                'amount_in_aed' => $amount_in_aed,
                'status' => 'Debit',
            ];
        }

        if (! empty($charge_bl)) {
            $result = [
                'status' => true,
                'data' => $charge_bl,
            ];

            return $result;
        } else {
            $charge_bl = null;
            $result = [
                'status' => false,
                'data' => $charge_bl,
            ];

            return $result;
        }
    }

    public function getChargeByMawb($id, $mawb_number, $type, $mode)
    {
        if ($mode == 'SEAAIR') {
            $lp = LoadingPlan::where('mawb_number', $mawb_number)->first();
        } else {
            $lp = LoadingPlanOrigin::where('mawb_number', $mawb_number)->first();
        }

        $contract = AgentContract::where('customer_id', $id)->first();
        if ($contract == null) {

            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }
        if ($mode == 'SEAAIR') {
            $ship = ShippingInstruction::where('loading_plan_dxb', $lp->plan_id)->first();
        } else {
            $ship = ShippingInstruction::where('loading_id', $lp->plan_id)->first();
        }

        $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) use ($type) {
            if ($type != 'All') {
                $query->where('service_code', 'AIR');
            }
        })->where('por_country_id', $ship->origin->country_id)->where('por_port_id', $ship->port_of_loading);
        if ($type != 'All') {
            $service = $service->where('carrier_id', $lp->carrier_id);
        }
        if ($service->exists()) {
            $service = $service->first();
        } else {
            $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) use ($type) {
                if ($type != 'All') {
                    $query->where('service_code', 'AIR');
                }
            });
            // if($type != "All"){

            //    // $service = $service->where('carrier_id',$lp->carrier_id);
            // }
            $service = $service->first();

        }
        if ($service == null) {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }

        $charge = AgentContractCharge::with(['charge', 'unit'])->where('agent_contract_service_id', $service->id)->get();
        $charge_mawb = [];
        foreach ($charge as $row) {
            if ($mode == 'SEAAIR') {
                $shipping = ShippingInstruction::where('loading_plan_dxb', $lp->plan_id)->get();
            } else {
                $shipping = ShippingInstruction::where('loading_id', $lp->plan_id)->get();
            }
            if ($row->unit->unit_name == 'KG') {
                // $chw = 0.0;
                // foreach($shipping as $r){
                //     $chw = $chw + $r->order->chw;
                // }
                $chw = $shipping->sum(fn ($r) => $r->order->chw);
                $currency = Currency::find($row->currency_id);
                $detail = AgentContractChargeDetail::where('agent_contract_charge_id', $row->id)->where('from', '<=', $chw)->where('to', '>=', $chw)->first();
                $jum = $detail->value ?? 0;
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $jum;
                    $amount_in_aed = $jum * 3.67;
                } else {
                    $amount_in_aed = $jum;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $jum;
            } elseif ($row->unit->unit_name == 'SHIPMENT') {
                $count = count($shipping);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $row->amount_per_unit * $count;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $count;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            }
            $charge_mawb[] = [
                'charge_id' => $row->charge_id,
                'charge_name' => $row->charge->charge_name,
                'charge_code' => $row->charge->charge_code,
                'currency_id' => $row->currency_id,
                'rate' => $rate,
                'amount_in_usd' => $amount_in_usd,
                'amount_in_aed' => $amount_in_aed,
                'status' => 'Debit',
            ];
        }

        if (! empty($charge_mawb)) {
            $result = [
                'status' => true,
                'data' => $charge_mawb,
            ];

            return $result;
        } else {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }
    }

    public function getChargeImportByLp($id, $loading_id)
    {
        $bl = LoadingReportBl::where('loading_id', $loading_id)->first();
        $container = LoadingReportDetail::where('bl_id', $loading_id)->get();
        $contract = AgentContract::where('customer_id', $id)->first();
        if ($contract == null) {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }
        $ship = ShippingInstruction::where('loading_id', $loading_id)->first();

        $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) {

            $query->whereIn('service_code', ['LCL', 'FCL', 'LAND']);

        })->where('por_country_id', $ship->origin->country_id)->where('por_port_id', $ship->port_of_loading);
        if ($service->exists()) {
            $service = $service->first();
        } else {
            $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) {

                $query->whereIn('service_code', ['LCL', 'FCL', 'LAND']);

            })->first();
        }
        if ($service == null) {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }

        $charge = AgentContractCharge::with(['charge', 'unit'])->where('agent_contract_service_id', $service->id)->get();
        $charge_bl = [];
        //return response()->json($charge);
        foreach ($charge as $row) {
            $shipping = ShippingInstruction::where('loading_report_bl_id', $bl->loading_report_bl_id)->get();
            if ($row->unit->unit_name == 'KG') {
                $chw = $shipping->sum(fn ($r) => $r->order->chw);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $row->amount_per_unit * $chw;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $chw;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            } elseif ($row->unit->unit_name == 'SHIPMENT') {
                $count = count($shipping);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {

                    $amount_in_usd = $row->amount_per_unit * $count;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $count;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            } elseif ($row->unit->unit_name == 'CONTAINER') {
                $currency = Currency::find($row->currency_id);
                $jum = 0;

                foreach ($container as $x) {

                    if (substr($x->container_type, 0, 5) == '20 FT') {
                        if (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->twenty_feet_goh;
                        } else {
                            $jum += $row->twenty_feet;
                        }
                    } elseif (substr($x->container_type, 0, 5) == '40 FT') {

                        if (strpos($x->container_type, 'HC GOH') !== false) {
                            $jum += $row->forty_feet_hc_goh;
                        } elseif (strpos($x->container_type, 'HC') !== false) {
                            $jum += $row->forty_feet_hc;
                        } elseif (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->forty_feet_goh;
                        } else {
                            $jum += $row->forty_feet;
                        }
                    } elseif (substr($x->container_type, 0, 5) == '45 FT') {
                        if (strpos($x->container_type, 'GOH') !== false) {
                            $jum += $row->forty_five_feet_goh;
                        } else {
                            $jum += $row->forty_five_feet;
                        }
                    }
                }

                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $jum;
                    $amount_in_aed = $jum * 3.67;
                } else {
                    $amount_in_aed = $jum;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $jum;
            }
            $charge_bl[] = [
                'charge_id' => $row->charge_id,
                'charge_name' => $row->charge->charge_name,
                'charge_code' => $row->charge->charge_code,
                'currency_id' => $row->currency_id,
                'rate' => $rate,
                'amount_in_usd' => $amount_in_usd,
                'amount_in_aed' => $amount_in_aed,
                'status' => 'Debit',
            ];
        }

        if (! empty($charge_bl)) {
            $result = [
                'status' => true,
                'data' => $charge_bl,
            ];

            return $result;
        } else {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }
    }

    public function getChargeExportByLp($id, $loading_id, $mode)
    {
        if ($mode == 'SEAAIR') {
            $shipment = ShippingInstruction::where('status', '!=', 3)
                ->where('loading_id', $loading_id)
                ->get();

            $loading_plan_dxb = $shipment->pluck('loading_plan_dxb')->toArray();
        }

        $contract = AgentContract::where('customer_id', $id)->first();

        if ($contract == null) {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }
        if ($mode == 'SEAAIR') {
            $ship = ShippingInstruction::whereIn('loading_plan_dxb', $loading_plan_dxb)->first();
        } else {
            $ship = ShippingInstruction::where('loading_id', $loading_id)->first();
        }

        $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) {})->where('por_country_id', $ship->origin->country_id)->where('por_port_id', $ship->port_of_loading);
        if ($service->exists()) {
            $service = $service->first();
        } else {
            $service = AgentContractService::where('agent_contract_id', $contract->id)->whereHas('serviceType', function ($query) {})->first();
        }

        if ($service == null) {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }

        $charge = AgentContractCharge::with(['charge', 'unit'])->where('agent_contract_service_id', $service->id)->get();
        $charge_mawb = [];
        foreach ($charge as $row) {
            if ($mode == 'SEAAIR') {
                $shipping = ShippingInstruction::whereIn('loading_plan_dxb', $loading_plan_dxb)->get();
            } else {
                $shipping = ShippingInstruction::where('loading_id', $loading_id)->get();
            }

            if ($row->unit->unit_name == 'KG') {
                // $chw = 0.0;
                // foreach($shipping as $r){
                //     $chw = $chw + $r->order->chw;
                // }
                $chw = $shipping->sum(fn ($r) => $r->order->chw);
                $currency = Currency::find($row->currency_id);
                $detail = AgentContractChargeDetail::where('agent_contract_charge_id', $row->id)->where('from', '<=', $chw)->where('to', '>=', $chw)->first();
                $jum = $detail->value ?? 0;
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $jum;
                    $amount_in_aed = $jum * 3.67;
                } else {
                    $amount_in_aed = $jum;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $jum;
            } elseif ($row->unit->unit_name == 'SHIPMENT') {
                $count = count($shipping);
                $currency = Currency::find($row->currency_id);
                if ($currency->currency_code == 'USD') {
                    $amount_in_usd = $row->amount_per_unit * $count;
                    $amount_in_aed = $amount_in_usd * 3.67;
                } else {
                    $amount_in_aed = $row->amount_per_unit * $count;
                    $amount_in_usd = $amount_in_aed / 3.67;
                }
                $rate = $row->amount_per_unit;
            }

            $charge_mawb[] = [
                'charge_id' => $row->charge_id,
                'charge_name' => $row->charge->charge_name,
                'charge_code' => $row->charge->charge_code,
                'currency_id' => $row->currency_id,
                'rate' => $rate,
                'amount_in_usd' => $amount_in_usd,
                'amount_in_aed' => $amount_in_aed,
                'status' => 'Debit',
            ];
        }

        if (! empty($charge_mawb)) {
            $result = [
                'status' => true,
                'data' => $charge_mawb,
            ];

            return $result;
        } else {
            $result = [
                'status' => false,
                'data' => null,
            ];

            return $result;
        }

    }
}
