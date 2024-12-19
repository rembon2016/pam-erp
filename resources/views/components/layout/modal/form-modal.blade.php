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
                <h2 class="modal-title mb-5">{{ $title }}</h2>
                <hr>

                <form action="{{ $action }}" class="row justify-content-center" method="{{ $method }}" target="{{ $target }}">
                    {{ $slot }}

                    <div class="row mb-3 mt-5" style="row-gap: 10px;">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-sm custom-btn custom-btn-outline-danger w-100" data-bs-dismiss="modal">Close</button>
                        </div>
                        <div class="col-md-6">
                            <button type="submit" class="btn btn-sm custom-btn custom-btn-primary w-100">{{ $submitButton }}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
