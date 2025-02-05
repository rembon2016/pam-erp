
<div class="wrapper-ul-costing-tabs">
    <ul class="nav costing-tabs nav-tabs px-3" id="myTab" role="tablist">
        <li class="nav-item" role="presentation">
        <input type="hidden" name="mawb_{{ $joborder->loading_plan_number }}" id="other_{{ $joborder->loading_plan_number }}" value="0">
            <button class="nav-link pam-tab active" id="other-tab" data-bs-toggle="tab" data-bs-target="#other-tab-0" type="button" role="tab">{{ $joborder->loading_plan_number }}</button>
        </li>

    </ul>
    <div class="tab-content p-5 bg-white border border-top-0">
        <div class="tab-pane fade show active" id="other-tab-0" role="tabpanel">
            <x-costing.charges-from :costing="$costing" :k="0" type="other" :value="$joborder->loading_plan_number" :vendor="$vendorAll" :charge="$charge" :currency="$currency" />
        </div>
    </div>
</div>
