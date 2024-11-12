@props([
    'label' => $label,
    'name' => $name,
    'defaultOption' => $defaultOption ?? "Select Option",
    'required' => $required ?? false,
    'model' => $model ?? null
])

<div class='mb-10'>
    <label class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <select class="@if($errors->has($name)) is-invalid @endif form-select" name="{{ $name }}" {{ $required ? 'required' : '' }}>
        <option value="" @selected(is_null(old($name, $model?->{$name})))>{{ $defaultOption }}</option>

        {{ $slot }}
    </select>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>
