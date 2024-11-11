@props([
    'label' => $label,
    'name' => $name,
    'placeholder' => $placeholder,
    'type' => $type ?? 'text',
    'required' => $required ?? false,
    'model' => $model ?? null,
])

<div class='mb-10'>
    <label class='form-label {{ $required ? 'required' : '' }}'>{{ $label }}</label>
    <input type="{{ $type }}" class="@if($errors->has($name)) is-invalid @endif form-control" placeholder="{{ $placeholder }}" name="{{ $name }}" value="{{ old($name, $model?->{$name}) }}" {{ $required ? 'required' : '' }}>
    <div class="invalid-feedback">
        {{ $errors->first($name) }}
    </div>
</div>
