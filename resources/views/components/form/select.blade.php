@props([
    'label' => $label,
    'name' => $name,
    'defaultOption' => $defaultOption ?? "Select Option",
    'required' => $required ?? false,
    'model' => $model ?? null
])

<div class='mb-10'>
    <label for="#{{ $name }}" class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <select class="@if($errors->has($name)) is-invalid @endif form-select" name="{{ $name }}" {{ $required ? 'required' : '' }} id="{{ $name }}">
        <option value="" @selected(is_null(old($name, $model?->{$name}))) hidden>{{ $defaultOption }}</option>

        {{ $slot }}
    </select>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>