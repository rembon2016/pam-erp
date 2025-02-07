@props(['module' => $module, 'pageName' => $pageName])

{{-- <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
    <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
        <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
            <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                {{ $pageName }}
            </h1>
            <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">

                {{ $slot }}
                <li class="breadcrumb-item text-muted">{{ $pageName }}</li>
            </ul>
        </div>
    </div>
</div> --}}


<div class="mb-4">
    <div class="page-header mb-2">
        <div class="content-page-header mb-2">
            <h6>{{ $pageName }}</h6>
        </div>
    </div>

    <ol class="breadcrumb text-muted mb-0">
        {{ $slot }}

        <li class="breadcrumb-item text-muted">{{ $pageName }}</li>
    </ol>
</div>
