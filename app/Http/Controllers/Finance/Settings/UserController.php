<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\Settings;

use App\Exports\Settings\UserExport;
use App\Functions\ResponseJson;
use App\Functions\Utility;
use App\Http\Controllers\Controller;
use App\Http\Requests\Finance\User\GlobalUserRequest;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\Facades\DataTables;

final class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): View
    {
        return view('public.settings.user.index');
    }

    /**
     * Retrieves a list of all roles and returns a JSON response for use in a data table.
     *
     * This method fetches all the roles from the database and returns a JSON response that can be used to populate a data table. The response includes an action column that contains a "View" button for each role.
     */
    public function list(): JsonResponse
    {
        if (request()->ajax()) {
            $users = User::with('roles')->latest()->get();

            return DataTables::of($users)
                ->addIndexColumn()
                ->editColumn('name', function ($item) {
                    return $item->first_name.' '.$item->last_name;
                })
                ->editColumn('roles', function ($item) {
                    return $item->roles?->pluck('name')->join(', ');
                })
                ->addColumn('action', function ($item) {
                    return Utility::generateTableActions([
                        'edit' => route('settings.user.edit', $item->id),
                        'delete' => route('settings.user.destroy', $item->id),
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
            'page' => 'Add User',
            'action' => route('settings.user.store'),
            'method' => 'POST',
        ];
        $user = new User;
        $roles = Role::latest()->get();

        return view('public.settings.user.form', compact('data', 'user', 'roles'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(GlobalUserRequest $request)
    {
        $requestDTO = $request->validated();
        try {
            $requestDTO['password'] = bcrypt($requestDTO['password']);
            $role = $requestDTO['role']; // Simpan peran terlebih dahulu
            unset($requestDTO['role']); // Hapus peran dari array $requestDTO

            $user = User::create($requestDTO);

            $user->assignRole($role);

            return to_route('settings.user.index')->with('toastSuccess', __('crud.created', ['name' => 'User']));
        } catch (\Throwable $th) {
            dd($th);

            return back()->with('toastError', __('crud.error_create', ['name' => 'User']));
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data = [
            'page' => 'Edit User',
            'action' => route('settings.user.update', $id),
            'method' => 'PUT',
        ];
        $user = User::with('roles')->find($id);

        if (is_null($user)) {
            return to_route('settings.user.index')->with(
                'toastError',
                __('crud.not_found', ['name' => 'User'])
            );
        }

        $roles = Role::latest()->get();

        return view('public.settings.user.form', compact('data', 'user', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(GlobalUserRequest $request, string $id)
    {
        $requestDTO = $request->validated();
        $user = User::find($id);
        if (is_null($user)) {
            return to_route('settings.user.index')->with(
                'toastError',
                __('crud.not_found', ['name' => 'User'])
            );
        }

        try {
            $data = [
                'page' => 'User',
                'action' => route('settings.user.update', $id),
                'method' => 'PUT',
            ];
            if (! empty($requestDTO['password'])) {
                $requestDTO['password'] = bcrypt($requestDTO['password']);
            } else {
                unset($requestDTO['password']);
            }
            $role = $requestDTO['role']; // Simpan peran terlebih dahulu
            unset($requestDTO['role']); // Hapus peran dari array $requestDTO

            $user->update($requestDTO);
            $user->syncRoles([]);
            $user->assignRole($role);

            return to_route('settings.user.index')->with('toastSuccess', __('crud.updated', ['name' => 'User']));
        } catch (\Throwable $th) {

            return back()->with('toastError', __('crud.error_update', ['name' => 'User']));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::find($id);
        if (is_null($user)) {
            return to_route('settings.user.index')->with(
                'toastError',
                __('crud.not_found', ['name' => 'User'])
            );
        }

        try {
            $role->delete();

            return to_route('settings.user.index')->with('toastSuccess', __('crud.deleted', ['name' => 'User']));
        } catch (\Throwable $th) {
            return to_route('settings.user.index')->with('toastError', __('crud.error_delete', ['name' => 'User']));
        }
    }

    public function exportCsv()
    {
        $file_name = 'list_user_'.time().'.csv';

        return Excel::download(new UserExport, $file_name);
    }
}
