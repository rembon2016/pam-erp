/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : hrm

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:17:53
*/


-- ----------------------------
-- Table structure for absent_reasons
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."absent_reasons";
CREATE TABLE "hrm"."absent_reasons" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of absent_reasons
-- ----------------------------

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."attendance";
CREATE TABLE "hrm"."attendance" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "attendance_date" date,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "check_in" time(0),
  "check_out" time(0),
  "earlyin" int2,
  "earlyout" int2,
  "latein" int2,
  "lateout" int2,
  "absent" bool,
  "employee_id" uuid NOT NULL,
  "reason_id" uuid,
  "shiftment_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of attendance
-- ----------------------------

-- ----------------------------
-- Table structure for attendance_summaries
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."attendance_summaries";
CREATE TABLE "hrm"."attendance_summaries" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "year" int2 NOT NULL,
  "month" int2 NOT NULL,
  "total_workday" int4 NOT NULL,
  "total_in" int4 NOT NULL,
  "total_loyality" int4 NOT NULL,
  "total_absent" int4 NOT NULL,
  "total_overtime" int4 NOT NULL,
  "employee_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of attendance_summaries
-- ----------------------------

-- ----------------------------
-- Table structure for career_history
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."career_history";
CREATE TABLE "hrm"."career_history" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "employee_id" uuid NOT NULL,
  "company_id" uuid NOT NULL,
  "department_id" uuid NOT NULL,
  "job_level_id" uuid NOT NULL,
  "job_title_id" uuid NOT NULL,
  "contract_id" uuid NOT NULL,
  "supervisor_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of career_history
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."city";
CREATE TABLE "hrm"."city" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "region_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."company";
CREATE TABLE "hrm"."company" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(100) COLLATE "pg_catalog"."default",
  "company_name" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "tax_number" varchar(50) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "parent_id" uuid
)
;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for company_address
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."company_address";
CREATE TABLE "hrm"."company_address" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "postal_code" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(50) COLLATE "pg_catalog"."default",
  "fax_number" varchar(50) COLLATE "pg_catalog"."default",
  "default_address" bool,
  "company_id" uuid NOT NULL,
  "region_id" uuid NOT NULL,
  "city_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of company_address
-- ----------------------------

-- ----------------------------
-- Table structure for company_costs
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."company_costs";
CREATE TABLE "hrm"."company_costs" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "benefit_value" text COLLATE "pg_catalog"."default" NOT NULL,
  "benefit_key" varchar(255) COLLATE "pg_catalog"."default",
  "payroll_id" uuid,
  "component_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of company_costs
-- ----------------------------

-- ----------------------------
-- Table structure for company_payroll_cost
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."company_payroll_cost";
CREATE TABLE "hrm"."company_payroll_cost" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "payroll" varchar(255) COLLATE "pg_catalog"."default",
  "component" varchar(255) COLLATE "pg_catalog"."default",
  "benefit_value" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of company_payroll_cost
-- ----------------------------

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."contract";
CREATE TABLE "hrm"."contract" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "letter_number" varchar(100) COLLATE "pg_catalog"."default",
  "subject" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "start_date" date,
  "end_date" date,
  "signed_date" date,
  "tags" varchar(255) COLLATE "pg_catalog"."default",
  "used" bool,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of contract
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."department";
CREATE TABLE "hrm"."department" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "parent_id" uuid
)
;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for education_institute
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."education_institute";
CREATE TABLE "hrm"."education_institute" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of education_institute
-- ----------------------------

-- ----------------------------
-- Table structure for education_title
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."education_title";
CREATE TABLE "hrm"."education_title" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "short_name" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of education_title
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."employee";
CREATE TABLE "hrm"."employee" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "full_name" varchar(255) COLLATE "pg_catalog"."default",
  "gender" varchar(20) COLLATE "pg_catalog"."default",
  "place_of_birth" varchar(255) COLLATE "pg_catalog"."default",
  "date_of_birth" date,
  "identity_type" varchar(100) COLLATE "pg_catalog"."default",
  "identity_number" varchar(100) COLLATE "pg_catalog"."default",
  "martial_status" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "leave_balance" int2,
  "tax_group" varchar(255) COLLATE "pg_catalog"."default",
  "resign_date" date,
  "have_overtime_benefit" bool,
  "risk_ratio" varchar(255) COLLATE "pg_catalog"."default",
  "join_date" date,
  "employee_status" varchar(255) COLLATE "pg_catalog"."default",
  "image_profile" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" uuid NOT NULL,
  "contract_id" uuid,
  "company_id" uuid,
  "department_id" uuid,
  "job_level_id" uuid,
  "job_title_id" uuid,
  "supervisor_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for employee_address
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."employee_address";
CREATE TABLE "hrm"."employee_address" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "postal_code" varchar(20) COLLATE "pg_catalog"."default",
  "phone_number" varchar(20) COLLATE "pg_catalog"."default",
  "fax_number" varchar(255) COLLATE "pg_catalog"."default",
  "default" bool,
  "employee_id" uuid NOT NULL,
  "region_id" uuid NOT NULL,
  "city_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of employee_address
-- ----------------------------

-- ----------------------------
-- Table structure for holiday
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."holiday";
CREATE TABLE "hrm"."holiday" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "holiday_date" date,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of holiday
-- ----------------------------

-- ----------------------------
-- Table structure for job_level
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."job_level";
CREATE TABLE "hrm"."job_level" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "parent_id" uuid
)
;

-- ----------------------------
-- Records of job_level
-- ----------------------------

-- ----------------------------
-- Table structure for job_title
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."job_title";
CREATE TABLE "hrm"."job_title" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_level_id" uuid NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of job_title
-- ----------------------------

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."leave";
CREATE TABLE "hrm"."leave" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "leave_date" date,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "amount" int2,
  "employee_id" uuid NOT NULL,
  "reason_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of leave
-- ----------------------------

-- ----------------------------
-- Table structure for mutation
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."mutation";
CREATE TABLE "hrm"."mutation" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "employee_id" uuid,
  "old_company_id" uuid,
  "old_departement_id" uuid,
  "old_job_level_id" uuid,
  "old_job_title_id" uuid,
  "old_supervisor_id" uuid,
  "new_company_id" uuid,
  "new_departement_id" uuid,
  "new_job_level_id" uuid,
  "new_job_title_id" uuid,
  "new_supervisor_id" uuid,
  "contract_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of mutation
-- ----------------------------

-- ----------------------------
-- Table structure for overtime
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."overtime";
CREATE TABLE "hrm"."overtime" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "overtime_date" date,
  "start_hour" time(0),
  "end_hour" time(0),
  "raw_value" float8,
  "calculated_value" float8,
  "holiday" bool,
  "overday" bool,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "approved_by" uuid,
  "shiftment_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of overtime
-- ----------------------------

-- ----------------------------
-- Table structure for payroll
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."payroll";
CREATE TABLE "hrm"."payroll" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "takehome_pay" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "periode_id" uuid
)
;

-- ----------------------------
-- Records of payroll
-- ----------------------------

-- ----------------------------
-- Table structure for payroll_detail
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."payroll_detail";
CREATE TABLE "hrm"."payroll_detail" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "payroll_id" uuid,
  "benefit_value" varchar(255) COLLATE "pg_catalog"."default",
  "salary_component_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of payroll_detail
-- ----------------------------

-- ----------------------------
-- Table structure for payroll_periode
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."payroll_periode";
CREATE TABLE "hrm"."payroll_periode" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "year" int2,
  "month" int2,
  "closed" date,
  "company_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of payroll_periode
-- ----------------------------

-- ----------------------------
-- Table structure for placement
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."placement";
CREATE TABLE "hrm"."placement" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "company_id" uuid,
  "job_level_id" uuid,
  "job_title_id" uuid,
  "contract_id" uuid,
  "active" int2,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "supervisor_id" uuid,
  "department_id" uuid
)
;

-- ----------------------------
-- Records of placement
-- ----------------------------

-- ----------------------------
-- Table structure for reason
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."reason";
CREATE TABLE "hrm"."reason" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of reason
-- ----------------------------

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."region";
CREATE TABLE "hrm"."region" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of region
-- ----------------------------

-- ----------------------------
-- Table structure for salary_allowances
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."salary_allowances";
CREATE TABLE "hrm"."salary_allowances" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "year" int2,
  "month" int2,
  "benefit_value" text COLLATE "pg_catalog"."default",
  "benefit_key" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "component_id" uuid
)
;

-- ----------------------------
-- Records of salary_allowances
-- ----------------------------

-- ----------------------------
-- Table structure for salary_benefit_histories
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."salary_benefit_histories";
CREATE TABLE "hrm"."salary_benefit_histories" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "contract_id" uuid,
  "new_benefit_value" text COLLATE "pg_catalog"."default",
  "old_benefit_value" text COLLATE "pg_catalog"."default",
  "benefit_key" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "component_id" uuid
)
;

-- ----------------------------
-- Records of salary_benefit_histories
-- ----------------------------

-- ----------------------------
-- Table structure for salary_benefits
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."salary_benefits";
CREATE TABLE "hrm"."salary_benefits" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "benefit_value" text COLLATE "pg_catalog"."default",
  "benefit_key" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "component_id" uuid
)
;

-- ----------------------------
-- Records of salary_benefits
-- ----------------------------

-- ----------------------------
-- Table structure for salary_component
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."salary_component";
CREATE TABLE "hrm"."salary_component" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "fixed" bool,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of salary_component
-- ----------------------------

-- ----------------------------
-- Table structure for shiftment
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."shiftment";
CREATE TABLE "hrm"."shiftment" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "start_hour" time(0),
  "end_hour" time(0),
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of shiftment
-- ----------------------------

-- ----------------------------
-- Table structure for skill_groups
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."skill_groups";
CREATE TABLE "hrm"."skill_groups" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "parent_id" uuid
)
;

-- ----------------------------
-- Records of skill_groups
-- ----------------------------

-- ----------------------------
-- Table structure for skills
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."skills";
CREATE TABLE "hrm"."skills" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "skill_group_id" uuid,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of skills
-- ----------------------------

-- ----------------------------
-- Table structure for tax_group_history
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."tax_group_history";
CREATE TABLE "hrm"."tax_group_history" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "old_tax_group" varchar(3) COLLATE "pg_catalog"."default" NOT NULL,
  "new_tax_group" varchar(3) COLLATE "pg_catalog"."default",
  "old_risk_ratio" varchar(3) COLLATE "pg_catalog"."default",
  "new_risk_ratio" varchar(3) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of tax_group_history
-- ----------------------------

-- ----------------------------
-- Table structure for taxs
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."taxs";
CREATE TABLE "hrm"."taxs" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "tax_group" varchar(3) COLLATE "pg_catalog"."default" NOT NULL,
  "untaxable" text COLLATE "pg_catalog"."default",
  "taxable" text COLLATE "pg_catalog"."default",
  "tax_value" text COLLATE "pg_catalog"."default",
  "tax_key" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "period_id" uuid
)
;

-- ----------------------------
-- Records of taxs
-- ----------------------------

-- ----------------------------
-- Table structure for user_settings
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."user_settings";
CREATE TABLE "hrm"."user_settings" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "setting_group_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" uuid NOT NULL,
  "related_id" int4,
  "related_uuid" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0)
)
;

-- ----------------------------
-- Records of user_settings
-- ----------------------------
INSERT INTO "hrm"."user_settings" VALUES ('3fd346d3-04fb-44b6-a233-ae9c99e98741', 'global-shipment-list', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', 7, NULL, '2024-09-04 07:55:16', '2024-09-04 07:55:16');

-- ----------------------------
-- Table structure for workshifts
-- ----------------------------
DROP TABLE IF EXISTS "hrm"."workshifts";
CREATE TABLE "hrm"."workshifts" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "employee_id" uuid,
  "shiftment_id" uuid,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "start_date" date,
  "end_date" date,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of workshifts
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table absent_reasons
-- ----------------------------
ALTER TABLE "hrm"."absent_reasons" ADD CONSTRAINT "absent_reasons_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table attendance
-- ----------------------------
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "attendance_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table attendance_summaries
-- ----------------------------
ALTER TABLE "hrm"."attendance_summaries" ADD CONSTRAINT "attendance_summaries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table career_history
-- ----------------------------
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "career_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table city
-- ----------------------------
ALTER TABLE "hrm"."city" ADD CONSTRAINT "city_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company
-- ----------------------------
ALTER TABLE "hrm"."company" ADD CONSTRAINT "company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company_address
-- ----------------------------
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "company_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company_costs
-- ----------------------------
ALTER TABLE "hrm"."company_costs" ADD CONSTRAINT "company_costs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company_payroll_cost
-- ----------------------------
ALTER TABLE "hrm"."company_payroll_cost" ADD CONSTRAINT "company_payroll_cost_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table contract
-- ----------------------------
ALTER TABLE "hrm"."contract" ADD CONSTRAINT "contract_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "hrm"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table education_institute
-- ----------------------------
ALTER TABLE "hrm"."education_institute" ADD CONSTRAINT "education_institute_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table education_title
-- ----------------------------
ALTER TABLE "hrm"."education_title" ADD CONSTRAINT "education_title_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table employee
-- ----------------------------
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "employee_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table employee_address
-- ----------------------------
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "employee_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table holiday
-- ----------------------------
ALTER TABLE "hrm"."holiday" ADD CONSTRAINT "holiday_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table job_level
-- ----------------------------
ALTER TABLE "hrm"."job_level" ADD CONSTRAINT "job_level_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table job_title
-- ----------------------------
ALTER TABLE "hrm"."job_title" ADD CONSTRAINT "job_title_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table leave
-- ----------------------------
ALTER TABLE "hrm"."leave" ADD CONSTRAINT "leave_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mutation
-- ----------------------------
ALTER TABLE "hrm"."mutation" ADD CONSTRAINT "mutation_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table overtime
-- ----------------------------
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "overtime_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table payroll
-- ----------------------------
ALTER TABLE "hrm"."payroll" ADD CONSTRAINT "payroll_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table payroll_detail
-- ----------------------------
ALTER TABLE "hrm"."payroll_detail" ADD CONSTRAINT "payroll_detail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table payroll_periode
-- ----------------------------
ALTER TABLE "hrm"."payroll_periode" ADD CONSTRAINT "payroll_periode_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table placement
-- ----------------------------
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "placement_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reason
-- ----------------------------
ALTER TABLE "hrm"."reason" ADD CONSTRAINT "reason_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table region
-- ----------------------------
ALTER TABLE "hrm"."region" ADD CONSTRAINT "region_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table salary_allowances
-- ----------------------------
ALTER TABLE "hrm"."salary_allowances" ADD CONSTRAINT "salary_allowances_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table salary_benefit_histories
-- ----------------------------
ALTER TABLE "hrm"."salary_benefit_histories" ADD CONSTRAINT "salary_benefit_histories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table salary_benefits
-- ----------------------------
ALTER TABLE "hrm"."salary_benefits" ADD CONSTRAINT "salary_benefits_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table salary_component
-- ----------------------------
ALTER TABLE "hrm"."salary_component" ADD CONSTRAINT "salary_component_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table shiftment
-- ----------------------------
ALTER TABLE "hrm"."shiftment" ADD CONSTRAINT "shiftment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table skill_groups
-- ----------------------------
ALTER TABLE "hrm"."skill_groups" ADD CONSTRAINT "skill_groups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table skills
-- ----------------------------
ALTER TABLE "hrm"."skills" ADD CONSTRAINT "skills_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tax_group_history
-- ----------------------------
ALTER TABLE "hrm"."tax_group_history" ADD CONSTRAINT "tax_group_history_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table taxs
-- ----------------------------
ALTER TABLE "hrm"."taxs" ADD CONSTRAINT "taxs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_settings
-- ----------------------------
ALTER TABLE "hrm"."user_settings" ADD CONSTRAINT "user_settings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table workshifts
-- ----------------------------
ALTER TABLE "hrm"."workshifts" ADD CONSTRAINT "workshifts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table absent_reasons
-- ----------------------------
ALTER TABLE "hrm"."absent_reasons" ADD CONSTRAINT "hrm_absent_reasons_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."absent_reasons" ADD CONSTRAINT "hrm_absent_reasons_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attendance
-- ----------------------------
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "hrm_attendance_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "hrm_attendance_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "hrm_attendance_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "hrm_attendance_reason_id_foreign" FOREIGN KEY ("reason_id") REFERENCES "hrm"."reason" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance" ADD CONSTRAINT "hrm_attendance_shiftment_id_foreign" FOREIGN KEY ("shiftment_id") REFERENCES "hrm"."shiftment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attendance_summaries
-- ----------------------------
ALTER TABLE "hrm"."attendance_summaries" ADD CONSTRAINT "hrm_attendance_summaries_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance_summaries" ADD CONSTRAINT "hrm_attendance_summaries_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."attendance_summaries" ADD CONSTRAINT "hrm_attendance_summaries_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table career_history
-- ----------------------------
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "hrm"."company" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_contract_id_foreign" FOREIGN KEY ("contract_id") REFERENCES "hrm"."contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_department_id_foreign" FOREIGN KEY ("department_id") REFERENCES "hrm"."department" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_job_level_id_foreign" FOREIGN KEY ("job_level_id") REFERENCES "hrm"."job_level" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_job_title_id_foreign" FOREIGN KEY ("job_title_id") REFERENCES "hrm"."job_title" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."career_history" ADD CONSTRAINT "hrm_career_history_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table city
-- ----------------------------
ALTER TABLE "hrm"."city" ADD CONSTRAINT "hrm_city_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."city" ADD CONSTRAINT "hrm_city_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."city" ADD CONSTRAINT "hrm_city_region_id_foreign" FOREIGN KEY ("region_id") REFERENCES "hrm"."region" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table company
-- ----------------------------
ALTER TABLE "hrm"."company" ADD CONSTRAINT "hrm_company_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company" ADD CONSTRAINT "hrm_company_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table company_address
-- ----------------------------
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "hrm_company_address_city_id_foreign" FOREIGN KEY ("city_id") REFERENCES "hrm"."city" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "hrm_company_address_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "hrm"."company" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "hrm_company_address_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "hrm_company_address_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_address" ADD CONSTRAINT "hrm_company_address_region_id_foreign" FOREIGN KEY ("region_id") REFERENCES "hrm"."region" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table company_costs
-- ----------------------------
ALTER TABLE "hrm"."company_costs" ADD CONSTRAINT "hrm_company_costs_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_costs" ADD CONSTRAINT "hrm_company_costs_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_costs" ADD CONSTRAINT "hrm_company_costs_payroll_id_foreign" FOREIGN KEY ("payroll_id") REFERENCES "hrm"."payroll" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table company_payroll_cost
-- ----------------------------
ALTER TABLE "hrm"."company_payroll_cost" ADD CONSTRAINT "hrm_company_payroll_cost_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."company_payroll_cost" ADD CONSTRAINT "hrm_company_payroll_cost_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table contract
-- ----------------------------
ALTER TABLE "hrm"."contract" ADD CONSTRAINT "hrm_contract_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."contract" ADD CONSTRAINT "hrm_contract_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "hrm"."department" ADD CONSTRAINT "hrm_department_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."department" ADD CONSTRAINT "hrm_department_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table education_institute
-- ----------------------------
ALTER TABLE "hrm"."education_institute" ADD CONSTRAINT "hrm_education_institute_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."education_institute" ADD CONSTRAINT "hrm_education_institute_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table education_title
-- ----------------------------
ALTER TABLE "hrm"."education_title" ADD CONSTRAINT "hrm_education_title_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."education_title" ADD CONSTRAINT "hrm_education_title_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table employee
-- ----------------------------
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "hrm"."company" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_contract_id_foreign" FOREIGN KEY ("contract_id") REFERENCES "hrm"."contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_department_id_foreign" FOREIGN KEY ("department_id") REFERENCES "hrm"."department" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_job_level_id_foreign" FOREIGN KEY ("job_level_id") REFERENCES "hrm"."job_level" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_job_title_id_foreign" FOREIGN KEY ("job_title_id") REFERENCES "hrm"."job_title" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee" ADD CONSTRAINT "hrm_employee_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table employee_address
-- ----------------------------
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "hrm_employee_address_city_id_foreign" FOREIGN KEY ("city_id") REFERENCES "hrm"."city" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "hrm_employee_address_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "hrm_employee_address_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "hrm_employee_address_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."employee_address" ADD CONSTRAINT "hrm_employee_address_region_id_foreign" FOREIGN KEY ("region_id") REFERENCES "hrm"."region" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table holiday
-- ----------------------------
ALTER TABLE "hrm"."holiday" ADD CONSTRAINT "hrm_holiday_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."holiday" ADD CONSTRAINT "hrm_holiday_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table job_level
-- ----------------------------
ALTER TABLE "hrm"."job_level" ADD CONSTRAINT "hrm_job_level_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."job_level" ADD CONSTRAINT "hrm_job_level_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table job_title
-- ----------------------------
ALTER TABLE "hrm"."job_title" ADD CONSTRAINT "hrm_job_title_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."job_title" ADD CONSTRAINT "hrm_job_title_job_level_id_foreign" FOREIGN KEY ("job_level_id") REFERENCES "hrm"."job_level" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."job_title" ADD CONSTRAINT "hrm_job_title_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table leave
-- ----------------------------
ALTER TABLE "hrm"."leave" ADD CONSTRAINT "hrm_leave_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."leave" ADD CONSTRAINT "hrm_leave_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."leave" ADD CONSTRAINT "hrm_leave_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."leave" ADD CONSTRAINT "hrm_leave_reason_id_foreign" FOREIGN KEY ("reason_id") REFERENCES "hrm"."reason" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table mutation
-- ----------------------------
ALTER TABLE "hrm"."mutation" ADD CONSTRAINT "hrm_mutation_contract_id_foreign" FOREIGN KEY ("contract_id") REFERENCES "hrm"."contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."mutation" ADD CONSTRAINT "hrm_mutation_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."mutation" ADD CONSTRAINT "hrm_mutation_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."mutation" ADD CONSTRAINT "hrm_mutation_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table overtime
-- ----------------------------
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "hrm_overtime_approved_by_foreign" FOREIGN KEY ("approved_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "hrm_overtime_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "hrm_overtime_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "hrm_overtime_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."overtime" ADD CONSTRAINT "hrm_overtime_shiftment_id_foreign" FOREIGN KEY ("shiftment_id") REFERENCES "hrm"."shiftment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payroll
-- ----------------------------
ALTER TABLE "hrm"."payroll" ADD CONSTRAINT "hrm_payroll_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll" ADD CONSTRAINT "hrm_payroll_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll" ADD CONSTRAINT "hrm_payroll_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payroll_detail
-- ----------------------------
ALTER TABLE "hrm"."payroll_detail" ADD CONSTRAINT "hrm_payroll_detail_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll_detail" ADD CONSTRAINT "hrm_payroll_detail_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll_detail" ADD CONSTRAINT "hrm_payroll_detail_payroll_id_foreign" FOREIGN KEY ("payroll_id") REFERENCES "hrm"."payroll" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll_detail" ADD CONSTRAINT "hrm_payroll_detail_salary_component_id_foreign" FOREIGN KEY ("salary_component_id") REFERENCES "hrm"."salary_component" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table payroll_periode
-- ----------------------------
ALTER TABLE "hrm"."payroll_periode" ADD CONSTRAINT "hrm_payroll_periode_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "hrm"."company" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll_periode" ADD CONSTRAINT "hrm_payroll_periode_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."payroll_periode" ADD CONSTRAINT "hrm_payroll_periode_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table placement
-- ----------------------------
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_company_id_foreign" FOREIGN KEY ("company_id") REFERENCES "hrm"."company" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_contract_id_foreign" FOREIGN KEY ("contract_id") REFERENCES "hrm"."contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_department_id_foreign" FOREIGN KEY ("department_id") REFERENCES "hrm"."department" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_job_level_id_foreign" FOREIGN KEY ("job_level_id") REFERENCES "hrm"."job_level" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_job_title_id_foreign" FOREIGN KEY ("job_title_id") REFERENCES "hrm"."job_title" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."placement" ADD CONSTRAINT "hrm_placement_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table reason
-- ----------------------------
ALTER TABLE "hrm"."reason" ADD CONSTRAINT "hrm_reason_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."reason" ADD CONSTRAINT "hrm_reason_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table region
-- ----------------------------
ALTER TABLE "hrm"."region" ADD CONSTRAINT "hrm_region_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."region" ADD CONSTRAINT "hrm_region_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table salary_allowances
-- ----------------------------
ALTER TABLE "hrm"."salary_allowances" ADD CONSTRAINT "hrm_salary_allowances_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_allowances" ADD CONSTRAINT "hrm_salary_allowances_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_allowances" ADD CONSTRAINT "hrm_salary_allowances_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table salary_benefit_histories
-- ----------------------------
ALTER TABLE "hrm"."salary_benefit_histories" ADD CONSTRAINT "hrm_salary_benefit_histories_contract_id_foreign" FOREIGN KEY ("contract_id") REFERENCES "hrm"."contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_benefit_histories" ADD CONSTRAINT "hrm_salary_benefit_histories_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_benefit_histories" ADD CONSTRAINT "hrm_salary_benefit_histories_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_benefit_histories" ADD CONSTRAINT "hrm_salary_benefit_histories_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table salary_benefits
-- ----------------------------
ALTER TABLE "hrm"."salary_benefits" ADD CONSTRAINT "hrm_salary_benefits_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_benefits" ADD CONSTRAINT "hrm_salary_benefits_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_benefits" ADD CONSTRAINT "hrm_salary_benefits_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table salary_component
-- ----------------------------
ALTER TABLE "hrm"."salary_component" ADD CONSTRAINT "hrm_salary_component_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."salary_component" ADD CONSTRAINT "hrm_salary_component_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table shiftment
-- ----------------------------
ALTER TABLE "hrm"."shiftment" ADD CONSTRAINT "hrm_shiftment_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."shiftment" ADD CONSTRAINT "hrm_shiftment_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table skill_groups
-- ----------------------------
ALTER TABLE "hrm"."skill_groups" ADD CONSTRAINT "hrm_skill_groups_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."skill_groups" ADD CONSTRAINT "hrm_skill_groups_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table skills
-- ----------------------------
ALTER TABLE "hrm"."skills" ADD CONSTRAINT "hrm_skills_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."skills" ADD CONSTRAINT "hrm_skills_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."skills" ADD CONSTRAINT "hrm_skills_skill_group_id_foreign" FOREIGN KEY ("skill_group_id") REFERENCES "hrm"."skill_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table tax_group_history
-- ----------------------------
ALTER TABLE "hrm"."tax_group_history" ADD CONSTRAINT "hrm_tax_group_history_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."tax_group_history" ADD CONSTRAINT "hrm_tax_group_history_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."tax_group_history" ADD CONSTRAINT "hrm_tax_group_history_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table taxs
-- ----------------------------
ALTER TABLE "hrm"."taxs" ADD CONSTRAINT "hrm_taxs_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."taxs" ADD CONSTRAINT "hrm_taxs_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."taxs" ADD CONSTRAINT "hrm_taxs_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table user_settings
-- ----------------------------
ALTER TABLE "hrm"."user_settings" ADD CONSTRAINT "hrm_user_settings_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table workshifts
-- ----------------------------
ALTER TABLE "hrm"."workshifts" ADD CONSTRAINT "hrm_workshifts_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."workshifts" ADD CONSTRAINT "hrm_workshifts_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "hrm"."employee" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."workshifts" ADD CONSTRAINT "hrm_workshifts_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "hrm"."workshifts" ADD CONSTRAINT "hrm_workshifts_shiftment_id_foreign" FOREIGN KEY ("shiftment_id") REFERENCES "hrm"."shiftment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;