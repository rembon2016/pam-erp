/*
 Navicat Premium Dump SQL

 Source Server         : Dev-203.175.10.178
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : dxb

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/12/2024 18:36:28
*/


-- ----------------------------
-- Sequence structure for courir_shipment_mode_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "dxb"."courir_shipment_mode_id_seq";
CREATE SEQUENCE "dxb"."courir_shipment_mode_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for status_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "dxb"."status_id_seq";
CREATE SEQUENCE "dxb"."status_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 23
CACHE 1;

-- ----------------------------
-- Table structure for agreed_rate
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."agreed_rate";
CREATE TABLE "dxb"."agreed_rate" (
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
  "unit" varchar(255) COLLATE "pg_catalog"."default",
  "creating_by" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for chat_note
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."chat_note";
CREATE TABLE "dxb"."chat_note" (
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
DROP TABLE IF EXISTS "dxb"."claim";
CREATE TABLE "dxb"."claim" (
  "claim_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "date_claim" timestamp(6),
  "claim_number" varchar(255) COLLATE "pg_catalog"."default",
  "is_refurbish" bool,
  "value" float4,
  "gross_weight" float4,
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2
)
;

-- ----------------------------

-- ----------------------------
-- Table structure for claim_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."claim_detail";
CREATE TABLE "dxb"."claim_detail" (
  "claim_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "claim_id" uuid,
  "claim_type" int2,
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for claims_document
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."claims_document";
CREATE TABLE "dxb"."claims_document" (
  "document_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "claim_id" uuid,
  "job_id" uuid,
  "document_name" varchar(255) COLLATE "pg_catalog"."default",
  "document_file" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for control_office
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."control_office";
CREATE TABLE "dxb"."control_office" (
  "control_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "office_id" uuid,
  "office_name" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for courir_shipment_mode
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."courir_shipment_mode";
CREATE TABLE "dxb"."courir_shipment_mode" (
  "id" int4 NOT NULL DEFAULT nextval('"dxb".courir_shipment_mode_id_seq'::regclass),
  "shipment_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of courir_shipment_mode
-- ----------------------------
INSERT INTO "dxb"."courir_shipment_mode" VALUES (1, 'TES');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."customer";
CREATE TABLE "dxb"."customer" (
  "customer_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_address" varchar(500) COLLATE "pg_catalog"."default",
  "customer_email" varchar(100) COLLATE "pg_catalog"."default",
  "customer_telp" varchar(25) COLLATE "pg_catalog"."default",
  "customer_fax" varchar(20) COLLATE "pg_catalog"."default",
  "customer_phone" varchar(20) COLLATE "pg_catalog"."default",
  "customer_tax_id" varchar(50) COLLATE "pg_catalog"."default",
  "customer_contact_person" varchar(200) COLLATE "pg_catalog"."default",
  "country_id" int8,
  "date_created" timestamp(0) NOT NULL DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0) DEFAULT now(),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL DEFAULT 1,
  "customer_type" uuid NOT NULL,
  "customer_code" varchar(20) COLLATE "pg_catalog"."default",
  "customer_group_id" uuid,
  "iata_code" varchar(50) COLLATE "pg_catalog"."default",
  "office_id" uuid,
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "zip_code" varchar(255) COLLATE "pg_catalog"."default",
  "vendor_id" uuid
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for customer_group
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."customer_group";
CREATE TABLE "dxb"."customer_group" (
  "customer_group_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "customer_group_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_group_address" varchar(255) COLLATE "pg_catalog"."default",
  "customer_group_email" varchar(100) COLLATE "pg_catalog"."default",
  "customer_group_telp" varchar(25) COLLATE "pg_catalog"."default",
  "customer_group_phone" varchar(20) COLLATE "pg_catalog"."default",
  "customer_group_contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "customer_group_fax" varchar(20) COLLATE "pg_catalog"."default",
  "date_created" timestamp(6) DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 DEFAULT 1
)
;

-- ----------------------------
-- Records of customer_group
-- ----------------------------

-- ----------------------------
-- Table structure for dimension
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."dimension";
CREATE TABLE "dxb"."dimension" (
  "dimension_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid,
  "no_pcs" varchar(20) COLLATE "pg_catalog"."default",
  "unit" varchar(20) COLLATE "pg_catalog"."default",
  "length" float8,
  "width" float8,
  "height" float8,
  "volume_cbm" float8,
  "volume_weight" float8
)
;


-- ----------------------------
-- Table structure for final_alert
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."final_alert";
CREATE TABLE "dxb"."final_alert" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "vessel_name_voyage" varchar(100) COLLATE "pg_catalog"."default",
  "no_final_alert" varchar(20) COLLATE "pg_catalog"."default",
  "file_final_alert" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date
)
;
COMMENT ON COLUMN "dxb"."final_alert"."created_by" IS 'di isi email origin yang created sehingga jadi parameter saat ditampilkan hanya tampil di origin yang create';
COMMENT ON COLUMN "dxb"."final_alert"."eta_dubai" IS 'tgl estimasi tiba di duba';

-- ----------------------------
-- Records of final_alert
-- ----------------------------

-- ----------------------------
-- Table structure for final_alert_crossair
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."final_alert_crossair";
CREATE TABLE "dxb"."final_alert_crossair" (
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
COMMENT ON COLUMN "dxb"."final_alert_crossair"."created_by" IS 'di isi email origin yang created sehingga jadi parameter saat ditampilkan hanya tampil di origin yang create';
COMMENT ON COLUMN "dxb"."final_alert_crossair"."eta_dubai" IS 'tgl estimasi tiba di duba';

-- ----------------------------
-- Records of final_alert_crossair
-- ----------------------------

-- ----------------------------
-- Table structure for hasil
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."hasil";
CREATE TABLE "dxb"."hasil" (
  "max" int2
)
;

-- ----------------------------
-- Records of hasil
-- ----------------------------

-- ----------------------------
-- Table structure for histori_job
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."histori_job";
CREATE TABLE "dxb"."histori_job" (
  "histori_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "status" varchar(100) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "tgl_aktual" timestamp(6),
  "date_created" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "gmt" varchar(10) COLLATE "pg_catalog"."default",
  "status_id" int8,
  "is_deleted" int2 DEFAULT 0
)
;


-- ----------------------------
-- Table structure for job_order
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."job_order";
CREATE TABLE "dxb"."job_order" (
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
  "job_order_type" varchar(16) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "origin_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "destination_charges" varchar(255) COLLATE "pg_catalog"."default",
  "mawb_number" varchar(255) COLLATE "pg_catalog"."default",
  "etd_dubai" date,
  "dxb" uuid,
  "port_name_sea_export" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date,
  "loading_plan_id" uuid,
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "loading_plan_number" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."job_order"."vessel_id" IS 'sea import dan sea export';
COMMENT ON COLUMN "dxb"."job_order"."vessel_name_voyage" IS 'sea import dan sea export';
COMMENT ON COLUMN "dxb"."job_order"."job_order_type" IS '1. sea Import
2. air expor
3. air import
4. air export';
COMMENT ON COLUMN "dxb"."job_order"."status" IS '1. generated
2. process
3. done
';


-- ----------------------------
-- Table structure for job_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."job_order_detail";
CREATE TABLE "dxb"."job_order_detail" (
  "job_order_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid
)
;
COMMENT ON COLUMN "dxb"."job_order_detail"."job_id" IS 'job id shipping instruction';


-- ----------------------------
-- Table structure for job_order_document
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."job_order_document";
CREATE TABLE "dxb"."job_order_document" (
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
)
;

-- ----------------------------
-- Records of job_order_document
-- ----------------------------

-- ----------------------------
-- Table structure for job_order_vendor
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."job_order_vendor";
CREATE TABLE "dxb"."job_order_vendor" (
  "job_order_vendor_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "handlig_type" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."job_order_vendor"."handlig_type" IS '1. trucking
2. handling';
COMMENT ON COLUMN "dxb"."job_order_vendor"."type" IS '1. SEA Import , Air Emport';

-- ----------------------------
-- Records of job_order_vendor
-- ----------------------------

-- ----------------------------
-- Table structure for loading_plan
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_plan";
CREATE TABLE "dxb"."loading_plan" (
  "plan_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "carrier_id" uuid,
  "carrier_name" varchar(150) COLLATE "pg_catalog"."default",
  "mawb_number" varchar(50) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" date DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "origin_office_id" uuid NOT NULL,
  "closing_time" timestamp(0),
  "flight_number" varchar(255) COLLATE "pg_catalog"."default",
  "etd" date,
  "eta" date,
  "loading_plan_number" varchar(20) COLLATE "pg_catalog"."default",
  "destination_agent_id" uuid,
  "destination_agent_name" varchar(200) COLLATE "pg_catalog"."default",
  "notes" text COLLATE "pg_catalog"."default",
  "shipper_id" uuid,
  "shipper_name" varchar(255) COLLATE "pg_catalog"."default",
  "shipper_address" varchar(255) COLLATE "pg_catalog"."default",
  "consignee_id" uuid,
  "consignee_name" varchar(255) COLLATE "pg_catalog"."default",
  "consignee_address" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "handling_information" text COLLATE "pg_catalog"."default",
  "iata_code" varchar(255) COLLATE "pg_catalog"."default",
  "freight_term" varchar(20) COLLATE "pg_catalog"."default",
  "incoterm" varchar(20) COLLATE "pg_catalog"."default",
  "job_order_no" varchar(20) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."loading_plan"."status" IS '1. used
2. available
';
COMMENT ON COLUMN "dxb"."loading_plan"."destination_agent_id" IS 'kebutuhan report';
COMMENT ON COLUMN "dxb"."loading_plan"."destination_agent_name" IS 'kebutuhan report';
COMMENT ON COLUMN "dxb"."loading_plan"."notes" IS 'untuk mencatat nomor cts sementara';

-- ----------------------------
-- Records of loading_plan
-- ----------------------------

-- ----------------------------
-- Table structure for loading_plan_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_plan_detail";
CREATE TABLE "dxb"."loading_plan_detail" (
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
  "port_arival_code" varchar(50) COLLATE "pg_catalog"."default",
  "carrier_id" uuid,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of loading_plan_detail
-- ----------------------------

-- ----------------------------
-- Table structure for loading_plan_detail_local
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_plan_detail_local";
CREATE TABLE "dxb"."loading_plan_detail_local" (
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
  "port_arival_code" varchar(50) COLLATE "pg_catalog"."default",
  "carrier_id" uuid,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of loading_plan_detail_local
-- ----------------------------

-- ----------------------------
-- Table structure for loading_plan_document
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_plan_document";
CREATE TABLE "dxb"."loading_plan_document" (
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
)
;

-- ----------------------------
-- Records of loading_plan_document
-- ----------------------------

-- ----------------------------
-- Table structure for loading_plan_local
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_plan_local";
CREATE TABLE "dxb"."loading_plan_local" (
  "plan_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "carrier_id" uuid,
  "carrier_name" varchar(150) COLLATE "pg_catalog"."default",
  "mawb_number" varchar(50) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(100) COLLATE "pg_catalog"."default",
  "date_modified" date DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "origin_office_id" uuid NOT NULL,
  "closing_time" timestamp(0),
  "flight_number" varchar(255) COLLATE "pg_catalog"."default",
  "etd" date,
  "eta" date,
  "loading_plan_number" varchar(20) COLLATE "pg_catalog"."default",
  "destination_agent_id" uuid,
  "destination_agent_name" varchar(200) COLLATE "pg_catalog"."default",
  "notes" text COLLATE "pg_catalog"."default",
  "shipper_id" uuid,
  "shipper_name" varchar(255) COLLATE "pg_catalog"."default",
  "shipper_address" varchar(255) COLLATE "pg_catalog"."default",
  "consignee_id" uuid,
  "consignee_name" varchar(255) COLLATE "pg_catalog"."default",
  "consignee_address" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "handling_information" varchar(255) COLLATE "pg_catalog"."default",
  "iata_code" varchar(255) COLLATE "pg_catalog"."default",
  "freight_term" varchar(20) COLLATE "pg_catalog"."default",
  "incoterm" varchar(20) COLLATE "pg_catalog"."default",
  "job_order_no" varchar(20) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."loading_plan_local"."status" IS '1. used
2. available
';
COMMENT ON COLUMN "dxb"."loading_plan_local"."destination_agent_id" IS 'kebutuhan report';
COMMENT ON COLUMN "dxb"."loading_plan_local"."destination_agent_name" IS 'kebutuhan report';
COMMENT ON COLUMN "dxb"."loading_plan_local"."notes" IS 'untuk mencatat nomor cts sementara';

-- ----------------------------
-- Records of loading_plan_local
-- ----------------------------

-- ----------------------------
-- Table structure for loading_report
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_report";
CREATE TABLE "dxb"."loading_report" (
  "loading_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "shipping_line" uuid,
  "shipping_line_name" varchar(255) COLLATE "pg_catalog"."default",
  "booking_number" varchar(255) COLLATE "pg_catalog"."default",
  "qty_container" float4,
  "bl_number" varchar(64) COLLATE "pg_catalog"."default",
  "origin_office_id" uuid,
  "status" int2,
  "date_created" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "vessel_id" uuid,
  "vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "etd" date,
  "eta" date,
  "voyage_number" varchar(255) COLLATE "pg_catalog"."default",
  "feeder_vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default",
  "fcl_clossing_time" date,
  "loading_report_number" varchar(255) COLLATE "pg_catalog"."default"
)
;


-- ----------------------------
-- Table structure for loading_report_bl
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_report_bl";
CREATE TABLE "dxb"."loading_report_bl" (
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
)
;

-- ----------------------------
-- Records of loading_report_bl
-- ----------------------------

-- ----------------------------
-- Table structure for loading_report_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."loading_report_detail";
CREATE TABLE "dxb"."loading_report_detail" (
  "detail_bl_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "bl_id" uuid NOT NULL,
  "container_number" varchar(100) COLLATE "pg_catalog"."default",
  "seal_number" varchar(100) COLLATE "pg_catalog"."default",
  "container_type" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "loading_report_bl_id" uuid
)
;
COMMENT ON COLUMN "dxb"."loading_report_detail"."container_type" IS '1. 40 ft 2, 25 ft ';


-- ----------------------------
-- Table structure for local_transport
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."local_transport";
CREATE TABLE "dxb"."local_transport" (
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
  "origin_warehouse" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."local_transport"."status" IS '1. active 2. inactive 3. deleted';


-- ----------------------------
-- Table structure for mawb_stock_generation
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."mawb_stock_generation";
CREATE TABLE "dxb"."mawb_stock_generation" (
  "mawb_id" uuid NOT NULL,
  "mawb_number" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "carrier_id" uuid,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default",
  "por" varchar(5) COLLATE "pg_catalog"."default",
  "carrier_number" varchar(6) COLLATE "pg_catalog"."default",
  "MAWB" varchar(8) COLLATE "pg_catalog"."default",
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
COMMENT ON COLUMN "dxb"."mawb_stock_generation"."status" IS '1. availabled
2. reserved
3. book
4. generated
';

-- ----------------------------
-- Records of mawb_stock_generation
-- ----------------------------

-- ----------------------------
-- Table structure for noted_section
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."noted_section";
CREATE TABLE "dxb"."noted_section" (
  "noted_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "noted" varchar(255) COLLATE "pg_catalog"."default",
  "times" timestamp(6) DEFAULT now(),
  "chat_section" int2,
  "date_created" date,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid
)
;
COMMENT ON COLUMN "dxb"."noted_section"."chat_section" IS '1. origin
2. dxb
3. agent';


-- ----------------------------
-- Table structure for operation_chart
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."operation_chart";
CREATE TABLE "dxb"."operation_chart" (
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
-- Records of operation_chart
-- ----------------------------

-- ----------------------------
-- Table structure for operation_document
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."operation_document";
CREATE TABLE "dxb"."operation_document" (
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
)
;


-- ----------------------------
-- Table structure for order_document
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."order_document";
CREATE TABLE "dxb"."order_document" (
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
)
;


-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."quotation";
CREATE TABLE "dxb"."quotation" (
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
COMMENT ON COLUMN "dxb"."quotation"."status" IS '1. save as draft
2.submit
3. delete';
COMMENT ON COLUMN "dxb"."quotation"."attn_name" IS 'untuk memasukan nama customer contact/ opsional saat input';

-- ----------------------------
-- Records of quotation
-- ----------------------------

-- ----------------------------
-- Table structure for quotation_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."quotation_detail";
CREATE TABLE "dxb"."quotation_detail" (
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
-- Table structure for schedule_vessel
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."schedule_vessel";
CREATE TABLE "dxb"."schedule_vessel" (
  "schedule_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "departure_id" uuid,
  "via_id" varchar(20) COLLATE "pg_catalog"."default",
  "arrive_id" uuid,
  "vessel_name" varchar(255) COLLATE "pg_catalog"."default",
  "voyage_number" varchar(255) COLLATE "pg_catalog"."default",
  "closing_time" date,
  "etd_departure" date,
  "etd_transit_airport" date,
  "eta" date,
  "transit_time" varchar(20) COLLATE "pg_catalog"."default",
  "eta_us" date,
  "transit_time_us" varchar(20) COLLATE "pg_catalog"."default",
  "create_date" timestamp(6) DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6) DEFAULT now(),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4,
  "vessel_id" uuid,
  "country_id" int4,
  "departure_name" varchar(255) COLLATE "pg_catalog"."default",
  "arrive_name" varchar(255) COLLATE "pg_catalog"."default",
  "country_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."schedule_vessel"."via_id" IS '1. DXB
2. SING
3. Free text input';


-- ----------------------------
-- Table structure for shipping_instruction
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."shipping_instruction";
CREATE TABLE "dxb"."shipping_instruction" (
  "job_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "to_consignee" uuid,
  "from_shipper" uuid,
  "origin_id" uuid,
  "port_of_loading" uuid,
  "port_of_destination" uuid,
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
  "consignee_address" varchar(255) COLLATE "pg_catalog"."default",
  "shipper_name" varchar(255) COLLATE "pg_catalog"."default",
  "shipper_address" varchar(255) COLLATE "pg_catalog"."default",
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "port_loading_name" varchar(100) COLLATE "pg_catalog"."default",
  "port_destination_name" varchar(100) COLLATE "pg_catalog"."default",
  "mother_vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "feeder_vessel_name" varchar(100) COLLATE "pg_catalog"."default",
  "ctd_number" varchar(100) COLLATE "pg_catalog"."default",
  "status" int4,
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
  "shipping_instruction_type" varchar(30) COLLATE "pg_catalog"."default",
  "courir_tracking_resi" varchar(255) COLLATE "pg_catalog"."default",
  "status_update" int2 DEFAULT 0,
  "customer_group_id" uuid,
  "customer_group_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_address" varchar(255) COLLATE "pg_catalog"."default",
  "loading_report_bl_id" uuid
)
;
COMMENT ON COLUMN "dxb"."shipping_instruction"."status_shipment" IS '1. Booking receipt, 2. cargo transit dll';
COMMENT ON COLUMN "dxb"."shipping_instruction"."status" IS '1. active 2. inactive 3. deleted';
COMMENT ON COLUMN "dxb"."shipping_instruction"."notes" IS 'notes for origin';
COMMENT ON COLUMN "dxb"."shipping_instruction"."notes_hub" IS 'notes for dxb';
COMMENT ON COLUMN "dxb"."shipping_instruction"."notes_destination" IS 'notes for agent';


-- ----------------------------
-- Table structure for shipping_instruction_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."shipping_instruction_detail";
CREATE TABLE "dxb"."shipping_instruction_detail" (
  "job_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "billing_party" varchar(60) COLLATE "pg_catalog"."default",
  "place_of_loading" varchar(200) COLLATE "pg_catalog"."default",
  "place_of_delivery" varchar(200) COLLATE "pg_catalog"."default",
  "cargo_received_date" date,
  "cargo_delivery_date" date,
  "additional_note" varchar(200) COLLATE "pg_catalog"."default",
  "sales_offlines" varchar(60) COLLATE "pg_catalog"."default",
  "sales_person" varchar(60) COLLATE "pg_catalog"."default",
  "eta_destination" date
)
;


-- ----------------------------
-- Table structure for si_order
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."si_order";
CREATE TABLE "dxb"."si_order" (
  "order_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "qty" float8,
  "pkgs" varchar(255) COLLATE "pg_catalog"."default",
  "net_weight" float8,
  "gross_weight" float8,
  "measurement" float8,
  "description_of_goods" varchar(255) COLLATE "pg_catalog"."default",
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
  "chw" float8,
  "vol_weight" float8,
  "attachment_goods" varchar(255) COLLATE "pg_catalog"."default",
  "additional_description" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."si_order"."status" IS '1. active

2. inactive

3. deleted';
COMMENT ON COLUMN "dxb"."si_order"."si_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."com_invoices_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."bil_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."coo_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."final_alert_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."container_loading_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."msds_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."packing_list_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."cft_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."test_report_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."other_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."mawb_doc" IS 'dokumen dxb';
COMMENT ON COLUMN "dxb"."si_order"."cargo_manifest" IS 'dokumen dxb';
COMMENT ON COLUMN "dxb"."si_order"."loading_image" IS 'dokumen dxb';
COMMENT ON COLUMN "dxb"."si_order"."prof_delivered" IS 'dokumen agent';
COMMENT ON COLUMN "dxb"."si_order"."image_delivered" IS 'dokument_agent';
COMMENT ON COLUMN "dxb"."si_order"."ctd_doc" IS 'dokumen origin';
COMMENT ON COLUMN "dxb"."si_order"."file_bebas" IS 'dokument_agent';

-- ----------------------------
-- Table structure for si_order_detail
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."si_order_detail";
CREATE TABLE "dxb"."si_order_detail" (
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
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "dxb"."si_order_detail"."description" IS 'description untuk masing masing order';


-- ----------------------------
-- Table structure for si_sales_office
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."si_sales_office";
CREATE TABLE "dxb"."si_sales_office" (
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
DROP TABLE IF EXISTS "dxb"."si_sales_person";
CREATE TABLE "dxb"."si_sales_person" (
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
-- Records of si_sales_person
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."status";
CREATE TABLE "dxb"."status" (
  "status_id" int4 NOT NULL DEFAULT nextval('"dxb".status_id_seq'::regclass),
  "status_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "date_created" timestamp(0) DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0) DEFAULT now(),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "role_id" varchar(32) COLLATE "pg_catalog"."default",
  "shipment_type" varchar(12) COLLATE "pg_catalog"."default",
  "no_urut" int4
)
;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO "dxb"."status" VALUES (1, 'Booking Received', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 1);
INSERT INTO "dxb"."status" VALUES (2, 'Booking Confirmed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 2);
INSERT INTO "dxb"."status" VALUES (3, 'Cargo Received CFS', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 3);
INSERT INTO "dxb"."status" VALUES (4, 'Under Customs Clearance', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 4);
INSERT INTO "dxb"."status" VALUES (5, 'Loading Completed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 5);
INSERT INTO "dxb"."status" VALUES (6, 'Container Onboard', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 6);
INSERT INTO "dxb"."status" VALUES (7, 'Vessel Delay', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 7);
INSERT INTO "dxb"."status" VALUES (8, 'Cancel', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 8);
INSERT INTO "dxb"."status" VALUES (9, 'Vessel Departed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 9);
INSERT INTO "dxb"."status" VALUES (10, 'Arrived in transit Port', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 10);
INSERT INTO "dxb"."status" VALUES (11, 'In Transit to other port', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 11);
INSERT INTO "dxb"."status" VALUES (12, 'Arrived in Destination port', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 12);
INSERT INTO "dxb"."status" VALUES (13, 'Delivered to Consignee', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 13);
INSERT INTO "dxb"."status" VALUES (14, 'Closed Shipment', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAIMPORT', 14);
INSERT INTO "dxb"."status" VALUES (15, 'Booking Received', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 15);
INSERT INTO "dxb"."status" VALUES (16, 'Booking Confirmed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 16);
INSERT INTO "dxb"."status" VALUES (17, 'Cargo Received CFS', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 17);
INSERT INTO "dxb"."status" VALUES (18, 'Under Customs Clearance', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 18);
INSERT INTO "dxb"."status" VALUES (19, 'Loading Completed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 19);
INSERT INTO "dxb"."status" VALUES (20, 'Container Onboard', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 20);
INSERT INTO "dxb"."status" VALUES (21, 'Vessel Delay', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 21);
INSERT INTO "dxb"."status" VALUES (22, 'Cancel', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 22);
INSERT INTO "dxb"."status" VALUES (23, 'Vessel Departed', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 23);
INSERT INTO "dxb"."status" VALUES (24, 'Arrived in transit Port', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 24);
INSERT INTO "dxb"."status" VALUES (25, 'In Transit to other port', '2024-10-18 13:56:36', NULL, '2024-10-18 13:56:36', NULL, NULL, 'SEAEXPORT', 25);
INSERT INTO "dxb"."status" VALUES (26, 'Arrived in Destination port', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'SEAEXPORT', 26);
INSERT INTO "dxb"."status" VALUES (27, 'Delivered to Consignee', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'SEAEXPORT', 27);
INSERT INTO "dxb"."status" VALUES (28, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'SEAEXPORT', 28);
INSERT INTO "dxb"."status" VALUES (29, 'Booking Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 29);
INSERT INTO "dxb"."status" VALUES (30, 'Booking Confirmed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 30);
INSERT INTO "dxb"."status" VALUES (32, 'Manifested', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 32);
INSERT INTO "dxb"."status" VALUES (31, 'Received in Airport Warehouse', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 31);
INSERT INTO "dxb"."status" VALUES (33, 'Cancel', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 33);
INSERT INTO "dxb"."status" VALUES (34, 'Cargo partially Airlifted', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 34);
INSERT INTO "dxb"."status" VALUES (35, 'Delay', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 35);
INSERT INTO "dxb"."status" VALUES (36, 'Cargo Airlifted', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 36);
INSERT INTO "dxb"."status" VALUES (37, 'In Transit another Airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 37);
INSERT INTO "dxb"."status" VALUES (38, 'Arrived in destination Airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 38);
INSERT INTO "dxb"."status" VALUES (39, 'Under Customs Clearance', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 39);
INSERT INTO "dxb"."status" VALUES (40, 'Truck departed from airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 40);
INSERT INTO "dxb"."status" VALUES (41, 'Delivered to Consignee', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 41);
INSERT INTO "dxb"."status" VALUES (42, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIRIMPORT', 42);
INSERT INTO "dxb"."status" VALUES (43, 'Booking Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 43);
INSERT INTO "dxb"."status" VALUES (44, 'Booking Confirmed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 44);
INSERT INTO "dxb"."status" VALUES (45, 'Received in Airport Warehouse', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 45);
INSERT INTO "dxb"."status" VALUES (46, 'Manifested', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 46);
INSERT INTO "dxb"."status" VALUES (47, 'Cancel', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 47);
INSERT INTO "dxb"."status" VALUES (48, 'Cargo partially Airlifted', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 48);
INSERT INTO "dxb"."status" VALUES (49, 'Delay', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 49);
INSERT INTO "dxb"."status" VALUES (50, 'Cargo Airlifted', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 50);
INSERT INTO "dxb"."status" VALUES (51, 'In Transit another Airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 51);
INSERT INTO "dxb"."status" VALUES (52, 'Arrived in destination Airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 52);
INSERT INTO "dxb"."status" VALUES (53, 'Under Customs Clearance', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 53);
INSERT INTO "dxb"."status" VALUES (54, 'Truck departed from airport', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 54);
INSERT INTO "dxb"."status" VALUES (55, 'Delivered to Consignee', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 55);
INSERT INTO "dxb"."status" VALUES (56, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'AIREXPORT', 56);
INSERT INTO "dxb"."status" VALUES (57, 'Booking Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 57);
INSERT INTO "dxb"."status" VALUES (58, 'Booking Confirmed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 58);
INSERT INTO "dxb"."status" VALUES (59, 'Cargo Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 59);
INSERT INTO "dxb"."status" VALUES (60, 'Under Storage at Warehouse', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 60);
INSERT INTO "dxb"."status" VALUES (61, 'Cargo Delivered', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 61);
INSERT INTO "dxb"."status" VALUES (62, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'WAREHOUSE', 62);
INSERT INTO "dxb"."status" VALUES (63, 'Booking Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 63);
INSERT INTO "dxb"."status" VALUES (64, 'Booking Confirmed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 64);
INSERT INTO "dxb"."status" VALUES (65, 'Cargo Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 65);
INSERT INTO "dxb"."status" VALUES (66, 'Loading Completed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 66);
INSERT INTO "dxb"."status" VALUES (67, 'In Transit', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 67);
INSERT INTO "dxb"."status" VALUES (68, 'Offloading Completed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 68);
INSERT INTO "dxb"."status" VALUES (69, 'Cargo Delivered', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 69);
INSERT INTO "dxb"."status" VALUES (70, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'TRUCKING', 70);
INSERT INTO "dxb"."status" VALUES (71, 'Booking Received', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 71);
INSERT INTO "dxb"."status" VALUES (72, 'Booking Confirmed', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 72);
INSERT INTO "dxb"."status" VALUES (73, 'Picked Up by Courier', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 73);
INSERT INTO "dxb"."status" VALUES (74, 'In Transit', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 74);
INSERT INTO "dxb"."status" VALUES (75, 'Under Customs Clearance', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 75);
INSERT INTO "dxb"."status" VALUES (76, 'Delivered by courier', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 76);
INSERT INTO "dxb"."status" VALUES (77, 'Closed Shipment', '2024-10-18 13:56:37', NULL, '2024-10-18 13:56:37', NULL, NULL, 'COURIER', 77);

-- ----------------------------
-- Function structure for auto_ctd
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."auto_ctd"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "dxb"."auto_ctd"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
		 SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "dxb".shipping_instruction  WHERE  LEFT(ctd_number,9) = p_prefix;
		 
		 	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
		
-- 		IF LENGTH(p_prefix)=6 THEN
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,11) = concat(p_prefix,'-',tahun ,bulan);
--     ELSE
--        SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "origin".shipping_instruction WHERE LEFT(ctd_number,8) = concat(p_prefix,'-',tahun ,bulan);
--     END IF;
	 
		
--      SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "dxb".shipping_instruction WHERE  ctd_number = CONCAT('%',LEFT(p_prefix,5),'%');
    	-- WHERE LEFT(ctd_number,13) = p_prefix;
--      	where SPLIT_PART(ctd_number,'-', 1) = SPLIT_PART(p_prefix,'-', 1) and left(SPLIT_PART(ctd_number,'-', 2),4) = SPLIT_PART(p_prefix,'-', 2);     
		 
	
    
	--	RETURN concat(p_prefix,hasil + 1);


END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."auto_ctd"("p_prefix" varchar, "p_moth" varchar);
CREATE OR REPLACE FUNCTION "dxb"."auto_ctd"("p_prefix" varchar, "p_moth" varchar)
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
	 
		
     SELECT CAST(MAX(RIGHT(ctd_number,3)) AS INT2)  INTO hasil from "dxb".shipping_instruction WHERE LEFT(ctd_number,13) = p_prefix;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(p_prefix,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for auto_ctd_backup
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."auto_ctd_backup"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "dxb"."auto_ctd_backup"("p_prefix" varchar)
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
DROP FUNCTION IF EXISTS "dxb"."auto_ctd_copy1"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "dxb"."auto_ctd_copy1"("p_prefix" varchar)
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
-- Function structure for claim_number
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."claim_number"();
CREATE OR REPLACE FUNCTION "dxb"."claim_number"()
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
	SELECT CAST(MAX(RIGHT(TRIM(claim_number),3)) AS INT4) INTO hasil from "dxb".claim;    
	 --	RETURN concat(p_prefix,hasil + 1);
	RETURN concat('CLAIM#','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for code_local_billing_customer
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."code_local_billing_customer"();
CREATE OR REPLACE FUNCTION "dxb"."code_local_billing_customer"()
  RETURNS "pg_catalog"."text" AS $BODY$

DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   		 
	SELECT CAST(MAX(RIGHT(TRIM(customer_code),1)) AS INT4) INTO hasil  from "dxb".customer  where LEFT(customer_code,6) = CONCAT('LOC',tahun,bulan) ;
	RETURN concat('LOC',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));

END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for generate_quotation
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."generate_quotation"();
CREATE OR REPLACE FUNCTION "dxb"."generate_quotation"()
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
		 
		   SELECT CAST(MAX(RIGHT(quotation_number,4)) AS INT2)  INTO hasil from "dxb".quotation;
		
	
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat(tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));

END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for job_order_local
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."job_order_local"();
CREATE OR REPLACE FUNCTION "dxb"."job_order_local"()
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
	SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where SPLIT_PART(job_order_code,'-', 6) = SPLIT_PART('JOB','-', 6);  -- and left(SPLIT_PART(loading_plan_number,'-', 6),4) = SPLIT_PART('LP','-', 2); 
    
	--	RETURN concat(p_prefix,hasil + 1);
	RETURN concat('JOB','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for job_order_local_param
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."job_order_local_param"("tipe" int4);
CREATE OR REPLACE FUNCTION "dxb"."job_order_local_param"("tipe" int4)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
		if tipe = 1 then
		
			SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) = CONCAT('SI',tahun,bulan); 
			RETURN concat('SI',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

		elsif  tipe = 2 then
		
			SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) =  CONCAT('SE',tahun,bulan); 
			RETURN concat('SE',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
			
		elsif  tipe = 3 then
		
				SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) = CONCAT('AI',tahun,bulan); 
				RETURN concat('AI',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
			
		elsif  tipe = 4 then
		
				SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) =  CONCAT('AE',tahun,bulan); 
				RETURN concat('AE',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
			
		elsif  tipe = 5 then
		
				SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) =  CONCAT('WH',tahun,bulan); 
				RETURN concat('WH',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
			
		else 
		
				SELECT CAST(MAX(RIGHT(TRIM(job_order_code),3)) AS INT4) INTO hasil  from "dxb".job_order  where LEFT(job_order_code, 6) =  CONCAT('TC',tahun,bulan); 
				RETURN concat('TC',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
			
		END if;
		



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for job_order_number
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."job_order_number"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "dxb"."job_order_number"("p_prefix" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
	  SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
		
	SELECT CAST(MAX(RIGHT(TRIM(job_order_code),1)) AS INT4) INTO hasil  from "origin".job_order_air  where LEFT(job_order_code,6) = CONCAT('CA',tahun,bulan) ;
	RETURN concat(p_prefix,tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
	
	
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_pnumber
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."loading_pnumber"();
CREATE OR REPLACE FUNCTION "dxb"."loading_pnumber"()
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
-- 		SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "dxb".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));
--     
-- 	--	RETURN concat(p_prefix,hasil + 1);
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "dxb".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_pnumber_local_af
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."loading_pnumber_local_af"();
CREATE OR REPLACE FUNCTION "dxb"."loading_pnumber_local_af"()
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
-- 		SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "dxb".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));
--     
-- 	--	RETURN concat(p_prefix,hasil + 1);
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "dxb".loading_plan_local where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
	RETURN concat('AF','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for loading_pnumber_local_sf
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."loading_pnumber_local_sf"();
CREATE OR REPLACE FUNCTION "dxb"."loading_pnumber_local_sf"()
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
-- 		SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "dxb".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));
--     
-- 	--	RETURN concat(p_prefix,hasil + 1);
-- 	RETURN concat('LP','-',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));

	SELECT CAST(MAX(RIGHT(TRIM(loading_report_number),3)) AS INT4 ) INTO hasil from "dxb".loading_report where SPLIT_PART(loading_report_number,'-', 6) = SPLIT_PART('LP','-', 6); 
	RETURN concat('SF','-',tahun,bulan,lpad((coalesce(CAST(hasil as INT4),0) + 1)::varchar,3,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for no_operation
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."no_operation"();
CREATE OR REPLACE FUNCTION "dxb"."no_operation"()
  RETURNS "pg_catalog"."text" AS $BODY$
DECLARE hasil INT; 
DECLARE tahun varchar(2);
DECLARE bulan varchar(2);
	
	BEGIN
    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
		
   		 
	SELECT CAST(MAX(RIGHT(TRIM(no_operation_chart),4)) AS INT4) INTO hasil  from "dxb".operation_chart  where LEFT(no_operation_chart,6) = CONCAT('OC',tahun,bulan) ;
	RETURN concat('OC',tahun,bulan,lpad((coalesce(hasil,0) + 1)::varchar,4,'0'));



END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for tes
-- ----------------------------
DROP FUNCTION IF EXISTS "dxb"."tes"("p_prefix" varchar);
CREATE OR REPLACE FUNCTION "dxb"."tes"("p_prefix" varchar)
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
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"dxb"."courir_shipment_mode_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "dxb"."status_id_seq"
OWNED BY "dxb"."status"."status_id";
SELECT setval('"dxb"."status_id_seq"', 62, true);

-- ----------------------------
-- Primary Key structure for table agreed_rate
-- ----------------------------
ALTER TABLE "dxb"."agreed_rate" ADD CONSTRAINT "agreed_rate_pkey" PRIMARY KEY ("rate_id");

-- ----------------------------
-- Primary Key structure for table chat_note
-- ----------------------------
ALTER TABLE "dxb"."chat_note" ADD CONSTRAINT "chat_note_pkey" PRIMARY KEY ("chat_id", "job_id");

-- ----------------------------
-- Primary Key structure for table claim
-- ----------------------------
ALTER TABLE "dxb"."claim" ADD CONSTRAINT "claim_pkey" PRIMARY KEY ("claim_id");

-- ----------------------------
-- Primary Key structure for table claim_detail
-- ----------------------------
ALTER TABLE "dxb"."claim_detail" ADD CONSTRAINT "claim_detail_pkey" PRIMARY KEY ("claim_detail_id");

-- ----------------------------
-- Primary Key structure for table claims_document
-- ----------------------------
ALTER TABLE "dxb"."claims_document" ADD CONSTRAINT "claims_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table control_office
-- ----------------------------
ALTER TABLE "dxb"."control_office" ADD CONSTRAINT "control_office_pkey" PRIMARY KEY ("control_id");

-- ----------------------------
-- Primary Key structure for table courir_shipment_mode
-- ----------------------------
ALTER TABLE "dxb"."courir_shipment_mode" ADD CONSTRAINT "courir_shipment_mode_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "dxb"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

-- ----------------------------
-- Primary Key structure for table customer_group
-- ----------------------------
ALTER TABLE "dxb"."customer_group" ADD CONSTRAINT "customer_group_pkey" PRIMARY KEY ("customer_group_id");

-- ----------------------------
-- Primary Key structure for table dimension
-- ----------------------------
ALTER TABLE "dxb"."dimension" ADD CONSTRAINT "dimension_pkey" PRIMARY KEY ("dimension_id");

-- ----------------------------
-- Primary Key structure for table final_alert
-- ----------------------------
ALTER TABLE "dxb"."final_alert" ADD CONSTRAINT "final_alert_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table final_alert_crossair
-- ----------------------------
ALTER TABLE "dxb"."final_alert_crossair" ADD CONSTRAINT "final_alert_copy1_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table histori_job
-- ----------------------------
ALTER TABLE "dxb"."histori_job" ADD CONSTRAINT "histori_job_pkey" PRIMARY KEY ("histori_id");

-- ----------------------------
-- Primary Key structure for table job_order
-- ----------------------------
ALTER TABLE "dxb"."job_order" ADD CONSTRAINT "job_order_pkey" PRIMARY KEY ("job_order_id");

-- ----------------------------
-- Primary Key structure for table job_order_detail
-- ----------------------------
ALTER TABLE "dxb"."job_order_detail" ADD CONSTRAINT "job_order_detail_pkey" PRIMARY KEY ("job_order_detail_id");

-- ----------------------------
-- Primary Key structure for table job_order_document
-- ----------------------------
ALTER TABLE "dxb"."job_order_document" ADD CONSTRAINT "job_order_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table job_order_vendor
-- ----------------------------
ALTER TABLE "dxb"."job_order_vendor" ADD CONSTRAINT "job_order_vendor_pkey" PRIMARY KEY ("job_order_vendor_id");

-- ----------------------------
-- Primary Key structure for table loading_plan
-- ----------------------------
ALTER TABLE "dxb"."loading_plan" ADD CONSTRAINT "loading_plan_pkey" PRIMARY KEY ("plan_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_detail
-- ----------------------------
ALTER TABLE "dxb"."loading_plan_detail" ADD CONSTRAINT "loading_plan_detail_pkey" PRIMARY KEY ("loading_detail_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_detail_local
-- ----------------------------
ALTER TABLE "dxb"."loading_plan_detail_local" ADD CONSTRAINT "loading_plan_detail_local_pkey" PRIMARY KEY ("loading_detail_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_document
-- ----------------------------
ALTER TABLE "dxb"."loading_plan_document" ADD CONSTRAINT "loading_plan_document_pkey" PRIMARY KEY ("loading_plan_document_id");

-- ----------------------------
-- Primary Key structure for table loading_plan_local
-- ----------------------------
ALTER TABLE "dxb"."loading_plan_local" ADD CONSTRAINT "loading_plan_local_pkey" PRIMARY KEY ("plan_id");

-- ----------------------------
-- Primary Key structure for table loading_report
-- ----------------------------
ALTER TABLE "dxb"."loading_report" ADD CONSTRAINT "loading_report_pkey" PRIMARY KEY ("loading_id");

-- ----------------------------
-- Primary Key structure for table loading_report_bl
-- ----------------------------
ALTER TABLE "dxb"."loading_report_bl" ADD CONSTRAINT "loading_report_bl_pkey" PRIMARY KEY ("loading_report_bl_id");

-- ----------------------------
-- Primary Key structure for table loading_report_detail
-- ----------------------------
ALTER TABLE "dxb"."loading_report_detail" ADD CONSTRAINT "loading_report_detail_pkey" PRIMARY KEY ("detail_bl_id");

-- ----------------------------
-- Primary Key structure for table local_transport
-- ----------------------------
ALTER TABLE "dxb"."local_transport" ADD CONSTRAINT "local_transport_pkey" PRIMARY KEY ("local_id");

-- ----------------------------
-- Primary Key structure for table mawb_stock_generation
-- ----------------------------
ALTER TABLE "dxb"."mawb_stock_generation" ADD CONSTRAINT "Untitled_pkey" PRIMARY KEY ("mawb_id");

-- ----------------------------
-- Primary Key structure for table noted_section
-- ----------------------------
ALTER TABLE "dxb"."noted_section" ADD CONSTRAINT "noted_section_pkey" PRIMARY KEY ("noted_id");

-- ----------------------------
-- Primary Key structure for table operation_document
-- ----------------------------
ALTER TABLE "dxb"."operation_document" ADD CONSTRAINT "operation_document_pkey" PRIMARY KEY ("document_id");

-- ----------------------------
-- Primary Key structure for table order_document
-- ----------------------------
ALTER TABLE "dxb"."order_document" ADD CONSTRAINT "order_document_pkey" PRIMARY KEY ("order_document_id");

-- ----------------------------
-- Primary Key structure for table quotation
-- ----------------------------
ALTER TABLE "dxb"."quotation" ADD CONSTRAINT "quotation_pkey" PRIMARY KEY ("quotation_id");

-- ----------------------------
-- Primary Key structure for table quotation_detail
-- ----------------------------
ALTER TABLE "dxb"."quotation_detail" ADD CONSTRAINT "quotation_detail_pkey" PRIMARY KEY ("quotation_detail_id");

-- ----------------------------
-- Primary Key structure for table schedule_vessel
-- ----------------------------
ALTER TABLE "dxb"."schedule_vessel" ADD CONSTRAINT "schedule_vessel_pkey" PRIMARY KEY ("schedule_id");

-- ----------------------------
-- Primary Key structure for table shipping_instruction
-- ----------------------------
ALTER TABLE "dxb"."shipping_instruction" ADD CONSTRAINT "shipping_instruction_pkey" PRIMARY KEY ("job_id");

-- ----------------------------
-- Primary Key structure for table shipping_instruction_detail
-- ----------------------------
ALTER TABLE "dxb"."shipping_instruction_detail" ADD CONSTRAINT "shipping_instruction_detail_pkey" PRIMARY KEY ("job_id");

-- ----------------------------
-- Primary Key structure for table si_order
-- ----------------------------
ALTER TABLE "dxb"."si_order" ADD CONSTRAINT "si_order_pkey" PRIMARY KEY ("order_id");

-- ----------------------------
-- Primary Key structure for table si_order_detail
-- ----------------------------
ALTER TABLE "dxb"."si_order_detail" ADD CONSTRAINT "si_order_detail_pkey" PRIMARY KEY ("si_order_detail");

-- ----------------------------
-- Primary Key structure for table si_sales_office
-- ----------------------------
ALTER TABLE "dxb"."si_sales_office" ADD CONSTRAINT "si_sales_office_pkey" PRIMARY KEY ("si_sales_office_id");

-- ----------------------------
-- Primary Key structure for table si_sales_person
-- ----------------------------
ALTER TABLE "dxb"."si_sales_person" ADD CONSTRAINT "si_sales_person_pkey" PRIMARY KEY ("si_sales_person_id");

-- ----------------------------
-- Primary Key structure for table status
-- ----------------------------
ALTER TABLE "dxb"."status" ADD CONSTRAINT "status_pkey" PRIMARY KEY ("status_id");
