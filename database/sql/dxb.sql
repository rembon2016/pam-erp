/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : dxb

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:11:09
*/


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
  "currency" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of agreed_rate
-- ----------------------------
INSERT INTO "dxb"."agreed_rate" VALUES ('2bca96ce-f015-4a3f-8d00-882918db233f', 'FRC', 'Freight Rate Collect', '9ee103fb-66b7-4409-888c-a4ae40d6d69a', NULL, NULL, 'dubai@pamcargo.com', NULL, 'e4489011-13f6-4d21-bb04-cf38ea2df4d6', 3.73, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('924cdc7d-ab1f-4e3e-91a3-3bcfe6220745', 'EXW', 'EXW', '9f10b274-877e-46bc-b419-9db0af6fb0e3', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 6736.60, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('928f4eaa-7f9d-405b-85b9-a7cf2133a1e5', 'DDC', 'Door Delivery Charges', '9a4d2d76-8fe1-4985-8a55-8a463039fca7', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 120.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d742ad4c-87f7-46e5-9a31-4a8f5999ca55', 'DDC', 'Door Delivery Charges', '67a495c2-b30c-4e3c-baba-2602cbb3c42f', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 520.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('e781e2f3-8311-402a-ad26-83c5ccbad202', 'DDC', 'Door Delivery Charges', 'e72465c6-7d1f-4e63-9504-770020f8693b', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 560.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('c0849079-2d6f-4464-a00c-9843f4feb494', 'EXW', 'EXW', 'dbb60074-7fc8-4a9f-81ae-d07ee88ea2b0', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 1.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('f3e5f0ef-59e1-47c5-8748-f17ed5dfedfe', 'DDC', 'Door Delivery Charges', '54d6c107-7c02-4ae6-a916-322dcb2a8222', NULL, NULL, 'dubai@pamcargo.com', NULL, 'c1677fd9-a704-4169-8994-4b25932b9579', 1005.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('c14cf19a-9a4e-4630-bdc0-b8c455a570c4', 'FRP', 'Freight Rate Prepaid', 'ca1e6202-587a-4326-94cf-d3e161a273fa', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('1de3b975-5c73-40c1-be3a-41ba8d9f43c3', 'FRP', 'Freight Rate Prepaid', '912bd056-3711-487a-a1d5-a884046fc254', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('1c87e00d-6a10-4942-8ba1-6becf2559c64', 'FRP', 'Freight Rate Prepaid', '41ccf845-9e64-4efb-859d-15395753657d', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('51170f91-50b3-404c-aa07-f27ff7dbd2a4', 'HF', 'Handling Fee', '39393fac-4390-4a21-ae1c-49d9eeb12671', NULL, NULL, 'dubai@pamcargo.com', NULL, 'a121a634-3278-4118-92fe-8d737d079e8b', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('62089f22-e241-45f0-be94-4a5609907a3a', 'EXW', 'EXW', '6ea5972e-7192-491b-b67b-1716a88eecb6', NULL, NULL, 'dubai@pamcargo.com', NULL, '7d52dff5-e06f-4a82-a562-ad2330068eac', 1.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5f5522f9-469f-43b4-a9e0-42c3dd0f44e0', 'FRP', 'Freight Rate Prepaid', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d561d18e-11a5-476a-9ef3-d78d243e6345', 'FRP', 'Freight Rate Prepaid', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5d961c3f-2f1e-46fc-9fd6-70b9853f4710', 'HF', 'Handling Fee', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', NULL, NULL, 'dubai@pamcargo.com', NULL, 'a121a634-3278-4118-92fe-8d737d079e8b', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('5a02f4a1-cf65-44f7-b5b2-4f7c2587a3de', 'FRP', 'Freight Rate Prepaid', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('d088a43d-4074-4e35-bebb-c4f8ab51ba29', 'FRP', 'Freight Rate Prepaid', '3217d8fb-8c52-445d-a870-ac91a6d33135', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('85fa2556-ac3f-4727-83b2-9d755afd793b', 'FRP', 'Freight Rate Prepaid', 'b34f807d-0526-442f-8b25-a1134de5ab21', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('eb25ebed-cf0b-48d5-a8a1-2c0178d3e964', 'FRP', 'Freight Rate Prepaid', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);
INSERT INTO "dxb"."agreed_rate" VALUES ('3dbbefc4-eb3f-4368-aec8-1878004c059f', 'FRP', 'Freight Rate Prepaid', '6637d456-b568-452c-bf72-61f3afb3ddc1', NULL, NULL, 'dubai@pamcargo.com', NULL, '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 10.00, NULL);

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

-- ----------------------------
-- Table structure for courir_shipment_mode
-- ----------------------------
DROP TABLE IF EXISTS "dxb"."courir_shipment_mode";
CREATE TABLE "dxb"."courir_shipment_mode" (
  "id" int4 NOT NULL,
  "shipment_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of courir_shipment_mode
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
  "status_id" int8
)
;

-- ----------------------------
-- Records of histori_job
-- ----------------------------
INSERT INTO "dxb"."histori_job" VALUES ('2929f8da-6166-47a1-89a1-710dbaa1c64b', '41e8e812-7143-455f-9fdf-0db22139a3b9', 'Booking Received', 'ABERDEEN', '2024-05-24 10:17:02', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9243f936-54c4-4ed2-8070-8f2fc63e9d14', 'ab49df81-a7ed-4d0d-b519-7c3e976ca013', 'Booking Received', 'ABURATSU', '2024-05-24 10:18:44', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('ce582ca3-e7a9-407e-b999-dad44e964780', '352b8464-7bc5-47a5-afce-07d6e052e360', 'Booking Received', 'ABADAN', '2024-05-24 10:20:13', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('065ee8c3-bef7-4214-8345-abc44ae91b19', '9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', 'Booking Received', 'ÅBO (TURKU)', '2024-05-24 10:33:09', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('43fee943-85e8-4cc5-883e-5ec282e9c635', '365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', 'Booking Received', 'RIO HAINA', '2024-05-24 10:35:17', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('b2ba7f89-918f-498a-821e-0a681c160452', '2f4b6724-4980-484c-8faf-58f24439a47f', 'Booking Received', 'AARHUS', '2024-05-24 10:37:07', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('f2dcbfa1-f6b9-4d3b-9e13-8c12ada35630', 'c17e7a19-95e1-4a91-898d-5d3c238003f9', 'Booking Received', 'DUBAI', '2024-05-24 10:39:04', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('655138aa-edc0-465b-8206-cb10c19e56ab', '3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', 'Booking Received', 'DUBAI', '2024-05-24 10:40:14', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('dc41f156-bb2e-4656-846f-857c77075b5b', '6c8e8768-46b2-4209-ba8e-b03bc2c60113', 'Booking Received', 'ABERDEEN', '2024-05-27 03:11:33', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('86d51e9f-4e16-4c74-92f3-94db57d02fa7', '410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', 'Booking Received', 'ABURATSU', '2024-05-27 03:57:04', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('df56e2c4-b0d0-4098-b6e3-1eddd2aed2e3', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', 'Booking Received', 'CASABLANCA', '2024-05-27 04:09:16', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('a5782219-920f-4e8c-ac53-503dbb613cfe', '69a5a94b-b7c5-405c-9d43-dd81280eae75', 'Booking Received', 'DUBAI', '2024-05-30 07:07:06', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('ec51090e-2713-4b9b-bcd9-a724c0dc4154', 'd3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', 'Booking Received', 'ABU DHABI', '2024-06-04 02:42:24', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('6ecea624-8082-4c97-9fe6-e1300c4e9a7e', '8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', 'Booking Received', 'ABIDJAN', '2024-06-04 02:43:51', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('2a3c5cbd-9d89-43e0-b6ba-e03b0596f984', '6bcccf97-9c8d-4373-bde9-076a0caa0436', 'Booking Received', 'ABIDJAN', '2024-06-04 02:45:38', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('0483962f-5ba5-4f01-80b7-8150f4ea4efe', '4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', 'Booking Received', 'ABU DHABI', '2024-06-04 02:47:23', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('2eaac3aa-2f4c-45dc-8c35-a92bba068b31', '6ab1464a-5895-41eb-b67c-19dd743c27f4', 'Booking Received', 'ABERDEEN', '2024-06-04 02:49:11', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('e1c0b1e6-2f36-4058-8075-f019c2e7f218', '56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', 'Booking Received', 'ABIDJAN', '2024-06-04 02:50:49', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9e332e5f-82b2-4678-a215-d6a1bbf594a2', '3117a224-6a04-458c-a624-f2a7f2037f56', 'Booking Received', 'ABIDJAN', '2024-06-04 02:52:46', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9872ce6e-1c3a-469e-a9ef-5d570eb33d0c', 'ca1e6202-587a-4326-94cf-d3e161a273fa', 'Booking Received', 'ABERDEEN', '2024-06-04 02:54:38', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('f8608460-e350-436e-a067-76316892ccc0', '53d59b90-626c-4af8-a858-651186572d91', 'Booking Received', 'ÅGOTNES', '2024-06-04 02:57:21', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('dc1da801-26d6-44f1-9b6b-f712bd811aef', '6d9d4ea7-8547-4a76-93ba-f2fe31892701', 'Booking Received', 'ABERDEEN', '2024-06-04 03:01:28', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('140aa84e-9785-4113-b884-750653276a8b', '0095a867-c7cd-480d-93f5-c12e61a8c7da', 'Booking Received', 'ABIDJAN', '2024-06-04 03:02:44', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('ae907cf5-81cb-473c-9f38-dfd7355ad381', '4de4babe-69d0-430a-8923-b8764a925ed0', 'Booking Received', 'ABU DHABI', '2024-06-04 03:04:06', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('ca0f99db-71e2-47a4-9745-70bba9033858', 'a1d653c3-f716-4ce3-8469-6af1173ef79b', 'Booking Received', 'ÅBO (TURKU)', '2024-06-04 03:07:06', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('31b42dc4-bf5c-4e10-9718-342f7db48484', 'd54a473d-38f7-4df6-bc03-2ec06088d880', 'Booking Received', 'ABIDJAN', '2024-06-04 03:09:25', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9f6c0989-332f-407d-a38e-ee0b9ded10ca', '40c393f6-a567-46f9-9b33-46774d70c484', 'Booking Received', 'ABURATSU', '2024-06-04 03:13:00', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('1a876e0f-ca20-4844-a5a2-780bffaa6c72', '2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', 'Booking Received', 'ABU DHABI', '2024-06-04 03:14:27', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('a5d7042f-03e2-4a57-b40b-2533b0b4402a', '07af919c-2586-452e-b021-c6de8a3c83a1', 'Booking Received', 'ABIDJAN', '2024-06-04 03:15:34', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9f004ce3-eb83-4b71-8f73-32553ba94dfe', '39393fac-4390-4a21-ae1c-49d9eeb12671', 'Booking Received', 'ÅBO (TURKU)', '2024-06-04 03:17:06', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('35b613c5-da30-4b9e-ae6a-c66bd488d894', 'b01f25e8-fed4-4190-87c1-640d6a084b7c', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-04 03:19:29', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('a67cb5df-b9cb-416d-9c9f-fc39ddec2f3f', 'a0df10f1-6174-4dd5-adda-afc69cbdddd1', 'Booking Received', 'ABADAN', '2024-06-04 03:21:21', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('e7c935ba-cd46-46e0-b966-7d4e3618dfa0', 'b053010e-4219-43a6-a56d-b292f39e25c5', 'Booking Received', 'AARHUS', '2024-06-04 03:23:15', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('a581e4d7-b9cd-4f50-a837-f6de3a83f41f', 'eda254dc-bb8a-4800-a014-8330dbf0975b', 'Booking Received', 'AARHUS', '2024-06-04 03:25:14', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('46473853-0115-4f68-a2c2-a777b76053fb', 'b4bedcef-ea49-42e9-b3be-da59c36e166e', 'Booking Received', 'AARHUS', '2024-06-04 03:27:33', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('cb90230f-e71d-4c90-9b0e-442bc7bfe358', '8923a3a6-109d-47e6-b7fa-f860c5eabe3d', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-04 03:29:21', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('1156b50e-705a-4ec9-9695-3f367ce577a1', '4fefff4e-e463-4393-b5a6-6c7f1f7ef265', 'Booking Received', 'ABHA', '2024-06-04 03:30:58', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('c708a11e-27d4-4bda-a6b5-bff4bf59be2f', 'c8687520-d7c8-4058-997c-961c713c18aa', 'Booking Received', 'AGANA', '2024-06-04 03:32:34', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('c58d1158-d4f1-469b-9e66-fedffdf50a2c', '6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-04 03:34:04', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('a4820af5-7e97-4fe0-ba3f-7f5e85d76c33', '1b811059-ca80-4603-855e-86f9890a1805', 'Booking Received', 'AARHUS', '2024-06-04 03:35:43', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('d21183ca-391b-4bbf-81c1-e7d194aafcdf', '912bd056-3711-487a-a1d5-a884046fc254', 'Booking Received', 'ABBEVILLE', '2024-06-04 03:37:00', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('97a6bf89-73c2-4001-a790-e8d1b304c9d8', 'fe033103-040c-468f-91d8-cb934482c594', 'Booking Received', 'AARHUS', '2024-06-04 03:39:03', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('0eb80bcc-5877-4766-92d0-0f283c8d25e7', '10f6d5dc-d708-4351-a1e3-35c62cfdc76c', 'Booking Received', 'AARHUS', '2024-06-04 03:40:28', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('9624b543-9571-4529-b18f-556419417a91', '677a92fe-283a-4518-a2d5-705feac53126', 'Booking Received', 'AARHUS', '2024-06-04 03:43:05', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('68ac193c-5e2b-47a5-a74a-81883cb6ff6c', '815a6c7a-38da-4598-b246-ce426cf58737', 'Booking Received', 'AALBORG', '2024-06-04 03:45:03', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('1afb0cca-0448-49e8-aec2-f21c39d1cbb7', '08052673-0558-49ee-abb9-80f127ff8ac2', 'Booking Received', 'ABU DHABI', '2024-06-04 03:46:27', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('2201e7d5-5dd9-48ed-aed0-1fd533f5d4ed', '2468ea51-4c64-4bf9-816b-daf2c07d1aa6', 'Booking Received', 'ABAKAN', '2024-06-04 03:48:06', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('7ab8fb8a-44b5-4ab3-b078-ba201eef360e', '6bd85111-f46b-465f-8cb4-d1cdedad6da7', 'Booking Received', 'AARHUS', '2024-06-04 03:49:56', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('fae20bc0-a5b3-4266-a333-08685ad3601e', '52fd6c66-4dd5-430c-bfde-7491110dab24', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-04 03:51:32', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('20f6b11a-3996-4261-83e7-39d87c3eb9c0', '2412c9de-563d-4fed-8ac8-73e780621984', 'Booking Received', 'AARHUS', '2024-06-04 03:52:59', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('22c8f580-5d65-40b6-8ab4-41c972d3267b', '09b7d475-b92c-43ca-87c6-e7ec070848e9', 'Booking Received', 'AALBORG', '2024-06-04 03:54:10', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('79f85496-4ea5-4607-9259-43ffac1ee055', 'bb619a92-9823-42a0-8466-7a60d7d21446', 'Booking Received', 'DUBAI', '2024-06-04 04:20:25', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('5b76999d-4a8f-495a-9ab9-5f0f16594491', '3c244936-60ba-4c50-a230-51ea58cd9427', 'Booking Received', 'DUBAI', '2024-06-04 04:22:09', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('170fee21-f5ae-43de-8f42-44149cc11c0e', 'abd29adf-78e7-48db-85c0-b346c8f3808e', 'Booking Received', 'DUBAI', '2024-06-04 06:25:10', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('c9eaeeec-9371-4ab7-9aeb-33e4f5077ab4', '48a6111b-9244-4ea0-8c07-2350db07254d', 'Booking Received', 'DUBAI', '2024-06-04 06:26:24', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('83ad1221-e6a6-4681-be2d-6582901f276e', 'a2e2282f-d196-4ba0-ad88-3e04b388b0de', 'Booking Received', 'DUBAI', '2024-06-04 06:27:52', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('f8fd0b38-530d-4b20-b14a-0e371c1c370b', '3b848e3a-f9b1-4944-895e-f6a83f034bef', 'Booking Received', 'DUBAI', '2024-06-04 06:28:55', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('50644bcd-5b9f-4e0a-ba88-9dddc5086c91', 'abe1cc11-8667-4b0b-b9c6-a79272575402', 'Booking Received', 'DUBAI', '2024-06-04 06:30:47', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('f15facac-469b-4917-bed0-c0bda0e27b79', '2088a818-0433-45b7-9110-1dbae3b9a9b9', 'Booking Received', 'DUBAI', '2024-06-04 06:32:14', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('057df6f5-88b0-40d7-8baf-0aa03b164674', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', 'Booking Received', 'ABBOT POINT', '2024-06-10 09:51:52', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('ef5bc7fb-c18c-4cee-8bd6-8d59255ec6fb', '41ccf845-9e64-4efb-859d-15395753657d', 'Booking Received', 'ABIDJAN', '2024-06-11 03:35:35', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('2cc973aa-b99f-4ea1-b22e-c5bffeeeb96b', '3e9d64c1-1587-422c-b74f-49559eec819e', 'Booking Received', 'ABERDEEN', '2024-06-11 04:05:37', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('496cec6a-1dae-40cd-829c-a05ca9f45948', 'b34f807d-0526-442f-8b25-a1134de5ab21', 'Booking Received', 'ÅBO (TURKU)', '2024-06-11 04:43:58', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('b7d0214a-3235-49b6-9c29-9894e46d52a1', '6ea5972e-7192-491b-b67b-1716a88eecb6', 'Booking Received', 'ABAKAN', '2024-06-11 04:52:32', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('321f91a6-9fe7-4bd5-8e1a-183313d7cdf2', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-11 05:03:23', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('517edb69-952b-4985-9133-29496dccbd5e', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', 'Booking Received', 'DUBAI', '2024-06-11 06:19:18', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('1f855ddd-dd61-4a0f-b728-81d26d67cad0', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', 'Booking Received', 'DUBAI', '2024-06-11 07:46:17', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('637414fa-72b5-4144-859b-8d4fc2e40087', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', 'Booking Received', 'AALEN-HEIDENHEIM', '2024-06-13 07:30:48', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('88148687-c86f-4147-9259-e8f9f41ceb2e', 'e502484f-0d0b-45dc-b8c3-b221899db262', 'Booking Received', 'ÅBO (TURKU)', '2024-06-13 09:06:13', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('4597e880-f7d5-4d39-89be-6f6701dba30e', '3217d8fb-8c52-445d-a870-ac91a6d33135', 'Booking Received', 'AALBORG', '2024-06-20 10:38:18', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('5eac1686-3012-460c-bfda-55333694ad69', 'a221ef20-676e-4701-a33d-da6d9a533008', 'Booking Received', 'DUBAI', '2024-06-25 03:56:52', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('422f010c-fd1f-4e7b-b197-7de6b745a90e', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18', 'Booking Received', 'DUBAI', '2024-06-25 10:45:44', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('c97a2732-1818-4c1e-b817-bde911bf9e50', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', 'Booking Received', 'DUBAI', '2024-06-26 02:45:04', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('e29ff98f-47e0-4814-ad97-f472180e101e', 'b91e189f-9077-41bb-8b38-d82209f3b293', 'Booking Received', 'ABBOT POINT', '2024-07-22 07:36:25', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('872795d4-68b9-4f59-bb5c-582036c0d576', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', 'Booking Received', 'ABERDEEN', '2024-07-22 07:53:29', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('7955bc1d-7980-4b99-a96a-0f3c88c26b05', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', 'Booking Received', 'ABIDJAN', '2024-07-22 07:55:23', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('6d54b4d8-1a40-4954-a33e-19e42cf457db', '6637d456-b568-452c-bf72-61f3afb3ddc1', 'Booking Received', 'ABERDEEN', '2024-07-22 07:58:42', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('3f82dc1b-b88c-4e15-96e8-33ab17d64608', 'b5c3b066-2b07-4a63-a664-587413519156', 'Booking Received', 'ABERDEEN', '2024-07-22 08:02:09', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('de8f8854-bd0e-4895-96bf-1d960736ce59', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', 'Booking Received', 'ABERDEEN', '2024-07-22 10:38:16', NULL, NULL, 'GMT+7', NULL);
INSERT INTO "dxb"."histori_job" VALUES ('51185578-c983-49b3-9227-b42adfc4e12e', '3e9d64c1-1587-422c-b74f-49559eec819e', 'Loading Completed', 'DUBAI', '2024-08-06 10:48:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('b74f807f-8b9d-4ec2-af43-c8d8e084c607', '6ea5972e-7192-491b-b67b-1716a88eecb6', 'Departure', 'DUBAI', '2024-08-06 10:50:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 27);
INSERT INTO "dxb"."histori_job" VALUES ('5b9358ce-9e00-458c-8f82-9aadf3b560a4', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', 'Under storage at warehouse', 'DUBAI', '2024-08-06 11:31:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 54);
INSERT INTO "dxb"."histori_job" VALUES ('91898294-8e63-4ad5-aa06-fb77c5f8bac9', '3c244936-60ba-4c50-a230-51ea58cd9427', 'Under storage at warehouse', 'DUBAI', '2024-08-06 11:31:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 54);
INSERT INTO "dxb"."histori_job" VALUES ('c0818147-0e9d-4861-94c7-b035571539bd', 'bb619a92-9823-42a0-8466-7a60d7d21446', 'Under storage at warehouse', 'DUBAI', '2024-08-06 11:31:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 54);
INSERT INTO "dxb"."histori_job" VALUES ('584f423c-ac95-434d-8606-7c7bd3413463', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('339facc4-52e6-4afd-bc5e-a6b675096e1e', 'e502484f-0d0b-45dc-b8c3-b221899db262', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('29dd034b-787f-47e2-a07a-59be57488ee9', '41ccf845-9e64-4efb-859d-15395753657d', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('90663506-fd81-4f91-823b-cbbf25aa4dcc', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('9c3ed685-2530-4662-912b-601d7431c5e1', 'ca1e6202-587a-4326-94cf-d3e161a273fa', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('9a8ae3b3-d5d8-4e75-ae72-9d92fb4156fd', '53d59b90-626c-4af8-a858-651186572d91', 'Under Custom Clereance', 'DUBAI', '2024-08-06 16:44:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 4);
INSERT INTO "dxb"."histori_job" VALUES ('5054ccd3-1884-4c2e-aa6b-3eae864617c6', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('8fe010ab-6aec-4952-96d2-4818463e2b4a', 'e502484f-0d0b-45dc-b8c3-b221899db262', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('c143d747-f342-485b-812a-49b8a3c1037e', '41ccf845-9e64-4efb-859d-15395753657d', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('22e91790-3ed1-4e25-80ae-11ecebbb7899', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('6094093a-e0e4-4bfd-9e47-74965234b184', '53d59b90-626c-4af8-a858-651186572d91', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('434683d2-63fe-46c3-85f3-483265498f33', 'ca1e6202-587a-4326-94cf-d3e161a273fa', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('3e4539e7-abb5-452f-926b-eb2dd8461589', '3117a224-6a04-458c-a624-f2a7f2037f56', 'Loading Completed', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 5);
INSERT INTO "dxb"."histori_job" VALUES ('dcaa1443-ce7c-426b-895c-1214930d1e94', '6ea5972e-7192-491b-b67b-1716a88eecb6', 'In transit', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 28);
INSERT INTO "dxb"."histori_job" VALUES ('c26a5182-7d89-46d8-b365-f1542bc29e58', '912bd056-3711-487a-a1d5-a884046fc254', 'In transit', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 28);
INSERT INTO "dxb"."histori_job" VALUES ('1b16d1ff-fb6e-42bf-ab6a-ca6fef182cb8', '1b811059-ca80-4603-855e-86f9890a1805', 'In transit', 'DUBAI', '2024-08-06 16:45:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 28);
INSERT INTO "dxb"."histori_job" VALUES ('64c7a682-7a6e-474d-8920-5d3ba51e465e', 'ca1e6202-587a-4326-94cf-d3e161a273fa', 'Container Onboard', 'DUBAI', '2024-08-07 02:05:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 6);
INSERT INTO "dxb"."histori_job" VALUES ('e4964fb8-3c29-4e75-882e-77c7d1c654d8', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', 'Container Onboard', 'DUBAI', '2024-08-07 02:05:00', NULL, 'thomas@pamcargo.com', 'GMT+7', 6);

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
  "job_order_type" int2,
  "status" int2 NOT NULL,
  "origin_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "destination_charges" varchar(255) COLLATE "pg_catalog"."default",
  "mawb_number" varchar(255) COLLATE "pg_catalog"."default",
  "etd_dubai" date,
  "dxb" uuid,
  "port_name_sea_export" varchar(255) COLLATE "pg_catalog"."default",
  "eta_dubai" date
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
INSERT INTO "dxb"."job_order" VALUES ('aef3bcfb-ca54-46b1-bb85-4a3bc0177349', 'SI2406002', '2024-06-11', 'test', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('bf670255-8a4e-4dc7-ba05-1e16f5f438d4', 'SI2406001', '2024-06-11', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('ae60b96d-283c-468f-b15a-712ce5f88100', 'AI2408001', '2024-08-07', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 3, 1, NULL, NULL, NULL, '83299999900', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('f554fc40-8c06-40f3-b147-2a39c15fe48a', 'SE2406001', '2024-06-11', 'test', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 2, 3, NULL, NULL, NULL, NULL, '2024-06-12', '33a4b77d-792e-4498-9439-c10506695992', 'ABU DHABI', NULL);
INSERT INTO "dxb"."job_order" VALUES ('635eca9c-f101-4711-bb96-814e9fe74d39', 'AE2408001', '2024-08-07', 'Testing lagi', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 4, 1, NULL, NULL, NULL, '83299999933', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('30e89ea9-736c-4d53-a396-31ee4862c29c', 'SE2406002', '2024-06-11', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 2, 3, NULL, NULL, NULL, NULL, '2024-06-11', '33a4b77d-792e-4498-9439-c10506695992', 'ABU DHABI', NULL);
INSERT INTO "dxb"."job_order" VALUES ('de0c1081-1cb2-4e14-911f-9b37ce6b62c5', 'TC2408001', '2024-08-07', 'Testing terozzz', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 6, 1, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('4c92fc4d-9020-4435-8854-96f2c419cf09', 'AI2406001', '2024-06-11', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 3, 3, NULL, NULL, NULL, '83299999900', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('905f86a3-1e35-422a-89e3-b9d6c0211b45', 'AE2406001', '2024-06-11', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 4, 3, NULL, NULL, NULL, '83299999900', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('6cdb134e-962f-4b21-9552-616a5a07cab7', 'WH2406002', '2024-06-27', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 5, 3, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('eee98930-fd50-4427-9be9-5f23af319aef', 'WH2406001', '2024-06-11', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 5, 3, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('5dd07fd4-7471-402f-85ce-3a656f0ac20e', 'WH2408001', '2024-08-07', 'DC Cakung', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 5, 1, NULL, NULL, '10', '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('ef07475b-8cd0-4661-9547-6e747f1e90d4', 'TC2406001', '2024-06-11', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 6, 3, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('78daa06c-c2a2-48e0-bde0-04fcec499099', 'SI2406005', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('e190c936-1807-4a8a-b51f-cdbc642e7f50', 'SI2406004', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ÅBO (TURKU)', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('c88b56a0-850d-4d92-b2fa-59401005880f', 'AI2406002', '2024-06-27', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 3, 1, NULL, NULL, NULL, '83299999900', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('d5fac5d2-89f4-4b3d-aa20-9c08c50e72b7', 'AE2406002', '2024-06-27', 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 4, 1, NULL, NULL, NULL, '83299999900', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('1b039e33-5fa7-483d-b91e-2a046b6ece0a', 'SI2406006', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('476e1146-dc21-48c9-a148-85be08c12a4f', 'SI2406007', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('c8244a95-8eb9-4fd9-8300-a3673ba6659c', 'SI2406003', '2024-06-26', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('50225405-33dd-4876-8f2b-885683228bfa', 'SI2406008', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('5ca78662-d11b-4e7b-bc0c-5ab28749b59b', 'SE2406004', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, '2024-06-27', NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('256d2dbf-86a7-4fdd-9123-f8d7a773a802', 'SE2406003', '2024-06-27', 'test', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 2, 3, NULL, NULL, NULL, NULL, '2024-06-27', '33a4b77d-792e-4498-9439-c10506695992', 'ABU DHABI', NULL);
INSERT INTO "dxb"."job_order" VALUES ('abb46dd1-fb13-4ee4-b61e-566ccc841b14', 'AI2406003', '2024-06-27', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 3, 3, NULL, NULL, NULL, '83299999933', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('0e644126-92e1-4863-a3f6-d192fab232ce', 'SI2406009', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('e301afd2-a683-4261-9019-7205a02a24bc', 'SI2406010', '2024-06-27', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ÅBO (TURKU)', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('91b3e66a-8e13-4db1-b8ae-c6ff744f2f80', 'AE2406003', '2024-06-27', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 4, 3, NULL, NULL, NULL, '83299999933', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('5f777a32-ebda-435b-9e8a-62d0cf54f23b', 'WH2406003', '2024-06-27', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 5, 3, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('e661afc9-0ffd-4f0b-b98d-c7312374f0c3', 'TC2406002', '2024-06-28', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 6, 1, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('1a8f63c5-e2a4-4aaa-8329-1dfdde6d07a3', 'TC2406003', '2024-06-28', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 6, 3, NULL, NULL, NULL, '-', NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."job_order" VALUES ('1bf2c54a-d048-4fe4-9a9b-9c6f17e82213', 'SI2407001', '2024-07-03', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('bf53fdba-7753-4984-a3ba-cf41dbbf587c', 'SI2407002', '2024-07-03', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, NULL, NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO "dxb"."job_order" VALUES ('75aa9e0b-cf46-4d7c-9b59-5343b6c5f5bf', 'SI2407003', '2024-07-03', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND - 11', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', 'ABIDJAN', NULL, NULL, NULL, NULL, '', '2024-06-12');

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
INSERT INTO "dxb"."job_order_detail" VALUES ('c3f15aa8-64e5-439f-a76c-500cf7db38a8', 'bf670255-8a4e-4dc7-ba05-1e16f5f438d4', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('49f15b97-4170-42fe-bc42-2f4c6169c2ad', 'aef3bcfb-ca54-46b1-bb85-4a3bc0177349', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('b22772e9-b2a9-4332-875d-e244e0602336', 'f554fc40-8c06-40f3-b147-2a39c15fe48a', 'DXBSE2406009', '39393fac-4390-4a21-ae1c-49d9eeb12671');
INSERT INTO "dxb"."job_order_detail" VALUES ('74b36ba1-97b6-4620-9507-bdc64c2c1a33', '30e89ea9-736c-4d53-a396-31ee4862c29c', 'DXBSE2406009', '39393fac-4390-4a21-ae1c-49d9eeb12671');
INSERT INTO "dxb"."job_order_detail" VALUES ('7c63e6b0-7d16-42d8-a48d-7031fe04d22e', '4c92fc4d-9020-4435-8854-96f2c419cf09', 'DXBAI2406012', '6ea5972e-7192-491b-b67b-1716a88eecb6');
INSERT INTO "dxb"."job_order_detail" VALUES ('af5bff43-974f-42c6-b5a3-618c8187e370', '905f86a3-1e35-422a-89e3-b9d6c0211b45', 'DXBAE2406012', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b');
INSERT INTO "dxb"."job_order_detail" VALUES ('caf46428-16c7-4d8c-844c-1762c649a13b', 'eee98930-fd50-4427-9be9-5f23af319aef', 'DXBWH2406003', '6007ef0b-34f7-4e90-b43b-6081c41b73b3');
INSERT INTO "dxb"."job_order_detail" VALUES ('912b3994-6d2b-459e-9708-0e7277ce1366', 'ef07475b-8cd0-4661-9547-6e747f1e90d4', 'DXBTC2406008', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466');
INSERT INTO "dxb"."job_order_detail" VALUES ('c1c39c74-a223-4bf7-8263-bf9afb44f781', 'c8244a95-8eb9-4fd9-8300-a3673ba6659c', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('fa7cad25-4591-4ec4-88b5-503aa62d6050', 'e190c936-1807-4a8a-b51f-cdbc642e7f50', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('6cb027e3-0e2f-456d-9157-8f312b7dd515', '78daa06c-c2a2-48e0-bde0-04fcec499099', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('6b068a9f-9c9f-438a-8f99-313e5d841d36', '256d2dbf-86a7-4fdd-9123-f8d7a773a802', 'DXBSE2406011', 'b34f807d-0526-442f-8b25-a1134de5ab21');
INSERT INTO "dxb"."job_order_detail" VALUES ('6f5a06d1-36ed-4978-9066-c4c93b213844', 'c88b56a0-850d-4d92-b2fa-59401005880f', 'DXBAI2406012', '6ea5972e-7192-491b-b67b-1716a88eecb6');
INSERT INTO "dxb"."job_order_detail" VALUES ('a2e1dcd2-235d-4b70-abfd-89c73267ed6f', 'c88b56a0-850d-4d92-b2fa-59401005880f', 'DXBAI2406013', 'db6374b7-a237-4d38-9525-5fc87e03c8b9');
INSERT INTO "dxb"."job_order_detail" VALUES ('fb5b9466-9d66-4c58-b6a7-60c95b5d7dae', 'd5fac5d2-89f4-4b3d-aa20-9c08c50e72b7', 'DXBAE2406012', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b');
INSERT INTO "dxb"."job_order_detail" VALUES ('91a94699-cb1e-463f-8747-35af10bd18f2', 'd5fac5d2-89f4-4b3d-aa20-9c08c50e72b7', 'DXBAE2406013', '3217d8fb-8c52-445d-a870-ac91a6d33135');
INSERT INTO "dxb"."job_order_detail" VALUES ('bb7b9820-e69f-4e2d-943f-2911002eacab', '1b039e33-5fa7-483d-b91e-2a046b6ece0a', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('f01e1dd3-438d-4322-adbd-6ccaa47f1b23', '476e1146-dc21-48c9-a148-85be08c12a4f', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('5fa5d510-110c-4de2-8075-06760b8320e5', '50225405-33dd-4876-8f2b-885683228bfa', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('e60073a0-bcfc-4759-a722-95decc6d0900', '5ca78662-d11b-4e7b-bc0c-5ab28749b59b', 'DXBSE2406011', 'b34f807d-0526-442f-8b25-a1134de5ab21');
INSERT INTO "dxb"."job_order_detail" VALUES ('ad009b15-3ea6-4d94-9d9b-d37394a17983', 'abb46dd1-fb13-4ee4-b61e-566ccc841b14', 'DXBAI2406013', 'db6374b7-a237-4d38-9525-5fc87e03c8b9');
INSERT INTO "dxb"."job_order_detail" VALUES ('617beb70-3d70-4b07-9150-fe6b402280a0', '0e644126-92e1-4863-a3f6-d192fab232ce', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('1773e89a-3a46-4019-94d3-16e64130bf4c', 'e301afd2-a683-4261-9019-7205a02a24bc', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('8cf6670f-b4a5-434a-9fae-1802f8531ee2', '91b3e66a-8e13-4db1-b8ae-c6ff744f2f80', 'DXBAE2406013', '3217d8fb-8c52-445d-a870-ac91a6d33135');
INSERT INTO "dxb"."job_order_detail" VALUES ('9331ac24-dfa6-4516-aad9-85f1528da4ae', '5f777a32-ebda-435b-9e8a-62d0cf54f23b', 'DXBWH2406004', 'a221ef20-676e-4701-a33d-da6d9a533008');
INSERT INTO "dxb"."job_order_detail" VALUES ('722ce42f-0e82-45b5-b49b-4ec79daf10b1', 'e661afc9-0ffd-4f0b-b98d-c7312374f0c3', 'DXBTC2406010', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593');
INSERT INTO "dxb"."job_order_detail" VALUES ('252f9353-d88f-4f80-9ad7-9c070781ba58', '1a8f63c5-e2a4-4aaa-8329-1dfdde6d07a3', 'DXBTC2406010', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593');
INSERT INTO "dxb"."job_order_detail" VALUES ('ca818544-27eb-43b6-b6f1-5c09423f6b11', '1bf2c54a-d048-4fe4-9a9b-9c6f17e82213', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('58d3deef-20b4-4170-813f-37dd83294d78', 'bf53fdba-7753-4984-a3ba-cf41dbbf587c', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('bd795c4e-0b56-4ee0-a1f8-6f6a678a23a4', '75aa9e0b-cf46-4d7c-9b59-5343b6c5f5bf', 'DXBSI2406013', '41ccf845-9e64-4efb-859d-15395753657d');
INSERT INTO "dxb"."job_order_detail" VALUES ('b41adbec-c40c-441a-a8fe-8186e743103c', 'ae60b96d-283c-468f-b15a-712ce5f88100', 'DXBAI2406011', '912bd056-3711-487a-a1d5-a884046fc254');
INSERT INTO "dxb"."job_order_detail" VALUES ('35527501-95a2-440a-b42a-c9d7a380982a', 'ae60b96d-283c-468f-b15a-712ce5f88100', 'DXBAI2406013', 'db6374b7-a237-4d38-9525-5fc87e03c8b9');
INSERT INTO "dxb"."job_order_detail" VALUES ('172253e2-0861-4957-a2da-b0453dc67a1a', '635eca9c-f101-4711-bb96-814e9fe74d39', 'DXBAE2406013', '3217d8fb-8c52-445d-a870-ac91a6d33135');
INSERT INTO "dxb"."job_order_detail" VALUES ('6b8302a3-9c34-4d9f-930d-d6a96fd15d16', '635eca9c-f101-4711-bb96-814e9fe74d39', 'DXBAE2406012', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b');
INSERT INTO "dxb"."job_order_detail" VALUES ('5e747da8-d442-46cb-9951-3a9bb20a8422', '635eca9c-f101-4711-bb96-814e9fe74d39', 'DXBAE2406011', '09b7d475-b92c-43ca-87c6-e7ec070848e9');
INSERT INTO "dxb"."job_order_detail" VALUES ('c2b013a2-700c-4284-9f0d-90cf7ceccf07', '635eca9c-f101-4711-bb96-814e9fe74d39', 'DXBAE2406010', '2412c9de-563d-4fed-8ac8-73e780621984');
INSERT INTO "dxb"."job_order_detail" VALUES ('73ed415d-2ee1-4a57-bff0-3204585dbd35', 'de0c1081-1cb2-4e14-911f-9b37ce6b62c5', 'DXBTC2406010', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593');
INSERT INTO "dxb"."job_order_detail" VALUES ('6c294890-9e10-4627-96e8-0f6f7241d483', 'de0c1081-1cb2-4e14-911f-9b37ce6b62c5', 'DXBTC2406009', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18');
INSERT INTO "dxb"."job_order_detail" VALUES ('4e7fce95-0c90-49ec-a521-4a6d24bea97c', '6cdb134e-962f-4b21-9552-616a5a07cab7', 'DXBWH2406004', 'a221ef20-676e-4701-a33d-da6d9a533008');
INSERT INTO "dxb"."job_order_detail" VALUES ('ba501a82-3a76-4a7d-9d4a-df166dac905d', '5dd07fd4-7471-402f-85ce-3a656f0ac20e', 'DXBWH2406004', 'a221ef20-676e-4701-a33d-da6d9a533008');
INSERT INTO "dxb"."job_order_detail" VALUES ('a1d53a06-fe11-4f18-b8f2-6fd593f0461f', '5dd07fd4-7471-402f-85ce-3a656f0ac20e', 'DXBWH2406003', '6007ef0b-34f7-4e90-b43b-6081c41b73b3');
INSERT INTO "dxb"."job_order_detail" VALUES ('c918aa6a-c4ae-4e16-b7af-b8e777b332fa', '5dd07fd4-7471-402f-85ce-3a656f0ac20e', 'DXBWH2406002', '3c244936-60ba-4c50-a230-51ea58cd9427');

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
INSERT INTO "dxb"."job_order_vendor" VALUES ('8d4f8ae5-05de-41bf-a32f-b5c4935c0f64', 'bf670255-8a4e-4dc7-ba05-1e16f5f438d4', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('e8b188f2-a388-4f6e-8f72-f560fbb52a90', 'aef3bcfb-ca54-46b1-bb85-4a3bc0177349', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('1c45e67e-b39f-40ab-a67b-b28dea3a5e89', 'f554fc40-8c06-40f3-b147-2a39c15fe48a', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('88894f7e-4193-4518-8f33-11602d695f11', '30e89ea9-736c-4d53-a396-31ee4862c29c', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('de00b2ee-942b-4bf5-bae7-d28be638474c', '4c92fc4d-9020-4435-8854-96f2c419cf09', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('29cfd84d-13f6-4577-8bf7-d38a40be2757', '905f86a3-1e35-422a-89e3-b9d6c0211b45', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('0be20caa-b7ae-4d1c-9d7e-646e11e62cf7', 'eee98930-fd50-4427-9be9-5f23af319aef', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('0cc14100-243f-4d2f-af3c-f0e19df16127', 'ef07475b-8cd0-4661-9547-6e747f1e90d4', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('028e5aa1-be69-466f-869c-8bce794d2be0', 'c8244a95-8eb9-4fd9-8300-a3673ba6659c', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('0af4a634-9ba4-4164-9398-25dec9057666', 'e190c936-1807-4a8a-b51f-cdbc642e7f50', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('e83af7d1-854a-457c-baea-6166b22b42cf', '78daa06c-c2a2-48e0-bde0-04fcec499099', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('dd5dda6a-2a3a-4744-885f-22abf6c0ef4c', '256d2dbf-86a7-4fdd-9123-f8d7a773a802', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('e731c34f-eb85-4b00-b8e9-e39001bcc87b', 'c88b56a0-850d-4d92-b2fa-59401005880f', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('7baf078e-7da6-4aae-b983-e6d4220d4b9a', 'd5fac5d2-89f4-4b3d-aa20-9c08c50e72b7', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('84aebb72-0a58-493a-b10c-c3216de67996', '1b039e33-5fa7-483d-b91e-2a046b6ece0a', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('d29bb24b-f065-47fe-b4cc-66f34be6d8be', '476e1146-dc21-48c9-a148-85be08c12a4f', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('535af900-f657-4a67-bf35-e6633fc45d8c', '50225405-33dd-4876-8f2b-885683228bfa', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('012eaa8d-575d-476b-a73a-ce4ba7864f26', '5ca78662-d11b-4e7b-bc0c-5ab28749b59b', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('90fcf61a-4e6b-4670-8094-5ca7c28a8a4c', 'abb46dd1-fb13-4ee4-b61e-566ccc841b14', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('933da476-69f4-4fff-964c-2f40e497b2a6', '0e644126-92e1-4863-a3f6-d192fab232ce', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('394d1d5d-556b-4c54-92fd-b21728309dec', '0e644126-92e1-4863-a3f6-d192fab232ce', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('a80f9751-f52d-45d3-87c2-1fd442bfd294', 'e301afd2-a683-4261-9019-7205a02a24bc', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('d88fecc3-0624-4718-a0a7-087090a70737', 'e301afd2-a683-4261-9019-7205a02a24bc', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('6cab19a6-0983-41cb-8f3d-30ad0e12fd29', 'e301afd2-a683-4261-9019-7205a02a24bc', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('ad4a6640-aeb1-4518-92d0-7089fe2a7a94', '91b3e66a-8e13-4db1-b8ae-c6ff744f2f80', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('7a86da9e-4a08-4791-a122-1d2f81bc688f', '5f777a32-ebda-435b-9e8a-62d0cf54f23b', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('651f5c1e-1c68-4c33-ab7a-696c340c9fa2', 'e661afc9-0ffd-4f0b-b98d-c7312374f0c3', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('badc9007-d4c9-4b48-896b-b78fe6745656', '1a8f63c5-e2a4-4aaa-8329-1dfdde6d07a3', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('77b4dbc4-c7b7-4985-974a-049031e7e272', '1bf2c54a-d048-4fe4-9a9b-9c6f17e82213', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('f67e126a-486f-434d-b803-b5fc04a03bce', '1bf2c54a-d048-4fe4-9a9b-9c6f17e82213', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('efbb1923-5314-45a3-a3d3-787c22311bb4', 'bf53fdba-7753-4984-a3ba-cf41dbbf587c', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('6dc7f486-baa9-4bc2-b598-e7a252e8f56a', 'bf53fdba-7753-4984-a3ba-cf41dbbf587c', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('2a292cb6-9ac1-4852-a5a3-1271110571b7', '75aa9e0b-cf46-4d7c-9b59-5343b6c5f5bf', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('4e0585e1-1244-4012-b7a7-c9500fea9e6a', 'ae60b96d-283c-468f-b15a-712ce5f88100', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('2da0d37e-dc5f-484e-b550-f3c4b5a9cec9', 'ae60b96d-283c-468f-b15a-712ce5f88100', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('dda31e3f-758a-4f65-871a-35e65cee052d', '635eca9c-f101-4711-bb96-814e9fe74d39', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('5c862cba-9d05-4254-9ce1-76785e07b9d2', '635eca9c-f101-4711-bb96-814e9fe74d39', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('2435cec9-cdfb-42ad-8692-990745ef89d1', 'de0c1081-1cb2-4e14-911f-9b37ce6b62c5', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('98ea08f0-0b8e-458f-be26-35f1c9a98c09', 'de0c1081-1cb2-4e14-911f-9b37ce6b62c5', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('51e25fac-fbd1-4a84-89e7-2e60670050fb', '6cdb134e-962f-4b21-9552-616a5a07cab7', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('4057d87c-fc10-447e-8e05-e94959dd5c1e', '5dd07fd4-7471-402f-85ce-3a656f0ac20e', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', 'Shipping line', 'SEA');
INSERT INTO "dxb"."job_order_vendor" VALUES ('c3a1202e-9ed5-43a5-885d-cd1e00e4b3fa', '5dd07fd4-7471-402f-85ce-3a656f0ac20e', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', 'Shipping line', 'SEA');

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
INSERT INTO "dxb"."loading_plan" VALUES ('e91bb35e-a833-4d99-b486-600801fdf452', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17641241241', '2024-05-28', NULL, '2024-05-28', 'thomas@pamcargo.com', 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-08 12:01:00', NULL, NULL, NULL, 'LP-2405002', 'be6e0ecd-d2ca-482a-a4f9-4fb2a06d62e6', 'PAM INTERNATIONAL CARGO', NULL, 'c5ca58ff-a66e-4963-96fa-49f312d7d189', 'ABHINANDAN STEELS,', '<p><strong>A-113/2, WAZIRPUR INDUSTRIAL AREA,</strong></p><p><strong>DELHI-110052 INDIA</strong></p>', '56a21f4d-5947-441f-a6db-0b5f0c259e10', '4M SYSTEMS A.S.', '<p>SLEZANU 2296/9, 169 00, PRAHA 6</p><p>PRAGUE, CZECH REPUBLIC</p><p>TEL.:+420 778 728 744</p><p>EMAIL:KECLIKOVA@4MTACTICAL.COM</p>', 'test', NULL, '9999999', 'Prepaid', NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('186b65a2-f2be-4a80-a818-b99a31f28200', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17623432423', '2024-05-28', NULL, '2024-05-31', 'thomas@pamcargo.com', 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-05-21 12:00:00', NULL, NULL, NULL, 'LP-2405001', 'be6e0ecd-d2ca-482a-a4f9-4fb2a06d62e6', 'PAM INTERNATIONAL CARGO', NULL, 'c5ca58ff-a66e-4963-96fa-49f312d7d189', 'ABHINANDAN STEELS,', '<p><strong>A-113/2, WAZIRPUR INDUSTRIAL AREA,</strong></p><p><strong>DELHI-110052 INDIA</strong></p>', '56a21f4d-5947-441f-a6db-0b5f0c259e10', '4M SYSTEMS A.S.', '<p>SLEZANU 2296/9, 169 00, PRAHA 6</p><p>PRAGUE, CZECH REPUBLIC</p><p>TEL.:+420 778 728 744</p><p>EMAIL:KECLIKOVA@4MTACTICAL.COM</p>', 'test', NULL, '9999999', 'Prepaid', NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('af41c82e-c395-4981-ac61-dce0cdb593ec', 'fa2eea8f-5707-4bdf-9533-270556ce7858', 'SWISS', '72434543534', '2024-05-31', NULL, '2024-05-31', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-01 09:10:00', NULL, NULL, NULL, 'LP-2405003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('7424a423-ef33-490d-b35e-c729e46576fe', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17641241241', '2024-06-14', NULL, '2024-06-14', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-14 15:10:00', NULL, NULL, NULL, 'LP-2406004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('7ac525d2-2b00-4e3e-a448-76aa57b9f474', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-06-28', NULL, '2024-06-28', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-29 11:23:00', NULL, NULL, NULL, 'LP-2406005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('c6f99492-6bbd-4e4e-8454-06e97598fe6f', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-02', NULL, '2024-07-02', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-05 16:33:00', NULL, NULL, NULL, 'LP-2407006', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('49ed38ac-c753-4f92-87b4-fb5b36b7397e', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17623432423', '2024-07-03', NULL, '2024-07-03', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-03 17:18:00', NULL, NULL, NULL, 'LP-2407007', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('f3aee564-dc4c-4766-9b06-b5ee60560e4c', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-05', NULL, '2024-07-05', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-05 14:40:00', NULL, NULL, NULL, 'LP-2407008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('1b859785-4c8b-438a-9b6d-419f2cf0e16e', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-09', NULL, '2024-07-09', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-09 11:51:00', NULL, NULL, NULL, 'LP-2407009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('aef9a1f0-8edf-4380-8621-1203f740e532', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17623432423', '2024-07-12', NULL, '2024-07-12', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-13 13:52:00', NULL, NULL, NULL, 'LP-2407010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('88000272-77cc-46c8-b730-3dcc3ffc1abd', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-12', NULL, '2024-07-12', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-13 13:56:00', NULL, NULL, NULL, 'LP-2407011', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('9be7b072-6bac-4b71-a3a0-d7fc78f8c53e', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999911', '2024-07-15', NULL, '2024-07-15', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-14 10:42:00', NULL, NULL, NULL, 'LP-2407012', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('da543f9d-b6c8-4b7e-8f5a-a697e762b154', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-15', NULL, '2024-07-15', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-15 15:21:00', NULL, NULL, NULL, 'LP-2407013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('4489aebf-4d94-43b2-9b3b-f6b70086721b', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999933', '2024-07-22', NULL, '2024-07-22', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-23 14:21:00', NULL, NULL, NULL, 'LP-2407015', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('54ff3f81-533d-4d9b-82c6-4c2f9253b104', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17600000011', '2024-07-25', NULL, '2024-07-25', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-25 09:14:00', NULL, NULL, NULL, 'LP-2407016', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('cf32566f-045c-4e19-ad52-f15ec0fa5bef', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17600000011', '2024-07-29', NULL, '2024-08-01', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-29 11:17:00', NULL, NULL, NULL, 'LP-2407017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('7edbc633-b538-43dc-9d12-a71fd3d00740', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999911', '2024-07-17', NULL, '2024-08-01', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-17 10:18:00', NULL, NULL, NULL, 'LP-2407014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('70088114-62fd-4336-9048-4d6ece473121', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17600000011', '2024-08-01', NULL, '2024-08-01', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-08-02 17:37:00', NULL, NULL, NULL, 'LP-2408018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('bf7ae104-8ee7-4b47-a1f0-0f4701d56dca', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17600000022', '2024-08-01', NULL, '2024-08-01', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-08-03 17:38:00', NULL, NULL, NULL, 'LP-2408019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('27dbf874-ec21-4fd2-994d-7ce456cd2300', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', '54999999900', '2024-08-05', NULL, '2024-08-05', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-08-06 17:07:00', NULL, NULL, NULL, 'LP-2408020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('408d4fbe-7bfb-403d-96dc-7d23b25db7b3', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17600000044', '2024-08-16', NULL, '2024-08-16', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-08-16 15:44:00', NULL, NULL, NULL, 'LP-2408021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan" VALUES ('25daf84d-8ae2-48d4-9d37-c0ed8634a119', 'ae307878-e20a-444c-823b-1de4b1df36d4', 'LUFTHANSA CARGO AG', '02023424343', '2024-08-21', NULL, '2024-08-21', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-08-21 17:03:00', NULL, NULL, NULL, 'LP-2408022', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "dxb"."loading_plan_detail" VALUES ('5e468dbe-eb5a-497c-a58e-f6c2cba962d2', 'e91bb35e-a833-4d99-b486-600801fdf452', '1211', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-06-21', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-08-01', 'ABD', 'ABD', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('19576471-7597-48d0-ad99-970bae9fc38a', '186b65a2-f2be-4a80-a818-b99a31f28200', '123', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-05-31', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-05-30', 'AAR', 'ABD', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('145381d0-62d9-4acb-9b0a-f0a51286340b', 'af41c82e-c395-4981-ac61-dce0cdb593ec', 'SW23', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-06-02', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', 'HAMBURG - HAM', '2024-06-03', 'DXB', 'HAM', 'fa2eea8f-5707-4bdf-9533-270556ce7858', 'SWISS');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('d656bd13-ab51-4f87-9f1b-e3dcf2146f9b', '7424a423-ef33-490d-b35e-c729e46576fe', '111', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-06-15', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-06-15', 'EDPA', 'AAR', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('495b7bc9-d4b9-47bd-9871-c96fa5384022', '7ac525d2-2b00-4e3e-a448-76aa57b9f474', '222', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-06-30', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-01', 'AAL', 'AAL', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('6ac20cc0-e052-4214-b7f6-4b42ca016a30', 'c6f99492-6bbd-4e4e-8454-06e97598fe6f', '111', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-12', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-20', 'AAL', 'AAL', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('04188a03-baac-480e-9a60-7a9c289b8aa8', '49ed38ac-c753-4f92-87b4-fb5b36b7397e', '12', '229eaa02-9568-4f59-b118-6409afbcb7b6', 'ABAKAN - ABA', '2024-07-04', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-18', 'ABA', 'AAR', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('0367a3e9-7879-4cad-8f4b-300a41dde65d', 'f3aee564-dc4c-4766-9b06-b5ee60560e4c', '122', '229eaa02-9568-4f59-b118-6409afbcb7b6', 'ABAKAN - ABA', '2024-07-06', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-07-07', 'ABA', 'ABD', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('3fdf6de1-99f0-4ba9-80ed-9feefa3e73fb', '1b859785-4c8b-438a-9b6d-419f2cf0e16e', '122', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-11', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-11', 'AAL', 'AAR', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('9cf70022-62b0-4983-9fb4-39c22e3829d6', 'aef9a1f0-8edf-4380-8621-1203f740e532', 'EK1200', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-07-14', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', 'HAMBURG - HAM', '2024-07-15', 'DXB', 'HAM', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('88872419-5bf0-45ea-90d0-f193e8b1eab2', '88000272-77cc-46c8-b730-3dcc3ffc1abd', '123', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-07-14', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', 'HAMBURG - HAM', '2024-07-15', 'DXB', 'HAM', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('faed1bf7-ccce-4614-9c0c-f244a0e1b2f6', '9be7b072-6bac-4b71-a3a0-d7fc78f8c53e', '456', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-15', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-16', 'AAL', 'AAR', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('c3d53a21-62e6-4cab-aecb-2679ff3644f5', 'da543f9d-b6c8-4b7e-8f5a-a697e762b154', 'AB212', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-07-16', 'd8f8840d-6c5b-4dae-8731-cea29a319146', 'GATWICK - LGW', '2024-07-16', 'DXB', 'LGW', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('3818d0aa-3be9-4d73-b86b-41289f930dd1', '4489aebf-4d94-43b2-9b3b-f6b70086721b', '22', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-24', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-26', 'AAR', 'AAR', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('84a7d624-8d4b-44d2-9dec-89e8cad1688f', '54ff3f81-533d-4d9b-82c6-4c2f9253b104', '123', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-26', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-07-26', 'AAL', 'EDPA', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('da8fb8a7-145a-47bc-aae7-779e76be956f', 'cf32566f-045c-4e19-ad52-f15ec0fa5bef', '12345', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-30', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-07-31', 'AAR', 'ABD', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('00c1f4fe-d1b3-43c9-a02a-fb740471b5a2', '7edbc633-b538-43dc-9d12-a71fd3d00740', '23', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-07-18', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-07-19', 'EDPA', 'AAR', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('f4030298-d51b-4483-b8be-86415541a96e', '70088114-62fd-4336-9048-4d6ece473121', 'EK808', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-08-03', '53b458d5-22ed-402a-a40e-6b926e095049', 'FRANKFURT MAIN - FRA', '2024-08-04', 'DXB', 'FRA', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('5b8488ac-d15a-4d47-8ee0-de5034b9e7a0', 'bf7ae104-8ee7-4b47-a1f0-0f4701d56dca', 'EK202', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-08-04', '53b458d5-22ed-402a-a40e-6b926e095049', 'FRANKFURT MAIN - FRA', '2024-08-05', 'DXB', 'FRA', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('95950d0e-0119-4373-aa29-c597885323c9', '27dbf874-ec21-4fd2-994d-7ce456cd2300', 'A001', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-08-09', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-08-10', 'EDPA', 'EDPA', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('ad84e976-7d57-4286-9aa4-acc8cf0e8cf5', '408d4fbe-7bfb-403d-96dc-7d23b25db7b3', '121', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-08-24', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-09-07', 'ABD', 'EDPA', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail" VALUES ('aeb85d24-e330-4d43-89c9-8ce06115a210', '25daf84d-8ae2-48d4-9d37-c0ed8634a119', 'LH008', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'DUBAI INTERNATIONAL - DXB', '2024-08-22', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', 'HAMBURG - HAM', '2024-08-23', 'DXB', 'HAM', 'ae307878-e20a-444c-823b-1de4b1df36d4', 'LUFTHANSA CARGO AG');

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
INSERT INTO "dxb"."loading_plan_detail_local" VALUES ('f178238f-1c70-4ab7-ab38-c6747c544f28', 'ec40a263-4a05-45ea-8feb-aa73dd42465c', '1111', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-06-12', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-06-13', 'AAL', 'EDPA', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail_local" VALUES ('87fefbac-6ed4-424d-8c03-4b95b86a1f44', 'cb877848-b430-475d-a2c8-130a23170753', '222', '229eaa02-9568-4f59-b118-6409afbcb7b6', 'ABAKAN - ABA', '2024-06-20', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-06-20', 'ABA', 'ABD', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES');
INSERT INTO "dxb"."loading_plan_detail_local" VALUES ('72c20d7c-6413-4a2a-b5ed-c8c62790dec5', '31c52960-bfbd-4c5d-a8bf-320db8f96a8f', 'A001', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-01', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'ABADAN - ABD', '2024-07-06', 'AAL', 'ABD', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail_local" VALUES ('5566a41b-addf-4540-9128-5fa0f8a5ec47', '4086e0a3-a7d4-4041-97a7-25dbb58272fb', '212', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-06-15', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'AALEN HEIDENHEIM ELCHINGEN - EDPA', '2024-06-15', 'AAL', 'EDPA', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');
INSERT INTO "dxb"."loading_plan_detail_local" VALUES ('303a2dd5-9caa-4fee-b234-25c1d83d581b', 'c53bca84-933d-46ba-b4aa-43db79d2597f', '122', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-09', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-07-10', 'AAL', 'AAL', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR');

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
INSERT INTO "dxb"."loading_plan_local" VALUES ('ec40a263-4a05-45ea-8feb-aa73dd42465c', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17641241241', '2024-06-11', 'thomas@pamcargo.com', '2024-06-11', 'thomas@pamcargo.com', 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-11 14:25:00', NULL, NULL, NULL, 'AF-2406001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan_local" VALUES ('cb877848-b430-475d-a2c8-130a23170753', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', '17641241241', '2024-06-11', 'thomas@pamcargo.com', '2024-06-11', NULL, 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-12 14:28:00', NULL, NULL, NULL, 'AF-2406003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan_local" VALUES ('4086e0a3-a7d4-4041-97a7-25dbb58272fb', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999933', '2024-06-14', 'thomas@pamcargo.com', '2024-06-14', NULL, 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-14 15:14:00', NULL, NULL, NULL, 'AF-2406004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."loading_plan_local" VALUES ('31c52960-bfbd-4c5d-a8bf-320db8f96a8f', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-06-11', 'thomas@pamcargo.com', '2024-06-11', 'dubai@pamcargo.com', 1, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-06-30 14:26:00', NULL, NULL, NULL, 'AF-2406002', 'be6e0ecd-d2ca-482a-a4f9-4fb2a06d62e6', 'PAM INTERNATIONAL CARGO', NULL, 'c5ca58ff-a66e-4963-96fa-49f312d7d189', 'ABHINANDAN STEELS,', '<p><strong>A-113/2, WAZIRPUR INDUSTRIAL AREA,</strong></p><p><strong>DELHI-110052 INDIA</strong></p>', '56a21f4d-5947-441f-a6db-0b5f0c259e10', '4M SYSTEMS A.S.', '<p>SLEZANU 2296/9, 169 00, PRAHA 6</p><p>PRAGUE, CZECH REPUBLIC</p><p>TEL.:+420 778 728 744</p><p>EMAIL:KECLIKOVA@4MTACTICAL.COM</p>', 'test', NULL, '9999999', 'Prepaid', NULL, 'SA2406001');
INSERT INTO "dxb"."loading_plan_local" VALUES ('c53bca84-933d-46ba-b4aa-43db79d2597f', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '83299999900', '2024-07-08', 'thomas@pamcargo.com', '2024-07-08', 'thomas@pamcargo.com', 3, '533219ad-bfa1-4cf6-87f9-fce85748a647', '2024-07-08 11:24:00', NULL, NULL, NULL, 'AF-2407005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "dxb"."loading_report" VALUES ('6c807dc5-60a6-4cf1-92b2-1a92ddc7c4fc', NULL, NULL, 'APL-002', 1, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 3, NULL, 'thomas@pamcargo.com', '2024-06-11 10:55:39.476855', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-06-11', '2024-06-12', '11', NULL, NULL, '2024-06-12', 'SF-2406002');
INSERT INTO "dxb"."loading_report" VALUES ('3edcb5f8-a4c5-4272-8261-633c4ab35941', NULL, NULL, '001', 1, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 3, NULL, 'thomas@pamcargo.com', '2024-06-11 00:00:00', 'thomas@pamcargo.com', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-06-11', '2024-06-12', '11', NULL, NULL, '2024-06-12', 'SF-2406001');
INSERT INTO "dxb"."loading_report" VALUES ('c569f1ba-4694-46aa-9939-2986a4de8438', NULL, NULL, '111', 1, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 3, NULL, 'thomas@pamcargo.com', '2024-06-11 00:00:00', 'thomas@pamcargo.com', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-06-11', '2024-06-12', '11', NULL, NULL, '2024-06-12', 'SF-2406003');
INSERT INTO "dxb"."loading_report" VALUES ('cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, NULL, '123456789', 1, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 1, NULL, 'thomas@pamcargo.com', '2024-07-08 00:00:00', 'thomas@pamcargo.com', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-06-11', '2024-06-12', '11', NULL, NULL, '2024-06-12', 'SF-2406004');
INSERT INTO "dxb"."loading_report" VALUES ('ba3da292-19a9-4964-a522-9de7a61f717c', NULL, NULL, '324412', 1, NULL, '533219ad-bfa1-4cf6-87f9-fce85748a647', 3, NULL, 'thomas@pamcargo.com', '2024-07-08 10:10:00.146367', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-06-11', '2024-06-12', '11', NULL, NULL, '2024-06-12', 'SF-2407005');
INSERT INTO "dxb"."loading_report" VALUES ('816ea82b-14b7-4968-ad93-e0afd891beb0', NULL, NULL, '110011', 1, '1441', '533219ad-bfa1-4cf6-87f9-fce85748a647', 1, NULL, 'thomas@pamcargo.com', '2024-08-06 17:23:04.296372', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', 'SINAR BAJO', '2024-07-10', '2024-07-24', '234', NULL, NULL, '2024-07-04', 'SF-2408006');

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
  "status" int2
)
;
COMMENT ON COLUMN "dxb"."loading_report_detail"."container_type" IS '1. 40 ft 2, 25 ft ';

-- ----------------------------
-- Records of loading_report_detail
-- ----------------------------
INSERT INTO "dxb"."loading_report_detail" VALUES ('632c9075-35c0-4c27-a368-c99b1046e758', '3edcb5f8-a4c5-4272-8261-633c4ab35941', NULL, NULL, '20 FT', 1);
INSERT INTO "dxb"."loading_report_detail" VALUES ('6184e694-a2a2-47cf-a724-b3025c23be66', '6c807dc5-60a6-4cf1-92b2-1a92ddc7c4fc', NULL, NULL, NULL, 1);
INSERT INTO "dxb"."loading_report_detail" VALUES ('dbf4e9a5-5d79-4773-b9e5-73a96118ae3c', 'c569f1ba-4694-46aa-9939-2986a4de8438', NULL, NULL, '20 FT', 1);
INSERT INTO "dxb"."loading_report_detail" VALUES ('4207c4b9-916c-4a75-8b4a-47211f1015bb', 'ba3da292-19a9-4964-a522-9de7a61f717c', NULL, NULL, '20 FT', 1);
INSERT INTO "dxb"."loading_report_detail" VALUES ('4faa9838-cc38-48af-8495-9876dd7262d0', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, NULL, '20 FT', 1);
INSERT INTO "dxb"."loading_report_detail" VALUES ('f018267f-de2d-4932-911b-53bc03d3cb8f', '816ea82b-14b7-4968-ad93-e0afd891beb0', '123', '123', '40 HC', 1);

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
INSERT INTO "dxb"."schedule_vessel" VALUES ('b1cf0e18-8994-4244-9ec8-19b916b82ac3', NULL, 'EUROPE', NULL, 'APL HOLLAND', '123', '2024-05-31', '2024-05-30', NULL, '2024-06-01', NULL, NULL, NULL, '2024-05-30 00:00:00', 'thomas@pamcargo.com', '2024-05-30 00:00:00', 'thomas@pamcargo.com', 3, '119892d8-e20b-4833-a439-1e7ef3d08516', 3, 'ABU DHABI', 'BANGKOK', 'ALGERIA');
INSERT INTO "dxb"."schedule_vessel" VALUES ('35fc2136-c5b1-48a0-81d8-9dfde28bbaf6', NULL, 'EUROPE', NULL, 'APL HOLLAND', '11', '2024-06-12', '2024-06-11', NULL, '2024-06-12', NULL, NULL, NULL, '2024-06-11 00:00:00', 'thomas@pamcargo.com', '2024-06-11 10:17:52.164211', NULL, 1, '119892d8-e20b-4833-a439-1e7ef3d08516', 2, 'BANGKOK', 'ABU DHABI', 'ALBANIA');
INSERT INTO "dxb"."schedule_vessel" VALUES ('e7770708-c62a-4961-bd30-c2c66c224361', NULL, 'EUROPE', NULL, 'NORDOCELOT', '11', '2024-06-12', '2024-06-11', NULL, '2024-06-12', NULL, NULL, NULL, '2024-06-11 00:00:00', 'thomas@pamcargo.com', '2024-06-11 00:00:00', 'thomas@pamcargo.com', 3, 'c85ac3a8-7ffe-4bac-93a0-e73ccd56acb1', 1, 'ABU DHABI', 'BANGKOK', 'AFGHANISTAN');
INSERT INTO "dxb"."schedule_vessel" VALUES ('385da1d5-e90e-41c3-a301-5217a8575f0f', NULL, NULL, NULL, 'SINAR BAJO', '234', '2024-07-11', '2024-07-10', NULL, '2024-07-09', NULL, NULL, NULL, '2024-07-09 00:00:00', 'thomas@pamcargo.com', '2024-07-09 11:28:25.874087', NULL, 1, '3212b041-21e7-4d31-b493-ec484ef935b3', 1, 'BUSAN', 'BANGKOK', 'AFGHANISTAN');

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
  "status_update" int2 DEFAULT 0
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
INSERT INTO "dxb"."shipping_instruction" VALUES ('41e8e812-7143-455f-9fdf-0db22139a3b9', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '8b396746-5a30-4e39-84a4-89185a1ea96c', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'FOB', NULL, NULL, 'Booking Received', '2024-05-25', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABERDEEN', 'ABERDEEN', 'ABERDEEN', NULL, NULL, 'DXBSI2405001', 1, '2024-05-24 17:17:02.387362', 'dubai@pamcargo.com', '2024-05-24 17:17:02.387362', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('ab49df81-a7ed-4d0d-b519-7c3e976ca013', '32d9d644-0e53-4329-a455-05caf439b897', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', '216a40f2-26b3-494c-9cb7-6607e81398d4', '33a4b77d-792e-4498-9439-c10506695992', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Received by shipping line', '2024-05-26', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABURATSU', 'ABURATSU', 'ABU DHABI', NULL, NULL, 'DXBSE2405001', 1, '2024-05-24 17:18:44.449362', 'dubai@pamcargo.com', '2024-05-24 17:18:44.449362', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('352b8464-7bc5-47a5-afce-07d6e052e360', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Collect', 'CIP', NULL, NULL, 'Arrived in destination airport', '2024-05-26', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABADAN', 'ABADAN', 'ABADAN', NULL, NULL, 'DXBAI2405001', 1, '2024-05-24 17:20:13.62219', 'dubai@pamcargo.com', '2024-05-24 17:20:13.62219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', '33a4b77d-792e-4498-9439-c10506695992', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Booking Received', '2024-05-26', NULL, NULL, 'LA', 'SEAIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ABU DHABI', NULL, NULL, 'DXBSI2405002', 1, '2024-05-24 17:33:09.720467', 'dubai@pamcargo.com', '2024-05-24 17:33:09.720467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', '1e50f034-6862-4072-a05d-bb6008aa454f', 'd5ab17cd-467f-4c38-9860-5c83db803ade', '533219ad-bfa1-4cf6-87f9-fce85748a647', '9b084acc-61ab-4f05-b262-13ee1e329e50', '9b084acc-61ab-4f05-b262-13ee1e329e50', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'LCL', 'Collect', 'FAS', NULL, NULL, 'Booking Received', '2024-06-01', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'IGNITE SAFETY AND SECURITY W.L.L', 'BUILDING 1398 FLAT 3442 SEA FRONT 0 MANAMA/BAHARIN', 'DAYGLO', '23555 EUCLID AVE EUCLID OH 44117 US', 'RIO HAINA', 'RIO HAINA', 'RIO HAINA', NULL, NULL, 'DXBSI2406001', 1, '2024-05-24 17:35:17.394025', 'dubai@pamcargo.com', '2024-05-24 17:35:17.394025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2f4b6724-4980-484c-8faf-58f24439a47f', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Collect', 'FAS', NULL, NULL, 'Booking Received', '2024-06-01', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AARHUS', 'AARHUS', 'ABADAN', NULL, NULL, 'DXBAE2406001', 1, '2024-05-24 17:37:07.682689', 'dubai@pamcargo.com', '2024-05-24 17:37:07.682689', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('c17e7a19-95e1-4a91-898d-5d3c238003f9', 'e938d957-e550-4f5f-8ca9-f1c2e852b29d', 'f7d03dc5-fdc9-4db1-805d-2263e81de667', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Under storage at warehouse', '2024-05-30', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'LBG LIMITED', 'KIANGWAN BUILDING,II 7FL WIRELESS ROAD
LUMPINI
PATUMWAN BANGKOK,10330
TH,TL:00662651408185', 'PRIMA CHEMICALS', 'UNIT II PLOT NO 1904 PHASE IV GIDC VATVA AHMEDABAD, GJ 382445 IN', 'DUBAI', 'Jakarta', 'Surabaya', NULL, NULL, 'DXBWH2405001', 1, '2024-05-24 17:39:04.414805', 'dubai@pamcargo.com', '2024-05-24 17:39:04.414805', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', 'df8332cb-2be0-4887-aa62-2e415f405299', '8987e9f1-3766-46d7-a0f4-e22abb3de0aa', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'LCL', 'Collect', 'FCA', NULL, NULL, 'Cargo received', '2024-06-01', NULL, NULL, 'LA', 'TRUCKING', 'KGL CARGO QATAR', 'NABEENA COMMERCIAL BUILDING
STREET 270
OLD AIRPORT AREA, BESIDE AL MATAR DOHA, QATAR', 'AUSAF AHMED BAIG', 'INDIGO GARMENTS
PLOT NO. H1-03-04 &05
PO BOX 8795, SAIF ZONE,
SHARJAH, U.A.E', 'DUBAI', 'Bogor', 'Jakarta', NULL, NULL, 'DXBTC2406001', 1, '2024-05-24 17:40:14.760977', 'dubai@pamcargo.com', '2024-05-24 17:40:14.760977', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', '9efeb78c-5b68-4247-8bc3-f25f4d635d14', 'd5bd4391-4e75-406d-94d0-58ed91b50310', '533219ad-bfa1-4cf6-87f9-fce85748a647', '216a40f2-26b3-494c-9cb7-6607e81398d4', '33a4b77d-792e-4498-9439-c10506695992', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Booking Received', '2024-05-31', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AWJ INVESTMENT LLC', 'WAREHOUSE 21 UNIT 23
DUBAI UAE', 'BASF ITALIA SPA', 'VIA MARCONATO 8 CESANO MADERNO MB 20811 IT TEL NO:- +3903625121', 'ABURATSU', 'ABURATSU', 'ABU DHABI', NULL, NULL, 'DXBSI2405003', 1, '2024-05-27 10:57:04.934233', 'dubai@pamcargo.com', '2024-05-27 10:57:04.934233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('69a5a94b-b7c5-405c-9d43-dd81280eae75', '553a2151-8cd0-420f-80c5-c90203caa630', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Prepaid', 'CPT', NULL, NULL, 'Cargo received', '2024-05-30', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'DUBAI', 'Pelabuhan Ratu', 'Anyer', NULL, NULL, 'DXBWH2405002', 1, '2024-05-30 14:07:06.943731', 'dubai@pamcargo.com', '2024-05-30 14:07:06.943731', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', '1226cd4e-8280-4475-9beb-a65d7179d487', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'LCL', 'Collect', 'EXW', NULL, NULL, 'In transit other port', '2024-06-09', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABIDJAN', 'ABIDJAN', 'ABIDJAN', NULL, NULL, 'DXBSI2406004', 1, '2024-06-04 09:43:51.874438', 'dubai@pamcargo.com', '2024-06-04 09:43:51.874438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6c8e8768-46b2-4209-ba8e-b03bc2c60113', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'd5bd4391-4e75-406d-94d0-58ed91b50310', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Received by shipping line', '2024-05-30', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'BASF ITALIA SPA', 'VIA MARCONATO 8 CESANO MADERNO MB 20811 IT TEL NO:- +3903625121', 'ABERDEEN', 'ABERDEEN', 'ABIDJAN', NULL, NULL, 'DXBSE2405002', 1, '2024-05-27 10:11:33.302881', 'dubai@pamcargo.com', '2024-06-03 00:00:00', 'dubai@pamcargo.com', NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('d3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '33a4b77d-792e-4498-9439-c10506695992', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'DPU', NULL, NULL, 'Booking Received', '2024-06-08', NULL, NULL, 'SINGAPORE', 'SEAIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABU DHABI', 'ABU DHABI', 'ABIDJAN', NULL, NULL, 'DXBSI2406003', 1, '2024-06-04 09:42:24.74117', 'dubai@pamcargo.com', '2024-06-04 09:42:24.74117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6bcccf97-9c8d-4373-bde9-076a0caa0436', '1226cd4e-8280-4475-9beb-a65d7179d487', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '8b396746-5a30-4e39-84a4-89185a1ea96c', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Under Custom Clereance', '2024-06-10', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABIDJAN', 'ABIDJAN', 'ABERDEEN', NULL, NULL, 'DXBSI2406005', 1, '2024-06-04 09:45:38.470733', 'dubai@pamcargo.com', '2024-06-04 09:45:38.470733', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'e494804a-07a1-4b78-afdf-ed890c144251', 'b3079b39-5d5c-48e5-b367-42858f215951', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'LCL', 'Collect', 'FCA', NULL, NULL, 'Departured from transit port', '2024-06-10', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABU DHABI', 'ABU DHABI', 'ÅGOTNES', NULL, NULL, 'DXBSI2406006', 1, '2024-06-04 09:47:23.588601', 'dubai@pamcargo.com', '2024-06-04 09:47:23.588601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6ab1464a-5895-41eb-b67c-19dd743c27f4', '6812bd03-a528-438b-ab89-0c01927a3da9', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', 'e494804a-07a1-4b78-afdf-ed890c144251', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Split', 'DDP', NULL, NULL, 'Cargo airlifted', '2024-06-16', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABERDEEN', 'ABERDEEN', 'ABU DHABI', NULL, NULL, 'DXBSI2406007', 1, '2024-06-04 09:49:11.688517', 'dubai@pamcargo.com', '2024-06-04 09:49:11.688517', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', 'e2692903-34bd-4b91-a9e1-935fbb28a3f7', 'd5bd4391-4e75-406d-94d0-58ed91b50310', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '3df1313b-bcc8-4f3e-b41e-8aadef25b817', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Split', 'DPU', NULL, NULL, 'Vessel Departed', '2024-06-10', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'BICO DRILLING TOOLS FZE', 'JEBEL ALI FREE ZONE
DUBAI, UAE', 'BASF ITALIA SPA', 'VIA MARCONATO 8 CESANO MADERNO MB 20811 IT TEL NO:- +3903625121', 'ABIDJAN', 'ABIDJAN', 'AGUADILLA', NULL, NULL, 'DXBSI2406008', 1, '2024-06-04 09:50:49.178078', 'dubai@pamcargo.com', '2024-06-04 09:50:49.178078', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6d9d4ea7-8547-4a76-93ba-f2fe31892701', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', 'e494804a-07a1-4b78-afdf-ed890c144251', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Collect', 'FCA', NULL, NULL, 'Arrived in transit port', '2024-06-11', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABERDEEN', 'ABERDEEN', 'ABU DHABI', NULL, NULL, 'DXBSE2406001', 1, '2024-06-04 10:01:28.118355', 'dubai@pamcargo.com', '2024-06-04 10:01:28.118355', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('0095a867-c7cd-480d-93f5-c12e61a8c7da', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Transit hub operations', '2024-06-11', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABIDJAN', 'ABIDJAN', 'ABIDJAN', NULL, NULL, 'DXBSE2406002', 1, '2024-06-04 10:02:44.197596', 'dubai@pamcargo.com', '2024-06-04 10:02:44.197596', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('4de4babe-69d0-430a-8923-b8764a925ed0', '553a2151-8cd0-420f-80c5-c90203caa630', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '33a4b77d-792e-4498-9439-c10506695992', '33a4b77d-792e-4498-9439-c10506695992', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Collect', 'FCA', NULL, NULL, 'In transit other port', '2024-06-09', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABU DHABI', 'ABU DHABI', 'ABU DHABI', NULL, NULL, 'DXBSE2406003', 1, '2024-06-04 10:04:06.630911', 'dubai@pamcargo.com', '2024-06-04 10:04:06.630911', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('a1d653c3-f716-4ce3-8469-6af1173ef79b', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', 'a07992ba-02bf-49d1-966e-7a98755847ac', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Collect', 'FCA', NULL, NULL, 'Transit hub operations', '2024-06-11', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ÅBO (TURKU)', NULL, NULL, 'DXBSE2406004', 1, '2024-06-04 10:07:06.082421', 'dubai@pamcargo.com', '2024-06-04 10:07:06.082421', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('d54a473d-38f7-4df6-bc03-2ec06088d880', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '33a4b77d-792e-4498-9439-c10506695992', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Collect', 'FAS', NULL, NULL, 'Received by shipping line', '2024-06-15', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABIDJAN', 'ABIDJAN', 'ABU DHABI', NULL, NULL, 'DXBSE2406005', 1, '2024-06-04 10:09:25.088494', 'dubai@pamcargo.com', '2024-06-04 10:09:25.088494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('40c393f6-a567-46f9-9b33-46774d70c484', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '78546f7c-6171-4807-99b1-a29c9dd292e2', '533219ad-bfa1-4cf6-87f9-fce85748a647', '216a40f2-26b3-494c-9cb7-6607e81398d4', 'a07992ba-02bf-49d1-966e-7a98755847ac', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Departed from origin port', '2024-06-07', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'CIAM SPA', 'VIALE DEI PINI 9
06081 PETRIGNANO PG IT', 'ABURATSU', 'ABURATSU', 'ÅBO (TURKU)', NULL, NULL, 'DXBSE2406006', 1, '2024-06-04 10:13:00.791027', 'dubai@pamcargo.com', '2024-06-04 10:13:00.791027', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'd5ab17cd-467f-4c38-9860-5c83db803ade', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'e494804a-07a1-4b78-afdf-ed890c144251', 'a07992ba-02bf-49d1-966e-7a98755847ac', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Split', 'DPU', NULL, NULL, 'Arrived in destination airport', '2024-06-14', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'DAYGLO', '23555 EUCLID AVE EUCLID OH 44117 US', 'ABU DHABI', 'ABU DHABI', 'ÅBO (TURKU)', NULL, NULL, 'DXBSE2406007', 1, '2024-06-04 10:14:27.070447', 'dubai@pamcargo.com', '2024-06-04 10:14:27.070447', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('07af919c-2586-452e-b021-c6de8a3c83a1', '44478d80-c139-41ff-919e-02ac795aec9b', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '216a40f2-26b3-494c-9cb7-6607e81398d4', NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Delivered to consignee', '2024-06-07', NULL, NULL, 'DUBAI', 'SEAEXPORT', 'Bell IT GmbH', 'Max-Abelshauser-Str. 10
D-85653 Aying
Telefon:+49 (0) 8095 87320-0', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ABIDJAN', 'ABIDJAN', 'ABURATSU', NULL, NULL, 'DXBSE2406008', 1, '2024-06-04 10:15:34.446712', 'dubai@pamcargo.com', '2024-06-04 10:15:34.446712', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b01f25e8-fed4-4190-87c1-640d6a084b7c', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Collect', 'CIF', NULL, NULL, 'Cargo in transit', '2024-06-07', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'ABADAN', NULL, NULL, 'DXBAI2406001', 1, '2024-06-04 10:19:29.440201', 'dubai@pamcargo.com', '2024-06-04 10:19:29.440201', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('a0df10f1-6174-4dd5-adda-afc69cbdddd1', '32d9d644-0e53-4329-a455-05caf439b897', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Prepaid', 'DAP', NULL, NULL, 'Delivered to final consignee', '2024-06-07', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABADAN', 'ABADAN', 'ABADAN', NULL, NULL, 'DXBAI2406002', 1, '2024-06-04 10:21:21.358395', 'dubai@pamcargo.com', '2024-06-04 10:21:21.358395', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3117a224-6a04-458c-a624-f2a7f2037f56', '553a2151-8cd0-420f-80c5-c90203caa630', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Loading Completed', '2024-06-07', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'ABIDJAN', 'ABIDJAN', 'ABIDJAN', NULL, NULL, 'DXBSI2406009', 1, '2024-06-04 09:52:46.502642', 'dubai@pamcargo.com', '2024-06-04 09:52:46.502642', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('53d59b90-626c-4af8-a858-651186572d91', '553a2151-8cd0-420f-80c5-c90203caa630', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'b3079b39-5d5c-48e5-b367-42858f215951', '23779767-545b-42aa-9890-01c90c844600', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Loading Completed', '2024-07-10', '2024-07-10', NULL, 'DUBAI', 'SEAIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'ÅGOTNES', 'ÅGOTNES', 'ABIDJAN', 'SINAR BAJO', NULL, 'DXBSI2406011', 1, '2024-06-04 09:57:21.861594', 'dubai@pamcargo.com', '2024-06-13 00:00:00', NULL, NULL, '234', NULL, '2024-07-10', '816ea82b-14b7-4968-ad93-e0afd891beb0', NULL, 5, '2024-07-24', NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b053010e-4219-43a6-a56d-b292f39e25c5', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Split', 'CIF', NULL, NULL, 'Arrived in destination airport', '2024-06-09', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'AARHUS', NULL, NULL, 'DXBAI2406003', 1, '2024-06-04 10:23:15.166658', 'dubai@pamcargo.com', '2024-06-04 10:23:15.166658', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('eda254dc-bb8a-4800-a014-8330dbf0975b', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPOERT', 'Split', 'CIF', NULL, NULL, 'Arrived in destination airport', '2024-06-09', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'ABADAN', NULL, NULL, 'DXBAI2406004', 1, '2024-06-04 10:25:14.575956', 'dubai@pamcargo.com', '2024-06-04 10:25:14.575956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b4bedcef-ea49-42e9-b3be-da59c36e166e', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'SEA-IMPORT', 'Prepaid', 'CIP', NULL, NULL, 'Arrived in destination airport', '2024-06-08', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAI2406005', 1, '2024-06-04 10:27:32.993385', 'dubai@pamcargo.com', '2024-06-04 10:27:32.993385', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('8923a3a6-109d-47e6-b7fa-f860c5eabe3d', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Split', 'FCA', NULL, NULL, 'Delivered to final consignee', '2024-06-08', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'ABADAN', NULL, NULL, 'DXBAI2406006', 1, '2024-06-04 10:29:21.318494', 'dubai@pamcargo.com', '2024-06-04 10:29:21.318494', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('4fefff4e-e463-4393-b5a6-6c7f1f7ef265', 'e0d4f7df-7e9b-4849-88de-2c10abdbaed0', '3b577d36-7221-462f-88e0-564019a944cb', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'd75627f5-1f1c-4f1d-9dda-567f390ade2d', 'd5cdae85-0e42-4d49-9f3c-e0ff5fff8e38', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Collect', 'FCA', NULL, NULL, 'Under destination customs clearance', '2024-06-14', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'COPYMAT AG', 'BAAREE STRASSE 43
CH-6300, ZUG, SWITZERLAND', 'BICO DRILLING TOOLS INC', 'HOUSTON, USA', 'ABHA', 'ABHA', 'ABBEVILLE', NULL, NULL, 'DXBAI2406007', 1, '2024-06-04 10:30:58.917916', 'dubai@pamcargo.com', '2024-06-04 10:30:58.917916', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, 'd9e10be1-d179-4515-9b8b-adcddc68e085', 'SHOES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('c8687520-d7c8-4058-997c-961c713c18aa', '32d9d644-0e53-4329-a455-05caf439b897', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '09b353de-f76a-43a9-8e56-c6b2bf9b38e6', 'a8ffb224-e0a3-4089-ac24-187fb7e8cc93', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Split', 'DDP', NULL, NULL, 'Arrived in destination airport', '2024-06-08', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AGANA', 'AGANA', 'ADAK ISLAND', NULL, NULL, 'DXBAI2406008', 1, '2024-06-04 10:32:34.354292', 'dubai@pamcargo.com', '2024-06-04 10:32:34.354292', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', '32d9d644-0e53-4329-a455-05caf439b897', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Collect', 'CIF', NULL, NULL, 'Delivered to final consignee', '2024-06-06', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'ABADAN', NULL, NULL, 'DXBAI2406009', 1, '2024-06-04 10:34:04.064282', 'dubai@pamcargo.com', '2024-06-04 10:34:04.064282', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('fe033103-040c-468f-91d8-cb934482c594', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', '229eaa02-9568-4f59-b118-6409afbcb7b6', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Prepaid', 'CPT', NULL, NULL, 'Booking Received', '2024-06-08', NULL, NULL, 'DUBAI', 'AIREXPORT', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'ABAKAN', NULL, NULL, 'DXBAE2406002', 1, '2024-06-04 10:39:03.308399', 'dubai@pamcargo.com', '2024-06-04 10:39:03.308399', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('10f6d5dc-d708-4351-a1e3-35c62cfdc76c', '32d9d644-0e53-4329-a455-05caf439b897', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', '229eaa02-9568-4f59-b118-6409afbcb7b6', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Collect', 'EXW', NULL, NULL, 'Received in airport warehouse', '2024-06-08', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AARHUS', 'AARHUS', 'ABAKAN', NULL, NULL, 'DXBAE2406003', 1, '2024-06-04 10:40:28.693854', 'dubai@pamcargo.com', '2024-06-04 10:40:28.693854', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('677a92fe-283a-4518-a2d5-705feac53126', '32d9d644-0e53-4329-a455-05caf439b897', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Collect', 'FCA', NULL, NULL, 'Received in airport warehouse', '2024-06-07', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'THE METROPOLIS TOWER
BUSINESS B, DUBAI
DUBAI, UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AARHUS', 'AARHUS', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAE2406004', 1, '2024-06-04 10:43:05.168356', 'dubai@pamcargo.com', '2024-06-04 10:43:05.168356', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('815a6c7a-38da-4598-b246-ce426cf58737', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Prepaid', 'CIF', NULL, NULL, 'Booking Received', '2024-06-07', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AALBORG', 'AALBORG', 'ABADAN', NULL, NULL, 'DXBAE2406005', 1, '2024-06-04 10:45:03.56183', 'dubai@pamcargo.com', '2024-06-04 10:45:03.56183', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('08052673-0558-49ee-abb9-80f127ff8ac2', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '4798b340-4c9f-467a-bdf3-a6435c059a6f', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Split', 'CIF', NULL, NULL, 'Booking Received', '2024-06-08', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABU DHABI', 'ABU DHABI', 'ABADAN', NULL, NULL, 'DXBAE2406006', 1, '2024-06-04 10:46:27.468065', 'dubai@pamcargo.com', '2024-06-04 10:46:27.468065', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2468ea51-4c64-4bf9-816b-daf2c07d1aa6', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '229eaa02-9568-4f59-b118-6409afbcb7b6', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Split', 'CFR', NULL, NULL, 'Received in airport warehouse', '2024-06-08', NULL, NULL, 'DUBAI', 'AIREXPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABAKAN', 'ABAKAN', 'AARHUS', NULL, NULL, 'DXBAE2406007', 1, '2024-06-04 10:48:06.216439', 'dubai@pamcargo.com', '2024-06-04 10:48:06.216439', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6bd85111-f46b-465f-8cb4-d1cdedad6da7', '5b03dfa5-fc48-416c-8d16-d81be3d1c682', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', '229eaa02-9568-4f59-b118-6409afbcb7b6', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Prepaid', 'CFR', NULL, NULL, 'Truck departed from airport', '2024-06-09', NULL, NULL, 'DUBAI', 'AIREXPORT', 'B&S WORLD SUPPLY SOMALIA', 'WAREHOUSE 4 MOGADISHU SEAPORT
(MSP)
MOGADISHU SO
TL: +252 61 985 3926', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'ABAKAN', NULL, NULL, 'DXBAE2406008', 1, '2024-06-04 10:49:56.123339', 'dubai@pamcargo.com', '2024-06-04 10:49:56.123339', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('1b811059-ca80-4603-855e-86f9890a1805', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Split', 'CPT', NULL, NULL, 'In transit', NULL, NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'ABADAN', 'ABX AIR', NULL, 'DXBAI2406010', 1, '2024-06-04 10:35:43.757259', 'dubai@pamcargo.com', '2024-06-04 10:35:43.757259', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 28, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-14', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('52fd6c66-4dd5-430c-bfde-7491110dab24', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Prepaid', 'CIF', NULL, NULL, 'Manifested', '2024-06-08', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'AARHUS', NULL, NULL, 'DXBAE2406009', 1, '2024-06-04 10:51:32.711234', 'dubai@pamcargo.com', '2024-06-04 10:51:32.711234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('abd29adf-78e7-48db-85c0-b346c8f3808e', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Prepaid', 'CIF', NULL, NULL, 'Cargo received', '2024-06-09', NULL, NULL, 'DUBAI', 'TRUCKING', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'DUBAI', 'Bogor', 'Bojong', NULL, NULL, 'DXBTC2406002', 1, '2024-06-04 13:25:10.090755', 'dubai@pamcargo.com', '2024-06-04 13:25:10.090755', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('48a6111b-9244-4ea0-8c07-2350db07254d', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'LCL', 'Collect', 'EXW', NULL, NULL, 'Cargo received', '2024-06-07', NULL, NULL, 'DUBAI', 'TRUCKING', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'DUBAI', 'China', 'Korea Utara', NULL, NULL, 'DXBTC2406003', 1, '2024-06-04 13:26:24.021954', 'dubai@pamcargo.com', '2024-06-04 13:26:24.021954', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('a2e2282f-d196-4ba0-ad88-3e04b388b0de', '553a2151-8cd0-420f-80c5-c90203caa630', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Collect', 'FOB', NULL, NULL, 'Loading completed', '2024-06-09', NULL, NULL, 'DUBAI', 'TRUCKING', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'DUBAI', 'Jepang', 'Korea Selatan', NULL, NULL, 'DXBTC2406004', 1, '2024-06-04 13:27:52.662758', 'dubai@pamcargo.com', '2024-06-04 13:27:52.662758', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3b848e3a-f9b1-4944-895e-f6a83f034bef', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Split', 'DPU', NULL, NULL, 'In transit', '2024-06-09', NULL, NULL, 'DUBAI', 'TRUCKING', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'DUBAI', 'Iran', 'Israel', NULL, NULL, 'DXBTC2406005', 1, '2024-06-04 13:28:55.498819', 'dubai@pamcargo.com', '2024-06-04 13:28:55.498819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('abe1cc11-8667-4b0b-b9c6-a79272575402', '1226cd4e-8280-4475-9beb-a65d7179d487', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Offloading completed', '2024-06-07', NULL, NULL, 'DUBAI', 'TRUCKING', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'DUBAI', 'Cilebut', 'Depok', NULL, NULL, 'DXBTC2406006', 1, '2024-06-04 13:30:47.397973', 'dubai@pamcargo.com', '2024-06-04 13:30:47.397973', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2088a818-0433-45b7-9110-1dbae3b9a9b9', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Collect', 'FAS', NULL, NULL, 'Cargo delivered', '2024-06-09', NULL, NULL, 'DUBAI', 'TRUCKING', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'DUBAI', 'Cianjur', 'Cicahem', NULL, NULL, 'DXBTC2406007', 1, '2024-06-04 13:32:14.064098', 'dubai@pamcargo.com', '2024-06-04 13:32:14.064098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('ca1e6202-587a-4326-94cf-d3e161a273fa', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', 'a07992ba-02bf-49d1-966e-7a98755847ac', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Container Onboard', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABERDEEN', 'ABERDEEN', 'ÅBO (TURKU)', 'APL HOLLAND', NULL, 'DXBSI2406010', 1, '2024-06-04 09:54:38.129337', 'dubai@pamcargo.com', '2024-06-05 00:00:00', 'dubai@pamcargo.com', NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 6, '2024-06-12', NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3c244936-60ba-4c50-a230-51ea58cd9427', '553a2151-8cd0-420f-80c5-c90203caa630', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'LCL', 'Collect', 'EXW', NULL, NULL, 'Under storage at warehouse', '2024-06-16', NULL, NULL, 'SINGAPORE', 'WAREHOUSE', 'ARMAT FZE', 'FC0401WS74, JEBEL ALI FREEZONE, DUBAI, UAE.', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'DUBAI', 'TANJUNG BALAI', 'NUSAKAMBANGAN', NULL, NULL, 'DXBWH2406002', 1, '2024-06-04 11:22:09.458652', 'dubai@pamcargo.com', '2024-06-04 11:22:09.458652', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('09b7d475-b92c-43ca-87c6-e7ec070848e9', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Collect', 'FOB', NULL, NULL, 'Received in airport warehouse', NULL, NULL, NULL, 'DUBAI', 'AIREXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AALBORG', 'AALBORG', 'ABADAN', 'ABX AIR', NULL, 'DXBAE2406011', 1, '2024-06-04 10:54:10.355179', 'dubai@pamcargo.com', '2024-06-04 10:54:10.355179', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 25, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('2412c9de-563d-4fed-8ac8-73e780621984', '79687282-0029-49f3-9870-907505eb8174', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIREXPORT', 'AIR EXPORT', 'Collect', 'EXW', NULL, NULL, 'Booking Received', NULL, NULL, NULL, 'DUBAI', 'AIREXPORT', 'EUROWINDOW JOINT STOCK COMPANY', 'LOT 15, QUANG MINH INDUSTRIAL ZONE
QUANG MINH TOWN, ME LINH DISTRICT
HANOI, VIETNAM', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'AARHUS', 'AARHUS', 'ABADAN', 'ABX AIR', NULL, 'DXBAE2406010', 1, '2024-06-04 10:52:59.806131', 'dubai@pamcargo.com', '2024-06-04 10:52:59.806131', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 23, NULL, NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3e9d64c1-1587-422c-b74f-49559eec819e', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '23779767-545b-42aa-9890-01c90c844600', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Prepaid', 'CFR', 'Notify party', NULL, 'Loading Completed', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAEXPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABERDEEN', 'ABERDEEN', 'ABIDJAN', 'APL HOLLAND', NULL, 'DXBSE2406010', 1, '2024-06-11 11:05:37.44531', 'dubai@pamcargo.com', '2024-06-11 11:05:37.44531', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 5, '2024-06-12', '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('bb619a92-9823-42a0-8466-7a60d7d21446', '6812bd03-a528-438b-ab89-0c01927a3da9', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Under storage at warehouse', '2024-06-09', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'DUBAI', 'TANJUNG PRIOK', 'TANJUNG PINANG', NULL, NULL, 'DXBWH2406001', 1, '2024-06-04 11:20:25.609327', 'dubai@pamcargo.com', '2024-06-04 11:20:25.609327', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', 'Notify Party', NULL, 'Loading Completed', '2024-07-10', '2024-07-10', NULL, 'DUBAI', 'SEAIMPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABBOT POINT', 'ABBOT POINT', 'ABBOT POINT', 'SINAR BAJO', NULL, 'DXBSI2406012', 1, '2024-06-10 16:51:52.948201', 'dubai@pamcargo.com', '2024-06-10 16:51:52.948201', NULL, NULL, '234', NULL, '2024-07-10', '816ea82b-14b7-4968-ad93-e0afd891beb0', NULL, 5, '2024-07-24', '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6ea5972e-7192-491b-b67b-1716a88eecb6', '1226cd4e-8280-4475-9beb-a65d7179d487', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '229eaa02-9568-4f59-b118-6409afbcb7b6', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIRIMPORT', 'Test', 'Prepaid', 'CFR', NULL, NULL, 'In transit', NULL, NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABAKAN', 'ABAKAN', 'AARHUS', 'ABX AIR', NULL, 'DXBAI2406012', 1, '2024-06-11 11:52:32.592438', 'dubai@pamcargo.com', '2024-08-06 00:00:00', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 28, NULL, NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-14', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('e502484f-0d0b-45dc-b8c3-b221899db262', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', '33a4b77d-792e-4498-9439-c10506695992', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CIF', NULL, NULL, 'Loading Completed', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ABU DHABI', 'APL HOLLAND', NULL, 'DXBSI2406014', 1, '2024-06-13 16:06:13.796728', 'dubai@pamcargo.com', '2024-06-13 16:06:13.796728', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 5, '2024-06-12', NULL, NULL, '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('dc98c4da-32a6-4b86-b48a-0fbca09a1c18', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Cargo received', '2024-06-25', NULL, NULL, 'DUBAI', 'TRUCKING', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'DUBAI', 'JAKARTA', 'BALI', NULL, NULL, 'DXBTC2406009', 1, '2024-06-25 17:45:44.857262', 'dubai@pamcargo.com', '2024-06-25 17:45:44.857262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6007ef0b-34f7-4e90-b43b-6081c41b73b3', '1226cd4e-8280-4475-9beb-a65d7179d487', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Under storage at warehouse', '2024-06-11', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'DUBAI', 'Tanjung Perak', 'Muara Angke', NULL, NULL, 'DXBWH2406003', 1, '2024-06-11 13:19:18.267621', 'dubai@pamcargo.com', '2024-06-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, '96b2b385-74e3-451a-84f3-88fea05e1d42', 'PAM INDONESIA', '2fdc8d90-b6be-4854-a84d-f9c71ab88b41', 'ELECTRONICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('39393fac-4390-4a21-ae1c-49d9eeb12671', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', 'e494804a-07a1-4b78-afdf-ed890c144251', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAEXPORT', 'LCL', 'Split', 'CIP', NULL, NULL, 'Arrived in destination airport', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAEXPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ABU DHABI', 'APL HOLLAND', NULL, 'DXBSE2406009', 1, '2024-06-04 10:17:06.322347', 'dubai@pamcargo.com', '2024-06-11 00:00:00', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 46, '2024-06-12', NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('65571c6b-b369-4ca9-a27d-0feef90bfc5d', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '8b396746-5a30-4e39-84a4-89185a1ea96c', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Loading Completed', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAIMPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABERDEEN', 'ABERDEEN', 'ABERDEEN', 'APL HOLLAND', NULL, 'DXBSI2407002', 1, '2024-07-22 14:53:29.92534', 'dubai@pamcargo.com', '2024-08-06 00:00:00', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 5, '2024-06-12', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('a221ef20-676e-4701-a33d-da6d9a533008', '1226cd4e-8280-4475-9beb-a65d7179d487', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', 'FCL', 'Collect', 'FOB', NULL, NULL, 'Cargo delivered', '2024-06-25', NULL, NULL, 'DUBAI', 'WAREHOUSE', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'DUBAI', 'BEKASI', 'BANDUNG', NULL, NULL, 'DXBWH2406004', 1, '2024-06-25 10:56:51.981918', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAREHOUSE', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', '1226cd4e-8280-4475-9beb-a65d7179d487', '90056126-4d03-4c30-8eca-43f941372df6', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIREXPORT', 'Loading Type', 'Prepaid', 'CIF', NULL, NULL, 'Booking Received', NULL, NULL, NULL, 'DUBAI', 'AIREXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'ARROW AVIATIONSERVICES FZE', 'KING FAISAL ROAD SHARJAH', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'AARHUS', 'ABX AIR', NULL, 'DXBAE2406012', 1, '2024-06-11 12:03:23.100925', 'dubai@pamcargo.com', '2024-06-20 00:00:00', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 23, NULL, '2833624f-6b70-4b05-97d5-940a30379001', 'PAM SWEDEN', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-30', '2024-07-01', '2024-07-06', 'A001', NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('e11dbcc7-4743-4ad7-a8e7-aff1323a1466', '1226cd4e-8280-4475-9beb-a65d7179d487', '60c1ad2c-b77b-4b9f-ab14-09c3d768c0df', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'LCL', 'Prepaid', 'CFR', NULL, NULL, 'Cargo received', '2024-06-11', NULL, NULL, 'DUBAI', 'TRUCKING', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'ANHUI IDEA IMP AND EXP CO LTD', 'HEIFEI, ANHUI CHINA', 'DUBAI', 'Bekasi', 'Bandung', NULL, NULL, 'DXBTC2406008', 1, '2024-06-11 14:46:17.113544', 'dubai@pamcargo.com', '2024-06-11 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b34f807d-0526-442f-8b25-a1134de5ab21', '1226cd4e-8280-4475-9beb-a65d7179d487', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'a07992ba-02bf-49d1-966e-7a98755847ac', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Received by shipping line', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAEXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ÅBO (TURKU)', 'ÅBO (TURKU)', 'ABBOT POINT', 'APL HOLLAND', NULL, 'DXBSE2406011', 1, '2024-06-11 11:43:58.203815', 'dubai@pamcargo.com', '2024-06-19 00:00:00', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 39, '2024-06-12', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('7cd31e9b-c624-479a-bd93-cc09a60a9ee6', '1226cd4e-8280-4475-9beb-a65d7179d487', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '23779767-545b-42aa-9890-01c90c844600', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Closed/ Finish shipment', '2024-07-22', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABIDJAN', 'ABIDJAN', 'ABIDJAN', NULL, NULL, 'DXBSI2407003', 1, '2024-07-22 14:55:23.889824', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', '1226cd4e-8280-4475-9beb-a65d7179d487', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Cargo received', '2024-06-26', NULL, NULL, 'DUBAI', 'TRUCKING', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'DUBAI', 'JAKARTA', 'BANDUNG', NULL, NULL, 'DXBTC2406010', 1, '2024-06-26 09:45:04.081977', 'dubai@pamcargo.com', '2024-06-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRUCKING', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b91e189f-9077-41bb-8b38-d82209f3b293', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Closed/ Finish shipment', '2024-07-22', NULL, NULL, 'DUBAI', 'SEAIMPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'ABBOT POINT', 'ABBOT POINT', 'ABBOT POINT', NULL, NULL, 'DXBSI2407001', 1, '2024-07-22 14:36:25.183296', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('41ccf845-9e64-4efb-859d-15395753657d', '6812bd03-a528-438b-ab89-0c01927a3da9', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '23779767-545b-42aa-9890-01c90c844600', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', 'Notify Party', NULL, 'Loading Completed', '2024-06-11', '2024-06-11', NULL, 'DUBAI', 'SEAIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABIDJAN', 'ABIDJAN', 'ABBOT POINT', 'APL HOLLAND', NULL, 'DXBSI2406013', 1, '2024-06-11 10:35:35.232002', 'dubai@pamcargo.com', '2024-06-11 00:00:00', NULL, NULL, '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 5, '2024-06-12', '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('537f09e9-a2db-4bc4-91a2-0f3c1557eb78', '50152892-6fc5-463c-b996-4baccfe6c793', '69d40226-3e81-4822-8785-899c088394c2', '533219ad-bfa1-4cf6-87f9-fce85748a647', '1c5b2bbf-efd4-498f-86b2-d01d558e6a81', 'c5da1852-9b88-46ef-848b-b0a98cddd2f1', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'LCL', 'Split', 'CIF', NULL, NULL, 'Container Onboard', '2024-06-01', '2024-06-11', '2024-06-12', 'DUBAI', 'SEAIMPORT', 'DAILY BLUE', '1300 FACTORY PLACE UNIT 308 
LOS ANGELES, CA 90013                                                           
(323) 868-8192', 'CVL COSMETIC MIDDLE EAST DMCC', 'PLOT NO.JLT-PH1-N1,THE DOME TOWER DUBAI AE,TL:971561600408', 'CASABLANCA', 'CASABLANCA', 'AMSTERDAM', 'APL HOLLAND', NULL, 'DXBSI2406002', 1, '2024-05-27 11:09:16.248624', 'dubai@pamcargo.com', '2024-08-07 00:00:00', NULL, '2024-06-12', '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 6, '2024-06-12', NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('6637d456-b568-452c-bf72-61f3afb3ddc1', '1226cd4e-8280-4475-9beb-a65d7179d487', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAEXPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Delivered to consignee', '2024-07-22', '2024-06-11', '2024-06-12', 'DUBAI', 'SEAEXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABERDEEN', 'ABERDEEN', 'ABBOT POINT', 'APL HOLLAND', NULL, 'DXBSE2407001', 1, '2024-07-22 14:58:42.071785', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, '2024-06-12', '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 48, '2024-06-12', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAEXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('db6374b7-a237-4d38-9525-5fc87e03c8b9', '6812bd03-a528-438b-ab89-0c01927a3da9', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', 'FCL', 'Prepaid', 'CIF', NULL, NULL, 'Delivered to final consignee', '2024-06-13', NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAI2406013', 1, '2024-06-13 14:30:48.072185', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 52, NULL, NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-14', '2024-06-15', '2024-06-15', '212', NULL, NULL, 'AIRIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('3217d8fb-8c52-445d-a870-ac91a6d33135', '1226cd4e-8280-4475-9beb-a65d7179d487', 'e338c277-c2a6-4303-96d6-16a545a6c7dc', '533219ad-bfa1-4cf6-87f9-fce85748a647', '35b0c6e1-dba7-41f0-8081-a001910b6fad', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, NULL, NULL, NULL, NULL, 'AIREXPORT', 'Loading Type', 'Prepaid', 'CFR', NULL, NULL, 'Closed/ Finish Shipment', '2024-06-20', NULL, NULL, 'DUBAI', 'AIREXPORT', 'AL NABOODAH LOGISTICS LLC', 'PO BOX 624255
DUBAI WORLD TRADE CENTER
DUBAI UAE', '4EVAC', 'INDUSTRIEWEG 87 2651 BERKEL EN RODENRIJS', 'AALBORG', 'AALBORG', 'AALEN-HEIDENHEIM', NULL, NULL, 'DXBAE2406013', 1, '2024-06-20 17:38:18.740707', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, NULL, NULL, NULL, NULL, '4086e0a3-a7d4-4041-97a7-25dbb58272fb', NULL, 36, NULL, '1e9f8683-8f6c-4e36-b984-7bfe95f0814b', 'PAM FRANCE', '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-14', '2024-06-15', '2024-06-15', '212', NULL, NULL, 'AIREXPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('b5c3b066-2b07-4a63-a664-587413519156', '6812bd03-a528-438b-ab89-0c01927a3da9', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '23ca88f8-76fe-460a-b413-0b27b3cbf8ba', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Cancel', '2024-07-22', '2024-06-11', '2024-06-12', 'DUBAI', 'SEAIMPORT', 'AL NOUF BUILDING MATERIAL TRADING', 'LUCKU RA AJMAN
UAE', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABERDEEN', 'ABERDEEN', 'ABBOT POINT', 'APL HOLLAND', NULL, 'DXBSI2407004', 1, '2024-07-22 15:02:09.077137', 'dubai@pamcargo.com', '2024-07-23 00:00:00', NULL, '2024-06-12', '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 11, '2024-06-12', NULL, NULL, '02a57c44-49a9-4536-8ab1-59de83e45f16', 'FOOTWEAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('d81d596f-2c74-46b6-9d44-b94e96693a4f', 'ef70c955-53a2-4963-a3df-bd0e4ad78d55', 'b31db435-cc65-4ffe-922b-ecd68cf64d24', '533219ad-bfa1-4cf6-87f9-fce85748a647', '8b396746-5a30-4e39-84a4-89185a1ea96c', '33a4b77d-792e-4498-9439-c10506695992', NULL, '119892d8-e20b-4833-a439-1e7ef3d08516', NULL, NULL, NULL, 'SEAIMPORT', 'FCL', 'Prepaid', 'CFR', NULL, NULL, 'Cancel', '2024-07-22', '2024-06-11', '2024-06-12', 'DUBAI', 'SEAIMPORT', 'ALFA-PHARM IMPORT CJSC', '1/68 SHIRAKI ST
YERVAN 0043 RA
ARMENIA, TEL: +374 11 700500', 'AIRGAS USA LLC', '9030 NW 58TH STREET DORAL FL 33178 US', 'ABERDEEN', 'ABERDEEN', 'ABU DHABI', 'APL HOLLAND', NULL, 'DXBSI2407005', 1, '2024-07-22 17:38:16.092267', 'dubai@pamcargo.com', '2024-07-22 00:00:00', NULL, '2024-06-12', '11', NULL, '2024-06-11', 'cfec6e4a-6ade-442b-802f-863abd7f78b6', NULL, 11, '2024-06-12', NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SEAIMPORT', NULL, 0);
INSERT INTO "dxb"."shipping_instruction" VALUES ('912bd056-3711-487a-a1d5-a884046fc254', 'f7059d20-7cb0-46bb-83e6-1df4f8311aff', 'dec0fb34-79fe-48bd-b336-8322dbdcc459', '533219ad-bfa1-4cf6-87f9-fce85748a647', 'd5cdae85-0e42-4d49-9f3c-e0ff5fff8e38', 'b2e2490e-8a3a-4483-9461-fe4278f8c5b9', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', NULL, NULL, NULL, 'AIRIMPORT', 'AIR IMPORT', 'Split', 'CIF', NULL, NULL, 'In transit', NULL, NULL, NULL, 'DUBAI', 'AIRIMPORT', 'AVISH AQUATECH TRADING LLC', 'UNIT NO. 03-2101 21ST FLOOR，THE METROPOLIS TOWER,
BUSINESS BAY，DUBAI. UAE
TEL:+971 4 285 2520', 'AL ABBAS TRADING CO LLC', 'KING FAISAL STREET
PO BOX 5423, SHARJAH, UAE
TEL: +971 6 5595271', 'ABBEVILLE', 'ABBEVILLE', 'ABADAN', 'ABX AIR', NULL, 'DXBAI2406011', 1, '2024-06-04 10:37:00.620352', 'dubai@pamcargo.com', '2024-08-06 00:00:00', NULL, NULL, NULL, NULL, NULL, '31c52960-bfbd-4c5d-a8bf-320db8f96a8f', NULL, 28, NULL, NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '2024-06-30', NULL, NULL, NULL, NULL, NULL, 'AIRIMPORT', NULL, 0);

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
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('41e8e812-7143-455f-9fdf-0db22139a3b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('ab49df81-a7ed-4d0d-b519-7c3e976ca013', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('352b8464-7bc5-47a5-afce-07d6e052e360', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2f4b6724-4980-484c-8faf-58f24439a47f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('c17e7a19-95e1-4a91-898d-5d3c238003f9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6c8e8768-46b2-4209-ba8e-b03bc2c60113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('537f09e9-a2db-4bc4-91a2-0f3c1557eb78', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('69a5a94b-b7c5-405c-9d43-dd81280eae75', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('d3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6bcccf97-9c8d-4373-bde9-076a0caa0436', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6ab1464a-5895-41eb-b67c-19dd743c27f4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3117a224-6a04-458c-a624-f2a7f2037f56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('ca1e6202-587a-4326-94cf-d3e161a273fa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('53d59b90-626c-4af8-a858-651186572d91', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6d9d4ea7-8547-4a76-93ba-f2fe31892701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('0095a867-c7cd-480d-93f5-c12e61a8c7da', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('4de4babe-69d0-430a-8923-b8764a925ed0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('a1d653c3-f716-4ce3-8469-6af1173ef79b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('d54a473d-38f7-4df6-bc03-2ec06088d880', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('40c393f6-a567-46f9-9b33-46774d70c484', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('07af919c-2586-452e-b021-c6de8a3c83a1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('39393fac-4390-4a21-ae1c-49d9eeb12671', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b01f25e8-fed4-4190-87c1-640d6a084b7c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('a0df10f1-6174-4dd5-adda-afc69cbdddd1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b053010e-4219-43a6-a56d-b292f39e25c5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('eda254dc-bb8a-4800-a014-8330dbf0975b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b4bedcef-ea49-42e9-b3be-da59c36e166e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('8923a3a6-109d-47e6-b7fa-f860c5eabe3d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('4fefff4e-e463-4393-b5a6-6c7f1f7ef265', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('c8687520-d7c8-4058-997c-961c713c18aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('1b811059-ca80-4603-855e-86f9890a1805', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('912bd056-3711-487a-a1d5-a884046fc254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('fe033103-040c-468f-91d8-cb934482c594', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('10f6d5dc-d708-4351-a1e3-35c62cfdc76c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('677a92fe-283a-4518-a2d5-705feac53126', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('815a6c7a-38da-4598-b246-ce426cf58737', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('08052673-0558-49ee-abb9-80f127ff8ac2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2468ea51-4c64-4bf9-816b-daf2c07d1aa6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6bd85111-f46b-465f-8cb4-d1cdedad6da7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('52fd6c66-4dd5-430c-bfde-7491110dab24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2412c9de-563d-4fed-8ac8-73e780621984', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('09b7d475-b92c-43ca-87c6-e7ec070848e9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('bb619a92-9823-42a0-8466-7a60d7d21446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3c244936-60ba-4c50-a230-51ea58cd9427', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('abd29adf-78e7-48db-85c0-b346c8f3808e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('48a6111b-9244-4ea0-8c07-2350db07254d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('a2e2282f-d196-4ba0-ad88-3e04b388b0de', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3b848e3a-f9b1-4944-895e-f6a83f034bef', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('abe1cc11-8667-4b0b-b9c6-a79272575402', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('2088a818-0433-45b7-9110-1dbae3b9a9b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('41ccf845-9e64-4efb-859d-15395753657d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3e9d64c1-1587-422c-b74f-49559eec819e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b34f807d-0526-442f-8b25-a1134de5ab21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6ea5972e-7192-491b-b67b-1716a88eecb6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6007ef0b-34f7-4e90-b43b-6081c41b73b3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('e11dbcc7-4743-4ad7-a8e7-aff1323a1466', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('db6374b7-a237-4d38-9525-5fc87e03c8b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('e502484f-0d0b-45dc-b8c3-b221899db262', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('3217d8fb-8c52-445d-a870-ac91a6d33135', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('a221ef20-676e-4701-a33d-da6d9a533008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('dc98c4da-32a6-4b86-b48a-0fbca09a1c18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b91e189f-9077-41bb-8b38-d82209f3b293', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('65571c6b-b369-4ca9-a27d-0feef90bfc5d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('7cd31e9b-c624-479a-bd93-cc09a60a9ee6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('6637d456-b568-452c-bf72-61f3afb3ddc1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('b5c3b066-2b07-4a63-a664-587413519156', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."shipping_instruction_detail" VALUES ('d81d596f-2c74-46b6-9d44-b94e96693a4f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  "vol_weight" float8
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
INSERT INTO "dxb"."si_order" VALUES ('876dcf06-84fb-4828-b1c3-d46d7ae22481', '41e8e812-7143-455f-9fdf-0db22139a3b9', 20, 'PCS', NULL, 100, 0.16, 'Testing new shipment (SEA-IMPORT)', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('406e280e-f5e2-490b-8895-34c362da5261', 'ab49df81-a7ed-4d0d-b519-7c3e976ca013', 10, 'COLLIE', NULL, 100, 0.06, 'Testing new shipment (SEA-EXPORT)', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 9.999);
INSERT INTO "dxb"."si_order" VALUES ('b0b6d33b-cf06-4d75-a8a4-a4a45bca04cf', '352b8464-7bc5-47a5-afce-07d6e052e360', 30, 'COLLIE', NULL, 10, 530.64, 'Testing new shipment (AIR-IMPORT)', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88436.5, 88436.462);
INSERT INTO "dxb"."si_order" VALUES ('2f5b85a1-5c37-4b6c-b554-5c931409fdee', '9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', 20, 'BOX', NULL, 200, 0.24, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, 39.998);
INSERT INTO "dxb"."si_order" VALUES ('9e718f88-9683-439f-97e5-f0ad89ac100c', '365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', 10, 'PALLETS', NULL, 30, 0.02, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 3.333);
INSERT INTO "dxb"."si_order" VALUES ('70c51374-591e-463d-8990-7ecd6517df5c', '2f4b6724-4980-484c-8faf-58f24439a47f', 30, 'BOX', NULL, 25, 0.054, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 8.999);
INSERT INTO "dxb"."si_order" VALUES ('bc763b99-e4f9-4fc8-9792-6adfb03e580c', 'c17e7a19-95e1-4a91-898d-5d3c238003f9', 100, 'BOX', NULL, 10, 0.2, 'Testing warehouse', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33.5, 33.332);
INSERT INTO "dxb"."si_order" VALUES ('35f6f933-a9d8-4092-81fd-0ef6dc093480', '3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', 10, 'BOX', NULL, 25, 0.03, 'Teseting trucking', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 4.999);
INSERT INTO "dxb"."si_order" VALUES ('40a61c7a-b3e5-4548-8a88-a0e0083edb04', '6c8e8768-46b2-4209-ba8e-b03bc2c60113', 10, 'COLLIE', NULL, 100, 0.016, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 2.666);
INSERT INTO "dxb"."si_order" VALUES ('128ff7f4-f0fd-4dbb-b39f-d6a9ede1d37b', '410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', 10, 'CARTON', NULL, 20, 0.02, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 3.333);
INSERT INTO "dxb"."si_order" VALUES ('7e54e5ab-717b-4607-9cea-6e03645f0f86', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', 100, 'COLLIE', NULL, 20, 0.2, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33.5, 33.332);
INSERT INTO "dxb"."si_order" VALUES ('1cc5adee-dd19-4939-a636-d11b880052dc', '69a5a94b-b7c5-405c-9d43-dd81280eae75', 10, 'CARTON', NULL, 10, 0.02, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 3.333);
INSERT INTO "dxb"."si_order" VALUES ('d8858a4f-3436-4c94-ba77-074faacd42e2', 'd3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', 10, 'CARTON', NULL, 20, 0.04, 'Testing new shipment localbusiness SEA-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 6.666);
INSERT INTO "dxb"."si_order" VALUES ('ca2603f7-da3b-48cc-aa92-c5d2bfd7106c', '8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', 20, 'BOX', NULL, 20, 0.12, 'Testing new shipment localbusiness SEA-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 19.999);
INSERT INTO "dxb"."si_order" VALUES ('f92d0808-923e-446f-9f0a-93da2845f2db', '6bcccf97-9c8d-4373-bde9-076a0caa0436', 20, 'COLLIE', NULL, 30, 14.96, 'Testing new shipment localbusiness SEA-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2493.5, 2493.233);
INSERT INTO "dxb"."si_order" VALUES ('0603cc31-7b01-4a3e-9217-e0d838c6dfc7', '4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', 20, 'CASES', NULL, 20, 0.24, 'Testing new shipment localbusiness SEA-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 39.998);
INSERT INTO "dxb"."si_order" VALUES ('72c4297a-016e-4f29-b584-31412cf0d2db', '6ab1464a-5895-41eb-b67c-19dd743c27f4', 20, 'CARTON', NULL, 30, 0.16, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('2559079a-d038-4626-b198-7255aa159763', '56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', 30, 'BAGS', NULL, 30, 0.81, 'Testing new shipment localbusiness', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('48716ad0-4e1f-4a1a-8bc1-373c5d5834a2', '3117a224-6a04-458c-a624-f2a7f2037f56', 30, 'COLLIE', NULL, 20, 0.36, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 59.997);
INSERT INTO "dxb"."si_order" VALUES ('e65a46be-a477-42b8-8273-aa854aad6051', '53d59b90-626c-4af8-a858-651186572d91', 20, 'ROLLS', NULL, 40, 0.16, 'Tesiing new shipment localbusiness', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('1e15bfab-e590-40d1-92f2-f7cdcc04041d', '6d9d4ea7-8547-4a76-93ba-f2fe31892701', 30, 'COLLIE', NULL, 30, 0.36, 'Testign new shipment SEA-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 59.997);
INSERT INTO "dxb"."si_order" VALUES ('aa573ce9-cae2-45cd-af62-25e586207e86', '0095a867-c7cd-480d-93f5-c12e61a8c7da', 30, 'ROLLS', NULL, 30, 0.81, 'Testing new shipment SEA-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('0c9140c8-9f02-4b98-b0ac-fd82b8cbb97b', '4de4babe-69d0-430a-8923-b8764a925ed0', 40, 'PALLETS', NULL, 40, 2.56, 'Testing new shipment localbusiness SEA_EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 427, 426.649);
INSERT INTO "dxb"."si_order" VALUES ('d5973718-5b8a-4654-af65-db085da164ce', 'a1d653c3-f716-4ce3-8469-6af1173ef79b', 30, 'BAILS', NULL, 60, 0.24, 'Testing new shipment localbusiness SEA-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 39.998);
INSERT INTO "dxb"."si_order" VALUES ('1a990df0-7a5d-4f74-90b4-5813c7e47f7e', 'd54a473d-38f7-4df6-bc03-2ec06088d880', 30, 'COLLIE', NULL, 50, 0.18, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 29.998);
INSERT INTO "dxb"."si_order" VALUES ('39697b16-22d7-47f3-a2cb-cc2cab41eea7', '40c393f6-a567-46f9-9b33-46774d70c484', 40, 'ROLLS', NULL, 30, 0.48, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, 79.996);
INSERT INTO "dxb"."si_order" VALUES ('7c76bb03-6020-46af-81a5-2e8dab1df5b3', '2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', 20, 'CASES', NULL, 30, 0.24, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 39.998);
INSERT INTO "dxb"."si_order" VALUES ('2eaed15d-a459-4a18-aa45-6d4a4d89ab8f', '07af919c-2586-452e-b021-c6de8a3c83a1', 20, 'BOX', NULL, 40, 18.48, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3080, 3079.876);
INSERT INTO "dxb"."si_order" VALUES ('912a74df-6bfa-4921-a98d-dd47b57a0d0b', 'b01f25e8-fed4-4190-87c1-640d6a084b7c', 20, 'BOX', NULL, 20, 0.16, 'Testing new shipment AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('843d9ae3-ebc3-4e5a-9897-f0820c61a1e4', 'a0df10f1-6174-4dd5-adda-afc69cbdddd1', 30, 'BOX', NULL, 30, 0.12, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 19.999);
INSERT INTO "dxb"."si_order" VALUES ('577686de-d905-46d7-8779-a9eb899f255d', 'b053010e-4219-43a6-a56d-b292f39e25c5', 20, 'BOX', NULL, 50, 0.16, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('18dac94f-31ae-4b44-977d-188a531001c8', 'eda254dc-bb8a-4800-a014-8330dbf0975b', 10, 'COLLIE', NULL, 30, 0.08, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 13.332);
INSERT INTO "dxb"."si_order" VALUES ('c54842c4-9d81-4b6f-b364-12cac7be4921', 'b4bedcef-ea49-42e9-b3be-da59c36e166e', 200, 'PALLETS', NULL, 20, 0.4, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, 66.664);
INSERT INTO "dxb"."si_order" VALUES ('2df3e5ca-cfe9-4bda-9863-fd5a71a5614d', '8923a3a6-109d-47e6-b7fa-f860c5eabe3d', 20, 'COLLIE', NULL, 40, 0.06, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 9.999);
INSERT INTO "dxb"."si_order" VALUES ('a47a8527-f997-459e-9f91-9ed16502b42a', '4fefff4e-e463-4393-b5a6-6c7f1f7ef265', 20, 'COLLIE', NULL, 30, 0.54, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 89.996);
INSERT INTO "dxb"."si_order" VALUES ('0df50384-6a2d-4045-b09b-72a553aafd1e', 'c8687520-d7c8-4058-997c-961c713c18aa', 30, 'COLLIE', NULL, 50, 0.81, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('0c0da666-2e82-43fd-99c5-809a3ba5ae72', '6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', 10, 'COLLIE', NULL, 20, 0.01, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1.666);
INSERT INTO "dxb"."si_order" VALUES ('926a1992-03be-41db-b610-464fe7b4456c', '1b811059-ca80-4603-855e-86f9890a1805', 20, 'COLLIE', NULL, 20, 0.16, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('6f064c91-897e-4ce1-80f7-04449286d4a2', 'fe033103-040c-468f-91d8-cb934482c594', 200, 'BOX', NULL, 40, 0.4, 'Testing new shipment localbusiness AIR-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, 66.664);
INSERT INTO "dxb"."si_order" VALUES ('dbe69db8-1505-45bb-ac49-825403241eb5', '10f6d5dc-d708-4351-a1e3-35c62cfdc76c', 200, 'BOX', NULL, 30, 3.6, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600, 599.976);
INSERT INTO "dxb"."si_order" VALUES ('05099895-b17e-442a-b836-3dc80f4c0166', '677a92fe-283a-4518-a2d5-705feac53126', 300, 'PALLETS', NULL, 30, 1.8, 'Testing new shipment localbusiness AIR-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300, 299.988);
INSERT INTO "dxb"."si_order" VALUES ('d49217bc-a889-4435-8446-24b5f0e008d5', '815a6c7a-38da-4598-b246-ce426cf58737', 20, 'COLLIE', NULL, 30, 0.16, 'Testing new shipment localbusiness AIR-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('d070a836-ebbe-4e26-9c2b-4abb284e3358', '08052673-0558-49ee-abb9-80f127ff8ac2', 20, 'PALLETS', NULL, 30, 0.12, 'Testing new shipment localbusiness AIR-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 19.999);
INSERT INTO "dxb"."si_order" VALUES ('f4164c13-dac1-4abe-97d0-e12d3647572d', '39393fac-4390-4a21-ae1c-49d9eeb12671', 30, 'CARTON', NULL, 20, 0.72, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 'test', '11062024/si_doc - 110620241718081301.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, 119.995);
INSERT INTO "dxb"."si_order" VALUES ('2fcd941f-35fc-4410-86fd-d0170311a582', '2468ea51-4c64-4bf9-816b-daf2c07d1aa6', 20, 'COLLIE', NULL, 30, 0.16, 'Testing new shipment localbusiness', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('7608d702-778d-496d-92b7-a82adc410801', '6bd85111-f46b-465f-8cb4-d1cdedad6da7', 20, 'BOX', NULL, 30, 0.16, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('6239cd20-d753-4224-8cdd-326fc06e78a3', '52fd6c66-4dd5-430c-bfde-7491110dab24', 20, 'PCS', NULL, 40, 0.24, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 39.998);
INSERT INTO "dxb"."si_order" VALUES ('b8147d58-ca51-4c9a-8194-801d735aed02', '2412c9de-563d-4fed-8ac8-73e780621984', 20, 'BOX', NULL, 30, 0.08, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 13.332);
INSERT INTO "dxb"."si_order" VALUES ('77ecccdf-3c3f-4286-a141-546eaff65b74', '09b7d475-b92c-43ca-87c6-e7ec070848e9', 30, 'COLLIE', NULL, 20, 0.81, 'Testing new shipment localbusiness AIR-EXPORT', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('de65e7d0-cf2e-4243-a6e0-1fe0e7a6039a', 'bb619a92-9823-42a0-8466-7a60d7d21446', 20, 'PCS', NULL, 20, 0.16, 'Testing new shipment warehouse', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('87cf799d-eda8-4ef2-97d3-48e964caf597', '3c244936-60ba-4c50-a230-51ea58cd9427', 20, 'BOX', NULL, 20, 0.16, 'Testing new shipment warehouse', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('dc7cad37-03ac-4044-b342-6e9b58436c3b', 'abd29adf-78e7-48db-85c0-b346c8f3808e', 20, 'BOX', NULL, 20, 0.16, 'Testing shipment trucking', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('1313216f-db1f-4384-8f53-2b65cbf31670', '48a6111b-9244-4ea0-8c07-2350db07254d', 30, 'PCS', NULL, 20, 0.81, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('66cd5ccd-b130-47d4-a733-b3ab0c9f58d6', 'a2e2282f-d196-4ba0-ad88-3e04b388b0de', 30, 'CARTON', NULL, 20, 0.36, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, 59.997);
INSERT INTO "dxb"."si_order" VALUES ('62a19a3a-179a-43b1-939d-c8b659d12e92', '3b848e3a-f9b1-4944-895e-f6a83f034bef', 20, 'PCS', NULL, 20, 0.16, 'Testing shipment trucking', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('ee87cb2a-ded4-4eca-b81d-46d2137eb484', 'abe1cc11-8667-4b0b-b9c6-a79272575402', 40, 'PCS', NULL, 40, 2.56, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 427, 426.649);
INSERT INTO "dxb"."si_order" VALUES ('d12d975a-a5aa-47b2-8da6-b789002c4dda', '2088a818-0433-45b7-9110-1dbae3b9a9b9', 30, 'CARTON', NULL, 30, 0.81, 'Testing', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 135, 134.994);
INSERT INTO "dxb"."si_order" VALUES ('90972585-4458-40c9-a9c5-9d0907b4b6e1', 'ca1e6202-587a-4326-94cf-d3e161a273fa', 20, 'COLLIE', NULL, 30, 0.16, 'Testing new shipment', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, '05062024/si_doc - 050620241717557061.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('7424bc8f-3a0f-4ccd-a2d0-90d58cfe523c', '3e9d64c1-1587-422c-b74f-49559eec819e', 50, 'CARTON', NULL, 90, 6.25, 'desc', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1042, 1041.625);
INSERT INTO "dxb"."si_order" VALUES ('6afe7c1d-56b0-4227-9259-b23499a125e4', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', 10, 'CARTON', NULL, 45, 0.104, 'test', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 17.332);
INSERT INTO "dxb"."si_order" VALUES ('d87ee431-72f9-4a8d-b431-f6c35147f9fc', 'b91e189f-9077-41bb-8b38-d82209f3b293', 34, 'CARTON', NULL, 43, 1.336, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 223, 222.657);
INSERT INTO "dxb"."si_order" VALUES ('451a5a58-18e1-45fa-aa5b-0d29a76ed22c', '3217d8fb-8c52-445d-a870-ac91a6d33135', 10, 'CARTON', NULL, 10, 0.01, 'test', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 'test', '24062024/si_doc - 240620241719213810.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1.666);
INSERT INTO "dxb"."si_order" VALUES ('92f1bf28-3d50-4f97-a5a1-c41571825410', 'a221ef20-676e-4701-a33d-da6d9a533008', 10, 'CARTON', NULL, 10, 0.01, 'test', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, '25062024/si_doc - 250620241719291130.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1.666);
INSERT INTO "dxb"."si_order" VALUES ('b580660d-92fb-491f-b5ce-727e3618b97c', 'b34f807d-0526-442f-8b25-a1134de5ab21', 10, 'CARTON', NULL, 10, 0.06, 'desc', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, '19062024/si_doc - 190620241718787097.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 9.999);
INSERT INTO "dxb"."si_order" VALUES ('a2ae2e8a-0a75-4032-be15-5d4d3e791baa', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18', 45, 'CARTON', NULL, 64, 4.101, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 683.5, 683.472);
INSERT INTO "dxb"."si_order" VALUES ('794aeea0-4c8b-44d3-b62c-c1b13e32e2c8', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', 20, 'CARTON', NULL, 20, 0.16, 'desc', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, '11062024/si_doc - 110620241718082659.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 26.665);
INSERT INTO "dxb"."si_order" VALUES ('5f3096ee-4401-4620-a48b-d68181660ece', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', 10, 'CARTON', NULL, 10, 0.552, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, 'tes', '20062024/si_doc - 200620241718851891.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 91.996);
INSERT INTO "dxb"."si_order" VALUES ('14054b1e-4770-4cd1-b136-6b89bd7a9881', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', 24, 'CARTON', NULL, 21, 595.947, 'test', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, 'notes', '11062024/si_doc - 110620241718090873.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99321, 99320.527);
INSERT INTO "dxb"."si_order" VALUES ('a524b2fd-3636-44c4-b4a1-75e952a927d9', '6ea5972e-7192-491b-b67b-1716a88eecb6', 12, 'CARTON', NULL, 50, 0.142, 'test', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, 'test', '11062024/si_doc - 110620241718081740.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, 23.665);
INSERT INTO "dxb"."si_order" VALUES ('e98498e4-a3fa-40d9-9095-e134283531fe', '912bd056-3711-487a-a1d5-a884046fc254', 10, 'COLLIE', NULL, 20, 0.01, 'Testing new shipment localbusiness AIR-IMPORT', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, 'test', '10062024/si_doc - 100620241717990651.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1.666);
INSERT INTO "dxb"."si_order" VALUES ('681cc3f0-d5f6-48f8-a20f-a1fdf5a5c264', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', 10, 'CARTON', NULL, 10, 0.01, 'desc', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, '11062024/si_doc - 110620241718092174.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1.666);
INSERT INTO "dxb"."si_order" VALUES ('c565c9ea-35fd-4ab0-a794-4c1d0dbdd713', 'db6374b7-a237-4d38-9525-5fc87e03c8b9', 10, 'CARTON', NULL, 10, 0.552, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, 'tes', '20062024/si_doc - 200620241718851891.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, 91.996);
INSERT INTO "dxb"."si_order" VALUES ('8f967a95-c589-46c3-879b-8fecabf2c25e', '41ccf845-9e64-4efb-859d-15395753657d', 100, 'CARTON', NULL, 10, 100, 'desc test', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, '11062024/si_doc - 110620241718079270.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16666, 16666);
INSERT INTO "dxb"."si_order" VALUES ('d6f43590-5837-4b45-8acc-e84321043ea3', 'b5c3b066-2b07-4a63-a664-587413519156', 34, 'CARTON', NULL, 12, 1.336, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 223, 222.657);
INSERT INTO "dxb"."si_order" VALUES ('b4550b0b-ac18-4c38-ac70-24488db90488', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18', 45, 'CARTON', NULL, 64, 4.101, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 683.5, 683.472);
INSERT INTO "dxb"."si_order" VALUES ('b7719202-7b2b-4411-96c3-650bfcd96b8a', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', 100, 'CARTON', NULL, 10, 27.611, 'test', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, '26062024/si_doc - 260620241719375284.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4602, 4601.649);
INSERT INTO "dxb"."si_order" VALUES ('f0296b56-1b90-4d04-bad2-b7f6f7eb2809', '6637d456-b568-452c-bf72-61f3afb3ddc1', 54, 'CARTON', NULL, 34, 7.489, 'test', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1248.5, 1248.116);
INSERT INTO "dxb"."si_order" VALUES ('b6df8aba-655e-4724-8080-b57f0c54a88e', 'e502484f-0d0b-45dc-b8c3-b221899db262', 45, 'CARTON', NULL, 56, 4.101, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 683.5, 683.472);
INSERT INTO "dxb"."si_order" VALUES ('dbff4250-d73e-4096-87f5-1ff653e88d66', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', 56, 'CARTON', NULL, 56, 9.834, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1639, 1638.934);
INSERT INTO "dxb"."si_order" VALUES ('6d09e882-2764-47b5-81fd-2cfec4c0a9d5', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', 56, 'CARTON', NULL, 56, 9.834, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1639, 1638.934);
INSERT INTO "dxb"."si_order" VALUES ('29569b57-bbc4-4332-88ea-6d1fb2a8a04a', 'e502484f-0d0b-45dc-b8c3-b221899db262', 45, 'CARTON', NULL, 56, 4.101, 'test', NULL, NULL, NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 683.5, 683.472);
INSERT INTO "dxb"."si_order" VALUES ('883c7f64-9a3e-4526-a8e2-90e819443aea', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order" VALUES ('7136c11b-b515-45c7-8328-8e3c3413f2c9', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', 56, 'CARTON', NULL, 56, 13.575, 'test', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, '06082024/si_doc - 060820241722941965.pdf', '06082024/com_invoices_doc - 060820241722940189.pdf', '06082024/bil_doc - 060820241722941965.pdf', NULL, '06082024/final_alert_doc-060820241722941965.pdf', NULL, NULL, '06082024/packing_list_doc - 060820241722941872.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '05082024/ctd_doc - 050820241722840450.pdf', NULL, 2262.5, 2262.409);
INSERT INTO "dxb"."si_order" VALUES ('47904051-59d1-4514-84e1-63c4abddebd2', 'd81d596f-2c74-46b6-9d44-b94e96693a4f', 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "dxb"."si_order_detail" VALUES ('df6b68da-cdd4-4951-8f20-3e00e482ab11', '41e8e812-7143-455f-9fdf-0db22139a3b9', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('8fde719c-7368-450c-b7e0-d0c880d94d61', 'ab49df81-a7ed-4d0d-b519-7c3e976ca013', '002', '0043', '012023', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '0398', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('79a1906c-e322-4e94-a54a-b3d6c382673d', '352b8464-7bc5-47a5-afce-07d6e052e360', '001', '001', '01', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '1', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('bd9cc90c-575f-4a73-a6c5-be5c42ca9bdc', '9c9f1fd0-ae9a-4ad9-95dd-13cac87dc057', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('9f145ea5-db3c-4348-a1cf-fd324e904d51', '365bcd71-518e-4c37-85b2-ef8fa3fd5ba0', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2822ccb2-95be-4896-8c0f-02c80a6e7b3b', '2f4b6724-4980-484c-8faf-58f24439a47f', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('3b05bf1f-9ec1-4d7f-a89c-07a68637f273', 'c17e7a19-95e1-4a91-898d-5d3c238003f9', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('18eae611-11d3-4a3c-a832-0d6e19e45fd0', '3fec9603-a1c0-4f2c-aea8-bb2d41e762a9', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('788c4c4a-3102-4f5b-8947-69ecb7c01ff8', '6c8e8768-46b2-4209-ba8e-b03bc2c60113', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('62b2528f-aac2-4e1e-b6cd-2227c2359a08', '410a3d15-5ae4-4c2c-a355-cb0f03ef8cb5', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('1186d0fc-1dbe-4691-b3d7-9cf6fe5288dd', '537f09e9-a2db-4bc4-91a2-0f3c1557eb78', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('31d38a72-cc69-432b-a900-b957a47b7b6b', '69a5a94b-b7c5-405c-9d43-dd81280eae75', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('b4a395a9-6e49-4c9e-b7b7-d3ddb2b395a9', 'd3bbf757-f4c1-4b09-9cf0-6ab399d9c7e0', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, '0');
INSERT INTO "dxb"."si_order_detail" VALUES ('c8948ce3-4604-45a8-bf64-a1afdd85a8da', '8adc2a22-8a6b-4db5-b7f2-3d2c8ea11b67', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('d847f776-b65e-4d30-b853-79d208d6ac98', '6bcccf97-9c8d-4373-bde9-076a0caa0436', '0022', '002', '0002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '0002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('6614f720-4f7a-4390-8373-8ffe696325b8', '4e7ebbad-2d58-4cdf-ae5f-b8b5c39a23ab', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0ff6f1b8-e6bd-40c5-aa92-78c388067a0e', '6ab1464a-5895-41eb-b67c-19dd743c27f4', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('197ed620-500b-4ea5-8f1d-5ccbc78be2cb', '56baf38e-6ff8-4bbd-81a4-20e64ca6f0a8', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('afda025d-51d1-41f6-942b-cdbff0470ead', '3117a224-6a04-458c-a624-f2a7f2037f56', '002', '003', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('64a573e2-7712-4d45-a50b-17258fdbdda1', 'ca1e6202-587a-4326-94cf-d3e161a273fa', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0148d9a8-d9d6-4fee-8914-874c47821617', '53d59b90-626c-4af8-a858-651186572d91', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('572e0dac-5a21-41a0-97c7-8f999a2348a1', '6d9d4ea7-8547-4a76-93ba-f2fe31892701', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('1191c52f-ec10-42f0-b610-752f480e8397', '0095a867-c7cd-480d-93f5-c12e61a8c7da', '004', '004', '004', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '004', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('4b96ccff-dff4-4773-a8c9-683318aee478', '4de4babe-69d0-430a-8923-b8764a925ed0', '004', '004', '004', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '004', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('474780cb-e253-46d3-bea4-26530721e01d', 'a1d653c3-f716-4ce3-8469-6af1173ef79b', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('72dd182a-0804-48d8-afe0-67e5b6a69271', 'd54a473d-38f7-4df6-bc03-2ec06088d880', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('bcb2d6f9-9085-47cd-a2da-42f785ed923f', '40c393f6-a567-46f9-9b33-46774d70c484', '004', '004', '004', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '004', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('c3750072-a4b3-4d79-b956-de47a615e726', '2736ee27-1e47-43d4-bb1c-d8c3b1b6e3fa', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('08aa6970-b159-4a2a-b86b-e5377815910f', '07af919c-2586-452e-b021-c6de8a3c83a1', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('a9ebd34e-1bcd-4366-9c2a-7c4a3c428934', 'b01f25e8-fed4-4190-87c1-640d6a084b7c', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '0002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('11d0a6e5-cc39-4e2a-baa7-4ad80833c3ec', 'a0df10f1-6174-4dd5-adda-afc69cbdddd1', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('50c8d653-0d4d-44fb-9e7a-3ec404cce7e4', 'b053010e-4219-43a6-a56d-b292f39e25c5', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('47c79b06-293f-47fb-9257-8a8aacb67bf6', 'eda254dc-bb8a-4800-a014-8330dbf0975b', '002', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('58349ab2-0545-48f7-9eb2-51b7ea1a1828', 'b4bedcef-ea49-42e9-b3be-da59c36e166e', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('65e2504b-98d6-44b7-9a4a-20e67dea8c61', '8923a3a6-109d-47e6-b7fa-f860c5eabe3d', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0b6713c6-d746-4aae-ba83-f59e9d9828e8', '4fefff4e-e463-4393-b5a6-6c7f1f7ef265', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('333a9949-12e1-4462-b1aa-d5b5b43d5ad9', 'c8687520-d7c8-4058-997c-961c713c18aa', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('aa7e2b15-201a-492a-a5a6-823d80cdd015', '6e9e7ab4-b0cd-4eb4-b81a-4badbd7373a6', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('a068a4e6-e8f8-4c71-9609-7c1f2fe41404', '1b811059-ca80-4603-855e-86f9890a1805', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('b7bdb4e3-d24e-48dc-a498-16871acccedf', 'fe033103-040c-468f-91d8-cb934482c594', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('c78d47c6-198a-424a-ae70-3fc69a7f33e0', '10f6d5dc-d708-4351-a1e3-35c62cfdc76c', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('bfe7e975-0220-4f49-a2e6-c5c8d42a221d', '677a92fe-283a-4518-a2d5-705feac53126', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('894967d9-809e-497c-8cf4-6fa8c61add89', '815a6c7a-38da-4598-b246-ce426cf58737', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('dc041767-d872-43e5-bea9-fdd844b46742', '08052673-0558-49ee-abb9-80f127ff8ac2', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('eb56da8f-f892-4c39-9880-89d5b94a3fcd', '2468ea51-4c64-4bf9-816b-daf2c07d1aa6', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0084c461-20f4-40e4-b3fa-49521e537f6a', '6bd85111-f46b-465f-8cb4-d1cdedad6da7', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('8f6c4e64-c217-497c-9cc4-1520bac9819f', '52fd6c66-4dd5-430c-bfde-7491110dab24', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2e25bfa2-25b7-4b5f-97fe-0a9b4ff47ee6', '2412c9de-563d-4fed-8ac8-73e780621984', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('51d67d5c-8daf-462f-b79d-ece35f20ee09', '09b7d475-b92c-43ca-87c6-e7ec070848e9', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('9196d716-9d5e-4fa0-bf35-b55bcf9d3175', 'bb619a92-9823-42a0-8466-7a60d7d21446', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('b8fa3a92-20c7-45b1-b52a-820f82a42912', '3c244936-60ba-4c50-a230-51ea58cd9427', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('69720440-bbee-4c77-82b8-b39bf3ff1dd0', 'abd29adf-78e7-48db-85c0-b346c8f3808e', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0d235cfa-705a-4b82-addc-6f298b14674c', '48a6111b-9244-4ea0-8c07-2350db07254d', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('ec5b5b7a-9a16-405b-ae9b-1aaa8d8a78d3', 'a2e2282f-d196-4ba0-ad88-3e04b388b0de', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('357c57cd-0280-4b62-b7c8-26245391d413', '3b848e3a-f9b1-4944-895e-f6a83f034bef', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('5dbdf3a9-ad29-41a7-9b70-9b73bf729643', 'abe1cc11-8667-4b0b-b9c6-a79272575402', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('a30240ce-3de3-4d2c-b1b3-be83bbec002c', '2088a818-0433-45b7-9110-1dbae3b9a9b9', '003', '003', '003', NULL, 'dubai@pamcargo.com', NULL, NULL, 1, '003', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('23063926-b78e-46d5-bca9-5cc6386e1d8c', 'b34f807d-0526-442f-8b25-a1134de5ab21', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('b770d409-03a6-4461-bd72-8e95be10c6e9', '912bd056-3711-487a-a1d5-a884046fc254', '001', '001', '001', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, '001', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('9671721d-2e69-4f6d-bd87-7f86c8460834', '3e9d64c1-1587-422c-b74f-49559eec819e', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('8067695c-ef70-479d-b4cf-61f8f4a15fec', '39393fac-4390-4a21-ae1c-49d9eeb12671', '002', '002', '002', NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, '002', NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('0903d0f0-0ee3-42d3-b23d-6562d78127de', '9dcc3c1c-3d71-4145-8d4b-3ba33edff35b', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('527a6503-1da0-4f36-8618-bb234f7f0a44', '6007ef0b-34f7-4e90-b43b-6081c41b73b3', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('44b18f6f-4ba5-413b-b9f5-87005b40efb4', 'e11dbcc7-4743-4ad7-a8e7-aff1323a1466', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('a674b442-0d9f-4c0c-9a71-8a1a42d89ead', '41ccf845-9e64-4efb-859d-15395753657d', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('566d2f22-9a98-4e8f-8565-a3d7c37b52e5', '6ea5972e-7192-491b-b67b-1716a88eecb6', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2f81cfd5-83f4-4fc0-b33a-3212a5118cd9', '3217d8fb-8c52-445d-a870-ac91a6d33135', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2537987b-f300-4019-b942-835739fd1fc8', 'a221ef20-676e-4701-a33d-da6d9a533008', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('2909ad53-237e-4023-a9f7-2b1d21064096', 'b91e189f-9077-41bb-8b38-d82209f3b293', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('ecedee16-b953-4358-9678-7fd856039799', 'b91e189f-9077-41bb-8b38-d82209f3b293', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('22b27b1c-6e78-4d99-b07c-ab9795e9de2c', 'b91e189f-9077-41bb-8b38-d82209f3b293', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('520c965c-5fae-4e87-9503-4ab5e9e98c0f', '65571c6b-b369-4ca9-a27d-0feef90bfc5d', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('fd02e50c-8970-404a-af63-4a43c88dad89', '0aa9f735-d5c7-4b74-b8c8-2a6abcd6f593', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('755f5867-fac3-4eb3-8fe9-62c26efa6662', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('dd347de5-1d0b-4dec-b28f-d6972f86de26', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('eac5ba73-ba31-4f77-97fb-ac5530bff731', '7cd31e9b-c624-479a-bd93-cc09a60a9ee6', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('58c6e905-c195-4f97-9da3-f029bb0baa1c', '6637d456-b568-452c-bf72-61f3afb3ddc1', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('b70d9caf-99cd-4f45-9fe8-a05c5f382c66', '0ded26ec-a390-4b5e-8bfb-7d53d07b4a90', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('e82bd496-0056-42c9-983d-3d58ca587b70', 'e502484f-0d0b-45dc-b8c3-b221899db262', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('ff263017-57c7-40cb-88f4-982caca927e2', 'dc98c4da-32a6-4b86-b48a-0fbca09a1c18', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "dxb"."si_order_detail" VALUES ('35139b75-44a0-4847-bf50-efee8b2065bd', 'b5c3b066-2b07-4a63-a664-587413519156', NULL, NULL, NULL, NULL, 'dubai@pamcargo.com', NULL, 'dubai@pamcargo.com', 1, NULL, NULL, NULL);

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
  "shipment_type" varchar(12) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO "dxb"."status" VALUES (1, 'Booking Received', '2023-01-31 00:00:00', NULL, NULL, 'admin@gmail.com', '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (2, 'Booking Confirmed/Approved', '2023-02-28 00:00:00', 'admin@gmail.com', '2023-02-28 07:24:02', NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (3, 'Cargo Received CFS', '2023-01-31 00:00:00', NULL, NULL, 'admin@gmail.com', '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (4, 'Under Custom Clereance', '2023-01-31 00:00:00', NULL, NULL, NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (5, 'Loading Completed', '2023-01-31 00:00:00', NULL, NULL, NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (6, 'Container Onboard', '2023-02-17 00:00:00', NULL, '2023-02-17 03:08:28', NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (7, 'Vessel Departed', '2023-02-17 00:00:00', NULL, '2023-02-17 03:09:05', NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (8, 'In transit other port', '2023-01-31 00:00:00', NULL, NULL, NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (9, 'Arrived in transit port', '2023-01-31 00:00:00', NULL, NULL, 'admin@gmail.com', '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (10, 'Vessel Delay', '2023-01-31 00:00:00', NULL, NULL, NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (11, 'Cancel', '2023-02-02 00:00:00', NULL, NULL, NULL, '16', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (12, 'Departured from transit port', '2023-04-04 08:31:21', NULL, '2023-04-04 08:31:21', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (13, 'Arrived in Jebel Ali', '2023-03-28 15:32:15', NULL, '2023-04-04 08:32:16', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (14, 'Transit hub operations', '2023-04-04 08:32:53', NULL, '2023-04-04 08:32:53', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (15, 'Received by airline', '2023-04-04 08:33:14', NULL, '2023-04-04 08:33:14', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (16, 'Cargo airlifted', '2023-04-04 08:33:36', NULL, '2023-04-04 08:33:36', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (17, 'In transit other airport', '2023-04-04 08:33:56', NULL, '2023-04-04 08:33:56', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (18, 'Arrived in destination airport', '2023-04-04 08:34:23', NULL, '2023-04-04 08:34:23', NULL, '17,18', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (19, 'Under customs clearance', '2023-04-04 08:35:03', NULL, '2023-04-04 08:35:03', NULL, '19', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (20, 'Truck departed from airport', '2023-04-04 08:35:33', NULL, '2023-04-04 08:35:33', NULL, '19', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (21, 'Delivered to consignee', '2023-04-04 08:35:59', NULL, '2023-04-04 08:35:59', NULL, '19', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (22, 'Closed/ Finish shipment', '2023-04-04 08:36:23', NULL, '2023-04-04 08:36:23', NULL, '19', 'SEAAIR');
INSERT INTO "dxb"."status" VALUES (23, 'Booking Received', '2023-03-08 16:09:27', NULL, '2023-03-08 09:09:46', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (24, 'Booking Confirmed/Approved', '2023-03-08 16:10:17', NULL, '2023-03-08 09:10:32', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (25, 'Received in airport warehouse', '2023-03-08 16:10:55', NULL, '2023-03-08 09:11:04', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (26, 'Manifested', '2023-03-08 09:11:18', NULL, '2023-03-08 09:11:18', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (27, 'Departure', '2023-03-08 16:11:55', NULL, '2023-03-08 09:12:02', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (28, 'In transit', '2023-03-08 16:12:19', NULL, '2023-03-08 09:12:28', NULL, '17,18', 'AIR');
INSERT INTO "dxb"."status" VALUES (29, 'Transit hub operations', '2023-03-08 16:12:44', NULL, '2023-03-08 09:12:53', NULL, '17,18', 'AIR');
INSERT INTO "dxb"."status" VALUES (30, 'Cargo airlifted', '2023-04-04 08:39:32', NULL, '2023-04-04 08:39:32', NULL, '17,18', 'AIR');
INSERT INTO "dxb"."status" VALUES (31, 'In transit other air port', '2023-03-08 16:13:14', NULL, '2023-03-08 09:13:34', NULL, '17,18', 'AIR');
INSERT INTO "dxb"."status" VALUES (32, 'Arrived in destination port', '2023-04-04 08:37:08', NULL, '2023-04-04 08:37:08', NULL, '17,18', 'AIR');
INSERT INTO "dxb"."status" VALUES (33, 'Under custom clearance', '2023-04-14 10:13:04', NULL, '2023-04-14 10:13:10', NULL, '19', 'AIR');
INSERT INTO "dxb"."status" VALUES (34, 'Truck departed from airport', '2023-04-14 03:13:28', NULL, '2023-04-14 03:13:28', NULL, '19', 'AIR');
INSERT INTO "dxb"."status" VALUES (35, 'Delivered to consignee', '2023-04-14 03:13:55', NULL, '2023-04-14 03:13:55', NULL, '19', 'AIR');
INSERT INTO "dxb"."status" VALUES (36, 'Closed/ Finish Shipment', '2023-04-14 03:14:11', NULL, '2023-04-14 03:14:11', NULL, '19', 'AIR');
INSERT INTO "dxb"."status" VALUES (37, 'Cancel', '2023-04-14 03:17:17', NULL, '2023-04-14 03:17:17', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (38, 'Delay', '2023-04-14 03:17:38', NULL, '2023-04-14 03:17:38', NULL, '16', 'AIR');
INSERT INTO "dxb"."status" VALUES (39, 'Received by shipping line', '2023-05-23 10:06:47', NULL, '2023-05-23 10:06:47', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (40, 'Under origin Custom Clearance', '2023-05-23 10:07:19', NULL, '2023-05-23 10:07:19', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (41, 'Departed from origin port', '2023-05-23 10:08:59', NULL, '2023-05-23 10:08:59', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (42, 'In transit other port', '2023-05-23 10:09:21', NULL, '2023-05-23 10:09:21', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (43, 'Arrived in transit port', '2023-05-23 10:09:40', NULL, '2023-05-23 10:09:40', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (44, 'Transit hub operations', '2023-05-23 10:10:12', NULL, '2023-05-23 10:10:12', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (45, 'Departured from transit port', '2023-05-23 10:10:28', NULL, '2023-05-23 10:10:28', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (46, 'Arrived in destination airport', '2023-05-23 10:10:49', NULL, '2023-05-23 10:10:49', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (47, 'Under destination customs clearance', '2023-05-23 10:11:26', NULL, '2023-05-23 10:11:26', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (48, 'Delivered to consignee', '2023-05-23 10:11:40', NULL, '2023-05-23 10:11:40', NULL, '18', 'SEAEXPORT');
INSERT INTO "dxb"."status" VALUES (49, 'Cargo in transit', '2023-05-23 10:12:51', NULL, '2023-05-23 10:12:51', NULL, '18', 'AIRIMPORT');
INSERT INTO "dxb"."status" VALUES (50, 'Arrived in destination airport', '2023-05-23 10:13:41', NULL, '2023-05-23 10:13:41', NULL, '18', 'AIRIMPORT');
INSERT INTO "dxb"."status" VALUES (51, 'Under destination customs clearance', '2023-05-23 10:14:06', NULL, '2023-05-23 10:14:06', NULL, '18', 'AIRIMPORT');
INSERT INTO "dxb"."status" VALUES (52, 'Delivered to final consignee', '2023-05-23 10:14:47', NULL, '2023-05-23 10:14:47', NULL, '18', 'AIRIMPORT');
INSERT INTO "dxb"."status" VALUES (53, 'Cargo received', '2023-05-23 10:15:22', NULL, '2023-05-23 10:15:22', NULL, '18', 'WAREHOUSE');
INSERT INTO "dxb"."status" VALUES (54, 'Under storage at warehouse', '2023-05-23 10:15:45', NULL, '2023-05-23 10:15:45', NULL, '18', 'WAREHOUSE');
INSERT INTO "dxb"."status" VALUES (55, 'Cargo delivered', '2023-05-23 10:15:59', NULL, '2023-05-23 10:15:59', NULL, '18', 'WAREHOUSE');
INSERT INTO "dxb"."status" VALUES (56, 'Cargo received', '2023-05-23 10:16:36', NULL, '2023-05-23 10:16:36', NULL, '18', 'TRUCKING');
INSERT INTO "dxb"."status" VALUES (57, 'Loading completed', '2023-05-23 10:16:52', NULL, '2023-05-23 10:16:52', NULL, '18', 'TRUCKING');
INSERT INTO "dxb"."status" VALUES (58, 'In transit', '2023-05-23 10:17:04', NULL, '2023-05-23 10:17:04', NULL, '18', 'TRUCKING');
INSERT INTO "dxb"."status" VALUES (59, 'Offloading completed', '2023-05-23 10:17:21', NULL, '2023-05-23 10:17:21', NULL, '18', 'TRUCKING');
INSERT INTO "dxb"."status" VALUES (60, 'Cargo delivered', '2023-05-23 10:17:31', NULL, '2023-05-23 10:17:31', NULL, '18', 'TRUCKING');

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
ALTER SEQUENCE "dxb"."status_id_seq"
OWNED BY "dxb"."status"."status_id";
SELECT setval('"dxb"."status_id_seq"', 60, true);

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
-- Primary Key structure for table dimension
-- ----------------------------
ALTER TABLE "dxb"."dimension" ADD CONSTRAINT "dimension_pkey" PRIMARY KEY ("dimension_id");

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
-- Primary Key structure for table loading_plan_local
-- ----------------------------
ALTER TABLE "dxb"."loading_plan_local" ADD CONSTRAINT "loading_plan_local_pkey" PRIMARY KEY ("plan_id");

-- ----------------------------
-- Primary Key structure for table loading_report
-- ----------------------------
ALTER TABLE "dxb"."loading_report" ADD CONSTRAINT "loading_report_pkey" PRIMARY KEY ("loading_id");

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
-- Primary Key structure for table status
-- ----------------------------
ALTER TABLE "dxb"."status" ADD CONSTRAINT "status_pkey" PRIMARY KEY ("status_id");
