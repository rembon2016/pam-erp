@foreach($costing->head as $k => $row)
    @if($row->costing_type == 'bl')
    <ul class="nav nav-tabs costing-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <input type="hidden" name="bl_{{ $row->costing_value }}" id="bl_{{$row->costing_value }}" value="{{ $k }}">
            <button class="nav-link active" id="bl-tab" data-bs-toggle="tab" data-bs-target="#bl-tab-{{ $k }}" type="button" role="tab">BL No: {{ $row->costing_value }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ctd-tab" data-bs-toggle="tab" data-bs-target="#ctd-tab-{{ $k }}" type="button" role="tab">CTD</button>
        </li>


    </ul>
    <div class="tab-content p-3 bg-white costing-tab-content">
        <div class="tab-pane fade show active" id="bl-tab-{{ $k }}" role="tabpanel">

            <x-costing.charges-from :costing="$costing" :detail="$row" value="{{ $row->costing_value }}" :k="$k" type="bl" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />


        </div>

        <div class="tab-pane fade" id="ctd-tab-{{ $k }}" role="tabpanel">

                @foreach($row->shipping as $j => $ctd)

                         <span class="labeled-ctd">CTD NO: {{ $ctd->ctd_number }}</span>
                        <x-costing.charges-from :costing="$costing" :detail="$row" value="{{ $ctd->ctd_number  }}" :k="$j" :z="$k" type="ctd" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />

                @endforeach

        </div>


    </div>
    @endif
@endforeach
