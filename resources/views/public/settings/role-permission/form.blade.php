@extends('layout.app')
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
    </script>
@endpush
