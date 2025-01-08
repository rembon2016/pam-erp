<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Http\Requests\Public\UpdateProfileRequest;
use App\Service\Public\ProfileService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

final class ProfileController extends Controller
{
    /**
     * Constructs a new instance of the ProfileController class, injecting the ProfileService dependency.
     *
     * @param  ProfileService  $profileService  The ProfileService instance to be used by this controller.
     */
    public function __construct(
        protected ProfileService $profileService
    ) {}

    /**
     * Display the user's profile form.
     */
    public function index(): View
    {
        $user = Auth::user();

        return view('public.settings.profile.form', compact('user'));
    }

    /**
     * Update the user's profile information.
     */
    public function update(UpdateProfileRequest $request): RedirectResponse
    {
        $response = $this->profileService->updateUserProfile($request->validated());

        return redirect()
            ->back()
            ->with($response->success ? 'toastSuccess' : 'toastError', $response->message);
    }
}
