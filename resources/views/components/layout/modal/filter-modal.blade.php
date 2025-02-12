@props([
    'action' => $action ?? '',
    'target' => $target ?? '_self',
    'method' => $method ?? 'GET'
])

{{-- <div class="modal fade" tabindex="-1" id="filter_table_modal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h2 class="modal-title mb-5">Filter</h2>

                <form action="{{ $action }}" class="row justify-content-center" method="{{ $method }}" target="{{ $target }}">
                    {{ $slot }}

                    <div class="row mb-3 mt-5" style="row-gap: 10px;">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-sm custom-btn custom-btn-outline-danger w-100">Reset Filter</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-sm custom-btn custom-btn-primary w-100">Filter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div> --}}



<div class="toggle-sidebar">
    <div class="sidebar-layout-filter">
        <div class="sidebar-header">
            <h5>Filter</h5>
            <a href="#" class="sidebar-closes"><i class="fa-regular fa-circle-xmark"></i></a>
        </div>
        <div class="sidebar-body">
            <form action="{{ $action }}" autocomplete="off" method="{{ $method }}" target="{{ $target }}">
                <div class="d-flex flex-column justify-content-between" style="min-height: 85vh">
                    <div class="row">
                      {{ $slot }}
                    </div>


                    <div class="filter-buttons">
                        <button type="submit"
                            class="d-inline-flex align-items-center justify-content-center btn w-100 btn-primary">
                            Apply
                        </button>
                        <button type="submit"
                            class="d-inline-flex align-items-center justify-content-center btn w-100 btn-secondary" id="reset-filter-btn">
                            Reset
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>

<script>
    const resetFilterBtn = document.getElementById('reset-filter-btn');
    resetFilterBtn.addEventListener('click', function(e) {
        e.preventDefault();
        window.location = window.location.pathname;
    });
</script>
