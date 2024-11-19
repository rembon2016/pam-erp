<?php

declare(strict_types=1);

namespace App\Http\Controllers\Finance\MasterData;

use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

final class UnitController extends Controller
{
    public function __construct() {}

    public function index(): View
    {
        //
    }

    public function list(): JsonResponse
    {
        //
    }

    public function create(): View
    {
        //
    }

    public function store(Request $request): RedirectResponse
    {
        //
    }

    public function edit(int $id): View
    {
        //
    }

    public function update(Request $request, int $id): RedirectResponse
    {
        //
    }

    public function destroy(int $id): RedirectResponse
    {
        //
    }

    public function exportPdf()
    {
        //
    }

    public function exportExcel()
    {
        //
    }

    public function exportCsv()
    {
        //
    }
}
