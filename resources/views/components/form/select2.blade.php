@props([
    'label' => $label,
    'name' => $name,
    'placeholder' => $placeholder ?? "Select Option",
    'required' => $required ?? false,
    'model' => $model ?? null,
    'multiple' => $multiple ?? false,
    'onchange'=>$onchange ?? null
])

<div class='mb-10'>
    <label for="#{{ $name }}" class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <select class="@if($errors->has($name)) is-invalid @endif form-select"

        name="{{ $name }}"
        {{ $required ? 'required' : '' }}
        id="{{ $name }}"
        data-control="select2"
        data-placeholder="{{ $placeholder }}"
        @if($multiple) data-close-on-select="false" data-allow-clear="true" multiple="multiple" @endif>
        <option></option>
        {{ $slot }}

    </select>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>
