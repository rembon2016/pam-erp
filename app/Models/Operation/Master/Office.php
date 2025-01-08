<?php

namespace App\Models\Operation\Master;

use App\Traits\Filterable;
use App\Models\Finance\Customer as FinanceCustomer;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Office extends Model
{
    use Filterable;

    const OFFICE_TYPE_ORIGIN = 1;

    const OFFICE_TYPE_DXB = 2;

    const OFFICE_TYPE_AGENT = 3;

    const OFFICE_TYPE_PAM_OFFICE = 4;

    const OFFICE_TYPE_ORIGIN_AGENT = 5;

    const OFFICE_TYPE_SALES_OFFICE = 6;

    protected $table = 'master.offices';

    public $timestamps = false;

    protected $primaryKey = 'office_id';

    protected $keyType = 'string';

    public static $rules = [
        'office_name' => 'required',
        'country_id' => 'required|numeric',
        'office_type' => 'required',
        'status' => 'required|numeric',
        'office_telp' => 'nullable|max:25',
        'office_fax' => 'nullable|max:20',
        'office_phone' => 'nullable|max:20',
        'created_by' => 'nullable',
        'modified_by' => 'nullable',
    ];

    protected $fillable = ['office_id', 'office_name', 'office_address', 'office_email', 'office_telp', 'office_fax', 'office_phone', 'office_tax_id', 'office_contact_person', 'country_id', 'office_type', 'created_by', 'modified_by', 'status', 'prefix', 'city', 'date_modified', 'office_alias', 'signature', 'finance_customer_id', 'office_code'];

    public function countries()
    {
        return $this->belongsTo(Countries::class, 'country_id', 'country_id');
    }

    public function financeCustomer(): BelongsTo
    {
        return $this->belongsTo(
            related: FinanceCustomer::class,
            foreignKey: 'finance_customer_id',
            ownerKey: 'id'
        );
    }
}
