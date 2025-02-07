@props([
    'name' => $name,
    'iconClass' => $iconClass ?? null,
    'showCondition' => $showCondition ?? false,
    'level' => $level ?? null,
])

<li class="submenu">
    <a href="#">
        @if (!is_null($iconClass))
        <i class="{{ $iconClass }}"></i>
        @endif

        @if (!is_null($level))
            {{ $name }}
        @else
            <span> {{ $name }}</span>
        @endif
        <span class="menu-arrow"></span>
    </a>
    <ul @if (!$showCondition) style="display: none;" @endif class="@if (!is_null($level)) level{{$level}} @endif">
        {{ $slot }}
    </ul>
</li>
