@props([
    'tabs' => $tabs ?? [],
])
<div id="kt_app_content" class="mt-5 mb-10">
    <!--begin::Content container-->
    <div id="kt_app_content_container" class="app-container container-xxl">
        <!--begin::Products-->

        <div class="custom-tabs">
            @foreach ($tabs as $item)
                <a href="{{ $item['link'] }}" class="custom-tab-link @if($item['activeCondition']) active @endif">
                    {{ $item['text'] }}
                </a>
            @endforeach
        </div>
    </div>
</div>
