
<div class="wrapper-ul-costing-tabs">
    <ul class="nav costing-tabs nav-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
        <input type="hidden" name="mawb_{{ $joborder->loading_plan_number }}" id="other_{{ $joborder->loading_plan_number }}" value="0">
            <button class="nav-link pam-tab active" id="other-tab" data-bs-toggle="tab" data-bs-target="#other-tab-0" type="button" role="tab">{{ $joborder->loading_plan_number }}</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link pam-tab" id="ctd-number-tab" data-bs-toggle="tab" data-bs-target="#ctd-number-tab-0" type="button" role="tab">CTD</button>
        </li>

    </ul>
    <div class="tab-content p-3 bg-white border border-top-0">
        <div class="tab-pane fade show active" id="other-tab-0" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :k="0" type="other" :value="$joborder->loading_plan_number" :vendor="$vendorAll" :charge="$charge" :currency="$currency" />
        </div>
        <div class="tab-pane fade" id="ctd-number-tab-0" role="tabpanel">
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
</div>
