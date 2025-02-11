@props(['id' => $id])

<div class="card-table">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-center table-hovers" id="{{ $id }}">
                {{ $slot }}
            </table>
        </div>
    </div>
</div>
