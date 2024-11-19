@props([
    'name' => $name,
    'iconClass' => $iconClass,
    'showCondition' => $showCondition ?? false,
])

<div data-kt-menu-trigger="click" class="menu-item menu-accordion @if ($showCondition) show @endif">
    <span class="menu-link">
        <span class="menu-icon">
            <i class="{{ $iconClass }}"></i>
        </span>
        <span class="menu-title">{{ $name }}</span>
        <span class="menu-arrow"></span>
    </span>

    <div class="menu-sub menu-sub-accordion">
        <div class="menu-item">
            {{ $slot }}
        </div>
    </div>
</div>
