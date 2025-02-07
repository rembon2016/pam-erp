<!-- Sidebar -->
@if (!Route::is(['index-two', 'index-three', 'index-four', 'index-five']))
    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <nav class="greedys sidebar-horizantal">
                    <ul class="list-inline-item list-unstyled links">
                        <li class="menu-title"><span>Main</span></li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="{{ url('/') }}"
                                        class="{{ Request::is('index', '/') ? 'active' : '' }}">Admin Dashboard</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="{{ url('chat') }}"
                                        class="{{ Request::is('chat') ? 'active' : '' }}">Chat</a></li>
                                <li><a href="{{ url('calendar') }}"
                                        class="{{ Request::is('calendar') ? 'active' : '' }}">Calendar</a></li>
                                <li><a href="{{ url('inbox') }}"
                                        class="{{ Request::is('inbox') ? 'active' : '' }}">Email</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-user"></i> <span> Super Admin</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="{{ url('dashboard') }}"
                                        class="{{ Request::is('dashboard') ? 'active' : '' }}">Dashboard</a></li>
                                <li><a class="{{ Request::is('companies') ? 'active' : '' }}"
                                        href="{{ url('companies') }}">Companies</a></li>
                                <li><a class="{{ Request::is('subscription') ? 'active' : '' }}"
                                        href="{{ url('subscription') }}">Subscription</a></li>
                                <li><a class="{{ Request::is('packages', 'plans-list') ? 'active' : '' }}"
                                        href="{{ url('packages') }}">Packages</a></li>
                                <li><a class="{{ Request::is('domain') ? 'active' : '' }}"
                                        href="{{ url('domain') }}">Domain</a></li>
                                <li><a class="{{ Request::is('purchase-transaction') ? 'active' : '' }}"
                                        href="{{ url('purchase-transaction') }}">Purchase Transaction</a></li>
                            </ul>
                        </li>

                        <li class="submenu">
                            <a href="#"><i class="fe fe-users"></i><span>Customers</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('customers', 'add-customer', 'edit-customer', 'active-customers', 'deactive-customers') ? 'active' : '' }}"
                                        href="{{ url('customers') }}"><i class="fe fe-users"></i>
                                        <span>Customers</span></a></li>
                                <li>
                                    <a class="{{ Request::is('customer-details') ? 'active' : '' }}"
                                        href="{{ url('customer-details') }}"><i class="fe fe-file"></i> <span>Customer
                                            Details</span></a>
                                </li>
                                <li>
                                    <a class="{{ Request::is('vendors', 'ledger', 'customers-ledger') ? 'active' : '' }}"
                                        href="{{ url('vendors') }}"><i class="fe fe-user"></i> <span>Vendors</span></a>
                                </li>
                            </ul>
                        </li>

                        <li class="menu-title"><span>Inventory</span></li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('product-list', 'add-products', 'edit-products') ? 'active' : '' }}"
                                        href="{{ url('product-list') }}">Product List</a></li>
                                <li><a class="{{ Request::is('category') ? 'active' : '' }}"
                                        href="{{ url('category') }}">Category</a></li>

                                <li><a class="{{ Request::is('units') ? 'active' : '' }}"
                                        href="{{ url('units') }}">Units</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('inventory', 'inventory-history') ? 'active' : '' }}"
                                href="{{ url('inventory') }}"><i class="fe fe-user"></i> <span>Inventory</span></a>
                        </li>

                        <li class="submenu">
                            <a href="#"><i class="fe fe-file-plus"></i><span>Signature</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a
                                        class="{{ Request::is('signature-list') ? 'active' : '' }}"href="{{ url('signature-list') }}"><i
                                            class="fe fe-clipboard"></i> <span>List of
                                            Signature</span></a></li>
                                <li><a
                                        class="{{ Request::is('signature-invoice') ? 'active' : '' }}"href="{{ url('signature-invoice') }}"><i
                                            class="fe fe-box"></i> <span>Signature
                                            Invoice</span></a></li>

                            </ul>
                        </li>

                        <li class="menu-title"><span>Sales</span></li>
                        <li class="submenu">
                            <a class="{{ Request::is('invoices', 'invoices-paid', 'invoices-overdue', 'invoices-cancelled', 'invoices-recurring', 'invoices-unpaid', 'invoices-refunded', 'invoices-draft', 'invoice-details-admin', 'invoice-details', 'invoice-template') ? 'active' : '' }}"
                                href="{{ url('invoices') }}"><i class="fe fe-file"></i> <span>Invoices</span><span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('invoices', 'invoices-paid', 'invoices-overdue', 'invoices-cancelled', 'invoices-recurring', 'invoices-unpaid', 'invoices-refunded', 'invoices-draft') ? 'active' : '' }}"
                                        href="{{ url('invoices') }}">Invoices List</a></li>
                                <li><a class="{{ Request::is('invoice-details-admin') ? 'active' : '' }}"
                                        href="{{ url('invoice-details-admin') }}">Invoice Details (Admin)</a></li>
                                <li><a class="{{ Request::is('invoice-details') ? 'active' : '' }}"
                                        href="{{ url('invoice-details') }}">Invoice Details (Customer)</a></li>
                                <li><a class="{{ Request::is('invoice-template') ? 'active' : '' }}"
                                        href="{{ url('invoice-template') }}">Invoice Templates</a></li>
                            </ul>
                        </li>
                    </ul>
                    <button class="viewmoremenu">More Menu</button>
                    <ul class="hidden-links hidden">
                        <li>
                            <a class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"
                                href="{{ url('recurring-invoices') }}"><i class="fe fe-clipboard"></i> <span>Recurring
                                    Invoices</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('credit-notes', 'add-credit-notes', 'edit-credit-notes') ? 'active' : '' }}"
                                href="{{ url('credit-notes') }}"><i class="fe fe-edit"></i> <span>Credit
                                    Notes</span></a>
                        </li>
                        <li class="menu-title"><span>Purchases</span></li>
                        <li>
                            <a class="{{ Request::is('purchases', 'add-purchases', 'edit-purchases', 'add-purchase-return', 'edit-purchase-return') ? 'active' : '' }}"
                                href="{{ url('purchases') }}"><i class="fe fe-shopping-cart"></i>
                                <span>Purchases</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('purchase-orders', 'add-purchases-order', 'edit-purchases-order') ? 'active' : '' }}"
                                href="{{ url('purchase-orders') }}"><i class="fe fe-shopping-bag"></i> <span>Purchase
                                    Orders</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('debit-notes') ? 'active' : '' }}"
                                href="{{ url('debit-notes') }}"><i class="fe fe-file-text"></i> <span>Debit
                                    Notes</span></a>
                        </li>

                        <li class="menu-title"><span>Finance & Accounts</span></li>
                        <li>
                            <a class="{{ Request::is('expenses') ? 'active' : '' }}" href="{{ url('expenses') }}"><i
                                    class="fe fe-file-plus"></i> <span>Expenses</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('payments') ? 'active' : '' }}" href="{{ url('payments') }}"><i
                                    class="fe fe-credit-card"></i> <span>Payments</span></a>
                        </li>

                        <li class="menu-title"><span>Quotations</span></li>
                        <li>
                            <a class="{{ Request::is('quotations', 'add-quotations', 'edit-quotations') ? 'active' : '' }}"
                                href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                                <span>Quotations</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('delivery-challans', 'add-delivery-challans', 'edit-delivery-challans') ? 'active' : '' }}"
                                href="{{ url('delivery-challans') }}"><i class="fe fe-file-text"></i> <span>Delivery
                                    Challans</span></a>
                        </li>

                        <li class="menu-title"><span>Reports</span></li>
                        <li>
                            <a class="{{ Request::is('payment-summary') ? 'active' : '' }}"
                                href="{{ url('payment-summary') }}"><i class="fe fe-credit-card"></i> <span>Payment
                                    Summary</span></a>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-box"></i><span>Reports</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('expense-report') ? 'active' : '' }}"
                                        href="{{ url('expense-report') }}">Expense Report</a></li>
                                <li><a class="{{ Request::is('purchase-report') ? 'active' : '' }}"
                                        href="{{ url('purchase-report') }}">Purchase Report</a></li>
                                <li><a class="{{ Request::is('purchase-return') ? 'active' : '' }}"
                                        href="{{ url('purchase-return') }}">Purchase Return Report</a></li>
                                <li><a class="{{ Request::is('sales-report') ? 'active' : '' }}"
                                        href="{{ url('sales-report') }}">Sales Report</a></li>
                                <li><a class="{{ Request::is('sales-return-report') ? 'active' : '' }}"
                                        href="{{ url('sales-return-report') }}">Sales Return Report</a></li>
                                <li><a class="{{ Request::is('quotation-report') ? 'active' : '' }}"
                                        href="{{ url('quotation-report') }}">Quotation Report</a></li>
                                <li><a class="{{ Request::is('payment-report') ? 'active' : '' }}"
                                        href="{{ url('payment-report') }}">Payment Report</a></li>
                                <li><a class="{{ Request::is('stock-report') ? 'active' : '' }}"
                                        href="{{ url('stock-report') }}">Stock Report</a></li>
                                <li><a class="{{ Request::is('low-stock-report') ? 'active' : '' }}"
                                        href="{{ url('low-stock-report') }}">Low Stock Report</a></li>
                                <li><a class="{{ Request::is('income-report') ? 'active' : '' }}"
                                        href="{{ url('income-report') }}">Income Report</a></li>
                                <li><a class="{{ Request::is('tax-purchase', 'tax-sales') ? 'active' : '' }}"
                                        href="{{ url('tax-purchase') }}">Tax Report</a></li>
                                <li><a class="{{ Request::is('profit-loss-list') ? 'active' : '' }}"
                                        href="{{ url('profit-loss-list') }}">Profit & Loss</a></li>
                            </ul>
                        </li>
                        </li>

                        <li class="menu-title"><span>User Management</span></li>
                        <li>
                            <a class="{{ Request::is('users') ? 'active' : '' }}" href="{{ url('users') }}"><i
                                    class="fe fe-user"></i> <span>Users</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('roles-permission', 'permission') ? 'active' : '' }}"
                                href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles &
                                    Permission</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                                href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i> <span>Delete
                                    Account
                                    Request</span></a>
                        </li>

                        <li class="menu-title"><span>Membership</span></li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('membership-plans') ? 'active' : '' }}"
                                        href="{{ url('membership-plans') }}">Membership Plans</a></li>
                                <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                        href="{{ url('membership-addons') }}">Membership Addons</a></li>
                                <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                        href="{{ url('subscribers') }}">Subscribers</a></li>
                                <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                        href="{{ url('transactions') }}">Transactions</a></li>
                            </ul>
                        </li>

                        <li class="menu-title"><span>Content (CMS)</span></li>
                        <li>
                            <a class="{{ Request::is('pages') ? 'active' : '' }}" href="{{ url('pages') }}"><i
                                    class="fe fe-folder"></i> <span>Pages</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('all-blogs', 'inactive-blog') ? 'active' : '' }}"
                                        href="{{ url('all-blogs') }}">All Blogs</a></li>
                                <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                        href="{{ url('categories') }}">Categories</a></li>
                                <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                        href="{{ url('blog-comments') }}">Blog Comments</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                        href="{{ url('countries') }}">Countries</a></li>
                                <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                        href="{{ url('states') }}">States</a></li>
                                <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                        href="{{ url('cities') }}">Cities</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                                href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                                <span>Testimonials</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                    class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                        </li>

                        <li class="menu-title"><span>Support</span></li>
                        <li>
                            <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                                href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                    Messages</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('tickets', 'tickets-list-open', 'tickets-list-resolved', 'tickets-list-pending', 'tickets-list-closed') ? 'active' : '' }}"
                                        href="{{ url('tickets') }}">Tickets</a></li>
                                <li><a class="{{ Request::is('tickets-list', 'tickets-open', 'tickets-resolved', 'tickets-pending', 'tickets-closed') ? 'active' : '' }}"
                                        href="{{ url('tickets-list') }}">Tickets List</a></li>
                                <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                        href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                                <li><a class="{{ Request::is('ticket-details') ? 'active' : '' }}"
                                        href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                            </ul>
                        </li>

                        <li class="menu-title"><span>Pages</span></li>
                        <li>
                            <a class="{{ Request::is('profile') ? 'active' : '' }}" href="{{ url('profile') }}"><i
                                    class="fe fe-user"></i> <span>Profile</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-lock"></i> <span> Authentication </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('login') ? 'active' : '' }}"
                                        href="{{ url('login') }}"> Login </a></li>
                                <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                        href="{{ url('register') }}"> Register </a></li>
                                <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                        href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                                <li><a class="{{ Request::is('lock-screen') ? 'active' : '' }}"
                                        href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('error-404') ? 'active' : '' }}"
                                href="{{ url('error-404') }}"><i class="fe fe-x-square"></i> <span>Error
                                    Pages</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                                href="{{ url('blank-page') }}"><i class="fe fe-file"></i> <span>Blank
                                    Page</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('maps-vector') ? 'active' : '' }}"
                                href="{{ url('maps-vector') }}"><i class="fe fe-image"></i> <span>Vector
                                    Maps</span></a>
                        </li>

                        <li class="menu-title">
                            <span>UI Interface</span>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                        href="{{ url('alerts') }}">Alerts</a></li>
                                <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                        href="{{ url('accordions') }}">Accordions</a></li>
                                <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                        href="{{ url('avatar') }}">Avatar</a></li>
                                <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                        href="{{ url('badges') }}">Badges</a></li>
                                <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                        href="{{ url('buttons') }}">Buttons</a></li>
                                <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                        href="{{ url('buttongroup') }}">Button Group</a></li>
                                <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                        href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                                <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                        href="{{ url('cards') }}">Cards</a></li>
                                <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                        href="{{ url('carousel') }}">Carousel</a></li>
                                <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                        href="{{ url('dropdowns') }}">Dropdowns</a></li>
                                <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                        href="{{ url('grid') }}">Grid</a></li>
                                <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                        href="{{ url('images') }}">Images</a></li>
                                <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                        href="{{ url('lightbox') }}">Lightbox</a></li>
                                <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                        href="{{ url('media') }}">Media</a></li>
                                <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                        href="{{ url('modal') }}">Modals</a></li>
                                <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                        href="{{ url('offcanvas') }}">Offcanvas</a></li>
                                <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                        href="{{ url('pagination') }}">Pagination</a></li>
                                <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                        href="{{ url('popover') }}">Popover</a></li>
                                <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                        href="{{ url('progress') }}">Progress Bars</a></li>
                                <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                        href="{{ url('placeholders') }}">Placeholders</a></li>
                                <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                        href="{{ url('rangeslider') }}">Range Slider</a></li>
                                <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                        href="{{ url('spinners') }}">Spinner</a></li>
                                <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                        href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                                <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                        href="{{ url('tab') }}">Tabs</a></li>
                                <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                        href="{{ url('toastr') }}">Toasts</a></li>
                                <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                        href="{{ url('tooltip') }}">Tooltip</a></li>
                                <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                        href="{{ url('typography') }}">Typography</a></li>
                                <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                        href="{{ url('video') }}">Video</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                        href="{{ url('ribbon') }}">Ribbon</a></li>
                                <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                        href="{{ url('clipboard') }}">Clipboard</a></li>
                                <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                        href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                                <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                        href="{{ url('rating') }}">Rating</a></li>
                                <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                        href="{{ url('text-editor') }}">Text Editor</a></li>
                                <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                        href="{{ url('counter') }}">Counter</a></li>
                                <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                        href="{{ url('scrollbar') }}">Scrollbar</a></li>
                                <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                        href="{{ url('notification') }}">Notification</a></li>
                                <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                        href="{{ url('stickynote') }}">Sticky Note</a></li>
                                <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                        href="{{ url('timeline') }}">Timeline</a></li>
                                <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                        href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                                <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                        href="{{ url('form-wizard') }}">Form Wizard</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                        href="{{ url('chart-apex') }}">Apex Charts</a></li>
                                <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                        href="{{ url('chart-js') }}">Chart Js</a></li>
                                <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                        href="{{ url('chart-morris') }}">Morris Charts</a></li>
                                <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                        href="{{ url('chart-flot') }}">Flot Charts</a></li>
                                <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                        href="{{ url('chart-peity') }}">Peity Charts</a></li>
                                <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                        href="{{ url('chart-c3') }}">C3 Charts</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                        href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                                <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                        href="{{ url('icon-feather') }}">Feather Icons</a></li>
                                <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                        href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                                <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                        href="{{ url('icon-material') }}">Material Icons</a></li>
                                <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                        href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                                <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                        href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                                <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                        href="{{ url('icon-themify') }}">Themify Icons</a></li>
                                <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                        href="{{ url('icon-weather') }}">Weather Icons</a></li>
                                <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                        href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                                <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                        href="{{ url('icon-flag') }}">Flag Icons</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                        href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                                <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                        href="{{ url('form-input-groups') }}">Input Groups </a></li>
                                <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                        href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                                <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                        href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                                <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                        href="{{ url('form-mask') }}">Form Mask </a></li>
                                <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                        href="{{ url('form-validation') }}">Form Validation </a></li>
                                <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                        href="{{ url('form-select2') }}">Form Select2 </a></li>
                                <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                        href="{{ url('form-fileupload') }}">File Upload </a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                        href="{{ url('tables-basic') }}">Basic Tables </a></li>
                                <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                        href="{{ url('data-tables') }}">Data Table </a></li>
                            </ul>
                        </li>

                        <li class="menu-title"><span>Settings</span></li>
                        <li>
                            <a class="{{ Request::is('settings', 'company-settings', 'invoice-settings', 'template-invoice', 'payment-settings', 'bank-account', 'tax-rates', 'plan-billing', 'two-factor', 'custom-filed', 'email-settings', 'preferences', 'saas-settings', 'seo-settings', 'email-template') ? 'active' : '' }}"
                                href="{{ url('settings') }}"><i class="fe fe-settings"></i>
                                <span>Settings</span></a>
                        </li>
                        <li class="menu-title">
                            <span>Extras</span>
                        </li>
                        <li>
                            <a href="#"><i class="fe fe-file-text"></i> <span>Documentation</span></a>
                        </li>
                        <li>
                            <a href="javascript:void(0);"><i class="fe fe-lock"></i> <span>Change Log</span> <span
                                    class="badge badge-primary ms-auto">v2.0.4</span></a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"><i class="fa fa-list"></i> <span>Multi Level</span> <span
                                    class="menu-arrow"></span></a>
                            <ul style="display: none;">
                                <li class="submenu">
                                    <a href="javascript:void(0);"> <span>Level 1</span> <span
                                            class="menu-arrow"></span></a>
                                    <ul style="display: none;" class="level2">
                                        <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"> <span> Level 2</span> <span
                                                    class="menu-arrow"></span></a>
                                            <ul style="display: none;" class="level3">
                                                <li><a href="javascript:void(0);">Level 3</a></li>
                                                <li><a href="javascript:void(0);">Level 3</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:void(0);"> <span>Level 1</span></a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="{{ url('login') }}"><i class="fe fe-power"></i> <span>Logout</span></a>
                        </li>
                    </ul>
                    <!-- /Settings -->
                </nav>
                <ul class="sidebar-vertical">
                    <!-- Main -->
                    <li class="menu-title"><span>Main</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('index', '/') ? 'active' : '' }}"
                                    href="{{ url('/') }}">Admin Dashboard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="{{ url('chat') }}"
                                    class="{{ Request::is('chat') ? 'active' : '' }}">Chat</a></li>
                            <li><a href="{{ url('calendar') }}"
                                    class="{{ Request::is('calendar') ? 'active' : '' }}">Calendar</a></li>
                            <li><a href="{{ url('inbox') }}"
                                    class="{{ Request::is('inbox') ? 'active' : '' }}">Email</a></li>
                        </ul>
                    </li>
                    <!-- /Main -->

                    <li class="submenu">
                        <a href="#"><i class="fe fe-user"></i> <span> Super Admin</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="{{ url('dashboard') }}"
                                    class="{{ Request::is('dashboard') ? 'active' : '' }}">Dashboard</a></li>
                            <li><a href="{{ url('companies') }}"
                                    class="{{ Request::is('companies') ? 'active' : '' }}">Companies</a></li>
                            <li><a href="{{ url('subscription') }}"
                                    class="{{ Request::is('subscription') ? 'active' : '' }}">Subscription</a></li>
                            <li><a href="{{ url('packages') }}"
                                    class="{{ Request::is('packages', 'plans-list') ? 'active' : '' }}">Packages</a>
                            </li>
                            <li><a href="{{ url('domain') }}"
                                    class="{{ Request::is('domain') ? 'active' : '' }}">Domain</a></li>
                            <li><a href="{{ url('purchase-transaction') }}"
                                    class="{{ Request::is('purchase-transaction') ? 'active' : '' }}">Purchase
                                    Transaction</a></li>
                        </ul>
                    </li>

                    <!-- Customers -->
                    <li class="menu-title"><span>Customers</span></li>
                    <li>
                        <a href="{{ url('customers') }}"
                            class="{{ Request::is('customers', 'add-customer', 'edit-customer', 'active-customers', 'deactive-customers') ? 'active' : '' }}"><i
                                class="fe fe-users"></i>
                            <span>Customers</span></a>
                    </li>
                    <li>
                        <a href="{{ url('customer-details') }}"
                            class="{{ Request::is('customer-details') ? 'active' : '' }}"><i class="fe fe-file"></i>
                            <span>Customer
                                Details</span></a>
                    </li>
                    <li>
                        <a href="{{ url('vendors') }}"
                            class="{{ Request::is('vendors', 'ledger', 'customers-ledger') ? 'active' : '' }}"><i
                                class="fe fe-user"></i>
                            <span>Vendors</span></a>
                    </li>
                    <!-- /Customers -->

                    <!-- Inventory -->
                    <li class="menu-title"><span>Inventory</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="{{ url('product-list') }}"
                                    class="{{ Request::is('product-list', 'add-products', 'edit-products') ? 'active' : '' }}">Product
                                    List</a></li>
                            <li><a href="{{ url('category') }}"
                                    class="{{ Request::is('category') ? 'active' : '' }}">Category</a></li>

                            <li><a href="{{ url('units') }}"
                                    class="{{ Request::is('units') ? 'active' : '' }}">Units</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="{{ url('inventory') }}"
                            class="{{ Request::is('inventory', 'inventory-history') ? 'active' : '' }}"><i
                                class="fe fe-user"></i>
                            <span>Inventory</span></a>
                    </li>
                    <!-- /Inventory -->

                    <!-- Signature -->
                    <li class="menu-title"><span>Signature</span></li>
                    <li>
                        <a href="{{ url('signature-list') }}"
                            class="{{ Request::is('signature-list') ? 'active' : '' }}"><i
                                class="fe fe-clipboard"></i> <span>List of
                                Signature</span></a>
                        <a href="{{ url('signature-invoice') }}"
                            class="{{ Request::is('signature-invoice') ? 'active' : '' }}"><i class="fe fe-box"></i>
                            <span>Signature
                                Invoice</span></a>
                    </li>
                    <!-- /Signature -->

                    <!-- Sales -->
                    <li class="menu-title"><span>Sales</span></li>
                    <li class="submenu">

                        <a href="#"><i class="fe fe-file"></i> <span>Invoices</span><span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a href="{{ url('invoices') }}"
                                    class="{{ Request::is('invoices', 'invoices-paid', 'invoices-overdue', 'invoices-cancelled', 'invoices-recurring', 'invoices-unpaid', 'invoices-refunded', 'invoices-draft') ? 'active' : '' }}">Invoices
                                    List</a></li>
                            <li><a href="{{ url('invoice-details-admin') }}"
                                    class="{{ Request::is('invoice-details-admin') ? 'active' : '' }}">Invoice
                                    Details (Admin)</a></li>
                            <li><a href="{{ url('invoice-details') }}"
                                    class="{{ Request::is('invoice-details') ? 'active' : '' }}">Invoice Details
                                    (Customer)</a></li>
                            <li><a href="{{ url('invoice-template') }}"
                                    class="{{ Request::is('invoice-template') ? 'active' : '' }}">Invoice
                                    Templates</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="{{ url('recurring-invoices') }}"
                            class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"><i
                                class="fe fe-clipboard"></i> <span>Recurring
                                Invoices</span></a>
                    </li>
                    <li>
                        <a href="{{ url('credit-notes') }}"
                            class="{{ Request::is('credit-notes', 'add-credit-notes', 'edit-credit-notes') ? 'active' : '' }}"><i
                                class="fe fe-edit"></i>
                            <span>Credit Notes</span></a>
                    </li>
                    <!-- /Sales -->

                    <!-- Purchases -->
                    <li class="menu-title"><span>Purchases</span></li>
                    <li>
                        <a href="{{ url('purchases') }}"
                            class="{{ Request::is('purchases', 'add-purchases', 'edit-purchases', 'add-purchase-return', 'edit-purchase-return') ? 'active' : '' }}"><i
                                class="fe fe-shopping-cart"></i>
                            <span>Purchases</span></a>
                    </li>
                    <li>
                        <a href="{{ url('purchase-orders') }}"
                            class="{{ Request::is('purchase-orders', 'add-purchases-order', 'edit-purchases-order') ? 'active' : '' }}"><i
                                class="fe fe-shopping-bag"></i> <span>Purchase
                                Orders</span></a>
                    </li>
                    <li>
                        <a href="{{ url('debit-notes') }}"
                            class="{{ Request::is('debit-notes') ? 'active' : '' }}"><i class="fe fe-file-text"></i>
                            <span>Debit
                                Notes</span></a>
                    </li>
                    <!-- /Purchases -->

                    <!-- Finance & Accounts -->
                    <li class="menu-title"><span>Finance & Accounts</span></li>
                    <li>
                        <a href="{{ url('expenses') }}" class="{{ Request::is('expenses') ? 'active' : '' }}"><i
                                class="fe fe-file-plus"></i> <span>Expenses</span></a>
                    </li>
                    <li>
                        <a href="{{ url('payments') }}" class="{{ Request::is('payments') ? 'active' : '' }}"><i
                                class="fe fe-credit-card"></i> <span>Payments</span></a>
                    </li>
                    <!-- /Finance & Accounts -->

                    <!-- Quotations -->
                    <li class="menu-title"><span>Quotations</span></li>
                    <li>
                        <a href="{{ url('quotations') }}"
                            class="{{ Request::is('quotations', 'add-quotations', 'edit-quotations') ? 'active' : '' }}"><i
                                class="fe fe-clipboard"></i>
                            <span>Quotations</span></a>
                    </li>
                    <li>
                        <a href="{{ url('delivery-challans') }}"
                            class="{{ Request::is('delivery-challans', 'add-delivery-challans', 'edit-delivery-challans') ? 'active' : '' }}"><i
                                class="fe fe-file-text"></i> <span>Delivery
                                Challans</span></a>
                    </li>
                    <!-- /Quotations -->

                    <!-- Reports -->
                    <li class="menu-title"><span>Reports</span></li>
                    <li>
                        <a href="{{ url('payment-summary') }}"
                            class="{{ Request::is('payment-summary') ? 'active' : '' }}"><i
                                class="fe fe-credit-card"></i> <span>Payment
                                Summary</span></a>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-box"></i><span>Reports</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('expense-report') ? 'active' : '' }}"
                                    href="{{ url('expense-report') }}">Expense Report</a></li>
                            <li><a class="{{ Request::is('purchase-report') ? 'active' : '' }}"
                                    href="{{ url('purchase-report') }}">Purchase Report</a></li>
                            <li><a class="{{ Request::is('purchase-return') ? 'active' : '' }}"
                                    href="{{ url('purchase-return') }}">Purchase Return Report</a></li>
                            <li><a class="{{ Request::is('sales-report') ? 'active' : '' }}"
                                    href="{{ url('sales-report') }}">Sales Report</a></li>
                            <li><a class="{{ Request::is('sales-return-report') ? 'active' : '' }}"
                                    href="{{ url('sales-return-report') }}">Sales Return Report</a></li>
                            <li><a class="{{ Request::is('quotation-report') ? 'active' : '' }}"
                                    href="{{ url('quotation-report') }}">Quotation Report</a></li>
                            <li><a class="{{ Request::is('payment-report') ? 'active' : '' }}"
                                    href="{{ url('payment-report') }}">Payment Report</a></li>
                            <li><a class="{{ Request::is('stock-report') ? 'active' : '' }}"
                                    href="{{ url('stock-report') }}">Stock Report</a></li>
                            <li><a class="{{ Request::is('low-stock-report') ? 'active' : '' }}"
                                    href="{{ url('low-stock-report') }}">Low Stock Report</a></li>
                            <li><a class="{{ Request::is('income-report') ? 'active' : '' }}"
                                    href="{{ url('income-report') }}">Income Report</a></li>
                            <li><a class="{{ Request::is('tax-purchase', 'tax-sales') ? 'active' : '' }}"
                                    href="{{ url('tax-purchase') }}">Tax Report</a></li>
                            <li><a class="{{ Request::is('profit-loss-list') ? 'active' : '' }}"
                                    href="{{ url('profit-loss-list') }}">Profit & Loss</a></li>
                        </ul>
                    </li>
                    </li>
                    <!-- /Reports -->

                    <!-- User Management -->
                    <li class="menu-title"><span>User Management</span></li>
                    <li>
                        <a class="{{ Request::is('users') ? 'active' : '' }}" href="{{ url('users') }}"><i
                                class="fe fe-user"></i> <span>Users</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('roles-permission', 'permission') ? 'active' : '' }}"
                            href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles &
                                Permission</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                            href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i> <span>Delete
                                Account
                                Request</span></a>
                    </li>
                    <!-- /User Management -->

                    <!-- Membership) -->
                    <li class="menu-title"><span>Membership</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('membership-plans') ? 'active' : '' }}"
                                    href="{{ url('membership-plans') }}">Membership Plans</a></li>
                            <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                    href="{{ url('membership-addons') }}">Membership Addons</a></li>
                            <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                    href="{{ url('subscribers') }}">Subscribers</a></li>
                            <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                    href="{{ url('transactions') }}">Transactions</a></li>
                        </ul>
                    </li>
                    <!-- /Membership) -->

                    <!-- Content (CMS) -->
                    <li class="menu-title"><span>Content (CMS)</span></li>
                    <li>
                        <a href="{{ url('pages') }}" class="{{ Request::is('pages') ? 'active' : '' }}"><i
                                class="fe fe-folder"></i> <span>Pages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('all-blogs', 'inactive-blog') ? 'active' : '' }}"
                                    href="{{ url('all-blogs') }}">All Blogs</a></li>
                            <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                    href="{{ url('categories') }}">Categories</a></li>
                            <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                    href="{{ url('blog-comments') }}">Blog Comments</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                    href="{{ url('countries') }}">Countries</a></li>
                            <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                    href="{{ url('states') }}">States</a></li>
                            <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                    href="{{ url('cities') }}">Cities</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                            href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                            <span>Testimonials</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                    </li>
                    <!-- /Content (CMS) -->

                    <!-- Support -->
                    <li class="menu-title"><span>Support</span></li>
                    <li>
                        <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                            href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                Messages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('tickets', 'tickets-list-open', 'tickets-list-resolved', 'tickets-list-pending', 'tickets-list-closed') ? 'active' : '' }}"
                                    href="{{ url('tickets') }}">Tickets</a></li>
                            <li><a class="{{ Request::is('tickets-list', 'tickets-open', 'tickets-resolved', 'tickets-pending', 'tickets-closed') ? 'active' : '' }}"
                                    href="{{ url('tickets-list') }}">Tickets
                                    List</a></li>
                            <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                    href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                            <li><a class="{{ Request::is('ticket-details') ? 'active' : '' }}"
                                    href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                        </ul>
                    </li>
                    <!-- /Support -->



                    <!-- Pages -->
                    <li class="menu-title"><span>Pages</span></li>
                    <li>
                        <a class="{{ Request::is('profile') ? 'active' : '' }}" href="{{ url('profile') }}"><i
                                class="fe fe-user"></i> <span>Profile</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-lock"></i> <span> Authentication </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('login') ? 'active' : '' }}" href="{{ url('login') }}">
                                    Login </a></li>
                            <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                    href="{{ url('register') }}"> Register </a></li>
                            <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                    href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                            <li><a class="{{ Request::is('lock-screen') ? 'active' : '' }}"
                                    href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('error-404') ? 'active' : '' }}" href="{{ url('error-404') }}"><i
                                class="fe fe-x-square"></i> <span>Error Pages</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                            href="{{ url('blank-page') }}"><i class="fe fe-file"></i> <span>Blank Page</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('maps-vector') ? 'active' : '' }}"
                            href="{{ url('maps-vector') }}"><i class="fe fe-image"></i> <span>Vector Maps</span></a>
                    </li>
                    <!-- /Pages -->

                    <!-- UI Interface -->
                    <li class="menu-title">
                        <span>UI Interface</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                    href="{{ url('alerts') }}">Alerts</a></li>
                            <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                    href="{{ url('accordions') }}">Accordions</a></li>
                            <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                    href="{{ url('avatar') }}">Avatar</a></li>
                            <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                    href="{{ url('badges') }}">Badges</a></li>
                            <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                    href="{{ url('buttons') }}">Buttons</a></li>
                            <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                    href="{{ url('buttongroup') }}">Button Group</a></li>
                            <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                    href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                            <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                    href="{{ url('cards') }}">Cards</a></li>
                            <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                    href="{{ url('carousel') }}">Carousel</a></li>
                            <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                    href="{{ url('dropdowns') }}">Dropdowns</a></li>
                            <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                    href="{{ url('grid') }}">Grid</a></li>
                            <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                    href="{{ url('images') }}">Images</a></li>
                            <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                    href="{{ url('lightbox') }}">Lightbox</a></li>
                            <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                    href="{{ url('media') }}">Media</a></li>
                            <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                    href="{{ url('modal') }}">Modals</a></li>
                            <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                    href="{{ url('offcanvas') }}">Offcanvas</a></li>
                            <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                    href="{{ url('pagination') }}">Pagination</a></li>
                            <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                    href="{{ url('popover') }}">Popover</a></li>
                            <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                    href="{{ url('progress') }}">Progress Bars</a></li>
                            <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                    href="{{ url('placeholders') }}">Placeholders</a></li>
                            <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                    href="{{ url('rangeslider') }}">Range Slider</a></li>
                            <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                    href="{{ url('spinners') }}">Spinner</a></li>
                            <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                    href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                            <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                    href="{{ url('tab') }}">Tabs</a></li>
                            <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                    href="{{ url('toastr') }}">Toasts</a></li>
                            <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                    href="{{ url('tooltip') }}">Tooltip</a></li>
                            <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                    href="{{ url('typography') }}">Typography</a></li>
                            <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                    href="{{ url('video') }}">Video</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                    href="{{ url('ribbon') }}">Ribbon</a></li>
                            <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                    href="{{ url('clipboard') }}">Clipboard</a></li>
                            <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                    href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                            <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                    href="{{ url('rating') }}">Rating</a></li>
                            <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                    href="{{ url('text-editor') }}">Text Editor</a></li>
                            <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                    href="{{ url('counter') }}">Counter</a></li>
                            <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                    href="{{ url('scrollbar') }}">Scrollbar</a></li>
                            <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                    href="{{ url('notification') }}">Notification</a></li>
                            <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                    href="{{ url('stickynote') }}">Sticky Note</a></li>
                            <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                    href="{{ url('timeline') }}">Timeline</a></li>
                            <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                    href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                            <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                    href="{{ url('form-wizard') }}">Form Wizard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                    href="{{ url('chart-apex') }}">Apex Charts</a></li>
                            <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                    href="{{ url('chart-js') }}">Chart Js</a></li>
                            <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                    href="{{ url('chart-morris') }}">Morris Charts</a></li>
                            <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                    href="{{ url('chart-flot') }}">Flot Charts</a></li>
                            <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                    href="{{ url('chart-peity') }}">Peity Charts</a></li>
                            <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                    href="{{ url('chart-c3') }}">C3 Charts</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                    href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                            <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                    href="{{ url('icon-feather') }}">Feather Icons</a></li>
                            <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                    href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                            <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                    href="{{ url('icon-material') }}">Material Icons</a></li>
                            <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                    href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                            <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                    href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                            <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                    href="{{ url('icon-themify') }}">Themify Icons</a></li>
                            <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                    href="{{ url('icon-weather') }}">Weather Icons</a></li>
                            <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                    href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                            <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                    href="{{ url('icon-flag') }}">Flag Icons</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                    href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                            <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                    href="{{ url('form-input-groups') }}">Input Groups </a></li>
                            <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                    href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                            <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                    href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                            <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                    href="{{ url('form-mask') }}">Form Mask </a></li>
                            <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                    href="{{ url('form-validation') }}">Form Validation </a></li>
                            <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                    href="{{ url('form-select2') }}">Form Select2 </a></li>
                            <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                    href="{{ url('form-fileupload') }}">File Upload </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                    href="{{ url('tables-basic') }}">Basic Tables </a></li>
                            <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                    href="{{ url('data-tables') }}">Data Table </a></li>
                        </ul>
                    </li>
                    <!-- /UI Interface -->

                    <!-- Settings -->
                    <li class="menu-title"><span>Settings</span></li>
                    <li>
                        <a class="{{ Request::is('settings', 'company-settings', 'invoice-settings', 'template-invoice', 'payment-settings', 'bank-account', 'tax-rates', 'plan-billing', 'two-factor', 'custom-filed', 'email-settings', 'preferences', 'saas-settings', 'seo-settings', 'email-template') ? 'active' : '' }}"
                            href="{{ url('settings') }}"><i class="fe fe-settings"></i> <span>Settings</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('login') ? 'active' : '' }}" href="{{ url('login') }}"><i
                                class="fe fe-power"></i> <span>Logout</span></a>
                    </li>

                    <!-- Extras -->
                    <li class="menu-title">
                        <span>Extras</span>
                    </li>
                    <li>
                        <a href="#"><i class="fe fe-file-text"></i> <span>Documentation</span></a>
                    </li>
                    <li>
                        <a href="javascript:void(0);"><i class="fe fe-lock"></i></i> <span>Change Log</span> <span
                                class="badge badge-primary ms-auto">v2.0.4</span></a>
                    </li>
                    <li class="submenu">
                        <a href="javascript:void(0);"><i class="fa fa-list"></i> <span>Multi Level</span> <span
                                class="menu-arrow"></span></a>
                        <ul style="display: none;">
                            <li class="submenu">
                                <a href="javascript:void(0);"> <span>Level 1</span> <span
                                        class="menu-arrow"></span></a>
                                <ul style="display: none;" class="level2">
                                    <li><a href="javascript:void(0);"><span>Level 2</span></a></li>
                                    <li class="submenu">
                                        <a href="javascript:void(0);"> <span> Level 2</span> <span
                                                class="menu-arrow"></span></a>
                                        <ul style="display: none;" class="level3">
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                            <li><a href="javascript:void(0);">Level 3</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:void(0);"> <span>Level 2</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0);"> <span>Level 1</span></a>
                            </li>
                        </ul>
                    </li>
                    <!-- Extras -->
                </ul>
            </div>
        </div>
    </div>
    <!-- /Sidebar -->
@endif

@if (Route::is(['index-two']))
    <div class="sidebar sidebar-two" id="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">
                <a href="{{ url('index') }}">
                    <img src="{{ URL::asset('/assets/img/logo-white.png') }}" class="img-fluid logo"
                        alt="Logo">
                </a>
                <a href="{{ url('index') }}">
                    <img src="{{ URL::asset('/assets/img/logo-small.png') }}" class="img-fluid logo-small"
                        alt="Logo">
                </a>
            </div>
        </div>
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu sidebar-menu-two">
                <!-- Main -->
                <ul>
                    <li class="menu-title"><span>Main</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('/', 'index') ? 'active' : '' }}"
                                    href="{{ url('/') }}">Admin Dashboard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chat') ? 'active' : '' }}"
                                    href="{{ url('chat') }}">Chat</a></li>
                            <li><a class="{{ Request::is('calendar') ? 'active' : '' }}"
                                    href="{{ url('calendar') }}">Calendar</a></li>
                            <li><a class="{{ Request::is('inbox') ? 'active' : '' }}"
                                    href="{{ url('inbox') }}">Email</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Main -->

                <!-- Customers -->
                <ul>
                    <li class="menu-title"><span>Customers</span></li>
                    <li>
                        <a class="{{ Request::is('customers', 'add-customer', 'edit-customer', 'active-customers', 'deactive-customers') ? 'active' : '' }}"
                            href="{{ url('customers') }}"><i class="fe fe-users"></i> <span>Customers</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('customer-details') ? 'active' : '' }}"
                            href="{{ url('customer-details') }}"><i class="fe fe-file"></i> <span>Customer
                                Details</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('vendors', 'ledger', 'customers-ledger') ? 'active' : '' }}"
                            href="{{ url('vendors') }}"><i class="fe fe-user"></i> <span>Vendors</span></a>
                    </li>
                </ul>
                <!-- /Customers -->

                <!-- Inventory -->
                <ul>
                    <li class="menu-title"><span>Inventory</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('product-list', 'add-products', 'edit-products') ? 'active' : '' }}"
                                    href="{{ url('product-list') }}">Product List</a></li>
                            <li><a class="{{ Request::is('category') ? 'active' : '' }}"
                                    href="{{ url('category') }}">Category</a></li>

                            <li><a class="{{ Request::is('units') ? 'active' : '' }}"
                                    href="{{ url('units') }}">Units</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('inventory', 'inventory-history') ? 'active' : '' }}"
                            href="{{ url('inventory') }}"><i class="fe fe-user"></i> <span>Inventory</span></a>
                    </li>
                </ul>
                <!-- /Inventory -->

                <!-- Signature -->
                <ul>
                    <li class="menu-title"><span>Signature</span></li>
                    <li>
                        <a class="{{ Request::is('signature-list') ? 'active' : '' }}"
                            href="{{ url('signature-list') }}"><i class="fe fe-clipboard"></i> <span>List of
                                Signature</span></a>
                        <a class="{{ Request::is('signature-invoice') ? 'active' : '' }}"
                            href="{{ url('signature-invoice') }}"><i class="fe fe-box"></i> <span>Signature
                                Invoice</span></a>
                    </li>
                </ul>
                <!-- /Signature -->

                <!-- Sales -->
                <ul>
                    <li class="menu-title"><span>Sales</span></li>
                    <li class="submenu">
                        <a class="{{ Request::is('invoices', 'invoices-paid', 'invoices-overdue', 'invoices-cancelled', 'invoices-recurring', 'invoices-unpaid', 'invoices-refunded', 'invoices-draft', 'invoice-details-admin', 'invoice-details', 'invoice-template') ? 'active' : '' }}"
                            href="{{ url('invoices') }}"><i class="fe fe-file"></i> <span>Invoices</span><span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('invoices', 'invoices-paid', 'invoices-overdue', 'invoices-cancelled', 'invoices-recurring', 'invoices-unpaid', 'invoices-refunded', 'invoices-draft') ? 'active' : '' }}"
                                    href="{{ url('invoices') }}">Invoices List</a></li>
                            <li><a class="{{ Request::is('invoice-details-admin') ? 'active' : '' }}"
                                    href="{{ url('invoice-details-admin') }}">Invoice Details (Admin)</a></li>
                            <li><a class="{{ Request::is('invoice-details') ? 'active' : '' }}"
                                    href="{{ url('invoice-details') }}">Invoice Details (Customer)</a></li>
                            <li><a class="{{ Request::is('invoice-template') ? 'active' : '' }}"
                                    href="{{ url('invoice-template') }}">Invoice Templates</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"
                            href="{{ url('recurring-invoices') }}"><i class="fe fe-clipboard"></i> <span>Recurring
                                Invoices</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('credit-notes', 'add-credit-notes', 'edit-credit-notes') ? 'active' : '' }}"
                            href="{{ url('credit-notes') }}"><i class="fe fe-edit"></i> <span>Credit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Sales -->

                <!-- Purchases -->
                <ul>
                    <li class="menu-title"><span>Purchases</span></li>
                    <li>
                        <a class="{{ Request::is('purchases', 'add-purchases', 'edit-purchases', 'add-purchase-return', 'edit-purchase-return') ? 'active' : '' }}"
                            href="{{ url('purchases') }}"><i class="fe fe-shopping-cart"></i>
                            <span>Purchases</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('purchase-orders', 'add-purchases-order', 'edit-purchases-order') ? 'active' : '' }}"
                            href="{{ url('purchase-orders') }}"><i class="fe fe-shopping-bag"></i> <span>Purchase
                                Orders</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('debit-notes') ? 'active' : '' }}"
                            href="{{ url('debit-notes') }}"><i class="fe fe-file-text"></i> <span>Debit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Purchases -->

                <!-- Finance & Accounts -->
                <ul>
                    <li class="menu-title"><span>Finance & Accounts</span></li>
                    <li>
                        <a class="{{ Request::is('expenses') ? 'active' : '' }}" href="{{ url('expenses') }}"><i
                                class="fe fe-file-plus"></i> <span>Expenses</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('payments') ? 'active' : '' }}" href="{{ url('payments') }}"><i
                                class="fe fe-credit-card"></i> <span>Payments</span></a>
                    </li>
                </ul>
                <!-- /Finance & Accounts -->

                <!-- Quotations -->
                <ul>
                    <li class="menu-title"><span>Quotations</span></li>
                    <li>
                        <a class="{{ Request::is('quotations', 'add-quotations', 'edit-quotations') ? 'active' : '' }}"
                            href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                            <span>Quotations</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delivery-challans', 'add-delivery-challans', 'edit-delivery-challans') ? 'active' : '' }}"
                            href="{{ url('delivery-challans') }}"><i class="fe fe-file-text"></i> <span>Delivery
                                Challans</span></a>
                    </li>
                </ul>
                <!-- /Quotations -->

                <!-- Reports -->
                <ul>
                    <li class="menu-title"><span>Reports</span></li>
                    <li>
                        <a class="{{ Request::is('payment-summary') ? 'active' : '' }}"
                            href="{{ url('payment-summary') }}"><i class="fe fe-credit-card"></i> <span>Payment
                                Summary</span></a>
                    </li>
                </ul>
                <!-- /Reports -->

                <!-- User Management -->
                <ul>
                    <li class="menu-title"><span>User Management</span></li>
                    <li>
                        <a class="{{ Request::is('users') ? 'active' : '' }}" href="{{ url('users') }}"><i
                                class="fe fe-user"></i> <span>Users</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('roles-permission') ? 'active' : '' }}"
                            href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles &
                                Permission</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                            href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i> <span>Delete
                                Account
                                Request</span></a>
                    </li>
                </ul>
                <!-- /User Management -->

                <!-- Membership) -->
                <ul>
                    <li class="menu-title"><span>Membership</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('membership-plans') ? 'active' : '' }}"
                                    href="{{ url('membership-plans') }}">Membership Plans</a></li>
                            <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                    href="{{ url('membership-addons') }}">Membership Addons</a></li>
                            <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                    href="{{ url('subscribers') }}">Subscribers</a></li>
                            <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                    href="{{ url('transactions') }}">Transactions</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Membership) -->

                <!-- Content (CMS) -->
                <ul>
                    <li class="menu-title"><span>Content (CMS)</span></li>
                    <li>
                        <a href="{{ url('pages') }}"><i class="fe fe-folder"></i> <span>Pages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('all-blog') ? 'active' : '' }}"
                                    href="{{ url('all-blogs') }}">All Blogs</a></li>
                            <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                    href="{{ url('categories') }}">Categories</a></li>
                            <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                    href="{{ url('blog-comments') }}">Blog Comments</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                    href="{{ url('countries') }}">Countries</a></li>
                            <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                    href="{{ url('states') }}">States</a></li>
                            <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                    href="{{ url('cities') }}">Cities</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                            href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                            <span>Testimonials</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                    </li>
                </ul>
                <!-- /Content (CMS) -->

                <!-- Support -->
                <ul>
                    <li class="menu-title"><span>Support</span></li>
                    <li>
                        <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                            href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                Messages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tickets') ? 'active' : '' }}"
                                    href="{{ url('tickets') }}">Tickets</a></li>
                            <li><a class="{{ Request::is('tickets-list') ? 'active' : '' }}"
                                    href="{{ url('tickets-list') }}">Tickets List</a></li>
                            <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                    href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                            <li><a class="{{ Request::is('ticket-details') ? 'active' : '' }}"
                                    href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Support -->



                <!-- Pages -->
                <ul>
                    <li class="menu-title"><span>Pages</span></li>
                    <li>
                        <a class="{{ Request::is('profile') ? 'active' : '' }}" href="{{ url('profile') }}"><i
                                class="fe fe-user"></i> <span>Profile</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-lock"></i> <span> Authentication </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('login') ? 'active' : '' }}"
                                    href="{{ url('login') }}"> Login </a></li>
                            <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                    href="{{ url('register') }}"> Register </a></li>
                            <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                    href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                            <li><a class="{{ Request::is('lock-screen') ? 'active' : '' }}"
                                    href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('error-404') ? 'active' : '' }}"
                            href="{{ url('error-404') }}"><i class="fe fe-x-square"></i> <span>Error
                                Pages</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                            href="{{ url('blank-page') }}"><i class="fe fe-file"></i> <span>Blank Page</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('maps-vector') ? 'active' : '' }}"
                            href="{{ url('maps-vector') }}"><i class="fe fe-image"></i> <span>Vector
                                Maps</span></a>
                    </li>
                </ul>
                <!-- /Pages -->

                <!-- UI Interface -->
                <ul>
                    <li class="menu-title">
                        <span>UI Interface</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                    href="{{ url('alerts') }}">Alerts</a></li>
                            <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                    href="{{ url('accordions') }}">Accordions</a></li>
                            <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                    href="{{ url('avatar') }}">Avatar</a></li>
                            <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                    href="{{ url('badges') }}">Badges</a></li>
                            <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                    href="{{ url('buttons') }}">Buttons</a></li>
                            <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                    href="{{ url('buttongroup') }}">Button Group</a></li>
                            <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                    href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                            <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                    href="{{ url('cards') }}">Cards</a></li>
                            <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                    href="{{ url('carousel') }}">Carousel</a></li>
                            <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                    href="{{ url('dropdowns') }}">Dropdowns</a></li>
                            <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                    href="{{ url('grid') }}">Grid</a></li>
                            <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                    href="{{ url('images') }}">Images</a></li>
                            <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                    href="{{ url('lightbox') }}">Lightbox</a></li>
                            <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                    href="{{ url('media') }}">Media</a></li>
                            <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                    href="{{ url('modal') }}">Modals</a></li>
                            <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                    href="{{ url('offcanvas') }}">Offcanvas</a></li>
                            <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                    href="{{ url('pagination') }}">Pagination</a></li>
                            <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                    href="{{ url('popover') }}">Popover</a></li>
                            <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                    href="{{ url('progress') }}">Progress Bars</a></li>
                            <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                    href="{{ url('placeholders') }}">Placeholders</a></li>
                            <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                    href="{{ url('rangeslider') }}">Range Slider</a></li>
                            <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                    href="{{ url('spinners') }}">Spinner</a></li>
                            <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                    href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                            <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                    href="{{ url('tab') }}">Tabs</a></li>
                            <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                    href="{{ url('toastr') }}">Toasts</a></li>
                            <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                    href="{{ url('tooltip') }}">Tooltip</a></li>
                            <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                    href="{{ url('typography') }}">Typography</a></li>
                            <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                    href="{{ url('video') }}">Video</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                    href="{{ url('ribbon') }}">Ribbon</a></li>
                            <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                    href="{{ url('clipboard') }}">Clipboard</a></li>
                            <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                    href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                            <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                    href="{{ url('rating') }}">Rating</a></li>
                            <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                    href="{{ url('text-editor') }}">Text Editor</a></li>
                            <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                    href="{{ url('counter') }}">Counter</a></li>
                            <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                    href="{{ url('scrollbar') }}">Scrollbar</a></li>
                            <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                    href="{{ url('notification') }}">Notification</a></li>
                            <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                    href="{{ url('stickynote') }}">Sticky Note</a></li>
                            <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                    href="{{ url('timeline') }}">Timeline</a></li>
                            <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                    href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                            <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                    href="{{ url('form-wizard') }}">Form Wizard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                    href="{{ url('chart-apex') }}">Apex Charts</a></li>
                            <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                    href="{{ url('chart-js') }}">Chart Js</a></li>
                            <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                    href="{{ url('chart-morris') }}">Morris Charts</a></li>
                            <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                    href="{{ url('chart-flot') }}">Flot Charts</a></li>
                            <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                    href="{{ url('chart-peity') }}">Peity Charts</a></li>
                            <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                    href="{{ url('chart-c3') }}">C3 Charts</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                    href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                            <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                    href="{{ url('icon-feather') }}">Feather Icons</a></li>
                            <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                    href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                            <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                    href="{{ url('icon-material') }}">Material Icons</a></li>
                            <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                    href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                            <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                    href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                            <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                    href="{{ url('icon-themify') }}">Themify Icons</a></li>
                            <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                    href="{{ url('icon-weather') }}">Weather Icons</a></li>
                            <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                    href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                            <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                    href="{{ url('icon-flag') }}">Flag Icons</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                    href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                            <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                    href="{{ url('form-input-groups') }}">Input Groups </a></li>
                            <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                    href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                            <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                    href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                            <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                    href="{{ url('form-mask') }}">Form Mask </a></li>
                            <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                    href="{{ url('form-validation') }}">Form Validation </a></li>
                            <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                    href="{{ url('form-select2') }}">Form Select2 </a></li>
                            <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                    href="{{ url('form-fileupload') }}">File Upload </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                    href="{{ url('tables-basic') }}">Basic Tables </a></li>
                            <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                    href="{{ url('data-tables') }}">Data Table </a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /UI Interface -->

                <!-- Settings -->
                <ul>
                    <li class="menu-title"><span>Settings</span></li>
                    <li>
                        <a class="{{ Request::is('settings', 'company-settings', 'invoice-settings', 'template-invoice', 'payment-settings', 'bank-account', 'tax-rates', 'plan-billing', 'two-factor', 'custom-filed', 'email-settings', 'preferences', 'saas-settings', 'seo-settings', 'email-template') ? 'active' : '' }}" href="{{ url('settings') }}"><i
                                class="fe fe-settings"></i> <span>Settings</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('login') ? 'active' : '' }}" href="{{ url('login') }}"><i
                                class="fe fe-power"></i> <span>Logout</span></a>
                    </li>
                </ul>
                <!-- /Settings -->

            </div>
        </div>
    </div>
@endif


@if (Route::is(['index-three']))
    <!-- Sidebar -->
    <div class="sidebar sidebar-three-three" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <!-- Main -->
                <ul>
                    <li class="menu-title"><span>Main</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('/', 'index') ? 'active' : '' }}"
                                    href="{{ url('/') }}">Admin Dashboard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chat') ? 'active' : '' }}"
                                    href="{{ url('chat') }}">Chat</a></li>
                            <li><a class="{{ Request::is('calendar') ? 'active' : '' }}"
                                    href="{{ url('calendar') }}">Calendar</a></li>
                            <li><a class="{{ Request::is('inbox') ? 'active' : '' }}"
                                    href="{{ url('inbox') }}">Email</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Main -->

                <!-- Customers -->
                <ul>
                    <li class="menu-title"><span>Customers</span></li>
                    <li>
                        <a class="{{ Request::is('customers') ? 'active' : '' }}"
                            href="{{ url('customers') }}"><i class="fe fe-users"></i> <span>Customers</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('customer-details') ? 'active' : '' }}"
                            href="{{ url('customer-details') }}"><i class="fe fe-file"></i> <span>Customer
                                Details</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('vendors', 'customers-ledger', 'ledger') ? 'active' : '' }}"
                            href="{{ url('vendors') }}"><i class="fe fe-user"></i> <span>Vendors</span></a>
                    </li>
                </ul>
                <!-- /Customers -->

                <!-- Inventory -->
                <ul>
                    <li class="menu-title"><span>Inventory</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('product-list') ? 'active' : '' }}"
                                    href="{{ url('product-list') }}">Product List</a></li>
                            <li><a class="{{ Request::is('category') ? 'active' : '' }}"
                                    href="{{ url('category') }}">Category</a></li>

                            <li><a class="{{ Request::is('units') ? 'active' : '' }}"
                                    href="{{ url('units') }}">Units</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('inventory') ? 'active' : '' }}"
                            href="{{ url('inventory') }}"><i class="fe fe-user"></i> <span>Inventory</span></a>
                    </li>
                </ul>
                <!-- /Inventory -->

                <!-- Signature -->
                <ul>
                    <li class="menu-title"><span>Signature</span></li>
                    <li>
                        <a class="{{ Request::is('signature-list') ? 'active' : '' }}"
                            href="{{ url('signature-list') }}"><i class="fe fe-clipboard"></i> <span>List of
                                Signature</span></a>
                        <a class="{{ Request::is('signature-invoice') ? 'active' : '' }}"
                            href="{{ url('signature-invoice') }}"><i class="fe fe-box"></i> <span>Signature
                                Invoice</span></a>
                    </li>
                </ul>
                <!-- /Signature -->

                <!-- Sales -->
                <ul>
                    <li class="menu-title"><span>Sales</span></li>
                    <li class="submenu">
                        <a class="{{ Request::is('invoices') ? 'active' : '' }}" href="{{ url('invoices') }}"><i
                                class="fe fe-file"></i> <span>Invoices</span><span class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('invoices') ? 'active' : '' }}"
                                    href="{{ url('invoices') }}">Invoices List</a></li>
                            <li><a class="{{ Request::is('invoice-details-admin') ? 'active' : '' }}"
                                    href="{{ url('invoice-details-admin') }}">Invoice Details (Admin)</a></li>
                            <li><a class="{{ Request::is('invoice-details') ? 'active' : '' }}"
                                    href="{{ url('invoice-details') }}">Invoice Details (Customer)</a></li>
                            <li><a class="{{ Request::is('invoice-template') ? 'active' : '' }}"
                                    href="{{ url('invoice-template') }}">Invoice Templates</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"
                            href="{{ url('recurring-invoices') }}"><i class="fe fe-clipboard"></i> <span>Recurring
                                Invoices</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('credit-notes') ? 'active' : '' }}"
                            href="{{ url('credit-notes') }}"><i class="fe fe-edit"></i> <span>Credit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Sales -->

                <!-- Purchases -->
                <ul>
                    <li class="menu-title"><span>Purchases</span></li>
                    <li>
                        <a class="{{ Request::is('purchases') ? 'active' : '' }}"
                            href="{{ url('purchases') }}"><i class="fe fe-shopping-cart"></i>
                            <span>Purchases</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('purchase-orders') ? 'active' : '' }}"
                            href="{{ url('purchase-orders') }}"><i class="fe fe-shopping-bag"></i> <span>Purchase
                                Orders</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('debit-notes') ? 'active' : '' }}"
                            href="{{ url('debit-notes') }}"><i class="fe fe-file-text"></i> <span>Debit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Purchases -->

                <!-- Finance & Accounts -->
                <ul>
                    <li class="menu-title"><span>Finance & Accounts</span></li>
                    <li>
                        <a class="{{ Request::is('expenses') ? 'active' : '' }}" href="{{ url('expenses') }}"><i
                                class="fe fe-file-plus"></i> <span>Expenses</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('payments') ? 'active' : '' }}" href="{{ url('payments') }}"><i
                                class="fe fe-credit-card"></i> <span>Payments</span></a>
                    </li>
                </ul>
                <!-- /Finance & Accounts -->

                <!-- Quotations -->
                <ul>
                    <li class="menu-title"><span>Quotations</span></li>
                    <li>
                        <a class="{{ Request::is('quotations') ? 'active' : '' }}"
                            href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                            <span>Quotations</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delivery-challans') ? 'active' : '' }}"
                            href="{{ url('delivery-challans') }}"><i class="fe fe-file-text"></i> <span>Delivery
                                Challans</span></a>
                    </li>
                </ul>
                <!-- /Quotations -->

                <!-- Reports -->
                <ul>
                    <li class="menu-title"><span>Reports</span></li>
                    <li>
                        <a class="{{ Request::is('payment-summary') ? 'active' : '' }}"
                            href="{{ url('payment-summary') }}"><i class="fe fe-credit-card"></i> <span>Payment
                                Summary</span></a>
                    </li>
                </ul>
                <!-- /Reports -->

                <!-- User Management -->
                <ul>
                    <li class="menu-title"><span>User Management</span></li>
                    <li>
                        <a class="{{ Request::is('users') ? 'active' : '' }}" href="{{ url('users') }}"><i
                                class="fe fe-user"></i> <span>Users</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('roles-permission') ? 'active' : '' }}"
                            href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles &
                                Permission</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                            href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i> <span>Delete
                                Account
                                Request</span></a>
                    </li>
                </ul>
                <!-- /User Management -->

                <!-- Membership) -->
                <ul>
                    <li class="menu-title"><span>Membership</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('membership-plans') ? 'active' : '' }}"
                                    href="{{ url('membership-plans') }}">Membership Plans</a></li>
                            <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                    href="{{ url('membership-addons') }}">Membership Addons</a></li>
                            <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                    href="{{ url('subscribers') }}">Subscribers</a></li>
                            <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                    href="{{ url('transactions') }}">Transactions</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Membership) -->

                <!-- Content (CMS) -->
                <ul>
                    <li class="menu-title"><span>Content (CMS)</span></li>
                    <li>
                        <a class="{{ Request::is('pages') ? 'active' : '' }}" href="{{ url('pages') }}"><i
                                class="fe fe-folder"></i> <span>Pages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('all-blogs') ? 'active' : '' }}"
                                    href="{{ url('all-blogs') }}">All Blogs</a></li>
                            <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                    href="{{ url('categories') }}">Categories</a></li>
                            <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                    href="{{ url('blog-comments') }}">Blog Comments</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                    href="{{ url('countries') }}">Countries</a></li>
                            <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                    href="{{ url('states') }}">States</a></li>
                            <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                    href="{{ url('cities') }}">Cities</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                            href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                            <span>Testimonials</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                    </li>
                </ul>
                <!-- /Content (CMS) -->

                <!-- Support -->
                <ul>
                    <li class="menu-title"><span>Support</span></li>
                    <li>
                        <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                            href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                Messages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tickets') ? 'active' : '' }}"
                                    href="{{ url('tickets') }}">Tickets</a></li>
                            <li><a class="{{ Request::is('tickets-list') ? 'active' : '' }}"
                                    href="{{ url('tickets-list') }}">Tickets List</a></li>
                            <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                    href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                            <li><a class="{{ Request::is('ticket-details') ? 'active' : '' }}"
                                    href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Support -->



                <!-- Pages -->
                <ul>
                    <li class="menu-title"><span>Pages</span></li>
                    <li>
                        <a class="{{ Request::is('profile') ? 'active' : '' }}" href="{{ url('profile') }}"><i
                                class="fe fe-user"></i> <span>Profile</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-lock"></i> <span> Authentication </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('login') ? 'active' : '' }}"
                                    href="{{ url('login') }}"> Login </a></li>
                            <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                    href="{{ url('register') }}"> Register </a></li>
                            <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                    href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                            <li><a class="{{ Request::is('lock-screen') ? 'active' : '' }}"
                                    href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('error-404') ? 'active' : '' }}"
                            href="{{ url('error-404') }}"><i class="fe fe-x-square"></i> <span>Error
                                Pages</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                            href="{{ url('blank-page') }}"><i class="fe fe-file"></i> <span>Blank Page</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('maps-vector') ? 'active' : '' }}"
                            href="{{ url('maps-vector') }}"><i class="fe fe-image"></i> <span>Vector
                                Maps</span></a>
                    </li>
                </ul>
                <!-- /Pages -->

                <!-- UI Interface -->
                <ul>
                    <li class="menu-title">
                        <span>UI Interface</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                    href="{{ url('alerts') }}">Alerts</a></li>
                            <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                    href="{{ url('accordions') }}">Accordions</a></li>
                            <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                    href="{{ url('avatar') }}">Avatar</a></li>
                            <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                    href="{{ url('badges') }}">Badges</a></li>
                            <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                    href="{{ url('buttons') }}">Buttons</a></li>
                            <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                    href="{{ url('buttongroup') }}">Button Group</a></li>
                            <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                    href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                            <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                    href="{{ url('cards') }}">Cards</a></li>
                            <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                    href="{{ url('carousel') }}">Carousel</a></li>
                            <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                    href="{{ url('dropdowns') }}">Dropdowns</a></li>
                            <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                    href="{{ url('grid') }}">Grid</a></li>
                            <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                    href="{{ url('images') }}">Images</a></li>
                            <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                    href="{{ url('lightbox') }}">Lightbox</a></li>
                            <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                    href="{{ url('media') }}">Media</a></li>
                            <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                    href="{{ url('modal') }}">Modals</a></li>
                            <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                    href="{{ url('offcanvas') }}">Offcanvas</a></li>
                            <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                    href="{{ url('pagination') }}">Pagination</a></li>
                            <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                    href="{{ url('popover') }}">Popover</a></li>
                            <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                    href="{{ url('progress') }}">Progress Bars</a></li>
                            <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                    href="{{ url('placeholders') }}">Placeholders</a></li>
                            <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                    href="{{ url('rangeslider') }}">Range Slider</a></li>
                            <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                    href="{{ url('spinners') }}">Spinner</a></li>
                            <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                    href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                            <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                    href="{{ url('tab') }}">Tabs</a></li>
                            <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                    href="{{ url('toastr') }}">Toasts</a></li>
                            <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                    href="{{ url('tooltip') }}">Tooltip</a></li>
                            <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                    href="{{ url('typography') }}">Typography</a></li>
                            <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                    href="{{ url('video') }}">Video</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                    href="{{ url('ribbon') }}">Ribbon</a></li>
                            <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                    href="{{ url('clipboard') }}">Clipboard</a></li>
                            <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                    href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                            <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                    href="{{ url('rating') }}">Rating</a></li>
                            <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                    href="{{ url('text-editor') }}">Text Editor</a></li>
                            <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                    href="{{ url('counter') }}">Counter</a></li>
                            <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                    href="{{ url('scrollbar') }}">Scrollbar</a></li>
                            <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                    href="{{ url('notification') }}">Notification</a></li>
                            <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                    href="{{ url('stickynote') }}">Sticky Note</a></li>
                            <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                    href="{{ url('timeline') }}">Timeline</a></li>
                            <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                    href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                            <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                    href="{{ url('form-wizard') }}">Form Wizard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                    href="{{ url('chart-apex') }}">Apex Charts</a></li>
                            <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                    href="{{ url('chart-js') }}">Chart Js</a></li>
                            <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                    href="{{ url('chart-morris') }}">Morris Charts</a></li>
                            <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                    href="{{ url('chart-flot') }}">Flot Charts</a></li>
                            <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                    href="{{ url('chart-peity') }}">Peity Charts</a></li>
                            <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                    href="{{ url('chart-c3') }}">C3 Charts</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                    href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                            <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                    href="{{ url('icon-feather') }}">Feather Icons</a></li>
                            <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                    href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                            <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                    href="{{ url('icon-material') }}">Material Icons</a></li>
                            <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                    href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                            <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                    href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                            <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                    href="{{ url('icon-themify') }}">Themify Icons</a></li>
                            <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                    href="{{ url('icon-weather') }}">Weather Icons</a></li>
                            <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                    href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                            <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                    href="{{ url('icon-flag') }}">Flag Icons</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                    href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                            <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                    href="{{ url('form-input-groups') }}">Input Groups </a></li>
                            <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                    href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                            <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                    href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                            <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                    href="{{ url('form-mask') }}">Form Mask </a></li>
                            <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                    href="{{ url('form-validation') }}">Form Validation </a></li>
                            <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                    href="{{ url('form-select2') }}">Form Select2 </a></li>
                            <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                    href="{{ url('form-fileupload') }}">File Upload </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                    href="{{ url('tables-basic') }}">Basic Tables </a></li>
                            <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                    href="{{ url('data-tables') }}">Data Table </a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /UI Interface -->

                <!-- Settings -->
                <ul>
                    <li class="menu-title"><span>Settings</span></li>
                    <li>
                        <a class="{{ Request::is('settings', 'company-settings', 'invoice-settings', 'template-invoice', 'payment-settings', 'bank-account', 'tax-rates', 'plan-billing', 'two-factor', 'custom-filed', 'email-settings', 'preferences', 'saas-settings', 'seo-settings', 'email-template') ? 'active' : '' }}"
                            href="{{ url('settings') }}"><i class="fe fe-settings"></i> <span>Settings</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('login') ? 'active' : '' }}" href="{{ url('login') }}"><i
                                class="fe fe-power"></i> <span>Logout</span></a>
                    </li>
                </ul>
                <!-- /Settings -->

            </div>
        </div>
    </div>
    <!-- /Sidebar -->
@endif

@if (Route::is(['index-four']))
    <!-- Sidebar -->
    <div class="sidebar sidebar-three" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu sidebar-menu-three">
                <aside id="aside" class="ui-aside">
                    <ul class="tab nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link {{ Request::is('/', 'index') ? 'active' : '' }}"
                                href="#home" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                                role="tab" aria-controls="home" aria-selected="true">
                                <i class="fe fe-airplay"></i>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link" id="messages-tab" data-bs-toggle="tab"
                                data-bs-target="#messages" role="tab" aria-controls="messages"
                                aria-selected="false">
                                <i class="fe fe-layers"></i>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link" id="profile-tab" data-bs-toggle="tab"
                                data-bs-target="#profile" role="tab" aria-controls="profile"
                                aria-selected="false">
                                <i class="fe fe-file"></i>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link {{ Request::is('chat') ? 'active' : '' }}"
                                href="{{ url('chat') }}">
                                <i class="fe fe-message-square"></i>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link {{ Request::is('inbox') ? 'active' : '' }}"
                                href="{{ url('inbox') }}">
                                <i class="fe fe-mail"></i>
                            </a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="tablinks nav-link {{ Request::is('calendar') ? 'active' : '' }}"
                                href="{{ url('calendar') }}">
                                <i class="fe fe-calendar"></i>
                            </a>
                        </li>
                    </ul>
                </aside>
                <div class="tab-content tab-content-three">
                    <ul class="tab-pane {{ Request::is('/', 'index') ? 'active' : '' }}" id="home"
                        aria-labelledby="home-tab">
                        <!-- Main -->
                        <li class="menu-title"><span>Main</span></li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('/', 'index') ? 'active' : '' }}"
                                        href="{{ url('/') }}">Admin Dashboard</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('chat') ? 'active' : '' }}"
                                        href="{{ url('chat') }}">Chat</a></li>
                                <li><a class="{{ Request::is('calendar') ? 'active' : '' }}"
                                        href="{{ url('calendar') }}">Calendar</a></li>
                                <li><a class="{{ Request::is('inbox') ? 'active' : '' }}"
                                        href="{{ url('inbox') }}">Email</a></li>
                            </ul>
                        </li>
                        <!-- /Main -->

                        <!-- Customers -->
                        <li>
                            <a class="{{ Request::is('customers') ? 'active' : '' }}"
                                href="{{ url('customers') }}"><i class="fe fe-users"></i>
                                <span>Customers</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('customer-details') ? 'active' : '' }}"
                                href="{{ url('customer-details') }}"><i class="fe fe-file"></i> <span>Customer
                                    Details</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('vendors') ? 'active' : '' }}"
                                href="{{ url('vendors') }}"><i class="fe fe-user"></i> <span>Vendors</span></a>
                        </li>
                        <!-- /Customers -->

                        <!-- Inventory -->
                        <li class="submenu">
                            <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('product-list') ? 'active' : '' }}"
                                        href="{{ url('product-list') }}">Product List</a></li>
                                <li><a class="{{ Request::is('category') ? 'active' : '' }}"
                                        href="{{ url('category') }}">Category</a></li>

                                <li><a class="{{ Request::is('units') ? 'active' : '' }}"
                                        href="{{ url('units') }}">Units</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('inventory') ? 'active' : '' }}"
                                href="{{ url('inventory') }}"><i class="fe fe-user"></i>
                                <span>Inventory</span></a>
                        </li>
                        <!-- /Inventory -->

                        <!-- Signature -->
                        <li class="submenu">
                            <a href="#"><span>Signature</span> <span class="menu-arrow"></span></a>
                            <ul>
                                <li>
                                    <a class="{{ Request::is('signature-list') ? 'active' : '' }}"
                                        href="{{ url('signature-list') }}"><i class="fe fe-clipboard"></i>
                                        <span>List of
                                            Signature</span></a>
                                    <a class="{{ Request::is('signature-invoice') ? 'active' : '' }}"
                                        href="{{ url('signature-invoice') }}"><i class="fe fe-box"></i>
                                        <span>Signature
                                            Invoice</span></a>
                                </li>
                            </ul>
                        </li>
                        <!-- /Signature -->

                        <!-- Sales -->
                        <li class="submenu">
                            <a class="{{ Request::is('invoices') ? 'active' : '' }}"
                                href="{{ url('invoices') }}"><i class="fe fe-file"></i>
                                <span>Invoices</span><span class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('invoices') ? 'active' : '' }}"
                                        href="{{ url('invoices') }}">Invoices List</a></li>
                                <li><a class="{{ Request::is('invoice-details-admin') ? 'active' : '' }}"
                                        href="{{ url('invoice-details-admin') }}">Invoice Details (Admin)</a></li>
                                <li><a class="{{ Request::is('invoice-details') ? 'active' : '' }}"
                                        href="{{ url('invoice-details') }}">Invoice Details (Customer)</a></li>
                                <li><a class="{{ Request::is('invoice-template') ? 'active' : '' }}"
                                        href="{{ url('invoice-template') }}">Invoice Templates</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"
                                href="{{ url('recurring-invoices') }}"><i class="fe fe-clipboard"></i>
                                <span>Recurring
                                    Invoices</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('credit-notes') ? 'active' : '' }}"
                                href="{{ url('credit-notes') }}"><i class="fe fe-edit"></i> <span>Credit
                                    Notes</span></a>
                        </li>
                        <!-- /Sales -->

                        <!-- Purchases -->
                        <li>
                            <a class="{{ Request::is('purchases') ? 'active' : '' }}"
                                href="{{ url('purchases') }}"><i class="fe fe-shopping-cart"></i>
                                <span>Purchases</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('purchase-orders') ? 'active' : '' }}"
                                href="{{ url('purchase-orders') }}"><i class="fe fe-shopping-bag"></i>
                                <span>Purchase
                                    Orders</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('debit-notes') ? 'active' : '' }}"
                                href="{{ url('debit-notes') }}"><i class="fe fe-file-text"></i> <span>Debit
                                    Notes</span></a>
                        </li>
                        <!-- /Purchases -->

                        <!-- Finance & Accounts -->
                        <li>
                            <a class="{{ Request::is('expenses') ? 'active' : '' }}"
                                href="{{ url('expenses') }}"><i class="fe fe-file-plus"></i>
                                <span>Expenses</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('payments') ? 'active' : '' }}"
                                href="{{ url('payments') }}"><i class="fe fe-credit-card"></i>
                                <span>Payments</span></a>
                        </li>
                        <!-- /Finance & Accounts -->

                        <!-- Quotations -->
                        <li>
                            <a class="{{ Request::is('quotations') ? 'active' : '' }}"
                                href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                                <span>Quotations</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('delivery-challans') ? 'active' : '' }}"
                                href="{{ url('delivery-challans') }}"><i class="fe fe-file-text"></i>
                                <span>Delivery
                                    Challans</span></a>
                        </li>
                        <!-- /Quotations -->

                        <!-- Reports -->
                        <li>
                            <a class="{{ Request::is('payment-summary') ? 'active' : '' }}"
                                href="{{ url('payment-summary') }}"><i class="fe fe-credit-card"></i>
                                <span>Payment
                                    Summary</span></a>
                        </li>
                        <!-- /Reports -->

                        <!-- User Management -->
                        <li class="submenu">
                            <a href="#"><i class="fe fe-user"></i> <span> Manage Users</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('add-user') ? 'active' : '' }}"
                                        href="{{ url('add-user') }}">Add User</a></li>
                                <li><a class="{{ Request::is('users') ? 'active' : '' }}"
                                        href="{{ url('users') }}">Users</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('roles-permission') ? 'active' : '' }}"
                                href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles
                                    &
                                    Permission</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                                href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i>
                                <span>Delete Account
                                    Request</span></a>
                        </li>
                        <!-- /User Management -->

                        <!-- Membership) -->
                        <li class="submenu">
                            <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('membership-plans') ? 'active' : '' }}"
                                        href="{{ url('membership-plans') }}">Membership Plans</a></li>
                                <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                        href="{{ url('membership-addons') }}">Membership Addons</a></li>
                                <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                        href="{{ url('subscribers') }}">Subscribers</a></li>
                                <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                        href="{{ url('transactions') }}">Transactions</a></li>
                            </ul>
                        </li>
                        <!-- /Membership) -->

                        <!-- Content (CMS) -->
                        <li>
                            <a class="{{ Request::is('pages') ? 'active' : '' }}"
                                href="{{ url('pages') }}"><i class="fe fe-folder"></i> <span>Pages</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('all-blogs') ? 'active' : '' }}"
                                        href="{{ url('all-blogs') }}">All Blogs</a></li>
                                <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                        href="{{ url('categories') }}">Categories</a></li>
                                <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                        href="{{ url('blog-comments') }}">Blog Comments</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                        href="{{ url('countries') }}">Countries</a></li>
                                <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                        href="{{ url('states') }}">States</a></li>
                                <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                        href="{{ url('cities') }}">Cities</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                                href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                                <span>Testimonials</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                    class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                        </li>
                        <!-- /Content (CMS) -->

                        <!-- Support -->
                        <li>
                            <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                                href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                    Messages</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('tickets') ? 'active' : '' }}"
                                        href="{{ url('tickets') }}">Tickets</a></li>
                                <li><a class="{{ Request::is('tickets-list') ? 'active' : '' }}"
                                        href="{{ url('tickets-list') }}">Tickets List</a></li>
                                <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                        href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                                <li><a class="{{ Request::is('tickets-details') ? 'active' : '' }}"
                                        href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                            </ul>
                        </li>
                        <!-- /Support -->
                    </ul>

                    <!-- UI Interface -->
                    <ul class="tab-pane" id="messages" aria-labelledby="messages-tab">
                        <li class="menu-title">
                            <span>UI Interface</span>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                        href="{{ url('alerts') }}">Alerts</a></li>
                                <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                        href="{{ url('accordions') }}">Accordions</a></li>
                                <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                        href="{{ url('avatar') }}">Avatar</a></li>
                                <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                        href="{{ url('badges') }}">Badges</a></li>
                                <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                        href="{{ url('buttons') }}">Buttons</a></li>
                                <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                        href="{{ url('buttongroup') }}">Button Group</a></li>
                                <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                        href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                                <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                        href="{{ url('cards') }}">Cards</a></li>
                                <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                        href="{{ url('carousel') }}">Carousel</a></li>
                                <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                        href="{{ url('dropdowns') }}">Dropdowns</a></li>
                                <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                        href="{{ url('grid') }}">Grid</a></li>
                                <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                        href="{{ url('images') }}">Images</a></li>
                                <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                        href="{{ url('lightbox') }}">Lightbox</a></li>
                                <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                        href="{{ url('media') }}">Media</a></li>
                                <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                        href="{{ url('modal') }}">Modals</a></li>
                                <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                        href="{{ url('offcanvas') }}">Offcanvas</a></li>
                                <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                        href="{{ url('pagination') }}">Pagination</a></li>
                                <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                        href="{{ url('popover') }}">Popover</a></li>
                                <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                        href="{{ url('progress') }}">Progress Bars</a></li>
                                <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                        href="{{ url('placeholders') }}">Placeholders</a></li>
                                <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                        href="{{ url('rangeslider') }}">Range Slider</a></li>
                                <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                        href="{{ url('spinners') }}">Spinner</a></li>
                                <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                        href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                                <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                        href="{{ url('tab') }}">Tabs</a></li>
                                <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                        href="{{ url('toastr') }}">Toasts</a></li>
                                <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                        href="{{ url('tooltip') }}">Tooltip</a></li>
                                <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                        href="{{ url('typography') }}">Typography</a></li>
                                <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                        href="{{ url('video') }}">Video</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                        href="{{ url('ribbon') }}">Ribbon</a></li>
                                <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                        href="{{ url('clipboard') }}">Clipboard</a></li>
                                <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                        href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                                <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                        href="{{ url('rating') }}">Rating</a></li>
                                <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                        href="{{ url('text-editor') }}">Text Editor</a></li>
                                <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                        href="{{ url('counter') }}">Counter</a></li>
                                <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                        href="{{ url('scrollbar') }}">Scrollbar</a></li>
                                <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                        href="{{ url('notification') }}">Notification</a></li>
                                <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                        href="{{ url('stickynote') }}">Sticky Note</a></li>
                                <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                        href="{{ url('timeline') }}">Timeline</a></li>
                                <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                        href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                                <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                        href="{{ url('form-wizard') }}">Form Wizard</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                        href="{{ url('chart-apex') }}">Apex Charts</a></li>
                                <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                        href="{{ url('chart-js') }}">Chart Js</a></li>
                                <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                        href="{{ url('chart-morris') }}">Morris Charts</a></li>
                                <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                        href="{{ url('chart-flot') }}">Flot Charts</a></li>
                                <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                        href="{{ url('chart-peity') }}">Peity Charts</a></li>
                                <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                        href="{{ url('chart-c3') }}">C3 Charts</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                        href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                                <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                        href="{{ url('icon-feather') }}">Feather Icons</a></li>
                                <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                        href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                                <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                        href="{{ url('icon-material') }}">Material Icons</a></li>
                                <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                        href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                                <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                        href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                                <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                        href="{{ url('icon-themify') }}">Themify Icons</a></li>
                                <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                        href="{{ url('icon-weather') }}">Weather Icons</a></li>
                                <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                        href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                                <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                        href="{{ url('icon-flag') }}">Flag Icons</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                        href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                                <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                        href="{{ url('form-input-groups') }}">Input Groups </a></li>
                                <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                        href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                                <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                        href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                                <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                        href="{{ url('form-mask') }}">Form Mask </a></li>
                                <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                        href="{{ url('form-validation') }}">Form Validation </a></li>
                                <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                        href="{{ url('form-select2') }}">Form Select2 </a></li>
                                <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                        href="{{ url('form-fileupload') }}">File Upload </a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                        href="{{ url('tables-basic') }}">Basic Tables </a></li>
                                <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                        href="{{ url('data-tables') }}">Data Table </a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /UI Interface -->

                    <!-- Pages -->
                    <ul class="tab-pane" id="profile" aria-labelledby="profile-tab">
                        <li class="menu-title menu-title-three">
                            <span>Pages</span>
                        </li>
                        <li>
                            <a class="{{ Request::is('profile') ? 'active' : '' }}"
                                href="{{ url('profile') }}"><i data-feather="user-plus"></i>
                                <span>Profile</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i data-feather="lock"></i> <span> Authentication </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('login') ? 'active' : '' }}"
                                        href="{{ url('login') }}"> Login </a></li>
                                <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                        href="{{ url('register') }}"> Register </a></li>
                                <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                        href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                                <li><a class="{{ Request::is('lock-scree') ? 'active' : '' }}"
                                        href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i data-feather="alert-octagon"></i> <span> Error Pages </span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a class="{{ Request::is('error-404') ? 'active' : '' }}"
                                        href="{{ url('error-404') }}">404 Error </a></li>
                                <li><a class="{{ Request::is('error-500') ? 'active' : '' }}"
                                        href="{{ url('error-500') }}">500 Error </a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="{{ Request::is('users') ? 'active' : '' }}"
                                href="{{ url('users') }}"><i data-feather="user"></i> <span>Users</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                                href="{{ url('blank-page') }}"><i data-feather="file"></i> <span>Blank
                                    Page</span></a>
                        </li>
                        <li>
                            <a class="{{ Request::is('maps-vector') ? 'active' : '' }}"
                                href="{{ url('maps-vector') }}"><i data-feather="map-pin"></i> <span>Vector
                                    Maps</span></a>
                        </li>
                    </ul>
                    <!-- /Pages -->
                </div>
            </div>
        </div>
    </div>
    <!-- /Sidebar -->
@endif
@if (Route::is(['index-five']))
    <!-- Sidebar -->
    <div class="sidebar sidebar-four sidebar-hide" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menus" class="sidebar-menu sidebar-menu-four">
                <!-- Main -->
                <ul>
                    <li class="menu-title"><span>Main</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-home"></i> <span> Dashboard</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('/', 'index') ? 'active' : '' }}"
                                    href="{{ url('/') }}">Admin Dashboard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-grid"></i> <span> Applications</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chat') ? 'active' : '' }}"
                                    href="{{ url('chat') }}">Chat</a></li>
                            <li><a class="{{ Request::is('calendar') ? 'active' : '' }}"
                                    href="{{ url('calendar') }}">Calendar</a></li>
                            <li><a class="{{ Request::is('inbox') ? 'active' : '' }}"
                                    href="{{ url('inbox') }}">Email</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Main -->

                <!-- Customers -->
                <ul>
                    <li class="menu-title"><span>Customers</span></li>
                    <li>
                        <a class="{{ Request::is('customers') ? 'active' : '' }}"
                            href="{{ url('customers') }}"><i class="fe fe-users"></i> <span>Customers</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('customer-details') ? 'active' : '' }}"
                            href="{{ url('customer-details') }}"><i class="fe fe-file"></i> <span>Customer
                                Details</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('vendors') ? 'active' : '' }}" href="{{ url('vendors') }}"><i
                                class="fe fe-user"></i> <span>Vendors</span></a>
                    </li>
                </ul>
                <!-- /Customers -->

                <!-- Inventory -->
                <ul>
                    <li class="menu-title"><span>Inventory</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-package"></i> <span> Products / Services</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('product-list') ? 'active' : '' }}"
                                    href="{{ url('product-list') }}">Product List</a></li>
                            <li><a class="{{ Request::is('category') ? 'active' : '' }}"
                                    href="{{ url('category') }}">Category</a></li>

                            <li><a class="{{ Request::is('units') ? 'active' : '' }}"
                                    href="{{ url('units') }}">Units</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('inventory') ? 'active' : '' }}"
                            href="{{ url('inventory') }}"><i class="fe fe-user"></i> <span>Inventory</span></a>
                    </li>
                </ul>
                <!-- /Inventory -->

                <!-- Sales -->
                <ul>
                    <li class="menu-title"><span>Sales</span></li>
                    <li>
                        <a class="{{ Request::is('invoices') ? 'active' : '' }}"
                            href="{{ url('invoices') }}"><i class="fe fe-file"></i> <span>Invoices</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('recurring-invoices') ? 'active' : '' }}"
                            href="{{ url('recurring-invoices') }}"><i class="fe fe-clipboard"></i>
                            <span>Recurring
                                Invoices</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('credit-notes') ? 'active' : '' }}"
                            href="{{ url('credit-notes') }}"><i class="fe fe-edit"></i> <span>Credit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Sales -->

                <!-- Purchases -->
                <ul>
                    <li class="menu-title"><span>Purchases</span></li>
                    <li>
                        <a class="{{ Request::is('purchases') ? 'active' : '' }}"
                            href="{{ url('purchases') }}"><i class="fe fe-shopping-cart"></i>
                            <span>Purchases</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('purchase-orders') ? 'active' : '' }}"
                            href="{{ url('purchase-orders') }}"><i class="fe fe-shopping-bag"></i> <span>Purchase
                                Orders</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('debit-notes') ? 'active' : '' }}"
                            href="{{ url('debit-notes') }}"><i class="fe fe-file-text"></i> <span>Debit
                                Notes</span></a>
                    </li>
                </ul>
                <!-- /Purchases -->

                <!-- Finance & Accounts -->
                <ul>
                    <li class="menu-title"><span>Finance & Accounts</span></li>
                    <li>
                        <a class="{{ Request::is('expenses') ? 'active' : '' }}"
                            href="{{ url('expenses') }}"><i class="fe fe-file-plus"></i>
                            <span>Expenses</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('payments') ? 'active' : '' }}"
                            href="{{ url('payments') }}"><i class="fe fe-credit-card"></i>
                            <span>Payments</span></a>
                    </li>
                </ul>
                <!-- /Finance & Accounts -->

                <!-- Quotations -->
                <ul>
                    <li class="menu-title"><span>Quotations</span></li>
                    <li>
                        <a class="{{ Request::is('quotations') ? 'active' : '' }}"
                            href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                            <span>Quotations</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delivery-challans') ? 'active' : '' }}"
                            href="{{ url('delivery-challans') }}"><i class="fe fe-file-text"></i> <span>Delivery
                                Challans</span></a>
                    </li>
                </ul>
                <!-- /Quotations -->

                <!-- Reports -->
                <ul>
                    <li class="menu-title"><span>Reports</span></li>
                    <li>
                        <a class="{{ Request::is('quotations') ? 'active' : '' }}"
                            href="{{ url('quotations') }}"><i class="fe fe-clipboard"></i>
                            <span>Quotations</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('payment-summary') ? 'active' : '' }}"
                            href="{{ url('payment-summary') }}"><i class="fe fe-credit-card"></i> <span>Payment
                                Summary</span></a>
                    </li>
                </ul>
                <!-- /Reports -->

                <!-- User Management -->
                <ul>
                    <li class="menu-title"><span>User Management</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-user"></i> <span> Manage Users</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('add-user') ? 'active' : '' }}"
                                    href="{{ url('add-user') }}">Add User</a></li>
                            <li><a class="{{ Request::is('users') ? 'active' : '' }}"
                                    href="{{ url('users') }}">Users</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('roles-permission') ? 'active' : '' }}"
                            href="{{ url('roles-permission') }}"><i class="fe fe-clipboard"></i> <span>Roles &
                                Permission</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('delete-account-request') ? 'active' : '' }}"
                            href="{{ url('delete-account-request') }}"><i class="fe fe-trash-2"></i> <span>Delete
                                Account
                                Request</span></a>
                    </li>
                </ul>
                <!-- /User Management -->

                <!-- Membership) -->
                <ul>
                    <li class="menu-title"><span>Membership</span></li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Membership</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('membership-plan') ? 'active' : '' }}"
                                    href="{{ url('membership-plans') }}">Membership Plans</a></li>
                            <li><a class="{{ Request::is('membership-addons') ? 'active' : '' }}"
                                    href="{{ url('membership-addons') }}">Membership Addons</a></li>
                            <li><a class="{{ Request::is('subscribers') ? 'active' : '' }}"
                                    href="{{ url('subscribers') }}">Subscribers</a></li>
                            <li><a class="{{ Request::is('transactions') ? 'active' : '' }}"
                                    href="{{ url('transactions') }}">Transactions</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Membership) -->

                <!-- Content (CMS) -->
                <ul>
                    <li class="menu-title"><span>Content (CMS)</span></li>
                    <li>
                        <a class="{{ Request::is('pages') ? 'active' : '' }}" href="{{ url('pages') }}"><i
                                class="fe fe-folder"></i> <span>Pages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-book"></i> <span> Blog</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('all-blogs') ? 'active' : '' }}"
                                    href="{{ url('all-blogs') }}">All Blogs</a></li>
                            <li><a class="{{ Request::is('categories') ? 'active' : '' }}"
                                    href="{{ url('categories') }}">Categories</a></li>
                            <li><a class="{{ Request::is('blog-comments') ? 'active' : '' }}"
                                    href="{{ url('blog-comments') }}">Blog Comments</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-map-pin"></i> <span> Location</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('countries') ? 'active' : '' }}"
                                    href="{{ url('countries') }}">Countries</a></li>
                            <li><a class="{{ Request::is('states') ? 'active' : '' }}"
                                    href="{{ url('states') }}">States</a></li>
                            <li><a class="{{ Request::is('cities') ? 'active' : '' }}"
                                    href="{{ url('cities') }}">Cities</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="{{ Request::is('testimonials') ? 'active' : '' }}"
                            href="{{ url('testimonials') }}"><i class="fe fe-message-square"></i>
                            <span>Testimonials</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('faq') ? 'active' : '' }}" href="{{ url('faq') }}"><i
                                class="fe fe-alert-circle"></i> <span>FAQ</span></a>
                    </li>
                </ul>
                <!-- /Content (CMS) -->

                <!-- Support -->
                <ul>
                    <li class="menu-title"><span>Support</span></li>
                    <li>
                        <a class="{{ Request::is('contact-messages') ? 'active' : '' }}"
                            href="{{ url('contact-messages') }}"><i class="fe fe-printer"></i> <span>Contact
                                Messages</span></a>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-save"></i> <span> Tickets</span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tickets') ? 'active' : '' }}"
                                    href="{{ url('tickets') }}">Tickets</a></li>
                            <li><a class="{{ Request::is('tickets-list') ? 'active' : '' }}"
                                    href="{{ url('tickets-list') }}">Tickets List</a></li>
                            <li><a class="{{ Request::is('tickets-kanban') ? 'active' : '' }}"
                                    href="{{ url('tickets-kanban') }}">Tickets Kanban</a></li>
                            <li><a class="{{ Request::is('ticket-details') ? 'active' : '' }}"
                                    href="{{ url('ticket-details') }}">Ticket Overview</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Support -->

                <!-- Authentication -->
                <ul>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-lock"></i> <span> Authentication </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('login') ? 'active' : '' }}"
                                    href="{{ url('login') }}"> Login </a></li>
                            <li><a class="{{ Request::is('register') ? 'active' : '' }}"
                                    href="{{ url('register') }}"> Register </a></li>
                            <li><a class="{{ Request::is('forgot-password') ? 'active' : '' }}"
                                    href="{{ url('forgot-password') }}"> Forgot Password </a></li>
                            <li><a class="{{ Request::is('lock-screen') ? 'active' : '' }}"
                                    href="{{ url('lock-screen') }}"> Lock Screen </a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /Authentication -->

                <!-- Pages -->
                <ul>
                    <li class="menu-title"><span>Pages</span></li>
                    <li>
                        <a class="{{ Request::is('profile') ? 'active' : '' }}" href="{{ url('profile') }}"><i
                                class="fe fe-user"></i> <span>Profile</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('error-404') ? 'active' : '' }}"
                            href="{{ url('error-404') }}"><i class="fe fe-x-square"></i> <span>Error
                                Pages</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('blank-page') ? 'active' : '' }}"
                            href="{{ url('blank-page') }}"><i class="fe fe-file"></i> <span>Blank Page</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('alerts') ? 'active' : '' }}" href="{{ url('alerts') }}"><i
                                class="fe fe-image"></i> <span>Vector
                                Maps</span></a>
                    </li>
                </ul>
                <!-- /Pages -->

                <!-- UI Interface -->
                <ul>
                    <li class="menu-title">
                        <span>UI Interface</span>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-pocket"></i> <span>Base UI </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('alerts') ? 'active' : '' }}"
                                    href="{{ url('alerts') }}">Alerts</a></li>
                            <li><a class="{{ Request::is('accordions') ? 'active' : '' }}"
                                    href="{{ url('accordions') }}">Accordions</a></li>
                            <li><a class="{{ Request::is('avatar') ? 'active' : '' }}"
                                    href="{{ url('avatar') }}">Avatar</a></li>
                            <li><a class="{{ Request::is('badges') ? 'active' : '' }}"
                                    href="{{ url('badges') }}">Badges</a></li>
                            <li><a class="{{ Request::is('buttons') ? 'active' : '' }}"
                                    href="{{ url('buttons') }}">Buttons</a></li>
                            <li><a class="{{ Request::is('buttongroup') ? 'active' : '' }}"
                                    href="{{ url('buttongroup') }}">Button Group</a></li>
                            <li><a class="{{ Request::is('breadcrumbs') ? 'active' : '' }}"
                                    href="{{ url('breadcrumbs') }}">Breadcrumb</a></li>
                            <li><a class="{{ Request::is('cards') ? 'active' : '' }}"
                                    href="{{ url('cards') }}">Cards</a></li>
                            <li><a class="{{ Request::is('carousel') ? 'active' : '' }}"
                                    href="{{ url('carousel') }}">Carousel</a></li>
                            <li><a class="{{ Request::is('dropdowns') ? 'active' : '' }}"
                                    href="{{ url('dropdowns') }}">Dropdowns</a></li>
                            <li><a class="{{ Request::is('grid') ? 'active' : '' }}"
                                    href="{{ url('grid') }}">Grid</a></li>
                            <li><a class="{{ Request::is('images') ? 'active' : '' }}"
                                    href="{{ url('images') }}">Images</a></li>
                            <li><a class="{{ Request::is('lightbox') ? 'active' : '' }}"
                                    href="{{ url('lightbox') }}">Lightbox</a></li>
                            <li><a class="{{ Request::is('media') ? 'active' : '' }}"
                                    href="{{ url('media') }}">Media</a></li>
                            <li><a class="{{ Request::is('modal') ? 'active' : '' }}"
                                    href="{{ url('modal') }}">Modals</a></li>
                            <li><a class="{{ Request::is('offcanvas') ? 'active' : '' }}"
                                    href="{{ url('offcanvas') }}">Offcanvas</a></li>
                            <li><a class="{{ Request::is('pagination') ? 'active' : '' }}"
                                    href="{{ url('pagination') }}">Pagination</a></li>
                            <li><a class="{{ Request::is('popover') ? 'active' : '' }}"
                                    href="{{ url('popover') }}">Popover</a></li>
                            <li><a class="{{ Request::is('progress') ? 'active' : '' }}"
                                    href="{{ url('progress') }}">Progress Bars</a></li>
                            <li><a class="{{ Request::is('placeholders') ? 'active' : '' }}"
                                    href="{{ url('placeholders') }}">Placeholders</a></li>
                            <li><a class="{{ Request::is('rangeslider') ? 'active' : '' }}"
                                    href="{{ url('rangeslider') }}">Range Slider</a></li>
                            <li><a class="{{ Request::is('spinners') ? 'active' : '' }}"
                                    href="{{ url('spinners') }}">Spinner</a></li>
                            <li><a class="{{ Request::is('sweetalerts') ? 'active' : '' }}"
                                    href="{{ url('sweetalerts') }}">Sweet Alerts</a></li>
                            <li><a class="{{ Request::is('tab') ? 'active' : '' }}"
                                    href="{{ url('tab') }}">Tabs</a></li>
                            <li><a class="{{ Request::is('toastr') ? 'active' : '' }}"
                                    href="{{ url('toastr') }}">Toasts</a></li>
                            <li><a class="{{ Request::is('tooltip') ? 'active' : '' }}"
                                    href="{{ url('tooltip') }}">Tooltip</a></li>
                            <li><a class="{{ Request::is('typography') ? 'active' : '' }}"
                                    href="{{ url('typography') }}">Typography</a></li>
                            <li><a class="{{ Request::is('video') ? 'active' : '' }}"
                                    href="{{ url('video') }}">Video</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-box"></i> <span>Elements </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('ribbon') ? 'active' : '' }}"
                                    href="{{ url('ribbon') }}">Ribbon</a></li>
                            <li><a class="{{ Request::is('clipboard') ? 'active' : '' }}"
                                    href="{{ url('clipboard') }}">Clipboard</a></li>
                            <li><a class="{{ Request::is('drag-drop') ? 'active' : '' }}"
                                    href="{{ url('drag-drop') }}">Drag & Drop</a></li>
                            <li><a class="{{ Request::is('rating') ? 'active' : '' }}"
                                    href="{{ url('rating') }}">Rating</a></li>
                            <li><a class="{{ Request::is('text-editor') ? 'active' : '' }}"
                                    href="{{ url('text-editor') }}">Text Editor</a></li>
                            <li><a class="{{ Request::is('counter') ? 'active' : '' }}"
                                    href="{{ url('counter') }}">Counter</a></li>
                            <li><a class="{{ Request::is('scrollbar') ? 'active' : '' }}"
                                    href="{{ url('scrollbar') }}">Scrollbar</a></li>
                            <li><a class="{{ Request::is('notification') ? 'active' : '' }}"
                                    href="{{ url('notification') }}">Notification</a></li>
                            <li><a class="{{ Request::is('stickynote') ? 'active' : '' }}"
                                    href="{{ url('stickynote') }}">Sticky Note</a></li>
                            <li><a class="{{ Request::is('timeline') ? 'active' : '' }}"
                                    href="{{ url('timeline') }}">Timeline</a></li>
                            <li><a class="{{ Request::is('horizontal-timeline') ? 'active' : '' }}"
                                    href="{{ url('horizontal-timeline') }}">Horizontal Timeline</a></li>
                            <li><a class="{{ Request::is('form-wizard') ? 'active' : '' }}"
                                    href="{{ url('form-wizard') }}">Form Wizard</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-bar-chart"></i> <span> Charts </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('chart-apex') ? 'active' : '' }}"
                                    href="{{ url('chart-apex') }}">Apex Charts</a></li>
                            <li><a class="{{ Request::is('chart-js') ? 'active' : '' }}"
                                    href="{{ url('chart-js') }}">Chart Js</a></li>
                            <li><a class="{{ Request::is('chart-morris') ? 'active' : '' }}"
                                    href="{{ url('chart-morris') }}">Morris Charts</a></li>
                            <li><a class="{{ Request::is('chart-flot') ? 'active' : '' }}"
                                    href="{{ url('chart-flot') }}">Flot Charts</a></li>
                            <li><a class="{{ Request::is('chart-peity') ? 'active' : '' }}"
                                    href="{{ url('chart-peity') }}">Peity Charts</a></li>
                            <li><a class="{{ Request::is('chart-c3') ? 'active' : '' }}"
                                    href="{{ url('chart-c3') }}">C3 Charts</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-award"></i> <span> Icons </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('icon-fontawesome') ? 'active' : '' }}"
                                    href="{{ url('icon-fontawesome') }}">Fontawesome Icons</a></li>
                            <li><a class="{{ Request::is('icon-feather') ? 'active' : '' }}"
                                    href="{{ url('icon-feather') }}">Feather Icons</a></li>
                            <li><a class="{{ Request::is('icon-ionic') ? 'active' : '' }}"
                                    href="{{ url('icon-ionic') }}">Ionic Icons</a></li>
                            <li><a class="{{ Request::is('icon-material') ? 'active' : '' }}"
                                    href="{{ url('icon-material') }}">Material Icons</a></li>
                            <li><a class="{{ Request::is('icon-pe7') ? 'active' : '' }}"
                                    href="{{ url('icon-pe7') }}">Pe7 Icons</a></li>
                            <li><a class="{{ Request::is('icon-simpleline') ? 'active' : '' }}"
                                    href="{{ url('icon-simpleline') }}">Simpleline Icons</a></li>
                            <li><a class="{{ Request::is('icon-themify') ? 'active' : '' }}"
                                    href="{{ url('icon-themify') }}">Themify Icons</a></li>
                            <li><a class="{{ Request::is('icon-weather') ? 'active' : '' }}"
                                    href="{{ url('icon-weather') }}">Weather Icons</a></li>
                            <li><a class="{{ Request::is('icon-typicon') ? 'active' : '' }}"
                                    href="{{ url('icon-typicon') }}">Typicon Icons</a></li>
                            <li><a class="{{ Request::is('icon-flag') ? 'active' : '' }}"
                                    href="{{ url('icon-flag') }}">Flag Icons</a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-sidebar"></i> <span> Forms </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('form-basic-inputs') ? 'active' : '' }}"
                                    href="{{ url('form-basic-inputs') }}">Basic Inputs </a></li>
                            <li><a class="{{ Request::is('form-input-groups') ? 'active' : '' }}"
                                    href="{{ url('form-input-groups') }}">Input Groups </a></li>
                            <li><a class="{{ Request::is('form-horizontal') ? 'active' : '' }}"
                                    href="{{ url('form-horizontal') }}">Horizontal Form </a></li>
                            <li><a class="{{ Request::is('form-vertical') ? 'active' : '' }}"
                                    href="{{ url('form-vertical') }}"> Vertical Form </a></li>
                            <li><a class="{{ Request::is('form-mask') ? 'active' : '' }}"
                                    href="{{ url('form-mask') }}">Form Mask </a></li>
                            <li><a class="{{ Request::is('form-validation') ? 'active' : '' }}"
                                    href="{{ url('form-validation') }}">Form Validation </a></li>
                            <li><a class="{{ Request::is('form-select2') ? 'active' : '' }}"
                                    href="{{ url('form-select2') }}">Form Select2 </a></li>
                            <li><a class="{{ Request::is('form-fileupload') ? 'active' : '' }}"
                                    href="{{ url('form-fileupload') }}">File Upload </a></li>
                        </ul>
                    </li>
                    <li class="submenu">
                        <a href="#"><i class="fe fe-layout"></i> <span> Tables </span> <span
                                class="menu-arrow"></span></a>
                        <ul>
                            <li><a class="{{ Request::is('tables-basic') ? 'active' : '' }}"
                                    href="{{ url('tables-basic') }}">Basic Tables </a></li>
                            <li><a class="{{ Request::is('data-tables') ? 'active' : '' }}"
                                    href="{{ url('data-tables') }}">Data Table </a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /UI Interface -->

                <!-- Settings -->
                <ul>
                    <li class="menu-title"><span>Settings</span></li>
                    <li>
                        <a class="{{ Request::is('settings', 'company-settings', 'invoice-settings', 'template-invoice', 'payment-settings', 'bank-account', 'tax-rates', 'plan-billing', 'two-factor', 'custom-filed', 'email-settings', 'preferences', 'saas-settings', 'seo-settings', 'email-template') ? 'active' : '' }}"
                            href="{{ url('settings') }}"><i class="fe fe-settings"></i> <span>Settings</span></a>
                    </li>
                    <li>
                        <a class="{{ Request::is('login') ? 'active' : '' }}" href="{{ url('login') }}"><i
                                class="fe fe-power"></i> <span>Logout</span></a>
                    </li>
                </ul>
                <!-- /Settings -->

            </div>
        </div>
    </div>
    <!-- /Sidebar -->
@endif
