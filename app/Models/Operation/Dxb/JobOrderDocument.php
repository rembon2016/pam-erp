<?php

namespace App\Models\Operation\Dxb;

use Illuminate\Database\Eloquent\Model;

class JobOrderDocument extends Model
{
    protected $table = 'dxb.job_order_document';

    public $timestamps = true;

    const CREATED_AT = 'date_created';

    const UPDATED_AT = 'date_modified';

    protected $primaryKey = 'document_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $fillable = ['document_id', 'type_document', 'name_file', 'created_by', 'updated_by', 'status', 'job_order_id'];
}
