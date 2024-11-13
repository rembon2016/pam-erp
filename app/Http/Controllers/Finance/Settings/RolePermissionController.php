<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Settings;

use App\Models\Role;
use Illuminate\View\View;
use App\Functions\Convert;
use App\Functions\Utility;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Functions\ResponseJson;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;
use App\Exports\Settings\RolePermissionExport;
use App\Http\Requests\Finance\RolePermission\GlobalRolePermissionRequest;

final class RolePermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('public.settings.role-permission.index');
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            $roles = Role::latest()->get();
            return DataTables::of($roles)
                ->addIndexColumn()
                ->editColumn('name', function ($item) {
                    return Convert::convertToTitleCase($item->name);
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('settings.role-permission.edit', $item->id),
                        'delete' => route('settings.role-permission.destroy', $item->id),
                    ]);
                })
                ->rawColumns(['action'])
                ->toJson();
        }

        return ResponseJson::error(
            Response::HTTP_UNAUTHORIZED,
            'Access Unauthorized',
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): View
    {
        $data = [
            'page' => 'Add Role & Permission',
            'action' => route('settings.role-permission.store'),
            'method' => 'POST',
         ];

        $role = new Role;
        $rolePermissions = [];
        $permissions = Permission::latest()->get()->groupBy('type');

         return view('public.settings.role-permission.form', compact('data', 'role', 'permissions', 'rolePermissions'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalRolePermissionRequest $request)
    {
        $requestDTO = $request->validated();

        DB::beginTransaction();
        try {
            $role = Role::create([
                'name' => $requestDTO['name'],
            ]);

            $role->givePermissionTo($requestDTO['permission']);

            DB::commit();
            return to_route('settings.role-permission.index')->with('toastSuccess', __('crud.created', ['name' => 'Role & Permission']));
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->with('toastError', __('crud.error_create', ['name' => 'Role & Permission']));
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $role = Role::where('id', $id)->first();

        if (is_null($role)) return to_route('settings.role-permission.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Role & Permission'])
        );

        $data = [
            'page' => 'Edit Role & Permission',
            'action' => route('settings.role-permission.update', $id),
            'method' => 'PUT',
         ];

        $rolePermissions = $role->permissions->pluck('id')->toArray();
        $permissions = Permission::latest()->get()->groupBy('type');

         return view('public.settings.role-permission.form', compact('data', 'role', 'permissions', 'rolePermissions'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalRolePermissionRequest $request, string $id)
    {
        $requestDTO = $request->validated();
        $role = Role::where('id', $id)->first();
        if (is_null($role)) return to_route('settings.role-permission.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Role & Permission'])
        );

        DB::beginTransaction();
        try {
            $role->update([
                'name' => $requestDTO['name'],
            ]);

            $role->syncPermissions($requestDTO['permission']);

            DB::commit();
            return to_route('settings.role-permission.index')->with('toastSuccess', __('crud.updated', ['name' => 'Role & Permission']));
        } catch (\Throwable $th) {
            DB::rollback();
            return back()->with('toastError', __('crud.error_update', ['name' => 'Role & Permission']));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $role = Role::where('id', $id)->first();
        if (is_null($role)) return to_route('settings.role-permission.index')->with(
            'toastError',
            __('crud.not_found', ['name' => 'Role & Permission'])
        );

        try {
            $role->delete();
            return to_route('settings.role-permission.index')->with('toastSuccess', __('crud.deleted', ['name' => 'Role & Permission']));
        } catch (\Throwable $th) {
            return to_route('settings.role-permission.index')->with('toastError', __('crud.error_delete', ['name' => 'Role & Permission']));
        }
    }

    public function exportPdf()
    {
        $data = Role::latest()->get();
        $pdf = Pdf::loadView('exports.pdf.role-permission', compact('data'));
        $file_name = 'list_role_' . time() . '.pdf';

        return $pdf->download($file_name);
    }

    public function exportExcel()
    {
        $file_name = 'list_role_' . time() . '.xlsx';
        return Excel::download(new RolePermissionExport, $file_name);
    }

    public function exportCsv()
    {
        $file_name = 'list_role_' . time() . '.csv';
        return Excel::download(new RolePermissionExport, $file_name);
    }
}
