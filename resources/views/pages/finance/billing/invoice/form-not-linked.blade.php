@extends('layout.main-layout')
@section('title', 'Form Not Linked Billing Customer')

@section('body')
    <x:layout.breadcrumb.wrapper module="Billing" pageName="Not Linked Billing Customer">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Billing" />
        <x:layout.breadcrumb.item pageName="Invoice" href="{{ route('finance.billing.invoice.index') }}" />
    </x:layout.breadcrumb.wrapper>

    @component('components.invoice.form-tab', [
        'tabs' => [
            [
                'link' => route('finance.billing.invoice.create.not-linked-billing-customer', ['billing-customer' => 'not-linked']),
                'text' => 'Billing Customer - Not Linked',
                'activeCondition' => request()->routeIs('finance.billing.invoice.create.not-linked-billing-customer'),
            ],
            [
                'link' => route('finance.billing.invoice.create.linked-billing-customer', ['billing-customer' => 'linked']),
                'text' => 'Billing Customer - Linked',
                'activeCondition' => request()->routeIs('finance.billing.invoice.create.linked-billing-customer'),
            ]
        ]
    ])
    @endcomponent

    <x:form.wrapper action="" method="GET">
        <div class="row">
            <div class='col-md-3'>
                <x:form.select label="Service Type" name="service_type" defaultOption="Select Service Type" :model="request()">
                    @foreach ($service_types as $key => $value)
                        <option value="{{ $key }}" @selected($key == request()->query('service_type'))>{{ $value }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select label="Month" name="month" defaultOption="Select Month" :model="request()">
                    @foreach ($months as $item)
                        <option value="{{ $loop->iteration }}" @selected($item == request()->query('month'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class='col-md-3'>
                <x:form.select label="Year" name="year" defaultOption="Select Year" :model="request()">
                    @foreach ($years as $item)
                    <option value="{{ $item }}" @selected($item == request()->query('year'))>{{ $item }}</option>
                    @endforeach
                </x:form.select>
            </div>
            <div class="col-md-3">
                <x:form.input type="date" label="Start Date" name="start_date" placeholder="Choose Date" :model="request()" />
            </div>
            <div class="col-md-3">
                <x:form.input type="date" label="End Date" name="end_date" placeholder="Choose Date" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select label="Vessel" name="mother_vessel_name" defaultOption="Select Vessel" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select label="Voyage" name="voyage" defaultOption="Select Voyage" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select label="Origin" name="origin" defaultOption="Select Origin" :model="request()" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.billing.invoice.create.not-linked-billing-customer') }}" label="Reset Filter" />
            <x:form.submit-button label="Apply Filter" />
        </div>
    </x:form.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <div class="d-flex w-100 align-items-center flex-wrap justify-content-between w-100" style="gap: 5px;">
                <div class="d-flex flex-column justify-content-start w-50 mb-3" style="gap: 5px;">
                    <i class="text-muted">Selected CTD: <span id="total_selected">0</span> Data</i>
                    <div class="search-table-box">
                        <i class="bx bx-search-alt text-primary"></i>
                        <input type="text" class="form-control search-input" data-action="search-datatable" placeholder="Search ...">
                    </div>
                </div>
                <div class="d-flex align-items-center justify-content-end gap-2">
                    <x:layout.card.toolbar
                        :customLink="[
                            'text' => 'Update Multiple Billing Customer'
                        ]"
                        :withFilter="false"
                        :withSearch="false"
                    />
                </div>
            </div>
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="not-linked-table">
                <thead>
                    <x:layout.table.row>
                        <th class="min-w-50px">
                            <label class="custom_check">
                                <input type="checkbox" class="row-checkbox" id="select_all">
                                <span class="checkmark"></span>
                            </label>
                        </th>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="CTD No" />
                        <x:layout.table.heading widthPixel="100" title="Job Order No" />
                        <x:layout.table.heading widthPixel="100" title="Origin" />
                        <x:layout.table.heading widthPixel="100" title="Qty" />
                        <x:layout.table.heading widthPixel="100" title="CHW" />
                    </x:layout.table.row>
                </thead>
                <tbody class="fw-semibold text-gray-600">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>

    <x:layout.modal.form-modal action="{{ route('finance.billing.invoice.store.not-linked-billing-customer') }}" method="POST" title="Update Billing Customer" >
        <div class="col-12">
            <x:form.select label="Billing Customer" name="customer_id" required="true"></x:form.select>
        </div>
        <div class="col-12">
            <input type="hidden" name="data" id="ctd_data" value="[]">
        </div>
    </x:layout.modal.form-modal>
@endsection

@push('js')
<script>
    let tableAjaxUrl = "{{ route('finance.billing.invoice.shipment.list') }}" + "?billing-customer=not-linked";
    const urlParams = new URLSearchParams(window.location.search);
    const stringParams = Array.from(urlParams.entries()).map(([key, value]) => `${key}=${value}`).join('&');

    if (stringParams !== '' && stringParams !== null && stringParams !== undefined) tableAjaxUrl += `&${stringParams}`;

    const selectedData = new Set();

    function updateCheckboxStates(table) {
        table.rows().every(function() {
            const row = this.node();
            const data = this.data();
            const uniqueId = data.job_id;
            $(row).find('.row-checkbox').prop('checked', selectedData.has(uniqueId));
        });

        $("#total_selected").html(selectedData.size)

        // Update the select all checkbox
        const allCheckboxes = $('.row-checkbox:not(#select_all)');
        const allChecked = allCheckboxes.length === allCheckboxes.filter(':checked').length;
        $('#select_all').prop('checked', allChecked);

        const ctd_data_value = JSON.stringify(Array.from(selectedData));
        $("#ctd_data").val(ctd_data_value);
    }

    const e = $("#not-linked-table").DataTable({
        autoWidth: false,
        sDom: 'fBtlpi',
        ordering: true,
        searchDelay: 500,
        pageLength: 10,
        processing: true,
        serverSide: true,
        ajax: tableAjaxUrl,
        columns: [
            {
                data: "row_checkbox",
                name: "row_checkbox",
                orderable: false,
                searchable: false
            },
            {
                data: "DT_RowIndex",
                name: "DT_RowIndex",
                orderable: false,
                searchable: false
            },
            {
                data: "ctd_number",
                name: "ctd_number",
            },
            {
                data: "job_order_code",
                name: "job_order_code",
            },
            {
                data: "origin_name",
                name: "origin_name",
            },
            {
                data: "qty",
                name: "qty",
            },
            {
                data: "chw",
                name: "chw",
            },
        ],
        columnDefs: [ {
            "targets": 'no-sort',
            "orderable": false,
        } ],
        language: {
            search: ' ',
            sLengthMenu: '_MENU_',
            paginate: {
                next: 'Next <i class=" fa fa-angle-double-right ms-2"></i>',
                previous: '<i class="fa fa-angle-double-left me-2"></i> Previous'
            },
            },
        initComplete: (settings, json)=>{
            $('.dataTables_filter').appendTo('#tableSearch');
            $('.dataTables_filter').appendTo('.search-input');
        },
    });

    $('input[data-action="search-datatable"]').on('keyup', function (event) {
        event.preventDefault();
        e.search(event.target.value).draw();
    })

    $(document).on('click', '.row-checkbox:not(#select_all)', function () {
        const row = e.row($(this).closest('tr')).data();
        const uniqueId = row.job_id;
        if ($(this).prop('checked')) {
            selectedData.add(uniqueId);
        } else {
            selectedData.delete(uniqueId);
        }

        updateCheckboxStates(e);
    })

    // Handle select all checkbox
    $(document).on('click', '#select_all', function() {
        const isChecked = $(this).prop('checked');
        e.rows({
            page: 'current'
        }).every(function() {
            const data = this.data();
            const uniqueId = data.job_id;
            if (isChecked) {
                selectedData.add(uniqueId);
            } else {
                selectedData.delete(uniqueId);
            }
        });
        updateCheckboxStates(e);
    });

    // Handle Update Checkbox State
    e.on('draw', function () {
        updateCheckboxStates(e);
    })

    $(document).ready(function () {
        $("#custom-link-button").off('click').on('click', function (event) {
            event.preventDefault();

            if (selectedData.size == 0) {
                Swal.fire({
                    icon: 'warning',
                    title: 'No Selection',
                    text: 'Please select at least 1 CTD'
                });
                return;
            } else {
                $("#custom_link_modal").modal('show');
            }

        });
    })

    $(document).ready(function () {
        // Billing Customer Select2
        generateAjaxSelect2(
            'customer_id',
            "{{ route('api.finance.master-data.customer.billing.list') }}",
            "Select Billing Customer",
            function (result) {
                return {
                    results: result.data.map(item => ({
                        id: item.customer_id,
                        text: item.customer_name
                    })),
                };
            }
        );

        // Vessel Select2
        generateAjaxSelect2(
            'mother_vessel_name',
            "{{ route('api.finance.general-wise.vessel') }}",
            "Select Vessel",
            function (result) {
                return {
                    results: result.data.map(item => ({
                        id: item.mother_vessel_id,
                        text: `${item.mother_vessel_name} ` + (item.voyage_number_mother !== null ? `- ${item.voyage_number_mother}` : '')
                    })),
                };
            }
        );

        // Voyage Select2
        generateAjaxSelect2(
            'voyage',
            "{{ route('api.finance.general-wise.voyage') }}",
            "Select Voyage",
            function (result) {
                return {
                    results: result.data.map(item => ({
                        id: item.voyage_number_mother,
                        text: item.voyage_number_mother
                    })),
                };
            }
        );

        // Origin Select2
        generateAjaxSelect2(
            'origin',
            "{{ route('api.finance.general-wise.origin') }}",
            "Select Origin",
            function (result) {
                return {
                    results: result.data.map(item => ({
                        id: item.origin_name,
                        text: item.origin_name
                    })),
                };
            }
        );
    });
</script>
@endpush
