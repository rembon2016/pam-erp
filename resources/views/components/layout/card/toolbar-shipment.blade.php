@props(['type'])
    
<div class="d-flex justify-content-between align-items-center flex-wrap mb-3 gap-3">
    <div class="search-table-box">
        <i class="bx bx-search-alt text-primary"></i>
        <input type="text" 
            id="datatableSearch"
            data-kt-ecommerce-order-filter="search"
            class="form-control search-input" 
            placeholder="Search ..."
            autocomplete="off"
        />
    </div>
    <div class="list-btn">
        <ul class="filter-list">
            <li>
                <a class="btn btn-filters w-auto popup-toggle" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Filter">
                    <span class="me-2">
                        <img src="{{ asset('assets-v2/img/icons/filter-icon.svg') }}" alt="filter">
                    </span>
                    Filter
                </a>
            </li>

            <li>
                <div class="dropdown dropdown-action" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Download">
                    <a href="#" class="btn-filters" data-bs-toggle="dropdown" aria-expanded="false">
                        <span><i class="fe fe-download"></i></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <ul class="d-block">
                            <li>
                                <a class="d-flex align-items-center download-item button-export">
                                    <i class="far fa-file-excel me-2"></i>
                                    <span class="button-export-text">Export All Data to CSV</span>
                                </a>
                            </li>
                            @if(!in_array($type, ['warehouse', 'trucking', 'courier']))
                            <li>
                                <a class="d-flex align-items-center download-item button-download-multiple-doc">
                                    <i class="far fa-file-archive me-2"></i>
                                    Download Multiple Doc
                                </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>

@push('js')
<script>
    $(document).ready(function() {
        // Initialize tooltip
        $('[data-bs-toggle="tooltip"]').tooltip();

        // Handle filter button click
        $('.popup-toggle').on('click', function() {
            $('.toggle-sidebar').addClass('show-layout');
        });
    });
</script>
@endpush
