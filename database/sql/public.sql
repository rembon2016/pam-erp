/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:29:41
*/


-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for failed_jobs_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq1";
CREATE SEQUENCE "public"."failed_jobs_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq1";
CREATE SEQUENCE "public"."migrations_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq";
CREATE SEQUENCE "public"."personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."personal_access_tokens_id_seq1";
CREATE SEQUENCE "public"."personal_access_tokens_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int4 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" uuid,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for file_storages
-- ----------------------------
DROP TABLE IF EXISTS "public"."file_storages";
CREATE TABLE "public"."file_storages" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "size" int4 NOT NULL,
  "driver" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "extension" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "original_name" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "path" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(50) COLLATE "pg_catalog"."default",
  "url" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "module_name" varchar(255) COLLATE "pg_catalog"."default",
  "feature_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."file_storages"."size" IS 'File Size';
COMMENT ON COLUMN "public"."file_storages"."driver" IS 'File Driver';
COMMENT ON COLUMN "public"."file_storages"."extension" IS 'File Extension';
COMMENT ON COLUMN "public"."file_storages"."original_name" IS 'File Original Name';
COMMENT ON COLUMN "public"."file_storages"."name" IS 'File Name';
COMMENT ON COLUMN "public"."file_storages"."url" IS 'File Url';

-- ----------------------------
-- Records of file_storages
-- ----------------------------

-- ----------------------------
-- Table structure for hasil
-- ----------------------------
DROP TABLE IF EXISTS "public"."hasil";
CREATE TABLE "public"."hasil" (
  "max" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of hasil
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq1'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (1, '0000_09_22_081537_create_migration_schema', 1);
INSERT INTO "public"."migrations" VALUES (2, '2014_09_25_065553_create_users_table', 1);
INSERT INTO "public"."migrations" VALUES (3, '2014_10_12_100000_create_user_password_resets_table', 1);
INSERT INTO "public"."migrations" VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO "public"."migrations" VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO "public"."migrations" VALUES (6, '2023_05_31_025636_create_permission_tables', 1);
INSERT INTO "public"."migrations" VALUES (7, '2023_09_20_033808_create_activities_table', 1);
INSERT INTO "public"."migrations" VALUES (8, '2023_09_20_034918_create_activity_files_table', 1);
INSERT INTO "public"."migrations" VALUES (9, '2023_09_20_035508_create_activity_participants_table', 1);
INSERT INTO "public"."migrations" VALUES (10, '2023_09_20_040041_create_attribute_options_table', 1);
INSERT INTO "public"."migrations" VALUES (11, '2023_09_20_040809_create_attribute_values_table', 1);
INSERT INTO "public"."migrations" VALUES (12, '2023_09_20_042148_create_attributes_table', 1);
INSERT INTO "public"."migrations" VALUES (13, '2023_09_20_042959_create_core_config_table', 1);
INSERT INTO "public"."migrations" VALUES (14, '2023_09_20_043520_create_countries_table', 1);
INSERT INTO "public"."migrations" VALUES (15, '2023_09_20_043956_create_country_states_table', 1);
INSERT INTO "public"."migrations" VALUES (16, '2023_09_20_044305_create_email_attachments_table', 1);
INSERT INTO "public"."migrations" VALUES (17, '2023_09_20_045024_create_email_templates_table', 1);
INSERT INTO "public"."migrations" VALUES (18, '2023_09_20_045532_create_emails_table', 1);
INSERT INTO "public"."migrations" VALUES (19, '2023_09_20_061840_create_groups_table', 1);
INSERT INTO "public"."migrations" VALUES (20, '2023_09_20_062401_create_lead_pipeline_stage', 1);
INSERT INTO "public"."migrations" VALUES (21, '2023_09_20_062734_create_lead_pipelines_table', 1);
INSERT INTO "public"."migrations" VALUES (22, '2023_09_20_063053_create_lead_products_table', 1);
INSERT INTO "public"."migrations" VALUES (23, '2023_09_20_064048_create_lead_sources_table', 1);
INSERT INTO "public"."migrations" VALUES (24, '2023_09_20_064326_create_lead_stages_table', 1);
INSERT INTO "public"."migrations" VALUES (25, '2023_09_20_064819_create_lead_types_table', 1);
INSERT INTO "public"."migrations" VALUES (26, '2023_09_20_065018_create_leads_table', 1);
INSERT INTO "public"."migrations" VALUES (27, '2023_09_20_065019_create_lead_activities_table', 1);
INSERT INTO "public"."migrations" VALUES (28, '2023_09_20_071153_create_organizations_table', 1);
INSERT INTO "public"."migrations" VALUES (29, '2023_09_20_071653_create_persons_table', 1);
INSERT INTO "public"."migrations" VALUES (30, '2023_09_20_072632_create_products_table', 1);
INSERT INTO "public"."migrations" VALUES (31, '2023_09_20_072922_create_quote_items_table', 1);
INSERT INTO "public"."migrations" VALUES (32, '2023_09_20_075938_create_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (33, '2023_09_20_075939_create_lead_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (34, '2023_09_20_081002_create_sales_person_table', 1);
INSERT INTO "public"."migrations" VALUES (35, '2023_09_20_082122_create_tags_table', 1);
INSERT INTO "public"."migrations" VALUES (36, '2023_09_20_082123_create_lead_tags_table', 1);
INSERT INTO "public"."migrations" VALUES (37, '2023_09_20_083458_create_web_form_attribute_table', 1);
INSERT INTO "public"."migrations" VALUES (38, '2023_09_20_083845_create_web_forms_table', 1);
INSERT INTO "public"."migrations" VALUES (39, '2023_09_20_084325_create_workflows_table', 1);
INSERT INTO "public"."migrations" VALUES (40, '2023_09_20_100451_add_attribute_id_to_attribute_options_table', 1);
INSERT INTO "public"."migrations" VALUES (41, '2023_09_20_100947_add_attribute_id_to_attribute_values_table', 1);
INSERT INTO "public"."migrations" VALUES (42, '2023_09_20_101214_add_email_id_to_email_attachments_table', 1);
INSERT INTO "public"."migrations" VALUES (43, '2023_09_20_101414_add_person_and_lead_id_to_emails_table', 1);
INSERT INTO "public"."migrations" VALUES (44, '2023_09_20_101815_add_lead_pipeline_id_to_lead_pipeline_stage_table', 1);
INSERT INTO "public"."migrations" VALUES (45, '2023_09_20_102046_add_lead_and_product_id_to_lead_products_table', 1);
INSERT INTO "public"."migrations" VALUES (46, '2023_09_20_102507_add_person_and_sales_person_id_to_leads_table', 1);
INSERT INTO "public"."migrations" VALUES (47, '2023_09_20_102928_add_quote_id_to_quote_items_table', 1);
INSERT INTO "public"."migrations" VALUES (48, '2023_09_20_103622_add_web_form_id_to_web_form_attribute_table', 1);
INSERT INTO "public"."migrations" VALUES (49, '2023_09_21_022922_create_account_table', 1);
INSERT INTO "public"."migrations" VALUES (50, '2023_09_21_044351_create_journal_table', 1);
INSERT INTO "public"."migrations" VALUES (51, '2023_09_21_061642_create_statement_cashflow_table', 1);
INSERT INTO "public"."migrations" VALUES (52, '2023_09_21_061820_create_statement_financial_table', 1);
INSERT INTO "public"."migrations" VALUES (53, '2023_09_21_062239_create_transaction_recurring_table', 1);
INSERT INTO "public"."migrations" VALUES (54, '2023_09_21_062545_create_transaction_recurring_detail_table', 1);
INSERT INTO "public"."migrations" VALUES (55, '2023_09_21_070612_create_absent_reasons_table', 1);
INSERT INTO "public"."migrations" VALUES (56, '2023_09_21_071128_create_attendance_table', 1);
INSERT INTO "public"."migrations" VALUES (57, '2023_09_21_071825_create_attendance_summaries_table', 1);
INSERT INTO "public"."migrations" VALUES (58, '2023_09_21_072449_create_career_history_table', 1);
INSERT INTO "public"."migrations" VALUES (59, '2023_09_21_073032_create_city_table', 1);
INSERT INTO "public"."migrations" VALUES (60, '2023_09_21_073329_create_company_table', 1);
INSERT INTO "public"."migrations" VALUES (61, '2023_09_21_073647_create_company_address_table', 1);
INSERT INTO "public"."migrations" VALUES (62, '2023_09_21_074450_create_company_costs_table', 1);
INSERT INTO "public"."migrations" VALUES (63, '2023_09_21_074802_create_company_payroll_cost_table', 1);
INSERT INTO "public"."migrations" VALUES (64, '2023_09_21_075126_create_contract_table', 1);
INSERT INTO "public"."migrations" VALUES (65, '2023_09_21_075820_create_department_table', 1);
INSERT INTO "public"."migrations" VALUES (66, '2023_09_21_080132_create_education_institute_table', 1);
INSERT INTO "public"."migrations" VALUES (67, '2023_09_21_080449_create_education_title_table', 1);
INSERT INTO "public"."migrations" VALUES (68, '2023_09_21_080751_create_employee_table', 1);
INSERT INTO "public"."migrations" VALUES (69, '2023_09_21_082218_create_employee_address_table', 1);
INSERT INTO "public"."migrations" VALUES (70, '2023_09_21_084255_create_holiday_table', 1);
INSERT INTO "public"."migrations" VALUES (71, '2023_09_21_084651_create_job_level_table', 1);
INSERT INTO "public"."migrations" VALUES (72, '2023_09_21_084928_create_job_title_table', 1);
INSERT INTO "public"."migrations" VALUES (73, '2023_09_21_085207_create_leave_table', 1);
INSERT INTO "public"."migrations" VALUES (74, '2023_09_21_085539_create_mutation_table', 1);
INSERT INTO "public"."migrations" VALUES (75, '2023_09_21_085721_create_overtime_table', 1);
INSERT INTO "public"."migrations" VALUES (76, '2023_09_21_090848_create_payroll_table', 1);
INSERT INTO "public"."migrations" VALUES (77, '2023_09_21_091300_create_payroll_detail_table', 1);
INSERT INTO "public"."migrations" VALUES (78, '2023_09_21_091619_create_payroll_periode_table', 1);
INSERT INTO "public"."migrations" VALUES (79, '2023_09_21_091920_create_placement_table', 1);
INSERT INTO "public"."migrations" VALUES (80, '2023_09_21_092337_create_reason_table', 1);
INSERT INTO "public"."migrations" VALUES (81, '2023_09_21_092547_create_region_table', 1);
INSERT INTO "public"."migrations" VALUES (82, '2023_09_21_092839_create_salary_allowances_table', 1);
INSERT INTO "public"."migrations" VALUES (83, '2023_09_21_093232_create_salary_benefit_histories_table', 1);
INSERT INTO "public"."migrations" VALUES (84, '2023_09_21_093508_create_salary_benefits_table', 1);
INSERT INTO "public"."migrations" VALUES (85, '2023_09_21_093706_create_salary_component_table', 1);
INSERT INTO "public"."migrations" VALUES (86, '2023_09_21_093728_create_shiftment_table', 1);
INSERT INTO "public"."migrations" VALUES (87, '2023_09_21_093748_create_skill_groups_table', 1);
INSERT INTO "public"."migrations" VALUES (88, '2023_09_21_093802_create_skills_table', 1);
INSERT INTO "public"."migrations" VALUES (89, '2023_09_21_093821_create_tax_group_history_table', 1);
INSERT INTO "public"."migrations" VALUES (90, '2023_09_21_093833_create_taxs_table', 1);
INSERT INTO "public"."migrations" VALUES (91, '2023_09_21_093849_create_workshifts_table', 1);
INSERT INTO "public"."migrations" VALUES (92, '2023_10_02_065424_add_person_id_to_activity_participants_table', 1);
INSERT INTO "public"."migrations" VALUES (93, '2023_10_02_073434_create_account_types_table', 1);
INSERT INTO "public"."migrations" VALUES (94, '2023_10_02_090145_add_employee_reason_shiftment_id_to_attendance_table', 1);
INSERT INTO "public"."migrations" VALUES (95, '2023_10_02_090711_add_employee_id_to_attendance_summaries_table', 1);
INSERT INTO "public"."migrations" VALUES (96, '2023_10_02_090902_add_employee_company_department_job_level_title_supervisor_contract_id_to_career_history_table', 1);
INSERT INTO "public"."migrations" VALUES (97, '2023_10_02_091419_add_region_id_to_city_table', 1);
INSERT INTO "public"."migrations" VALUES (98, '2023_10_02_091629_add_company_region_city_id_to_company_address_table', 1);
INSERT INTO "public"."migrations" VALUES (99, '2023_10_02_091831_add_payroll_component_id_to_company_cost_table', 1);
INSERT INTO "public"."migrations" VALUES (100, '2023_10_02_092117_add_contract_company_department_job_level_job_title_supervisor_id_to_employee_table', 1);
INSERT INTO "public"."migrations" VALUES (101, '2023_10_02_092618_add_employee_region_city_id_to_employee_address_table', 1);
INSERT INTO "public"."migrations" VALUES (102, '2023_10_02_092856_add_employee_reason_id_to_leave_table', 1);
INSERT INTO "public"."migrations" VALUES (103, '2023_10_02_093019_add_shiftment_id_to_overtime_table', 1);
INSERT INTO "public"."migrations" VALUES (104, '2023_10_02_093337_add_salary_component_id_to_payroll_detail_table', 1);
INSERT INTO "public"."migrations" VALUES (105, '2023_10_10_043909_create_customer_types_table', 1);
INSERT INTO "public"."migrations" VALUES (106, '2023_10_10_043922_create_regions_table', 1);
INSERT INTO "public"."migrations" VALUES (107, '2023_10_10_043923_create_countries_table', 1);
INSERT INTO "public"."migrations" VALUES (108, '2023_10_10_044445_create_vendors_table', 1);
INSERT INTO "public"."migrations" VALUES (109, '2023_10_11_023404_create_carriers_table', 1);
INSERT INTO "public"."migrations" VALUES (110, '2023_10_11_035641_create_offices_table', 1);
INSERT INTO "public"."migrations" VALUES (111, '2023_10_11_081306_create_sales_offices_table', 1);
INSERT INTO "public"."migrations" VALUES (112, '2023_10_12_030018_create_customer_groups_table', 1);
INSERT INTO "public"."migrations" VALUES (113, '2023_10_12_030038_create_customers_table', 1);
INSERT INTO "public"."migrations" VALUES (114, '2023_10_12_083914_add_account_type_and_cashflow_type_id_to_account_table', 1);
INSERT INTO "public"."migrations" VALUES (115, '2023_10_12_181450_add_sales_person_id_into_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (116, '2023_10_16_042900_create_group_charges_table', 1);
INSERT INTO "public"."migrations" VALUES (117, '2023_10_16_042914_create_charges_table', 1);
INSERT INTO "public"."migrations" VALUES (118, '2023_10_16_065612_create_vendor_rates_table', 1);
INSERT INTO "public"."migrations" VALUES (119, '2023_10_17_024341_create_journal_details_table', 1);
INSERT INTO "public"."migrations" VALUES (120, '2023_10_17_044949_add_recurring_transaction_id_to_journal_table', 1);
INSERT INTO "public"."migrations" VALUES (121, '2023_10_19_213112_create_lead_notes_table', 1);
INSERT INTO "public"."migrations" VALUES (122, '2023_10_20_212253_create_crm_lead_files_table', 1);
INSERT INTO "public"."migrations" VALUES (123, '2023_11_08_031136_update_sales_persons_table', 1);
INSERT INTO "public"."migrations" VALUES (124, '2023_12_07_073346_modify_product_id_column_in_crm_quote_items_table_into_nullable', 1);
INSERT INTO "public"."migrations" VALUES (125, '2023_12_11_022523_create_invoice_table', 1);
INSERT INTO "public"."migrations" VALUES (126, '2023_12_11_022617_create_invoice_detail_table', 1);
INSERT INTO "public"."migrations" VALUES (127, '2023_12_11_022640_create_invoice_rate_table', 1);
INSERT INTO "public"."migrations" VALUES (128, '2023_12_13_034944_create_costs_table', 1);
INSERT INTO "public"."migrations" VALUES (129, '2023_12_13_095350_create_file_storages_table', 1);
INSERT INTO "public"."migrations" VALUES (130, '2023_12_18_024303_create_cost_details_table', 1);
INSERT INTO "public"."migrations" VALUES (131, '2024_01_13_064156_drop_column_from_absent_reasons_table', 1);
INSERT INTO "public"."migrations" VALUES (132, '2024_01_13_064947_modify_column_from_absent_reasons_table', 1);
INSERT INTO "public"."migrations" VALUES (133, '2024_01_15_033144_add_module_and_feature_to_file_storages_table', 1);
INSERT INTO "public"."migrations" VALUES (134, '2024_01_15_035013_create_journal_has_file_storages_table', 1);
INSERT INTO "public"."migrations" VALUES (135, '2024_01_15_042412_drop_attachment_from_journal_table', 1);
INSERT INTO "public"."migrations" VALUES (136, '2024_01_17_033752_modify_department_id_from_placement_table', 1);
INSERT INTO "public"."migrations" VALUES (137, '2024_02_19_032710_modify_sales_person_column_into_user_sales_person_in_leads_table', 1);
INSERT INTO "public"."migrations" VALUES (138, '2024_02_19_033302_modify_sales_person_column_into_user_sales_person_in_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (139, '2024_02_21_080312_add_project_number_column_into_leads_table', 1);
INSERT INTO "public"."migrations" VALUES (140, '2024_02_22_075027_add_organization_id_into_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (141, '2024_02_22_083241_add_tariff_into_quotes_table', 1);
INSERT INTO "public"."migrations" VALUES (142, '2024_04_26_042302_create_user_settings_table', 1);
INSERT INTO "public"."migrations" VALUES (143, '2024_05_08_100611_create_service_contracts_table', 2);
INSERT INTO "public"."migrations" VALUES (144, '2024_05_13_071734_add_contract_agent_id_to_service_contracts_table', 3);
INSERT INTO "public"."migrations" VALUES (145, '2024_05_16_094222_set_party_unique_to_service_contracts_table', 4);
INSERT INTO "public"."migrations" VALUES (146, '2024_09_04_075904_drop_contract_agent_details_and_update_contract_agent_charges_table', 5);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."personal_access_tokens";
CREATE TABLE "public"."personal_access_tokens" (
  "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq1'::regclass),
  "tokenable_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tokenable_id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "abilities" text COLLATE "pg_catalog"."default",
  "last_used_at" timestamp(0),
  "expires_at" timestamp(0),
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Function structure for uuid_generate_v1
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v1mc
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1mc"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1mc"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1mc'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v3
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v3"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v3"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v3'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v4
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v4"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v4"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v4'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v5
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v5"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v5"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v5'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v7
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v7"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v7"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/pg_uuidv7', 'uuid_generate_v7'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_nil
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_nil"();
CREATE OR REPLACE FUNCTION "public"."uuid_nil"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_nil'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_dns
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_dns"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_dns"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_dns'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_oid
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_oid"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_oid"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_oid'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_url
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_url"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_url"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_url'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_x500
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_x500"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_x500"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_x500'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_timestamptz_to_v7
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_timestamptz_to_v7"(timestamptz, "zero" bool);
CREATE OR REPLACE FUNCTION "public"."uuid_timestamptz_to_v7"(timestamptz, "zero" bool=false)
  RETURNS "pg_catalog"."uuid" AS '$libdir/pg_uuidv7', 'uuid_timestamptz_to_v7'
  LANGUAGE c STABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_v7_to_timestamptz
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_v7_to_timestamptz"(uuid);
CREATE OR REPLACE FUNCTION "public"."uuid_v7_to_timestamptz"(uuid)
  RETURNS "pg_catalog"."timestamptz" AS '$libdir/pg_uuidv7', 'uuid_v7_to_timestamptz'
  LANGUAGE c STABLE STRICT
  COST 1;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."failed_jobs_id_seq"', 549, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq1"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq1"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."migrations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq1"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq1"', 146, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."personal_access_tokens_id_seq1"
OWNED BY "public"."personal_access_tokens"."id";
SELECT setval('"public"."personal_access_tokens_id_seq1"', 1, false);

-- ----------------------------
-- Primary Key structure for table file_storages
-- ----------------------------
ALTER TABLE "public"."file_storages" ADD CONSTRAINT "file_storages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table personal_access_tokens
-- ----------------------------
CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "public"."personal_access_tokens" USING btree (
  "tokenable_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "tokenable_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_token_unique" UNIQUE ("token");

-- ----------------------------
-- Primary Key structure for table personal_access_tokens
-- ----------------------------
ALTER TABLE "public"."personal_access_tokens" ADD CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id");
