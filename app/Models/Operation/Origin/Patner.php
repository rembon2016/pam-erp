<?php

namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;

class Patner extends Model
{
    protected $table = 'origin.destination_partner_office';
    public $timestamps = false;
    protected $primaryKey = 'destination_partner_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $fillable = ['destination_partner_id','job_id','office_id','office_name'];
}
