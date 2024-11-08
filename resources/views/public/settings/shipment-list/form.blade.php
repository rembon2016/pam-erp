@extends('layout.index')
@push('body')
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
                    <li class="breadcrumb-item text-muted">Settings</li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item text-muted">Setting Shipment List</li>
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
                        <div class='mb-10'>
                            <label class='required form-label'>User</label>
                            @if ($data['method'] == 'PUT')
                                <input type="text" name="user" id="user" value="{{ \App\Helpers\StringHelper::getUserFullName($userSetting) }}" class="form-control" disabled>
                            @else
                                <select name="user_id" id="user_id" class="form-select" required>
                                    <option value="">Select User</option>
                                    @foreach ($users as $user)
                                        <option value="{{ $user->id }}" @selected($userSetting->id == $user->id)>{{ \App\Helpers\StringHelper::getUserFullName($user) }}</option>
                                    @endforeach
                                </select>
                            @endif
                        </div>
                        <div class="mb-10">
                            <div class="d-flex justify-content-between mt-2 align-items-center">
                                <label class="required form-label mb-0">Status Shipment</label>
                                <div class="d-flex">
                                    <label class="form-check form-check-sm form-check-custom form-check-solid me-5" id="all">
                                        <input class="form-check-input" name="checked_all" id="checked_all" type="checkbox"
                                            value="true">
                                        <span class="form-check-label">Checked All</span>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                @foreach ($status as $item)
                                    <div class="col-md-4">
                                        <div class="d-flex mt-2">
                                            <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                                <input class="form-check-input status" name="status[]" type="checkbox"
                                                    value="{{ $item->status_id }}" @checked(in_array($item->status_id, $userSetting->shipmentListSettings->pluck('related_id')->toArray()))>
                                                <span class="form-check-label">{{ $item->status_name }}</span>
                                            </label>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="d-flex align-items-center" style="gap: 7.5px">
                            <a href="{{ route('settings.shipment-list.index') }}" class="btn btn-danger">Cancel</a>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>

            </div>
            <!--end::Products-->
        </div>
        <!--end::Content container-->
    </div>
@endpush

@push('js')
    <script>
        $('#checked_all').change(function() {
            if ($(this).is(':checked')) {
                $('.status').prop('checked', true);
            } else {
                $('.status').prop('checked', false);
            }
        });
    </script>
@endpush
