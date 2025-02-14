<?php

declare(strict_types=1);

namespace App\Service\Finance\Costing;

use App\Models\Finance\Customer;
use App\Models\Operation\Master\Port;
use App\Models\Operation\Origin\JobOrder;
use Illuminate\Http\Request;

final class DataService
{
    public function getJobOrders(Request $request)
    {
        $start = $request->get('start', 0);
        $pageSize = $request->get('length', 10);

        $query = JobOrder::with(['detail', 'loading','origin','costing'])
            ->activeOrders()
            ->when(!empty(request()->get('vessel_filter')), function ($query) {
                return $query->where('vessel_id', request()->get('vessel_filter'));
            })
            ->when(!empty(request()->get('voyage_filter')), function ($query) {
                return $query->whereHas('loading', function ($query) {
                    return $query->where('voyage_number', request()->get('voyage_filter'));
                });
            })
            ->when(!empty(request()->get('origin_filter')), function ($query) {
                return $query->where('origin_name', 'ilike', "%".request()->get('origin_filter')."%");
            });
        if (! empty($request['search']['value'])) {
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

    public function getCustomers()
{
    // Specify exact columns needed from customerTypes to reduce data transfer
    $customers = Customer::with(['customerTypes' => function($query) {
        $query->select('id', 'name', 'customer_id');
    }])
    ->select(
        'id',
        'id as vendor_id',
        'customer_name as vendor_name',
        'customer_code as vendor_code'
    )
    ->get();

    // Pre-define customer type categories
    $customerTypes = [
        'Trucking Company' => collect(),
        'Dubai Port' => collect(),
        'Carrier Agent' => collect(),
        'Shipping Line' => collect(),
        'Others' => collect()
    ];

    // Single loop untuk grouping
    foreach ($customers as $customer) {
        $type = $customer->customerTypes->first()?->name ?? 'Others';
        $customerTypes[$type] = $customerTypes[$type] ?? collect();
        $customerTypes[$type]->push($customer);
    }

    return [
        'vendor_all' => $customers,
        'vendor_truck' => $customerTypes['Trucking Company'],
        'vendor_port' => $customerTypes['Dubai Port'],
        'vendor_air' => $customerTypes['Carrier Agent'],
        'vendor_line' => $customerTypes['Shipping Line'],
    ];
}

    public function getPort(Request $request)
    {
        $query = Port::query();

        // Apply search filter
        if ($search = $request->input('search')) {
            $query->where('port_code', 'ilike', '%'.$search.'%');
            $query->orWhere('port_name', 'ilike', '%'.$search.'%');
        }

        // Paginate the results
        $options = $query->orderBy('port_code', 'ASC')->paginate(1000); // Adjust the pagination size as needed

        return [
            'results' => $options->items(),
            'pagination' => ['more' => $options->hasMorePages()],
        ];
    }
}
