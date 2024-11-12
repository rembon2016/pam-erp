@props([
    'label' => $label,
    'name' => $name,
    'placeholder' => $placeholder,
    'rows' => $rows ?? '5',
    'required' => $required ?? false,
    'model' => $model ?? null,
])

<div class='mb-10'>
    <label class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <textarea class="@if($errors->has($name)) is-invalid @endif form-control" placeholder="{{ $placeholder }}" name="{{ $name }}" rows="{{ $rows }}" {{ $required ? 'required' : '' }}>{{ old($name, $model?->{$name}) }}</textarea>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>
