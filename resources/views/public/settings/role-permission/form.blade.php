@extends('layout.main-layout')
@section('title')
    {{ $data['page'] }}
@endsection

@section('body')
    <x:layout.breadcrumb.wrapper module="Settings" pageName="{!! $data['page'] !!}">
        <x:layout.breadcrumb.item pageName="Home" href="{{ route('dashboard') }}" />
        <x:layout.breadcrumb.item pageName="Settings" />
        <x:layout.breadcrumb.item pageName="Role & Permission" href="{{ route('settings.role-permission.index') }}" />
    </x:layout.breadcrumb.wrapper>

    <x:form.wrapper action="{{ $data['action'] }}" method="{{ $data['method'] }}">
        <div class="row">
            <div class="col-12">
                <x:form.input label="Role Name" name="name" placeholder="Type Name of Role" :model="$role" required="true" />
            </div>
            <div class="col-12">
                <div class="mb-10">
                    <div class="d-flex flex-column">
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
                            <h6 class="mt-5 mb-2">{{ Str::upper($key) }}</h6>
                            @foreach($row as $index => $value)
                                @if (is_array($value))
                                    <div class="col-md-4">
                                        <div class="d-flex mt-2">
                                            <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                                <input class="form-check-input permission parent-permission" type="checkbox" value="{{ $index }}">
                                                <span class="form-check-label fw-semibold">{{ $index }}</span>
                                            </label>
                                        </div>

                                        <div class="d-flex flex-column ps-4 child-permission-box">
                                            @foreach ($value as $permission)
                                                <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                                    <input class="form-check-input permission child-permission" value="{{ $permission->name }}" name="permission[]" data-attr-group="{{ $permission->group_name }}" type="checkbox" @checked(in_array($permission->id, $rolePermissions))>
                                                    <span class="form-check-label">{{ $permission->feature_type }}</span>
                                                </label>
                                            @endforeach
                                        </div>
                                    </div>
                                    @else
                                    <div class="col-md-4">
                                        <div class="d-flex mt-2">
                                            <label class="form-check form-check-sm form-check-custom form-check-solid me-5">
                                                <input class="form-check-input permission" name="permission[]" type="checkbox"
                                                    value="{{ $value->name }}" @if (in_array($value->id, $rolePermissions)) checked @endif>
                                                <span class="form-check-label fw-semibold">{{ $value->name }}</span>
                                            </label>
                                        </div>
                                    </div>
                                @endif
                            @endforeach

                            @error('permission')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex align-items-center w-100 justify-content-end" style="gap: 7.5px">
            <x:form.cancel-button href="{{ route('settings.role-permission.index') }}" label="Cancel" />
            <x:form.submit-button label="Submit" />
        </div>
    </x:form.wrapper>
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

        $(".parent-permission").change(function () {
            const value = $(this).val();

            if ($(this).is(':checked')) {
                $(`.child-permission[data-attr-group="${value}"]`).prop('checked', true);
            } else {
                $(`.child-permission[data-attr-group="${value}"]`).prop('checked', false);
            }
        })
    </script>
@endpush
