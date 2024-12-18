@props([
    'label' => $label,
    'name' => $name,
    'placeholder' => $placeholder ?? "Select Option",
    'required' => $required ?? false,
    'model' => $model ?? null,
    'multiple' => $multiple ?? false,
    'id' => $id ?? $name,
    'allowClear' => $allowClear ?? false,
    'isFilterShipment' => $isFilterShipment ?? false,
    'disabled' => $disabled ?? false
])

<div class='{{ $isFilterShipment ? "filter-group" : "mb-10" }}'>
    <label for="#{{ $name }}" class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <select class="@if($errors->has($name)) is-invalid @endif form-select {{ $isFilterShipment ? 'filter-shipment-select' : '' }}"
        name="{{ $name }}"
        {{ $required ? 'required' : '' }}
        id="{{ isset($id) ? $id : $name }}"
        data-control="select2"
        data-placeholder="{{ $placeholder }}"
        data-allow-clear="{{ $allowClear }}"
        {{ $disabled ? 'disabled' : '' }}
        @if($multiple) data-close-on-select="false" multiple="multiple" @endif>
        {{ $slot }}
    </select>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>

@if($isFilterShipment)
    @push('css')
    <style>
        .select2-dropdown.select2-dropdown--below {
            min-width: 300px !important;
        }
    </style>
    @endpush
@endif
