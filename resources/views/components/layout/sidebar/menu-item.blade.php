@props(['name' => $name, 'iconClass' => $iconClass, 'link' => $link])
<div class="menu-item">
    <a class="menu-link" href="{{ $link }}">
        <span class="menu-icon">
            <i class="{{ $iconClass }}"></i>
        </span>
        <span class="menu-title">{{ $name }}</span>
    </a>
</div>
