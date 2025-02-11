@props([
    'tabs' => $tabs ?? [],
])

<div class="custom-tabs mb-3">
    @foreach ($tabs as $item)
        <a href="{{ $item['link'] }}" class="btn @if($item['activeCondition']) btn-primary @else btn-outline-primary @endif">
            {{ $item['text'] }}
        </a>
    @endforeach
</div>
