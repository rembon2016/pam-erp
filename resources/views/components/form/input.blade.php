@props([
    'label' => $label,
    'name' => $name,
    'placeholder' => $placeholder,
    'type' => $type ?? 'text',
    'required' => $required ?? false,
    'model' => $model ?? null,
    'file' => $file ?? false,
    'disabled' => $disabled ?? false,
    'customModelling' => $customModelling ?? null,
    'readonly' => $readonly ?? false,
    'multiple' => $multiple ?? false,
    'class' => $class ?? '',
])

<div class='mb-3'>

    @php
        $valueRecondition = $type == 'date'
            ? $model?->{$name}?->format('Y-m-d')
            : (!empty($customModelling) ? $customModelling : $model?->{$name});
    @endphp

    <label for="#{{ $name }}" class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <input id="{{ $name }}" type="{{ $type }}" class="@if($errors->has($name)) is-invalid @endif form-control {{ $class }}" placeholder="{{ $placeholder }}" name="{{ $name }}" value="{{ old($name, $valueRecondition) }}" {{ $required ? 'required' : '' }} {{ $disabled ? 'disabled' : '' }} {{ $readonly ? 'readonly' : '' }} {{ $multiple ? 'multiple' : '' }}>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
    @if ($file && !is_null($model?->{$name}))
        <a href="{{ $model?->getFileURL() }}" class="btn btn-sm btn-info d-inline-block mt-2" download>
            <i class="bx bx-download me-2"></i> Download File
        </a>
    @endif
</div>
