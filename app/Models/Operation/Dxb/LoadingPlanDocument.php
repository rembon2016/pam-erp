<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class LoadingPlanDocument extends Model
{
    protected $table = 'dxb.loading_plan_document';

    public $timestamps = false;

    protected $primaryKey = 'loading_plan_document_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['loading_plan_document_id', 'loading_id', 'type_document', 'name_file', 'created_by', 'updated_by', 'status', 'shipment_type', 'loading_plan_bl_id'];
}
