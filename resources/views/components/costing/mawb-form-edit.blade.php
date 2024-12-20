@foreach($costing->head as $m => $row)
     @if($row->costing_type == 'mawb')
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
         <input type="hidden" name="mawb_{{ $row->costing_value }}" id="mawb_{{ $row->costing_value }}" value="{{ $m }}">
            <button class="nav-link active" id="mawb-tab" data-bs-toggle="tab" data-bs-target="#mawb-tab-{{ $m }}" type="button" role="tab">MAWB: {{ $row->costing_value }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="ctd-number-tab" data-bs-toggle="tab" data-bs-target="#ctd-number-tab-{{ $m }}" type="button" role="tab">CTD</button>
        </li>


    </ul>
    <div class="tab-content p-5 bg-white border border-top-0">
        <div class="tab-pane fade show active" id="mawb-tab-{{ $m }}" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :detail="$row" value="{{ $row->costing_value }}" :k="$m" type="mawb" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />
        </div>

        <div class="tab-pane fade" id="ctd-number-tab-{{ $m }}" role="tabpanel">
         <table class="table table-bordered">
                <thead>
                <tr>
                    <th style="width:50px;">No</th>
                    <th>CTD Number</th>
                    <th>Origin</th>
                    <th>CHW</th>
                    <th>Destination Port</th>
                <tr>
                </thead>


                <tbody>
                 @foreach($row->shipping as $j => $ctd)
                    <tr>
                        <td>{{ $j + 1 }}</td>
                        <td>{{ $ctd->ctd_number }}</td>
                        <td>{{ $ctd->origin_name }}</td>
                        <td>{{ $ctd->order->chw ?? "" }}</td>
                        <td>{{ $ctd->port_destination_code }}</td>
                    </tr>
                  @endforeach
                </tbody>

          </table>

        </div>


    </div>
    @endif
@endforeach
