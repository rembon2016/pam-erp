<?php

declare(strict_types=1);

namespace App\Models\Finance;

use App\Models\Operation\Dxb\ShippingInstruction as ShippingInstructionDxb;
use App\Models\Operation\Origin\ShippingInstruction;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

final class CostingHead extends Model
{
    use HasFactory,
        HasUuids,
        SoftDeletes;

    protected $guarded = ['id'];

    protected $table = 'finance.costing_head';

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    protected $appends = ['shipping'];

    public function detail()
    {
        return $this->hasMany(CostingDetail::class, 'costing_head_id', 'id')->orderBy('vendor_name', 'asc');
    }

    public function getShippingAttribute()
    {
        if ($this->costing_type == 'bl') {
            if ($this->shipment_type == 'SEAAIR') {
                return ShippingInstruction::where('loading_report_bl_id', $this->reference_id)->get();
            } else {
                return ShippingInstructionDxb::where('loading_report_bl_id', $this->reference_id)->get();
            }
        } elseif ($this->costing_type == 'mawb') {
            if ($this->shipment_type == 'SEAAIR') {
                return ShippingInstruction::with('order')->where('loading_plan_dxb', $this->reference_id)->get();
            } elseif ($this->shipment_type == 'AIR') {
                return ShippingInstruction::with('order')->where('loading_id', $this->reference_id)->get();
            } else {
                return ShippingInstructionDxb::with('order')->where('loading_id', $this->reference_id)->get();
            }
        }

        return collect(); // Return an empty collection if conditions are not met
    }
}
