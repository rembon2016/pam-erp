@props([
    'name' => $name,
    'link' => $link,
    'activeCondition' => $activeCondition ?? false
])

<a class="menu-link @if ($activeCondition) active @endif" href="{{ $link }}">
    <span class="menu-bullet">
        <span class="bullet bullet-dot"></span>
    </span>
    <span class="menu-title">{{ $name }}</span>
</a>
