@extends('layout.main-layout')
@section('title', 'Dashboard')

@section('body')
<div class="row">
    <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
            <div class="card-body">
                <div class="dash-widget-header">
                    <span class="dash-widget-icon bg-1">
                        <i class="fas fa-dollar-sign"></i>
                    </span>
                    <div class="dash-count">
                        <div class="dash-title">Amount Due</div>
                        <div class="dash-counts">
                            <p>1,642</p>
                        </div>
                    </div>
                </div>
                <div class="progress progress-sm mt-3">
                    <div class="progress-bar bg-5" role="progressbar"
                        style="width: 75%" aria-valuenow="75"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="text-muted mt-3 mb-0">
                    <span class="text-danger me-1">
                        <i class="fas fa-arrow-down me-1}"></i>
                        1.15%
                    </span>
                    since last week
                </p>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
            <div class="card-body">
                <div class="dash-widget-header">
                    <span class="dash-widget-icon bg-2">
                        <i class="fas fa-dollar-sign"></i>
                    </span>
                    <div class="dash-count">
                        <div class="dash-title">Amount Due</div>
                        <div class="dash-counts">
                            <p>1,642</p>
                        </div>
                    </div>
                </div>
                <div class="progress progress-sm mt-3">
                    <div class="progress-bar bg-6" role="progressbar"
                        style="width: 75%" aria-valuenow="75"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="text-muted mt-3 mb-0">
                    <span class="text-success me-1">
                        <i class="fas fa-arrow-up me-1}"></i>
                        1.15%
                    </span>
                    since last week
                </p>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
            <div class="card-body">
                <div class="dash-widget-header">
                    <span class="dash-widget-icon bg-3">
                        <i class="fas fa-dollar-sign"></i>
                    </span>
                    <div class="dash-count">
                        <div class="dash-title">Amount Due</div>
                        <div class="dash-counts">
                            <p>1,642</p>
                        </div>
                    </div>
                </div>
                <div class="progress progress-sm mt-3">
                    <div class="progress-bar bg-7" role="progressbar"
                        style="width: 75%" aria-valuenow="75"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="text-muted mt-3 mb-0">
                    <span class="text-danger me-1">
                        <i class="fas fa-arrow-down me-1}"></i>
                        1.15%
                    </span>
                    since last week
                </p>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
            <div class="card-body">
                <div class="dash-widget-header">
                    <span class="dash-widget-icon bg-4">
                        <i class="fas fa-dollar-sign"></i>
                    </span>
                    <div class="dash-count">
                        <div class="dash-title">Amount Due</div>
                        <div class="dash-counts">
                            <p>1,642</p>
                        </div>
                    </div>
                </div>
                <div class="progress progress-sm mt-3">
                    <div class="progress-bar bg-8" role="progressbar"
                        style="width: 75%" aria-valuenow="75"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>
                <p class="text-muted mt-3 mb-0">
                    <span class="text-success me-1">
                        <i class="fas fa-arrow-up me-1}"></i>
                        1.15%
                    </span>
                    since last week
                </p>
            </div>
        </div>
    </div>
</div>
@endsection
