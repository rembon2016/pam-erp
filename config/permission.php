<?php

return [

    'list' => [
        // 'crm' => [
        //     'crm.dashboard',
        //     'crm.lead',
        //     'crm.quotes',
        //     'crm.mail',
        //     'crm.sales_person',
        //     'crm.organizations',
        //     'crm.persons',
        //     'crm.product',
        //     'crm.activity',
        //     'crm.leads',
        // ],
        // 'human_resource' => [
        //     'hrm.dashboard',
        //     'hrm.master_education_institute',
        //     'hrm.master_education_title',
        //     'hrm.master_skill_group',
        //     'hrm.master_skill',
        //     'hrm.master_region',
        //     'hrm.master_city',
        //     'hrm.master_contract',
        //     'hrm.master_holiday',
        //     'hrm.companies',
        //     'hrm.companies_departement',
        //     'hrm.companies_job_level',
        //     'hrm.companies_job_title',
        //     'hrm.companies_cost',
        //     'hrm.employee',
        //     'hrm.employee_placement',
        //     'hrm.employee_mutation',
        //     'hrm.employee_carrier_history',
        //     'hrm.attendance_reason',
        //     'hrm.attendance_shiftment',
        //     'hrm.attendance_work_shift',
        //     'hrm.attendance',
        //     'hrm.attendance_summary',
        //     'hrm.overtime',
        //     'hrm.leave',
        //     'hrm.leave_reason',
        //     'hrm.payroll_salary_component',
        //     'hrm.payroll_salary_settings',
        //     'hrm.payroll_salary_change',
        //     'hrm.payroll_salary',
        //     'hrm.payroll_allowance',
        //     'hrm.payroll_deduction',
        //     'hrm.payroll_salary_history',
        //     'hrm.address_company',
        //     'hrm.address_employee',
        // ],
        'finance' => [
            // 'finance.dashboard',
            // 'finance.cost_sea_freight',
            // 'finance.cost_air_freight',
            // 'finance.cost_sea_air_freight',
            // 'finance.master_charge',
            // 'finance.master_customer',
            // 'finance.master_contract_agent',
            // 'finance.master_transaction',
            // 'finance.master_unit_type',
            // 'finance.master_vendor',
            // 'finance.master_vendor_shipping_line',
            // 'finance.master_vendor_origin',
            // 'finance.master_vendor_local',
            // 'finance.master_vendor_carrier',
            // 'finance.transaction_shipment_list',
            // 'finance.transaction_invoices',

            // Finance Dashboard Permissions
            'finance.dashboard',

            // Finance Master Data Permissions
            'finance.master_customer' => [
                'finance.show_master_customer' => 'Show',
                'finance.add_master_customer' => 'Add',
                'finance.edit_master_customer' => 'Edit',
                'finance.delete_master_customer' => 'Delete',
                'finance.export_master_customer' => 'Export'
            ],
            'finance.master_customer_contract' => [
                'finance.show_master_customer_contract' => 'Show',
                'finance.add_master_customer_contract' => 'Add',
                'finance.edit_master_customer_contract' => 'Edit',
                'finance.delete_master_customer_contract' => 'Delete',
                'finance.export_master_customer_contract' => 'Export'
            ],
            'finance.master_agent_contract' => [
                'finance.show_master_agent_contract' => 'Show',
                'finance.add_master_agent_contract' => 'Add',
                'finance.edit_master_agent_contract' => 'Edit',
                'finance.delete_master_agent_contract' => 'Delete',
                'finance.export_master_agent_contract' => 'Export'
            ],
            'finance.master_country' => [
                'finance.show_master_country' => 'Show',
                'finance.add_master_country' => 'Add',
                'finance.edit_master_country' => 'Edit',
                'finance.delete_master_country' => 'Delete',
                'finance.export_master_country' => 'Export'
            ],
            'finance.master_port' => [
                'finance.show_master_port' => 'Show',
                'finance.add_master_port' => 'Add',
                'finance.edit_master_port' => 'Edit',
                'finance.delete_master_port' => 'Delete',
                'finance.export_master_port' => 'Export'
            ],
            'finance.master_service_type' => [
                'finance.show_master_service_type' => 'Show',
                'finance.add_master_service_type' => 'Add',
                'finance.edit_master_service_type' => 'Edit',
                'finance.delete_master_service_type' => 'Delete',
                'finance.export_master_service_type' => 'Export'
            ],
            'finance.master_unit' => [
                'finance.show_master_unit' => 'Show',
                'finance.add_master_unit' => 'Add',
                'finance.edit_master_unit' => 'Edit',
                'finance.delete_master_unit' => 'Delete',
                'finance.export_master_unit' => 'Export'
            ],
            'finance.master_payment_method' => [
                'finance.show_master_payment_method' => 'Show',
                'finance.add_master_payment_method' => 'Add',
                'finance.edit_master_payment_method' => 'Edit',
                'finance.delete_master_payment_method' => 'Delete',
                'finance.export_master_payment_method' => 'Export'
            ],
            'finance.master_currency' => [
                'finance.show_master_currency' => 'Show',
                'finance.add_master_currency' => 'Add',
                'finance.edit_master_currency' => 'Edit',
                'finance.delete_master_currency' => 'Delete',
                'finance.export_master_currency' => 'Export'
            ],
            'finance.master_charge' => [
                'finance.show_master_charge' => 'Show',
                'finance.add_master_charge' => 'Add',
                'finance.edit_master_charge' => 'Edit',
                'finance.delete_master_charge' => 'Delete',
                'finance.export_master_charge' => 'Export'
            ],
            'finance.master_chart_of_account' => [
                'finance.show_master_chart_of_account' => 'Show',
                'finance.add_master_chart_of_account' => 'Add',
                'finance.edit_master_chart_of_account' => 'Edit',
                'finance.delete_master_chart_of_account' => 'Delete',
                'finance.export_master_chart_of_account' => 'Export'
            ],
            'finance.master_daybook' => [
                'finance.show_master_daybook' => 'Show',
                'finance.add_master_daybook' => 'Add',
                'finance.edit_master_daybook' => 'Edit',
                'finance.delete_master_daybook' => 'Delete',
                'finance.export_master_daybook' => 'Export'
            ],


            // Finance General Wise Permissions
            'finance.sea_air_shipment' => [
                'finance.show_sea_air_shipment' => 'Show',
                'finance.export_sea_air_shipment' => 'Export',
            ],

            'finance.cross_air_shipment' => [
                'finance.show_cross_air_shipment' => 'Show',
                'finance.export_cross_air_shipment' => 'Export',
            ],

            'finance.sea_import_shipment' => [
                'finance.show_sea_import_shipment' => 'Show',
                'finance.export_sea_import_shipment' => 'Export',
            ],

            'finance.sea_export_shipment' => [
                'finance.show_sea_export_shipment' => 'Show',
                'finance.export_sea_export_shipment' => 'Export',
            ],

            'finance.air_import_shipment' => [
                'finance.show_air_import_shipment' => 'Show',
                'finance.export_air_import_shipment' => 'Export',
            ],

            'finance.air_export_shipment' => [
                'finance.show_air_export_shipment' => 'Show',
                'finance.export_air_export_shipment' => 'Export',
            ],

            'finance.warehouse_shipment' => [
                'finance.show_warehouse_shipment' => 'Show',
                'finance.export_warehouse_shipment' => 'Export',
            ],

            'finance.trucking_shipment' => [
                'finance.show_trucking_shipment' => 'Show',
                'finance.export_trucking_shipment' => 'Export',
            ],

            'finance.courier_shipment' => [
                'finance.show_courier_shipment' => 'Show',
                'finance.export_courier_shipment' => 'Export',
            ],

            'finance.general_wise_ctd' => [
                'finance.show_general_wise_ctd' => 'Show',
                'finance.export_general_wise_ctd' => 'Export',
            ],

            'finance.general_wise_customer' => [
                'finance.show_general_wise_customer' => 'Show',
                'finance.export_general_wise_customer' => 'Export',
            ],

            'finance.general_wise_container' => [
                'finance.show_general_wise_container' => 'Show',
                'finance.export_general_wise_container' => 'Export',
            ],

            'finance.general_wise_tonnage' => [
                'finance.show_general_wise_tonnage' => 'Show',
                'finance.export_general_wise_tonnage' => 'Export',
            ],

            'finance.general_wise_vessel' => [
                'finance.show_general_wise_vessel' => 'Show',
                'finance.export_general_wise_vessel' => 'Export',
            ],

            'finance.general_wise_shipping_line' => [
                'finance.show_general_wise_shipping_line' => 'Show',
                'finance.export_general_wise_shipping_line' => 'Export',
            ],

            'finance.general_wise_carrier' => [
                'finance.show_general_wise_carrier' => 'Show',
                'finance.export_general_wise_carrier' => 'Export',
            ],


            // Finance Billing Permissions
            'finance.billing_invoice' => [
                'finance.show_billing_invoice' => 'Show',
                'finance.add_billing_invoice' => 'Add',
                'finance.edit_billing_invoice' => 'Edit',
                'finance.delete_billing_invoice' => 'Delete',
                'finance.export_billing_invoice' => 'Export',
            ],

            // Finance Costing Permissions
            'finance.sea_air_costing' => [
                'finance.show_sea_air_costing' => 'Show',
                'finance.add_sea_air_costing' => 'Add',
                'finance.edit_sea_air_costing' => 'Edit',
                'finance.delete_sea_air_costing' => 'Delete',
                'finance.export_sea_air_costing' => 'Export',
            ],

            'finance.cross_air_costing' => [
                'finance.show_cross_air_costing' => 'Show',
                'finance.add_cross_air_costing' => 'Add',
                'finance.edit_cross_air_costing' => 'Edit',
                'finance.delete_cross_air_costing' => 'Delete',
                'finance.export_cross_air_costing' => 'Export',
            ],

            'finance.sea_import_costing' => [
                'finance.show_sea_import_costing' => 'Show',
                'finance.add_sea_import_costing' => 'Add',
                'finance.edit_sea_import_costing' => 'Edit',
                'finance.delete_sea_import_costing' => 'Delete',
                'finance.export_sea_import_costing' => 'Export',
            ],

            'finance.sea_export_costing' => [
                'finance.show_sea_export_costing' => 'Show',
                'finance.add_sea_export_costing' => 'Add',
                'finance.edit_sea_export_costing' => 'Edit',
                'finance.delete_sea_export_costing' => 'Delete',
                'finance.export_sea_export_costing' => 'Export',
            ],

            'finance.air_import_costing' => [
                'finance.show_air_import_costing' => 'Show',
                'finance.add_air_import_costing' => 'Add',
                'finance.edit_air_import_costing' => 'Edit',
                'finance.delete_air_import_costing' => 'Delete',
                'finance.export_air_import_costing' => 'Export',
            ],

            'finance.air_export_costing' => [
                'finance.show_air_export_costing' => 'Show',
                'finance.add_air_export_costing' => 'Add',
                'finance.edit_air_export_costing' => 'Edit',
                'finance.delete_air_export_costing' => 'Delete',
                'finance.export_air_export_costing' => 'Export',
            ],

            'finance.warehouse_costing' => [
                'finance.show_warehouse_costing' => 'Show',
                'finance.add_warehouse_costing' => 'Add',
                'finance.edit_warehouse_costing' => 'Edit',
                'finance.delete_warehouse_costing' => 'Delete',
                'finance.export_warehouse_costing' => 'Export',
            ],

            'finance.trucking_costing' => [
                'finance.show_trucking_costing' => 'Show',
                'finance.add_trucking_costing' => 'Add',
                'finance.edit_trucking_costing' => 'Edit',
                'finance.delete_trucking_costing' => 'Delete',
                'finance.export_trucking_costing' => 'Export',
            ],

            'finance.courier_costing' => [
                'finance.show_courier_costing' => 'Show',
                'finance.add_courier_costing' => 'Add',
                'finance.edit_courier_costing' => 'Edit',
                'finance.delete_courier_costing' => 'Delete',
                'finance.export_courier_costing' => 'Export',
            ],
        ],
        'accounting' => [
            // 'acc.dashboard',
            // 'acc.master_accounts',
            // 'acc.transaction_journal',
            // 'acc.transaction_journal_entries',
            // 'acc.transaction_automatic',
            // 'acc.report_cashflow',
            // 'acc.report_balance_sheet',
            // 'acc.report_cashflow_balance_sheet',
            // 'acc.report_profit_and_loss',

            'accounting.general_ledger_report' => [
                'accounting.export_general_ledger_report' => 'Export'
            ],
            'accounting.trial_balance_report' => [
                'accounting.export_trial_balance_report' => 'Export'
            ],
            'accounting.balance_sheet_statement' => [
                'accounting.export_balance_sheet_statement' => 'Export'
            ],
            'accounting.profit_and_loss_statement' => [
                'accounting.export_profit_and_loss_statement' => 'Export'
            ],
            'accounting.cashflow_statement' => [
                'accounting.export_cashflow_statement' => 'Export'
            ],
        ],
        'settings' => [
            'settings.user' => [
                'settings.show_user' => 'Show',
                'settings.add_user' => 'Add',
                'settings.edit_user' => 'Edit',
                'settings.delete_user' => 'Delete',
                'settings.export_user' => 'Export',
            ],
            'settings.role' => [
                'settings.show_role' => 'Show',
                'settings.add_role' => 'Add',
                'settings.edit_role' => 'Edit',
                'settings.delete_role' => 'Delete',
                'settings.export_role' => 'Export',
            ],
        ],
    ],

    'models' => [

        /*
         * When using the "HasPermissions" trait from this package, we need to know which
         * Eloquent model should be used to retrieve your permissions. Of course, it
         * is often just the "Permission" model but you may use whatever you like.
         *
         * The model you want to use as a Permission model needs to implement the
         * `Spatie\Permission\Contracts\Permission` contract.
         */

        'permission' => App\Models\Permission::class,

        /*
         * When using the "HasRoles" trait from this package, we need to know which
         * Eloquent model should be used to retrieve your roles. Of course, it
         * is often just the "Role" model but you may use whatever you like.
         *
         * The model you want to use as a Role model needs to implement the
         * `Spatie\Permission\Contracts\Role` contract.
         */

        'role' => App\Models\Role::class,

    ],

    'table_names' => [

        /*
         * When using the "HasRoles" trait from this package, we need to know which
         * table should be used to retrieve your roles. We have chosen a basic
         * default value but you may easily change it to any table you like.
         */

        'roles' => 'usrs.roles',

        /*
         * When using the "HasPermissions" trait from this package, we need to know which
         * table should be used to retrieve your permissions. We have chosen a basic
         * default value but you may easily change it to any table you like.
         */

        'permissions' => 'usrs.permissions',

        /*
         * When using the "HasPermissions" trait from this package, we need to know which
         * table should be used to retrieve your models permissions. We have chosen a
         * basic default value but you may easily change it to any table you like.
         */

        'model_has_permissions' => 'usrs.model_has_permissions',

        /*
         * When using the "HasRoles" trait from this package, we need to know which
         * table should be used to retrieve your models roles. We have chosen a
         * basic default value but you may easily change it to any table you like.
         */

        'model_has_roles' => 'usrs.model_has_roles',

        /*
         * When using the "HasRoles" trait from this package, we need to know which
         * table should be used to retrieve your roles permissions. We have chosen a
         * basic default value but you may easily change it to any table you like.
         */

        'role_has_permissions' => 'usrs.role_has_permissions',
    ],

    'column_names' => [
        /*
         * Change this if you want to name the related pivots other than defaults
         */
        'role_pivot_key' => null, //default 'role_id',
        'permission_pivot_key' => null, //default 'permission_id',

        /*
         * Change this if you want to name the related model primary key other than
         * `model_id`.
         *
         * For example, this would be nice if your primary keys are all UUIDs. In
         * that case, name this `model_uuid`.
         */

        'model_morph_key' => 'model_id',

        /*
         * Change this if you want to use the teams feature and your related model's
         * foreign key is other than `team_id`.
         */

        'team_foreign_key' => 'team_id',
    ],

    /*
     * When set to true, the method for checking permissions will be registered on the gate.
     * Set this to false if you want to implement custom logic for checking permissions.
     */

    'register_permission_check_method' => true,

    /*
     * When set to true, Laravel\Octane\Events\OperationTerminated event listener will be registered
     * this will refresh permissions on every TickTerminated, TaskTerminated and RequestTerminated
     * NOTE: This should not be needed in most cases, but an Octane/Vapor combination benefited from it.
     */
    'register_octane_reset_listener' => false,

    /*
     * Teams Feature.
     * When set to true the package implements teams using the 'team_foreign_key'.
     * If you want the migrations to register the 'team_foreign_key', you must
     * set this to true before doing the migration.
     * If you already did the migration then you must make a new migration to also
     * add 'team_foreign_key' to 'roles', 'model_has_roles', and 'model_has_permissions'
     * (view the latest version of this package's migration file)
     */

    'teams' => false,

    /*
     * Passport Client Credentials Grant
     * When set to true the package will use Passports Client to check permissions
     */

    'use_passport_client_credentials' => false,

    /*
     * When set to true, the required permission names are added to exception messages.
     * This could be considered an information leak in some contexts, so the default
     * setting is false here for optimum safety.
     */

    'display_permission_in_exception' => false,

    /*
     * When set to true, the required role names are added to exception messages.
     * This could be considered an information leak in some contexts, so the default
     * setting is false here for optimum safety.
     */

    'display_role_in_exception' => false,

    /*
     * By default wildcard permission lookups are disabled.
     * See documentation to understand supported syntax.
     */

    'enable_wildcard_permission' => false,

    /*
     * The class to use for interpreting wildcard permissions.
     * If you need to modify delimiters, override the class and specify its name here.
     */
    // 'permission.wildcard_permission' => Spatie\Permission\WildcardPermission::class,

    /* Cache-specific settings */

    'cache' => [

        /*
         * By default all permissions are cached for 24 hours to speed up performance.
         * When permissions or roles are updated the cache is flushed automatically.
         */

        'expiration_time' => \DateInterval::createFromDateString('24 hours'),

        /*
         * The cache key used to store all permissions.
         */

        'key' => 'spatie.permission.cache',

        /*
         * You may optionally indicate a specific cache driver to use for permission and
         * role caching using any of the `store` drivers listed in the cache.php config
         * file. Using 'default' here means to use the `default` set in cache.php.
         */

        'store' => 'default',
    ],
];
