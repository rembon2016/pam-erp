@props(['pageName' => $pageName, 'href' => $href])

<li class="breadcrumb-item text-muted">
    <a href="{{ $href ?? '/' }}" class="text-muted text-hover-primary">{{ $pageName }}</a>
</li>
<li class="breadcrumb-item">
    <span class="bullet bg-gray-400 w-5px h-2px"></span>
</li>
