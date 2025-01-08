<?php

namespace App\Models\Operation\Dxb;

use App\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    use Filterable;

    protected $table = 'dxb.status';

    public $timestamps = false;

    protected $primaryKey = 'status_id';

    protected $keyType = 'string';

    public static $rules = [
        'status_name' => 'required', ];

    protected $fillable = ['status_id', 'status_name', 'created_by', 'modified_by', 'role_id', 'shipment_type', 'date_modified'];
}
