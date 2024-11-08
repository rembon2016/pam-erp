@props(['name' => $name, 'link' => $link])

<a class="menu-link" href="{{ $link }}">
    <span class="menu-bullet">
        <span class="bullet bullet-dot"></span>
    </span>
    <span class="menu-title">{{ $name }}</span>
</a>
