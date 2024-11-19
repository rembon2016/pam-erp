@props([
    'widthPixel' => $widthPixel,
    'customClass' => $customClass ?? null,
    'title' => $title ?? 'Action'
])

@php
    $customClass ??= '';
@endphp

<th {{ $attributes->merge(['class' => "min-w-{$widthPixel}px {$customClass}"]) }}>
    {{ $title }}
</th>
