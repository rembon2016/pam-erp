@extends('layout.app')
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
                        <option value="{{ $loop->iteration }}" @selected($loop->iteration == request()->query('month'))>{{ $item }}</option>
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
                <x:form.select2 label="Vessel" name="mother_vessel_name" placeholder="Select Vessel" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Voyage" name="voyage" placeholder="Select Voyage" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Origin" name="origin" placeholder="Select Origin" :model="request()" />
            </div>
            <div class='col-md-3'>
                <x:form.select2 label="Billing Customer" name="customer" placeholder="Select Customer" :model="request()" />
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.billing.invoice.create.linked-billing-customer') }}" label="Reset Filter" />
            <x:form.submit-button label="Apply Filter" />
        </div>
    </x:form.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <div class="d-flex flex-column w-100" style="row-gap: 5px;">
                <i class="text-muted">Selected CTD: <span id="total_selected">0</span> Data</i>
                <div class="d-flex align-items-center justify-content-end gap-2">
                    <x:layout.card.toolbar
                        :customLink="[
                            'text' => 'Generate Invoices',
                            'icon' => 'bx bx-plus'
                        ]"
                        :withFilter="false"
                    />
                </div>
            </div>
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="linked-table">
                <thead>
                    <x:layout.table.row>

                        <th class="min-w-50px">
                            <input type="checkbox" class="row-checkbox" id="select_all">
                        </th>
                        <x:layout.table.heading widthPixel="50" title="No" />
                        <x:layout.table.heading widthPixel="100" title="CTD No" />
                        <x:layout.table.heading widthPixel="100" title="Billing Customer" />
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
@endsection

@push('js')
<script>
    let tableAjaxUrl = "{{ route('finance.billing.invoice.shipment.list') }}";
    const urlParams = new URLSearchParams(window.location.search);
    const stringParams = Array.from(urlParams.entries()).map(([key, value]) => `${key}=${value}`).join('&');

    if (stringParams !== '' && stringParams !== null && stringParams !== undefined) tableAjaxUrl += `?${stringParams}`;
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

    var KTDataTable = function() {
        var t, e;
        return {
            init: function() {

                (t = document.querySelector("#linked-table")) && (t.querySelectorAll(
                        "tbody tr").forEach((t => {
                        const e = t.querySelectorAll("td"),
                            r = moment(e[3].innerHTML, "dd mm yyyy").format();
                        e[3].setAttribute("data-order", r)
                    })), e = $(t).DataTable({
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
                                data: "billing_customer_name",
                                name: "billing_customer_name",
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
                        columnDefs: [
                        {
                            // Optional: Adjust render logic for specific columns directly in JS
                            targets: '_all',
                            render: function(data, type, row, meta) {
                                // If the data is null, display 'N/A'
                                return data === null ? 'N/A' : data;
                            }
                        }
                    ]
                    }), document.querySelector('[data-kt-ecommerce-order-filter="search"]').addEventListener(
                        "keyup", (function(t) {
                            e.search(t.target.value).draw()
                        })), (() => {
                            const t = document.querySelector('[data-kt-ecommerce-order-filter="status"]');
                            $(t).on("change", (t => {
                                let r = t.target.value;
                                "all" === r && (r = ""), e.column(2).search(r).draw()
                            }))

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

                            e.on('draw', function () {
                                updateCheckboxStates(e);
                            })
                    })())
            }
        }
    }();

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
                const arrayOfData = Array.from(selectedData);
                const paramData = "?selected=" + arrayOfData.join(',')
                let generateInvoiceUrl = "{{ route('finance.billing.invoice.generate') }}";
                generateInvoiceUrl += paramData;

                window.location.href = generateInvoiceUrl;
            }
        });
    })

    KTUtil.onDOMContentLoaded((function() {
        KTDataTable.init()
    }));

    $(document).ready(function () {
        // Billing Customer Select2
        generateAjaxSelect2(
            'customer',
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
                        text: `${item.mother_vessel_name} - ${item.voyage_number_mother}`
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
