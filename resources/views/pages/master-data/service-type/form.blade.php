@extends('layout.app')
@section('body')
    <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
        <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                    {{ $data['page'] }}
                </h1>
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <li class="breadcrumb-item text-muted">
                        <a href="#" class="text-muted text-hover-primary">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">Master Data</li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('master-data.service-type.index') }}" class="text-muted text-hover-primary">Service Type</a>
                    </li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">{{ $data['page'] }}</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">
            <!--begin::Products-->
            <div class="card card-flush">
                <div class="card-body">
                    <form action="{{ $data['action'] }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input name="_method" type="hidden" value="{{ $data['method'] }}">
                        <div class="row">
                            <div class='col-md-6 mb-10'>
                                <label class='required form-label'>Service Type</label>
                                <input type='text' class='form-control @error('service_code') is-invalid @enderror' name='service_code' value='{{ old('service_code', $service_type->service_code) }}' placeholder='Type Code of Service' required>
                                @error('service_code')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class='col-md-6 mb-10'>
                                <label class='required form-label'>Service Name</label>
                                <input type='text' class='form-control @error('service_name') is-invalid @enderror' name='service_name' value='{{ old('service_name', $service_type->service_name) }}' placeholder='Type Name of Service' required>
                                @error('service_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
                            <a href="{{ route('master-data.service-type.index') }}" class="btn btn-sm custom-btn custom-btn-outline-danger">Cancel</a>
                            <button type="submit" class="btn btn-sm custom-btn custom-btn-primary">Submit</button>
                        </div>
                    </form>
                </div>

            </div>
            <!--end::Products-->
        </div>
        <!--end::Content container-->
    </div>
@endsection
