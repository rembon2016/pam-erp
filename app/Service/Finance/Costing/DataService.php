<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ObjectResponse;
use Illuminate\Support\Benchmark;
use Illuminate\Support\Facades\Http;
use App\Models\Operation\Origin\JobOrder;
use App\Models\Finance\Charge;
use App\Models\Finance\Currency;
use App\Models\Finance\Customer;
use App\Models\Operation\Master\Port;

final class DataService
{
    public function getJobOrders(Request $request)
    {
        $start = $request->get('start', 0);
        $pageSize = $request->get('length', 10);

        $query = JobOrder::with(['detail', 'loading'])
            ->where('status', '!=', 3);

        if (!empty($request['search']['value'])) {
            $search = $request['search']['value'];
            $query->where('job_order_code', 'ilike', "%{$search}%");
        }

        $totalRecords = JobOrder::where('status', '!=', 3)->count();
        $filteredRecords = $query->count();

        $data = $query->skip($start)
            ->take($pageSize)
            ->orderBy('date_order', 'DESC')
            ->get();

        return [
            'data' => $data,
            'totalRecords' => $totalRecords,
            'filteredRecords' => $filteredRecords,
        ];
    }

    public function getCustomer($type){
        return Customer::select('id as vendor_id','customer_name as vendor_name','customer_code as vendor_code')->with("customerTypes")->whereHas("customerTypes", function ($query) use ($type) {
            if($type != "All"){
                $query->where("name", $type);
            }
        })->get();
    }

    public function getPort(Request $request){
        $query = Port::query();

        // Apply search filter
        if ($search = $request->input('search')) {
            $query->where('port_code', 'ilike', '%' . $search . '%');
            $query->orWhere('port_name', 'ilike', '%' . $search . '%');
        }

        // Paginate the results
        $options = $query->orderBy('port_code','ASC')->paginate(1000); // Adjust the pagination size as needed

        return [
            'results' => $options->items(),
            'pagination' => ['more' => $options->hasMorePages()]
        ];
    }

}
