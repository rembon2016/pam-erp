@props(['pageName' => $pageName, 'href' => $href ?? null])

<li class="breadcrumb-item text-muted">
    @if (!is_null($href))
        <a href="{{ $href }}" class="text-muted text-hover-primary">{{ $pageName }}</a>
    @else
        {{ $pageName }}
    @endif
</li>
<li class="breadcrumb-item">
    <span class="bullet bg-gray-400 w-5px h-2px"></span>
</li>
