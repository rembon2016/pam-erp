@props(['pageName' => $pageName, 'href' => $href ?? null])

<li class="breadcrumb-item">
    @if (!is_null($href))
        <a href="{{ $href }}">{{ $pageName }}</a>
    @else
        {{ $pageName }}
    @endif
</li>
