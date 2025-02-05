<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing;

use App\Models\Finance\Charge;
use App\Models\Finance\Costing;
use App\Models\Finance\CostingDetail;
use App\Models\Finance\CostingHead;
use App\Models\Finance\CostingSpecial;
use App\Models\Finance\CostingVendorAgent;
use App\Models\Finance\CostingVendorPort;
use App\Models\Finance\CostingVendorTrucking;
use Illuminate\Http\Request;

final class CostingService
{
    public function createCosting(Request $request)
    {
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'status' => $request->status_costing,
            'type' => $request->type_costing,
            'notes' => $request->notes,
            'created_by' => auth()->user()->email,
        ];
        $costing = Costing::create($data_costing);

        return $costing;
    }

    public function updateCosting(Request $request, $id)
    {
        $data_costing = [
            'job_order_id' => $request->job_order_id,
            'notes' => $request->notes,
            'status' => $request->status_costing,
            'updated_by' => auth()->user()->email,
        ];
        $costing = Costing::find($id)->update($data_costing);

        return $costing;
    }

    public function createCostingTruck(Request $request, $id)
    {
        if (! empty($request->vendor_truck_id)) {
            foreach ($request->vendor_truck_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $vendor_name = $request->vendor_truck_name[$k];
                $container_no = $request->container_number[$k];
                $bl_number = $request->bl_number[$k];
                $data_vendor_trucking = [
                    'costing_id' => $id,
                    'container_no' => $container_no,
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'value' => $bl_number,
                    'created_by' => auth()->user()->email,
                ];
                CostingVendorTrucking::create($data_vendor_trucking);
            }
        }
    }

    public function updateCostingTruck(Request $request, $id)
    {
        if (! empty($request->vendor_truck_id)) {
            foreach ($request->vendor_truck_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $costing_truck_id = $request->costing_vendor_truck_id[$k] ?? null;
                $vendor_name = $request->vendor_truck_name[$k];
                $container_no = $request->container_number[$k];
                $data_vendor_trucking = [
                    'costing_id' => $id,
                    'container_no' => $container_no,
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                ];
                if ($costing_truck_id != null) {
                    $data_vendor_trucking['updated_by'] = auth()->user()->email;
                    CostingVendorTrucking::find($costing_truck_id)->update($data_vendor_trucking);
                } else {
                    $data_vendor_trucking['created_by'] = auth()->user()->email;
                    CostingVendorTrucking::create($data_vendor_trucking);
                }
            }
        }
    }

    public function createCostingPort(Request $request, $id)
    {
        if (! empty($request->vendor_port_id)) {
            $data_port = [
                'costing_id' => $id,
                'port_id' => $request->port_id,
                'port_code' => $request->port_code,
                'vendor_id' => $request->vendor_port_id,
                'vendor_name' => $request->vendor_port_name,
                'created_by' => auth()->user()->email,
            ];
            CostingVendorPort::create($data_port);
        }
    }

    public function updateCostingPort(Request $request, $id)
    {
        if (! empty($request->vendor_port_id)) {
            $costing_vendor_port_id = $request->costing_vendor_port_id ?? null;
            $data_port = [
                'costing_id' => $id,
                'port_id' => $request->port_id,
                'port_code' => $request->port_code,
                'vendor_id' => $request->vendor_port_id,
                'vendor_name' => $request->vendor_port_name,
            ];
            if ($costing_vendor_port_id != null) {
                $data_port['updated_by'] = auth()->user()->email;
                CostingVendorPort::find($costing_vendor_port_id)->update($data_port);
            } else {
                $data_port['created_by'] = auth()->user()->email;
                CostingVendorPort::create($data_port);
            }

        }
    }

    public function createCostingAgent(Request $request, $id)
    {
        if (! empty($request->vendor_air_id)) {
            foreach ($request->vendor_air_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $vendor_name = $request->vendor_air_name[$k];
                $mawb = $request->mawb[$k];
                $data_vendor_agent = [
                    'costing_id' => $id,
                    'mawb' => $mawb,
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'created_by' => auth()->user()->email,
                ];
                CostingVendorAgent::create($data_vendor_agent);
            }
        }
    }

    public function updateCostingAgent(Request $request, $id)
    {
        if (! empty($request->vendor_air_id)) {
            foreach ($request->vendor_air_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $costing_vendor_agent_id = $request->costing_vendor_agent_id[$k] ?? null;
                $costing_vendor_agent_delete_id = $request->costing_vendor_agent_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_air_name[$k];
                $mawb = $request->mawb[$k];
                $data_vendor_agent = [
                    'costing_id' => $id,
                    'mawb' => $mawb,
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                ];
                if ($costing_vendor_agent_id != null) {
                    $data_vendor_agent['updated_by'] = auth()->user()->email;
                    if ($costing_vendor_agent_delete_id != null) {
                        CostingVendorAgent::find($costing_vendor_agent_delete_id)->delete();
                    } else {
                        CostingVendorAgent::find($costing_vendor_agent_id)->update($data_vendor_agent);
                    }
                } else {
                    $data_vendor_agent['created_by'] = auth()->user()->email;
                    CostingVendorAgent::create($data_vendor_agent);
                }

            }
        }
    }

    public function createCostingSpecialImport(Request $request, $id)
    {
        if (! empty($request->vendor_special_import_id)) {
            foreach ($request->vendor_special_import_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $vendor_name = $request->vendor_special_import_name[$k];
                $charge_id = $request->charge_special_import_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_import_id[$k];
                $rate = $request->rate_special_import[$k];
                $amount = $request->amount_special_import[$k];
                $local_amount = $request->local_amount_special_import[$k];
                $status = $request->status_special_import[$k];
                $email = auth()->user()->email;
                $data_special_import = [
                    'costing_id' => $id,
                    'costing_type' => 'import',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];

                CostingSpecial::create($data_special_import);
            }
        }
    }

    public function updateCostingSpecialImport(Request $request, $id)
    {
        if (! empty($request->vendor_special_import_id)) {
            foreach ($request->vendor_special_import_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $costing_special_import_id = $request->costing_special_import_id[$k] ?? null;
                $costing_special_import_delete_id = $request->costing_special_import_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_special_import_name[$k];
                $charge_id = $request->charge_special_import_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_import_id[$k];
                $rate = $request->rate_special_import[$k];
                $amount = $request->amount_special_import[$k];
                $local_amount = $request->local_amount_special_import[$k];
                $status = $request->status_special_import[$k];
                $email = auth()->user()->email;
                $data_special_import = [
                    'costing_id' => $id,
                    'costing_type' => 'import',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];
                if ($costing_special_import_id != null) {
                    $data_special_import['updated_by'] = auth()->user()->email;
                    if ($costing_special_import_delete_id != null) {
                        CostingSpecial::find($costing_special_import_delete_id)->delete();
                    } else {
                        CostingSpecial::find($costing_special_import_id)->update($data_special_import);
                    }
                } else {
                    $data_special_import['created_by'] = auth()->user()->email;
                    CostingSpecial::create($data_special_import);
                }

            }
        }
    }

    public function createCostingSpecialExport(Request $request, $id)
    {
        if (! empty($request->vendor_special_export_id)) {
            foreach ($request->vendor_special_export_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $vendor_name = $request->vendor_special_export_name[$k];
                $charge_id = $request->charge_special_export_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_export_id[$k];
                $rate = $request->rate_special_export[$k];
                $amount = $request->amount_special_export[$k];
                $local_amount = $request->local_amount_special_export[$k];
                $status = $request->status_special_export[$k];
                $email = auth()->user()->email;
                $data_special_export = [
                    'costing_id' => $id,
                    'costing_type' => 'export',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];

                CostingSpecial::create($data_special_export);
            }
        }
    }

    public function updateCostingSpecialExport(Request $request, $id)
    {
        if (! empty($request->vendor_special_export_id)) {
            foreach ($request->vendor_special_export_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $costing_special_export_id = $request->costing_special_export_id[$k] ?? null;
                $costing_special_export_delete_id = $request->costing_special_export_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_special_export_name[$k];
                $charge_id = $request->charge_special_export_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_export_id[$k];
                $rate = $request->rate_special_export[$k];
                $amount = $request->amount_special_export[$k];
                $local_amount = $request->local_amount_special_export[$k];
                $status = $request->status_special_export[$k];
                $email = auth()->user()->email;
                $data_special_export = [
                    'costing_id' => $id,
                    'costing_type' => 'export',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];
                if ($costing_special_export_id != null) {
                    $data_special_export['updated_by'] = auth()->user()->email;
                    if ($costing_special_export_delete_id != null) {
                        CostingSpecial::find($costing_special_export_delete_id)->delete();
                    } else {
                        CostingSpecial::find($costing_special_export_id)->update($data_special_export);
                    }
                } else {
                    $data_special_export['created_by'] = auth()->user()->email;
                    CostingSpecial::create($data_special_export);
                }

            }
        }
    }

    public function createCostingSpecialOther(Request $request, $id)
    {
        if (! empty($request->vendor_special_other_id)) {
            foreach ($request->vendor_special_other_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $vendor_name = $request->vendor_special_other_name[$k];
                $charge_id = $request->charge_special_other_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_other_id[$k];
                $rate = $request->rate_special_other[$k];
                $amount = $request->amount_special_other[$k];
                $local_amount = $request->local_amount_special_other[$k];
                $status = $request->status_special_other[$k];
                $email = auth()->user()->email;
                $data_special_other = [
                    'costing_id' => $id,
                    'costing_type' => 'other',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];

                CostingSpecial::create($data_special_other);
            }
        }
    }

    public function updateCostingSpecialOther(Request $request, $id)
    {
        if (! empty($request->vendor_special_other_id)) {
            foreach ($request->vendor_special_other_id as $k => $row) {
                if ($row == 'Select') {
                    continue;
                }
                $costing_special_other_id = $request->costing_special_other_id[$k] ?? null;
                $costing_special_other_delete_id = $request->costing_special_other_delete_id[$k] ?? null;
                $vendor_name = $request->vendor_special_other_name[$k];
                $charge_id = $request->charge_special_other_id[$k];
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name;
                $currency_id = $request->currency_special_other_id[$k];
                $rate = $request->rate_special_other[$k];
                $amount = $request->amount_special_other[$k];
                $local_amount = $request->local_amount_special_other[$k];
                $status = $request->status_special_other[$k];
                $email = auth()->user()->email;
                $data_special_other = [
                    'costing_id' => $id,
                    'costing_type' => 'other',
                    'vendor_id' => $row,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                ];
                if ($costing_special_other_id != null) {
                    $data_special_other['updated_by'] = auth()->user()->email;
                    if ($costing_special_other_delete_id != null) {
                        CostingSpecial::find($costing_special_other_delete_id)->delete();
                    } else {
                        CostingSpecial::find($costing_special_other_id)->update($data_special_other);
                    }
                } else {
                    $data_special_other['created_by'] = auth()->user()->email;
                    CostingSpecial::create($data_special_other);
                }

            }
        }
    }

    public function createCostingHead(Request $request, $id, $value, $type, $shipment_by, $ref_id)
    {
        $costing_head = CostingHead::create([
            'costing_id' => $id,
            'costing_type' => $type,
            'costing_value' => $value,
            'created_by' => auth()->user()->email,
            'reference_id' => $ref_id,
            'shipment_type' => $shipment_by,
        ]);

        return $costing_head;
    }

    public function updateCostingHead(Request $request, $id, $value, $type, $shipment_by, $ref_id)
    {
        $head = CostingHead::where('costing_type', $type)->where('shipment_type', $shipment_by)->where('costing_id', $id)->where('reference_id', $ref_id);
        if ($head->exists()) {
            $costing_head = $head->first();
            CostingHead::find($costing_head->id)->update([
                'costing_id' => $id,
                'costing_type' => $type,
                'costing_value' => $value,
                'updated_by' => auth()->user()->email,
                'reference_id' => $ref_id,
                'shipment_type' => $shipment_by,
            ]);

        } else {
            $costing_head = CostingHead::create([
                'costing_id' => $id,
                'costing_type' => $type,
                'costing_value' => $value,
                'created_by' => auth()->user()->email,
                'reference_id' => $ref_id,
                'shipment_type' => $shipment_by,
            ]);
        }

        return $costing_head;
    }

    public function createCostingDetailBl(Request $request, $id, $bl_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_bl_{$j}_id"] as $k => $row) {
            $vendor_name = $request["vendor_bl_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_bl_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_bl_{$j}_id"][$k] ?? null;
            $rate = $request["rate_bl_{$j}"][$k] ?? null;
            $amount = $request["amount_bl_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_bl_{$j}"][$k] ?? null;
            $status = $request["status_bl_{$j}"][$k] ?? null;
            $email = auth()->user()->email;
            $transaction_date = $request->transaction_date_import;
            $type = $request["type_bl_{$j}"][$k] ?? null;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'bl',
                'costing_value' => $bl_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'created_by' => $email,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];

            CostingDetail::create($data_special_export);
        }
    }

    public function updateCostingDetailBl(Request $request, $id, $bl_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_bl_{$j}_id"] as $k => $row) {
            $costing_detail_id = $request["costing_detail_bl_{$j}_id"][$k] ?? null;
            $costing_detail_delete_id = $request["costing_detail_bl_{$j}_delete_id"][$k] ?? null;
            $vendor_name = $request["vendor_bl_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_bl_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_bl_{$j}_id"][$k] ?? null;
            $rate = $request["rate_bl_{$j}"][$k] ?? null;
            $amount = $request["amount_bl_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_bl_{$j}"][$k] ?? null;
            $status = $request["status_bl_{$j}"][$k] ?? null;
            $type = $request["type_bl_{$j}"][$k] ?? null;
            $email = auth()->user()->email;
            $transaction_date = $request->transaction_date_import;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'bl',
                'costing_value' => $bl_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];
            if ($costing_detail_id != null) {
                $data_special_export['updated_by'] = auth()->user()->email;
                if ($costing_detail_delete_id != null) {
                    CostingDetail::find($costing_detail_delete_id)->delete();
                } else {
                    CostingDetail::find($costing_detail_id)->update($data_special_export);
                }
            } else {
                $data_special_export['created_by'] = auth()->user()->email;
                CostingDetail::create($data_special_export);
            }
        }
    }

    public function createCostingDetailCtd(Request $request, $id, $ctd_number, $shipment_by, $head_id, $m)
    {
        if (! empty($request["vendor_ctd_{$m}_id"])) {
            foreach ($request["vendor_ctd_{$m}_id"] as $z => $rz) {
                if ($rz == 'Select') {
                    continue;
                }
                $vendor_name = $request["vendor_ctd_{$m}_name"][$z] ?? null;
                $charge_id = $request["charge_ctd_{$m}_id"][$z] ?? null;
                if ($charge_id != null) {
                    $charge = Charge::find($charge_id);
                    $charge_name = $charge->charge_name ?? '';
                } else {
                    $charge_name = '';
                }
                $charge_name = $charge->charge_name ?? '';
                $currency_id = $request["currency_ctd_{$m}_id"][$z] ?? null;
                $rate = $request["rate_ctd_{$m}"][$z] ?? null;
                $amount = $request["amount_ctd_{$m}"][$z] ?? null;
                $local_amount = $request["local_amount_ctd_{$m}"][$z] ?? null;
                $status = $request["status_ctd_{$m}"][$z] ?? null;
                $email = auth()->user()->email;
                $transaction_date = $request->transaction_date_import;
                $data_special_export = [
                    'costing_id' => $id,
                    'costing_head_id' => $head_id,
                    'shipment_type' => $shipment_by,
                    'costing_type' => 'bl_ctd',
                    'costing_value' => $ctd_number,
                    'vendor_id' => $rz,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'created_by' => $email,
                    'transaction_date' => $transaction_date,
                ];

                CostingDetail::create($data_special_export);
            }
        }
    }

    public function updateCostingDetailCtd(Request $request, $id, $ctd_number, $shipment_by, $head_id, $m)
    {
        if (! empty($request["vendor_ctd_{$m}_id"])) {
            foreach ($request["vendor_ctd_{$m}_id"] as $z => $rz) {
                if ($rz == 'Select') {
                    continue;
                }
                $costing_detail_id = $request["costing_detail_ctd_{$m}_id"][$z] ?? null;
                $costing_detail_delete_id = $request["costing_detail_ctd_{$j}_delete_id"][$k] ?? null;
                $vendor_name = $request["vendor_ctd_{$m}_name"][$z] ?? null;
                $charge_id = $request["charge_ctd_{$m}_id"][$z] ?? null;
                if ($charge_id != null) {
                    $charge = Charge::find($charge_id);
                    $charge_name = $charge->charge_name ?? '';
                } else {
                    $charge_name = '';
                }
                $charge_name = $charge->charge_name ?? '';
                $currency_id = $request["currency_ctd_{$m}_id"][$z] ?? null;
                $rate = $request["rate_ctd_{$m}"][$z] ?? null;
                $amount = $request["amount_ctd_{$m}"][$z] ?? null;
                $local_amount = $request["local_amount_ctd_{$m}"][$z] ?? null;
                $status = $request["status_ctd_{$m}"][$z] ?? null;
                $email = auth()->user()->email;
                $transaction_date = $request->transaction_date_import;
                $data_special_export = [
                    'costing_id' => $id,
                    'costing_head_id' => $head_id,
                    'shipment_type' => $shipment_by,
                    'costing_type' => 'bl_ctd',
                    'costing_value' => $ctd_number,
                    'vendor_id' => $rz,
                    'vendor_name' => $vendor_name,
                    'charge_id' => $charge_id,
                    'charge_name' => $charge_name,
                    'currency_id' => $currency_id,
                    'rate' => $rate,
                    'amount' => $amount,
                    'local_amount' => $local_amount,
                    'status' => $status,
                    'transaction_date' => $transaction_date,
                    'type' => 'manual_ctd',
                ];
                if ($costing_detail_id != null) {
                    $data_special_export['updated_by'] = auth()->user()->email;
                    if ($costing_detail_delete_id != null) {
                        CostingDetail::find($costing_detail_delete_id)->delete();
                    } else {
                        CostingDetail::find($costing_detail_id)->update($data_special_export);
                    }
                } else {
                    $data_special_export['created_by'] = auth()->user()->email;
                    CostingDetail::create($data_special_export);
                }
            }
        }
    }

    public function createCostingDetailMawb(Request $request, $id, $mawb_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_mawb_{$j}_id"] as $k => $row) {

            $vendor_name = $request["vendor_mawb_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_mawb_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_mawb_{$j}_id"][$k] ?? null;
            $rate = $request["rate_mawb_{$j}"][$k] ?? null;
            $amount = $request["amount_mawb_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_mawb_{$j}"][$k] ?? null;
            $status = $request["status_mawb_{$j}"][$k] ?? null;
            $transaction_date = $request->transaction_date_export;
            $type = $request["type_bl_{$j}"][$k] ?? null;
            $email = auth()->user()->email;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'mawb',
                'costing_value' => $mawb_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'created_by' => $email,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];

            CostingDetail::create($data_special_export);
        }
    }

    public function updateCostingDetailMawb(Request $request, $id, $mawb_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_mawb_{$j}_id"] as $k => $row) {
            $costing_detail_id = $request["costing_detail_mawb_{$j}_id"][$k] ?? null;
            $costing_detail_delete_id = $request["costing_detail_mawb_{$j}_delete_id"][$k] ?? null;
            $vendor_name = $request["vendor_mawb_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_mawb_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_mawb_{$j}_id"][$k] ?? null;
            $rate = $request["rate_mawb_{$j}"][$k] ?? null;
            $amount = $request["amount_mawb_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_mawb_{$j}"][$k] ?? null;
            $status = $request["status_mawb_{$j}"][$k] ?? null;
            $type = $request["type_mawb_{$j}"][$k] ?? null;
            $transaction_date = $request->transaction_date_import;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'mawb',
                'costing_value' => $mawb_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];
            if ($costing_detail_id != null) {
                $data_special_export['updated_by'] = auth()->user()->email;
                if ($costing_detail_delete_id != null) {
                    CostingDetail::find($costing_detail_delete_id)->delete();
                } else {
                    CostingDetail::find($costing_detail_id)->update($data_special_export);
                }
            } else {
                $data_special_export['created_by'] = auth()->user()->email;
                CostingDetail::create($data_special_export);
            }

        }
    }

    public function createCostingDetailOther(Request $request, $id, $bl_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_other_{$j}_id"] as $k => $row) {
            $vendor_name = $request["vendor_other_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_other_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_other_{$j}_id"][$k] ?? null;
            $rate = $request["rate_other_{$j}"][$k] ?? null;
            $amount = $request["amount_other_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_other_{$j}"][$k] ?? null;
            $status = $request["status_other_{$j}"][$k] ?? null;
            $email = auth()->user()->email;
            $transaction_date = $request->transaction_date_import;
            $type = $request["type_other_{$j}"][$k] ?? null;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'other',
                'costing_value' => $bl_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'created_by' => $email,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];

            CostingDetail::create($data_special_export);
        }
    }

    public function updateCostingDetailOther(Request $request, $id, $bl_number, $shipment_by, $head_id, $j)
    {
        foreach ($request["vendor_other_{$j}_id"] as $k => $row) {
            $costing_detail_id = $request["costing_detail_other_{$j}_id"][$k] ?? null;
            $costing_detail_delete_id = $request["costing_detail_other_{$j}_delete_id"][$k] ?? null;
            $vendor_name = $request["vendor_other_{$j}_name"][$k] ?? null;
            $charge_id = $request["charge_other_{$j}_id"][$k] ?? null;
            if ($charge_id != null) {
                $charge = Charge::find($charge_id);
                $charge_name = $charge->charge_name ?? '';
            } else {
                $charge_name = '';
            }
            $currency_id = $request["currency_other_{$j}_id"][$k] ?? null;
            $rate = $request["rate_other_{$j}"][$k] ?? null;
            $amount = $request["amount_other_{$j}"][$k] ?? null;
            $local_amount = $request["local_amount_other_{$j}"][$k] ?? null;
            $status = $request["status_other_{$j}"][$k] ?? null;
            $type = $request["type_other_{$j}"][$k] ?? null;
            $email = auth()->user()->email;
            $transaction_date = $request->transaction_date_import;
            $data_special_export = [
                'costing_id' => $id,
                'costing_head_id' => $head_id,
                'shipment_type' => $shipment_by,
                'costing_type' => 'other',
                'costing_value' => $bl_number,
                'vendor_id' => $row,
                'vendor_name' => $vendor_name,
                'charge_id' => $charge_id,
                'charge_name' => $charge_name,
                'currency_id' => $currency_id,
                'rate' => $rate,
                'amount' => $amount,
                'local_amount' => $local_amount,
                'status' => $status,
                'transaction_date' => $transaction_date,
                'type' => $type,
            ];
            if ($costing_detail_id != null) {
                $data_special_export['updated_by'] = auth()->user()->email;
                if ($costing_detail_delete_id != null) {
                    CostingDetail::find($costing_detail_delete_id)->delete();
                } else {
                    CostingDetail::find($costing_detail_id)->update($data_special_export);
                }
            } else {
                $data_special_export['created_by'] = auth()->user()->email;
                CostingDetail::create($data_special_export);
            }
        }
    }
}
