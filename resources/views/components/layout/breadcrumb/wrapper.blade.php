@props(['module' => $module, 'pageName' => $pageName])

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
