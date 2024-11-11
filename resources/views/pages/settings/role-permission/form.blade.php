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
                    <li class="breadcrumb-item text-muted">Settings</li>
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('settings.role-permission.index') }}" class="text-muted text-hover-primary">Role & Permission</a>
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
                        <div class='mb-10'>
                            <label class='required form-label'>Role Name</label>
                            <input type='text' class='form-control @error('name') is-invalid @enderror' name='name' value='{{ old('name', $role->name) }}' placeholder='Type Name of Role' required>
                            @error('name')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="mb-10">
                            <div class="d-flex justify-content-between">
                                <label class="required form-label">Permission</label>
                                <div class="d-flex mt-2">
                                    <label class="form-check form-check-sm form-check-custom form-check-solid me-5" id="all">
                                        <input class="form-check-input" name="checked_all" id="checked_all" type="checkbox"
                                            value="true">
                                        <span class="form-check-label">Checked All</span>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                @foreach ($permissions as $key => $row)
                                    <h5 class="text-decoration-underline mt-5">{{ Str::upper($key) }}</h5>
                                    @foreach($row as $permission)
                                        <div class="col-md-4">
                                            <div class="d-flex mt-2">
                                                <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                                    <input class="form-check-input permission" name="permission[]" type="checkbox"
                                                        value="{{ $permission->name }}" @if (in_array($permission->id, $rolePermissions)) checked @endif>
                                                    <span class="form-check-label">{{ $permission->name }}</span>
                                                </label>
                                            </div>
                                        </div>
                                    @endforeach

                                    @error('permission')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                @endforeach
                            </div>
                        </div>
                        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
                            <a href="{{ route('settings.role-permission.index') }}" class="btn btn-sm custom-btn custom-btn-outline-danger">Cancel</a>
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

@push('js')
    <script>
        $('#checked_all').change(function() {
            if ($(this).is(':checked')) {
                $('.permission').prop('checked', true);
            } else {
                $('.permission').prop('checked', false);
            }
        });
    </script>
@endpush
