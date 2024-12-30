@foreach($bl as $k => $row)

    <ul class="nav nav-tabs costing-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <input type="hidden" name="bl_{{ $row->bl_number }}" id="bl_{{ $row->bl_number }}" value="{{ $k }}">
            <button class="nav-link active" id="bl-tab" data-bs-toggle="tab" data-bs-target="#bl-tab-{{ $k }}" type="button" role="tab">BL No: {{ $row->bl_number }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ctd-tab" data-bs-toggle="tab" data-bs-target="#ctd-tab-{{ $k }}" type="button" role="tab">CTD</button>
        </li>
    </ul>
    <div class="tab-content p-5 bg-white costing-tab-content">
        <div class="tab-pane fade show active" id="bl-tab-{{ $k }}" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :k="$k" type="bl" :vendor="$vendorLine" :value="$row->bl_number" :charge="$charge" :currency="$currency" />

        </div>

        <div class="tab-pane fade" id="ctd-tab-{{ $k }}" role="tabpanel">

          @foreach($row->shipping as $j => $ctd)
            <button type="button" class="btn btn-sm custom-btn custom-btn-primary">CTD NO: {{ $ctd->ctd_number }}</button>
            <x-costing.charges-from :costing="$costing" :k="$j" type="ctd" :value="$ctd->ctd_number" :vendor="$vendorLine" :z="$k" :charge="$charge" :currency="$currency" />
          @endforeach
        </div>
    </div>
@endforeach
