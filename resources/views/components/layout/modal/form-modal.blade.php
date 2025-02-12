@props([
    'action' => $action ?? '',
    'target' => $target ?? '_self',
    'method' => $method ?? 'GET',
    'submitButton' => $submitButton ?? 'Save Changes',
    'id' => $id ?? "custom_link_modal",
    'title' => $title ?? 'Form Modal',
])

<div class="modal fade" tabindex="-1" id="{{ $id }}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <h4 class="modal-title mb-2">{{ $title }}</h4>
                <hr>

                <form action="{{ $action }}" class="row justify-content-center" method="{{ $method }}" target="{{ $target }}">
                    @if($method != "GET")
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    @endif
                    {{ $slot }}

                    <div class="row mb-3 mt-5 filter-buttons" style="row-gap: 10px;">
                        <div class="col-md-6">
                            <button type="button" class="d-inline-flex align-items-center justify-content-center btn w-100 btn-secondary m-0" data-bs-dismiss="modal">Close</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="d-inline-flex align-items-center justify-content-center btn w-100 btn-primary">{{ $submitButton }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
