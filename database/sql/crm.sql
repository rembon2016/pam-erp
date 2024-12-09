/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : crm

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:10:24
*/


-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS "crm"."activities";
CREATE TABLE "crm"."activities" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "comment" text COLLATE "pg_catalog"."default",
  "additional" varchar(255) COLLATE "pg_catalog"."default",
  "schedule_from" timestamp(0),
  "schedule_to" timestamp(0),
  "is_done" bool NOT NULL DEFAULT false,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of activities
-- ----------------------------

-- ----------------------------
-- Table structure for activity_files
-- ----------------------------
DROP TABLE IF EXISTS "crm"."activity_files";
CREATE TABLE "crm"."activity_files" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "activity_id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of activity_files
-- ----------------------------

-- ----------------------------
-- Table structure for activity_participants
-- ----------------------------
DROP TABLE IF EXISTS "crm"."activity_participants";
CREATE TABLE "crm"."activity_participants" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "activity_id" uuid NOT NULL,
  "user_id" uuid,
  "person_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of activity_participants
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_options
-- ----------------------------
DROP TABLE IF EXISTS "crm"."attribute_options";
CREATE TABLE "crm"."attribute_options" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "sort_order" int4,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "attribute_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of attribute_options
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS "crm"."attribute_values";
CREATE TABLE "crm"."attribute_values" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "entity_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "text_value" text COLLATE "pg_catalog"."default",
  "boolean_value" bool,
  "integer_value" int4,
  "float_value" float8,
  "datetime_value" timestamp(0),
  "date_value" date,
  "json_value" varchar(255) COLLATE "pg_catalog"."default",
  "entity_id" varchar(255) COLLATE "pg_catalog"."default",
  "attribute_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS "crm"."attributes";
CREATE TABLE "crm"."attributes" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "lookup_type" varchar(255) COLLATE "pg_catalog"."default",
  "entity_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sort_order" int4,
  "validation" varchar(255) COLLATE "pg_catalog"."default",
  "is_required" bool NOT NULL DEFAULT false,
  "is_unique" bool NOT NULL DEFAULT false,
  "quick_add" bool NOT NULL DEFAULT true,
  "is_user_defined" bool NOT NULL DEFAULT false,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of attributes
-- ----------------------------

-- ----------------------------
-- Table structure for core_config
-- ----------------------------
DROP TABLE IF EXISTS "crm"."core_config";
CREATE TABLE "crm"."core_config" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of core_config
-- ----------------------------

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS "crm"."countries";
CREATE TABLE "crm"."countries" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of countries
-- ----------------------------

-- ----------------------------
-- Table structure for country_states
-- ----------------------------
DROP TABLE IF EXISTS "crm"."country_states";
CREATE TABLE "crm"."country_states" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "country_id" uuid NOT NULL,
  "country_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of country_states
-- ----------------------------

-- ----------------------------
-- Table structure for email_attachments
-- ----------------------------
DROP TABLE IF EXISTS "crm"."email_attachments";
CREATE TABLE "crm"."email_attachments" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int4,
  "content_type" varchar(255) COLLATE "pg_catalog"."default",
  "content_id" varchar(255) COLLATE "pg_catalog"."default",
  "email_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of email_attachments
-- ----------------------------

-- ----------------------------
-- Table structure for email_templates
-- ----------------------------
DROP TABLE IF EXISTS "crm"."email_templates";
CREATE TABLE "crm"."email_templates" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "subject" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of email_templates
-- ----------------------------

-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS "crm"."emails";
CREATE TABLE "crm"."emails" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "subject" varchar(255) COLLATE "pg_catalog"."default",
  "source" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "reply" text COLLATE "pg_catalog"."default",
  "is_read" bool NOT NULL DEFAULT false,
  "folders" varchar(255) COLLATE "pg_catalog"."default",
  "from" varchar(255) COLLATE "pg_catalog"."default",
  "sender" varchar(255) COLLATE "pg_catalog"."default",
  "reply_to" varchar(255) COLLATE "pg_catalog"."default",
  "cc" varchar(255) COLLATE "pg_catalog"."default",
  "bcc" varchar(255) COLLATE "pg_catalog"."default",
  "unique_id" varchar(255) COLLATE "pg_catalog"."default",
  "message_id" varchar(255) COLLATE "pg_catalog"."default",
  "reference_ids" varchar(255) COLLATE "pg_catalog"."default",
  "person_id" uuid,
  "lead_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "parent_id" int8
)
;

-- ----------------------------
-- Records of emails
-- ----------------------------

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS "crm"."groups";
CREATE TABLE "crm"."groups" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of groups
-- ----------------------------

-- ----------------------------
-- Table structure for lead_activities
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_activities";
CREATE TABLE "crm"."lead_activities" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "activity_id" uuid NOT NULL,
  "lead_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of lead_activities
-- ----------------------------

-- ----------------------------
-- Table structure for lead_files
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_files";
CREATE TABLE "crm"."lead_files" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "file" text COLLATE "pg_catalog"."default" NOT NULL,
  "lead_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_files
-- ----------------------------

-- ----------------------------
-- Table structure for lead_notes
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_notes";
CREATE TABLE "crm"."lead_notes" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "lead_id" uuid NOT NULL,
  "note" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_notes
-- ----------------------------

-- ----------------------------
-- Table structure for lead_pipeline_stage
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_pipeline_stage";
CREATE TABLE "crm"."lead_pipeline_stage" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "probability" int4 NOT NULL,
  "sort_order" int4 NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "lead_pipeline_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of lead_pipeline_stage
-- ----------------------------

-- ----------------------------
-- Table structure for lead_pipelines
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_pipelines";
CREATE TABLE "crm"."lead_pipelines" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_default" bool NOT NULL DEFAULT false,
  "rotten_days" int4 NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_pipelines
-- ----------------------------

-- ----------------------------
-- Table structure for lead_products
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_products";
CREATE TABLE "crm"."lead_products" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "quantity" int4 NOT NULL,
  "price" numeric(12,4),
  "amount" numeric(12,4),
  "lead_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_products
-- ----------------------------

-- ----------------------------
-- Table structure for lead_quotes
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_quotes";
CREATE TABLE "crm"."lead_quotes" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "quote_id" uuid NOT NULL,
  "lead_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of lead_quotes
-- ----------------------------

-- ----------------------------
-- Table structure for lead_sources
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_sources";
CREATE TABLE "crm"."lead_sources" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_sources
-- ----------------------------

-- ----------------------------
-- Table structure for lead_stages
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_stages";
CREATE TABLE "crm"."lead_stages" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_user_defined" bool NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_stages
-- ----------------------------

-- ----------------------------
-- Table structure for lead_tags
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_tags";
CREATE TABLE "crm"."lead_tags" (
  "tag_id" uuid NOT NULL,
  "lead_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of lead_tags
-- ----------------------------

-- ----------------------------
-- Table structure for lead_types
-- ----------------------------
DROP TABLE IF EXISTS "crm"."lead_types";
CREATE TABLE "crm"."lead_types" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of lead_types
-- ----------------------------

-- ----------------------------
-- Table structure for leads
-- ----------------------------
DROP TABLE IF EXISTS "crm"."leads";
CREATE TABLE "crm"."leads" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "lead_value" numeric(12,0),
  "lost_reason" text COLLATE "pg_catalog"."default",
  "closed_at" timestamp(0),
  "lead_source_id" uuid NOT NULL,
  "lead_type_id" uuid NOT NULL,
  "lead_pipeline_id" uuid,
  "lead_pipeline_stage_id" uuid,
  "expected_close_date" date,
  "person_id" uuid NOT NULL,
  "sales_person_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "user_sales_person_id" uuid,
  "project_number" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of leads
-- ----------------------------

-- ----------------------------
-- Table structure for organizations
-- ----------------------------
DROP TABLE IF EXISTS "crm"."organizations";
CREATE TABLE "crm"."organizations" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of organizations
-- ----------------------------

-- ----------------------------
-- Table structure for persons
-- ----------------------------
DROP TABLE IF EXISTS "crm"."persons";
CREATE TABLE "crm"."persons" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "emails" json NOT NULL,
  "contact_numbers" json,
  "organization_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of persons
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "crm"."products";
CREATE TABLE "crm"."products" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "sku" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "quantity" int4 NOT NULL DEFAULT 0,
  "price" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0) NOT NULL DEFAULT '2023-12-07 09:53:54'::timestamp without time zone,
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of products
-- ----------------------------

-- ----------------------------
-- Table structure for quote_items
-- ----------------------------
DROP TABLE IF EXISTS "crm"."quote_items";
CREATE TABLE "crm"."quote_items" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "quantity" int4 NOT NULL DEFAULT 0,
  "price" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "coupon_code" varchar(255) COLLATE "pg_catalog"."default",
  "discount_percent" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "discount_amount" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "tax_percent" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "tax_amount" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "total" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "product_id" uuid,
  "quote_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of quote_items
-- ----------------------------

-- ----------------------------
-- Table structure for quotes
-- ----------------------------
DROP TABLE IF EXISTS "crm"."quotes";
CREATE TABLE "crm"."quotes" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "subject" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "billing_address" varchar(255) COLLATE "pg_catalog"."default",
  "shipping_address" varchar(255) COLLATE "pg_catalog"."default",
  "discount_percent" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "discount_amount" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "tax_amount" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "adjustment_amount" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "sub_total" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "grand_total" numeric(12,4) NOT NULL DEFAULT '0'::numeric,
  "expired_at" timestamp(0),
  "person_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "sales_person_id" uuid,
  "user_sales_person_id" uuid,
  "organization_id" uuid,
  "tariff" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of quotes
-- ----------------------------

-- ----------------------------
-- Table structure for sales_person
-- ----------------------------
DROP TABLE IF EXISTS "crm"."sales_person";
CREATE TABLE "crm"."sales_person" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" uuid NOT NULL,
  "office_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of sales_person
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS "crm"."tags";
CREATE TABLE "crm"."tags" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "color" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for web_form_attribute
-- ----------------------------
DROP TABLE IF EXISTS "crm"."web_form_attribute";
CREATE TABLE "crm"."web_form_attribute" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "placeholder" varchar(255) COLLATE "pg_catalog"."default",
  "is_required" bool NOT NULL DEFAULT false,
  "is_hidden" bool NOT NULL DEFAULT false,
  "sort_order" int4,
  "attribute_id" uuid NOT NULL,
  "web_form_id" uuid NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of web_form_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for web_forms
-- ----------------------------
DROP TABLE IF EXISTS "crm"."web_forms";
CREATE TABLE "crm"."web_forms" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "form_id" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "submit_button_label" text COLLATE "pg_catalog"."default" NOT NULL,
  "submit_success_action" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "submit_success_content" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_lead" int2,
  "background_color" varchar(255) COLLATE "pg_catalog"."default",
  "form_background_color" varchar(255) COLLATE "pg_catalog"."default",
  "form_title_color" varchar(255) COLLATE "pg_catalog"."default",
  "form_submit_button_color" varchar(255) COLLATE "pg_catalog"."default",
  "attribute_label_color" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of web_forms
-- ----------------------------

-- ----------------------------
-- Table structure for workflows
-- ----------------------------
DROP TABLE IF EXISTS "crm"."workflows";
CREATE TABLE "crm"."workflows" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "entity_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "event" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "condition_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "conditions" varchar(255) COLLATE "pg_catalog"."default",
  "actions" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of workflows
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table activities
-- ----------------------------
ALTER TABLE "crm"."activities" ADD CONSTRAINT "activities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table activity_files
-- ----------------------------
ALTER TABLE "crm"."activity_files" ADD CONSTRAINT "activity_files_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table activity_participants
-- ----------------------------
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "activity_participants_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table attribute_options
-- ----------------------------
ALTER TABLE "crm"."attribute_options" ADD CONSTRAINT "attribute_options_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table attribute_values
-- ----------------------------
ALTER TABLE "crm"."attribute_values" ADD CONSTRAINT "attribute_values_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table attributes
-- ----------------------------
ALTER TABLE "crm"."attributes" ADD CONSTRAINT "attributes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table core_config
-- ----------------------------
ALTER TABLE "crm"."core_config" ADD CONSTRAINT "core_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table countries
-- ----------------------------
ALTER TABLE "crm"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table country_states
-- ----------------------------
ALTER TABLE "crm"."country_states" ADD CONSTRAINT "country_states_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table email_attachments
-- ----------------------------
ALTER TABLE "crm"."email_attachments" ADD CONSTRAINT "email_attachments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table email_templates
-- ----------------------------
ALTER TABLE "crm"."email_templates" ADD CONSTRAINT "email_templates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table emails
-- ----------------------------
ALTER TABLE "crm"."emails" ADD CONSTRAINT "emails_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table groups
-- ----------------------------
ALTER TABLE "crm"."groups" ADD CONSTRAINT "groups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_activities
-- ----------------------------
ALTER TABLE "crm"."lead_activities" ADD CONSTRAINT "lead_activities_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_files
-- ----------------------------
ALTER TABLE "crm"."lead_files" ADD CONSTRAINT "lead_files_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_notes
-- ----------------------------
ALTER TABLE "crm"."lead_notes" ADD CONSTRAINT "lead_notes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_pipeline_stage
-- ----------------------------
ALTER TABLE "crm"."lead_pipeline_stage" ADD CONSTRAINT "lead_pipeline_stage_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_pipelines
-- ----------------------------
ALTER TABLE "crm"."lead_pipelines" ADD CONSTRAINT "lead_pipelines_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_products
-- ----------------------------
ALTER TABLE "crm"."lead_products" ADD CONSTRAINT "lead_products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_quotes
-- ----------------------------
ALTER TABLE "crm"."lead_quotes" ADD CONSTRAINT "lead_quotes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_sources
-- ----------------------------
ALTER TABLE "crm"."lead_sources" ADD CONSTRAINT "lead_sources_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_stages
-- ----------------------------
ALTER TABLE "crm"."lead_stages" ADD CONSTRAINT "lead_stages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lead_types
-- ----------------------------
ALTER TABLE "crm"."lead_types" ADD CONSTRAINT "lead_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table leads
-- ----------------------------
ALTER TABLE "crm"."leads" ADD CONSTRAINT "leads_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table organizations
-- ----------------------------
ALTER TABLE "crm"."organizations" ADD CONSTRAINT "organizations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table persons
-- ----------------------------
ALTER TABLE "crm"."persons" ADD CONSTRAINT "persons_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "crm"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table quote_items
-- ----------------------------
ALTER TABLE "crm"."quote_items" ADD CONSTRAINT "quote_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table quotes
-- ----------------------------
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "quotes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sales_person
-- ----------------------------
ALTER TABLE "crm"."sales_person" ADD CONSTRAINT "sales_person_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table tags
-- ----------------------------
ALTER TABLE "crm"."tags" ADD CONSTRAINT "tags_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table web_form_attribute
-- ----------------------------
ALTER TABLE "crm"."web_form_attribute" ADD CONSTRAINT "web_form_attribute_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table web_forms
-- ----------------------------
ALTER TABLE "crm"."web_forms" ADD CONSTRAINT "web_forms_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table workflows
-- ----------------------------
ALTER TABLE "crm"."workflows" ADD CONSTRAINT "workflows_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table activities
-- ----------------------------
ALTER TABLE "crm"."activities" ADD CONSTRAINT "crm_activities_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activities" ADD CONSTRAINT "crm_activities_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table activity_files
-- ----------------------------
ALTER TABLE "crm"."activity_files" ADD CONSTRAINT "crm_activity_files_activity_id_foreign" FOREIGN KEY ("activity_id") REFERENCES "crm"."activities" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_files" ADD CONSTRAINT "crm_activity_files_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_files" ADD CONSTRAINT "crm_activity_files_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table activity_participants
-- ----------------------------
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "crm_activity_participants_activity_id_foreign" FOREIGN KEY ("activity_id") REFERENCES "crm"."activities" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "crm_activity_participants_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "crm_activity_participants_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "crm_activity_participants_person_id_foreign" FOREIGN KEY ("person_id") REFERENCES "crm"."persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."activity_participants" ADD CONSTRAINT "crm_activity_participants_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attribute_options
-- ----------------------------
ALTER TABLE "crm"."attribute_options" ADD CONSTRAINT "crm_attribute_options_attribute_id_foreign" FOREIGN KEY ("attribute_id") REFERENCES "crm"."attributes" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."attribute_options" ADD CONSTRAINT "crm_attribute_options_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."attribute_options" ADD CONSTRAINT "crm_attribute_options_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attribute_values
-- ----------------------------
ALTER TABLE "crm"."attribute_values" ADD CONSTRAINT "crm_attribute_values_attribute_id_foreign" FOREIGN KEY ("attribute_id") REFERENCES "crm"."attributes" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."attribute_values" ADD CONSTRAINT "crm_attribute_values_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."attribute_values" ADD CONSTRAINT "crm_attribute_values_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table attributes
-- ----------------------------
ALTER TABLE "crm"."attributes" ADD CONSTRAINT "crm_attributes_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."attributes" ADD CONSTRAINT "crm_attributes_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table core_config
-- ----------------------------
ALTER TABLE "crm"."core_config" ADD CONSTRAINT "crm_core_config_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."core_config" ADD CONSTRAINT "crm_core_config_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table countries
-- ----------------------------
ALTER TABLE "crm"."countries" ADD CONSTRAINT "crm_countries_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."countries" ADD CONSTRAINT "crm_countries_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table country_states
-- ----------------------------
ALTER TABLE "crm"."country_states" ADD CONSTRAINT "crm_country_states_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "crm"."countries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."country_states" ADD CONSTRAINT "crm_country_states_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."country_states" ADD CONSTRAINT "crm_country_states_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table email_attachments
-- ----------------------------
ALTER TABLE "crm"."email_attachments" ADD CONSTRAINT "crm_email_attachments_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."email_attachments" ADD CONSTRAINT "crm_email_attachments_email_id_foreign" FOREIGN KEY ("email_id") REFERENCES "crm"."emails" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."email_attachments" ADD CONSTRAINT "crm_email_attachments_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table email_templates
-- ----------------------------
ALTER TABLE "crm"."email_templates" ADD CONSTRAINT "crm_email_templates_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."email_templates" ADD CONSTRAINT "crm_email_templates_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table emails
-- ----------------------------
ALTER TABLE "crm"."emails" ADD CONSTRAINT "crm_emails_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."emails" ADD CONSTRAINT "crm_emails_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."emails" ADD CONSTRAINT "crm_emails_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."emails" ADD CONSTRAINT "crm_emails_person_id_foreign" FOREIGN KEY ("person_id") REFERENCES "crm"."persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table groups
-- ----------------------------
ALTER TABLE "crm"."groups" ADD CONSTRAINT "crm_groups_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."groups" ADD CONSTRAINT "crm_groups_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_activities
-- ----------------------------
ALTER TABLE "crm"."lead_activities" ADD CONSTRAINT "crm_lead_activities_activity_id_foreign" FOREIGN KEY ("activity_id") REFERENCES "crm"."activities" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_activities" ADD CONSTRAINT "crm_lead_activities_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_files
-- ----------------------------
ALTER TABLE "crm"."lead_files" ADD CONSTRAINT "crm_lead_files_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_files" ADD CONSTRAINT "crm_lead_files_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_files" ADD CONSTRAINT "crm_lead_files_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_notes
-- ----------------------------
ALTER TABLE "crm"."lead_notes" ADD CONSTRAINT "crm_lead_notes_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_notes" ADD CONSTRAINT "crm_lead_notes_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_notes" ADD CONSTRAINT "crm_lead_notes_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_pipeline_stage
-- ----------------------------
ALTER TABLE "crm"."lead_pipeline_stage" ADD CONSTRAINT "crm_lead_pipeline_stage_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_pipeline_stage" ADD CONSTRAINT "crm_lead_pipeline_stage_lead_pipeline_id_foreign" FOREIGN KEY ("lead_pipeline_id") REFERENCES "crm"."lead_pipelines" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_pipeline_stage" ADD CONSTRAINT "crm_lead_pipeline_stage_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_pipelines
-- ----------------------------
ALTER TABLE "crm"."lead_pipelines" ADD CONSTRAINT "crm_lead_pipelines_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_pipelines" ADD CONSTRAINT "crm_lead_pipelines_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_products
-- ----------------------------
ALTER TABLE "crm"."lead_products" ADD CONSTRAINT "crm_lead_products_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_products" ADD CONSTRAINT "crm_lead_products_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_products" ADD CONSTRAINT "crm_lead_products_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_products" ADD CONSTRAINT "crm_lead_products_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "crm"."products" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_quotes
-- ----------------------------
ALTER TABLE "crm"."lead_quotes" ADD CONSTRAINT "crm_lead_quotes_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_quotes" ADD CONSTRAINT "crm_lead_quotes_quote_id_foreign" FOREIGN KEY ("quote_id") REFERENCES "crm"."quotes" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_sources
-- ----------------------------
ALTER TABLE "crm"."lead_sources" ADD CONSTRAINT "crm_lead_sources_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_sources" ADD CONSTRAINT "crm_lead_sources_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_stages
-- ----------------------------
ALTER TABLE "crm"."lead_stages" ADD CONSTRAINT "crm_lead_stages_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_stages" ADD CONSTRAINT "crm_lead_stages_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_tags
-- ----------------------------
ALTER TABLE "crm"."lead_tags" ADD CONSTRAINT "crm_lead_tags_lead_id_foreign" FOREIGN KEY ("lead_id") REFERENCES "crm"."leads" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_tags" ADD CONSTRAINT "crm_lead_tags_tag_id_foreign" FOREIGN KEY ("tag_id") REFERENCES "crm"."tags" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table lead_types
-- ----------------------------
ALTER TABLE "crm"."lead_types" ADD CONSTRAINT "crm_lead_types_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."lead_types" ADD CONSTRAINT "crm_lead_types_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table leads
-- ----------------------------
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_lead_pipeline_id_foreign" FOREIGN KEY ("lead_pipeline_id") REFERENCES "crm"."lead_pipelines" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_lead_pipeline_stage_id_foreign" FOREIGN KEY ("lead_pipeline_stage_id") REFERENCES "crm"."lead_pipeline_stage" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_lead_source_id_foreign" FOREIGN KEY ("lead_source_id") REFERENCES "crm"."lead_sources" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_lead_type_id_foreign" FOREIGN KEY ("lead_type_id") REFERENCES "crm"."lead_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_person_id_foreign" FOREIGN KEY ("person_id") REFERENCES "crm"."persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_sales_person_id_foreign" FOREIGN KEY ("sales_person_id") REFERENCES "crm"."sales_person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."leads" ADD CONSTRAINT "crm_leads_user_sales_person_id_foreign" FOREIGN KEY ("user_sales_person_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table organizations
-- ----------------------------
ALTER TABLE "crm"."organizations" ADD CONSTRAINT "crm_organizations_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."organizations" ADD CONSTRAINT "crm_organizations_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table persons
-- ----------------------------
ALTER TABLE "crm"."persons" ADD CONSTRAINT "crm_persons_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."persons" ADD CONSTRAINT "crm_persons_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."persons" ADD CONSTRAINT "crm_persons_organization_id_foreign" FOREIGN KEY ("organization_id") REFERENCES "crm"."organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table products
-- ----------------------------
ALTER TABLE "crm"."products" ADD CONSTRAINT "crm_products_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."products" ADD CONSTRAINT "crm_products_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table quote_items
-- ----------------------------
ALTER TABLE "crm"."quote_items" ADD CONSTRAINT "crm_quote_items_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quote_items" ADD CONSTRAINT "crm_quote_items_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quote_items" ADD CONSTRAINT "crm_quote_items_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "crm"."products" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quote_items" ADD CONSTRAINT "crm_quote_items_quote_id_foreign" FOREIGN KEY ("quote_id") REFERENCES "crm"."quotes" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table quotes
-- ----------------------------
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_organization_id_foreign" FOREIGN KEY ("organization_id") REFERENCES "crm"."organizations" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_person_id_foreign" FOREIGN KEY ("person_id") REFERENCES "crm"."persons" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_sales_person_id_foreign" FOREIGN KEY ("sales_person_id") REFERENCES "crm"."sales_person" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."quotes" ADD CONSTRAINT "crm_quotes_user_sales_person_id_foreign" FOREIGN KEY ("user_sales_person_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sales_person
-- ----------------------------
ALTER TABLE "crm"."sales_person" ADD CONSTRAINT "crm_sales_person_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."sales_person" ADD CONSTRAINT "crm_sales_person_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."sales_person" ADD CONSTRAINT "crm_sales_person_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table tags
-- ----------------------------
ALTER TABLE "crm"."tags" ADD CONSTRAINT "crm_tags_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."tags" ADD CONSTRAINT "crm_tags_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."tags" ADD CONSTRAINT "crm_tags_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table web_form_attribute
-- ----------------------------
ALTER TABLE "crm"."web_form_attribute" ADD CONSTRAINT "crm_web_form_attribute_attribute_id_foreign" FOREIGN KEY ("attribute_id") REFERENCES "crm"."attributes" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."web_form_attribute" ADD CONSTRAINT "crm_web_form_attribute_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."web_form_attribute" ADD CONSTRAINT "crm_web_form_attribute_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."web_form_attribute" ADD CONSTRAINT "crm_web_form_attribute_web_form_id_foreign" FOREIGN KEY ("web_form_id") REFERENCES "crm"."web_forms" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table web_forms
-- ----------------------------
ALTER TABLE "crm"."web_forms" ADD CONSTRAINT "crm_web_forms_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."web_forms" ADD CONSTRAINT "crm_web_forms_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table workflows
-- ----------------------------
ALTER TABLE "crm"."workflows" ADD CONSTRAINT "crm_workflows_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "crm"."workflows" ADD CONSTRAINT "crm_workflows_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
