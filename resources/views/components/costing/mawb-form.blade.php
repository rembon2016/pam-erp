@foreach($loadingplan as $m => $row)
<div class="wrapper-ul-costing-tabs">
    <ul class="nav costing-tabs nav-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
        <input type="hidden" name="mawb_{{ $row->mawb_number }}" id="mawb_{{ $row->mawb_number }}" value="{{ $m }}">
            <button class="nav-link pam-tab active" id="mawb-tab" data-bs-toggle="tab" data-bs-target="#mawb-tab-{{ $m }}" type="button" role="tab">MAWB: {{ $row->mawb_number }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link pam-tab" id="ctd-number-tab" data-bs-toggle="tab" data-bs-target="#ctd-number-tab-{{ $m }}" type="button" role="tab">CTD</button>
        </li>


    </ul>
    <div class="tab-content p-5 bg-white border border-top-0">
        <div class="tab-pane fade show active" id="mawb-tab-{{ $m }}" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :k="$m" type="mawb" :value="$row->mawb_number" :vendor="$vendorLine" :charge="$charge" :currency="$currency" />
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
                        <td>{{ $ctd->order->chw }}</td>
                        <td>{{ $ctd->port_destination_code }}</td>
                    </tr>
                  @endforeach
                </tbody>

          </table>

        </div>


    </div>
</div>
@endforeach
