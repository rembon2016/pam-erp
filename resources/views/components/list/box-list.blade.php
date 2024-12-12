@props(['icon', 'title', 'value', 'date' => false])

<div class="d-block w-100">
    <div class="box-list">
        <div class="box-list-icon">
            <i class="fas fa-{{ $icon }}"></i>
        </div>
        <div>
            <div class="box-list-title">{{ $title }}</div>
            <span class="box-list-value">
                @if($date && $value !== '-')
                    {{ \Carbon\Carbon::parse($value)->format('d M Y, H:i') }}
                @else
                    {{ $value }}
                @endif
            </span>
        </div>
    </div>
</div>