@extends('layout.app')

@push('css')
<style>
    body {
        overflow-x: hidden;
    }

    /* .tableChargeForm, .tableChargeForm td, .tableChargeForm th {
        border: 1px solid #ddd;
    }

    .tableServiceForm, .tableServiceForm td, .tableServiceForm th {
        border: 1px solid #ddd;
    } */

    .tableServiceForm, .tableChargeForm {
        display: flex;
        flex-direction: column;
        flex-wrap: nowrap;
    }

    .tableServiceForm {
        overflow-x: hidden;
    }

    .tableChargeForm {
        margin: 0 15px;
    }

    .tableServiceForm :is(.form-control) {
        padding: 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm :is(.form-select) {
        padding: 0.5rem 3rem 0.5rem 0.75rem;
        font-size: 1rem;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar, .tableChargeForm::-webkit-scrollbar {
        height: 3px;
        width: 3px;
    }

    .tableServiceForm .tableServiceForm-content::-webkit-scrollbar-track, .tableChargeForm::-webkit-scrollbar-track{
        background-color: #000;
    }

    .tableServiceForm .tableServiceForm-content {
        overflow-x: scroll;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .tableServiceForm :is(.tableServiceForm-heading, .tableServiceForm-body .tableServiceForm-body-row), .tableChargeForm :is(.tableChargeForm-heading, .tableChargeForm-body .tableChargeForm-body-row), .tableChargeDetailForm :is(.tableChargeDetailForm-heading, .tableChargeDetailForm-body .tableChargeDetailForm-body-row) {
        display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        white-space: nowrap;
        flex: 0 0 auto;
    }

    .tableServiceForm .tableServiceForm-box, .tableChargeForm .tableChargeForm-box, .tableChargeDetailForm .tableChargeDetailForm-box {
        flex: 1;
        /* border: 1px solid #ededed; */
        min-width: 200px;
        padding: 5px;
    }

    .tableChargeForm .tableChargeForm-box .tableChargeForm-heading-text, .tableChargeDetailForm .tableChargeDetailForm-box .tableChargeDetailForm-heading-text {
        font-size: 12px;
    }
</style>
@endpush

@section('body')
    <x:layout.breadcrumb.wrapper module="Master Data" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Master Data" />
        <x:layout.breadcrumb.item pageName="Agent Contract" href="{{ route('finance.master-data.agent-contract.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class="col-md-6">
                <x:form.input label="Contract No" name="contract_no" placeholder="Type Number of Contract" type="text" required="true" :model="$agent_contract" />
            </div>
            <div class='col-md-6'>
                <x:form.select2 label="Customer" name="customer_id" placeholder="Select Customer" :model="$agent_contract" required="true">
                    @foreach ($customers as $customer)
                        <option value="{{ $customer->id }}" @selected(old('customer_id', $agent_contract?->customer_id) == $customer->id)>{{ $customer->customer_name }}</option>
                    @endforeach
                </x:form.select2>
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Date" name="contract_date" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Validity From" name="contract_start" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-4">
                <x:form.input label="Contract Validity To" name="contract_end" placeholder="Select Date" type="date" required="true" :model="$agent_contract" />
            </div>
            <div class="col-md-12">
                <x:form.input label="Attachment (Multiple File Upload)" class="inputFiles" name="contract_file[]" placeholder="Choose File" type="file" :model="$agent_contract" file="true" multiple="true" />
                <div class="mb-3" id="fileList" style="width: min(560px, 100%)">
                    @foreach($agent_contract?->documents as $document)
                        <div class="file-item">
                            <span>{{ $document->contract_file }}</span>
                            <div class="d-flex align-items-center justify-content-end gap-2">
                                <a href="{{ $document->getFileUrl() }}" class="btn btn-sm px-1 py-3" download>
                                    <i class="bx bx-download text-info fs-2"></i>
                                </a>
                                <button type="button" data-action="{{ route('finance.master-data.agent-contract.document.delete', $document->id) }}" data-type="delete-existing-file" class="btn btn-sm px-1 py-3">
                                    <i class="bx bx-trash text-danger fs-2"></i>
                                </button>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
            <div class="col-12">
                <x:form.textarea label="Description" name="contract_description" placeholder="Type Description of Contract" :model="$agent_contract" />
            </div>
            <div class="col-12 mb-10">
                <div class="d-flex align-items-center justify-content-between mb-5">
                    <h4 class="mb-5 mt-5">Add Services</h4>
                    <div>
                        <button type="button" id="addServices" class="btn btn-icon btn-success rounded" style="height: 30px; width: 30px;">
                            <i class="fa fa-plus pe-0"></i>
                        </button>
                        <button type="button" id="removeServices" class="btn btn-icon btn-warning rounded" style="height: 30px; width: 30px;" disabled>
                            <i class="fa fa-minus pe-0"></i>
                        </button>
                    </div>
                </div>
                @include('pages.finance.master-data.agent-contract.service-contract-form')
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('finance.master-data.agent-contract.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
@endsection

@include('pages.finance.master-data.agent-contract.contract-agent-form-jquery')
@push('js')
<script>
    $(document).ready(function () {
        $("button[data-type='delete-existing-file']").off('click').on('click', function (event) {
            event.preventDefault();
            const actionUrl = $(this).data('action');
            const fileItem = $(this).parents('.file-item');

            $.ajax({
                url: actionUrl,
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}",
                },
                beforeSend: function () {
                    $(fileItem).hide();
                },
                success: function (response) {
                    if (response.ok) {
                        iziToast.success({
                            title: 'Success',
                            message : response.message,
                            position: 'topRight',
                            timeout: 1500,
                        });

                        $(fileItem).remove();
                    } else {
                        iziToast.error({
                            title: 'Failed',
                            message : response.message,
                            position: 'topRight',
                            timeout: 1500,
                            displayMode: 2,
                        });

                        $(fileItem).show();
                    }
                },
                error: function (xhr, status, error) {
                    iziToast.error({
                        title: 'Failed',
                        message : error,
                        position: 'topRight',
                        timeout: 1500,
                        displayMode: 2,
                    });

                    $(fileItem).show();
                },
            })
        });
    });

    let filesArray = [];

    // Saat file dipilih
    $('.inputFiles').on('change', function (e) {
        filesArray = Array.from(e.target.files); // Simpan file dalam array
        renderFileList();
    });

    // Fungsi untuk render daftar file
    function renderFileList() {
        $('.uploaded-file').remove(); // Kosongkan daftar
        filesArray.forEach((file, index) => {
            $('#fileList').append(
                `<div class="file-item uploaded-file">
                    <span>${file.name}</span>
                    <button type="button" data-type="delete-file" data-index="${index}" class="btn btn-sm">
                        <i class="bx bx-trash text-danger fs-2"></i>
                    </button>
                </div>`
            );
        });

        updateInputFiles(); // Perbarui file input
    }

    // Hapus file tertentu dari daftar
    $(document).on('click', 'button[data-type="delete-file"]', function () {
        const fileIndex = $(this).data('index');
        filesArray.splice(fileIndex, 1); // Hapus file dari array
        renderFileList();
    });

    // Perbarui input file dengan file yang tersisa di array
    function updateInputFiles() {
        const dataTransfer = new DataTransfer(); // Membuat DataTransfer baru
        filesArray.forEach((file) => {
            dataTransfer.items.add(file); // Tambahkan file ke DataTransfer
        });
        $('.inputFiles')[0].files = dataTransfer.files; // Perbarui input file
    }
</script>
@endpush
