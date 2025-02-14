@props([
    'action' => $action ?? '',
    'target' => $target ?? '_self',
    'method' => $method ?? 'GET'
])

<div class="toggle-sidebar filter-modal backdrop">
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
