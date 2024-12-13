@props([
    'label' => $label,
    'name' => $name,
    'defaultOption' => $defaultOption ?? "Select Option",
    'required' => $required ?? false,
    'model' => $model ?? null,
    'multiple' => $multiple ?? false,
    'disabled' => $disabled ?? false,
])

<div class='mb-3'>
    <label for="#{{ $name }}" class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>

    <select class="@if($errors->has($name)) is-invalid @endif form-select" name="{{ $name }}" {{ $required ? 'required' : '' }} id="{{ $name }}" {{ $multiple ? 'multiple' : '' }} {{ $disabled ? 'disabled' : '' }}>
        <option value="" @selected(is_null(old($name, $model?->{$name}))) hidden>{{ $defaultOption }}</option>
        {{ $slot }}
    </select>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>
