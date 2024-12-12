@props(['title', 'value', 'name'])

<div class="d-block w-100">
    <div class="box-list download" {{ $attributes }}>
        <div>
            <div class="box-list-title mb-2">{{ $title }}</div>
            @if(is_array($value))
                @foreach($value as $file)
                    <div class="box-list-value mb-1" 
                         data-file="{{ json_encode($file) }}"
                         data-bs-toggle="tooltip" 
                         data-bs-placement="top" 
                         title="{{ $file['name'] }}">
                        <i class="fas fa-download"></i> 
                        <span class="text-gray-800"  title="{{ $file['name'] }}">
                            {{ strlen($file['name']) > 26 ? substr($file['name'], 9, 17) . '...' : $file['name'] }}
                        </span>
                    </div>
                @endforeach
            @elseif($value === '-')
                <span class="box-list-value">-</span>
            @else
                <span class="box-list-value" 
                      data-bs-toggle="tooltip" 
                      data-bs-placement="top" 
                      title="{{ $value }}">
                    <i class="fas fa-download"></i> 
                    <span class="text-gray-800" title="{{ $value }}">{{ $value }}</span>
                </span>
            @endif
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
});
</script>