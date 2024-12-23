<div class="d-flex justify-content-between w-100 wrapper-header">
    <div class="d-flex align-items-center w-100">
        <div class="icon-wrapper-header-toggle"
            data-kt-toggle="true" data-kt-toggle-state="active" data-kt-toggle-target="body"
            data-kt-toggle-name="app-sidebar-minimize">
            <span class="svg-icon svg-icon-2 rotate-180">
                <svg width="20" height="15" viewBox="0 0 20 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="20" height="2.22222" rx="1.11111" fill="#2F395F" />
                    <rect y="12.4444" width="20" height="2.22222" rx="1.11111" fill="#2F395F" />
                    <rect y="12.4444" width="20" height="2.22222" rx="1.11111" fill="#2F395F" />
                    <rect y="6.22222" width="13.3333" height="2.22222" rx="1.11111" fill="#2F395F" />
                    <rect y="6.22222" width="13.3333" height="2.22222" rx="1.11111" fill="#2F395F" />
                </svg>


            </span>
        </div>
        <input type="text" class="form-control search-headerbar ms-4 d-none" placeholder="Search CTD (ex: PAMxxx)" sty>
    </div>

    <div class="app-navbar flex-shrink-0">
        <div class="app-navbar-item align-items-stretch ms-1 ms-lg-3">
            <div id="kt_header_search" class="header-search d-flex align-items-stretch" data-kt-search-keypress="true"
                data-kt-search-min-length="2" data-kt-search-enter="enter" data-kt-search-layout="menu"
                data-kt-menu-trigger="auto" data-kt-menu-overflow="false" data-kt-menu-permanent="true"
                data-kt-menu-placement="bottom-end">
                {{-- <div class="d-flex align-items-center" data-kt-search-element="toggle" id="kt_header_search_toggle">
                    <div
                        class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px w-md-40px h-md-40px">
                        <span class="svg-icon svg-icon-1">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1"
                                    transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
                                <path
                                    d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                    fill="currentColor" />
                            </svg>
                        </span>
                    </div>
                </div> --}}
                <div data-kt-search-element="content" class="menu menu-sub menu-sub-dropdown p-7 w-325px w-md-375px">
                    <div data-kt-search-element="wrapper">
                        <form data-kt-search-element="form" class="w-100 position-relative mb-3" autocomplete="off">
                            <span
                                class="svg-icon svg-icon-2 svg-icon-lg-1 svg-icon-gray-500 position-absolute top-50 translate-middle-y ms-0">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2"
                                        rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor" />
                                    <path
                                        d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                        fill="currentColor" />
                                </svg>
                            </span>
                            <input type="text" class="search-input form-control form-control-flush ps-10"
                                name="search" value="" placeholder="Search..." data-kt-search-element="input" />
                            <span class="position-absolute top-50 end-0 translate-middle-y lh-0 d-none me-1"
                                data-kt-search-element="spinner">
                                <span class="spinner-border h-15px w-15px align-middle text-gray-400"></span>
                            </span>
                            <span
                                class="btn btn-flush btn-active-color-primary position-absolute top-50 end-0 translate-middle-y lh-0 d-none"
                                data-kt-search-element="clear">
                                <span class="svg-icon svg-icon-2 svg-icon-lg-1 me-0">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <rect opacity="0.5" x="6" y="17.3137" width="16" height="2"
                                            rx="1" transform="rotate(-45 6 17.3137)" fill="currentColor" />
                                        <rect x="7.41422" y="6" width="16" height="2" rx="1"
                                            transform="rotate(45 7.41422 6)" fill="currentColor" />
                                    </svg>
                                </span>
                            </span>
                        </form>
                        <div class="separator border-gray-200 mb-6"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="app-navbar-item ms-1 ms-lg-3">
            <!--begin::Menu- wrapper-->
            <div class="btn btn-icon btn-custom btn-icon-muted btn-active-light btn-active-color-primary w-35px h-35px w-md-40px h-md-40px"
                data-kt-menu-trigger="click" id="notif-click" data-kt-menu-attach="parent"
                data-kt-menu-placement="bottom-end">
                <!--begin::Svg Icon | path: icons/duotune/general/gen022.svg-->
                <span class="svg-icon svg-icon-1 position-relative">
                    <div class="f-badge d-none" id="badge">0</div>
                    <i class="far fa-bell" style="font-size:18px; color: #292828"></i>

                </span>
                <!--end::Svg Icon-->
            </div>
            <!--begin::Menu-->
            <div class="menu menu-sub menu-sub-dropdown menu-column w-350px w-lg-375px" data-kt-menu="true"
                style="">
                <!--begin::Heading-->
                <div class="d-flex flex-column bgi-no-repeat rounded-top"
                    style="background-image:url('assets/media/pattern-1.jpg')">
                    <!--begin::Title-->
                    <h3 class="text-white fw-semibold px-9 mt-10 mb-6">Notifications
                        {{-- <span class="fs-8 opacity-75 ps-3">1 reports</span> --}}
                    </h3>
                    <!--end::Title-->
                    <!--begin::Tabs-->
                    <ul class="nav nav-line-tabs nav-line-tabs-2x nav-stretch fw-semibold px-9" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link text-white opacity-75 opacity-state-100 pb-4" data-bs-toggle="tab"
                                href="#kt_topbar_notifications_1" aria-selected="false" tabindex="-1"
                                role="tab">Notification</a>
                        </li>
                    </ul>
                    <!--end::Tabs-->
                </div>
                <!--end::Heading-->
                <!--begin::Tab content-->
                <div class="tab-content">
                    <!--begin::Tab panel-->
                    <div class="tab-pane fade active show" role="tabpanel">
                        <!--begin::Items-->
                        <div class="scroll-y mh-325px my-5 px-8" id="notif_list">
                        </div>
                    </div>
                </div>=
            </div>
            <!--end::Menu-->
            <!--end::Menu wrapper-->
        </div>
        <div class="app-navbar-item ms-1 ms-lg-3"></div>
        <div class="app-navbar-item ms-1 ms-lg-5  me-lg-4" id="kt_header_user_menu_toggle">
            <div class="cursor-pointer symbol symbol-35px symbol-md-40px" data-kt-menu-trigger="click"
                data-kt-menu-attach="parent" data-kt-menu-placement="bottom-end">
                <img src=""
                    onerror="this.onerror=null;this.src='{{ asset('assets/media/avatars/blank.png') }}';"
                    alt="user" />
                <span class="ms-2 fw-semibold">{{ Auth::user()->first_name }} {{ Auth::user()->last_name }}</span>
            </div>
            <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg menu-state-color fw-semibold py-4 fs-6 w-275px"
                data-kt-menu="true">
                <div class="menu-item px-3">
                    <div class="menu-content d-flex align-items-center px-3">
                        <div class="symbol symbol-50px me-5">
                            <img alt="Logo" src=""
                                onerror="this.onerror=null;this.src='{{ asset('assets/media/avatars/blank.png') }}';" />
                        </div>
                        <div class="d-flex flex-column">
                            <div class="fw-bold d-flex align-items-center fs-5">
                                <span class="badge badge-light-success fw-bold fs-8 px-2 py-1 ms-2">Superadmin</span>
                            </div>
                            <a href="#"
                                class="fw-semibold text-muted text-hover-primary fs-7">{{ Auth::user()->email }}</a>
                        </div>
                    </div>
                </div>
                <div class="separator my-2"></div>
                <div class="menu-item px-5">
                    <a href="{{ route('profile.index') }}" class="menu-link px-5">
                        Profile Settings
                    </a>
                </div>
                <div class="menu-item px-5">
                    <a href="{{ route('reset_password.index') }}" class="menu-link px-5">
                        <span class="menu-text">Change Password</span>
                    </a>
                </div>
                @if (Auth::user()->type == 'operation')
                    <div class="menu-item px-5">
                        <a href="{{ route('auth.redirect.operation') }}" class="menu-link px-5">
                            <span class="menu-text">Switch to Operation</span>
                        </a>
                    </div>
                @endif
                <div class="menu-item px-5">
                    <a href="{{ route('auth.logout') }}" class="menu-link px-5">Sign Out</a>
                </div>
            </div>
        </div>
        <div class="app-navbar-item d-lg-none ms-2 me-n3" title="Show header menu">
            <div class="btn btn-icon btn-active-color-primary w-35px h-35px" id="kt_app_header_menu_toggle">
                <span class="svg-icon svg-icon-1">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M13 11H3C2.4 11 2 10.6 2 10V9C2 8.4 2.4 8 3 8H13C13.6 8 14 8.4 14 9V10C14 10.6 13.6 11 13 11ZM22 5V4C22 3.4 21.6 3 21 3H3C2.4 3 2 3.4 2 4V5C2 5.6 2.4 6 3 6H21C21.6 6 22 5.6 22 5Z"
                            fill="currentColor" />
                        <path opacity="0.3"
                            d="M21 16H3C2.4 16 2 15.6 2 15V14C2 13.4 2.4 13 3 13H21C21.6 13 22 13.4 22 14V15C22 15.6 21.6 16 21 16ZM14 20V19C14 18.4 13.6 18 13 18H3C2.4 18 2 18.4 2 19V20C2 20.6 2.4 21 3 21H13C13.6 21 14 20.6 14 20Z"
                            fill="currentColor" />
                    </svg>
                </span>
            </div>
        </div>
    </div>

</div>
