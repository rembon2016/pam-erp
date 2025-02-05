@foreach($costing->head as $k => $row)
    @if($row->costing_type == 'other')
    <ul class="nav nav-tabs costing-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <input type="hidden" name="other_{{ $row->costing_value }}" id="other_{{$row->costing_value }}" value="{{ $k }}">
            <button class="nav-link active" id="other-tab" data-bs-toggle="tab" data-bs-target="#other-tab-{{ $k }}" type="button" role="tab">{{ $row->costing_value }}</button>
        </li>



    </ul>
    <div class="tab-content p-5 bg-white costing-tab-content">
        <div class="tab-pane fade show active" id="other-tab-{{ $k }}" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :detail="$row" value="{{ $row->costing_value }}" :k="$k" type="other" :vendor="$vendorAll" :charge="$charge" :currency="$currency" />
        </div>


    </div>
    @endif
@endforeach
