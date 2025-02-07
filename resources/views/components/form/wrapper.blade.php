@props(['action' => $action, 'method' => $method,'id'=>$id ?? null])
@php
    $form_method = Str::upper($method) == 'GET' ? 'GET' : 'POST';
@endphp

<div class="card">
    <div class="card-body pt-8">
        <form action="{{ $action }}" method="{{ $form_method }}" id="{{ $id ?? "" }}" enctype="multipart/form-data">
            @csrf
            @if (Str::upper($method) == 'PUT') @method('PUT') @endif
            {{ $slot }}
        </form>
    </div>
</div>
