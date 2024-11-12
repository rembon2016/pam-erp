<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Http\Requests\Public\UpdatePasswordRequest;
use App\Service\Public\ChangePasswordService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

final class ResetPasswordController extends Controller
{
    /**
     * Constructs a new instance of the ResetPasswordController class.
     *
     * @param ChangePasswordService $changePasswordService The service responsible for handling password changes.
     */
    public function __construct(
        protected ChangePasswordService $changePasswordService,
    ) {}

    /**
     * Renders the view for the change password form.
     *
     * @return \Illuminate\View\View
     */
    public function index(): View
    {
        return view('public.settings.change-password.form');
    }

    /**
     * Updates the account password for the authenticated user.
     *
     * @param \App\Http\Requests\Public\UpdatePasswordRequest $request The request containing the new password.
     * @return \Illuminate\Http\RedirectResponse A redirect response with a success or error message.
     */
    public function update(UpdatePasswordRequest $request): RedirectResponse
    {
        $response = $this->changePasswordService->updateAccountPassword(dto: $request->validated());

        return redirect()
            ->back()
            ->with($response->success ? 'toastSuccess' : 'toastError', $response->message);
    }
}
