@props([
    'name' => $name,
    'iconClass' => $iconClass,
    'link' => $link,
    'activeCondition' => $activeCondition ?? false
])
<div class="menu-item">
    <a class="menu-link @if ($activeCondition) active @endif" href="{{ $link }}">
        <span class="menu-icon">
            <i class="{{ $iconClass }}"></i>
        </span>
        <span class="menu-title">{{ $name }}</span>
    </a>
</div>
