/*
 Navicat Premium Dump SQL

 Source Server         : Dev-203.175.10.178
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : origin

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/12/2024 18:37:34
*/


-- ----------------------------
-- Table structure for agreed_rate
-- ----------------------------
DROP TABLE IF EXISTS "origin"."agreed_rate";
CREATE TABLE "origin"."agreed_rate" (
  "rate_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "charge_code" varchar(255) COLLATE "pg_catalog"."default",
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid NOT NULL,
  "date_created" date,
  "date_modified" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "charge_id" uuid,
  "price" numeric(10,2),
  "currency" varchar(255) COLLATE "pg_catalog"."default",
  "unit" varchar(100) COLLATE "pg_catalog"."default",
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for chat_note
-- ----------------------------
DROP TABLE IF EXISTS "origin"."chat_note";
CREATE TABLE "origin"."chat_note" (
  "chat_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "text_messages" text COLLATE "pg_catalog"."default",
  "date_created" timestamp(6) DEFAULT now(),
  "created_by" varchar(200) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(200) COLLATE "pg_catalog"."default",
  "status" int2 DEFAULT 1
)
;


-- ----------------------------
-- Table structure for claim
-- ----------------------------
DROP TABLE IF EXISTS "origin"."claim";
CREATE TABLE "origin"."claim" (
  "claim_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "value" float4,
  "gross_weight" float4,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "status" int2,
  "job_id" uuid,
  "date_claim" timestamp(6),
  "claim_number" varchar(255) COLLATE "pg_catalog"."default",
  "is_refurbish" bool
)
;

-- ----------------------------
-- Records of claim
-- ----------------------------

-- ----------------------------
-- Table structure for claim_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."claim_detail";
CREATE TABLE "origin"."claim_detail" (
  "claim_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "claim_id" uuid,
  "claim_type" int2,
  "description" varchar(255) COLLATE "pg_catalog"."default"
);

-- ----------------------------
-- Records of claim_detail
-- ----------------------------

-- ----------------------------
-- Table structure for claims_document
-- ----------------------------
DROP TABLE IF EXISTS "origin"."claims_document";
CREATE TABLE "origin"."claims_document" (
  "document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "claim_id" uuid,
  "job_id" uuid,
  "document_name" varchar(255) COLLATE "pg_catalog"."default",
  "document_file" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of claims_document
-- ----------------------------

-- ----------------------------
-- Table structure for control_office
-- ----------------------------
DROP TABLE IF EXISTS "origin"."control_office";
CREATE TABLE "origin"."control_office" (
  "control_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "office_id" uuid,
  "office_name" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for destination_partner_office
-- ----------------------------
DROP TABLE IF EXISTS "origin"."destination_partner_office";
CREATE TABLE "origin"."destination_partner_office" (
  "destination_partner_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "office_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "office_name" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for dimension
-- ----------------------------
DROP TABLE IF EXISTS "origin"."dimension";
CREATE TABLE "origin"."dimension" (
  "dimension_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid,
  "no_pcs" varchar(20) COLLATE "pg_catalog"."default",
  "unit" varchar(20) COLLATE "pg_catalog"."default",
  "length" float8,
  "width" float8,
  "height" float8,
  "volume_cbm" float8,
  "volume_weight" float8
);


-- ----------------------------
-- Table structure for final_alert
-- ----------------------------
DROP TABLE IF EXISTS "origin"."final_alert";
CREATE TABLE "origin"."final_alert" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "vessel_name_voyage" varchar(100) COLLATE "pg_catalog"."default",
  "no_final_alert" varchar(20) COLLATE "pg_catalog"."default",
  "file_final_alert" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date
)
;
COMMENT ON COLUMN "origin"."final_alert"."created_by" IS 'di isi email origin yang created sehingga jadi parameter saat ditampilkan hanya tampil di origin yang create';
COMMENT ON COLUMN "origin"."final_alert"."eta_dubai" IS 'tgl estimasi tiba di duba';


-- ----------------------------
-- Table structure for final_alert_crossair
-- ----------------------------
DROP TABLE IF EXISTS "origin"."final_alert_crossair";
CREATE TABLE "origin"."final_alert_crossair" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "no_loading_plan" varchar(100) COLLATE "pg_catalog"."default",
  "no_final_alert" varchar(20) COLLATE "pg_catalog"."default",
  "file_final_alert" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date,
  "loading_plan_id" uuid
)
;
COMMENT ON COLUMN "origin"."final_alert_crossair"."created_by" IS 'di isi email origin yang created sehingga jadi parameter saat ditampilkan hanya tampil di origin yang create';
COMMENT ON COLUMN "origin"."final_alert_crossair"."eta_dubai" IS 'tgl estimasi tiba di duba';

-- ----------------------------
-- Records of final_alert_crossair
-- ----------------------------
-- ----------------------------
-- Table structure for hasil
-- ----------------------------
DROP TABLE IF EXISTS "origin"."hasil";
CREATE TABLE "origin"."hasil" (
  "max" int2
)
;

-- ----------------------------
-- Records of hasil
-- ----------------------------

-- ----------------------------
-- Table structure for histori_job
-- ----------------------------
DROP TABLE IF EXISTS "origin"."histori_job";
CREATE TABLE "origin"."histori_job" (
  "histori_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "status" varchar(100) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_aktual" timestamp(6),
  "date_created" timestamp(6) DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "gmt" varchar(10) COLLATE "pg_catalog"."default",
  "is_deleted" int2 DEFAULT 0,
  "role_id" int2 DEFAULT 0,
  "status_id" int4
);

-- ----------------------------
-- Table structure for job_order
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_order";
CREATE TABLE "origin"."job_order" (
  "job_order_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_code" varchar(255) COLLATE "pg_catalog"."default",
  "date_order" date,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "vessel_id" uuid,
  "vessel_name_voyage" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "job_order_type" int2,
  "status" int2 NOT NULL,
  "origin_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date,
  "destination_charges" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_id" uuid,
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_number" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."job_order"."job_order_type" IS '1. sea Import
2. air expor
3. air import
4. air export';
COMMENT ON COLUMN "origin"."job_order"."status" IS '1. generated
2. process
3. done
';

-- ----------------------------
-- Table structure for job_order_air
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_order_air";
CREATE TABLE "origin"."job_order_air" (
  "job_order_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_code" varchar(255) COLLATE "pg_catalog"."default",
  "date_order" date,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_id" uuid,
  "loading_plan_number" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "job_order_type" int2,
  "status" int2 NOT NULL,
  "destination_charges" varchar(255) COLLATE "pg_catalog"."default",
  "origin_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default"
);
COMMENT ON COLUMN "origin"."job_order_air"."job_order_type" IS '1. sea Import
2. air expor
3. air import
4. air export';
COMMENT ON COLUMN "origin"."job_order_air"."status" IS '1. generated
2. process
3. done
';


-- ----------------------------
-- Table structure for job_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_order_detail";
CREATE TABLE "origin"."job_order_detail" (
  "job_order_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid
)
;
COMMENT ON COLUMN "origin"."job_order_detail"."job_id" IS 'job id shipping instruction';


-- ----------------------------
-- Table structure for job_order_document
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_order_document";
CREATE TABLE "origin"."job_order_document" (
  "document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type_document" varchar(255) COLLATE "pg_catalog"."default",
  "name_file" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2,
  "job_order_id" uuid,
  "updated_by" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for job_truck_delivery
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_truck_delivery";
CREATE TABLE "origin"."job_truck_delivery" (
  "delivery_point_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_trucking_id" uuid NOT NULL,
  "t1_custom" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "custom_stop" varchar(255) COLLATE "pg_catalog"."default",
  "custom_stop_datetime" timestamp(6),
  "delivery_place" varchar(255) COLLATE "pg_catalog"."default",
  "delivery_place_date" timestamp(6),
  "special_requirement" varchar(255) COLLATE "pg_catalog"."default",
  "truck_price" numeric,
  "waiting_charges" numeric,
  "cancelation_charges" numeric,
  "handling_charges" numeric(10,2),
  "atlas_fee" numeric(10,2),
  "t1_fee" numeric(10,2),
  "storage_fee" numeric(10,2),
  "palletisation_charges" numeric(10,2),
  "sorting_fee" numeric(10,2),
  "plt_charges" numeric(10,2),
  "custom_clearance_fee" numeric(10,2),
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT now(),
  "modified_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "status" int2,
  "actual_delivery_date" timestamp(6),
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "t1_address" varchar(255) COLLATE "pg_catalog"."default",
  "custom_stop_adress" varchar(255) COLLATE "pg_catalog"."default",
  "delivery_place_adress" varchar(255) COLLATE "pg_catalog"."default",
  "t1_sub_address" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."job_truck_delivery"."status" IS '1. active
2.deleted';


-- ----------------------------
-- Table structure for job_truck_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_truck_delivery_detail";
CREATE TABLE "origin"."job_truck_delivery_detail" (
  "delivery_point_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "delivery_point_id" uuid NOT NULL,
  "ctd_number" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "truck_id" uuid
);


-- ----------------------------
-- Table structure for job_trucking
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_trucking";
CREATE TABLE "origin"."job_trucking" (
  "job_truck_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "truck_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "handling_agent_id" uuid NOT NULL,
  "handling_agent_customer" varchar(200) COLLATE "pg_catalog"."default",
  "trucking_company" uuid NOT NULL,
  "trucking_company_name" varchar(200) COLLATE "pg_catalog"."default",
  "trucking_type" uuid,
  "trucking_type_name" varchar(255) COLLATE "pg_catalog"."default",
  "loading_date" timestamp(6),
  "departure_time" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT now(),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default" DEFAULT now(),
  "date_modified" date,
  "status" varchar(20) COLLATE "pg_catalog"."default",
  "notes" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for job_trucking_t1subaddress
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_trucking_t1subaddress";
CREATE TABLE "origin"."job_trucking_t1subaddress" (
  "id" int4 NOT NULL,
  "t1_sub_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of job_trucking_t1subaddress
-- ----------------------------
INSERT INTO "origin"."job_trucking_t1subaddress" VALUES (1, 'None');
INSERT INTO "origin"."job_trucking_t1subaddress" VALUES (2, 'LKW bitte mit Zollplombe verplomben');
INSERT INTO "origin"."job_trucking_t1subaddress" VALUES (3, 'Bitte mit Handelsrechnung sichern - keine Zollplombe');

-- ----------------------------
-- Table structure for loading_plan
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_plan";
CREATE TABLE "origin"."loading_plan" (
  "plan_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "carrier_id" uuid,
  "carrier_name" varchar(150) COLLATE "pg_catalog"."default",
  "mawb_number" varchar(50) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT CURRENT_DATE,
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "origin_office_id" uuid NOT NULL,
  "closing_time" timestamp(0),
  "flight_number" varchar(255) COLLATE "pg_catalog"."default",
  "etd" date,
  "eta" date,
  "loading_plan_number" varchar(50) COLLATE "pg_catalog"."default",
  "dxb" int2
)
;
COMMENT ON COLUMN "origin"."loading_plan"."status" IS '1. used
2. available
';


-- ----------------------------
-- Table structure for loading_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_plan_detail";
CREATE TABLE "origin"."loading_plan_detail" (
  "loading_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "loading_plan_id" uuid NOT NULL,
  "flight_number" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "port_departure_id" uuid,
  "port_departure_name" varchar(100) COLLATE "pg_catalog"."default",
  "date_departure" date,
  "port_arival_id" uuid,
  "port_arival_name" varchar(100) COLLATE "pg_catalog"."default",
  "date_arival" date,
  "port_departure_code" varchar(50) COLLATE "pg_catalog"."default",
  "port_arival_code" varchar(50) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for loading_plan_document
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_plan_document";
CREATE TABLE "origin"."loading_plan_document" (
  "loading_plan_document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "loading_id" uuid,
  "type_document" varchar(255) COLLATE "pg_catalog"."default",
  "name_file" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "date_modified" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "loading_type" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_bl_id" uuid
);


-- ----------------------------
-- Table structure for loading_report
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_report";
CREATE TABLE "origin"."loading_report" (
  "loading_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "shipping_line" uuid,
  "shipping_line_name" varchar(255) COLLATE "pg_catalog"."default",
  "booking_number" varchar(255) COLLATE "pg_catalog"."default",
  "qty_container" float4,
  "bl_number" varchar(64) COLLATE "pg_catalog"."default",
  "origin_office_id" uuid,
  "status" int2,
  "date_created" timestamp(6) DEFAULT CURRENT_DATE,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "vessel_id" uuid,
  "vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "etd" date,
  "eta" date,
  "voyage_number" varchar(255) COLLATE "pg_catalog"."default",
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "fcl_clossing_time" timestamp(0),
  "loading_plan_number" varchar(50) COLLATE "pg_catalog"."default",
  "voyage_vessel_origin" varchar(255) COLLATE "pg_catalog"."default",
  "dxb" int2
);

-- ----------------------------
-- Table structure for loading_report_bl
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_report_bl";
CREATE TABLE "origin"."loading_report_bl" (
  "loading_report_bl_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "bl_number" varchar(255) COLLATE "pg_catalog"."default",
  "loading_id" uuid,
  "date_created" date DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 DEFAULT 1,
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "fcl_closing_time" timestamp(6),
  "feeder_vessel_id" uuid
);


-- ----------------------------
-- Table structure for loading_report_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_report_detail";
CREATE TABLE "origin"."loading_report_detail" (
  "detail_bl_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "bl_id" uuid NOT NULL,
  "container_number" varchar(100) COLLATE "pg_catalog"."default",
  "seal_number" varchar(100) COLLATE "pg_catalog"."default",
  "container_type" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "loading_report_bl_id" uuid
)
;
COMMENT ON COLUMN "origin"."loading_report_detail"."container_type" IS '1. 40 ft 2, 25 ft ';


-- ----------------------------
-- Table structure for loading_report_feeder
-- ----------------------------
DROP TABLE IF EXISTS "origin"."loading_report_feeder";
CREATE TABLE "origin"."loading_report_feeder" (
  "loading_report_feeder_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "fcl_clossing_time" timestamp(6),
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "loading_id" uuid
)
;

-- ----------------------------
-- Records of loading_report_feeder
-- ----------------------------

-- ----------------------------
-- Table structure for local_transport
-- ----------------------------
DROP TABLE IF EXISTS "origin"."local_transport";
CREATE TABLE "origin"."local_transport" (
  "local_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "vehicle_number" varchar(10) COLLATE "pg_catalog"."default",
  "vehicle_driver" varchar(100) COLLATE "pg_catalog"."default",
  "driver_phone" varchar(16) COLLATE "pg_catalog"."default",
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL DEFAULT 1,
  "origin_warehouse" varchar(255) COLLATE "pg_catalog"."default",
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."local_transport"."status" IS '1. active 2. inactive 3. deleted';


-- ----------------------------
-- Table structure for mawb_generate
-- ----------------------------
DROP TABLE IF EXISTS "origin"."mawb_generate";
CREATE TABLE "origin"."mawb_generate" (
  "id" uuid DEFAULT uuid_generate_v4(),
  "no_loading_plan" varchar(100) COLLATE "pg_catalog"."default",
  "no_mawb" varchar(30) COLLATE "pg_catalog"."default",
  "file_mawb" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_id" uuid
)
;

-- ----------------------------
-- Records of mawb_generate
-- ----------------------------

-- ----------------------------
-- Table structure for mawb_stock_generation
-- ----------------------------
DROP TABLE IF EXISTS "origin"."mawb_stock_generation";
CREATE TABLE "origin"."mawb_stock_generation" (
  "mawb_id" uuid NOT NULL,
  "mawb_number" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "carrier_id" uuid,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default",
  "por" varchar(5) COLLATE "pg_catalog"."default",
  "carrier_number" varchar(6) COLLATE "pg_catalog"."default",
  "MAWB" varchar(11) COLLATE "pg_catalog"."default",
  "chk_digit" int2,
  "job_number" varchar(15) COLLATE "pg_catalog"."default",
  "segment" varchar(5) COLLATE "pg_catalog"."default",
  "status" varchar(5) COLLATE "pg_catalog"."default",
  "noted" varchar(100) COLLATE "pg_catalog"."default",
  "received_date" date,
  "date_created" date,
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."mawb_stock_generation"."status" IS '1. availabled
2. reserved
3. book
4. generated
';

-- ----------------------------
-- Table structure for noted_section
-- ----------------------------
DROP TABLE IF EXISTS "origin"."noted_section";
CREATE TABLE "origin"."noted_section" (
  "noted_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "noted" varchar(255) COLLATE "pg_catalog"."default",
  "times" timestamp(6) DEFAULT now(),
  "chat_section" int2,
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid,
  "attachment" varchar(200) COLLATE "pg_catalog"."default",
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."noted_section"."chat_section" IS '1. origin
2. dxb
3. agent';


-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS "origin"."notification";
CREATE TABLE "origin"."notification" (
  "notification_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "message" text COLLATE "pg_catalog"."default",
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(6) DEFAULT now()
)
;


-- ----------------------------
-- Table structure for notification_user
-- ----------------------------
DROP TABLE IF EXISTS "origin"."notification_user";
CREATE TABLE "origin"."notification_user" (
  "notification_user_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "office_id" uuid,
  "notification_id" uuid
);


-- ----------------------------
-- Table structure for operation_chart
-- ----------------------------
DROP TABLE IF EXISTS "origin"."operation_chart";
CREATE TABLE "origin"."operation_chart" (
  "id" uuid DEFAULT uuid_generate_v4(),
  "vessel_name_voyage" varchar(255) COLLATE "pg_catalog"."default",
  "no_operation_chart" varchar(30) COLLATE "pg_catalog"."default",
  "file_operation_chart" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date,
  "gmt" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for operation_document
-- ----------------------------
DROP TABLE IF EXISTS "origin"."operation_document";
CREATE TABLE "origin"."operation_document" (
  "document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "vessel_id" uuid,
  "vessel_name_voyage" varchar(255) COLLATE "pg_catalog"."default",
  "operation_chart" varchar(255) COLLATE "pg_catalog"."default",
  "seaway_bill" varchar(255) COLLATE "pg_catalog"."default",
  "shipping_line_invoices" varchar(255) COLLATE "pg_catalog"."default",
  "origin_debit_note" varchar(255) COLLATE "pg_catalog"."default",
  "transport_invoices" varchar(255) COLLATE "pg_catalog"."default",
  "shipping_line_do" varchar(255) COLLATE "pg_catalog"."default",
  "custom_bill_entry" varchar(255) COLLATE "pg_catalog"."default",
  "custom_inpection" varchar(255) COLLATE "pg_catalog"."default",
  "final_mawb_copy" varchar(255) COLLATE "pg_catalog"."default",
  "calogi_invoices" varchar(255) COLLATE "pg_catalog"."default",
  "airline_agreed_rate" varchar(255) COLLATE "pg_catalog"."default",
  "dg_handler_invoices" varchar(255) COLLATE "pg_catalog"."default",
  "dca_approval" varchar(255) COLLATE "pg_catalog"."default",
  "cash_voucher" varchar(255) COLLATE "pg_catalog"."default",
  "agreed_rate" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "origin_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date,
  "job_order_id" uuid,
  "others" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for order_document
-- ----------------------------
DROP TABLE IF EXISTS "origin"."order_document";
CREATE TABLE "origin"."order_document" (
  "order_document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type_document" varchar(255) COLLATE "pg_catalog"."default",
  "name_file" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "date_modified" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" date,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid,
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
);


-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS "origin"."quotation";
CREATE TABLE "origin"."quotation" (
  "quotation_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "customer_id" uuid NOT NULL,
  "text_begin" text COLLATE "pg_catalog"."default",
  "text_end" text COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2,
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_address" varchar(255) COLLATE "pg_catalog"."default",
  "customer_email" varchar(50) COLLATE "pg_catalog"."default",
  "customer_phone" varchar(20) COLLATE "pg_catalog"."default",
  "quotation_number" varchar(20) COLLATE "pg_catalog"."default",
  "attn_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."quotation"."status" IS '1. save as draft
2.submit
3. delete';
COMMENT ON COLUMN "origin"."quotation"."attn_name" IS 'untuk memasukan nama customer contact/ opsional saat input';

-- ----------------------------
-- Records of quotation
-- ----------------------------

-- ----------------------------
-- Table structure for quotation_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."quotation_detail";
CREATE TABLE "origin"."quotation_detail" (
  "quotation_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "quotation_id" uuid,
  "weight" varchar COLLATE "pg_catalog"."default",
  "price_min" numeric(10,2),
  "charge_fee" uuid,
  "currency" varchar(5) COLLATE "pg_catalog"."default",
  "calc" varchar(50) COLLATE "pg_catalog"."default",
  "qty" varchar(50) COLLATE "pg_catalog"."default",
  "price_total" numeric(10,2),
  "vat" numeric(255,0),
  "vatamt" numeric(255,0),
  "roe" numeric(255,0),
  "total" numeric(10,2),
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "price" numeric(10,2)
)
;

-- ----------------------------
-- Records of quotation_detail
-- ----------------------------

-- ----------------------------
-- Table structure for shipping_instruction
-- ----------------------------
DROP TABLE IF EXISTS "origin"."shipping_instruction";
CREATE TABLE "origin"."shipping_instruction" (
  "job_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "to_consignee" uuid NOT NULL,
  "from_shipper" uuid NOT NULL,
  "origin_id" uuid NOT NULL,
  "port_of_loading" uuid NOT NULL,
  "port_of_destination" uuid NOT NULL,
  "feeder_vessel_id" uuid,
  "mother_vessel_id" uuid,
  "permit_no" varchar(50) COLLATE "pg_catalog"."default",
  "permit_date" date,
  "permit_approval_no" varchar(50) COLLATE "pg_catalog"."default",
  "shipment_by" varchar(20) COLLATE "pg_catalog"."default",
  "loading_type" varchar(50) COLLATE "pg_catalog"."default",
  "freight_term" varchar(20) COLLATE "pg_catalog"."default",
  "incoterm" varchar(20) COLLATE "pg_catalog"."default",
  "notify_of_party" varchar(255) COLLATE "pg_catalog"."default",
  "cargo_redines_date" date,
  "status_shipment" varchar(50) COLLATE "pg_catalog"."default",
  "estimated_time_departure" date,
  "actual_time_departure" date,
  "time_closing_mother" date,
  "transit_via" varchar(20) COLLATE "pg_catalog"."default",
  "metode_shipment" varchar(10) COLLATE "pg_catalog"."default",
  "consigne_name" varchar(255) COLLATE "pg_catalog"."default",
  "consignee_address" text COLLATE "pg_catalog"."default",
  "shipper_name" varchar(255) COLLATE "pg_catalog"."default",
  "shipper_address" text COLLATE "pg_catalog"."default",
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "port_loading_name" varchar(100) COLLATE "pg_catalog"."default",
  "port_destination_name" varchar(100) COLLATE "pg_catalog"."default",
  "mother_vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "feeder_vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "ctd_number" varchar(100) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL,
  "date_created" timestamp(6) DEFAULT now(),
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(100) COLLATE "pg_catalog"."default",
  "time_closing_feeder" date,
  "voyage_number_mother" varchar COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar COLLATE "pg_catalog"."default",
  "actual_time_departur_feeder" date,
  "loading_id" uuid,
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "status_shipment_id" int2,
  "eta_dubai" date,
  "sales_office" uuid,
  "sales_office_name" varchar(200) COLLATE "pg_catalog"."default",
  "komoditi_id" uuid,
  "komoditi_name" varchar(100) COLLATE "pg_catalog"."default",
  "loading_plan_dxb" uuid,
  "carrier_id_seaair" uuid,
  "carrier_name_seair" varchar(255) COLLATE "pg_catalog"."default",
  "closing_time_seaair" date,
  "etd_flight_seaair" date,
  "eta_flight_seaair" date,
  "flight_number_seaair" varchar(255) COLLATE "pg_catalog"."default",
  "notes_hub" varchar(255) COLLATE "pg_catalog"."default",
  "notes_destination" varchar(255) COLLATE "pg_catalog"."default",
  "in_order_to" varchar(100) COLLATE "pg_catalog"."default",
  "port_destination_code" varchar(7) COLLATE "pg_catalog"."default",
  "port_loading_code" varchar(7) COLLATE "pg_catalog"."default",
  "invoices_status" int2 DEFAULT 0,
  "delivery_place_id" uuid,
  "delivery_name" varchar(255) COLLATE "pg_catalog"."default",
  "delivery_address" varchar(255) COLLATE "pg_catalog"."default",
  "t1_id" uuid,
  "t1_name" varchar(255) COLLATE "pg_catalog"."default",
  "t1_address" varchar(255) COLLATE "pg_catalog"."default",
  "custom_stop_id" uuid,
  "custom_stop_name" varchar(255) COLLATE "pg_catalog"."default",
  "custom_stop_address" varchar(255) COLLATE "pg_catalog"."default",
  "etd_first" date,
  "voyage_vessel_origin" varchar(20) COLLATE "pg_catalog"."default",
  "notify_party_address" varchar(255) COLLATE "pg_catalog"."default",
  "destination_agent_id" uuid,
  "destination_agent_name" varchar(255) COLLATE "pg_catalog"."default",
  "destination_agent_address" varchar(255) COLLATE "pg_catalog"."default",
  "amount_of_insurance" varchar(100) COLLATE "pg_catalog"."default",
  "declare_value_forcariage" varchar(100) COLLATE "pg_catalog"."default",
  "declare_value_forcustom" varchar(100) COLLATE "pg_catalog"."default",
  "handling_information" text COLLATE "pg_catalog"."default",
  "customer_group_id" uuid,
  "customer_group_name" varchar(255) COLLATE "pg_catalog"."default",
  "status_update" int2,
  "sales_person_id" uuid,
  "project_id" uuid,
  "loading_report_bl_id" uuid,
  "sales_person_name" varchar(255) COLLATE "pg_catalog"."default",
  "project_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_address" text COLLATE "pg_catalog"."default",
  "office_id" uuid,
  "creating_by" varchar(255) COLLATE "pg_catalog"."default",
  "reference_id" uuid,
  "loading_feeder_id" uuid
)
;
COMMENT ON COLUMN "origin"."shipping_instruction"."status_shipment" IS '1. Booking receipt, 2. cargo transit dll';
COMMENT ON COLUMN "origin"."shipping_instruction"."status" IS '1. active 2. inactive 3. deleted';
COMMENT ON COLUMN "origin"."shipping_instruction"."notes" IS 'notes for origin';
COMMENT ON COLUMN "origin"."shipping_instruction"."notes_hub" IS 'notes for dxb';
COMMENT ON COLUMN "origin"."shipping_instruction"."notes_destination" IS 'notes for agent';
COMMENT ON COLUMN "origin"."shipping_instruction"."in_order_to" IS 'china required';
COMMENT ON COLUMN "origin"."shipping_instruction"."port_destination_code" IS 'requirement dari dubai ';
COMMENT ON COLUMN "origin"."shipping_instruction"."status_update" IS 'untuk pengecekan crownjob';


-- ----------------------------
-- Table structure for si_order
-- ----------------------------
DROP TABLE IF EXISTS "origin"."si_order";
CREATE TABLE "origin"."si_order" (
  "order_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "qty" float8,
  "pkgs" varchar(255) COLLATE "pg_catalog"."default",
  "net_weight" float8,
  "gross_weight" float8,
  "measurement" varchar(53) COLLATE "pg_catalog"."default",
  "description_of_goods" text COLLATE "pg_catalog"."default",
  "date_created" varchar COLLATE "pg_catalog"."default",
  "create_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" varchar COLLATE "pg_catalog"."default",
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 DEFAULT 1,
  "notes" varchar(255) COLLATE "pg_catalog"."default",
  "si_doc" varchar(255) COLLATE "pg_catalog"."default",
  "com_invoices_doc" varchar(255) COLLATE "pg_catalog"."default",
  "bil_doc" varchar(255) COLLATE "pg_catalog"."default",
  "coo_doc" varchar(255) COLLATE "pg_catalog"."default",
  "final_alert_doc" varchar(255) COLLATE "pg_catalog"."default",
  "container_loading_doc" varchar(255) COLLATE "pg_catalog"."default",
  "msds_doc" varchar(255) COLLATE "pg_catalog"."default",
  "packing_list_doc" varchar(255) COLLATE "pg_catalog"."default",
  "cft_doc" varchar(255) COLLATE "pg_catalog"."default",
  "test_report_doc" varchar(255) COLLATE "pg_catalog"."default",
  "other_doc" varchar(255) COLLATE "pg_catalog"."default",
  "mawb_doc" varchar(255) COLLATE "pg_catalog"."default",
  "cargo_manifest" varchar(255) COLLATE "pg_catalog"."default",
  "loading_image" varchar(255) COLLATE "pg_catalog"."default",
  "prof_delivered" varchar(255) COLLATE "pg_catalog"."default",
  "image_delivered" varchar(255) COLLATE "pg_catalog"."default",
  "ctd_doc" varchar(255) COLLATE "pg_catalog"."default",
  "file_bebas" varchar(255) COLLATE "pg_catalog"."default",
  "attachment_goods" varchar(255) COLLATE "pg_catalog"."default",
  "additional_description" text COLLATE "pg_catalog"."default",
  "chw" float8,
  "vol_weight" float8,
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."si_order"."status" IS '1. active

2. inactive

3. deleted';
COMMENT ON COLUMN "origin"."si_order"."si_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."com_invoices_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."bil_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."coo_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."final_alert_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."container_loading_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."msds_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."packing_list_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."cft_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."test_report_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."other_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."mawb_doc" IS 'dokumen dxb';
COMMENT ON COLUMN "origin"."si_order"."cargo_manifest" IS 'dokumen dxb';
COMMENT ON COLUMN "origin"."si_order"."loading_image" IS 'dokumen dxb';
COMMENT ON COLUMN "origin"."si_order"."prof_delivered" IS 'dokumen agent';
COMMENT ON COLUMN "origin"."si_order"."image_delivered" IS 'dokument_agent';
COMMENT ON COLUMN "origin"."si_order"."ctd_doc" IS 'dokumen origin';
COMMENT ON COLUMN "origin"."si_order"."file_bebas" IS 'dokument_agent';
COMMENT ON COLUMN "origin"."si_order"."attachment_goods" IS 'dokument attachement description of goods';
COMMENT ON COLUMN "origin"."si_order"."additional_description" IS 'text tambahan untuk description of goods untuk mengarang bebas yang sifat nya optional';


-- ----------------------------
-- Table structure for si_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."si_order_detail";
CREATE TABLE "origin"."si_order_detail" (
  "si_order_detail" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid,
  "order_number" varchar(255) COLLATE "pg_catalog"."default",
  "style_number" varchar(255) COLLATE "pg_catalog"."default",
  "art_number" varchar COLLATE "pg_catalog"."default",
  "date_created" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4,
  "hs_code" varchar(255) COLLATE "pg_catalog"."default",
  "container_number" varchar(100) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."si_order_detail"."description" IS 'description untuk masing masing order';


-- ----------------------------
-- Table structure for si_sales_office
-- ----------------------------
DROP TABLE IF EXISTS "origin"."si_sales_office";
CREATE TABLE "origin"."si_sales_office" (
  "si_sales_office_id" uuid NOT NULL DEFAULT uuid_generate_v7(),
  "job_id" uuid,
  "sales_office_id" uuid,
  "status" int2 DEFAULT 1,
  "date_created" timestamp(6),
  "date_modified" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "sales_office_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of si_sales_office
-- ----------------------------

-- ----------------------------
-- Table structure for si_sales_person
-- ----------------------------
DROP TABLE IF EXISTS "origin"."si_sales_person";
CREATE TABLE "origin"."si_sales_person" (
  "si_sales_person_id" uuid NOT NULL DEFAULT uuid_generate_v7(),
  "job_id" uuid,
  "sales_person_id" uuid,
  "status" int2 DEFAULT 1,
  "date_created" timestamp(6),
  "date_modified" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "sales_person_name" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for status_trucking
-- ----------------------------
DROP TABLE IF EXISTS "origin"."status_trucking";
CREATE TABLE "origin"."status_trucking" (
  "status_id" int4 NOT NULL,
  "status_name" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of status_trucking
-- ----------------------------
INSERT INTO "origin"."status_trucking" VALUES (2, 'Loading at airport');
INSERT INTO "origin"."status_trucking" VALUES (3, 'In Offloading');
INSERT INTO "origin"."status_trucking" VALUES (4, 'On The way');
INSERT INTO "origin"."status_trucking" VALUES (5, 'Delivered');
INSERT INTO "origin"."status_trucking" VALUES (6, 'In Time');
INSERT INTO "origin"."status_trucking" VALUES (7, 'Delayed');
INSERT INTO "origin"."status_trucking" VALUES (8, 'Closed');
INSERT INTO "origin"."status_trucking" VALUES (1, 'Book');

-- ----------------------------
-- Function structure for auto_ctd
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_ctd"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_ctd"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;

--     if( (SELECT MAX(SUBSTR(ctd_number,3)) INTO hasil from "origin".shipping_instruction WHERE  LEFT(ctd_number,9) = p_prefix )=)
-- 	 if((SELECT MAX(SUBSTR(ctd_number,1,2)) INTO hasil from "origin".shipping_instruction WHERE  LEFT(ctd_number,9) = p_prefix ) = '^[0-9\.]+$')
		 SELECT CAST(MAX(SUBSTR(ctd_number,10,3)) AS INT2)  INTO hasil  from "origin".shipping_instruction WHERE  LEFT(ctd_number,9) = p_prefix ;
--      SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE  LEFT(ctd_number,9) = p_prefix ; -- ctd_number  LIKE CONCAT('%',LEFT(p_prefix,5),'%'); -- AND LEFT(ctd_number,9) = p_prefix ;
-- 		 ELSE
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_ctd"("p_prefix" varchar, "p_moth" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_ctd"("p_prefix" varchar, "p_moth" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
	 
		
     SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,13) = p_prefix;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd(p_prefix varchar)
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_ctd(p_prefix varchar)"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_ctd(p_prefix varchar)"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
	 
		
     SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE  LEFT(ctd_number,9) = p_prefix ; -- ctd_number  LIKE CONCAT('%',LEFT(p_prefix,5),'%'); -- AND LEFT(ctd_number,9) = p_prefix ;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd_backup
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_ctd_backup"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_ctd_backup"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT;    
BEGIN

    SELECT CAST(MAX(RIGHT(ctd_number,6)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,6) = p_prefix;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,6,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd_copy1
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_ctd_copy1"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_ctd_copy1"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
		IF LENGTH(p_prefix)=6 THEN
       SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
    ELSE
       SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
    END IF;
	 
		
   --  SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,'-',tahun ,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_final_alert
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_final_alert"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_final_alert"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
	 
		

		
	SELECT CAST(MAX(RIGHT(no_final_alert,3)) AS INT2)   INTO hasil  from "origin".final_alert WHERE LEFT(no_final_alert,3) = RIGHT(p_prefix,3);
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(RIGHT(p_prefix,3),'-',lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_final_alert_cross_air
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."auto_final_alert_cross_air"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."auto_final_alert_cross_air"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
	 
		

		
	SELECT CAST(MAX(RIGHT(no_final_alert,3)) AS INT2)   INTO hasil  from "origin".final_alert_crossair WHERE LEFT(no_final_alert,3) = RIGHT(p_prefix,3);
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(RIGHT(p_prefix,3),'-',lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for claim_number
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."claim_number"();
CREATE OR REPLACE FUNCTION "origin"."claim_number"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
--     SELECT CAST(MAX(RIGHT(loading_plan_number,3)) AS INT2)  INTO hasil from "dxb".loading_plan 
--     	-- WHERE LEFT(ctd_number,13) = p_prefix;
--      where SPLIT_PART(loading_plan_number,'-', 1) = SPLIT_PART('LP','-', 1) and left(SPLIT_PART(loading_plan_number,'-', 2),4) = SPLIT_PART('LP','-', 2);     
-- 		 
--	SELECT CAST(MAX(RIGHT(TRIM(claim_number),1)) AS INT4) INTO hasil  from "origin".claim  where SPLIT_PART(claim_number,'-', 6) = SPLIT_PART('CLAIM','-', 6);  -- and left(SPLIT_PART(loading_plan_number,'-', 6),4) = SPLIT_PART('LP','-', 2); 
	SELECT CAST(MAX(RIGHT(TRIM(claim_number),3)) AS INT4) INTO hasil from "origin".claim;    
	 --	RETURN concat(p_prefix,hasil + 1);
	RETURN concat('CLAIM','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for generate_quotation
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."generate_quotation"();
CREATE OR REPLACE FUNCTION "origin"."generate_quotation"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
-- 	 
-- 		
    --  SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
		 
		   SELECT CAST(MAX(RIGHT(quotation_number,4)) AS INT2)  INTO hasil from "origin".quotation;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for job_order_air
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."job_order_air"();
CREATE OR REPLACE FUNCTION "origin"."job_order_air"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   		 
	SELECT CAST(MAX(RIGHT(TRIM(job_order_code),1)) AS INT4) INTO hasil  from "origin".job_order_air  where LEFT(job_order_code,6) = CONCAT('CA',tahun,bulan) ;
	RETURN concat('CA',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for job_order_code
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."job_order_code"();
CREATE OR REPLACE FUNCTION "origin"."job_order_code"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2) ;
DECLARE bulan varchar(2) ;
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   
	 
	SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "origin".job_order where LEFT(job_order_code,6) = CONCAT('SA',tahun,bulan) ;
	RETURN concat('SA',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_plan_ca
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."loading_plan_ca"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."loading_plan_ca"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		


-- 	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "origin".loading_plan where SPLIT_PART(loading_plan_number,'-',concat(tahun,bulan, 3) ) = SPLIT_PART(p_prefix,'-',concat(tahun,bulan, 3)); 
-- 	RETURN concat('LP',p_prefix,'-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));
    SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "origin".loading_plan 
	  WHERE LEFT(SPLIT_PART(loading_plan_number, '-', 2),4) = CONCAT(tahun,bulan) AND SUBSTR(SPLIT_PART(loading_plan_number,'-',1),3) = p_prefix ;
    RETURN concat('LP',p_prefix,'-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_plan_sa
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."loading_plan_sa"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."loading_plan_sa"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		


	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "origin".loading_report where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
	RETURN concat('LP',p_prefix,'-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_pnumber
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."loading_pnumber"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."loading_pnumber"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		


	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "origin".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
	RETURN concat('LP',p_prefix,'-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for mawb_number
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."mawb_number"();
CREATE OR REPLACE FUNCTION "origin"."mawb_number"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   		 
	SELECT CAST(MAX(RIGHT(TRIM(no_mawb),4)) AS INT4) INTO hasil  from "origin".mawb_generate  where LEFT(no_mawb,8) = CONCAT('MAWB',tahun,bulan) ;
	RETURN concat('MAWB',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for no_operation
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."no_operation"();
CREATE OR REPLACE FUNCTION "origin"."no_operation"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   		 
	SELECT CAST(MAX(RIGHT(TRIM(no_operation_chart),4)) AS INT4) INTO hasil  from "origin".operation_chart  where LEFT(no_operation_chart,6) = CONCAT('OC',tahun,bulan) ;
	RETURN concat('OC',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for tes
-- ----------------------------
DROP FUNCTION IF EXISTS "origin"."tes"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "origin"."tes"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
		IF LENGTH(p_prefix)=7 THEN
       SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
    ELSE
       SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
    END IF;
	 
		
   --  SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,'-',tahun ,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for view_teus
-- ----------------------------
DROP VIEW IF EXISTS "origin"."view_teus";
CREATE VIEW "origin"."view_teus" AS  SELECT loading_report_detail.container_type,
        CASE
            WHEN "left"(loading_report_detail.container_type::text, 1)::integer = 2 THEN 1
            WHEN "left"(loading_report_detail.container_type::text, 1)::integer = 4 THEN 2
            ELSE 0
        END AS teus,
    loading_report.bl_number,
    loading_report.loading_id
   FROM origin.loading_report_detail
     LEFT JOIN origin.loading_report ON loading_report.loading_id = loading_report_detail.bl_id;

-- ----------------------------
-- Primary Key structure for table agreed_rate
-- ----------------------------
ALTER TABLE "origin"."agreed_rate" ADD CONSTRAINT "agreed_rate_pkey" PRIMARY KEY ("rate_id");

-- ----------------------------
-- Primary Key structure for table chat_note
-- ----------------------------
ALTER TABLE "origin"."chat_note" ADD CONSTRAINT "chat_note_pkey" PRIMARY KEY ("chat_id", "job_id");

-- ----------------------------
-- Primary Key structure for table claim
-- ----------------------------
ALTER TABLE "origin"."claim" ADD CONSTRAINT "claim_pkey" PRIMARY KEY ("claim_id");

-- ----------------------------
-- Primary Key structure for table claim_detail
-- ----------------------------
ALTER TABLE "origin"."claim_detail" ADD CONSTRAINT "claim_detail_pkey" PRIMARY KEY ("claim_detail_id");

-- ----------------------------
-- Primary Key structure for table claims_document
-- ----------------------------
ALTER TABLE "origin"."claims_document" ADD CONSTRAINT "claims_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table control_office
-- ----------------------------
ALTER TABLE "origin"."control_office" ADD CONSTRAINT "control_office_pkey" PRIMARY KEY ("control_id");

-- ----------------------------
-- Primary Key structure for table destination_partner_office
-- ----------------------------
ALTER TABLE "origin"."destination_partner_office" ADD CONSTRAINT "destination_partner_office_pkey" PRIMARY KEY ("destination_partner_id");

-- ----------------------------
-- Primary Key structure for table dimension
-- ----------------------------
ALTER TABLE "origin"."dimension" ADD CONSTRAINT "dimension_pkey" PRIMARY KEY ("dimension_id");

-- ----------------------------
-- Primary Key structure for table final_alert
-- ----------------------------
ALTER TABLE "origin"."final_alert" ADD CONSTRAINT "final_alert_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table final_alert_crossair
-- ----------------------------
ALTER TABLE "origin"."final_alert_crossair" ADD CONSTRAINT "final_alert_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table histori_job
-- ----------------------------
ALTER TABLE "origin"."histori_job" ADD CONSTRAINT "histori_job_pkey" PRIMARY KEY ("histori_id");

-- ----------------------------
-- Primary Key structure for table job_order
-- ----------------------------
ALTER TABLE "origin"."job_order" ADD CONSTRAINT "job_order_pkey" PRIMARY KEY ("job_order_id");

-- ----------------------------
-- Primary Key structure for table job_order_air
-- ----------------------------
ALTER TABLE "origin"."job_order_air" ADD CONSTRAINT "job_order_copy1_pkey" PRIMARY KEY ("job_order_id");

-- ----------------------------
-- Primary Key structure for table job_order_detail
-- ----------------------------
ALTER TABLE "origin"."job_order_detail" ADD CONSTRAINT "job_order_detail_pkey" PRIMARY KEY ("job_order_detail_id");

-- ----------------------------
-- Primary Key structure for table job_order_document
-- ----------------------------
ALTER TABLE "origin"."job_order_document" ADD CONSTRAINT "job_order_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table job_order_vendor
-- ----------------------------
ALTER TABLE "origin"."job_order_vendor" ADD CONSTRAINT "job_order_vendor_pkey" PRIMARY KEY ("job_order_vendor_id");

-- ----------------------------
-- Primary Key structure for table job_truck_delivery
-- ----------------------------
ALTER TABLE "origin"."job_truck_delivery" ADD CONSTRAINT "job_truck_delivery_pkey" PRIMARY KEY ("delivery_point_id");

-- ----------------------------
-- Primary Key structure for table job_truck_delivery_detail
-- ----------------------------
ALTER TABLE "origin"."job_truck_delivery_detail" ADD CONSTRAINT "job_truck_delivery_detail_pkey" PRIMARY KEY ("delivery_point_detail_id");

-- ----------------------------
-- Primary Key structure for table job_trucking
-- ----------------------------
ALTER TABLE "origin"."job_trucking" ADD CONSTRAINT "Job_trucking_pkey" PRIMARY KEY ("job_truck_id");

-- ----------------------------
-- Primary Key structure for table job_trucking_t1subaddress
-- ----------------------------
ALTER TABLE "origin"."job_trucking_t1subaddress" ADD CONSTRAINT "t1_sub_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table loading_plan
-- ----------------------------
ALTER TABLE "origin"."loading_plan" ADD CONSTRAINT "loading_plan_pkey" PRIMARY KEY ("plan_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_detail
-- ----------------------------
ALTER TABLE "origin"."loading_plan_detail" ADD CONSTRAINT "loading_plan_detail_pkey" PRIMARY KEY ("loading_detail_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_document
-- ----------------------------
ALTER TABLE "origin"."loading_plan_document" ADD CONSTRAINT "loading_plan_document_pkey" PRIMARY KEY ("loading_plan_document_id");

-- ----------------------------
-- Primary Key structure for table loading_report
-- ----------------------------
ALTER TABLE "origin"."loading_report" ADD CONSTRAINT "loading_report_pkey" PRIMARY KEY ("loading_id");

-- ----------------------------
-- Primary Key structure for table loading_report_bl
-- ----------------------------
ALTER TABLE "origin"."loading_report_bl" ADD CONSTRAINT "loading_report_bl_pkey" PRIMARY KEY ("loading_report_bl_id");

-- ----------------------------
-- Primary Key structure for table loading_report_detail
-- ----------------------------
ALTER TABLE "origin"."loading_report_detail" ADD CONSTRAINT "loading_report_detail_pkey" PRIMARY KEY ("detail_bl_id");

-- ----------------------------
-- Primary Key structure for table loading_report_feeder
-- ----------------------------
ALTER TABLE "origin"."loading_report_feeder" ADD CONSTRAINT "loading_report_feeder_pkey" PRIMARY KEY ("loading_report_feeder_id");

-- ----------------------------
-- Primary Key structure for table local_transport
-- ----------------------------
ALTER TABLE "origin"."local_transport" ADD CONSTRAINT "local_transport_pkey" PRIMARY KEY ("local_id");

-- ----------------------------
-- Primary Key structure for table mawb_stock_generation
-- ----------------------------
ALTER TABLE "origin"."mawb_stock_generation" ADD CONSTRAINT "Untitled_pkey" PRIMARY KEY ("mawb_id");

-- ----------------------------
-- Primary Key structure for table noted_section
-- ----------------------------
ALTER TABLE "origin"."noted_section" ADD CONSTRAINT "noted_section_pkey" PRIMARY KEY ("noted_id");

-- ----------------------------
-- Primary Key structure for table notification
-- ----------------------------
ALTER TABLE "origin"."notification" ADD CONSTRAINT "notification_pkey" PRIMARY KEY ("notification_id");

-- ----------------------------
-- Primary Key structure for table notification_user
-- ----------------------------
ALTER TABLE "origin"."notification_user" ADD CONSTRAINT "notification_user_pkey" PRIMARY KEY ("notification_user_id");

-- ----------------------------
-- Primary Key structure for table operation_document
-- ----------------------------
ALTER TABLE "origin"."operation_document" ADD CONSTRAINT "operation_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table order_document
-- ----------------------------
ALTER TABLE "origin"."order_document" ADD CONSTRAINT "order_document_pkey" PRIMARY KEY ("order_document_id");

-- ----------------------------
-- Primary Key structure for table quotation
-- ----------------------------
ALTER TABLE "origin"."quotation" ADD CONSTRAINT "quotation_pkey" PRIMARY KEY ("quotation_id");

-- ----------------------------
-- Primary Key structure for table quotation_detail
-- ----------------------------
ALTER TABLE "origin"."quotation_detail" ADD CONSTRAINT "quotation_detail_pkey" PRIMARY KEY ("quotation_detail_id");

-- ----------------------------
-- Primary Key structure for table shipping_instruction
-- ----------------------------
ALTER TABLE "origin"."shipping_instruction" ADD CONSTRAINT "shipping_instruction_pkey" PRIMARY KEY ("job_id");

-- ----------------------------
-- Primary Key structure for table si_order
-- ----------------------------
ALTER TABLE "origin"."si_order" ADD CONSTRAINT "si_order_pkey" PRIMARY KEY ("order_id");

-- ----------------------------
-- Primary Key structure for table si_order_detail
-- ----------------------------
ALTER TABLE "origin"."si_order_detail" ADD CONSTRAINT "si_order_detail_pkey" PRIMARY KEY ("si_order_detail");

-- ----------------------------
-- Primary Key structure for table si_sales_office
-- ----------------------------
ALTER TABLE "origin"."si_sales_office" ADD CONSTRAINT "si_sales_office_pkey" PRIMARY KEY ("si_sales_office_id");

-- ----------------------------
-- Primary Key structure for table si_sales_person
-- ----------------------------
ALTER TABLE "origin"."si_sales_person" ADD CONSTRAINT "si_sales_person_pkey" PRIMARY KEY ("si_sales_person_id");

-- ----------------------------
-- Primary Key structure for table status_trucking
-- ----------------------------
ALTER TABLE "origin"."status_trucking" ADD CONSTRAINT "status_trucking_pkey" PRIMARY KEY ("status_id");
