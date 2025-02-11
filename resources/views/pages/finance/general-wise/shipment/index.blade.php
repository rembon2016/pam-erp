@extends('layout.main-layout')
@section('title')
    {{ $page }}
@endsection

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{{ $page }}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Wise" />
        <x:layout.breadcrumb.item pageName="Shipment"
            href="{{ route('finance.general-wise.shipment.index', ['type' => $type]) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar-shipment :type="$type" />
            <div class="col-12">
                <x-filter.filter-shipment :tableId="'shipment_table'" :type="$type" />
            </div>
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="shipment_table">
                <thead>
                    <x:layout.table.row>
                        <th class="th-datatable-checkbox-all"><input type="checkbox" class="row-checkbox" id="select_all">
                        </th>

                        @foreach(App\Service\Finance\GeneralWise\ShipmentColumnService::getColumns($type) as $column)
                            @php
                                \Log::info('Column:', ['column' => $column]);
                            @endphp
                            @if(isset($column['title']))
                                <x:layout.table.heading
                                    widthPixel="{{ $column['width'] ?? '100' }}"
                                title="{{ $column['title'] }}"
                                customClass="{{ $column['className'] ?? '' }}"
                            />
                            @endif
                        @endforeach
                    </x:layout.table.row>
                </thead>
                <tbody class="text-black shipment_table_body">
                </tbody>
            </x:layout.table.wrapper>
            <div class="total-order-section" id="totalOrderSection" style="display: none;">
                <h6 class="fw-bold mb-3">Total Order Summary</h6>
                <div class="total-order-grid">
                    <div class="total-order-item">
                        <div class="total-order-label">Pieces Quantity :</div>
                        <div class="total-order-value" id="totalQty">-</div>
                    </div>
                    <div class="total-order-item">
                        <div class="total-order-label">Chargeable Weight :</div>
                        <div class="total-order-value" id="totalChargable">-</div>
                    </div>
                    <div class="total-order-item">
                        <div class="total-order-label">Gross Weight :</div>
                        <div class="total-order-value" id="totalGrossWeight">-</div>
                    </div>
                    <div class="total-order-item">
                        <div class="total-order-label">Measurement :</div>
                        <div class="total-order-value" id="totalMeasurement">-</div>
                    </div>
                    <div class="total-order-item">
                        <div class="total-order-label">TEUS :</div>
                        <div class="total-order-value" id="totalTeus">-</div>
                    </div>
                </div>
            </div>
        </x:layout.card.body>
    </x:layout.card.wrapper>

    <!-- Multiple Download Modal -->
    <div class="modal fade" id="downloadMultipleModal" tabindex="-1" aria-labelledby="downloadMultipleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="downloadMultipleModalLabel">Download Multiple Doc</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>CTD Selected: <span id="selectedCTDCount">0</span></p>
                    <div class="document-types-section">
                        <p class="fw-bold mb-2">Please select document to download</p>
                        <div id="documentTypesList" class="ms-2">
                            <!-- Document type checkboxes will be inserted here -->
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn cstm-f-color-magenta" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn cstm-f-color-blue" id="confirmDownload">Download</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Export to CSV Modal -->
    <div class="modal fade" id="exportCSVModal" tabindex="-1" aria-labelledby="exportCSVModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exportCSVModalLabel">Export to CSV</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="export-options-section">
                        <div class="container">
                            <div class="row mb-3">
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="selectAllExport">
                                        <label class="form-check-label" for="selectAllExport">
                                            Select All
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="exportFieldsList">
                                <!-- Fields will be dynamically inserted here in columns -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn cstm-f-color-magenta" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn cstm-f-color-blue" id="confirmExport">Download</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    @component('components.layout.table.datatable-shipment', [
        'id' => 'shipment_table',
        'url' => route('finance.general-wise.shipment.list', ['type' => $type]),
        'columns' => App\Service\Finance\GeneralWise\ShipmentColumnService::getColumns($type),
        'API_BASE' => in_array($type, ['seaair', 'crossair']) ? env('API_ORIGIN') : env('API_DXB')
    ])

    @endcomponent
    <script>
        $(document).ready(function() {
            const selectedJobIds = new Set();

            const shipmentBy = '{{ $shipment_by }}';

            let table = $('#shipment_table').DataTable();

            // Function to update checkboxes based on selectedJobIds
            function updateCheckboxStates() {
                table.rows().every(function() {
                    const row = this.node();
                    const data = this.data();
                    const jobId = data.job_id;
                    $(row).find('.row-checkbox').prop('checked', selectedJobIds.has(jobId));
                });

                // Update the select all checkbox
                const allCheckboxes = $('.row-checkbox:not(#select_all)');
                const allChecked = allCheckboxes.length === allCheckboxes.filter(':checked').length;
                $('#select_all').prop('checked', allChecked);
            }

            // Handle select all checkbox
            $(document).on('click', '#select_all', function() {
                const isChecked = $(this).prop('checked');
                table.rows({
                    page: 'current'
                }).every(function() {
                    const data = this.data();
                    const jobId = data.job_id;
                    if (isChecked) {
                        selectedJobIds.add(jobId);
                    } else {
                        selectedJobIds.delete(jobId);
                    }
                });
                updateCheckboxStates();
            });

            // Handle individual checkboxes
            $(document).on('click', '.row-checkbox:not(#select_all)', function() {
                const row = table.row($(this).closest('tr')).data();
                const jobId = row.job_id;
                if ($(this).prop('checked')) {
                    selectedJobIds.add(jobId);
                } else {
                    selectedJobIds.delete(jobId);
                }
                updateCheckboxStates();
            });

             // Update checkboxes when page changes
        table.on('draw', function() {
            updateCheckboxStates();
        });

            // Add "Rows per page" text to length element
            $('#shipment_table_length label').prepend('Rows per page: ');

            // Modify DataTable wrapper styling
            $('#shipment_table_wrapper').find('.row:last').each(function() {
                // Remove existing classes and add new styles
                $(this).removeClass('row')
                    .css({
                        'display': 'flex',
                        'justify-content': 'end'
                    });

                // Modify first column (length & info)
                $(this).find('.col-sm-12.col-md-5')
                    .removeClass(
                        'col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start'
                    )
                    .css({
                        'display': 'flex',
                        'justify-content': 'center',
                        'align-items': 'center'
                    });

                // Modify second column (pagination)
                $(this).find('.col-sm-12.col-md-7')
                    .removeClass(
                        'col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end'
                    );
            });

            // Handle Download Multiple Doc button click
            $('.button-download-multiple-doc').click(async function() {
                const selectedRows = $('.row-checkbox:checked:not(#select_all)');

                if (selectedRows.length === 0) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No Selection',
                        text: 'Please select at least 1 CTD'
                    });
                    return;
                }

                // Get selected CTD numbers and job IDs
                const selectedCTDs = [];
                selectedRows.each(function() {
                    const row = table.row($(this).closest('tr')).data();
                    selectedCTDs.push({
                        ctdNumber: row.ctd_number,
                        jobId: row.job_id
                    });
                });

                // Update modal content
                $('#selectedCTDCount').text(selectedJobIds.size);

                // Build URL with multiple job_ids
                const baseUrl = `${API_BASE}/api/orderdocument/group?role_id=18`;
                const jobIds = selectedCTDs.map(item => `job_id[]=${item.jobId}`);
                const url = `${baseUrl}&${jobIds.join('&')}`;

                try {
                    // Make the API call when modal opens
                    const response = await fetch(url, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    });

                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    const result = await response.json();

                    // Populate document types checkboxes
                    const documentTypesList = $('#documentTypesList');
                    documentTypesList.empty();

                    // Add this document mapping
                    const documentLabels = {
                        "ctd": "CTD File",
                        "final_alert": "Final Alert",
                        "si_doc": "Shipping Instruction",
                        "com_invoices_doc": "Commercial Invoice",
                        "packing_list_doc": "Packing List",
                        "bil_doc": "Bill Of Lading CTD",
                        "container_loading_doc": "Container Loading Sheet",
                        "msds_doc": "MSDS",
                        "cft_doc": "CFT",
                        "test_report_doc": "Test Report",
                        "debit_doc": "Origin Debit Note",
                        "coo_doc": "COO",
                        "other_doc": "Others",
                        "attachment_goods": "Attachment Of Goods",
                        "mawb_doc": "MAWB CTD",
                        "cargo_manifest": "Cargo Manifest CTD",
                        "pictures": "Pictures",
                        "prof_delivered": "Proof of Delivered",
                        "image_delivered": "Image Delivered",
                        "loading_image": "Loading Image Picture",
                        "BL": "Bill Of Lading",
                        "MAWB": "MAWB",
                        "Cargo": "Cargo Manifest",
                        "Debit": "Origin Debit Note"
                    };

                    // Function to get proper label for document type
                    function getDocumentLabel(type) {
                        return documentLabels[type] || formatDocumentTypeName(type);
                    }

                    // Ensure "CTD File" and "Final Alert" checkboxes are always present
                    const alwaysPresentDocuments = ["ctd", "final_alert"];
                    alwaysPresentDocuments.forEach(type => {
                        const label = getDocumentLabel(type);
                        documentTypesList.append(`
                            <div class="form-check mb-2">
                                <input class="form-check-input document-type-checkbox"
                                       type="checkbox"
                                       value="${type}"
                                       id="doc_${type}">
                                <label class="form-check-label" for="doc_${type}">
                                    ${label}
                                </label>
                            </div>
                        `);
                    });

                    // Update the document type checkbox generation part
                    if (result.data && result.data.length > 0) {
                        result.data.forEach(doc => {
                            // Skip adding if it's already in the always present list
                            if (!alwaysPresentDocuments.includes(doc.type_document)) {
                                const label = getDocumentLabel(doc.type_document);
                                documentTypesList.append(`
                                    <div class="form-check mb-2">
                                        <input class="form-check-input document-type-checkbox"
                                               type="checkbox"
                                               value="${doc.type_document}"
                                               id="doc_${doc.type_document}">
                                        <label class="form-check-label" for="doc_${doc.type_document}">
                                            ${label}
                                        </label>
                                    </div>
                                `);
                            }
                        });
                    } else {
                        // documentTypesList.append(
                        //     '<p class="text-muted">No document types available</p>');
                    }

                    // Store the selected CTDs for later use
                    $('#confirmDownload').data('selectedCTDs', selectedCTDs);

                    // Show modal
                    $('#downloadMultipleModal').modal('show');

                } catch (error) {
                    console.error('API call error:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'API Call Failed',
                        text: 'Failed to fetch document data. Please try again.'
                    });
                }
            });

            // Handle confirm download button click
            $('#confirmDownload').click(async function() {
                const button = $(this);
                const originalText = button.text();
                button.prop('disabled', true).text('Downloading...');

                try {
                    // Get selected document types
                    const selectedDocTypes = $('.document-type-checkbox:checked').map(function() {
                        return $(this).val();
                    }).get();

                    if (selectedDocTypes.length === 0) {
                        Swal.fire({
                            icon: 'warning',
                            title: 'No Selection',
                            text: 'Please select at least one document type'
                        });
                        button.prop('disabled', false).text(originalText);
                        return;
                    }

                    const type = '{{ $type }}';

                    // Prepare the payload
                    const payload = {
                        job_id: Array.from(selectedJobIds),
                        role_id: "18",
                        type_document: selectedDocTypes,
                        prefix: "DXB",
                        type: type
                    };

                     // Make the request to the Laravel controller
                    const response = await fetch('{{ route('finance.general-wise.shipment.download-documents') }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        body: JSON.stringify(payload)
                    });

                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    // Download the file
                    const blob = await response.blob();
                    const downloadUrl = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = downloadUrl;
                    a.download = `Selected-Documents-${new Date().getTime()}.zip`;
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(downloadUrl);
                    a.remove();

                    // Close modal and reset checkboxes
                    $('#downloadMultipleModal').modal('hide');
                    $('.row-checkbox').prop('checked', false);
                    $('#select_all').prop('checked', false);
                    selectedJobIds.clear();

                } catch (error) {
                    console.error('Download error:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Download Failed',
                        text: 'An error occurred while downloading the files. Please try again.'
                    });
                    selectedJobIds.clear();
                } finally {
                    button.prop('disabled', false).text(originalText);
                    selectedJobIds.clear();
                }
            });

            // Add this helper function to format document type names
            function formatDocumentTypeName(type) {
                return type
                    // Split by underscore or space
                    .split(/[_\s]/)
                    // Capitalize first letter of each word
                    .map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase())
                    // Join with spaces
                    .join(' ');
            }

            // Define export fields configuration
            const exportFields = [{
                    id: 1,
                    name: "CTD Number",
                    value: "ctd_number",
                    selected: true,
                    default: true,
                },
                {
                    id: 2,
                    name: "Shipment Mode",
                    value: "shipment_mode",
                },
                {
                    id: 3,
                    name: "Shipment Status",
                    value: "shipment_status",
                },
                {
                    id: 4,
                    name: "Origin",
                    value: "origin",
                },
                {
                    id: 5,
                    name: "Destination",
                    value: "destination",
                },
                {
                    id: 6,
                    name: "Routing",
                    value: "routing",
                },
                {
                    id: 7,
                    name: "Loading Type",
                    value: "loading_type",
                },
                {
                    id: 8,
                    name: "Terms",
                    value: "terms",
                },
                {
                    id: 9,
                    name: "Customer",
                    value: "customer",
                    isTitle: true,
                    subFields: [{
                            name: "Shipper",
                            value: "shipper"
                        },
                        {
                            name: "Consignee",
                            value: "consignee"
                        },
                        {
                            name: "Customer Group",
                            value: "customer_group"
                        },
                        {
                            name: "Billing Customer",
                            value: "billing_customer"
                        },
                    ],
                },
                {
                    id: 10,
                    name: "Shipment Details",
                    value: "shipment_details",
                    isTitle: true,
                    subFields: [{
                            name: "Pieces",
                            value: "pieces"
                        },
                        {
                            name: "Volume",
                            value: "volume"
                        },
                        {
                            name: "Gross Weight",
                            value: "gross_weight"
                        },
                        {
                            name: "Chargeable Weight",
                            value: "chargeble_weight"
                        },
                        {
                            name: "Packages",
                            value: "pkgs"
                        },
                        {
                            name: "Container Type",
                            value: "container"
                        },
                        {
                            name: "Container Number",
                            value: "container_number"
                        },
                    ],
                },
                {
                    id: 11,
                    name: "Vessel Details",
                    value: "vessel_details",
                    isTitle: true,
                    subFields: [{
                            name: "Vessel Name",
                            value: "vessel_carrier"
                        },
                        {
                            name: "Voyage Number",
                            value: "voyage_number"
                        },
                        {
                            name: "ETD",
                            value: "etd"
                        },
                        {
                            name: "ATD",
                            value: "atd"
                        },
                        {
                            name: "ETA",
                            value: "eta"
                        },
                        {
                            name: "ATA",
                            value: "ata"
                        },
                        {
                            name: "BL Number",
                            value: "bl_number"
                        },
                    ],
                },
                {
                    id: 12,
                    name: "Flight Carrier",
                    value: "flight_carrier",
                    isTitle: true,
                    subFields: [{
                            name: "Carrier",
                            value: "carrier"
                        },
                        {
                            name: "Flight Number",
                            value: "flight_number"
                        },
                        {
                            name: "MAWB Number",
                            value: "mawb_number"
                        },
                        {
                            name: "ATD",
                            value: "atd_flight"
                        },
                        {
                            name: "ATA",
                            value: "ata_flight"
                        },
                    ],
                },
                {
                    id: 13,
                    name: "Sales",
                    value: "sales",
                    isTitle: true,
                    subFields: [{
                            name: "Sales Office",
                            value: "sales_office"
                        },
                        {
                            name: "Sales Person",
                            value: "sales_person"
                        },
                    ],
                },
                {
                    id: 14,
                    name: "Destination Handling Agent",
                    value: "destination_handling_agent",
                },
                {
                    id: 15,
                    name: "Transit Time",
                    value: "transit_time",
                },
            ];

            // Function to create field element - update the checkbox creation logic
            const createFieldElement = (field) => {
                const fieldDiv = $('<div>', {
                    class: 'mb-3'
                });

                if (field.isTitle && field.subFields) {
                    // Create parent label
                    fieldDiv.append($('<label>', {
                        class: 'fw-bold d-block mb-2',
                        text: field.name
                    }));

                    // Create subfield checkboxes
                    field.subFields.forEach(subField => {
                        const subFieldDiv = $('<div>', {
                            class: 'form-check ms-4 mb-2'
                        });

                        const checkbox = $('<input>', {
                            class: 'form-check-input export-field-checkbox',
                            type: 'checkbox',
                            id: `export_${subField.value}`,
                            value: subField.value,
                            'data-parent': field.value,
                            // Add disabled and checked if parent field is selected
                            disabled: field.selected === true,
                            checked: field.selected === true
                        });

                        const label = $('<label>', {
                            class: 'form-check-label',
                            for: `export_${subField.value}`,
                            text: subField.name
                        });

                        subFieldDiv.append(checkbox, label);
                        fieldDiv.append(subFieldDiv);
                    });
                } else {
                    // Create regular checkbox
                    const checkboxDiv = $('<div>', {
                        class: 'form-check'
                    });

                    const checkbox = $('<input>', {
                        class: 'form-check-input export-field-checkbox',
                        type: 'checkbox',
                        id: `export_${field.value}`,
                        value: field.value,
                        // Add disabled and checked if field is selected
                        disabled: field.selected === true,
                        checked: field.selected === true || field.default === true
                    });

                    const label = $('<label>', {
                        class: 'form-check-label',
                        for: `export_${field.value}`,
                        text: field.name
                    });

                    checkboxDiv.append(checkbox, label);
                    fieldDiv.append(checkboxDiv);
                }

                return fieldDiv;
            };

            // Function to update export button text
            function updateExportButtonText() {
                const selectedCount = selectedJobIds.size;
                const buttonText = selectedCount === 0 ?
                    'Export All Data to CSV' :
                    `Export ${selectedCount} Data to CSV`;
                $('.button-export-text').text(buttonText);
            }

            // Update text when page loads
            updateExportButtonText();

            // Update text when any checkbox changes (including select all)
            $(document).on('change', '.row-checkbox', function() {
                updateExportButtonText();
            });

            // Update text when select all changes
            $(document).on('change', '#select_all', function() {
                updateExportButtonText();
            });

            // Reset text when export is completed
            $('#confirmExport').click(function() {
                $('#exportCSVModal').on('hidden.bs.modal', function() {
                    updateExportButtonText();
                });
            });

            // Handle Export to CSV button click
            $('.button-export').click(function() {
                const selectedRows = $('.row-checkbox:checked:not(#select_all)');

                // Generate checkboxes for export fields
                const exportFieldsList = $('#exportFieldsList');
                exportFieldsList.empty();

                // Create columns based on count and category breaks
                const columnsExport = [];
                let currentColumn = [];
                let currentCount = 0;

                // Distribute fields into columns
                exportFields.forEach((field, index) => {
                    // Check if we need to start a new column
                    if (currentCount >= 12 || (field.isTitle && currentCount > 0)) {
                        columnsExport.push(currentColumn);
                        currentColumn = [];
                        currentCount = 0;
                    }

                    // Add field to current column
                    currentColumn.push(createFieldElement(field));
                    currentCount += 1 + (field.subFields ? field.subFields.length : 0);
                });

                // Add remaining fields if any
                if (currentColumn.length > 0) {
                    columnsExport.push(currentColumn);
                }

                // Create column wrappers and add to the grid
                columnsExport.forEach(columnContent => {
                    const columnDiv = $('<div>', {
                        class: 'col-md-4 col-sm-6'
                    });
                    columnContent.forEach(item => columnDiv.append(item));
                    exportFieldsList.append(columnDiv);
                });

                // Show modal
                $('#exportCSVModal').modal('show');
            });

            // Clear selectedJobIds when clear filter button is clicked
            $('#btn-clear').on('click', function() {
                selectedJobIds.clear();
            });

            // Handle confirm export button click
            $('#confirmExport').click(async function() {
                const button = $(this);
                const originalText = button.text();
                button.prop('disabled', true).text('Downloading...');

                try {
                    // Get selected fields from checkboxes
                    const selectedFields = $('.export-field-checkbox:checked').map(function() {
                        return $(this).val();
                    }).get();

                    if (selectedFields.length === 0) {
                        Swal.fire({
                            icon: 'warning',
                            title: 'No Fields Selected',
                            text: 'Please select at least one field to export'
                        });
                        return;
                    }

                    // Get selected CTD numbers from table
                    const selectedRows = $('.row-checkbox:checked:not(#select_all)');

                    // Prepare the payload
                    const payload = {
                        job_id: Array.from(selectedJobIds),
                        field: selectedFields,
                        shipment_by: shipmentBy
                    };

                    // Make the API call
                    const response = await fetch(`${API_BASE}/api/shippinginstruction/export`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                        },
                        body: JSON.stringify(payload)
                    });

                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }

                    // Handle the response - assuming it returns a blob
                    const blob = await response.blob();
                    const downloadUrl = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.href = downloadUrl;
                    a.download = `shipment_export_${new Date().toISOString().slice(0,10)}.csv`;
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(downloadUrl);
                    a.remove();

                    // Close modal and reset
                    $('#exportCSVModal').modal('hide');
                    $('.row-checkbox').prop('checked', false);
                    $('#select_all').prop('checked', false);
                    selectedJobIds.clear();


                } catch (error) {
                    console.error('Export error:', error);
                    Swal.fire({
                        icon: 'error',
                        title: 'Export Failed',
                        text: 'An error occurred while exporting the data. Please try again.'
                    });
                    selectedJobIds.clear();
                } finally {
                    button.prop('disabled', false).text(originalText);
                    selectedJobIds.clear();
                }
            });

            // Handle Select All functionality
            $(document).on('change', '#selectAllExport', function() {
                const isChecked = $(this).prop('checked');
                $('.export-field-checkbox:not(:disabled)').prop('checked', isChecked);
            });

            // Update Select All state when individual checkboxes change
            $(document).on('change', '.export-field-checkbox', function() {
                const totalCheckboxes = $('.export-field-checkbox:not(:disabled)').length;
                const checkedCheckboxes = $('.export-field-checkbox:not(:disabled):checked').length;
                $('#selectAllExport').prop('checked', totalCheckboxes === checkedCheckboxes);
            });
        });
    </script>

    <style>
        #exportFieldsList {
            max-height: 400px;
            overflow-y: auto;
            padding-top: 10px;
        }

        #exportFieldsList .form-check {
            margin-bottom: 0.5rem;
        }

        .modal-dialog {
            max-width: 800px;
            /* Wider modal to accommodate the grid */
        }

        @media (max-width: 768px) {
            .modal-dialog {
                max-width: 95%;
                margin: 1rem auto;
            }
        }

        .export-field-checkbox:disabled+.form-check-label {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .form-check-input:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .export-field-checkbox {
            width: 18px !important;
            height: 18px !important;
        }

        .export-field-checkbox:checked {
            background-color: #6259ca !important;
            border-color: #6259ca !important;
        }

        /* Keep disabled styles but update with new color */
        .export-field-checkbox:disabled:checked {
            background-color: #6259ca !important;
            border-color: #6259ca !important;
            opacity: 0.7;
        }

        /* Ensure hover state maintains the same color */
        .export-field-checkbox:checked:hover {
            background-color: #6259ca !important;
            border-color: #6259ca !important;
        }

        /* Also apply to the Select All checkbox */
        #selectAllExport {
            width: 18px !important;
            height: 18px !important;
        }

        #selectAllExport:checked {
            background-color: #6259ca !important;
            border-color: #6259ca !important;
        }
    </style>

@endpush
