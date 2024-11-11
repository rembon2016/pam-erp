@props(['action' => $action, 'method' => $method])

<div id="kt_app_content" class="app-content flex-column-fluid">
    <!--begin::Content container-->
    <div id="kt_app_content_container" class="app-container container-xxl">
        <!--begin::Products-->
        <div class="card card-flush">
            <div class="card-body pt-8">
                <form action="{{ $action }}" method="{{ Str::upper($method) }}" enctype="multipart/form-data">
                    @csrf
                    @if (Str::upper($method) == 'PUT') @method('PUT') @endif
                    {{ $slot }}
                </form>
            </div>
        </div>
    </div>
</div>
