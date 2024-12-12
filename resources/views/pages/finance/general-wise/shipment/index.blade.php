@extends('layout.app')
@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{{ $page }}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="General Wise" />
        <x:layout.breadcrumb.item pageName="Shipment"
            href="{{ route('finance.general-wise.shipment.index', ['type' => $type]) }}" />
    </x:layout.breadcrumb.wrapper>

    <x:layout.card.wrapper>
        <x:layout.card.header>
            <x:layout.card.toolbar-shipment />
            <div class="col-12">
                <x:filter-shipment type="{{ $type }}" />
            </div>
        </x:layout.card.header>
        <x:layout.card.body>
            <x:layout.table.wrapper id="shipment_table">
                <thead>
                    <x:layout.table.row>
                        <th class="th-datatable-checkbox-all"><input type="checkbox" class="row-checkbox" id="select_all"></th>
                        <x:layout.table.heading widthPixel="150" title="CTD NUMBER" />
                        <x:layout.table.heading widthPixel="250" title="SHIPMENT STATUS" />
                        <x:layout.table.heading widthPixel="250" title="SHIPPER" />
                        <x:layout.table.heading widthPixel="250" title="CONSIGNEE" />
                        <x:layout.table.heading widthPixel="100" title="ORIGIN" />
                        <x:layout.table.heading widthPixel="100" title="DESTINATION" />
                        <x:layout.table.heading widthPixel="100" title="PIECES" />
                        <x:layout.table.heading widthPixel="100" title="PKGS" />
                        <x:layout.table.heading widthPixel="100" title="GWT/KGS" />
                        <x:layout.table.heading widthPixel="100" title="CHW/KGS" />
                        <x:layout.table.heading widthPixel="100" title="CBM/M3" />
                        <x:layout.table.heading widthPixel="100" title="TERMS" />
                        <x:layout.table.heading widthPixel="100" title="SHIPMENT BY" />
                        <x:layout.table.heading widthPixel="300" title="VESSEL/CARRIER" />
                        <x:layout.table.heading widthPixel="100" title="ETD" />
                        <x:layout.table.heading widthPixel="100" title="ATD" />
                        <x:layout.table.heading widthPixel="100" title="ETA Transit Hub" />
                        <x:layout.table.heading widthPixel="100" title="ATA Transit Hub" />
                        <x:layout.table.heading widthPixel="100" title="ROUTING" />
                        <x:layout.table.heading widthPixel="100" customClass="text-center" title="Action" />
                    </x:layout.table.row>
                </thead>
                <tbody class="text-black shipment_table_body">
                </tbody>
            </x:layout.table.wrapper>
        </x:layout.card.body>
    </x:layout.card.wrapper>

    <!-- Multiple Download Modal -->
    <div class="modal fade" id="downloadMultipleModal" tabindex="-1" aria-labelledby="downloadMultipleModalLabel" aria-hidden="true">
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
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="confirmDownload">Download</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    @component('components.layout.table.datatable', [
        'id' => 'shipment_table',
        'url' => route('finance.general-wise.shipment.list', ['type' => $type]),
        'columns' => [
            [
                'data' => 'checkbox',
                'name' => 'checkbox',
                'orderable' => false,
                'searchable' => false,
                'className' => 'dt-body-center no-sort',
                'render' => function() {
                    return '<input type="checkbox" class="row-checkbox">';
                }
            ],
            [
                'data' => 'ctd_number',
                'name' => 'ctd_number',
                'orderable' => false,
            ],
            [
                'data' => 'status_shipment',
                'name' => 'status_shipment',
                'orderable' => false,
                'cutText' => false,
            ],
            [
                'data' => 'shipper_name',
                'name' => 'shipper_name',
                'orderable' => false,
            ],
            [
                'data' => 'consigne_name',
                'name' => 'consigne_name',
                'orderable' => false,
            ],
            [
                'data' => 'origin_name',
                'name' => 'origin_name',
                'orderable' => false,
            ],
            [
                'data' => 'destination_name',
                'name' => 'destination_name',
                'orderable' => false,
            ],
            [
                'data' => 'order.qty',
                'name' => 'order.qty',
                'orderable' => false,
            ],
            [
                'data' => 'order.pkgs',
                'name' => 'order.pkgs',
                'orderable' => false,
            ],
            [
                'data' => 'order.gross_weight',
                'name' => 'order.gross_weight',
                'orderable' => false,
            ],
            [
                'data' => 'order.chw',
                'name' => 'order.chw',
                'orderable' => false,
            ],
            [
                'data' => 'order.measurement',
                'name' => 'order.measurement',
                'orderable' => false,
            ],
            [
                'data' => 'freight_term',
                'name' => 'freight_term',
                'orderable' => false,
            ],
            [
                'data' => 'shipment_type',
                'name' => 'shipment_type',
                'orderable' => false,
            ],
            [
                'data' => 'vessel_voyage',
                'name' => 'vessel_voyage',
                'orderable' => false,
                'cutText' => false,
            ],
            [
                'data' => 'estimated_time_departure',
                'name' => 'estimated_time_departure',
                'orderable' => false,
            ],
            [
                'data' => 'atd',
                'name' => 'atd',
                'orderable' => false,
            ],
            [
                'data' => 'eta',
                'name' => 'eta',
                'orderable' => false,
            ],
            [
                'data' => 'ata',
                'name' => 'ata',
                'orderable' => false,
            ],
            [
                'data' => 'transit_via',
                'name' => 'transit_via',
                'orderable' => false,
            ],
            [
                'data' => 'action',
                'name' => 'action',
                'orderable' => false,
            ],
        ],
    ])
    @endcomponent
    <script>
        $(document).ready(function() {
            let table = $('#shipment_table').DataTable();
            
            // Handle select all checkbox
            $(document).on('click', '#select_all', function() {
                let isChecked = $(this).prop('checked');
                $('.row-checkbox').prop('checked', isChecked);
            });

            // Handle individual checkboxes
            $(document).on('click', '.row-checkbox:not(#select_all)', function() {
                // Skip the select_all checkbox itself from the count
                let totalCheckboxes = $('.row-checkbox:not(#select_all)').length;
                let checkedCheckboxes = $('.row-checkbox:not(#select_all):checked').length;
                
                // If all checkboxes are checked (excluding select_all), check the select_all box
                $('#select_all').prop('checked', totalCheckboxes === checkedCheckboxes);
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
                       .removeClass('col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start')
                       .css({
                           'display': 'flex',
                           'justify-content': 'center',
                           'align-items': 'center'
                       });

                // Modify second column (pagination)
                $(this).find('.col-sm-12.col-md-7')
                       .removeClass('col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end');
            });

            // Handle Download Multiple Doc button click
            $('.button-download-multiple-doc').click(async function() {
                const selectedRows = $('.row-checkbox:checked:not(#select_all)');
                
                if (selectedRows.length === 0) {
                    alert('Please select at least 1 CTD');
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
                $('#selectedCTDCount').text(selectedCTDs.length);
                
                // Build URL with multiple job_ids
                const baseUrl = 'http://203.175.10.178:8083/api/orderdocument/group?role_id=18';
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
                        documentTypesList.append('<p class="text-muted">No document types available</p>');
                    }

                    // Store the selected CTDs for later use
                    $('#confirmDownload').data('selectedCTDs', selectedCTDs);

                    // Show modal
                    $('#downloadMultipleModal').modal('show');

                } catch (error) {
                    console.error('API call error:', error);
                    alert('Failed to fetch document data. Please try again.');
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
                        alert('Please select at least one document type');
                        button.prop('disabled', false).text(originalText);
                        return;
                    }

                    // Get the stored selected CTDs
                    const selectedCTDs = button.data('selectedCTDs');
                    const jobIds = selectedCTDs.map(item => item.jobId);

                    // Prepare the payload
                    const payload = {
                        job_id: jobIds,
                        role_id: "18",
                        type_document: selectedDocTypes,
                        prefix: "DXB"
                    };

                    // Make the request
                    const response = await fetch('http://203.175.10.178:8083/api/orderdocument/downloadmultiple', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
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
                    
                } catch (error) {
                    console.error('Download error:', error);
                    alert('An error occurred while downloading the files. Please try again.');
                } finally {
                    button.prop('disabled', false).text(originalText);
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
        });
    </script>

    
@endpush
