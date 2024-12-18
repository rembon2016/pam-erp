/*
 Navicat Premium Dump SQL

 Source Server         : Dev-203.175.10.178
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : usrs

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/12/2024 18:36:52
*/


-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."model_has_permissions";
CREATE TABLE "usrs"."model_has_permissions" (
  "permission_id" uuid NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."model_has_roles";
CREATE TABLE "usrs"."model_has_roles" (
  "role_id" uuid NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc7-1f73-4065-94ad-129747dd1a50', 'App\Models\User', '9d77dcc8-f58d-423c-b90f-ed86b0649e0b');
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc7-7465-4194-a018-af2298cf3df8', 'App\Models\User', '9d77dcc9-a493-4a66-a01d-c8e7c02e4318');
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc7-b14c-475e-8337-fb036fc0ddbf', 'App\Models\User', '9d77dcca-1a73-48ce-b7b5-a1524b19ecba');
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc7-eb4b-4353-afce-1f866dba9d40', 'App\Models\User', '9d77dcca-95ba-466c-8c08-67007ae5f2b2');
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc8-235a-42e0-83a9-c94eb07ec446', 'App\Models\User', '9d77dccb-106f-410a-add6-1c21a022af2b');
INSERT INTO "usrs"."model_has_roles" VALUES ('9d77dcc7-1f73-4065-94ad-129747dd1a50', 'App\Models\Usr\User', '9d77dcc8-f58d-423c-b90f-ed86b0649e0b');

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."password_reset_tokens";
CREATE TABLE "usrs"."password_reset_tokens" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."permissions";
CREATE TABLE "usrs"."permissions" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "usrs"."permissions" VALUES ('a02ac594-1f1c-42b1-9c02-34897e9f2939', 'crm.dashboard', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('a9ae8f2a-936b-429c-87d6-3b7f02929e6f', 'crm.lead', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('5d2a1328-bd30-4a33-8be5-cac8702d77be', 'crm.quotes', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('a01e0409-fefa-4043-a9a2-bbc708dda4af', 'crm.mail', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('b736a4c1-b58d-4d91-b3a0-a497fd98d276', 'crm.sales_person', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('1e6861eb-c9db-4192-9b03-9f8e9ed787c9', 'crm.organizations', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('58f177d4-77fa-4d83-9d74-24ef8426a059', 'crm.persons', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('711a70b3-5901-4f3a-8881-9e1c87006a9d', 'crm.product', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('8b9941c7-6b2a-4f7d-b2dc-793d431d549d', 'crm.activity', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('182ce89c-2947-47b3-a1d0-f06bbcfdab99', 'crm.leads', 'web', 'crm', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('623f3665-63af-46f9-830d-cd246582ffc4', 'hrm.dashboard', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('1f0b2d50-954f-42bf-aefa-6527e13b9d6b', 'hrm.master_education_institute', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('5cea8219-dd11-4fbf-839f-803853683e27', 'hrm.master_education_title', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('9673aea9-3b0c-4923-a431-b908156d91f8', 'hrm.master_skill_group', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('a8340f09-299f-41b3-9e6d-6d378df521db', 'hrm.master_skill', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e67c06b1-563f-4886-b5b7-7d0b5f1624df', 'hrm.master_region', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('9425f22d-912d-4ed1-9a43-98f24334d00c', 'hrm.master_city', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('2f0d0374-c71a-470c-828a-b110f245596d', 'hrm.master_contract', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('2a2d404d-3932-49a8-be6f-0441734b263e', 'hrm.master_holiday', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('f28013d3-ee2b-4c91-9f3b-86f191938180', 'hrm.companies', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e4c795a3-7621-468c-bbd2-ab54a8346bfa', 'hrm.companies_departement', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e747360c-075c-4c67-9bec-4e78baf08d87', 'hrm.companies_job_level', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('df0af986-995f-4685-b41e-a863e9da0bd7', 'hrm.companies_job_title', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('c1f6977f-9b31-400f-882e-e4973dd3980b', 'hrm.companies_cost', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('52a4aeef-e400-4bb5-8589-99f71674b864', 'hrm.employee', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('2edfa9ee-1d33-46ee-a13e-4130cd0a1a57', 'hrm.employee_placement', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('67164c21-88a7-4e9a-ba49-2e3b270e5a35', 'hrm.employee_mutation', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('8c1f90ea-491a-4ab1-909d-4acb82d248b9', 'hrm.employee_carrier_history', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('32b4ef90-44f6-4b29-a95b-c3df1bb5595c', 'hrm.attendance_reason', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('09f1dc44-5198-4c48-adc0-8adc730eac86', 'hrm.attendance_shiftment', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('130b363b-8fa4-47b9-86de-2c47e6426285', 'hrm.attendance_work_shift', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('466d75c9-dc38-41b6-a581-02ffddcbc086', 'hrm.attendance', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e001df6d-4943-4e80-a45a-a6b0b6bcaf09', 'hrm.attendance_summary', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e1a470ce-1982-4b0a-9f9b-96003bc768cb', 'hrm.overtime', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('f68c4bcb-0eba-4194-a676-7f5f9c7ffe30', 'hrm.leave', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('bb00d55b-15fb-40fe-a671-d7bcc632532d', 'hrm.leave_reason', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('4aef75fb-ff71-4444-ba7f-57cad7fb63ff', 'hrm.payroll_salary_component', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('bb3893df-c2cd-43ca-995c-aa9c7563191a', 'hrm.payroll_salary_settings', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e3cc9219-d5b5-4cdb-b4fb-8de003696a13', 'hrm.payroll_salary_change', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('f7bfaf33-739b-4c36-98b3-8c9973d489a8', 'hrm.payroll_salary', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('bf866fd9-4768-4037-beac-b5a90072f166', 'hrm.payroll_allowance', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('d7a0588c-0607-47ff-8bf3-01cf60a1dd22', 'hrm.payroll_deduction', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('c43cdd32-a893-42eb-91e9-b6663293a378', 'hrm.payroll_salary_history', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('9848482f-b907-4dbf-a1c9-8ea107300927', 'hrm.address_company', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('3c65e36a-da54-4abb-91a9-e76783d6024c', 'hrm.address_employee', 'web', 'human_resource', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('e16daad5-70f2-449f-bf6a-53bde5b5f47a', 'finance.dashboard', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('47d34428-607d-4237-815a-3c1589240b75', 'finance.cost_sea_freight', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('f6d0128c-c1e0-49ca-bd0e-e9fc3f44e885', 'finance.cost_air_freight', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('0c754d55-6278-408d-969c-87c6e93595c6', 'finance.cost_sea_air_freight', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('50b12391-196f-4fd9-bc55-2c6443e2b194', 'finance.master_charge', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('cb63a42c-df7e-42dd-a027-ec0d810ca04c', 'finance.master_customer', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('28bb9e3c-b992-4453-a661-c847206ea41d', 'finance.master_contract_agent', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('2a69aa6b-e797-42ff-9ab0-7a60d0373d22', 'finance.master_transaction', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('7f597a3d-a20d-4247-abfc-6610a5d5ae7a', 'finance.master_unit_type', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('1b4e253f-5462-4a58-a6d6-a157945c3aea', 'finance.master_vendor', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('ee2d9b8a-4c2e-4ba4-8e56-9f7addc4f79b', 'finance.master_vendor_shipping_line', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('0d5a7618-bd73-49b2-970e-2258b592a382', 'finance.master_vendor_origin', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('eccb5dab-e031-44be-b6db-3241790c5ae0', 'finance.master_vendor_local', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('b7db56c2-4206-400a-a2d7-4195b00c11ac', 'finance.master_vendor_carrier', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('a00b7714-504c-4970-a2e7-cc928004b28d', 'finance.transaction_shipment_list', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('2d981e7a-7f23-47b4-b985-be8a6459c1e8', 'finance.transaction_invoices', 'web', 'finance', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('b9ca2431-ccc5-41a4-a862-221093dc91f5', 'acc.dashboard', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('42f351e8-4ee4-4f01-a357-eca574129a83', 'acc.master_accounts', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('f4ca45c6-a5e3-49c6-a3bc-1b61f9d84298', 'acc.transaction_journal', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('7b773446-2dff-4360-a5d4-46b46676bcd7', 'acc.transaction_journal_entries', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('3e4e3600-96e4-4bbe-a00d-e76eb3227bcb', 'acc.transaction_automatic', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('4401b7f6-918d-4c42-b5ff-cee856058680', 'acc.report_cashflow', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('67fd74d5-b1ef-4afa-b5d5-8ae7b1647982', 'acc.report_balance_sheet', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('3edea477-33ea-4a5d-836c-a4a183d1d5fd', 'acc.report_cashflow_balance_sheet', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('dec96eeb-4bed-4c13-9ec8-6a95af1b4365', 'acc.report_profit_and_loss', 'web', 'accounting', NULL, NULL);
INSERT INTO "usrs"."permissions" VALUES ('1f457ba9-f642-410d-8751-bc604ec8c0e4', 'role', 'web', 'user', NULL, NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."role_has_permissions";
CREATE TABLE "usrs"."role_has_permissions" (
  "permission_id" uuid NOT NULL,
  "role_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO "usrs"."role_has_permissions" VALUES ('a02ac594-1f1c-42b1-9c02-34897e9f2939', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a9ae8f2a-936b-429c-87d6-3b7f02929e6f', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('5d2a1328-bd30-4a33-8be5-cac8702d77be', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a01e0409-fefa-4043-a9a2-bbc708dda4af', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b736a4c1-b58d-4d91-b3a0-a497fd98d276', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1e6861eb-c9db-4192-9b03-9f8e9ed787c9', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('58f177d4-77fa-4d83-9d74-24ef8426a059', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('711a70b3-5901-4f3a-8881-9e1c87006a9d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('8b9941c7-6b2a-4f7d-b2dc-793d431d549d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('182ce89c-2947-47b3-a1d0-f06bbcfdab99', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('623f3665-63af-46f9-830d-cd246582ffc4', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1f0b2d50-954f-42bf-aefa-6527e13b9d6b', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('5cea8219-dd11-4fbf-839f-803853683e27', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9673aea9-3b0c-4923-a431-b908156d91f8', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a8340f09-299f-41b3-9e6d-6d378df521db', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e67c06b1-563f-4886-b5b7-7d0b5f1624df', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9425f22d-912d-4ed1-9a43-98f24334d00c', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2f0d0374-c71a-470c-828a-b110f245596d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2a2d404d-3932-49a8-be6f-0441734b263e', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f28013d3-ee2b-4c91-9f3b-86f191938180', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e4c795a3-7621-468c-bbd2-ab54a8346bfa', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e747360c-075c-4c67-9bec-4e78baf08d87', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('df0af986-995f-4685-b41e-a863e9da0bd7', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('c1f6977f-9b31-400f-882e-e4973dd3980b', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('52a4aeef-e400-4bb5-8589-99f71674b864', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2edfa9ee-1d33-46ee-a13e-4130cd0a1a57', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('67164c21-88a7-4e9a-ba49-2e3b270e5a35', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('8c1f90ea-491a-4ab1-909d-4acb82d248b9', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('32b4ef90-44f6-4b29-a95b-c3df1bb5595c', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('09f1dc44-5198-4c48-adc0-8adc730eac86', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('130b363b-8fa4-47b9-86de-2c47e6426285', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('466d75c9-dc38-41b6-a581-02ffddcbc086', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e001df6d-4943-4e80-a45a-a6b0b6bcaf09', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e1a470ce-1982-4b0a-9f9b-96003bc768cb', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f68c4bcb-0eba-4194-a676-7f5f9c7ffe30', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bb00d55b-15fb-40fe-a671-d7bcc632532d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('4aef75fb-ff71-4444-ba7f-57cad7fb63ff', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bb3893df-c2cd-43ca-995c-aa9c7563191a', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e3cc9219-d5b5-4cdb-b4fb-8de003696a13', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f7bfaf33-739b-4c36-98b3-8c9973d489a8', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bf866fd9-4768-4037-beac-b5a90072f166', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('d7a0588c-0607-47ff-8bf3-01cf60a1dd22', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('c43cdd32-a893-42eb-91e9-b6663293a378', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9848482f-b907-4dbf-a1c9-8ea107300927', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3c65e36a-da54-4abb-91a9-e76783d6024c', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e16daad5-70f2-449f-bf6a-53bde5b5f47a', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('47d34428-607d-4237-815a-3c1589240b75', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f6d0128c-c1e0-49ca-bd0e-e9fc3f44e885', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('0c754d55-6278-408d-969c-87c6e93595c6', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('50b12391-196f-4fd9-bc55-2c6443e2b194', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('cb63a42c-df7e-42dd-a027-ec0d810ca04c', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('28bb9e3c-b992-4453-a661-c847206ea41d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2a69aa6b-e797-42ff-9ab0-7a60d0373d22', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('7f597a3d-a20d-4247-abfc-6610a5d5ae7a', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1b4e253f-5462-4a58-a6d6-a157945c3aea', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('ee2d9b8a-4c2e-4ba4-8e56-9f7addc4f79b', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('0d5a7618-bd73-49b2-970e-2258b592a382', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('eccb5dab-e031-44be-b6db-3241790c5ae0', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b7db56c2-4206-400a-a2d7-4195b00c11ac', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a00b7714-504c-4970-a2e7-cc928004b28d', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2d981e7a-7f23-47b4-b985-be8a6459c1e8', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b9ca2431-ccc5-41a4-a862-221093dc91f5', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('42f351e8-4ee4-4f01-a357-eca574129a83', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f4ca45c6-a5e3-49c6-a3bc-1b61f9d84298', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('7b773446-2dff-4360-a5d4-46b46676bcd7', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3e4e3600-96e4-4bbe-a00d-e76eb3227bcb', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('4401b7f6-918d-4c42-b5ff-cee856058680', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('67fd74d5-b1ef-4afa-b5d5-8ae7b1647982', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3edea477-33ea-4a5d-836c-a4a183d1d5fd', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('dec96eeb-4bed-4c13-9ec8-6a95af1b4365', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1f457ba9-f642-410d-8751-bc604ec8c0e4', '9d77dcc7-1f73-4065-94ad-129747dd1a50');
INSERT INTO "usrs"."role_has_permissions" VALUES ('623f3665-63af-46f9-830d-cd246582ffc4', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1f0b2d50-954f-42bf-aefa-6527e13b9d6b', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('5cea8219-dd11-4fbf-839f-803853683e27', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9673aea9-3b0c-4923-a431-b908156d91f8', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a8340f09-299f-41b3-9e6d-6d378df521db', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e67c06b1-563f-4886-b5b7-7d0b5f1624df', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9425f22d-912d-4ed1-9a43-98f24334d00c', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2f0d0374-c71a-470c-828a-b110f245596d', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2a2d404d-3932-49a8-be6f-0441734b263e', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f28013d3-ee2b-4c91-9f3b-86f191938180', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e4c795a3-7621-468c-bbd2-ab54a8346bfa', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e747360c-075c-4c67-9bec-4e78baf08d87', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('df0af986-995f-4685-b41e-a863e9da0bd7', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('c1f6977f-9b31-400f-882e-e4973dd3980b', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('52a4aeef-e400-4bb5-8589-99f71674b864', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2edfa9ee-1d33-46ee-a13e-4130cd0a1a57', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('67164c21-88a7-4e9a-ba49-2e3b270e5a35', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('8c1f90ea-491a-4ab1-909d-4acb82d248b9', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('32b4ef90-44f6-4b29-a95b-c3df1bb5595c', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('09f1dc44-5198-4c48-adc0-8adc730eac86', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('130b363b-8fa4-47b9-86de-2c47e6426285', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('466d75c9-dc38-41b6-a581-02ffddcbc086', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e001df6d-4943-4e80-a45a-a6b0b6bcaf09', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e1a470ce-1982-4b0a-9f9b-96003bc768cb', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f68c4bcb-0eba-4194-a676-7f5f9c7ffe30', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bb00d55b-15fb-40fe-a671-d7bcc632532d', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('4aef75fb-ff71-4444-ba7f-57cad7fb63ff', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bb3893df-c2cd-43ca-995c-aa9c7563191a', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e3cc9219-d5b5-4cdb-b4fb-8de003696a13', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f7bfaf33-739b-4c36-98b3-8c9973d489a8', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('bf866fd9-4768-4037-beac-b5a90072f166', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('d7a0588c-0607-47ff-8bf3-01cf60a1dd22', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('c43cdd32-a893-42eb-91e9-b6663293a378', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('9848482f-b907-4dbf-a1c9-8ea107300927', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3c65e36a-da54-4abb-91a9-e76783d6024c', '9d77dcc7-7465-4194-a018-af2298cf3df8');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b9ca2431-ccc5-41a4-a862-221093dc91f5', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('42f351e8-4ee4-4f01-a357-eca574129a83', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f4ca45c6-a5e3-49c6-a3bc-1b61f9d84298', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('7b773446-2dff-4360-a5d4-46b46676bcd7', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3e4e3600-96e4-4bbe-a00d-e76eb3227bcb', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('4401b7f6-918d-4c42-b5ff-cee856058680', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('67fd74d5-b1ef-4afa-b5d5-8ae7b1647982', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('3edea477-33ea-4a5d-836c-a4a183d1d5fd', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('dec96eeb-4bed-4c13-9ec8-6a95af1b4365', '9d77dcc7-b14c-475e-8337-fb036fc0ddbf');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a02ac594-1f1c-42b1-9c02-34897e9f2939', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a9ae8f2a-936b-429c-87d6-3b7f02929e6f', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('5d2a1328-bd30-4a33-8be5-cac8702d77be', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a01e0409-fefa-4043-a9a2-bbc708dda4af', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b736a4c1-b58d-4d91-b3a0-a497fd98d276', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1e6861eb-c9db-4192-9b03-9f8e9ed787c9', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('58f177d4-77fa-4d83-9d74-24ef8426a059', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('711a70b3-5901-4f3a-8881-9e1c87006a9d', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('8b9941c7-6b2a-4f7d-b2dc-793d431d549d', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('182ce89c-2947-47b3-a1d0-f06bbcfdab99', '9d77dcc7-eb4b-4353-afce-1f866dba9d40');
INSERT INTO "usrs"."role_has_permissions" VALUES ('e16daad5-70f2-449f-bf6a-53bde5b5f47a', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('47d34428-607d-4237-815a-3c1589240b75', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('f6d0128c-c1e0-49ca-bd0e-e9fc3f44e885', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('0c754d55-6278-408d-969c-87c6e93595c6', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('50b12391-196f-4fd9-bc55-2c6443e2b194', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('cb63a42c-df7e-42dd-a027-ec0d810ca04c', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('28bb9e3c-b992-4453-a661-c847206ea41d', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2a69aa6b-e797-42ff-9ab0-7a60d0373d22', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('7f597a3d-a20d-4247-abfc-6610a5d5ae7a', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('1b4e253f-5462-4a58-a6d6-a157945c3aea', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('ee2d9b8a-4c2e-4ba4-8e56-9f7addc4f79b', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('0d5a7618-bd73-49b2-970e-2258b592a382', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('eccb5dab-e031-44be-b6db-3241790c5ae0', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('b7db56c2-4206-400a-a2d7-4195b00c11ac', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('a00b7714-504c-4970-a2e7-cc928004b28d', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');
INSERT INTO "usrs"."role_has_permissions" VALUES ('2d981e7a-7f23-47b4-b985-be8a6459c1e8', '9d77dcc8-235a-42e0-83a9-c94eb07ec446');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "usrs"."roles";
CREATE TABLE "usrs"."roles" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "usrs"."roles" VALUES ('9d77dcc7-1f73-4065-94ad-129747dd1a50', 'admin', 'web', '2024-11-12 03:15:07', '2024-11-12 03:15:07');
INSERT INTO "usrs"."roles" VALUES ('9d77dcc7-7465-4194-a018-af2298cf3df8', 'human_resource', 'web', '2024-11-12 03:15:07', '2024-11-12 03:15:07');
INSERT INTO "usrs"."roles" VALUES ('9d77dcc7-b14c-475e-8337-fb036fc0ddbf', 'accounting', 'web', '2024-11-12 03:15:07', '2024-11-12 03:15:07');
INSERT INTO "usrs"."roles" VALUES ('9d77dcc7-eb4b-4353-afce-1f866dba9d40', 'sales_team', 'web', '2024-11-12 03:15:07', '2024-11-12 03:15:07');
INSERT INTO "usrs"."roles" VALUES ('9d77dcc8-235a-42e0-83a9-c94eb07ec446', 'finance', 'web', '2024-11-12 03:15:07', '2024-11-12 03:15:07');

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "usrs"."users" VALUES ('9d77dcc8-f58d-423c-b90f-ed86b0649e0b', 'Retta', 'Klein', 'https://via.placeholder.com/640x480.png/008844?text=excepturi', 'admin@pamcargo.com', '$2y$12$xCnocsG50KTKkyxtF.BfNeTgdqJlKLd4BzSqG6uZURPA10sURYm2C', '2024-11-12 03:15:07', NULL, '2024-11-12 03:15:08', '2024-11-12 03:15:08', NULL, NULL, NULL, NULL);
INSERT INTO "usrs"."users" VALUES ('9d77dcc9-a493-4a66-a01d-c8e7c02e4318', 'Yessenia', 'Rolfson', 'https://via.placeholder.com/640x480.png/00cc44?text=autem', 'human_resource@pamcargo.com', '$2y$12$HwThvkLGEhiIInw9Im4lz.2nVvJCFpsJU7RcrY8IPQp1SMaT/XNB6', '2024-11-12 03:15:08', NULL, '2024-11-12 03:15:08', '2024-11-12 03:15:08', NULL, NULL, NULL, NULL);
INSERT INTO "usrs"."users" VALUES ('9d77dcca-1a73-48ce-b7b5-a1524b19ecba', 'Moses', 'Haley', 'https://via.placeholder.com/640x480.png/002299?text=sit', 'accounting@pamcargo.com', '$2y$12$o64r38Xhd19Wu8zA4152FONj9orQwngr4e8O5Px3XLcbbHVV0HwF6', '2024-11-12 03:15:08', NULL, '2024-11-12 03:15:09', '2024-11-12 03:15:09', NULL, NULL, NULL, NULL);
INSERT INTO "usrs"."users" VALUES ('9d77dcca-95ba-466c-8c08-67007ae5f2b2', 'Maximillian', 'Okuneva', 'https://via.placeholder.com/640x480.png/008855?text=amet', 'sales_team@pamcargo.com', '$2y$12$WL4NeyiJ08NjPduEpBGN9eAYw2D5ueTmFimstymnXJenclyNYTHsW', '2024-11-12 03:15:09', NULL, '2024-11-12 03:15:09', '2024-11-12 03:15:09', NULL, NULL, NULL, NULL);
INSERT INTO "usrs"."users" VALUES ('9d77dccb-106f-410a-add6-1c21a022af2b', 'Annie', 'Smith', 'https://via.placeholder.com/640x480.png/0077ee?text=ut', 'finance@pamcargo.com', '$2y$12$okv7xsjkTAMoRYna3kOtEO2nuTFDKN/JVc7MUybcOkuGsM48UJvp2', '2024-11-12 03:15:09', NULL, '2024-11-12 03:15:09', '2024-11-12 03:15:09', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Indexes structure for table model_has_permissions
-- ----------------------------
CREATE INDEX "model_has_permissions_model_id_model_type_index" ON "usrs"."model_has_permissions" USING btree (
  "model_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "usrs"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_pkey" PRIMARY KEY ("permission_id", "model_id", "model_type");

-- ----------------------------
-- Indexes structure for table model_has_roles
-- ----------------------------
CREATE INDEX "model_has_roles_model_id_model_type_index" ON "usrs"."model_has_roles" USING btree (
  "model_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_roles
-- ----------------------------
ALTER TABLE "usrs"."model_has_roles" ADD CONSTRAINT "model_has_roles_pkey" PRIMARY KEY ("role_id", "model_id", "model_type");

-- ----------------------------
-- Primary Key structure for table password_reset_tokens
-- ----------------------------
ALTER TABLE "usrs"."password_reset_tokens" ADD CONSTRAINT "password_reset_tokens_pkey" PRIMARY KEY ("email");

-- ----------------------------
-- Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "usrs"."permissions" ADD CONSTRAINT "usr_permissions_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "usrs"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "usrs"."role_has_permissions" ADD CONSTRAINT "role_has_permissions_pkey" PRIMARY KEY ("permission_id", "role_id");

-- ----------------------------
-- Uniques structure for table roles
-- ----------------------------
ALTER TABLE "usrs"."roles" ADD CONSTRAINT "usr_roles_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "usrs"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "usrs"."users" ADD CONSTRAINT "usr_users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "usrs"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "usrs"."model_has_permissions" ADD CONSTRAINT "usr_model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "usrs"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table model_has_roles
-- ----------------------------
ALTER TABLE "usrs"."model_has_roles" ADD CONSTRAINT "usr_model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "usrs"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table role_has_permissions
-- ----------------------------
ALTER TABLE "usrs"."role_has_permissions" ADD CONSTRAINT "usr_role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "usrs"."permissions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "usrs"."role_has_permissions" ADD CONSTRAINT "usr_role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "usrs"."roles" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
