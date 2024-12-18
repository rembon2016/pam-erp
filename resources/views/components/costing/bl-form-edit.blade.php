@foreach($costing->head as $k => $row)
    @if($row->costing_type == 'bl')
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="bl-tab" data-bs-toggle="tab" data-bs-target="#bl-tab-{{ $k }}" type="button" role="tab">BL No: {{ $row->costing_value }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ctd-tab" data-bs-toggle="tab" data-bs-target="#ctd-tab-{{ $k }}" type="button" role="tab">CTD</button>
        </li>


    </ul>
    <div class="tab-content p-5 bg-white border border-top-0">
        <div class="tab-pane fade show active" id="bl-tab-{{ $k }}" role="tabpanel">

            <x-costing.charges-from :detail="$row" value="{{ $row->costing_value }}" :k="$k" type="bl" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />


        </div>

        <div class="tab-pane fade" id="ctd-tab-{{ $k }}" role="tabpanel">

          @foreach($row->shipping as $j => $ctd)
            <button class="btn btn-success">CTD NO: {{ $ctd->ctd_number }}</button>
            <x-costing.charges-from :detail="$row" value="{{ $ctd->ctd_number  }}" :k="$j" type="ctd" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />
          @endforeach
        </div>


    </div>
    @endif
@endforeach
