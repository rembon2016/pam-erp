<?php

namespace App\Models\Operation\Origin;

use App\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

class Billing extends Model
{
    use Filterable;

    protected $table = 'accounting.customer';

    protected $primaryKey = 'customer_id';

    protected $keyType = 'string';

    public static $rules = [];

    protected $guarded = [];
}
