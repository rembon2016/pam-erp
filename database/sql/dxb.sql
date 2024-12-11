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
-- Records of agreed_rate
-- ----------------------------
INSERT INTO "dxb"."agreed_rate" VALUES ('2bca96ce-f015-4a3f-8d00-882918db233f', 'FRC', 'Freight Rate Collect', '9ee103fb-66b7-4409-888c-a4ae40d6d69a', NULL, NULL, 'dubai@pamcargo.com', NULL, 'e4489011-13f6-4d21-bb04-cf38ea2df4d6', 3.73, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('924cdc7d-ab1f-4e3e-91a3-3bcfe6220745', 'EXW', 'EXW', '9f10b274-877e-46bc-b419-9db0af6fb0e3', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 6736.60, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('928f4eaa-7f9d-405b-85b9-a7cf2133a1e5', 'DDC', 'Door Delivery Charges', '9a4d2d76-8fe1-4985-8a55-8a463039fca7', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 120.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d742ad4c-87f7-46e5-9a31-4a8f5999ca55', 'DDC', 'Door Delivery Charges', '67a495c2-b30c-4e3c-baba-2602cbb3c42f', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 520.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('e781e2f3-8311-402a-ad26-83c5ccbad202', 'DDC', 'Door Delivery Charges', 'e72465c6-7d1f-4e63-9504-770020f8693b', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 560.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('c0849079-2d6f-4464-a00c-9843f4feb494', 'EXW', 'EXW', 'dbb60074-7fc8-4a9f-81ae-d07ee88ea2b0', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 1.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('f3e5f0ef-59e1-47c5-8748-f17ed5dfedfe', 'DDC', 'Door Delivery Charges', '54d6c107-7c02-4ae6-a916-322dcb2a8222', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 1005.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('c14cf19a-9a4e-4630-bdc0-b8c455a570c4', 'FRP', 'Freight Rate Prepaid', 'ca1e6202-587a-4326-94cf-d3e161a273fa', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('1de3b975-5c73-40c1-be3a-41ba8d9f43c3', 'FRP', 'Freight Rate Prepaid', '912bd056-3711-487a-a1d5-a884046fc254', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('1c87e00d-6a10-4942-8ba1-6becf2559c64', 'FRP', 'Freight Rate Prepaid', '41ccf845-9e64-4efb-859d-15395753657d', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('51170f91-50b3-404c-aa07-f27ff7dbd2a4', 'HF', 'Handling Fee', '39393fac-4390-4a21-ae1c-49d9eeb12671', NULL, NULL, 'dubai@pamcargo.com', NULL, 'a121a634-3278-4118-92fe-8d737d079e8b', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('62089f22-e241-45f0-be94-4a5609907a3a', 'EXW', 'EXW', '6ea5972e-7192-491b-b67b-1716a88eecb6', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 1.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5f5522f9-469f-43b4-a9e0-42c3dd0f44e0', 'FRP', 'Freight Rate Prepaid', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d561d18e-11a5-476a-9ef3-d78d243e6345', 'FRP', 'Freight Rate Prepaid', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5d961c3f-2f1e-46fc-9fd6-70b9853f4710', 'HF', 'Handling Fee', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', NULL, NULL, 'dubai@pamcargo.com', NULL, 'a121a634-3278-4118-92fe-8d737d079e8b', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5a02f4a1-cf65-44f7-b5b2-4f7c2587a3de', 'FRP', 'Freight Rate Prepaid', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d088a43d-4074-4e35-bebb-c4f8ab51ba29', 'FRP', 'Freight Rate Prepaid', '3217d8fb-8c52-445d-a870-ac91a6d33135', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('85fa2556-ac3f-4727-83b2-9d755afd793b', 'FRP', 'Freight Rate Prepaid', 'b34f807d-0526-442f-8b25-a1134de5ab21', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('eb25ebed-cf0b-48d5-a8a1-2c0178d3e964', 'FRP', 'Freight Rate Prepaid', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('3dbbefc4-eb3f-4368-aec8-1878004c059f', 'FRP', 'Freight Rate Prepaid', '6637d456-b568-452c-bf72-61f3afb3ddc1', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('639268e6-30ac-4bae-a535-d92645d3fdfc', 'EXW', 'EXW', '6e4821cf-169b-4dcc-9115-86d1a60073ed', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 1.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('bcb148df-5446-4fbe-9050-4813474c360d', 'FCA', 'FCA', '6e4821cf-169b-4dcc-9115-86d1a60073ed', NULL, NULL, NULL, NULL, 'f388c6e0-ff00-46f6-878c-84eb2e5c6146', 100.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('edfba296-ec6f-4c85-9d5c-b95aaf7e2e80', 'EXW', 'EXW', '38d691ab-a093-4134-be2e-4f84ef05dde5', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 42.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('eed83bb6-ad95-4d12-95f5-5a3a6310dbd4', 'DDC', 'Door Delivery Charges', '73321db0-997a-418a-8a4d-ee71f04bc8c8', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 10.00, NULL, NULL, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('82c0ae69-53c1-4a54-b3ca-beb4df09b536', 'FRP', 'Freight Rate Prepaid', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, 'EUR', 'TOTAL', NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('bd348f84-a038-4fb6-b9a8-83b96c9dab53', 'OLC', 'OLC', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL, NULL, NULL, NULL, '42bb4997-b58b-4800-830a-31a66595c732', 12.00, 'USD', 'KG', NULL);

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
-- Records of chat_note
-- ----------------------------
INSERT INTO "dxb"."chat_note" VALUES ('4cd1bc43-e5cd-48a0-89af-a9728a5e2a2b', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Halo Bujang', '2024-10-22 10:35:44.130763', 'dubai@pamcargo.com', NULL, NULL, 1);
INSERT INTO "dxb"."chat_note" VALUES ('3374d195-dc46-4e56-9d40-f418949166cb', '0211ca52-7c9a-4003-9623-0be52855cb6a', '#bujanglapuk', '2024-10-22 10:36:25.92812', 'dubai@pamcargo.com', NULL, NULL, 1);

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
-- Records of claim
-- ----------------------------
INSERT INTO "dxb"."claim" VALUES ('25e50ddf-cfaa-4b99-8c8f-114cd522d699', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'JKTSA2405001', '2024-06-26 00:00:00', 'CLAIM#-2406002', 't', 1, 2, NULL, 'thomas@pamcargo.com', NULL, 'thomas@pamcargo.com', 1);
INSERT INTO "dxb"."claim" VALUES ('4c431b47-bcc1-4089-afc1-2af3d3df2256', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'JKTSA2405001', '2024-06-11 00:00:00', 'CLAIM#-2406001', 't', 10, 7, NULL, 'thomas@pamcargo.com', NULL, 'thomas@pamcargo.com', 1);
INSERT INTO "dxb"."claim" VALUES ('b575e7c2-183b-489e-a2d6-279a50cc2d96', 'f69d7b4a-3a21-477e-b575-367dd515978e', 'DACCA2410001', '2024-10-29 00:00:00', 'CLAIM#-2410003', 't', 20, 20, NULL, 'thomas@pamcargo.com', NULL, NULL, 1);
INSERT INTO "dxb"."claim" VALUES ('56c33bc2-aaa6-484c-9d79-c5cc198a6fa1', '3e7352d5-854d-4367-a7dd-a14a895b0aa7', 'DXBSE2410001', '2024-10-30 00:00:00', 'CLAIM#-2410004', 't', 123, 123, NULL, 'thomas@pamcargo.com', NULL, NULL, 1);

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
-- Records of claim_detail
-- ----------------------------
INSERT INTO "dxb"."claim_detail" VALUES ('22b4da84-0cc9-4bd6-bc65-a57ae4b112ea', '25e50ddf-cfaa-4b99-8c8f-114cd522d699', 1, 'test');
INSERT INTO "dxb"."claim_detail" VALUES ('fc86602e-92fa-4278-93b7-5d809298d763', '4c431b47-bcc1-4089-afc1-2af3d3df2256', 2, '');
INSERT INTO "dxb"."claim_detail" VALUES ('4c983c3b-21dc-460e-a36f-87d905a5f9c7', '25e50ddf-cfaa-4b99-8c8f-114cd522d699', 2, '');
INSERT INTO "dxb"."claim_detail" VALUES ('9b45d0a7-553c-4303-9a70-cf0fe7c170d6', 'b575e7c2-183b-489e-a2d6-279a50cc2d96', 1, 'test');
INSERT INTO "dxb"."claim_detail" VALUES ('4aec5b74-c2c9-4c50-9966-7947be2c3e60', '56c33bc2-aaa6-484c-9d79-c5cc198a6fa1', 1, 'Desc test');

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
-- Records of claims_document
-- ----------------------------
INSERT INTO "dxb"."claims_document" VALUES ('5bfc8d67-5f29-4dab-b127-f3ccfea69c2b', '4c431b47-bcc1-4089-afc1-2af3d3df2256', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'commercial_invoice_file', '11062024/commercial_invoice_file-110620241718094692.pdf');
INSERT INTO "dxb"."claims_document" VALUES ('4c5be4e7-9b59-4b41-a672-d95ffa80408c', '4c431b47-bcc1-4089-afc1-2af3d3df2256', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'damage_report_file', '11062024/damage_report_file-110620241718094757.pdf');
INSERT INTO "dxb"."claims_document" VALUES ('dc7e3422-a1ac-4ce7-a8a0-3b16121f3150', '4c431b47-bcc1-4089-afc1-2af3d3df2256', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'damage_report_file', '11062024/damage_report_file-110620241718094919.pdf');
INSERT INTO "dxb"."claims_document" VALUES ('8eb3b4e3-c151-4ecc-a025-26eb67e41957', '25e50ddf-cfaa-4b99-8c8f-114cd522d699', '455eaf63-cbdc-4c51-861c-3ee3d9359d4b', 'damage_report_file', '26062024/damage_report_file-260620241719393456.pdf');
INSERT INTO "dxb"."claims_document" VALUES ('bc29ef12-3f3c-42ea-a160-2465c0b543a1', 'b575e7c2-183b-489e-a2d6-279a50cc2d96', 'f69d7b4a-3a21-477e-b575-367dd515978e', 'damage_report_file', '29102024/damage_report_file-291020241730189630.pdf');

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
-- Records of control_office
-- ----------------------------
INSERT INTO "dxb"."control_office" VALUES ('79183c40-9e73-4182-8447-d19c74d09850', '41e8e812-7143-455f-9fdf-0db22139a3b9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('7fe4beec-b852-4ec5-a193-9fa791bc36a1', 'ab49df81-a7ed-4d0d-b519-7c3e976ca013', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('85fad6ee-d8f5-4411-aa65-7d3bf0c3030a', '352b8464-7bc5-47a5-afce-07d6e052e360', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('7fcee605-f1a3-49aa-a3ca-3d03dd53ef39', '9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('46408376-fd8c-4759-a356-ff5cd1800e66', '365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('268ab9ec-c2d3-4395-a42c-eed2cd088878', '2f4b6724-4980-484c-8faf-58f24439a47f', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('894a9c85-ce7c-4ac1-ac54-f72d2950b263', 'c17e7a19-95e1-4a91-898d-5d3c238003f9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('70c161c2-832e-4d0d-91b3-80f4a5085a01', '3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('ffe1611f-a61a-487d-afca-e73e1d3c9975', '410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('603c4b69-2046-4caa-87f8-9e1777435765', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5cb7d794-ccff-41f7-8d8e-562841755c3b', '69a5a94b-b7c5-405c-9d43-dd81280eae75', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('9737c505-548a-4f07-8851-04804f6bd0a2', '6c8e8768-46b2-4209-ba8e-b03bc2c60113', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3ba62292-45ba-47e4-945a-3560dba643a2', 'd3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('eb008be7-0eb5-4451-9070-d567a6eb7135', '8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0d007a07-af46-4ef5-be58-0f0d2f33552d', '6bcccf97-9c8d-4373-bde9-076a0caa0436', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0d7a6ba9-956b-4d4e-a193-89b8627ae904', '4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('202c1fe3-9548-4067-84f4-f4c8f0098136', '6ab1464a-5895-41eb-b67c-19dd743c27f4', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('72a068c9-25fd-4743-a4a7-7aa679a2633b', '56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('d6761873-7dce-4e83-ab1c-3a8e0f42fa28', '3117a224-6a04-458c-a624-f2a7f2037f56', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('4714e7b1-ea02-4ee6-b05a-b7ed1e38169e', '53d59b90-626c-4af8-a858-651186572d91', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e9030769-fce0-46dc-b9fc-577c231d876b', '6d9d4ea7-8547-4a76-93ba-f2fe31892701', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3d4a6f16-84a5-48f3-88b4-41fb207f064c', '0095a867-c7cd-480d-93f5-c12e61a8c7da', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('00255f22-9932-4e4f-bfd0-ac6811f0e122', '4de4babe-69d0-430a-8923-b8764a925ed0', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0ad56e5e-e531-486c-a10c-df7f5d594b43', 'a1d653c3-f716-4ce3-8469-6af1173ef79b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c9b5ff55-d9a0-41d0-8c83-8287572644fa', 'd54a473d-38f7-4df6-bc03-2ec06088d880', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('03ce72e7-3f8e-4dcf-8a51-dc1c5d07bcc4', '40c393f6-a567-46f9-9b33-46774d70c484', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('99d2b12d-a44a-4ee5-b17e-cceea78a4019', '2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('71aaba43-7e32-4353-a4a6-50b951910caa', '07af919c-2586-452e-b021-c6de8a3c83a1', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f236a011-fb9a-4d4c-924e-e4bb3322dc94', '39393fac-4390-4a21-ae1c-49d9eeb12671', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3810be51-ddd7-49e2-8f48-c15486f8c688', 'b01f25e8-fed4-4190-87c1-640d6a084b7c', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('93048d1d-9a07-470b-ae90-4470c1196817', 'a0df10f1-6174-4dd5-adda-afc69cbdddd1', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3b3adf26-b6b0-4b90-b6e7-41fe9eb95656', 'b053010e-4219-43a6-a56d-b292f39e25c5', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c848af06-40c4-44ed-a62d-87fa96ff794c', 'eda254dc-bb8a-4800-a014-8330dbf0975b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('223ad9a1-5f33-4faa-b73e-69da4a2699f3', 'b4bedcef-ea49-42e9-b3be-da59c36e166e', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('06b4e80c-97da-4688-93f1-e5773a35d9ec', '8923a3a6-109d-47e6-b7fa-f860c5eabe3d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('49f0cefb-00d5-439e-b89a-51df33314c7a', '4fefff4e-e463-4393-b5a6-6c7f1f7ef265', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('7e4cac1c-4692-4e3a-84f4-0aa7f60cc7ee', 'c8687520-d7c8-4058-997c-961c713c18aa', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c24a5ff5-a3d9-408b-b825-e1dcd035c613', '6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('cc6296d6-3f49-4f6d-8814-53ff10587b80', '1b811059-ca80-4603-855e-86f9890a1805', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3c24a60e-849a-4e68-bee5-7d3da6c33cca', '912bd056-3711-487a-a1d5-a884046fc254', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('28455bba-46fe-44e0-9792-40cf09e62f77', 'fe033103-040c-468f-91d8-cb934482c594', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('73c3696c-b634-4339-a7fd-53cbce9f051b', '10f6d5dc-d708-4351-a1e3-35c62cfdc76c', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('b9d84a9c-c4f4-4688-b6d2-e73a63d21227', '677a92fe-283a-4518-a2d5-705feac53126', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('ac927cb9-f03d-40ed-8fb4-4e3c3d771c5e', '815a6c7a-38da-4598-b246-ce426cf58737', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('17cb02b0-efc7-418e-a08e-4cc205c41e61', '08052673-0558-49ee-abb9-80f127ff8ac2', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c37c15e3-2a4b-432a-b322-7b2c49a40bfe', '2468ea51-4c64-4bf9-816b-daf2c07d1aa6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('b43299ea-b61d-49c4-a30d-e4016b5d1185', '6bd85111-f46b-465f-8cb4-d1cdedad6da7', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c8d120c2-5885-4cb3-a3ad-340ff55709ce', '52fd6c66-4dd5-430c-bfde-7491110dab24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e9e390fe-5083-4195-9d37-3b28a994a067', '2412c9de-563d-4fed-8ac8-73e780621984', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f8cd113f-fb53-4ae3-b5a8-475a8f9f6a16', '09b7d475-b92c-43ca-87c6-e7ec070848e9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e69d18b9-d4f2-473f-b876-c2126865e344', 'bb619a92-9823-42a0-8466-7a60d7d21446', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3307a25a-7961-4264-a665-efdc955146e4', '3c244936-60ba-4c50-a230-51ea58cd9427', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('aedbf61a-2727-4d45-969e-49e15187644a', 'abd29adf-78e7-48db-85c0-b346c8f3808e', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5ecd5bf8-b49e-45e2-96fc-5164dc59efdb', '48a6111b-9244-4ea0-8c07-2350db07254d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e6ae8534-a096-4d29-b061-35287d7d535b', 'a2e2282f-d196-4ba0-ad88-3e04b388b0de', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3dd82989-e41c-42db-81cb-067c32b82627', '3b848e3a-f9b1-4944-895e-f6a83f034bef', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f7b2c30f-a0e9-4041-9800-4fe21caf532c', 'abe1cc11-8667-4b0b-b9c6-a79272575402', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('d930e7f0-5a51-4d29-aac1-21e72eb72489', '2088a818-0433-45b7-9110-1dbae3b9a9b9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('89234b79-32e3-46c1-9ef0-f7f112d2e997', 'ca1e6202-587a-4326-94cf-d3e161a273fa', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('1b3f513d-a5eb-417b-95e0-11eeaeae60b2', '912bd056-3711-487a-a1d5-a884046fc254', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f499cc8d-1cd7-4e94-8e45-c7d0495da3d9', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('65185cf8-abbd-4ace-b1c5-61987a1845dd', '41ccf845-9e64-4efb-859d-15395753657d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('30d342ef-33bb-4e8d-af9c-51eed0d5d254', '3e9d64c1-1587-422c-b74f-49559eec819e', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('2c68f3b9-9ac8-4865-9bfa-c1a4e8e3cb92', '41ccf845-9e64-4efb-859d-15395753657d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f8c2cb92-7d35-413f-93e9-1dfc19a1a14d', '41ccf845-9e64-4efb-859d-15395753657d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5751b559-8911-4058-bc06-8428863e8d4a', 'b34f807d-0526-442f-8b25-a1134de5ab21', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c2cf06c5-1ad8-46db-bcbb-d60a20bb697e', '39393fac-4390-4a21-ae1c-49d9eeb12671', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('b9e67d4c-b120-41e0-8059-314710cb3e10', '6ea5972e-7192-491b-b67b-1716a88eecb6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5b1d342d-d4d4-4b81-b25d-63fb1c99ab95', '6ea5972e-7192-491b-b67b-1716a88eecb6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0abb8f6b-94b2-43eb-922f-e978dc2ff065', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('88112391-5a5d-4451-aa44-564b7d3b3ee2', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('801afb27-fec2-4d58-bff6-46d9edc42a79', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('78a263c4-5ce9-4838-9794-8811e26f70fe', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('bb045de4-7bd7-450f-8861-1492bcda7963', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('6c709c0c-fbe4-4f28-997e-bdf90cd23fbb', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('57b49465-372a-4d16-afb7-e38c0fca4d36', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('8c8b6357-757c-4d73-b6b6-05082722529d', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('2991aca6-df4f-4666-bf36-006646aee805', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('7586d3f9-7076-4c0c-be17-efc1e2eece34', '53d59b90-626c-4af8-a858-651186572d91', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('4d9d3454-0311-4543-9a7f-5a50b36695a9', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('dc72f983-0acc-4fcf-b43b-b4e599bae04f', 'e502484f-0d0b-45dc-b8c3-b221899db262', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('648c61af-4111-4a4b-a0a4-3059d5896147', 'b34f807d-0526-442f-8b25-a1134de5ab21', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5493f454-251e-4058-9561-84d70f39cbda', 'b34f807d-0526-442f-8b25-a1134de5ab21', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5a2d9f29-7cf5-4e92-bcfc-6f6212134b13', 'b34f807d-0526-442f-8b25-a1134de5ab21', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('54ca27a6-16ab-4553-828b-cc6881cf810f', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f5fb22f9-97fd-46f4-a99c-2961297bd127', '3217d8fb-8c52-445d-a870-ac91a6d33135', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('9495fbe8-f8c0-4b00-b406-8fe5ecfa310e', '3217d8fb-8c52-445d-a870-ac91a6d33135', '8149fafc-c5b5-4402-bc60-68796eb32c41', NULL);
INSERT INTO "dxb"."control_office" VALUES ('6a430a31-fdf5-44d2-919e-896da09cf0db', 'a221ef20-676e-4701-a33d-da6d9a533008', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('a82a7bf9-5298-4868-abe1-f48aed4b057c', 'a221ef20-676e-4701-a33d-da6d9a533008', '8149fafc-c5b5-4402-bc60-68796eb32c41', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e08d4199-4b09-436c-9b4a-433cdb52cca0', 'a221ef20-676e-4701-a33d-da6d9a533008', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e345ff54-d8be-4745-8873-64dc9e73450e', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('d1496aed-9982-47ae-bb06-7895b6a7a858', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('16c6769d-d923-44d0-aaac-823ef3bddda5', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('95c44288-c827-4682-b82b-fd32efe8f879', 'b91e189f-9077-41bb-8b38-d82209f3b293', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('afa312bd-577d-46be-8ca1-ba9d05b53831', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c8c43aa2-033b-4c90-b65b-597449d537fd', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f0a3d336-044a-4820-9c17-40f3b5fd5541', '6637d456-b568-452c-bf72-61f3afb3ddc1', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e70dcb65-60b3-4632-a95a-3b4ffa95dbe8', 'b5c3b066-2b07-4a63-a664-587413519156', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('bb1f5da0-60a7-41f3-8c6e-d82434e9bbc6', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('e4295d98-08ef-454c-8642-9e01042d3197', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0ebab70d-5c69-4b03-bd9d-9d31fd55c648', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('51de3b8c-9a3a-42a5-8def-3753adbbecf0', 'b5c3b066-2b07-4a63-a664-587413519156', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('2463d506-1ad8-4086-9640-01aa9cd88274', '6637d456-b568-452c-bf72-61f3afb3ddc1', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('021df587-17fa-4f67-87ce-915f26b8fefc', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('00bbf0bc-0c94-4ab6-b06a-2b5c170f7729', '3217d8fb-8c52-445d-a870-ac91a6d33135', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('8e69fe67-7645-4e5a-b09a-1a290e973d3e', 'a221ef20-676e-4701-a33d-da6d9a533008', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('8192a3e1-bd18-4903-ae19-a892a8b30308', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('5c6bd51a-300a-4c43-8884-dc86f4833a16', 'b5c3b066-2b07-4a63-a664-587413519156', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('1e911151-f51d-4697-a4a6-549dedd80c6a', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0bbcfe21-f507-435a-95d6-e0a376d50e03', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f4a79b04-59b7-4087-bf0d-1ea974b1ef5f', 'b91e189f-9077-41bb-8b38-d82209f3b293', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c5153747-423c-4300-b05a-f99cca2a06cd', 'b91e189f-9077-41bb-8b38-d82209f3b293', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('9f855472-0cda-4ad8-900f-93d99ff8912f', 'b91e189f-9077-41bb-8b38-d82209f3b293', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('b97b31e7-7d9c-4333-b35b-0f1d62bfcbb0', 'e53223f0-6d5b-472b-b35e-48745db328af', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('076b0dd9-a8e7-4707-8cb0-4d86523f5b52', '37f8990b-a6f8-41c5-8a8a-817504337781', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('86343cf9-df99-4d9c-97d9-49b4310b1e5e', '37f8990b-a6f8-41c5-8a8a-817504337781', '8149fafc-c5b5-4402-bc60-68796eb32c41', NULL);
INSERT INTO "dxb"."control_office" VALUES ('ee2e9f9c-a7ff-4ace-abcc-2b80edeaded3', '9b651741-7c30-4d88-a8b0-c4777e8333b2', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('65cd73ce-b6c1-4b85-8871-31dd9637c4a9', 'ffc45b79-473c-44c8-a6f3-bc0f0eebabac', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('85330b28-90b0-48d6-bae1-caa774966b22', '27f648c3-b90d-4ec7-a55a-de02514d499d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('c4518ba3-bfd5-4cd1-b7b7-69373e8be58e', '0e5ecb23-02f4-4bd9-950a-f1c756bd5c2a', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('7f6adc34-35a0-4f71-bfb1-6761abab7fa7', '8819bc36-7643-4ab4-b6cc-f8beb4ef73d4', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('8960e8f3-f26f-46c0-9ecc-bbd04b908242', '9f6fded9-af57-4e18-8833-6543a97ffb5e', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('3cbbf1ed-825e-44ed-8297-df6e62df33a7', '5d9b097f-b696-4395-bf72-d767fa78a60d', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('b622a608-6ef6-4bfa-b685-82a6b9c5a1a3', 'c041241a-01f6-4769-973f-87a44eb11476', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('f15b0d1e-e707-4dc4-84c7-a2abc8ab9d85', 'c041241a-01f6-4769-973f-87a44eb11476', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('0381bf54-efa4-4ccb-884c-f7c6f3cd2672', '790aeb0b-c079-4590-886b-c3f4b0cea21f', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('892f2074-ddc0-4e63-bd1d-7082937db703', 'eed85aa2-f0a6-4453-b1ff-5028526cafb4', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('21aeec5d-b668-4500-b2a4-4c55a7172f91', '16497a46-812c-45af-a448-7533617d535c', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('17d079e9-b540-49f9-80b5-6ff6d6db44a5', '2f34a1b1-b647-456b-88ec-d02962d04b16', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('dd30811c-f322-4f0e-af19-feaae3030569', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('17e03721-12b1-466c-897d-771a78c1b905', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);
INSERT INTO "dxb"."control_office" VALUES ('a1acd284-eef3-4498-994b-1cd2c199dba7', '0211ca52-7c9a-4003-9623-0be52855cb6a', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL);

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
-- Records of dimension
-- ----------------------------
INSERT INTO "dxb"."dimension" VALUES ('a779bd09-a6ec-4e65-848d-9eac0e8ea036', '41e8e812-7143-455f-9fdf-0db22139a3b9', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('e59b26a4-95d4-4f43-a7a6-8ef273c3ae2e', 'ab49df81-a7ed-4d0d-b519-7c3e976ca013', '10', NULL, 30, 20, 10, 0.06, 9.999);
INSERT INTO "dxb"."dimension" VALUES ('4823e29e-17da-4083-afe6-09d45d90f997', '352b8464-7bc5-47a5-afce-07d6e052e360', '30', NULL, 220, 200, 402, 530.64, 88436.462);
INSERT INTO "dxb"."dimension" VALUES ('56733607-2395-4145-a443-24589bc28ee7', '9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', '20', NULL, 40, 10, 30, 0.24, 39.998);
INSERT INTO "dxb"."dimension" VALUES ('a586d7b3-7433-4765-a5e3-d000a1e7fb5b', '365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', '10', NULL, 12, 14, 12, 0.02, 3.333);
INSERT INTO "dxb"."dimension" VALUES ('a832565d-7106-45af-82a4-1cace071dced', '2f4b6724-4980-484c-8faf-58f24439a47f', '30', NULL, 15, 12, 10, 0.054, 8.999);
INSERT INTO "dxb"."dimension" VALUES ('94c542ae-ccf5-4749-b980-3d1435b90261', 'c17e7a19-95e1-4a91-898d-5d3c238003f9', '100', NULL, 20, 10, 10, 0.2, 33.332);
INSERT INTO "dxb"."dimension" VALUES ('cf639fd8-2210-4b0f-808c-5bd72507637c', '3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', '10', NULL, 20, 10, 15, 0.03, 4.999);
INSERT INTO "dxb"."dimension" VALUES ('c988cccd-809b-4ba8-af9e-f43587490cd3', '6c8e8768-46b2-4209-ba8e-b03bc2c60113', '10', NULL, 13, 12, 10, 0.016, 2.666);
INSERT INTO "dxb"."dimension" VALUES ('606624d4-0ac0-48d6-ad4f-ddbdd7b354a7', '410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', '10', NULL, 20, 10, 10, 0.02, 3.333);
INSERT INTO "dxb"."dimension" VALUES ('9288ef37-8dd5-4fb6-93b4-a21c246e4482', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', '100', NULL, 20, 10, 10, 0.2, 33.332);
INSERT INTO "dxb"."dimension" VALUES ('ef04169b-fb64-4cb1-b672-db29eb96719e', '69a5a94b-b7c5-405c-9d43-dd81280eae75', '10', NULL, 20, 10, 10, 0.02, 3.333);
INSERT INTO "dxb"."dimension" VALUES ('ac8c7e09-3b2f-4364-8303-0d9832d1ebf4', 'd3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', '10', NULL, 20, 20, 10, 0.04, 6.666);
INSERT INTO "dxb"."dimension" VALUES ('7701c3f1-a170-4841-b4a9-317005ebe7ac', '8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', '20', NULL, 20, 10, 30, 0.12, 19.999);
INSERT INTO "dxb"."dimension" VALUES ('fc4dbaa7-7dda-4a21-b369-755defbee993', '6bcccf97-9c8d-4373-bde9-076a0caa0436', '20', NULL, 10, 340, 220, 14.96, 2493.233);
INSERT INTO "dxb"."dimension" VALUES ('af11ee5a-4ff3-4208-acbd-21c8800a6298', '4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', '20', NULL, 40, 10, 30, 0.24, 39.998);
INSERT INTO "dxb"."dimension" VALUES ('a1d7a343-9e9e-43b4-83ba-9937701ad336', '6ab1464a-5895-41eb-b67c-19dd743c27f4', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('631a854a-3f6e-4a20-af9a-d0f6ef3488d0', '56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('20a0bbd6-bdb4-4de1-acba-1b88a9185a46', '3117a224-6a04-458c-a624-f2a7f2037f56', '30', NULL, 20, 30, 20, 0.36, 59.997);
INSERT INTO "dxb"."dimension" VALUES ('37dbc9ec-d31b-4b62-8699-b6038450de7d', 'ca1e6202-587a-4326-94cf-d3e161a273fa', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('542903f1-9be9-46be-95d7-7ffa3ed80f00', '53d59b90-626c-4af8-a858-651186572d91', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('2fa2898b-9d28-4f07-9d2f-b45161ad4c34', '6d9d4ea7-8547-4a76-93ba-f2fe31892701', '30', NULL, 20, 30, 20, 0.36, 59.997);
INSERT INTO "dxb"."dimension" VALUES ('aa93f86a-e403-4820-b1ee-bc2d1d6da2f2', '0095a867-c7cd-480d-93f5-c12e61a8c7da', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('80d28fc9-b0ab-46e1-9eba-8c23106c77d1', '4de4babe-69d0-430a-8923-b8764a925ed0', '40', NULL, 40, 40, 40, 2.56, 426.649);
INSERT INTO "dxb"."dimension" VALUES ('02dbb3c8-3ab9-4e2c-9863-81dd6d57da81', 'a1d653c3-f716-4ce3-8469-6af1173ef79b', '30', NULL, 40, 20, 10, 0.24, 39.998);
INSERT INTO "dxb"."dimension" VALUES ('c66ad10c-53d6-4ae1-baad-a87dad943982', 'd54a473d-38f7-4df6-bc03-2ec06088d880', '30', NULL, 20, 10, 30, 0.18, 29.998);
INSERT INTO "dxb"."dimension" VALUES ('ba566957-eb13-499e-bfca-b29216133736', '40c393f6-a567-46f9-9b33-46774d70c484', '40', NULL, 20, 30, 20, 0.48, 79.996);
INSERT INTO "dxb"."dimension" VALUES ('3f663bb2-ccef-494d-9618-921eac083a5d', '2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', '20', NULL, 30, 20, 20, 0.24, 39.998);
INSERT INTO "dxb"."dimension" VALUES ('edf0863c-4ce3-4b85-bf43-b5dfa6eca2e6', '07af919c-2586-452e-b021-c6de8a3c83a1', '20', NULL, 20, 220, 210, 18.48, 3079.876);
INSERT INTO "dxb"."dimension" VALUES ('5f830e8e-4c21-43a3-a199-39ec167556d5', 'b01f25e8-fed4-4190-87c1-640d6a084b7c', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('288db58a-9c33-4166-868b-3c73ef16bbe7', 'a0df10f1-6174-4dd5-adda-afc69cbdddd1', '30', NULL, 20, 10, 20, 0.12, 19.999);
INSERT INTO "dxb"."dimension" VALUES ('3e817245-16c5-42dd-beb7-a5cb0f788726', 'b053010e-4219-43a6-a56d-b292f39e25c5', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('77d6549e-45d7-4a2a-982a-d1d429180ddb', 'eda254dc-bb8a-4800-a014-8330dbf0975b', '10', NULL, 20, 20, 20, 0.08, 13.332);
INSERT INTO "dxb"."dimension" VALUES ('62a792dc-b088-4dc2-9454-c0de1c17ce9b', 'b4bedcef-ea49-42e9-b3be-da59c36e166e', '200', NULL, 10, 20, 10, 0.4, 66.664);
INSERT INTO "dxb"."dimension" VALUES ('6f0b1533-65da-411d-a3b1-0e7dd5b23c03', '8923a3a6-109d-47e6-b7fa-f860c5eabe3d', '20', NULL, 30, 10, 10, 0.06, 9.999);
INSERT INTO "dxb"."dimension" VALUES ('18273a25-e453-4e74-a84d-ae3060e03ec4', '4fefff4e-e463-4393-b5a6-6c7f1f7ef265', '20', NULL, 30, 30, 30, 0.54, 89.996);
INSERT INTO "dxb"."dimension" VALUES ('bb4543a5-f3e7-459d-84ad-a0715a2c0dea', 'c8687520-d7c8-4058-997c-961c713c18aa', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('588efd4e-5a41-4e09-b29e-7c7fec2f5e02', '6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "dxb"."dimension" VALUES ('3143562b-be9d-48d7-a2b3-60adc895c657', '1b811059-ca80-4603-855e-86f9890a1805', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('dd70c122-02cd-469a-a4f0-8cd64befacc3', 'fe033103-040c-468f-91d8-cb934482c594', '200', NULL, 10, 20, 10, 0.4, 66.664);
INSERT INTO "dxb"."dimension" VALUES ('5fa8911f-a226-411b-b76f-660e0aa53177', '10f6d5dc-d708-4351-a1e3-35c62cfdc76c', '200', NULL, 30, 20, 30, 3.6, 599.976);
INSERT INTO "dxb"."dimension" VALUES ('87d29849-c5cb-4e5f-9d21-b7a8ec8e7668', '677a92fe-283a-4518-a2d5-705feac53126', '300', NULL, 20, 10, 30, 1.8, 299.988);
INSERT INTO "dxb"."dimension" VALUES ('4daa2ea2-6c3b-4e63-9f14-8557cb0f844d', '815a6c7a-38da-4598-b246-ce426cf58737', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('665fc9da-daf9-4741-9663-6541eb8e1f8d', '08052673-0558-49ee-abb9-80f127ff8ac2', '20', NULL, 30, 20, 10, 0.12, 19.999);
INSERT INTO "dxb"."dimension" VALUES ('365d9a01-7f57-4a93-bd35-71f555578ef5', '2468ea51-4c64-4bf9-816b-daf2c07d1aa6', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('11063e39-a38c-4f7f-88c2-a94d4820cf4f', '6bd85111-f46b-465f-8cb4-d1cdedad6da7', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('46935b6c-ecba-4b0f-b2a7-2be2434264e3', '52fd6c66-4dd5-430c-bfde-7491110dab24', '20', NULL, 30, 20, 20, 0.24, 39.998);
INSERT INTO "dxb"."dimension" VALUES ('4563d914-8e1b-4f64-9d40-32d6704b6522', '2412c9de-563d-4fed-8ac8-73e780621984', '20', NULL, 10, 20, 20, 0.08, 13.332);
INSERT INTO "dxb"."dimension" VALUES ('4ef0c486-8644-406d-b4b8-57fd578c8431', '09b7d475-b92c-43ca-87c6-e7ec070848e9', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('c73d7175-1bdc-410a-bb21-6f7a6d270389', 'bb619a92-9823-42a0-8466-7a60d7d21446', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('5e340944-2db7-45c6-b3f3-463c8e09e7c2', '3c244936-60ba-4c50-a230-51ea58cd9427', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('d2fd3f4a-6bd3-42a7-ba55-39859b0b3274', 'abd29adf-78e7-48db-85c0-b346c8f3808e', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('4cc8c405-a71f-4c59-bcf8-5037e8d87263', '48a6111b-9244-4ea0-8c07-2350db07254d', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('100b8cdd-5126-4834-9c6b-ed5f6d1ea550', 'a2e2282f-d196-4ba0-ad88-3e04b388b0de', '30', NULL, 30, 20, 20, 0.36, 59.997);
INSERT INTO "dxb"."dimension" VALUES ('2db9adbd-b8d9-4af3-919f-f14898490d1e', '3b848e3a-f9b1-4944-895e-f6a83f034bef', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('7515a247-bd2f-41ad-8405-98401ead0f94', 'abe1cc11-8667-4b0b-b9c6-a79272575402', '40', NULL, 40, 40, 40, 2.56, 426.649);
INSERT INTO "dxb"."dimension" VALUES ('787eab70-3c2d-4834-93b9-fa4cc946e274', '2088a818-0433-45b7-9110-1dbae3b9a9b9', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "dxb"."dimension" VALUES ('87612d7e-da4a-47a6-b2c1-6f2f084655d5', '912bd056-3711-487a-a1d5-a884046fc254', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "dxb"."dimension" VALUES ('3ef93618-b2f7-42a8-8e41-079baeac3b56', '3e9d64c1-1587-422c-b74f-49559eec819e', '50', NULL, 50, 50, 50, 6.25, 1041.625);
INSERT INTO "dxb"."dimension" VALUES ('0b9b25b0-84a6-4c00-89ed-56854b306c0f', 'b34f807d-0526-442f-8b25-a1134de5ab21', '10', NULL, 10, 20, 30, 0.06, 9.999);
INSERT INTO "dxb"."dimension" VALUES ('493a9376-27d2-4ce7-943f-65b00798cad7', '39393fac-4390-4a21-ae1c-49d9eeb12671', '30', NULL, 30, 10, 80, 0.72, 119.995);
INSERT INTO "dxb"."dimension" VALUES ('4320858a-7f1a-46a5-8e37-e0be4aedbf6e', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "dxb"."dimension" VALUES ('28ac2364-b549-4862-ad72-b228af48c4ac', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', '24', NULL, 242, 424, 242, 595.947, 99320.527);
INSERT INTO "dxb"."dimension" VALUES ('171e1f70-5a9d-4361-9bcd-32c40c9e809d', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "dxb"."dimension" VALUES ('d86726ac-c027-4102-822c-d21204873523', '41ccf845-9e64-4efb-859d-15395753657d', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "dxb"."dimension" VALUES ('8a224cd5-4a46-476e-aa74-927d0a205327', '6ea5972e-7192-491b-b67b-1716a88eecb6', '12', NULL, 23, 43, 12, 0.142, 23.665);
INSERT INTO "dxb"."dimension" VALUES ('48827bab-4635-4d73-a60a-2fe370a4e969', '3217d8fb-8c52-445d-a870-ac91a6d33135', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "dxb"."dimension" VALUES ('91ed1dae-b5aa-4213-a62d-7d1fe436a404', 'a221ef20-676e-4701-a33d-da6d9a533008', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "dxb"."dimension" VALUES ('91e28507-2e33-4fca-9f3b-3ba39a91667c', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', '10', NULL, 10, 104, 10, 0.104, 17.332);
INSERT INTO "dxb"."dimension" VALUES ('89e39d62-58fa-45b7-b1c1-a4a19635060d', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', '56', NULL, 67, 67, 54, 13.575, 2262.409);
INSERT INTO "dxb"."dimension" VALUES ('41cf7f61-bfea-42c4-9f39-bdf4d60285b6', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', '100', NULL, 23, 343, 35, 27.611, 4601.649);
INSERT INTO "dxb"."dimension" VALUES ('f00533a9-d38a-4a40-b402-8a0bf6b73e32', 'e53223f0-6d5b-472b-b35e-48745db328af', '21', NULL, 33, 33, 2123, 48.551, 8091.509);
INSERT INTO "dxb"."dimension" VALUES ('1d984368-56f7-4cc8-8242-ec36d7f2fea8', 'e53223f0-6d5b-472b-b35e-48745db328af', '21', NULL, 33, 33, 2123, 48.551, 8091.509);
INSERT INTO "dxb"."dimension" VALUES ('61762b6a-0449-4a0e-b43b-ef6abc51a2cf', 'e53223f0-6d5b-472b-b35e-48745db328af', '21', NULL, 33, 33, 2123, 48.551, 8091.509);
INSERT INTO "dxb"."dimension" VALUES ('b3883fcc-15bb-4aba-90a5-48a04d831043', '37f8990b-a6f8-41c5-8a8a-817504337781', '10', NULL, 100, 100, 100, 10, 1666.6);
INSERT INTO "dxb"."dimension" VALUES ('4279e422-1264-4ecc-affc-00d698f82531', '0e5ecb23-02f4-4bd9-950a-f1c756bd5c2a', '55', NULL, 55, 55, 55, 9.151, 1525.105);
INSERT INTO "dxb"."dimension" VALUES ('53ee3936-748d-4519-88eb-8233fdd48494', '8819bc36-7643-4ab4-b6cc-f8beb4ef73d4', '5151', NULL, 51, 51, 11, 147.375, 24561.517);
INSERT INTO "dxb"."dimension" VALUES ('46617be9-bc78-43d2-9409-7988455defd1', '5d9b097f-b696-4395-bf72-d767fa78a60d', '15', NULL, 15, 15, 15, 0.051, 8.499);
INSERT INTO "dxb"."dimension" VALUES ('ddead1f9-db04-4f9c-8cc6-1e915bd3456c', 'c041241a-01f6-4769-973f-87a44eb11476', '33', NULL, 33, 33, 33, 1.186, 197.658);
INSERT INTO "dxb"."dimension" VALUES ('ad5edbea-40c1-4510-9e65-fb09e3cca67a', '790aeb0b-c079-4590-886b-c3f4b0cea21f', '51', NULL, 15, 11, 11, 0.093, 15.499);
INSERT INTO "dxb"."dimension" VALUES ('972f23c4-fd1b-4beb-a4b7-ebd95c0266e6', 'eed85aa2-f0a6-4453-b1ff-5028526cafb4', '28', NULL, 28, 28, 26, 0.571, 95.162);
INSERT INTO "dxb"."dimension" VALUES ('c4b92857-8120-4fc0-99f7-5529e4517319', '16497a46-812c-45af-a448-7533617d535c', '11', NULL, 41, 11, 11, 0.055, 9.166);
INSERT INTO "dxb"."dimension" VALUES ('5bc6d4a7-6a47-4a44-a667-aee3e33efdde', '4f65571c-256a-4a64-89b4-62eac92fafdd', '5', NULL, 100, 100, 100, 5, 833.3);
INSERT INTO "dxb"."dimension" VALUES ('dd1dccc6-e79d-4c49-8a96-f5a3f3a87143', '52668d09-c09d-4d5e-b922-ee5ceb9f133c', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('c2e2b791-31c0-4dbe-964e-3c607cf8a53c', '2f34a1b1-b647-456b-88ec-d02962d04b16', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('e6f03e59-6eb8-4091-a265-5df291872d03', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "dxb"."dimension" VALUES ('813aaf43-11cd-4c28-904b-75ca98d9b8ae', '0211ca52-7c9a-4003-9623-0be52855cb6a', '100', NULL, 10, 20, 100, 2, 333.32);
INSERT INTO "dxb"."dimension" VALUES ('946f3de4-dc58-4fec-8537-60f5ff728d03', '5a19eaf1-23e4-4515-807e-b52774b985b8', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('593ab951-6b76-4f29-a38e-b6f666d4264a', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389', '200', NULL, 200, 200, 200, 1600, 266656);
INSERT INTO "dxb"."dimension" VALUES ('54d81acd-1c89-412c-9ac7-4c25f89cb16e', '6e4821cf-169b-4dcc-9115-86d1a60073ed', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "dxb"."dimension" VALUES ('478f701c-42e8-45d6-801f-2b275114e944', '1cd2eaa9-ba27-4bec-a790-027610447cc7', '1200', NULL, 100, 100, 100, 1200, 199992);
INSERT INTO "dxb"."dimension" VALUES ('26265232-cc29-40ea-8e05-6d9902b795d1', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', '10', NULL, 100, 100, 100, 10, 1666.6);
INSERT INTO "dxb"."dimension" VALUES ('7056f171-1eb3-4eb4-82c7-7d83170ff893', '6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('aca4aaa5-ffe2-42c4-ac70-9fa0fdc944d3', '29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', '23', NULL, 12, 13, 1, 0.004, 0.666);
INSERT INTO "dxb"."dimension" VALUES ('dd1ce9a3-a177-47d8-92b9-18525a6b39fc', '73321db0-997a-418a-8a4d-ee71f04bc8c8', '11', NULL, 11, 11, 11, 0.015, 2.499);
INSERT INTO "dxb"."dimension" VALUES ('b069ce13-c995-45bf-9d44-9726c7074417', '3e7352d5-854d-4367-a7dd-a14a895b0aa7', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('e7181ed2-29ad-4b07-a219-ef8fd15be3ee', 'c2c95c41-caa7-437e-b2e7-8fc3bea08038', '123', NULL, 123, 123, 123, 228.887, 38146.307);
INSERT INTO "dxb"."dimension" VALUES ('bd06d53c-161f-47c5-b880-70b6d85185fe', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', '44', NULL, 44, 44, 44, 3.748, 624.641);

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
-- Records of histori_job
-- ----------------------------
INSERT INTO "dxb"."histori_job" VALUES ('489ae379-0548-4f8c-931e-fae04c3f47cc', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', 'Booking Received', 'BAIE D''URFé', '2024-10-21 08:51:34', NULL, NULL, 'GMT+7', 1, 0);
INSERT INTO "dxb"."histori_job" VALUES ('54d74d23-290f-49a5-afd6-d439eb249ad6', '2f34a1b1-b647-456b-88ec-d02962d04b16', 'Booking Received', 'ÅBO (TURKU)', '2024-10-21 07:02:54', NULL, NULL, 'GMT+7', 1, 0);
INSERT INTO "dxb"."histori_job" VALUES ('53b160e4-a179-4f7a-8404-f541c601f371', '52668d09-c09d-4d5e-b922-ee5ceb9f133c', 'Booking Received', NULL, '2024-10-21 06:52:50', NULL, NULL, '', 1, 0);
INSERT INTO "dxb"."histori_job" VALUES ('ef509901-bc11-45a8-8f41-d7f325ce4077', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Booking Received', 'ABBOT POINT', '2024-10-22 03:31:57', NULL, NULL, 'GMT+7', 15, 0);
INSERT INTO "dxb"."histori_job" VALUES ('9b374a2d-89dd-4176-91cb-dd3db7876459', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', 'Arrived in transit Port', 'DUBAI', NULL, NULL, 'thomas@pamcargo.com', 'GMT+7', 10, 0);
INSERT INTO "dxb"."histori_job" VALUES ('4b63fed9-7da1-447b-b26c-1e1fcbb7ce44', '38d691ab-a093-4134-be2e-4f84ef05dde5', 'Booking Received', NULL, '2024-10-28 02:56:43', NULL, NULL, 'GMT+7', 57, 0);
INSERT INTO "dxb"."histori_job" VALUES ('4b926394-5df9-4aa7-8842-c9f33d078cf0', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Booking Received', 'ABERDEEN', '2024-10-28 04:16:52', NULL, NULL, 'GMT+7', 29, 0);
INSERT INTO "dxb"."histori_job" VALUES ('f11a2620-6d77-4f89-afe5-57255ad95436', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', 'In Transit to other port', 'DUBAI', NULL, NULL, 'thomas@pamcargo.com', 'GMT+7', 11, 0);
INSERT INTO "dxb"."histori_job" VALUES ('fbff35f4-4512-4607-83d4-96cd20b6635e', '2f34a1b1-b647-456b-88ec-d02962d04b16', 'Vessel Departed', 'DUBAI', NULL, NULL, 'thomas@pamcargo.com', 'GMT+7', 9, 0);
INSERT INTO "dxb"."histori_job" VALUES ('217cecad-114f-432e-a842-00f0d4682605', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389', 'Booking Received', 'JAKARTA', '2024-10-29 03:03:07', NULL, NULL, 'GMT+7', 1, 0);
INSERT INTO "dxb"."histori_job" VALUES ('4cd6c8ba-8e60-4108-a898-e944a4f3e643', '6e4821cf-169b-4dcc-9115-86d1a60073ed', 'Booking Received', NULL, '2024-10-29 03:41:15', NULL, NULL, 'GMT+7', 57, 0);
INSERT INTO "dxb"."histori_job" VALUES ('9da4ddfb-cf7d-43f0-bb5f-b46ce49a7aad', '6e4821cf-169b-4dcc-9115-86d1a60073ed', 'Booking Confirmed', 'DUBAI', '2024-10-29 11:43:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 58, 0);
INSERT INTO "dxb"."histori_job" VALUES ('6ce20fce-dbfb-419d-88d9-f1f976cde3da', '38d691ab-a093-4134-be2e-4f84ef05dde5', 'Booking Confirmed', 'DUBAI', '2024-10-29 11:43:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 58, 0);
INSERT INTO "dxb"."histori_job" VALUES ('fca4e0b4-de56-4702-85e0-c342e82c22fb', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Booking Confirmed', 'DUBAI', NULL, NULL, 'thomas@pamcargo.com', 'GMT+7', 30, 0);
INSERT INTO "dxb"."histori_job" VALUES ('26f6b444-0e04-4315-93c0-29e547448665', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Received in Airport Warehouse', 'DUBAI', '2024-10-28 10:55:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 31, 0);
INSERT INTO "dxb"."histori_job" VALUES ('93c2e4b9-c46f-4e94-bad0-9659007e7dab', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Manifested', 'DUBAI', '2024-10-29 10:58:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 32, 0);
INSERT INTO "dxb"."histori_job" VALUES ('833fc781-fba3-42af-b42b-e7fbdefcb7c7', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Cargo partially Airlifted', 'DUBAI', '2024-10-29 11:10:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 34, 0);
INSERT INTO "dxb"."histori_job" VALUES ('aa2c1920-9718-44f5-ae47-a1552c4a6c90', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'In Transit another Airport', 'DUBAI', '2024-10-29 11:22:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 37, 0);
INSERT INTO "dxb"."histori_job" VALUES ('a709d263-fc3c-41c4-b076-dcb9d4449a0e', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Arrived in destination Airport', 'DUBAI', '2024-10-12 11:23:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 38, 0);
INSERT INTO "dxb"."histori_job" VALUES ('f4578bb6-b437-4e90-a1e2-bbffa2aed42b', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Under Customs Clearance', 'DUBAI', '2024-10-29 11:30:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 39, 0);
INSERT INTO "dxb"."histori_job" VALUES ('e05afc8b-c7d6-428f-b18b-93a57f059b38', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Truck departed from airport', 'DUBAI', '2024-10-29 11:38:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 40, 0);
INSERT INTO "dxb"."histori_job" VALUES ('596a3721-865c-4495-9094-f9c501b7fc13', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Booking Confirmed', 'DUBAI', '2024-10-29 14:39:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 16, 0);
INSERT INTO "dxb"."histori_job" VALUES ('2f161fe2-0dc1-451b-bbe3-7809919f2c96', '1cd2eaa9-ba27-4bec-a790-027610447cc7', 'Booking Received', NULL, '2024-10-29 07:42:05', NULL, NULL, '', NULL, 0);
INSERT INTO "dxb"."histori_job" VALUES ('1acd1295-755e-4a6f-96da-11b0537ce2bf', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', 'Booking Received', NULL, '2024-10-29 07:48:41', NULL, NULL, 'GMT+7', 63, 0);
INSERT INTO "dxb"."histori_job" VALUES ('866277bb-124d-4cd1-aa65-d40d28135d28', '5a19eaf1-23e4-4515-807e-b52774b985b8', 'Cargo Airlifted', 'DUBAI', '2024-10-29 14:56:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 36, 0);
INSERT INTO "dxb"."histori_job" VALUES ('d68ea35a-a666-45c5-9da1-bbfabfa6022c', '6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', 'Booking Received', NULL, '2024-10-29 08:06:43', NULL, NULL, '', NULL, 0);
INSERT INTO "dxb"."histori_job" VALUES ('779ef0c6-9f6a-4371-b19e-36ec01f465fb', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Loading Completed', 'DUBAI', '2024-10-29 15:19:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 19, 0);
INSERT INTO "dxb"."histori_job" VALUES ('a6f561d0-2ba6-4375-87f8-962882c86c71', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Arrived in transit Port', 'DUBAI', '2024-10-29 15:20:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 24, 0);
INSERT INTO "dxb"."histori_job" VALUES ('67590801-32c2-4a71-9cab-572e10ecb1ab', '0211ca52-7c9a-4003-9623-0be52855cb6a', 'Cancel', 'DUBAI', '2024-10-29 15:21:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 22, 0);
INSERT INTO "dxb"."histori_job" VALUES ('b7471481-a8e8-4850-8758-58cd3118d0ec', '29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', 'Booking Received', 'ABERDEEN', '2024-10-29 08:26:28', NULL, NULL, 'GMT+7', 29, 0);
INSERT INTO "dxb"."histori_job" VALUES ('cac1b57d-d68c-473b-9c9d-98a7b57c2d2c', '29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', 'Booking Confirmed', 'DUBAI', '2024-10-29 15:27:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 30, 0);
INSERT INTO "dxb"."histori_job" VALUES ('960a89a9-0a4f-4d88-b245-a70e6d06e345', '73321db0-997a-418a-8a4d-ee71f04bc8c8', 'Booking Received', 'ABIDJAN', '2024-10-29 08:31:08', NULL, NULL, 'GMT+7', 29, 0);
INSERT INTO "dxb"."histori_job" VALUES ('237f3bd0-292a-4ad8-bbdd-292b060ed8f6', '3e7352d5-854d-4367-a7dd-a14a895b0aa7', 'Booking Received', 'ABBOT POINT', '2024-10-29 08:52:35', NULL, NULL, 'GMT+7', 43, 0);
INSERT INTO "dxb"."histori_job" VALUES ('8d75acdc-9331-40a8-b373-b82dd4f91628', '6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', 'In Transit', 'DUBAI', '2024-10-29 18:01:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 74, 0);
INSERT INTO "dxb"."histori_job" VALUES ('2f3de7aa-e53b-4329-b064-61bcdbc5a9df', '226dd33d-0f65-4e2f-8601-1080143bb0f0', 'Booking Received', NULL, '2024-10-30 06:59:36', NULL, NULL, '', NULL, 0);
INSERT INTO "dxb"."histori_job" VALUES ('8ea9db01-37f7-400d-b94f-cd095571565a', 'c2c95c41-caa7-437e-b2e7-8fc3bea08038', 'Booking Received', NULL, '2024-10-30 07:14:08', NULL, NULL, '', 71, 0);
INSERT INTO "dxb"."histori_job" VALUES ('08eb0ca1-2df4-4193-bcff-6a80cbabda1a', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', 'Booking Received', NULL, '2024-10-30 07:16:16', NULL, NULL, '', 71, 0);
INSERT INTO "dxb"."histori_job" VALUES ('ce55749a-8425-482e-b587-0479c9fa06f6', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', 'In Transit', 'DUBAI', '2024-10-30 14:37:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 74, 0);

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
-- Records of job_order
-- ----------------------------
INSERT INTO "dxb"."job_order" VALUES ('c701cc13-b158-42f3-86cb-4d1731d843e3', 'SI2410007', '2024-10-21', NULL, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', 'CSCL GLOBE - 123456789', NULL, 'system@pamcargo.com', NULL, NULL, 'SEAIMPORT', 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'PAM INTERNATIONAL CARGO (LLC)', NULL, NULL, NULL, NULL, NULL, '2024-10-22', '04118885-1e24-41ed-9c7c-dae53ee68fe8', NULL, NULL, 'SF-2410001');
INSERT INTO "dxb"."job_order" VALUES ('293131db-517c-4934-bfd8-3402f0b7a6c4', 'CO2410007', '2024-10-30', NULL, NULL, NULL, NULL, 'system@pamcargo.com', NULL, NULL, 'COURIER', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CTN1412512');

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
-- Records of job_order_detail
-- ----------------------------
INSERT INTO "dxb"."job_order_detail" VALUES ('7e7faba0-bcc2-4a1e-b589-0b1f941166ff', 'c701cc13-b158-42f3-86cb-4d1731d843e3', 'DXBSI2410002', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740');
INSERT INTO "dxb"."job_order_detail" VALUES ('034ce0f2-c63f-4b57-8103-259ef1e77603', 'c701cc13-b158-42f3-86cb-4d1731d843e3', 'DXBSI2410001', '2f34a1b1-b647-456b-88ec-d02962d04b16');
INSERT INTO "dxb"."job_order_detail" VALUES ('68490b39-8553-4076-9782-69682b252b18', '293131db-517c-4934-bfd8-3402f0b7a6c4', 'DXBCO7001003', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be');

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
-- Records of loading_report
-- ----------------------------
INSERT INTO "dxb"."loading_report" VALUES ('04118885-1e24-41ed-9c7c-dae53ee68fe8', NULL, NULL, '1234567', 1, '1234567', '533219ad-bfa1-4cf6-87f9-fce85748a647', 1, NULL, 'operations@pamcargo.com', '2024-10-21 16:18:39.633403', NULL, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', 'CSCL GLOBE', '2024-10-22', '2024-10-22', '123456789', NULL, NULL, '2024-10-31', 'SF-2410001');
INSERT INTO "dxb"."loading_report" VALUES ('b779df12-5ad3-450d-9905-ad14758a7676', NULL, NULL, 'BO12345', 2, '1241626', '533219ad-bfa1-4cf6-87f9-fce85748a647', 1, NULL, 'thomas@pamcargo.com', '2024-10-29 16:51:21.474163', NULL, '5fcd3c4f-7f61-48ab-a6a3-29751ee994c7', 'SAN LORENZO', '2024-10-31', '2024-11-01', 'FLYINGDUTCHMAN', NULL, NULL, '2024-11-01', 'SF-2410002');

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
-- Records of loading_report_detail
-- ----------------------------
INSERT INTO "dxb"."loading_report_detail" VALUES ('0335370b-1b6b-48fd-8da5-7e5316b157f6', '04118885-1e24-41ed-9c7c-dae53ee68fe8', '2131313', 'sadadad', '20 FT', 1, NULL);
INSERT INTO "dxb"."loading_report_detail" VALUES ('81ffa8a7-c0ab-447e-afff-cfb46e9fe07d', 'b779df12-5ad3-450d-9905-ad14758a7676', '123', '123', '20 FT', 1, NULL);
INSERT INTO "dxb"."loading_report_detail" VALUES ('a3c8a5fe-4865-49b4-b63d-971ef46675b3', 'b779df12-5ad3-450d-9905-ad14758a7676', '1233', '1323', '40 FT', 1, NULL);

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
-- Records of local_transport
-- ----------------------------
INSERT INTO "dxb"."local_transport" VALUES ('964b7aef-8ac5-49f4-82c9-a8098de0393d', '912bd056-3711-487a-a1d5-a884046fc254', 'B 1323 C', 'coki', '23242', NULL, '2024-06-10 11:26:24', NULL, '2024-06-10 11:26:24', NULL, 1, '12');
INSERT INTO "dxb"."local_transport" VALUES ('e873dca7-6862-4b4d-a073-118ee84dcc46', '41ccf845-9e64-4efb-859d-15395753657d', '789', 'ten', '1783718', NULL, '2024-06-11 11:25:48', NULL, '2024-06-11 11:25:48', NULL, 1, '09');
INSERT INTO "dxb"."local_transport" VALUES ('76baf75d-ee52-4f16-be72-57865e26ea3e', '39393fac-4390-4a21-ae1c-49d9eeb12671', 'B7428K', 'aep', '09088', NULL, '2024-06-06 14:10:21', NULL, '2024-06-06 14:10:21', NULL, 1, '11');
INSERT INTO "dxb"."local_transport" VALUES ('fb3169e4-3e25-4b15-ab14-418451448db4', '6ea5972e-7192-491b-b67b-1716a88eecb6', '2313', 'driver', '1313', NULL, '2024-06-11 11:56:38', NULL, '2024-06-11 11:56:38', NULL, 1, '121');
INSERT INTO "dxb"."local_transport" VALUES ('918bc3c7-cd26-45f6-9d3f-e17364a3acac', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '2324', 'bro', '13', NULL, '2024-06-11 12:10:14', NULL, '2024-06-11 12:10:14', NULL, 1, '244');
INSERT INTO "dxb"."local_transport" VALUES ('21238532-7cc4-4acf-8ac3-19419a4091a7', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', '789', 'driver', '12332', NULL, '2024-06-11 14:40:17', NULL, '2024-06-11 14:40:17', NULL, 1, '1131');
INSERT INTO "dxb"."local_transport" VALUES ('067181d5-889a-455b-8f07-f369c150b2df', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '133', 'enoki', '3', NULL, '2024-06-11 14:50:40', NULL, '2024-06-11 14:50:40', NULL, 1, '890');
INSERT INTO "dxb"."local_transport" VALUES ('bdc96270-25ae-48e0-8c9e-0ee8b4b46bf8', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', '789', 'enoki', '76575', NULL, '2024-06-20 10:05:45', NULL, '2024-06-20 10:05:45', NULL, 1, '45');
INSERT INTO "dxb"."local_transport" VALUES ('9ec464ed-b355-47f5-a01f-1242e37ebc13', '3217d8fb-8c52-445d-a870-ac91a6d33135', 'B22424K', 'driver', '24242323', NULL, '2024-06-24 15:02:39', NULL, '2024-06-24 15:02:39', NULL, 1, '12');
INSERT INTO "dxb"."local_transport" VALUES ('c91ab53e-7b90-40fd-b449-72eb016ad7e4', 'b34f807d-0526-442f-8b25-a1134de5ab21', 'A787B', 'driver 1', '65654', NULL, '2024-06-25 14:35:00', NULL, '2024-06-25 14:35:00', NULL, 1, '454');
INSERT INTO "dxb"."local_transport" VALUES ('95de5aac-4682-4ce2-b5b8-c8f3034b9144', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', 'B3554A', 'driver 1', '454643', NULL, '2024-06-26 11:59:10', NULL, '2024-06-26 11:59:10', NULL, 1, '23');
INSERT INTO "dxb"."local_transport" VALUES ('def7e478-3779-4c26-aa5b-fb9682093a91', '6637d456-b568-452c-bf72-61f3afb3ddc1', 'B22424K', 'driver', '3453', NULL, '2024-07-22 15:51:12', NULL, '2024-07-22 15:51:12', NULL, 1, '3533');
INSERT INTO "dxb"."local_transport" VALUES ('3a782939-7fe2-4da0-9a1e-22ee31cd7db9', '6e4821cf-169b-4dcc-9115-86d1a60073ed', 'B 2043 BT', 'Bambang Kentolet', '0812898373736', NULL, '2024-10-29 11:30:14', NULL, '2024-10-29 11:30:14', NULL, 1, 'Cawang');
INSERT INTO "dxb"."local_transport" VALUES ('7ec2303c-7ed9-4def-bd01-354134eef51d', '6e4821cf-169b-4dcc-9115-86d1a60073ed', 'B 5555 JTX', 'Budi Sudarsono', '08998923099', NULL, '2024-10-29 11:30:14', NULL, '2024-10-29 11:30:14', NULL, 1, 'Kalibata');

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
-- Records of noted_section
-- ----------------------------
INSERT INTO "dxb"."noted_section" VALUES ('108c787a-2d26-4383-a4a2-8a6a82a822ed', 'tes', '2024-06-05 10:19:47.51196', 2, NULL, 'dubai@pamcargo.com', 'ca1e6202-587a-4326-94cf-d3e161a273fa');
INSERT INTO "dxb"."noted_section" VALUES ('85b21de0-fdd9-4dfe-8dee-31eb928e7a5f', 'test', '2024-06-10 11:06:41.508374', 2, NULL, 'dubai@pamcargo.com', '912bd056-3711-487a-a1d5-a884046fc254');
INSERT INTO "dxb"."noted_section" VALUES ('bb50d3de-79d3-48e0-94a6-e68e2b916122', 'test notes', '2024-06-11 11:19:17.675261', 2, NULL, 'dubai@pamcargo.com', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."noted_section" VALUES ('da73b35d-983f-432d-9505-c7e0d843fbfb', 'notes', '2024-06-11 11:49:21.713762', 2, NULL, 'dubai@pamcargo.com', '39393fac-4390-4a21-ae1c-49d9eeb12671');
INSERT INTO "dxb"."noted_section" VALUES ('07510afc-5a52-45a8-a487-e2a8b53948cd', 'test', '2024-06-11 11:56:10.309317', 2, NULL, 'dubai@pamcargo.com', '6ea5972e-7192-491b-b67b-1716a88eecb6');
INSERT INTO "dxb"."noted_section" VALUES ('516aa0e7-b4ec-4ca9-a675-36ad59d9085c', 'test', '2024-06-11 12:09:05.966365', 2, NULL, 'dubai@pamcargo.com', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b');
INSERT INTO "dxb"."noted_section" VALUES ('eda93774-8d1c-43d3-a97d-b177d0a4fba0', 'test', '2024-06-11 14:39:45.398759', 2, NULL, 'dubai@pamcargo.com', '6007ef0b-34f7-4e90-b43b-6081c41b73b3');
INSERT INTO "dxb"."noted_section" VALUES ('4f46cafe-dc3e-4e2a-afb3-653c09eba776', 'notes dxb', '2024-06-11 14:49:55.751258', 2, NULL, 'dubai@pamcargo.com', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466');
INSERT INTO "dxb"."noted_section" VALUES ('d3a0b1e7-8d4e-4020-b447-fc18a5bb6c9a', 'tes', '2024-06-19 16:35:54.542857', 2, NULL, 'dubai@pamcargo.com', 'b34f807d-0526-442f-8b25-a1134de5ab21');
INSERT INTO "dxb"."noted_section" VALUES ('cab91c0c-a810-409a-92cf-b62a553ec5f1', 'test', '2024-06-24 14:47:09.345656', 2, NULL, 'dubai@pamcargo.com', '3217d8fb-8c52-445d-a870-ac91a6d33135');
INSERT INTO "dxb"."noted_section" VALUES ('702259fe-49b6-42bb-9914-b5164ddeb27a', 'tes', '2024-06-25 14:10:36.07508', 2, NULL, 'dubai@pamcargo.com', 'b34f807d-0526-442f-8b25-a1134de5ab21');
INSERT INTO "dxb"."noted_section" VALUES ('1c5aab50-1b31-4afb-a07c-447a27b9e827', 'test', '2024-06-26 11:27:18.319497', 2, NULL, 'dubai@pamcargo.com', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593');
INSERT INTO "dxb"."noted_section" VALUES ('6e2d6bd8-83cd-4038-a2cf-5dd4642273af', 'tes', '2024-07-22 15:50:53.129218', NULL, NULL, 'dubai@pamcargo.com', '6637d456-b568-452c-bf72-61f3afb3ddc1');
INSERT INTO "dxb"."noted_section" VALUES ('e7a3eeaa-1261-4e6b-adf2-4b48f74bc516', 'test data input', '2024-10-29 16:32:32.931584', 2, NULL, 'dubai@pamcargo.com', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389');
INSERT INTO "dxb"."noted_section" VALUES ('f0e3a0ac-1303-4bc7-9946-18c05e5794a6', 'cendol gan', '2024-10-29 16:35:56.99283', 2, NULL, 'dubai@pamcargo.com', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389');
INSERT INTO "dxb"."noted_section" VALUES ('84275385-41c8-4d67-9bae-23304047ccaa', 'mari gan', '2024-10-29 16:39:10.998356', 2, NULL, 'dubai@pamcargo.com', '38d691ab-a093-4134-be2e-4f84ef05dde5');
INSERT INTO "dxb"."noted_section" VALUES ('0607c412-2d72-4e49-ab4a-7dfcf4a06904', 'coba coba aja masbro', '2024-10-29 16:40:26.361807', 2, NULL, 'thomas@pamcargo.com', '38d691ab-a093-4134-be2e-4f84ef05dde5');
INSERT INTO "dxb"."noted_section" VALUES ('22660520-9070-4033-a627-9cc8cbe937f8', 'yoo', '2024-10-31 10:24:25.922253', 2, NULL, 'thomas@pamcargo.com', '73321db0-997a-418a-8a4d-ee71f04bc8c8');

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
-- Records of operation_document
-- ----------------------------
INSERT INTO "dxb"."operation_document" VALUES ('cfcce85c-4fbb-43ab-8e74-b647dd7e2ac1', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, 'bf670255-8a4e-4dc7-ba05-1e16f5f438d4', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('192dd96e-2a3d-4957-b31a-f43ee0739da5', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', '11062024/shipping_line_invoices-110620241718095173.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, 'aef3bcfb-ca54-46b1-bb85-4a3bc0177349', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('added7f9-251b-4b11-b5b0-0589c5853836', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', '11062024/shipping_line_invoices-110620241718095460.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'f554fc40-8c06-40f3-b147-2a39c15fe48a', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('0c964eed-73c5-4ccf-b1f7-6e90abeb8a2e', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', '11062024/shipping_line_invoices-110620241718096052.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '30e89ea9-736c-4d53-a396-31ee4862c29c', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('6f46594e-d19f-4651-ad37-7a196042744b', NULL, NULL, 'null', 'null', '11062024/shipping_line_invoices-110620241718095544.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '4c92fc4d-9020-4435-8854-96f2c419cf09', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('a77e8138-8744-4bf3-8941-fd9f43756346', NULL, NULL, 'null', 'null', '11062024/shipping_line_invoices-110620241718096139.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '905f86a3-1e35-422a-89e3-b9d6c0211b45', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('30de3ec3-b70e-4734-a6ab-63157cb1749d', NULL, NULL, 'null', 'null', '11062024/shipping_line_invoices-110620241718096197.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'eee98930-fd50-4427-9be9-5f23af319aef', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('370596ec-a870-43e8-acff-c1e17516e0b1', NULL, NULL, 'null', 'null', '11062024/shipping_line_invoices-110620241718096444.pdf', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-11', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'ef07475b-8cd0-4661-9547-6e747f1e90d4', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('478e96a1-0c64-488b-94c0-cf1f560f8dc1', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-26', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, 'c8244a95-8eb9-4fd9-8300-a3673ba6659c', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('3b3a1d5c-3479-4381-8ef1-cddf28026b85', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ÅBO (TURKU)', NULL, 'e190c936-1807-4a8a-b51f-cdbc642e7f50', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('9db4a0eb-2346-421c-b828-c8e5e31961f9', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '78daa06c-c2a2-48e0-bde0-04fcec499099', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('82d62c51-9a2f-4afd-8661-a0072bde28b9', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '256d2dbf-86a7-4fdd-9123-f8d7a773a802', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('da58fed0-a982-4b56-9d66-648211ecf7d8', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'c88b56a0-850d-4d92-b2fa-59401005880f', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('7c3dcbd5-cbeb-4fbb-a5ee-4e24de41cfd8', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'd5fac5d2-89f4-4b3d-aa20-9c08c50e72b7', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('5bef29ee-9dcb-4a8d-b202-115001586b70', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '1b039e33-5fa7-483d-b91e-2a046b6ece0a', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('373a5edb-e869-4074-9250-cdc290a50368', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '476e1146-dc21-48c9-a148-85be08c12a4f', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('6e268636-1dbc-4c88-ada9-c27a29dfca04', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '5ca78662-d11b-4e7b-bc0c-5ab28749b59b', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('5e3844ce-25cb-444b-9a76-6f7be765c6f0', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '50225405-33dd-4876-8f2b-885683228bfa', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('8ae0ed24-a509-4959-b959-033467b82c72', NULL, NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'abb46dd1-fb13-4ee4-b61e-566ccc841b14', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('af8d8d97-5ae2-46e7-b54c-d472457022d1', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '0e644126-92e1-4863-a3f6-d192fab232ce', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('8c8f24c4-83c7-4d7b-8496-7e8a6dfa8a9a', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ÅBO (TURKU)', NULL, 'e301afd2-a683-4261-9019-7205a02a24bc', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('8407fc35-c466-45d7-9efd-a718ef8ab723', NULL, NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '91b3e66a-8e13-4db1-b8ae-c6ff744f2f80', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('ad6107f1-14c7-4920-8133-decc3cc6608b', NULL, NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '5f777a32-ebda-435b-9e8a-62d0cf54f23b', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('e1cfb105-f248-47c2-adb9-0316dd22c0c9', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-28', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'e661afc9-0ffd-4f0b-b98d-c7312374f0c3', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('89042a8e-13a8-42c3-b78f-696feee13639', NULL, NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-28', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '1a8f63c5-e2a4-4aaa-8329-1dfdde6d07a3', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('09cdc231-f993-4f5a-8292-9af2e943e436', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-07-03', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '1bf2c54a-d048-4fe4-9a9b-9c6f17e82213', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('105ca96b-0372-41d7-ad4b-36dcda038b19', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-07-03', 'null', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, 'bf53fdba-7753-4984-a3ba-cf41dbbf587c', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('8f0a0833-cad2-4f3e-bacc-cb1bca7b8af5', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-07-03', 'dubai@pamcargo.com', NULL, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, '75aa9e0b-cf46-4d7c-9b59-5343b6c5f5bf', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('ddb01cb6-629e-4088-bd15-99f87296b1ec', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-08-07', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'ae60b96d-283c-468f-b15a-712ce5f88100', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('8bed97e1-10e5-4d59-9ddc-a2db41fa621a', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-08-07', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '635eca9c-f101-4711-bb96-814e9fe74d39', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('85fbd60a-4f54-43ea-9ae2-3f82cd51f3a9', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-08-07', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, 'de0c1081-1cb2-4e14-911f-9b37ce6b62c5', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('586c1163-0427-4493-99d8-d76483eb2af0', NULL, NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-06-27', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '6cdb134e-962f-4b21-9552-616a5a07cab7', 'null');
INSERT INTO "dxb"."operation_document" VALUES ('5536505d-869c-4dc8-b0ce-d4b482d0acf3', NULL, 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '2024-08-07', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, '5dd07fd4-7471-402f-85ce-3a656f0ac20e', 'null');

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
-- Records of order_document
-- ----------------------------
INSERT INTO "dxb"."order_document" VALUES ('b9e9afd5-db93-41f4-9559-fd1dd3f81fec', 'si_doc', '30102024/si_CTD-RGNSA2410005_(3)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('1b807bc4-0c16-494c-9d86-72419028afba', 'si_doc', '30102024/si_CTD-SRGSA2410016_(1)_DXBSE2410001_2.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('9235a498-2ef3-4211-a1e3-54676a8fe334', 'cft_doc', '30102024/cft_CTD-SRGSA2410016_(2)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('7dc11736-789e-49bb-ae30-09ee2410b88f', 'msds_doc', '30102024/msds_CTD-SRGSA2410016_(2)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('3ebf4c88-da24-4b2b-be5f-5848ab7f20f4', 'mawb_doc', '30102024/mawb_CTD-SRGSA2410016_(3)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('57afe4e9-51e3-4b60-8a86-c3a0c32b4b8f', 'com_invoices_doc', '30102024/com_invoices_CTD-SRGSA2410016_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('1f5983d9-3b12-4b03-a44a-6dfde6fdf232', 'com_invoices_doc', '30102024/com_invoices_CTD-SRGSA2410016_(2)_DXBSE2410001_2.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('5f6f0d15-276a-4df8-a877-3aa051a022ee', 'msds_doc', '30102024/msds_CTD-RGNSA2410005_(1)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('9b0d6ba8-8a8c-491d-8ab3-654482c8c3f2', 'ctd_doc', '30102024/ctd_CTD-SRGSA2410016_(2)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('ed91714d-e27f-42d5-afa5-9f6447042dc0', 'packing_list_doc', '30102024/packing_list_CTD-SRGSA2410016_(2)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('2f7b50cc-b4a4-4bbc-a5fb-9b282563ffe8', 'other_doc', '30102024/other_CTD-SRGSA2410016_(3)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('2c5c22be-1bac-4006-8632-10c1ea7efe1b', 'other_doc', '30102024/other_CTD-SRGSA2410016_(2)_DXBSE2410001_2.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('949a68e9-47e0-4fd5-af74-be792e4780aa', 'other_doc', '30102024/other_CTD-SRGSA2410016_(1)_DXBSE2410001_3.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('2e0c8f78-9315-4458-bbd5-795a036f831b', 'other_doc', '30102024/other_CTD-SRGSA2410016_DXBSE2410001_4.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('d62dbf02-fff7-44f6-9756-381ab1491c7f', 'cargo_manifest', '30102024/cargo_manifest_CTD-XMNSA2410001_(2)_DXBSE2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('c4718144-3614-400c-849a-f16f1f6818ee', 'cargo_manifest', '30102024/cargo_manifest_CTD-XMNSA2410001_(1)_DXBSE2410001_2.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('14ea1d6f-a590-4ff4-a086-058d1071ed6b', 'cargo_manifest', '30102024/cargo_manifest_CTD-XMNSA2410001_DXBSE2410001_3.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL);
INSERT INTO "dxb"."order_document" VALUES ('df5bd0db-a999-41e4-98ed-acdb62f7b4a7', 'com_invoices_doc', '31102024/com_invoices_msds_CTD-RGNSA2410005_(1)_DXBSE2410001_1.pdf_DXBTC2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', NULL);
INSERT INTO "dxb"."order_document" VALUES ('abfc236b-5bfa-4ae0-8a34-929cbe211618', 'si_doc', '31102024/si_CTD-SRGSA2410016_(2)_DXBTC2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', NULL);
INSERT INTO "dxb"."order_document" VALUES ('f0d50045-006c-4d80-a3f0-fa8157a9248d', 'packing_list_doc', '31102024/packing_list_msds_CTD-RGNSA2410005_(1)_DXBSE2410001_1.pdf_DXBSI2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL);
INSERT INTO "dxb"."order_document" VALUES ('13a08343-6e94-4367-8a8b-810789886129', 'msds_doc', '31102024/msds_CTD-RGNSA2410005_(3)_DXBSI2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL);
INSERT INTO "dxb"."order_document" VALUES ('e2d2a694-35e7-4286-a81d-3f9f424d0f26', 'cft_doc', '31102024/cft_CTD-SRGSA2410016_DXBSI2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL);
INSERT INTO "dxb"."order_document" VALUES ('87ea5ed8-0bf5-455c-b1ad-26756844253f', 'ctd_doc', '31102024/ctd_msds_CTD-RGNSA2410005_(3)_DXBSI2410001_1.pdf_DXBWH2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '3', '38d691ab-a093-4134-be2e-4f84ef05dde5', NULL);
INSERT INTO "dxb"."order_document" VALUES ('a68eba10-460b-4d94-b81c-50fcbce44f99', 'coo_doc', '31102024/coo_msds_CTD-RGNSA2410005_(3)_DXBSI2410001_1.pdf_DXBWH2410001_1.pdf', NULL, NULL, 'thomas@pamcargo.com', NULL, '1', '38d691ab-a093-4134-be2e-4f84ef05dde5', NULL);

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
-- Records of schedule_vessel
-- ----------------------------
INSERT INTO "dxb"."schedule_vessel" VALUES ('136ffd85-5160-4cc0-ac57-a727ada87358', NULL, 'EUROPE', NULL, 'CSCL GLOBE', '123456789', '2024-10-31', '2024-10-22', '2024-10-21', '2024-10-22', '123', '2024-10-31', NULL, '2024-10-21 00:00:00', 'operations@pamcargo.com', '2024-10-21 16:18:12.366866', NULL, 1, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', 229, 'ABU DHABI', 'BUSAN', 'UNITED ARAB EMIRATES');
INSERT INTO "dxb"."schedule_vessel" VALUES ('10ce5303-f46d-4c63-b0b8-029948a5604c', NULL, 'US/CANADA', NULL, 'SAN LORENZO', 'FLYINGDUTCHMAN', '2024-11-01', '2024-10-31', '2024-11-01', '2024-11-01', '12', '2024-11-02', '12', '2024-10-29 00:00:00', 'thomas@pamcargo.com', '2024-10-29 16:46:59.527682', NULL, 1, '5fcd3c4f-7f61-48ab-a6a3-29751ee994c7', 229, 'JEBEL ALI', 'LOS ANGELES', 'UNITED ARAB EMIRATES');

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
-- Records of shipping_instruction
-- ----------------------------
INSERT INTO "dxb"."shipping_instruction" VALUES ('52668d09-c09d-4d5e-b922-ee5ceb9f133c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'FCL', NULL, NULL, NULL, NULL, 'Picked up by courier', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jakarta', 'Semarang', NULL, NULL, 'DXBCO7001001', 1, '2024-10-21 13:52:50.591503', 'thomas@pamcargo.com', '2024-10-21 13:52:50.591503', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', '232233', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('5a19eaf1-23e4-4515-807e-b52774b985b8', '6812bd03-a528-438b-ab89-0c01927a3da9', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'FCL', 'Collect', 'EXW', 'Tes 1234567789', NULL, 'Cargo Airlifted', '2024-10-28', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABERDEEN', 'ABERDEEN', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAI2410001', 1, '2024-10-28 11:16:52.8427', 'dubai@pamcargo.com', '2024-10-29 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6e4821cf-169b-4dcc-9115-86d1a60073ed', '5acfbe3c-f97a-4d1e-aa4b-ed0efb4016ae', '3034c08d-a7b8-462e-b5c8-d88125a18755', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, '2024-10-29', NULL, 'WAREHOUSE', 'FCL', 'Collect', 'EXW', NULL, '2024-10-30', 'Booking Confirmed', '2024-10-31', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'WELDING GROUP SAMARA LLC', 'DZERJINSKOGO STR
46D SAMARA 443070 SAMARSKAYA OBLAST
RUSSIA
TEL: +7 909 604 14 49
Email: tatyana.mavrinkaya@gcvep.ru', 'PAM INTERNATIONAL CARGO LLC', 'OFFICE 813, AL FATTAN PLAZA
AIRPORT ROAD, AL GARHOUD
DUBAI, U.A.E
TEL: +971 4 2852520', NULL, 'DXB', 'JEBEL ALI', NULL, NULL, 'DXBWH2410002', 1, '2024-10-29 10:41:14.987562', 'dubai@pamcargo.com', '2024-10-29 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 1, 'ae4d0dda-a0cf-417c-9aae-04ccd23b0a84', 'HERPORT', '33c5d04b-0b92-4b7c-a392-73bb886db5fe', 'FOOM ETC', NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('f8e943ae-2d78-45b6-bc0f-f04eb21ef740', '1226cd4e-8280-4475-9beb-a65d7179d487', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', '95968342-6317-40b1-a513-7bbcfdef5b96', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'In Transit to other port', '2024-10-22', '2024-10-22', '2024-10-31', 'DUBAI', 'SEAIMPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'BAIE D''URFé', 'BAIE D''URFé', 'ABBOT POINT', 'CSCL GLOBE', NULL, 'DXBSI2410002', 1, '2024-10-21 15:51:34.807495', 'dubai@pamcargo.com', '2024-10-28 00:00:00', NULL, '2024-10-31', '123456789', NULL, '2024-10-22', '04118885-1e24-41ed-9c7c-dae53ee68fe8', NULL, 11, '2024-10-22', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 1, 'bf730ac2-efaa-4028-8cb6-95625996e726', 'BHB FASHION SERVICE GMBH', 'f5a7e244-31c7-4bde-9939-55072e48a2c8', 'Mulyono bin Slamet', '<p>Indonesia</p>', NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', '63a1f8b9-3112-43b7-ae76-91893f7c9d9b', 'aa67f617-efe6-44ed-9d6d-a35ae8c20218', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, '2024-10-29', NULL, 'TRUCKING', 'FCL', 'Collect', 'EXW', NULL, '2024-10-30', 'Booking Received', '2024-10-30', NULL, NULL, 'DUBAI', 'TRUCKING', 'WGS MIDDLE EAST FZ LLC', 'AL JAZEERA AL HAMARA INDUSTRIAL ZONE SHED 19-09', 'UNIGRAF LLC', 'BADER AL QABANDI WAREHOUSE 29
DUBAI INVESTMENT PARK-1
DUBAI, UAE', NULL, 'KALIBATA', 'PANCORAN', NULL, NULL, 'DXBTC2410001', 1, '2024-10-29 14:48:41.473082', 'dubai@pamcargo.com', '2024-10-29 14:48:41.473082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 1, 'bf730ac2-efaa-4028-8cb6-95625996e726', 'BHB FASHION SERVICE GMBH', 'aab15850-4c19-43d1-a525-043c901931b6', 'PT. Perusahaan Tukang', NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('cc0ddd3d-89a1-4283-9194-24a0b0eb6389', 'c87ff41c-e06d-4fe3-919d-4c2b52d1a380', '8f3acd59-02b0-4119-9d5a-d2a00e5fcb5d', '533219ad-bfa1-4cf6-87f9-fce85748a647', '4b11aace-fafc-4d64-9495-345a47cd57e0', '0abdb950-0405-438e-ae1d-2a29e0fcf24c', NULL, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', '123', '2024-10-29', NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CIF', NULL, '2024-10-29', 'Booking Received', '2024-10-22', '2024-10-22', NULL, 'DUBAI', 'SEAIMPORT', 'INTELLIGENTS UK', 'UNIT D3 PHOENIX PARK VINEGAR HILL
HATCH SANDY
BEDFORDSHIRE,SG19 1PR
GB,TL:+447510870787', 'JIANGXI ZHICUHU BAMBOO AND WOOD', 'SECOND FLOOR BUILDING C4 330000 NANCHANG JIANG', 'JAKARTA', 'JAKARTA', 'LOS ANGELES', 'CSCL GLOBE', NULL, 'DXBSI2410003', 1, '2024-10-29 10:03:07.118568', 'dubai@pamcargo.com', '2024-10-29 00:00:00', NULL, NULL, '123456789', NULL, '2024-10-22', '04118885-1e24-41ed-9c7c-dae53ee68fe8', NULL, 1, '2024-10-22', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 1, 'b94cb759-d2e1-4740-a3b6-2049b77a1fd3', 'UHLSPORT GMBH', 'aab15850-4c19-43d1-a525-043c901931b6', 'PT. Perusahaan Tukang', NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2f34a1b1-b647-456b-88ec-d02962d04b16', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', '33a4b77d-792e-4498-9439-c10506695992', NULL, 'c8f148db-e9e3-4df8-9e6e-fce1fd4da075', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Vessel Departed', '2024-10-22', '2024-10-22', NULL, 'DUBAI', 'SEAIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ABU DHABI', 'CSCL GLOBE', NULL, 'DXBSI2410001', 1, '2024-10-21 14:02:54.019696', 'dubai@pamcargo.com', '2024-10-28 00:00:00', NULL, NULL, '123456789', NULL, '2024-10-22', '04118885-1e24-41ed-9c7c-dae53ee68fe8', NULL, 9, '2024-10-22', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('1cd2eaa9-ba27-4bec-a790-027610447cc7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'FCL', NULL, NULL, NULL, NULL, 'Picked up by courier', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jalan Kalibata', 'Pancoran', NULL, NULL, 'DXBCO7001002', 1, '2024-10-29 14:42:04.997794', 'thomas@pamcargo.com', '2024-10-29 14:42:04.997794', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', '1263712351', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('73321db0-997a-418a-8a4d-ee71f04bc8c8', '553a2151-8cd0-420f-80c5-c90203caa630', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Booking Received', '2024-10-29', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'ABIDJAN', 'ABIDJAN', 'AARHUS', NULL, NULL, 'DXBAI2410003', 1, '2024-10-29 15:31:08.016824', 'dubai@pamcargo.com', '2024-10-29 15:31:08.016824', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 1, '3a3201c6-f3a3-4235-a420-05249ed0e06e', 'OSPIG GMBH AND CO.KG', '33c5d04b-0b92-4b7c-a392-73bb886db5fe', 'FOOM ETC', NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('226dd33d-0f65-4e2f-8601-1080143bb0f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'FCL', NULL, NULL, NULL, NULL, 'In Transit', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jakarta', 'Surabaya', NULL, NULL, 'DXBCO', 1, '2024-10-30 13:59:36.735043', 'thomas@pamcargo.com', '2024-10-30 00:00:00', 'thomas@pamcargo.com', NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'B12412', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', '553a2151-8cd0-420f-80c5-c90203caa630', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'FCL', 'Prepaid', 'CIF', NULL, NULL, 'Booking Confirmed', '2024-10-29', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABERDEEN', 'ABERDEEN', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAI2410002', 1, '2024-10-29 15:26:28.916571', 'dubai@pamcargo.com', '2024-10-29 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 1, 'bf730ac2-efaa-4028-8cb6-95625996e726', 'BHB FASHION SERVICE GMBH', 'f5a7e244-31c7-4bde-9939-55072e48a2c8', 'Mulyono bin Slamet', NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('0211ca52-7c9a-4003-9623-0be52855cb6a', '1226cd4e-8280-4475-9beb-a65d7179d487', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', '8b396746-5a30-4e39-84a4-89185a1ea96c', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Prepaid', 'CFR', 'TEST 12345', NULL, 'Loading Completed', '2024-10-26', NULL, NULL, 'SINGAPORE', 'SEAEXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABBOT POINT', 'ABBOT POINT', 'ABERDEEN', NULL, NULL, 'DXBSE2410001', 1, '2024-10-22 10:31:57.244835', 'dubai@pamcargo.com', '2024-10-29 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3e7352d5-854d-4367-a7dd-a14a895b0aa7', '1226cd4e-8280-4475-9beb-a65d7179d487', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Booking Received', '2024-10-29', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABBOT POINT', 'ABBOT POINT', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAE2410001', 1, '2024-10-29 15:52:35.725978', 'dubai@pamcargo.com', '2024-10-29 15:52:35.725978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('38d691ab-a093-4134-be2e-4f84ef05dde5', '6812bd03-a528-438b-ab89-0c01927a3da9', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Prepaid', 'CPT', NULL, NULL, 'Booking Confirmed', '2024-10-28', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', NULL, 'JAKARTA', 'SURABAYA', NULL, NULL, 'DXBWH2410001', 1, '2024-10-28 09:56:43.294385', 'dubai@pamcargo.com', '2024-10-28 09:56:43.294385', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'FCL', NULL, NULL, NULL, NULL, 'In Transit', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'EGYPT', 'JAPAN', NULL, NULL, 'DXBCO', 1, '2024-10-29 15:06:43.490749', 'thomas@pamcargo.com', '2024-10-29 00:00:00', 'thomas@pamcargo.com', NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'B4122', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('c2c95c41-caa7-437e-b2e7-8fc3bea08038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'LCL', NULL, NULL, NULL, NULL, 'Booking Received', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jakarta', 'Japan', NULL, NULL, 'DXBCO', 1, '2024-10-30 14:14:08.015565', 'thomas@pamcargo.com', '2024-10-30 00:00:00', 'thomas@pamcargo.com', NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'CTN1512412', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction" VALUES ('a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'LCL', NULL, NULL, NULL, NULL, 'In Transit', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'Jakarta Kalibata', 'India China', NULL, NULL, 'DXBCO7001003', 1, '2024-10-30 14:16:16.201038', 'thomas@pamcargo.com', '2024-10-30 00:00:00', 'thomas@pamcargo.com', NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'COURIER', 'CTN1412512', 1, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Records of shipping_instruction_detail
-- ----------------------------
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2f34a1b1-b647-456b-88ec-d02962d04b16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('f8e943ae-2d78-45b6-bc0f-f04eb21ef740', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('0211ca52-7c9a-4003-9623-0be52855cb6a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('38d691ab-a093-4134-be2e-4f84ef05dde5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('5a19eaf1-23e4-4515-807e-b52774b985b8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('cc0ddd3d-89a1-4283-9194-24a0b0eb6389', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6e4821cf-169b-4dcc-9115-86d1a60073ed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('73321db0-997a-418a-8a4d-ee71f04bc8c8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3e7352d5-854d-4367-a7dd-a14a895b0aa7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('226dd33d-0f65-4e2f-8601-1080143bb0f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('c2c95c41-caa7-437e-b2e7-8fc3bea08038', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Records of si_order
-- ----------------------------
INSERT INTO "dxb"."si_order" VALUES ('df9195ab-20ab-452f-be73-83bb995778fa', '52668d09-c09d-4d5e-b922-ee5ceb9f133c', 123, 'PCS', NULL, 123, 228.887, 'TESSA', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('ff9104be-cf3a-4ea8-934f-0ad681158db4', '2f34a1b1-b647-456b-88ec-d02962d04b16', 123, 'CARTON', NULL, 123, 228.887, 'GOODS', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('b0a0c26a-3fbb-4638-b1d7-902c8f0940ad', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', 100, 'CARTON', NULL, 100, 100, 'tes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16666, 16666, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('1f9d8e40-0331-4719-b429-925d372f3752', '0211ca52-7c9a-4003-9623-0be52855cb6a', 100, 'CARTON', NULL, 10, 2, 'Testing new shipment localbusiness', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 333.5, 333.32, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('5d933eb2-8739-403b-a465-350a59f0965c', '5a19eaf1-23e4-4515-807e-b52774b985b8', 123, 'CARTON', NULL, 123, 228.887, 'Desc', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('a85907be-25a4-4b0a-b99f-7db2e91e3f26', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389', 200, 'CARTON', NULL, 2000, 1.6, 'test data', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2000, 266.656, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('5bb0c861-d754-4b5f-ab8c-c9186df8237f', '6e4821cf-169b-4dcc-9115-86d1a60073ed', 100, 'CARTON', NULL, 1200, 100, 'Shoes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 'Berangkat jam 12', '29102024/si_doc - 291020241730174615.pdf', '29102024/com_invoices_doc - 291020241730174473.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16666, 16666, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('d580a032-8f54-4146-a5ab-16e0de8bca49', '1cd2eaa9-ba27-4bec-a790-027610447cc7', 1200, 'CARTON', NULL, 1200, 1.2, 'Barang Rahasia', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 199.992, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('2d507425-e3b1-40d5-8d8a-f145acc3f661', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', 10, 'CARTON', NULL, 1500, 10, 'Men Shoes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1667, 1666.6, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('fa6844ba-2b2f-4c76-9746-50c696f4abea', '6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', 123, 'CARTON', NULL, 123, 228.887, 'TES', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('64f5ab3c-ab6f-40d0-82c7-5026cc2c1820', '29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', 23, 'BOX', NULL, 123, 0.004, 'tes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, 0.666, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('219b3a7f-6f3e-4917-8c78-dcef85de2568', '73321db0-997a-418a-8a4d-ee71f04bc8c8', 11, 'CARTON', NULL, 55, 0.015, 'tes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, 2.499, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('7a04bd7d-271e-4c4c-be83-c6656306b04a', '3e7352d5-854d-4367-a7dd-a14a895b0aa7', 123, 'BOX', NULL, 123, 228.887, 'Tes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('31f17ab6-892f-4cf3-8415-580086f57271', '38d691ab-a093-4134-be2e-4f84ef05dde5', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('f080855a-def6-4cd1-973f-70c9797b0ed6', '226dd33d-0f65-4e2f-8601-1080143bb0f0', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('c8b12f4f-2737-4b84-9cf4-65d228397c33', 'c2c95c41-caa7-437e-b2e7-8fc3bea08038', 123, 'CARTON', NULL, 123, 228.887, 'Goods', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38146.5, 38146.307, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('bde0f10c-2726-45a9-b26f-af0f22d4af7c', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', 44, 'BOX', NULL, 444, 3.748, 'Tes', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 625, 624.641, NULL, NULL);

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
-- Records of si_order_detail
-- ----------------------------
INSERT INTO "dxb"."si_order_detail" VALUES ('b32f0c6f-6d32-49a1-9785-ca1328e3e453', '52668d09-c09d-4d5e-b922-ee5ceb9f133c', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('f61fdd6d-ae0a-41ea-ad58-fa2f0fa575ea', '2f34a1b1-b647-456b-88ec-d02962d04b16', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('fab68f59-8671-4e43-9968-b1ab52321080', 'f8e943ae-2d78-45b6-bc0f-f04eb21ef740', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('c6e6ab72-1916-4837-bd89-1753f4f63825', '0211ca52-7c9a-4003-9623-0be52855cb6a', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('5209df96-cc46-46e4-b1e3-6dc823aa7917', '5a19eaf1-23e4-4515-807e-b52774b985b8', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('cfa5a4dc-ac79-4634-ae42-83045098cd85', 'cc0ddd3d-89a1-4283-9194-24a0b0eb6389', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('c7385b2e-b5b4-481b-b999-1739c808143c', '6e4821cf-169b-4dcc-9115-86d1a60073ed', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('76d0249e-9e28-4682-bb7c-3e5663a531bd', '1cd2eaa9-ba27-4bec-a790-027610447cc7', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('bd1a088c-9a98-4739-8b1f-a807610d7366', 'e9a82d7f-0ccf-4323-99e5-e1f9c3e16e0b', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('f5fa1686-d1f8-41f3-9256-a179c885b694', '6c3d38d4-f2eb-4652-b1ee-9229bb2676eb', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('c6d2c9c9-056d-465a-b226-4cf8c70733b8', '29f6a3fd-8a22-4dfd-9212-de4eaf9ccf47', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('a40f3172-8d18-43df-a3cf-f7888ebb2e16', '73321db0-997a-418a-8a4d-ee71f04bc8c8', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2a6359ca-feb8-498b-8cd2-fedcb889b8df', '3e7352d5-854d-4367-a7dd-a14a895b0aa7', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('e502f474-fadb-4b2c-b4be-6927bd0f5f76', 'c2c95c41-caa7-437e-b2e7-8fc3bea08038', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('19755a26-1f6e-49a2-b18c-a7aa65c283e0', 'a5bd22c7-c19b-4253-9eb7-64ce65a8c3be', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);

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
