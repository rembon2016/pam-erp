@foreach($bl as $k => $row)

    <ul class="nav nav-tabs costing-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="bl-tab" data-bs-toggle="tab" data-bs-target="#bl-tab-{{ $k }}" type="button" role="tab">BL No: {{ $row->bl_number }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ctd-tab" data-bs-toggle="tab" data-bs-target="#ctd-tab-{{ $k }}" type="button" role="tab">CTD</button>
        </li>
    </ul>
    <div class="tab-content p-5 bg-white costing-tab-content">
        <div class="tab-pane fade show active" id="bl-tab-{{ $k }}" role="tabpanel">
            <x-costing.charges-from :k="$k" type="bl" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />
        </div>

        <div class="tab-pane fade" id="ctd-tab-{{ $k }}" role="tabpanel">
            <div class="d-flex flex-column" style="row-gap: 15px;">
                @foreach($row->shipping as $j => $ctd)
                    <div class="">
                        <button type="button" class="btn btn-success">CTD NO: {{ $ctd->ctd_number }}</button>
                        <x-costing.charges-from :k="$j" type="ctd" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endforeach
