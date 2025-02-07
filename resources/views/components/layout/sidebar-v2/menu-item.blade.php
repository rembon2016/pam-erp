@props([
'name' => $name,
'iconClass' => $iconClass ?? null,
'link' => $link ?? '#',
'activeCondition' => $activeCondition ?? false,
'multilevel' => $multilevel ?? false,
])

<li>
    <a href="{{ $link }}" class="@if($activeCondition) active @endif">
        @if (!is_null($iconClass))
            <i class="{{ $iconClass }}"></i>
            <span>{{ $name }}</span>
        @else
            {{ $name }}
        @endif
    </a>
</li>
