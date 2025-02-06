@foreach($costing->head as $k => $row)
    @if($row->costing_type == 'other')
    <ul class="nav nav-tabs costing-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
            <input type="hidden" name="other_{{ $row->costing_value }}" id="other_{{$row->costing_value }}" value="{{ $k }}">
            <button class="nav-link active" id="other-tab" data-bs-toggle="tab" data-bs-target="#other-tab-{{ $k }}" type="button" role="tab">{{ $row->costing_value }}</button>
        </li>
         <li class="nav-item" role="presentation">
            <button class="nav-link pam-tab" id="ctd-number-tab" data-bs-toggle="tab" data-bs-target="#ctd-number-tab-0" type="button" role="tab">CTD</button>
        </li>


    </ul>
    <div class="tab-content p-5 bg-white costing-tab-content">
        <div class="tab-pane fade show active" id="other-tab-{{ $k }}" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :detail="$row" value="{{ $row->costing_value }}" :k="$k" type="other" :vendor="$vendorAll" :charge="$charge" :currency="$currency" />
        </div>
        <div class="tab-pane fade" id="ctd-number-tab-0" role="tabpanel">
         <table class="table table-bordered">
                <thead>
                <tr>
                    <th style="width:50px;">No</th>
                    <th>CTD Number</th>
                    <th>Origin</th>
                    <th>CHW</th>
                    <th>Destination </th>
                <tr>
                </thead>


                <tbody>
                 @foreach($joborder->detail as $j => $ctd)
                    <tr>
                        <td>{{ $j + 1 }}</td>
                        <td>{{ $ctd->shipping->ctd_number }}</td>
                        <td>{{ $joborder->origin->city }}</td>
                        <td>{{ $ctd->shipping->order->chw }}</td>
                        <td>{{ $ctd->shipping->port_destination_code ?? $ctd->shipping->port_destination_name }}</td>
                    </tr>
                  @endforeach
                </tbody>

          </table>

        </div>


    </div>
    @endif
@endforeach
