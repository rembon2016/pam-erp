<?php
namespace App\Operation\Models\Origin;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Filterable;
class Billing extends Model
{
  use Filterable;
    protected $table = 'accounting.customer';
    protected $primaryKey = 'customer_id';
    protected $keyType = 'string';
    static $rules = [];
    protected $guarded = [];
}
