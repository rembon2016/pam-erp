/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : origin

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:25:33
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
)
;

-- ----------------------------
-- Records of agreed_rate
-- ----------------------------
INSERT INTO "origin"."agreed_rate" VALUES ('ca128ffe-0f7b-490d-bceb-2373cab61295', 'DDC', 'DOOR DELIVERY CHARGE', '419c892c-d7f5-4364-ba03-74d3129513b8', NULL, NULL, 'dubai@pamcargo.com', NULL, 'e3c17fb3-ee00-4ad4-baae-fa91f36ebe88', 1000.00, 'AED', 'KG', NULL);
INSERT INTO "origin"."agreed_rate" VALUES ('0a0d7a28-1379-4136-915f-8573a3667290', 'DDC', 'DOOR DELIVERY CHARGE', '6539bea7-2486-402d-9946-7f89e7ce25c5', NULL, NULL, 'dubai@pamcargo.com', NULL, 'e3c17fb3-ee00-4ad4-baae-fa91f36ebe88', 10.00, 'USD', 'TOTAL', NULL);
INSERT INTO "origin"."agreed_rate" VALUES ('a6045764-2c6d-4bf1-81ef-848cd6e01ffa', 'EXW', 'EX_WORK', '6539bea7-2486-402d-9946-7f89e7ce25c5', NULL, NULL, 'dubai@pamcargo.com', NULL, '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 3.00, 'USD', 'KG', NULL);
INSERT INTO "origin"."agreed_rate" VALUES ('37678a39-fae4-4f8b-b402-d089d0a3e164', 'HF', 'HANDLING FEE', '6539bea7-2486-402d-9946-7f89e7ce25c5', NULL, NULL, 'dubai@pamcargo.com', NULL, '511e66d7-4a63-447f-920b-1182219b8c78', 2.00, 'USD', 'KG', NULL);

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
-- Records of chat_note
-- ----------------------------

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
INSERT INTO "origin"."claim" VALUES ('164a0804-39a1-4f45-8cef-61739558c864', 200, 100, 'JKTSA2408003', 'thomas@pamcargo.com', NULL, NULL, NULL, 1, '56836892-8227-4108-aee2-1554b19e14f9', '2024-08-08 00:00:00', 'CLAIM-2408001', 't');

-- ----------------------------
-- Table structure for claim_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."claim_detail";
CREATE TABLE "origin"."claim_detail" (
  "claim_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "claim_id" uuid,
  "claim_type" int2,
  "description" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of claim_detail
-- ----------------------------
INSERT INTO "origin"."claim_detail" VALUES ('49980404-4a11-451e-9dc9-351f376d25ac', '164a0804-39a1-4f45-8cef-61739558c864', 1, 'Testing');

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
)
;

-- ----------------------------
-- Records of control_office
-- ----------------------------
INSERT INTO "origin"."control_office" VALUES ('18c22d97-56a0-4bba-ac74-c8c6d1e52ddc', '006f7d4e-3889-4cf0-8ce1-38b8aff41f2b', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('3ddbbe9f-4997-4688-aec4-cc186284ee96', '5129e2a5-8a75-4d39-af2e-920942f52748', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('aa8c82ca-3fe7-45b8-94fb-0e67ecbe568c', '62ed325f-883c-42da-8aa4-5b3d8b623094', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('768c5abc-ae55-4db4-8750-f2bd000d3082', 'fb394153-edbd-4376-a821-fc94a6056df5', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('924fe016-3598-4d93-b8b3-0adf210a5afd', 'fb394153-edbd-4376-a821-fc94a6056df5', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('14482657-25d0-4184-8b99-59e0cf3ce171', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('082d619a-0cf4-4af0-830a-abd16425d09c', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('85bb5330-dcd0-46a7-bac3-78b39d56a343', '6a3d58c6-b360-4c49-afac-358d208c03c6', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('38325f74-7d4e-40d5-b22c-044b9c133a10', '6a3d58c6-b360-4c49-afac-358d208c03c6', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('f4c4cc54-c86f-45c6-ad5e-ca06ce08f0e6', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('a2835166-c3de-4245-aea4-13a6f687b434', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('66eecc41-050c-4195-9b53-5e192a30b26a', '107f782e-1c9c-43a1-98b4-97e7a3a39741', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('ee0ced9d-caca-4a90-935e-1e3123b075f2', '107f782e-1c9c-43a1-98b4-97e7a3a39741', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('4ea5a6ff-e0c9-45c8-858c-8ecc492fd1a5', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('822d24f2-bef0-41f1-be37-c16b53cb715c', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('98485281-4e9a-4efa-a51e-f744b77756b9', '99ff7f51-20ee-458c-a897-3c7807e40b76', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('3c1f33fd-0e1f-420a-9039-e95d70383b1f', '26fe19a6-dd67-4944-80b9-d5803dddd754', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('2ae2a358-5bf5-46da-b60c-b0bd420949a6', 'f4df8eb0-4fd9-4567-847a-b9fc1e340572', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('4117dde1-43f6-422c-a42a-b89e32e312a1', '50397c12-2485-4c01-927b-80c90864437a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('84277eab-3e2c-4469-8e3e-8153d2ef872a', '50397c12-2485-4c01-927b-80c90864437a', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('9779fc36-2e21-4a7e-99e9-9c0d6cc7fe27', '74166d73-4470-4625-ab07-b01ba4b3ad9a', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO Germany GmbH');
INSERT INTO "origin"."control_office" VALUES ('280c4cae-d219-4656-9ce3-691b49f5c8cb', '547de8d7-c962-4fd9-9adc-23adc1d15d2b', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."control_office" VALUES ('c927453b-9f1d-46e1-aea3-2f16b5c3c0df', '547de8d7-c962-4fd9-9adc-23adc1d15d2b', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('2fb0a601-3992-4b59-aef4-24d1a1d3306a', '1dfc9387-daf8-42a4-9e83-5988441ab31a', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('ff73462e-82f2-4eee-ad4a-e18826e88dba', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('8781d0ec-20e9-433f-9ccb-e53c8d8f7b93', '472030ee-bd86-4d6c-bf2f-d6791f049340', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('a4631aab-359f-4a6f-bb9f-6aff121d22f8', '55266cd6-7933-4fa5-9b5b-f04225430d24', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('959b77a1-9887-47e0-abee-5fe86cf42c9f', '9ba84c1b-5448-471a-a1df-796b99af261d', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');
INSERT INTO "origin"."control_office" VALUES ('1d21e343-b288-42e5-a9e4-44ea2c967181', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'PAMCARGO GERMANY GMBH');

-- ----------------------------
-- Table structure for destination_partner_office
-- ----------------------------
DROP TABLE IF EXISTS "origin"."destination_partner_office";
CREATE TABLE "origin"."destination_partner_office" (
  "destination_partner_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_id" uuid NOT NULL,
  "office_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "office_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of destination_partner_office
-- ----------------------------
INSERT INTO "origin"."destination_partner_office" VALUES ('83cdf3d3-10e8-435d-8e39-55bafc1bbaa1', '006f7d4e-3889-4cf0-8ce1-38b8aff41f2b', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('0874feb1-cc0b-4a8c-8945-5261b49fab16', '5129e2a5-8a75-4d39-af2e-920942f52748', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('0434169c-e9f6-4f22-adb4-c2398744276b', '62ed325f-883c-42da-8aa4-5b3d8b623094', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('b6d1babd-f518-430d-94e3-440b9e06880b', 'fb394153-edbd-4376-a821-fc94a6056df5', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('421e6943-026c-4cf6-8f55-ede8c4d36726', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('8dfbb3f7-abe7-4eec-a183-b6afd1de7cb6', '6a3d58c6-b360-4c49-afac-358d208c03c6', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('357912ea-8ad3-4643-aaf7-ce30cc35a63a', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('f523b392-e9da-46b9-9105-71417af76e0f', '107f782e-1c9c-43a1-98b4-97e7a3a39741', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('c4f3f3cc-13ad-4b1e-8cbb-d4e43409f2b1', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('8242b7f2-43d9-4e99-92be-8c0c3feefdca', '99ff7f51-20ee-458c-a897-3c7807e40b76', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('5c864fb9-e775-467b-b064-d3d6d3502437', '26fe19a6-dd67-4944-80b9-d5803dddd754', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('26d8ef81-fddb-4d94-be4e-c5df10b24520', '50397c12-2485-4c01-927b-80c90864437a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('4cb1e484-3b37-471f-a2b2-1169cde0091d', '74166d73-4470-4625-ab07-b01ba4b3ad9a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('e89594d9-dadb-4fb1-b776-47f8096f196b', '1dfc9387-daf8-42a4-9e83-5988441ab31a', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('daeb4786-6ef3-480f-836a-ab286ba9a714', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('2821e31a-c8f5-4585-b7dd-b3c9959a7876', '472030ee-bd86-4d6c-bf2f-d6791f049340', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('e2919a83-c695-473e-9a5d-73a182d5509d', '55266cd6-7933-4fa5-9b5b-f04225430d24', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('9226fd49-7b5b-4bf8-9563-ad71c3741c77', '9ba84c1b-5448-471a-a1df-796b99af261d', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');
INSERT INTO "origin"."destination_partner_office" VALUES ('4e1e514f-6079-4acd-9ff1-8f416fb95655', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '8149fafc-c5b5-4402-bc60-68796eb32c41', 'XLLOG');

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
)
;

-- ----------------------------
-- Records of dimension
-- ----------------------------
INSERT INTO "origin"."dimension" VALUES ('41a1c890-fdaf-4355-89d7-3b44aa58be3f', '20e4f906-cea9-4345-87b6-41bdb5a04d1c', '100', NULL, 1100, 1100, 140, 16940, 2823220.4);
INSERT INTO "origin"."dimension" VALUES ('3c717305-5eec-4141-9a96-e72ebb088c1f', 'd3156483-2980-4b57-b3d9-f2c123235d14', '20023', NULL, 200, 200, 200, 160184, 26696265.44);
INSERT INTO "origin"."dimension" VALUES ('0948432c-7f27-4441-891e-dfc454486abf', '051880a6-3d9c-41c9-911e-a6662a8d29a1', '34', NULL, 23, 12, 34, 0.319, 53.164);
INSERT INTO "origin"."dimension" VALUES ('1a1eae52-d409-4d0a-a786-d75dc0a7d7f9', '006f7d4e-3889-4cf0-8ce1-38b8aff41f2b', '1000', NULL, 100, 100, 10, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('afcec764-a539-4dfe-8304-611eb980fd69', 'd6352ea3-d0be-4bc4-a259-b281fa3f2e52', '23', NULL, 45, 12, 45, 0.559, 93.162);
INSERT INTO "origin"."dimension" VALUES ('e1693f39-6a55-4252-9b7d-ef482ba2dff5', '2683d142-8554-4080-adde-e847dd45c95e', '34', NULL, 67, 20, 54, 2.46, 409.983);
INSERT INTO "origin"."dimension" VALUES ('ad432985-92c7-41cc-8b8c-e14ab004189b', '006f7d4e-3889-4cf0-8ce1-38b8aff41f2b', '1300', NULL, 50, 50, 502, 1631.5, 271905.79);
INSERT INTO "origin"."dimension" VALUES ('2ba9d591-bb2f-457d-9b78-bd55f1599b7c', 'c343924f-cac9-4aa9-a1c6-ef12996d82bf', '22', NULL, 22, 22, 22, 0.234, 39.041);
INSERT INTO "origin"."dimension" VALUES ('f31b0aa1-0b96-4a3d-9e66-26bae95adaca', '5bf7e73a-b6a4-47a0-b299-b003fca8458f', '45', NULL, 23, 54, 23, 1.285, 214.158);
INSERT INTO "origin"."dimension" VALUES ('d1829a8e-d0c6-4b74-a017-f35c34db5295', '67c7399b-e095-4aff-84e5-18085b7c3b6a', '54', NULL, 45, 67, 45, 7.326, 1220.951);
INSERT INTO "origin"."dimension" VALUES ('1483b00a-8db8-4921-8581-0df63fc9d73d', 'abe73cea-898e-46e0-8bdf-16887003097e', '55', NULL, 555, 555, 22, 372.71, 62115.848);
INSERT INTO "origin"."dimension" VALUES ('f6f9f0d1-6e3f-436f-b4c7-143bc719f34a', '3eb5b6ff-f6f7-45e1-a799-52c1e3417d7c', '324', NULL, 34, 34, 34, 12.734, 2122.331);
INSERT INTO "origin"."dimension" VALUES ('4010b89b-a5d4-4a36-874d-7f3c514a3b0f', '62ed325f-883c-42da-8aa4-5b3d8b623094', '123', NULL, 123, 123, 123, 228.887, 38146.247);
INSERT INTO "origin"."dimension" VALUES ('627bf292-0331-4f33-adde-2fdf08f2519b', '31f6a585-3c02-47cf-9eb9-c76fcc859ef5', '12', NULL, 12, 33, 23, 0.109, 18.165);
INSERT INTO "origin"."dimension" VALUES ('d8011e70-bac3-42a6-a4e9-c5fc7ba797ac', 'ba899967-4e6b-4864-ac58-ef7366d52dcf', '23', NULL, 23, 23, 23, 0.28, 46.638);
INSERT INTO "origin"."dimension" VALUES ('4f896cc6-0ab4-40f0-a256-f70cdbd00b31', '5c95c470-1e0d-4223-9ebd-a1e333508255', '200', NULL, 200, 200, 200, 1600, 266656);
INSERT INTO "origin"."dimension" VALUES ('834ab3d2-bdff-4e1b-8be5-f20ae193473f', '17aeae22-5b63-44ab-b7de-6b4456ec2e73', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('a24e3e3e-de72-4689-b103-1f95b54cc58a', '6809a7ba-a7e1-4e35-b4d3-310b80e877fc', '45', NULL, 56, 67, 54, 9.117, 1519.499);
INSERT INTO "origin"."dimension" VALUES ('c80f247b-78f5-41c1-ab77-40f30014d0d2', '63a4c0ef-8610-4940-9949-cbaede8dc63e', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('a99cdb68-3602-497d-a02a-5c10ed709d1a', '1b9b6838-18f7-4075-93d0-54dec7ef4eb6', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('ead5fba4-0d0b-4f98-b99c-58c11b81e17c', '36b51ac9-8372-49e1-8dd3-1b767e32b5fd', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "origin"."dimension" VALUES ('793cef5c-b1d8-47a8-a076-8a79c8279a76', '3f45cfc9-8f88-40a9-9fee-b63193b3f93a', '12', NULL, 23, 23, 23, 0.146, 24.332);
INSERT INTO "origin"."dimension" VALUES ('9e333c6d-2634-4217-8b6f-32879e9e8471', '874e0ab4-ce87-4642-b2d7-32993ca6be88', '45', NULL, 45, 45, 45, 4.101, 683.41);
INSERT INTO "origin"."dimension" VALUES ('65bdb2e5-3e56-4b6f-a5fa-ace5a0bf2747', '37f44378-afd1-42f5-a99f-83dd8b7e765d', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('676e86ee-7271-4398-94c0-42dfb460a881', 'c32b332d-b0a1-47ea-9f5b-4d27aa57da93', '25', NULL, 56, 34, 23, 1.095, 182.492);
INSERT INTO "origin"."dimension" VALUES ('11885bdd-3f2e-4dc8-b60c-3404cfe98ba9', '62786fcd-f0fd-461c-aa60-c2f677671ee1', '23', NULL, 100, 50, 100, 11.5, 1916.59);
INSERT INTO "origin"."dimension" VALUES ('fc8d846e-8613-4403-9cd6-0bcb803b04cc', 'a2896049-7139-4623-9383-a639703a10e4', '56', NULL, 45, 67, 45, 7.598, 1266.282);
INSERT INTO "origin"."dimension" VALUES ('96a25501-f54b-43cf-973f-d65d74324b30', '9bbbccf2-a292-4b71-b2d9-f0b2c7cbbb59', '80', NULL, 56, 78, 56, 19.569, 3261.369);
INSERT INTO "origin"."dimension" VALUES ('2d7b40e7-5287-4b6a-a376-c9c0d0d9a487', '72d375af-2ea7-4818-a23a-3d47a7ba7b0a', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('e55a19cd-d68c-4270-a533-5d4df3d46edd', 'df65f279-9384-400b-a0ac-e4b7e12f05b2', '45', NULL, 23, 45, 67, 3.121, 520.145);
INSERT INTO "origin"."dimension" VALUES ('01ed02e0-c5ae-4d8a-b5d8-fcf657ad7060', '14e851fa-928f-4c06-8f61-f1e0f5e3e862', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('8263e437-3171-451a-bdf5-8e9b223e688e', 'da4d1208-3b93-4f06-a302-fede8a665ea4', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "origin"."dimension" VALUES ('242ee9f3-c7d0-4710-aa67-8c3591c7b940', '78d1c2e8-49bf-465c-acc7-4996f98a950a', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('7389e851-bc4a-475d-8745-f265288bb8b5', '78d1c2e8-49bf-465c-acc7-4996f98a950a', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('92783002-4277-4a22-8f79-be6f800b4e3f', '78d1c2e8-49bf-465c-acc7-4996f98a950a', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "origin"."dimension" VALUES ('d141c761-29c8-4281-b0a3-9566f2417267', '2d9a35ac-6e30-4443-8d1a-e540cd60570d', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('b993f48f-7f94-4e24-a17f-8a8f7c234001', '9f583a8a-da7a-4d35-b4ed-fd77e9aa92dd', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('692a8272-9490-45a9-9329-6ff806f4f4c2', 'a92cbdfb-d190-4678-b637-496fca77e67a', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('5c991fcb-3278-4d34-ae7d-bf9d52cc74aa', '189f016e-0ec9-4813-97be-5c8d570331de', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "origin"."dimension" VALUES ('fc47f50b-5539-4a1e-bf69-18fe93e11c76', '581e5026-9012-4536-ac4a-1ac0ae8edd0e', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('6ac93ee6-2451-4302-ab20-1699eab2383b', '1109a371-98a3-4957-850f-2bd5dbdb7603', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('18ff02ad-3014-4fb2-a730-e82c6a4dbdc0', '89861675-adde-432e-815f-41205e17f577', '57', NULL, 89, 42, 65, 13.849, 2308.074);
INSERT INTO "origin"."dimension" VALUES ('cec3a20a-bc03-41e3-bc91-f1522f1673ea', 'dcdbbcbe-7616-46dc-8b1a-23eb88c0a9ab', '100', NULL, 56, 78, 46, 20.093, 3348.699);
INSERT INTO "origin"."dimension" VALUES ('f47fcdc3-7f8c-4dc0-8bba-13313057fa1e', '0051b251-3c20-4b60-91b8-eecdd32af920', '200', NULL, 10, 120, 100, 24, 3999.84);
INSERT INTO "origin"."dimension" VALUES ('9a8d14f8-8eb5-4939-93cb-0248a923e3b2', '8b8a81ed-a855-455d-9310-a0911779be6d', '76', NULL, 89, 90, 45, 27.394, 4565.484);
INSERT INTO "origin"."dimension" VALUES ('69c17878-6d03-4e17-87db-be0fd253e27a', '9af4a770-74a8-4739-b9fe-999cc0bc4429', '120', NULL, 10, 10, 40, 0.48, 79.996);
INSERT INTO "origin"."dimension" VALUES ('aed2cd34-105a-4507-b776-2467ba48ec4d', 'ab6619e2-f81d-4245-a9aa-8d77a656bb09', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('cc0e527d-6763-4eb1-bb79-91cea9977324', '09b7d3c9-39ff-4bb2-a532-f1a721bea53b', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('a90a0ca2-23fe-4b2d-99a9-46c06af1123a', '90bfa433-0499-4db2-8527-1116404ffdbf', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('3dff43aa-33cb-42b4-8bd0-95dc67024a89', '0013312c-3644-4d21-b0ac-6c56197f568f', '45', NULL, 90, 90, 20, 7.29, 1214.951);
INSERT INTO "origin"."dimension" VALUES ('0967bae5-33db-41ad-b27b-b05eb86577f0', '2e557a99-9917-4167-9580-c355c2cef94c', '45', NULL, 67, 85, 34, 8.713, 1452.108);
INSERT INTO "origin"."dimension" VALUES ('21ae5339-46d6-4272-bf2d-f1e8d0480359', '6a7e391b-7f6c-452a-ad61-721c0aecdbf9', '15', NULL, 54, 12, 32, 0.311, 51.831);
INSERT INTO "origin"."dimension" VALUES ('43f66058-2036-46a1-9022-6c2b1ad15e51', 'e0b49d93-8077-475d-bf5e-b00fd7c555be', '12', NULL, 34, 12, 34, 0.166, 27.665);
INSERT INTO "origin"."dimension" VALUES ('ec28f64a-9447-4b3b-af6e-cbad0c4a4a90', '6eab7b52-25aa-4e4f-80ed-8c1ea6564b4b', '34', NULL, 12, 11, 23, 0.103, 17.165);
INSERT INTO "origin"."dimension" VALUES ('2d303eb5-b2ec-4f48-bc4c-110028c99ba2', '1ec049a3-3c3c-4c07-8723-372a0a3a65c7', '56', NULL, 34, 12, 45, 1.028, 171.326);
INSERT INTO "origin"."dimension" VALUES ('634c42d1-c81f-4078-a0e5-379f68d15fb8', 'f6f69d4f-88e8-4947-8c22-047d5daaeafd', '3', NULL, 34, 12, 54, 0.066, 10.999);
INSERT INTO "origin"."dimension" VALUES ('21f6cff3-9ca5-44a5-b2dc-18f3211076c7', '98c0b327-e57e-40a2-9553-33517d0df42b', '10', NULL, 50, 56, 80, 2.24, 373.318);
INSERT INTO "origin"."dimension" VALUES ('33635218-345e-43fe-a0d1-570ae809792a', '4d50a15b-5ac9-4513-a49d-e4462d4e6ef5', '25', NULL, 25, 25, 25, 0.391, 65.164);
INSERT INTO "origin"."dimension" VALUES ('845334dd-39d6-4cd2-8207-64828a53e92a', '9bda2b6f-2e48-4a54-b670-755b7c6aa65d', '23', NULL, 23, 23, 34, 0.414, 68.997);
INSERT INTO "origin"."dimension" VALUES ('80051a25-8269-45d8-8e46-eab1bf84de49', '276c94d6-733b-40c9-ac85-15f1bf33fbae', '21', NULL, 21, 12, 32, 0.169, 28.165);
INSERT INTO "origin"."dimension" VALUES ('f9e38968-8a3e-4706-8363-5f8d53225f55', '8fdb0c6e-a93d-4e86-be28-e52f63173de9', '45', NULL, 67, 34, 10, 1.025, 170.826);
INSERT INTO "origin"."dimension" VALUES ('62bc606f-b921-4cb5-9f18-63f9e49ebc36', 'b94f7fee-764e-4e25-b490-88c5b19d4bca', '100', NULL, 50, 50, 90, 22.5, 3749.85);
INSERT INTO "origin"."dimension" VALUES ('7b0b10b1-a9b1-4700-815e-e9246932a1bd', '51cfb077-d35f-406a-aaaa-63ee31d5a850', '500', NULL, 500, 200, 100, 5000, 833300);
INSERT INTO "origin"."dimension" VALUES ('4e567eb8-994c-4159-aaa6-c7dd09071a78', '67c9d5e1-3934-4122-8e07-1fe8f5e92c2b', '50', NULL, 100, 100, 100, 50, 8333);
INSERT INTO "origin"."dimension" VALUES ('3da6cf78-c278-4950-ad23-c4f6f85587df', '49f76b4b-fffe-4641-9b6e-e50adaf567ee', '10000', NULL, 200, 22, 67, 2948, 491313.68);
INSERT INTO "origin"."dimension" VALUES ('35caebb6-f02b-4229-acdf-a8cee6b38abe', 'f40b92a1-97df-4e9d-893f-fe5123acba9f', '54', NULL, 45, 45, 45, 4.921, 820.092);
INSERT INTO "origin"."dimension" VALUES ('567f5c90-d6cb-46b5-9da9-e4a4260abdc4', 'a9c76bae-46a9-4e7f-9084-e6269cf9a6c2', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('9e1c062e-d524-4c9d-a58c-04c36c773006', 'e5d2b6b7-0f39-4b2d-922c-a85271920170', '100', NULL, 23, 45, 23, 2.381, 396.817);
INSERT INTO "origin"."dimension" VALUES ('4831355f-88ea-42ff-b810-5d8b0cdecb96', '16b4bc7d-96c4-4689-a4c3-5daf3c569102', '32', NULL, 43, 45, 56, 3.468, 577.976);
INSERT INTO "origin"."dimension" VALUES ('8667c3e8-7cd8-43a3-aca1-2afd61709369', '38787543-2993-4a75-ba79-6d8da96cda62', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('5545aa5b-c673-4b32-a8b6-4a41f64cfb35', '47e5b8fe-e171-4db0-a2ad-18483270a966', '100', NULL, 50, 50, 50, 12.5, 2083.25);
INSERT INTO "origin"."dimension" VALUES ('d8978237-cfc8-477b-a1f9-f71d57600845', '2e537046-f1a8-452f-a83c-4ff0aa41555f', '45', NULL, 34, 23, 45, 1.584, 263.989);
INSERT INTO "origin"."dimension" VALUES ('63f95ba6-6726-4c62-b838-727dcc7dba5a', '60662b87-06a0-4183-8bb4-a2eed9a7b4eb', '1000', NULL, 34, 50, 56, 95.2, 15866.032);
INSERT INTO "origin"."dimension" VALUES ('61ab46ba-502e-4593-85a6-8702cec4a0ee', '624e8053-b53b-4a7b-9cba-143404d1fc17', '200', NULL, 53, 21, 34, 7.568, 1261.282);
INSERT INTO "origin"."dimension" VALUES ('8dd1bf4b-8bd4-49a4-8c44-fe54c20d396c', '231960d8-8c0c-4d25-a028-398ad70e353e', '43', NULL, 13, 12, 34, 0.228, 37.998);
INSERT INTO "origin"."dimension" VALUES ('678bb39e-7efe-4004-8418-d7c3762e0b25', '1f2eae5c-8dab-4bd7-a862-4aac2f16034b', '1000', NULL, 67, 56, 35, 131.32, 21885.791);
INSERT INTO "origin"."dimension" VALUES ('782f7c77-0bb3-44ce-af8a-8d4a74c6f1b0', '294128e9-4a9a-4b35-a555-d7589850c2c6', '500', NULL, 56, 45, 54, 68.04, 11339.546);
INSERT INTO "origin"."dimension" VALUES ('be0a4173-e725-418d-9999-949f0f2976a8', 'af228dd5-40e1-4554-ae95-3bfedea0ca69', '45', NULL, 54, 45, 45, 4.921, 820.133);
INSERT INTO "origin"."dimension" VALUES ('7a2f6a27-0130-4712-9eec-39823ada8217', '10445e85-3812-4645-bdd0-7d07f7356d86', '300', NULL, 67, 67, 98, 131.977, 21995.286);
INSERT INTO "origin"."dimension" VALUES ('5e75ab38-f18b-490e-ab33-0df96ad66b56', 'd1427191-2110-4c6e-ab73-2db35479cb66', '56', NULL, 56, 56, 56, 9.834, 1638.934);
INSERT INTO "origin"."dimension" VALUES ('6b94101e-88db-4bb4-b0ae-431fad296ce2', '93130c54-a61b-4b2d-b429-2c86659cfdaa', '34', NULL, 34, 34, 23, 0.904, 150.66);
INSERT INTO "origin"."dimension" VALUES ('1e1e54b4-5b03-462e-b449-d89255091cad', '4111436e-f5a6-455d-969b-0e95221e56a4', '98', NULL, 78, 78, 78, 46.506, 7750.689);
INSERT INTO "origin"."dimension" VALUES ('c417d9a6-d51c-4fff-835c-9dac9bed4221', '47d72ea5-4d61-4d3f-a8f8-e3197c5d19d8', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('4f5d88f1-df40-4559-8fcb-2bc0ca486908', '5fd90094-a436-478d-9fcd-3d45c401174a', '30', NULL, 30, 30, 100, 2.7, 449.982);
INSERT INTO "origin"."dimension" VALUES ('d8e7714b-360a-4d3f-b77e-8a011ab34e4b', 'a2809fab-65d4-41f0-bf93-315dfc08132d', '100', NULL, 200, 200, 200, 800, 133328);
INSERT INTO "origin"."dimension" VALUES ('68ea5428-c59c-44bc-b7d0-a1d8920c826b', 'dce928fe-4317-4e1d-8d91-86178c25e494', '10', NULL, 10, 10, 10, 0.01, 1.666);
INSERT INTO "origin"."dimension" VALUES ('64cc6148-9c61-43a7-90cb-fdf161762c03', '35ce18a2-b216-4ce1-a2de-ee30cc7c2ab4', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('3db0fca4-f3ae-4a29-abec-177a88955146', '8f8b760f-5d6f-477f-b5cb-0eca9cca1562', '30', NULL, 30, 30, 30, 0.81, 134.994);
INSERT INTO "origin"."dimension" VALUES ('da31376c-9320-4918-851a-084d4b18f9ec', '78c54427-5f35-4d18-a864-69226b3da1e1', '10', NULL, 10, 20, 20, 0.04, 6.666);
INSERT INTO "origin"."dimension" VALUES ('643b159c-85e5-4357-87c3-77c38328ad5b', '8fd17b74-7413-4ef9-8aa2-75167790dbd9', '55', NULL, 55, 55, 55, 9.151, 1525.105);
INSERT INTO "origin"."dimension" VALUES ('716c83ca-b288-4c0f-b45b-bfeb6d5fa080', 'be1e3aa0-1d81-42ab-9be8-b1cfe6c6e63e', '32', NULL, 45, 56, 78, 6.29, 1048.291);
INSERT INTO "origin"."dimension" VALUES ('273f84b0-b29b-456a-a94d-581de6509c4e', '6f40b96f-280c-4187-9996-ca3e7746ef4e', '33', NULL, 33, 33, 33, 1.186, 197.645);
INSERT INTO "origin"."dimension" VALUES ('c77204cc-1da4-453d-9668-ef65ff2b075a', '0d0438b5-97d1-4bbf-819e-6c8945bb3607', '10', NULL, 10, 10, 100, 0.1, 16.666);
INSERT INTO "origin"."dimension" VALUES ('9e24eed7-84c7-4f50-b674-56580b73ab62', '5129e2a5-8a75-4d39-af2e-920942f52748', '200', NULL, 100, 100, 100, 200, 33332);
INSERT INTO "origin"."dimension" VALUES ('a92b888b-6165-4db1-989c-a668d8321ffb', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', '300', NULL, 100, 100, 100, 300, 49998);
INSERT INTO "origin"."dimension" VALUES ('b4148bde-3f3a-4a0c-ad20-88b722e40689', 'fb394153-edbd-4376-a821-fc94a6056df5', '130', NULL, 100, 100, 100, 130, 21665.8);
INSERT INTO "origin"."dimension" VALUES ('dcebe1aa-bbe7-4b4f-a1f2-06f20d10f69d', '56836892-8227-4108-aee2-1554b19e14f9', '50', NULL, 1000, 1000, 100, 5000, 833300);
INSERT INTO "origin"."dimension" VALUES ('3ea2e44a-751e-4485-9567-3b7e7093f7ff', '0a823ec2-b80a-482e-85ba-3d9bc63caa06', '20', NULL, 20, 20, 20, 0.16, 26.665);
INSERT INTO "origin"."dimension" VALUES ('6b765aab-56b6-478d-8736-850b52701b77', 'c80ff11f-8226-4453-bdb4-34030146f0b7', '120', NULL, 100, 100, 139, 166.8, 27798.888);
INSERT INTO "origin"."dimension" VALUES ('0ad0a017-a7ba-45ee-a62b-914dd3577826', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', '123', NULL, 123, 123, 123, 228.887, 38146.247);
INSERT INTO "origin"."dimension" VALUES ('8f22555f-a0a2-426b-b421-63fe816e2525', '6a3d58c6-b360-4c49-afac-358d208c03c6', '123', NULL, 123, 123, 123, 228.887, 38146.247);
INSERT INTO "origin"."dimension" VALUES ('40459f2a-de5d-4563-b2e4-089be2b57494', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('47df3c48-b091-4169-b732-f12b41174afd', '107f782e-1c9c-43a1-98b4-97e7a3a39741', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('be883ef3-6391-48b5-bd75-70f7b686bc54', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('d960d585-c919-4409-8a56-fb3ef6821d47', '26fe19a6-dd67-4944-80b9-d5803dddd754', '100', NULL, 100, 100, 100, 100, 16666);
INSERT INTO "origin"."dimension" VALUES ('dc1c3f73-4614-474f-a242-9ae593f1544d', '99ff7f51-20ee-458c-a897-3c7807e40b76', '50', NULL, 100, 100, 100, 50, 8333);
INSERT INTO "origin"."dimension" VALUES ('7f899392-ba00-4615-a9f6-003e9c20ff07', '6539bea7-2486-402d-9946-7f89e7ce25c5', '200', NULL, 100, 100, 100, 200, 33332);
INSERT INTO "origin"."dimension" VALUES ('55cc8958-4085-4bd6-884c-57130e3d3c65', 'f4df8eb0-4fd9-4567-847a-b9fc1e340572', '1000', NULL, 100, 200, 100, 2000, 333320);
INSERT INTO "origin"."dimension" VALUES ('4b8915c7-f5df-453f-9ec8-fc18e1bb03be', 'd10332a0-6b10-40ff-a717-ad98be6582f2', '100', NULL, 100, 200, 100, 200, 33332);
INSERT INTO "origin"."dimension" VALUES ('1d28095e-5af3-401e-9e8e-d1c828a2901d', '50397c12-2485-4c01-927b-80c90864437a', '10', NULL, 10, 10, 100, 0.1, 16.666);
INSERT INTO "origin"."dimension" VALUES ('94fc055c-c871-455c-992f-d39b4f11bc2f', '74166d73-4470-4625-ab07-b01ba4b3ad9a', '20', NULL, 10, 10, 10, 0.02, 3.333);
INSERT INTO "origin"."dimension" VALUES ('5ebfa0c3-af3d-4a38-87fa-f64f51e09bea', 'c62fa2d1-38d0-4f14-ba72-dd01c1775022', '100', NULL, 100, 110, 100, 110, 18332.6);
INSERT INTO "origin"."dimension" VALUES ('97f65186-717c-4658-bb45-fbb3e03d05ed', 'c62fa2d1-38d0-4f14-ba72-dd01c1775022', '100', NULL, 100, 110, 100, 110, 18332.6);
INSERT INTO "origin"."dimension" VALUES ('ef550b8e-4f19-40ed-a9a4-175c15eaa253', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '23', NULL, 100, 100, 100, 23, 3833.18);
INSERT INTO "origin"."dimension" VALUES ('58608aba-9369-4e9c-abca-6e005da3e6bf', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '12', NULL, 74, 71.3, 70.5, 4.464, 743.97);
INSERT INTO "origin"."dimension" VALUES ('a07209eb-603d-47dd-b4a6-c11aff461eb0', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '31', NULL, 53, 51, 50, 4.19, 698.305);
INSERT INTO "origin"."dimension" VALUES ('b1a2c9f7-afdf-489b-9801-46f29ae17942', '9ba84c1b-5448-471a-a1df-796b99af261d', '66', NULL, 98.4, 98.6, 98.4, 63.01, 10501.246);
INSERT INTO "origin"."dimension" VALUES ('723ade1d-8ad7-4564-b55c-74b5c5be8e24', '55266cd6-7933-4fa5-9b5b-f04225430d24', '66', NULL, 98.74, 98.72, 98.7, 63.498, 10582.576);
INSERT INTO "origin"."dimension" VALUES ('7877b61f-15ed-4ac2-9385-e243de78e707', '472030ee-bd86-4d6c-bf2f-d6791f049340', '50', NULL, 79.7, 79.5, 79.9, 25.313, 4218.664);
INSERT INTO "origin"."dimension" VALUES ('1fd02311-9e24-4145-978d-8e19dd6d4bd6', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', '63', NULL, 79.92, 79.9, 79.9, 32.143, 5356.952);
INSERT INTO "origin"."dimension" VALUES ('2d169889-b214-4733-9fa0-0026972d543c', '1dfc9387-daf8-42a4-9e83-5988441ab31a', '72', NULL, 79.9, 79.8, 79.18, 36.349, 6057.924);
INSERT INTO "origin"."dimension" VALUES ('06d711ea-3a87-425a-97dc-f0bda750d5e8', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', '10', NULL, 100, 100, 100, 10, 1666.6);
INSERT INTO "origin"."dimension" VALUES ('f4e99b67-712a-402b-b8a8-19202eee1900', '4d6cc804-1577-44b5-952f-fc49cf16bedf', '100', NULL, 80, 80, 80, 51.2, 8532.992);
INSERT INTO "origin"."dimension" VALUES ('55d026f5-3162-41ec-a6a2-f90165833794', 'b9e85498-a6ac-4624-af18-336d8e4141cb', '10', NULL, 100, 100, 100, 10, 1666.6);
INSERT INTO "origin"."dimension" VALUES ('bf08610d-b5d5-4c81-9005-fa1b03f736f8', '8a0bb14d-acee-4250-b4ad-4940dc457f46', '142', NULL, 22, 121, 42, 15.876, 2645.894);
INSERT INTO "origin"."dimension" VALUES ('c206babd-9d93-4092-a9ff-002f7ea78806', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', '80', NULL, 100, 100, 100, 80, 13332.8);

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
-- Records of final_alert
-- ----------------------------

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
)
;

-- ----------------------------
-- Records of histori_job
-- ----------------------------
INSERT INTO "origin"."histori_job" VALUES ('eea4180f-cf9c-4f78-97b0-bf3cb2f5ffda', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Booking Received', 'JAKARTA', '2024-08-05 10:53:00', '2024-08-05 10:53:12.117938', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('34fa3fcd-6c1b-48f3-bc9b-c8bcac56c6eb', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Booking Confirmed', 'JAKARTA', '2024-08-05 10:54:00', '2024-08-05 10:54:47.062386', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('dfddbbac-b1b8-40a9-90b5-ca7899ae568a', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Booking Received', 'JAKARTA', '2024-08-05 10:58:00', '2024-08-05 10:58:41.946791', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('5e50886a-0476-4e2d-b221-56035179bc26', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Booking Confirmed', 'JAKARTA', '2024-08-05 11:00:00', '2024-08-05 11:00:03.113775', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('8ad410c0-511c-4e48-ae56-6042c50da312', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-05 11:00:28.854166', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('1b42eaed-b78a-48b1-8fea-f81c415044fd', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-05 11:00:28.864054', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('ae2152af-6a0d-4bcf-904c-ed9686d0bfd0', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-05 11:00:40.571653', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('edd94ce2-a917-486d-a5c7-8e2db5e97d8e', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-05 11:00:40.582396', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('4ecfbf85-e1e3-4423-aad8-dadba17465c9', '56836892-8227-4108-aee2-1554b19e14f9', 'Booking Confirmed', 'JAKARTA', '2024-08-05 11:31:00', '2024-08-05 11:31:43.473586', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('068a31cb-6afc-4f5a-a297-f60ce13c6cfb', '56836892-8227-4108-aee2-1554b19e14f9', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 11:33:00', '2024-08-05 11:33:26.978579', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('d5a0a5d2-8a5e-4319-af3a-096055ec5e46', '56836892-8227-4108-aee2-1554b19e14f9', 'Under Customs Clearance', 'JAKARTA', '2024-08-05 11:33:00', '2024-08-05 11:33:40.073376', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('d138350c-5488-4a3a-b7c5-f1f35f8ebf64', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-05 14:43:54.092758', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('8c3069fd-1284-4826-b3e5-b9e1f09a0438', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-05 14:43:54.104605', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('7bde5e98-b218-44cc-a9b5-8a3f9dc99407', 'fb394153-edbd-4376-a821-fc94a6056df5', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-05 14:44:06.83394', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('4a95e85e-72ab-43fe-a90e-8272b6a2e4ea', 'b2bd7246-16dc-49ff-b969-1fc0f7563a4a', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-05 14:44:06.853306', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('78259ba8-30eb-4dd3-967e-796b359eebda', '56836892-8227-4108-aee2-1554b19e14f9', 'In Transit to other port', 'DUBAI', '2024-08-05 17:06:00', '2024-08-05 17:06:05.711795', 'operations@pamcargo.com', 'GMT+7', 0, 17, 8);
INSERT INTO "origin"."histori_job" VALUES ('9ed9f6cf-4f78-4de8-951b-1920e88b66c7', '56836892-8227-4108-aee2-1554b19e14f9', 'Departed from Transit Airport', 'DUBAI', '2024-08-05 17:08:00', '2024-08-05 17:08:08.895947', 'operations@pamcargo.com', 'GMT+7', 0, 17, 29);
INSERT INTO "origin"."histori_job" VALUES ('bef96027-62af-4a0f-a36d-c8913fbe24e0', '56836892-8227-4108-aee2-1554b19e14f9', 'Closed', 'DUBAI', '2024-08-05 17:08:00', '2024-08-05 17:08:21.261613', 'operations@pamcargo.com', 'GMT+7', 0, 17, 39);
INSERT INTO "origin"."histori_job" VALUES ('9b146929-5cf0-4da9-a560-32a877dd13de', '56836892-8227-4108-aee2-1554b19e14f9', 'Booking Received', 'JAKARTA', '2024-08-05 11:30:00', '2024-08-04 11:30:45.95793', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('9ed132ec-cc7c-44b3-9382-6f7018069e5d', '56836892-8227-4108-aee2-1554b19e14f9', 'Vessel Departed', 'JAKARTA', '2024-08-04 11:34:00', '2024-08-05 11:34:32.2018', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('200bda21-454e-46d3-b175-d3ff8231e7aa', '0a823ec2-b80a-482e-85ba-3d9bc63caa06', 'Booking Received', 'BANGKOK', '2024-08-06 11:33:00', '2024-08-06 11:33:47.475271', 'thomas@pamcargo.com', 'GMT+7', 0, 0, 1);
INSERT INTO "origin"."histori_job" VALUES ('5e7592d3-978a-459e-a5b2-7c6dc51df94e', 'c80ff11f-8226-4453-bdb4-34030146f0b7', 'Booking Received', 'PHNOM-PENH', '2024-08-06 11:34:00', '2024-08-06 11:34:53.653637', 'thomas@pamcargo.com', 'GMT+7', 0, 0, 12);
INSERT INTO "origin"."histori_job" VALUES ('5621f6fd-030b-48a6-a6c1-6ca6c9a6b065', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Booking Received', 'JAKARTA', '2024-08-05 10:53:00', '2024-08-06 14:20:53.720364', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('7fbd7e2c-c15f-497d-ba88-f7a7a255e193', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Booking Confirmed', 'JAKARTA', '2024-08-05 10:54:00', '2024-08-06 14:20:53.722031', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('8c780a19-1d40-47ae-9163-9680652287bc', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-06 14:20:53.72353', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('e9e2ed4d-92f8-4b19-920b-64904b977a43', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-06 14:20:53.724822', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('243841e6-222e-40e8-b0ab-60429c728058', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-06 14:20:53.726373', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('7deb0a0a-5174-46c8-8d4b-e2fa4593f44b', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-06 14:20:53.727823', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('f3a0371b-caf2-413a-98fe-deb8e798f88d', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Booking Received', 'JAKARTA', '2024-08-05 10:53:00', '2024-08-16 15:44:51.300238', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('cf01eb86-7753-464f-b87f-e92d461249c9', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Booking Confirmed', 'JAKARTA', '2024-08-05 10:54:00', '2024-08-16 15:44:51.30222', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('1a442822-aa5e-4787-b9c3-f3d500dd6274', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 15:44:51.305142', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('5272254c-a95d-47ae-b303-fbfbdc58a98f', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 15:44:51.306541', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('7c4085b8-b118-4c03-b24d-6d8bf63014fe', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-16 15:44:51.311254', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('96912b0d-1d9c-4a1c-baba-4d3d2659363d', '6a3d58c6-b360-4c49-afac-358d208c03c6', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-16 15:44:51.320545', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('b7644fd9-aab6-4ae1-86f0-557fc524b2d8', 'c4b1a9cb-bc98-4932-b2e1-0ddfd07f4f99', 'Arrived in transit port', 'DUBAI', '2024-08-16 16:26:00', '2024-08-16 16:26:09.866554', 'thomas@pamcargo.com', 'GMT+7', 0, 18, 9);
INSERT INTO "origin"."histori_job" VALUES ('df7e6599-dd71-4fbc-a339-84b60f60a801', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Booking Received', 'SHANGHAI', '2024-08-16 17:10:00', '2024-08-16 17:10:42.789125', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('4d1c6e46-05fc-4277-8fea-61cf1cb3fc19', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Booking Confirmed', 'SHANGHAI', '2024-08-16 17:11:00', '2024-08-16 17:11:36.250071', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('1cc42878-4ceb-40c3-8c6c-aa1862b2c4f0', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Cargo Received CFS', 'SHANGHAI', '2024-08-16 17:12:00', '2024-08-16 17:12:12.252194', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('01c12a06-6b5c-4fe1-bd5c-5b378259020e', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Under Customs Clearance', 'SHANGHAI', '2024-08-16 17:12:00', '2024-08-16 17:12:19.846543', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('91a0fc48-e127-4029-a081-bf4df3620af9', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Loading Completed', 'SHANGHAI', '2024-08-16 17:12:00', '2024-08-16 17:12:27.690046', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('ba9f88b2-b35c-4635-94c4-fa1d5e2ab8c0', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Container Onboard', 'SHANGHAI', '2024-08-16 17:12:00', '2024-08-16 17:12:34.371278', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('69a3d4ea-b53d-4697-95a5-1036cbde5f1a', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', 'Vessel Departed', 'SHANGHAI', '2024-08-16 17:15:00', '2024-08-16 17:15:36.70739', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('b296b27f-85b8-4fd0-9c58-2ce243c4fa2f', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Booking Received', 'JAKARTA', '2024-08-05 10:58:00', '2024-08-16 17:17:10.652991', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('d030db05-dfd4-4f87-ade9-c0d37fdf70c8', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Booking Confirmed', 'JAKARTA', '2024-08-05 11:00:00', '2024-08-16 17:17:10.65429', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('c29acf0b-c0c7-4afb-8b6d-743eed5088f9', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 17:17:10.656204', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('fec6e653-f8cd-48c1-a99c-63c4f31ac4f8', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 17:17:10.657236', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('f68e2a5e-f896-4bc9-a8ea-2bef11f8a991', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-16 17:17:10.658211', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('c93b6163-5b68-40b5-91b2-dcd211cfe2f6', '107f782e-1c9c-43a1-98b4-97e7a3a39741', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-16 17:17:10.659415', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('06707489-83ac-4b44-829f-56f04ae3a3fe', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Booking Received', 'JAKARTA', '2024-08-05 10:58:00', '2024-08-16 17:17:10.676927', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('108d9fcd-4185-4567-a977-2f0ed4f8313a', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Booking Confirmed', 'JAKARTA', '2024-08-05 11:00:00', '2024-08-16 17:17:10.67798', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('5abe6ba1-b46a-4db2-ab91-e16358e2bf44', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Cargo Received CFS', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 17:17:10.679019', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('9589cd28-c52f-43a4-bb99-4e979f3ede46', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Loading Completed', 'JAKARTA', '2024-08-05 12:01:00', '2024-08-16 17:17:10.680089', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('4e9d78c6-0caa-42cc-8bf4-f975e94a3624', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Container Onboard', 'JAKARTA', '2024-08-05 14:43:00', '2024-08-16 17:17:10.681222', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('96290fd1-3058-4d80-b891-0d05493fbac2', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Vessel Departed', 'JAKARTA', '2024-08-05 16:46:00', '2024-08-16 17:17:10.68221', 'dubai@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('5c2b1b83-b41b-4e16-8199-998f7c78bdf6', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Arrived in transit port', 'DUBAI', '2024-08-16 17:17:00', '2024-08-16 17:17:35.818374', 'operations@pamcargo.com', 'GMT+7', 0, 17, 9);
INSERT INTO "origin"."histori_job" VALUES ('bd142463-c648-4ef2-b941-ff5ea3017a68', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Cargo airlifted', 'DUBAI', '2024-08-16 17:17:00', '2024-08-16 17:18:03.440991', 'operations@pamcargo.com', 'GMT+7', 0, 17, 33);
INSERT INTO "origin"."histori_job" VALUES ('f3a0decb-2f45-4e7d-820e-b274bc244831', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Departed from Transit Airport', 'DUBAI', '2024-08-16 17:18:00', '2024-08-16 17:18:12.060262', 'operations@pamcargo.com', 'GMT+7', 0, 17, 29);
INSERT INTO "origin"."histori_job" VALUES ('02cf0a8b-2dba-4608-bf18-075aa9309e03', '99c4cf1f-e403-4b6b-8e6e-4e9afffa785f', 'Arrived in destination Airport', 'DUBAI', '2024-08-16 17:18:00', '2024-08-16 17:18:23.231871', 'operations@pamcargo.com', 'GMT+7', 0, 17, 35);
INSERT INTO "origin"."histori_job" VALUES ('ac920ea9-03ae-495e-a3cd-d75056d53f49', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Booking Received', 'JAKARTA', '2024-08-21 13:58:00', '2024-08-21 13:58:47.458402', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('4df0fcb2-563f-4acf-aed3-4f467b729462', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Booking Confirmed', 'JAKARTA', '2024-08-21 16:34:00', '2024-08-21 15:33:19.438465', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('f1d25d26-387b-47eb-845e-23711826c675', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Under Customs Clearance', 'JAKARTA', '2024-08-21 19:37:00', '2024-08-21 15:33:42.815158', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('5ae7b65f-5f61-4484-a14b-d66ad689a75a', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Loading Completed', 'JAKARTA', '2024-08-21 15:40:00', '2024-08-21 15:40:22.941865', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('f1f1b022-db81-4d8a-ae97-5836f2a06afc', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Container Onboard', 'JAKARTA', '2024-08-21 15:40:00', '2024-08-21 15:40:30.739054', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('4da1a5ee-cfcb-4ab0-ba22-944a43f5ee53', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Vessel Departed', 'JAKARTA', '2024-08-21 15:40:00', '2024-08-21 15:40:38.009286', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('67000d6c-692f-4ce3-b0ef-311d6b5e3cee', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Booking Received', 'JAKARTA', '2024-08-21 16:43:00', '2024-08-21 16:43:49.369753', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('881acdb1-eca9-4371-8c4e-b6b91922f39f', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Booking Confirmed', 'JAKARTA', '2024-08-21 16:49:00', '2024-08-21 16:49:17.982003', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('5ff28644-d1ee-4b8e-b800-29cc0007c4d9', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Cargo Received CFS', 'JAKARTA', '2024-08-21 16:56:00', '2024-08-21 16:56:32.513866', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('8232bfc2-8786-43a9-b951-555fac7f37d2', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Under Customs Clearance', 'JAKARTA', '2024-08-21 16:56:00', '2024-08-21 16:56:46.11452', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('0fcd86b1-863f-4ddb-9a45-29f3e3c31b67', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Loading Completed', 'JAKARTA', '2024-08-21 16:56:00', '2024-08-21 16:57:01.974837', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('522303b8-6724-4484-abf4-f887956f7a85', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Container Onboard', 'JAKARTA', '2024-08-21 16:56:00', '2024-08-21 16:57:11.28739', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('70dfc527-f4c3-44d4-959b-a3c6d66b7d0a', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Vessel Departed', 'JAKARTA', '2024-08-21 22:02:00', '2024-08-21 16:57:31.550018', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('1b10cc2b-5ec7-494b-acb3-2723f767bf7e', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Arrived in transit port', 'DUBAI', '2024-08-21 23:07:00', '2024-08-21 17:01:24.897585', 'operations@pamcargo.com', 'GMT+7', 0, 17, 9);
INSERT INTO "origin"."histori_job" VALUES ('8455a335-abd8-4423-a4ca-f13a84ed0634', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Arrived in transit port', 'DUBAI', '2024-08-21 23:07:00', '2024-08-21 17:01:24.913416', 'operations@pamcargo.com', 'GMT+7', 0, 17, 9);
INSERT INTO "origin"."histori_job" VALUES ('6853ba14-b886-47bc-a704-13116465cfef', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Transit hub operations', 'DUBAI', '2024-08-21 23:07:00', '2024-08-21 17:01:39.325236', 'operations@pamcargo.com', 'GMT+7', 0, 17, 31);
INSERT INTO "origin"."histori_job" VALUES ('180cccab-a998-4aa9-a19b-1b407cf4e0ac', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Transit hub operations', 'DUBAI', '2024-08-21 23:07:00', '2024-08-21 17:01:39.336822', 'operations@pamcargo.com', 'GMT+7', 0, 17, 31);
INSERT INTO "origin"."histori_job" VALUES ('8f69e970-f370-43a2-8380-955d65ec8913', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Received by airline', 'DUBAI', '2024-08-21 23:25:00', '2024-08-21 17:02:01.916703', 'operations@pamcargo.com', 'GMT+7', 0, 17, 32);
INSERT INTO "origin"."histori_job" VALUES ('73f2340d-bc23-4c27-b060-41e298eee0ef', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Received by airline', 'DUBAI', '2024-08-21 23:25:00', '2024-08-21 17:02:01.9347', 'operations@pamcargo.com', 'GMT+7', 0, 17, 32);
INSERT INTO "origin"."histori_job" VALUES ('6108b36e-47fd-4782-9b52-b8efd6437ba5', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Cargo airlifted', 'DUBAI', '2024-08-21 23:30:00', '2024-08-21 17:06:14.181377', 'operations@pamcargo.com', 'GMT+7', 0, 17, 33);
INSERT INTO "origin"."histori_job" VALUES ('0e339c79-5b93-412a-b2a7-9123fc0c162d', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Cargo airlifted', 'DUBAI', '2024-08-21 23:30:00', '2024-08-21 17:06:14.193373', 'operations@pamcargo.com', 'GMT+7', 0, 17, 33);
INSERT INTO "origin"."histori_job" VALUES ('567c2e65-b32b-47c6-94d4-64d374922473', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Arrived in destination Airport', 'DUBAI', '2024-08-21 23:18:00', '2024-08-21 17:12:55.283701', 'operations@pamcargo.com', 'GMT+7', 0, 17, 35);
INSERT INTO "origin"."histori_job" VALUES ('3e35c6d6-7da6-4fca-96b7-0848fe2ca429', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Arrived in destination Airport', 'DUBAI', '2024-08-21 23:18:00', '2024-08-21 17:12:55.299149', 'operations@pamcargo.com', 'GMT+7', 0, 17, 35);
INSERT INTO "origin"."histori_job" VALUES ('6edb53f3-872f-41e6-b137-b1333819471f', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Under Customs Clearance', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:13:50.644553', 'null', 'GMT 7', 0, 0, 36);
INSERT INTO "origin"."histori_job" VALUES ('e855b6c6-b3fb-45f7-be61-3bf67843905f', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Under Customs Clearance', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:13:50.651596', 'null', 'GMT 7', 0, 0, 36);
INSERT INTO "origin"."histori_job" VALUES ('c12c0aeb-963f-49e7-954b-f47fddb7bdaa', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Truck departed from airport', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:14:20.612292', 'null', 'GMT 7', 0, 0, 37);
INSERT INTO "origin"."histori_job" VALUES ('b4703f12-e2ca-4994-bd0e-4cd1412a433e', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Truck departed from airport', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:14:20.620513', 'null', 'GMT 7', 0, 0, 37);
INSERT INTO "origin"."histori_job" VALUES ('d4255e6c-be3b-4c50-834f-b5b2dc60dfa6', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Delivered to consignee', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:15:04.921799', 'null', 'GMT 7', 0, 0, 38);
INSERT INTO "origin"."histori_job" VALUES ('df7ce544-c185-41d9-99b0-eccaafb9decb', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Delivered to consignee', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:15:04.931461', 'null', 'GMT 7', 0, 0, 38);
INSERT INTO "origin"."histori_job" VALUES ('0fcd0fb2-e89f-4173-8dd5-1a468cbe1de9', '99ff7f51-20ee-458c-a897-3c7807e40b76', 'Closed', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:15:52.658523', 'null', 'GMT 7', 0, 0, 39);
INSERT INTO "origin"."histori_job" VALUES ('c8706d6a-e8de-4b68-9209-21d9afca64fe', '26fe19a6-dd67-4944-80b9-d5803dddd754', 'Closed', 'DROSSELWEG', '2024-08-21 00:00:00', '2024-08-21 17:15:52.667796', 'null', 'GMT 7', 0, 0, 39);
INSERT INTO "origin"."histori_job" VALUES ('a710181e-ac7e-46e4-9085-ac7ac30d2947', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Booking Received', 'SHANGHAI', '2024-08-26 10:40:00', '2024-08-26 10:40:57.070625', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('f3444393-f639-459d-a844-6128513f95d0', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Booking Confirmed', 'SHANGHAI', '2024-08-26 12:52:00', '2024-08-26 10:50:44.350829', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('b3fc20e4-d24e-4979-ba93-eff6a9647ca2', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Cargo Received CFS', 'SHANGHAI', '2024-08-26 11:51:00', '2024-08-26 10:51:00.469553', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('1637a3a5-d2e7-4895-92af-19b80885d7e4', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Under Customs Clearance', 'SHANGHAI', '2024-08-26 11:09:00', '2024-08-26 11:09:16.845231', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('a0e7f01d-c395-41f3-a135-93e90f5ab4bc', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Loading Completed', 'SHANGHAI', '2024-08-26 11:09:00', '2024-08-26 11:09:24.824862', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('9c81bb94-86bb-4b32-a5ad-bcf56d54dba8', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Container Onboard', 'SHANGHAI', '2024-08-26 11:09:00', '2024-08-26 11:10:09.407511', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('1518a48d-86f4-42c7-8513-b792889bd941', '6539bea7-2486-402d-9946-7f89e7ce25c5', 'Vessel Departed', 'SHANGHAI', '2024-08-26 11:09:00', '2024-08-26 11:10:23.403655', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('330dc755-470e-465c-b959-4f77085ba759', 'f4df8eb0-4fd9-4567-847a-b9fc1e340572', 'Booking Received', 'BANGKOK', '2024-08-26 15:35:00', '2024-08-26 15:35:36.946839', 'thomas@pamcargo.com', 'GMT+7', 0, 0, 1);
INSERT INTO "origin"."histori_job" VALUES ('28360701-81f2-408d-a29a-e75363bd15be', 'd10332a0-6b10-40ff-a717-ad98be6582f2', 'Booking Received', 'DALIAN', '2024-08-26 15:38:00', '2024-08-26 15:38:47.154774', 'thomas@pamcargo.com', 'GMT+7', 0, 0, 1);
INSERT INTO "origin"."histori_job" VALUES ('697bb35a-803e-4c6d-94e2-f653f396fd37', '50397c12-2485-4c01-927b-80c90864437a', 'Booking Received', 'BANGKOK', '2024-08-27 12:06:00', '2024-08-27 12:06:09.604949', 'dubai@pamcargo.com', 'GMT+7', 0, 0, 1);
INSERT INTO "origin"."histori_job" VALUES ('ae38cdcd-9038-4576-9a66-9c7f3b2e8813', '74166d73-4470-4625-ab07-b01ba4b3ad9a', 'Booking Received', 'AALBORG', '2024-08-27 13:33:00', '2024-08-27 13:33:10.487396', 'dubai@pamcargo.com', 'GMT+7', 0, 0, 12);
INSERT INTO "origin"."histori_job" VALUES ('1baee58d-57ee-406c-978b-ad3811c8dd8c', '547de8d7-c962-4fd9-9adc-23adc1d15d2b', 'Booking Received', 'AARHUS', '2024-08-27 13:36:00', '2024-08-27 13:36:32.397785', 'dubai@pamcargo.com', 'GMT+7', 0, 0, 12);
INSERT INTO "origin"."histori_job" VALUES ('6c190b1b-b025-4ced-8b95-6a36b17b5877', 'c62fa2d1-38d0-4f14-ba72-dd01c1775022', 'Booking Received', 'CHIANG RAI', '2024-08-28 09:39:00', '2024-08-28 09:39:48.598958', 'dubai@pamcargo.com', 'GMT+7', 0, 0, 12);
INSERT INTO "origin"."histori_job" VALUES ('49d3cf48-66f1-439f-beed-f8624c00537d', 'c62fa2d1-38d0-4f14-ba72-dd01c1775022', 'Booking Confirmed', 'DUBAI', '2024-08-28 09:47:00', '2024-08-28 09:47:17.874697', 'thomas@pamcargo.com', 'GMT+7', 0, 18, 13);
INSERT INTO "origin"."histori_job" VALUES ('65dfc984-e194-407c-a2a5-45e3542cf3c7', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Booking Received', 'SHANGHAI', '2024-09-04 11:02:00', '2024-09-04 11:02:11.921679', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('610e256b-d327-4899-b74e-99b75ddbb474', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Booking Received', 'SHANGHAI', '2024-09-04 11:10:00', '2024-09-04 11:10:56.361633', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('37d511a3-ced9-4b91-9bad-35f26278834e', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Booking Received', 'SHANGHAI', '2024-09-04 11:22:00', '2024-09-04 11:22:14.840571', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('86d25a63-e8b7-4252-9b26-ed238cc75058', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Booking Received', 'SHANGHAI', '2024-09-04 11:29:00', '2024-09-04 11:29:46.545754', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('7f580c90-738a-49b1-9c9c-768319b63b81', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Booking Received', 'SHANGHAI', '2024-09-04 11:37:00', '2024-09-04 11:37:38.413586', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('7b3e1e8d-f247-4aec-99f1-0153a272a801', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Booking Received', 'SHANGHAI', '2024-09-04 11:44:00', '2024-09-04 11:44:26.275733', 'china@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('420d182c-a721-40d0-9382-b757f9a46a60', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.322024', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('5c607eac-1dcd-4062-9e83-615c047c687e', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.331701', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('c555f236-ab2f-4a4d-b65e-cb7eab1bb8f4', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.340622', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('894f3262-306f-4e32-931a-c936bd8afabd', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.350389', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('86554ab2-c5ca-4f11-8829-38e387d401a8', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.359996', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('1faa616d-55f2-46b2-b14b-0a6e6008c730', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Booking Confirmed', 'SHANGHAI', '2024-09-04 11:50:00', '2024-09-04 11:50:21.369175', 'china@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('072d5563-c307-488c-836e-156e6cc717fa', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.869749', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('bacc721e-6641-41ba-b60e-a734945c923c', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.880488', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('1c00ac2e-4c62-4176-b2d2-1dba0774721c', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.890493', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('bbb3b993-9c05-4590-b216-f29d3dfe72bb', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.900481', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('748e5895-ff3a-475d-9a3d-800708eaf140', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.910734', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('456c7cbb-b415-4d01-8725-fa05d90bb207', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Cargo Received CFS', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:16.92063', 'china@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('71dc5532-ab2b-4fbb-8089-c9896c8b8f2a', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.215346', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('574d08f7-1482-4ba0-8b15-d7228926137d', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.22784', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('6ad51ff7-d330-4421-8b0c-a88be26ca9eb', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.239664', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('b2d4014b-db23-4e12-ae99-0447744c841a', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.253091', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('86bbab17-c2b7-4455-b48e-9d3d6b06a99c', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.266832', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('6826f991-9825-4dbd-acd3-fecfa992f025', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Under Customs Clearance', 'SHANGHAI', '2024-09-04 15:16:00', '2024-09-04 14:15:28.279531', 'china@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('1f856dd8-1dec-4e6b-8c41-8a2f9cd33bd1', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:36.968185', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('214f8aaf-8831-428a-b6b5-65ad3a15546b', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:36.982193', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('a2e3d03e-ebe1-424c-824e-b4b83f1d8467', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:36.99647', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('73fb9f8a-cdae-4974-ab0f-5a9acb4d3ad4', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:37.012266', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('428249cf-02a7-4c94-9439-70dd4d5eb108', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:37.028242', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('d2e681ff-f71c-4909-9943-4d9d2c70a4fa', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Loading Completed', 'SHANGHAI', '2024-09-04 14:15:00', '2024-09-04 14:15:37.042263', 'china@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('26f9a4b3-5f44-4aa2-94f7-aec4c05c3892', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.258941', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('2600e175-3157-4e4a-8d46-7e1a8f831004', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.270008', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('9e2e210c-2c28-42a1-b226-f7b122468000', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.280371', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('0bea91c2-f930-4ae9-9e42-ea4b7f85892c', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.292496', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('b38aded6-e862-405f-84a2-b2307c4a14f9', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.303523', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('22b01ee9-6cfb-4ce8-8bb9-7dea05193af6', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Container Onboard', 'SHANGHAI', '2024-09-04 15:17:00', '2024-09-04 14:16:58.313999', 'china@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('37ba73ce-1967-4ce9-a55d-8f63eb46a1f1', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.771833', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('b4540fc3-633f-4654-a7d6-eb2380ce0f43', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.786464', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('62879f06-6771-4a91-a110-1cde8f35921e', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.800061', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('1580a30c-7202-4ab3-a34c-8cc623e74ce5', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.813096', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('144de95f-2c25-41f0-ac2b-645860f1054f', '9ba84c1b-5448-471a-a1df-796b99af261d', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.825635', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('fe726a3c-1f60-4d90-aedb-b0c03639d921', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'Vessel Departed', 'SHANGHAI', '2024-09-04 20:25:00', '2024-09-04 14:19:20.838194', 'china@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('84665547-d143-4af6-b07c-3fac25523a6e', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Booking Received', 'JAKARTA', '2024-09-04 15:08:00', '2024-09-04 15:08:27.0825', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('b3646d2d-dd9d-40c8-a902-8a084cb27f36', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Booking Confirmed', 'JAKARTA', '2024-09-04 16:25:00', '2024-09-04 16:24:31.100917', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('210937e6-2808-4464-ab7f-a01c6d47d66b', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Cargo Received CFS', 'JAKARTA', '2024-09-04 17:25:00', '2024-09-04 16:24:59.537574', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('a5159a5a-a86e-4048-a5f4-0e677253d954', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Under Customs Clearance', 'JAKARTA', '2024-09-04 19:28:00', '2024-09-04 16:25:10.247012', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('08603368-e727-48a2-9948-feab3e71fa35', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Loading Completed', 'JAKARTA', '2024-09-04 20:29:00', '2024-09-04 16:25:40.925773', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('634f077e-8261-4e2e-8fe7-e6d669f59eec', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Container Onboard', 'JAKARTA', '2024-09-04 20:31:00', '2024-09-04 16:25:50.477268', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('02b33e7e-45e5-45e3-aa14-97b198052ea2', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'Vessel Departed', 'JAKARTA', '2024-09-04 22:32:00', '2024-09-04 16:26:06.360646', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('eb3524f9-b1c4-4654-9f6a-c462166c3598', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Booking Received', 'JAKARTA', '2024-09-04 17:37:00', '2024-09-04 17:37:30.418753', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('668cbcce-1685-4166-82f6-eb819f21a0ea', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Booking Confirmed', 'JAKARTA', '2024-09-04 19:45:00', '2024-09-04 17:43:54.720087', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('a55454cf-1c6c-4a05-a6e0-fa02141d613e', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Cargo Received CFS', 'JAKARTA', '2024-09-04 17:44:00', '2024-09-04 17:44:10.775994', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('6af99edb-f5f0-45de-b88f-14abc7bb2ac3', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Under Customs Clearance', 'JAKARTA', '2024-09-04 19:46:00', '2024-09-04 17:44:33.666748', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('ab38ae4d-f2c7-4269-b0b0-4beb5619c690', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Loading Completed', 'JAKARTA', '2024-09-04 19:01:00', '2024-09-04 17:59:10.848997', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('27694095-8af4-4023-b4e0-05de7ac78a05', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Container Onboard', 'JAKARTA', '2024-09-04 20:02:00', '2024-09-04 17:59:19.172546', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('79d50134-0e58-4981-be26-ca2353ef73ab', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'Vessel Departed', 'JAKARTA', '2024-09-04 22:54:00', '2024-09-04 17:59:29.794711', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('3b2d1135-7572-44c1-a291-a9914844729d', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Booking Received', 'SEMARANG', '2024-09-05 15:31:00', '2024-09-05 15:31:23.590032', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('1e0300be-ae12-4472-bb92-aecedeef6f24', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Booking Confirmed', 'JAKARTA', '2024-09-05 15:34:00', '2024-09-05 15:34:43.892238', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 2);
INSERT INTO "origin"."histori_job" VALUES ('6a4f8de9-2c44-4391-bc99-b539d1b40617', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Cargo Received CFS', 'JAKARTA', '2024-09-05 15:38:00', '2024-09-05 15:38:44.943026', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 3);
INSERT INTO "origin"."histori_job" VALUES ('4e78b2b0-7650-4323-883a-fc9b0b798d21', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Under Customs Clearance', 'JAKARTA', '2024-09-05 15:38:00', '2024-09-05 15:38:54.328337', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 4);
INSERT INTO "origin"."histori_job" VALUES ('a21342e1-98fe-4cf0-80f3-af08e585581b', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Loading Completed', 'JAKARTA', '2024-09-05 15:38:00', '2024-09-05 15:39:06.013915', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 5);
INSERT INTO "origin"."histori_job" VALUES ('84d58b73-f884-4523-a16c-a9b868bffa94', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Container Onboard', 'JAKARTA', '2024-09-05 15:38:00', '2024-09-05 15:39:14.548626', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 6);
INSERT INTO "origin"."histori_job" VALUES ('b4039441-3760-48ff-98ba-9a3e10bc608a', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 'Vessel Departed', 'JAKARTA', '2024-09-05 15:38:00', '2024-09-05 15:39:37.925763', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 7);
INSERT INTO "origin"."histori_job" VALUES ('f4627d68-a6ae-4260-8c65-5994dbe95651', '8a0bb14d-acee-4250-b4ad-4940dc457f46', 'Booking Received', 'JAKARTA', '2024-09-05 17:00:00', '2024-09-05 17:00:48.454915', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('6ae182f1-755f-4c64-914c-ebebf4a824c4', '5c3c5f88-1d2b-4865-9f5c-c3232d517ba3', 'Booking Received', 'SEMARANG', '2024-09-06 14:19:00', '2024-09-06 14:20:01.814721', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 1);
INSERT INTO "origin"."histori_job" VALUES ('12388cee-6b12-41a5-91b6-1e9508d4cdc7', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'Booking Received', 'JAKARTA', '2024-09-06 15:15:00', '2024-09-06 15:15:44.310763', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 12);
INSERT INTO "origin"."histori_job" VALUES ('ce07084b-45ff-42c1-bc25-1b8690849992', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'Booking Confirmed', 'JAKARTA', '2024-09-06 15:17:00', '2024-09-06 15:17:47.080356', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 13);
INSERT INTO "origin"."histori_job" VALUES ('4cd7a1ad-ca61-4391-a9a2-3f4d19de0017', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'Received in airport warehouse', 'JAKARTA', '2024-09-06 15:17:00', '2024-09-06 15:17:59.107593', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 14);
INSERT INTO "origin"."histori_job" VALUES ('d0fea554-1979-46ca-8d4b-a2017b9a701c', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'Manifested', 'JAKARTA', '2024-09-06 15:18:00', '2024-09-06 15:18:57.324452', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 15);
INSERT INTO "origin"."histori_job" VALUES ('8e2378ad-4fe3-407f-84db-b8cc60d03faa', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'Departed', 'JAKARTA', '2024-09-06 15:19:00', '2024-09-06 15:19:07.338942', 'jakarta@pamcargo.com', 'GMT+7', 0, 16, 16);

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
  "voyage_number_feeder" varchar(255) COLLATE "pg_catalog"."default"
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
-- Records of job_order
-- ----------------------------
INSERT INTO "origin"."job_order" VALUES ('a2db59ad-1178-4be4-891c-2e6d5412a666', 'SA2408001', '2024-08-21', NULL, 'd44fb626-8a17-4e02-98fa-e3b5817b40a0', 'CSCL URANUS - CO897646BGR', NULL, 'system@pamcargo.com', NULL, 'operations@pamcargo.com', 1, 2, '074af240-e14c-47be-b06f-d5e314fbcafe', 'PT PAM TRANSPOR INDONESIA', '2024-08-24', NULL, 'b1bb64f5-2b99-458f-b189-f53ca36eecfe', NULL, NULL);
INSERT INTO "origin"."job_order" VALUES ('27a6281b-9714-43e9-b67f-934dc861ec29', 'SA2408002', '2024-08-26', 'Destination Charges', '2847aa72-6af6-4355-bc66-7e31872a775d', 'COSCO SHIPPING VIRGO - COSCOCOSMOS', NULL, 'system@pamcargo.com', NULL, 'thomas@pamcargo.com', 1, 1, '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'SHANGHAI', '2024-09-06', '12', '20c023b0-bc2d-466c-bc8b-98f854050861', NULL, NULL);
INSERT INTO "origin"."job_order" VALUES ('d863180f-24a3-4172-af7f-1e56e42ef517', 'SA2409002', '2024-09-04', NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT - KOLONELDADANG', NULL, 'system@pamcargo.com', NULL, NULL, 1, 1, '074af240-e14c-47be-b06f-d5e314fbcafe', 'PT PAM TRANSPOR INDONESIA', '2024-09-11', NULL, '771bacc2-5383-404e-aba4-b8ffa63c5480', NULL, NULL);
INSERT INTO "origin"."job_order" VALUES ('fd2ff0c8-32d4-4f9b-8536-9aa4d7289823', 'SA2409003', '2024-09-04', NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE - MULYONO', NULL, 'system@pamcargo.com', NULL, NULL, 1, 1, '074af240-e14c-47be-b06f-d5e314fbcafe', 'PT PAM TRANSPOR INDONESIA', '2024-09-07', NULL, '19514cba-ab37-4564-853e-4ea878c0243d', NULL, NULL);
INSERT INTO "origin"."job_order" VALUES ('b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SA2409001', '2024-09-04', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', 'SINAR BAJO - SINARSURYA', NULL, 'system@pamcargo.com', NULL, 'operations@pamcargo.com', 1, 1, '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'PAM CHINA', '2024-09-12', NULL, 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, NULL);
INSERT INTO "origin"."job_order" VALUES ('9c99e7d1-e060-4959-bf45-aa7abfdd8f60', 'SA2409004', '2024-09-05', NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE - MULYONO', NULL, 'system@pamcargo.com', NULL, NULL, 1, 1, '074af240-e14c-47be-b06f-d5e314fbcafe', 'PT PAM TRANSPOR INDONESIA', '2024-09-07', NULL, '445f2153-d251-4228-8ee1-e69c80c847a1', 'KOKO SARANG', '22FW');

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
)
;
COMMENT ON COLUMN "origin"."job_order_air"."job_order_type" IS '1. sea Import
2. air expor
3. air import
4. air export';
COMMENT ON COLUMN "origin"."job_order_air"."status" IS '1. generated
2. process
3. done
';

-- ----------------------------
-- Records of job_order_air
-- ----------------------------
INSERT INTO "origin"."job_order_air" VALUES ('8bb13129-e160-4401-ac8e-cce02b1b27ea', 'CA2409001', '2024-09-06', NULL, '51c8aeb1-e159-48cf-a2e5-695976e3a228', 'LPJKT-2409003', NULL, 'system@pamcargo.com', NULL, NULL, 4, 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 'PT PAM TRANSPOR INDONESIA');

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
-- Records of job_order_detail
-- ----------------------------
INSERT INTO "origin"."job_order_detail" VALUES ('d973f9d0-723a-4a1f-8556-570eb1cdd208', 'a2db59ad-1178-4be4-891c-2e6d5412a666', 'JKTSA2408001', '26fe19a6-dd67-4944-80b9-d5803dddd754');
INSERT INTO "origin"."job_order_detail" VALUES ('09740d44-8eeb-4930-a17a-63bcc35fde08', 'a2db59ad-1178-4be4-891c-2e6d5412a666', 'JKTSA2408002', '99ff7f51-20ee-458c-a897-3c7807e40b76');
INSERT INTO "origin"."job_order_detail" VALUES ('9bca402c-10cb-4ee7-b82b-122081c7ea5a', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'JKTSA2409001', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf');
INSERT INTO "origin"."job_order_detail" VALUES ('81572a2a-807b-477f-b747-e4d43bcea2e5', 'fd2ff0c8-32d4-4f9b-8536-9aa4d7289823', 'JKTSA2409002', '4d6cc804-1577-44b5-952f-fc49cf16bedf');
INSERT INTO "origin"."job_order_detail" VALUES ('5735e322-bcfa-440d-81b6-bbf46e8a0d22', '9c99e7d1-e060-4959-bf45-aa7abfdd8f60', 'SRGSA2409001', 'b9e85498-a6ac-4624-af18-336d8e4141cb');
INSERT INTO "origin"."job_order_detail" VALUES ('742f2bf8-1b6b-4972-8338-e7fa76247bb3', '8bb13129-e160-4401-ac8e-cce02b1b27ea', 'CGKCA2409001', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75');
INSERT INTO "origin"."job_order_detail" VALUES ('e59907f1-9fca-4fe3-8aae-34953236d544', '27a6281b-9714-43e9-b67f-934dc861ec29', 'SHASA2408001', '6539bea7-2486-402d-9946-7f89e7ce25c5');
INSERT INTO "origin"."job_order_detail" VALUES ('df3aacc3-0df7-4d7e-8833-0d032a2e02ea', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409003', '55266cd6-7933-4fa5-9b5b-f04225430d24');
INSERT INTO "origin"."job_order_detail" VALUES ('5d24c06f-8c67-43da-a4ae-458ae43dd963', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409004', '472030ee-bd86-4d6c-bf2f-d6791f049340');
INSERT INTO "origin"."job_order_detail" VALUES ('6e00beba-8ad3-41f1-aa87-0b4513e48d05', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409006', '1dfc9387-daf8-42a4-9e83-5988441ab31a');
INSERT INTO "origin"."job_order_detail" VALUES ('98ab4a9d-b57f-45f5-baad-afcef7185e01', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409001', 'de50ad41-f048-40e5-9c27-42413c98e9a6');
INSERT INTO "origin"."job_order_detail" VALUES ('575aeb5c-6b3c-4db6-bf21-8801c512370f', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409002', '9ba84c1b-5448-471a-a1df-796b99af261d');
INSERT INTO "origin"."job_order_detail" VALUES ('775a495f-f901-4581-8c28-22480ced2e68', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'SHASA2409005', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3');

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
)
;

-- ----------------------------
-- Records of job_order_document
-- ----------------------------
INSERT INTO "origin"."job_order_document" VALUES ('2c4da7d7-4ca8-47e4-a218-a8bf44d5ca4d', 'shipping_line_invoices', '21082024/manifest_(1)-210820241724235667.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'a2db59ad-1178-4be4-891c-2e6d5412a666', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('cca0904d-3331-4a45-bf0b-327066127784', 'airline_agreed_rate', '21082024/qsl_card2024_08_20_10_59_00_-210820241724235702.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'a2db59ad-1178-4be4-891c-2e6d5412a666', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('0b80c50d-737f-4e18-8c2c-f024144f35a7', 'ctd', '26082024/proposal-panjat-pinang-260820241724654972.pdf', NULL, 'thomas@pamcargo.com', NULL, NULL, 1, '27a6281b-9714-43e9-b67f-934dc861ec29', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('49606ce2-db96-407a-8d23-edaacf34f2e1', 'shipping_line_invoices', '04092024/APL_HOLLAND-0RDVCE-operation-chart_(1)-040920241725435865.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('5654f2aa-5275-4688-982c-9253d265d572', 'origin_debit_note', '04092024/OPERATION_CHART-040920241725435879.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('b5f9a91f-0ca3-43e8-9c46-528bd7570b50', 'shipping_line_invoices', '04092024/Vecteezy-License-Information-040920241725442089.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'd863180f-24a3-4172-af7f-1e56e42ef517', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('f565a0e1-a7fb-4359-94c4-0a1c1c399dc2', 'origin_debit_note', '04092024/Vecteezy-License-Information-040920241725442113.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'd863180f-24a3-4172-af7f-1e56e42ef517', NULL);
INSERT INTO "origin"."job_order_document" VALUES ('0e4ad33e-453a-4658-a7f3-949a938aabd7', 'transport_invoice', '04092024/Vecteezy-License-Information-040920241725442208.pdf', NULL, 'operations@pamcargo.com', NULL, NULL, 1, 'd863180f-24a3-4172-af7f-1e56e42ef517', NULL);

-- ----------------------------
-- Table structure for job_order_vendor
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_order_vendor";
CREATE TABLE "origin"."job_order_vendor" (
  "job_order_vendor_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "handlig_type" varchar(100) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "origin"."job_order_vendor"."handlig_type" IS '1. trucking
2. handling';
COMMENT ON COLUMN "origin"."job_order_vendor"."type" IS '1. SEA Import , Air Emport';

-- ----------------------------
-- Records of job_order_vendor
-- ----------------------------
INSERT INTO "origin"."job_order_vendor" VALUES ('37a591a3-28b0-4e4c-88be-f0a8a20171a1', '27a6281b-9714-43e9-b67f-934dc861ec29', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('035d4d37-67be-40fa-83a5-ef6e6726606b', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('62d0eac6-7948-4aa9-b9fc-cdbdc3463a2a', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'Shipping line', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('d1b9dd44-cf2e-48b2-b28f-9570e1d854a5', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'cc03810e-ae64-4a4d-bc1b-e76d0567fc3d', 'A N C EXPRESS SHIPPING LINE LLC', 'Shipping line', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('3232971a-5665-4847-8820-5b714af7184a', 'd863180f-24a3-4172-af7f-1e56e42ef517', '570d541a-b87b-4c75-be38-a5862e181150', 'AER LINGUS CARGO', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('987aa6d7-5839-4751-8a86-333406c300ef', 'd863180f-24a3-4172-af7f-1e56e42ef517', '896902e9-d4e5-4ed8-9d36-f423377c4c4f', 'AEROLINEA DEL CARIBE / AERCARIBE', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('67d75252-1deb-46f0-bc15-2ec1be20cd07', 'd863180f-24a3-4172-af7f-1e56e42ef517', '896902e9-d4e5-4ed8-9d36-f423377c4c4f', 'AEROLINEA DEL CARIBE / AERCARIBE', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('439d928d-d7ba-423f-8adc-37b189367d5d', 'd863180f-24a3-4172-af7f-1e56e42ef517', '997f6fc0-c1db-452b-b0d1-b6502b6462cf', 'AEROLINEAS ARGENTINAS', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('63309561-54ac-4cbe-94e4-bf87207834db', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'b5b53b3a-7f29-4d50-9b31-619f0790116a', 'ALASKA AIRLINES', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('9a416302-5165-47d4-b14f-7c812849d3ae', 'd863180f-24a3-4172-af7f-1e56e42ef517', '7fd6d8d0-42f1-4099-a4f7-6211d933d91a', 'AEROMEXICO CARGO', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('ad513cdc-f8e3-4302-b76f-37d05dd7c93e', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'da000d51-774a-431c-8275-c21808d6557b', 'AIR CANADA', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('4c3756e5-a56f-439a-8db0-1135610d51c4', 'd863180f-24a3-4172-af7f-1e56e42ef517', '499550be-051d-40a6-99f3-d48004da2eac', 'AIR INDIA', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('9a6961df-2138-4950-80b4-57b6a083ca76', 'd863180f-24a3-4172-af7f-1e56e42ef517', 'a43610a9-2b81-43a9-947b-3310ff751b2a', 'AIR FRANCE', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('4a1ef008-d527-4e7e-ad59-90e530ba5a4a', 'd863180f-24a3-4172-af7f-1e56e42ef517', '14db9333-e4fd-482a-b375-54bcebc0e045', 'AIR NEW ZEALAND', 'Carrier', NULL);
INSERT INTO "origin"."job_order_vendor" VALUES ('62cd697b-1c5c-4df0-89fd-77665fa9ed30', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '570d541a-b87b-4c75-be38-a5862e181150', 'AER LINGUS CARGO', 'Carrier', NULL);

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
-- Records of job_truck_delivery
-- ----------------------------
INSERT INTO "origin"."job_truck_delivery" VALUES ('86d4b409-6633-4073-b196-cfa74e170f68', '4c8cc1ff-6594-44e9-a17d-69863fd6fb30', 'MARC O´POLO INTERNATIONAL GMBH', 'TCO Transcargo GmbH', NULL, 'Axthelm + Zufall GmbH & Co. KG', '2024-08-21 17:11:00', NULL, 0, 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, '2024-08-21', NULL, NULL, 1, '2024-08-24 17:11:00', NULL, '<p>HOFGARTENSTRASSE 1</p><p>83071 STEPHANSKIRCHEN</p>', '<p>Warenumschlag und Lagerung</p><p>Stenzelring 5</p><p>21107 Hamburg</p>', '<p>Internationale Spedition</p><p>Steinbrüchenstraße 9a</p><p>99428 Grammetal</p>', 'ohne - Sendung wird verzollt');

-- ----------------------------
-- Table structure for job_truck_delivery_detail
-- ----------------------------
DROP TABLE IF EXISTS "origin"."job_truck_delivery_detail";
CREATE TABLE "origin"."job_truck_delivery_detail" (
  "delivery_point_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "delivery_point_id" uuid NOT NULL,
  "ctd_number" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "truck_id" uuid
)
;

-- ----------------------------
-- Records of job_truck_delivery_detail
-- ----------------------------
INSERT INTO "origin"."job_truck_delivery_detail" VALUES ('ed8ae658-2cd7-4cae-994a-dbaeefc4f165', '86d4b409-6633-4073-b196-cfa74e170f68', 'JKTSA2408002', '4c8cc1ff-6594-44e9-a17d-69863fd6fb30');
INSERT INTO "origin"."job_truck_delivery_detail" VALUES ('ece8f94a-dfda-4891-b304-4856b0c1c3da', '86d4b409-6633-4073-b196-cfa74e170f68', 'JKTSA2408001', '4c8cc1ff-6594-44e9-a17d-69863fd6fb30');

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
-- Records of job_trucking
-- ----------------------------
INSERT INTO "origin"."job_trucking" VALUES ('4c8cc1ff-6594-44e9-a17d-69863fd6fb30', 'B 1234 JUI', '129245bc-de6c-4b96-9ee1-a1a4d5067c33', 'Swissport DUS Cargo Services GmbH', '6e26ac84-1100-4d78-b3b7-273433516a12', 'allmode AG', 'dc6cce7a-b8ae-48b0-9ac7-cc6a2cd6c286', '40tonns Truck / Standard Tautliner / Standard Box-Trailer / FTL', '2024-08-25 17:11:00', '2024-08-26 17:11:00', 'marc@pamcargo.com', '2024-08-21', 'marc@pamcargo.com', NULL, 'Closed', NULL);

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
-- Records of loading_plan
-- ----------------------------
INSERT INTO "origin"."loading_plan" VALUES ('c8c1bf50-7d99-414a-8fdc-23182c4b41e5', '3f8950f0-3d54-47c3-8387-89550cb11714', 'ABX AIR', '832', '2024-08-06', 'thomas@pamcargo.com', NULL, NULL, 1, '074af240-e14c-47be-b06f-d5e314fbcafe', '2024-08-08 11:43:00', NULL, NULL, NULL, 'LP-2408001', 1);
INSERT INTO "origin"."loading_plan" VALUES ('0c31499e-e230-472c-bd7d-776395b7af8d', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', '549', '2024-08-28', 'thomas@pamcargo.com', NULL, NULL, 1, '9146bce5-af3a-4803-ac3b-1418cda959a1', '2024-08-08 09:37:00', NULL, NULL, NULL, 'LPBKK-2408002', 1);
INSERT INTO "origin"."loading_plan" VALUES ('51c8aeb1-e159-48cf-a2e5-695976e3a228', 'f130ccc9-7b93-4e60-9e89-75d4208e53d2', 'TURKISH AIRLINES', '235534555', '2024-09-06', 'jakarta@pamcargo.com', NULL, NULL, 1, '074af240-e14c-47be-b06f-d5e314fbcafe', '2024-09-06 15:16:00', NULL, NULL, NULL, 'LPJKT-2409003', 0);

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
)
;

-- ----------------------------
-- Records of loading_plan_detail
-- ----------------------------
INSERT INTO "origin"."loading_plan_detail" VALUES ('445a45cf-fbbb-44ed-9cea-4e5e3ed99a11', '0c31499e-e230-472c-bd7d-776395b7af8d', '222', '35b0c6e1-dba7-41f0-8081-a001910b6fad', 'AALBORG - AAL', '2024-08-29', 'f56521b2-6260-4cd7-82ca-440eb48ef835', 'AARHUS - AAR', '2024-08-30', 'AAL', 'AAR');
INSERT INTO "origin"."loading_plan_detail" VALUES ('f9aaf4d3-015b-4492-a684-a94145096bb8', '51c8aeb1-e159-48cf-a2e5-695976e3a228', 'TK212', '8210168b-d8dd-4da7-9cad-20d7d921e1f1', 'SOEKARNO HATTA INTERNATIONAL - CGK', '2024-09-07', 'd8f8840d-6c5b-4dae-8731-cea29a319146', 'GATWICK - LGW', '2024-09-08', 'CGK', 'LGW');

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
)
;

-- ----------------------------
-- Records of loading_plan_document
-- ----------------------------
INSERT INTO "origin"."loading_plan_document" VALUES ('ad10bedf-8854-44bc-bd9b-f651f4291d91', 'b1bb64f5-2b99-458f-b189-f53ca36eecfe', 'lp_origin_debit', '21082024/lp_origin_debit_qsl_card2024_08_20_10_59_00__LPJKT-2408001_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', 'jakarta@pamcargo.com', '1', NULL, NULL);
INSERT INTO "origin"."loading_plan_document" VALUES ('1cfa1790-8406-44d2-85ec-5f65d9bad51b', 'b1bb64f5-2b99-458f-b189-f53ca36eecfe', 'lp_bl_doc', '21082024/lp_bl_qsl_card2024_08_20_10_59_00__LPJKT-2408001_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', 'jakarta@pamcargo.com', '1', NULL, '9c7474b9-820d-404c-95d6-bbaf4c12f04e');
INSERT INTO "origin"."loading_plan_document" VALUES ('1b8d35bf-fed2-4080-9901-8b2d51dfcf52', '20c023b0-bc2d-466c-bc8b-98f854050861', 'lp_origin_debit', '26082024/lp_origin_debit_QSL_Card_8H79I_#1_LPSHA-2408002_1.pdf', NULL, NULL, 'china@pamcargo.com', 'china@pamcargo.com', '1', NULL, NULL);
INSERT INTO "origin"."loading_plan_document" VALUES ('2b014153-4d0c-4dfc-8f2e-7e7accea8389', '20c023b0-bc2d-466c-bc8b-98f854050861', 'lp_bl_doc', '26082024/lp_bl_QSL_Card_8H79I_#1_LPSHA-2408002_1.pdf', NULL, NULL, 'china@pamcargo.com', 'china@pamcargo.com', '1', NULL, 'f4f485e7-2d5f-4f00-a60d-cd542c5640a0');
INSERT INTO "origin"."loading_plan_document" VALUES ('03a9029f-f388-4db7-8d22-aa08a482db8c', '771bacc2-5383-404e-aba4-b8ffa63c5480', 'lp_bl_doc', '04092024/lp_bl_meraki_whitepaper_wifi6_2_LPJKT-2409003_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', 'jakarta@pamcargo.com', '1', NULL, 'eea5b864-19e1-4574-b7a5-d5343dc7f316');
INSERT INTO "origin"."loading_plan_document" VALUES ('3b72c891-99ba-4e2d-8063-9fbbf8f18128', '51c8aeb1-e159-48cf-a2e5-695976e3a228', 'lp_cargo_manifest', '06092024/lp_cargo_manifest_Kuis_Umpan_Balik_-_Wira_LPJKT-2409003_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', 'jakarta@pamcargo.com', '1', NULL, NULL);
INSERT INTO "origin"."loading_plan_document" VALUES ('77b4c8a2-a659-4b46-9c23-5f08935ce18e', '51c8aeb1-e159-48cf-a2e5-695976e3a228', 'lp_mawb', '06092024/lp_mawb_SPKPortal_Layanan_Publik_dan_Hub_Kominfo_untuk_OSS_LPJKT-2409003_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', 'jakarta@pamcargo.com', '1', NULL, NULL);

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
)
;

-- ----------------------------
-- Records of loading_report
-- ----------------------------
INSERT INTO "origin"."loading_report" VALUES ('0f1eed6a-fecd-411e-9e40-7736f2f0a1ab', '304e18a6-493f-4c24-b0f3-e476794c5d5c', 'PIL', '9999', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', '2024-09-06 00:00:00', 'jakarta@pamcargo.com', '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT', '2024-09-07', '2024-09-11', 'KOLONELDADANG', 'KOKO SARANG', '2345AW', '2024-09-06 00:00:00', 'LPJKT-2409010', '99', 0);
INSERT INTO "origin"."loading_report" VALUES ('f5ed728d-28a6-4e4f-a52f-40008afbd4e9', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'BOONLINE', 3, NULL, '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 1, '2024-09-04 00:00:00', 'china@pamcargo.com', '2024-09-04 00:00:00', 'china@pamcargo.com', '3212b041-21e7-4d31-b493-ec484ef935b3', 'SINAR BAJO', '2024-09-07', '2024-09-12', 'SINARSURYA', NULL, NULL, '2024-09-06 00:00:00', 'LPSHA-2409001', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('061d03a5-3dfb-4652-a239-6e82c52ef10c', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', 'BO1234', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', '2024-09-05 00:00:00', 'jakarta@pamcargo.com', '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', NULL, NULL, '2024-09-06 00:00:00', 'LPJKT-2409011', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('fdfcd090-68e4-420c-8d3d-ceec20e56fa0', '97d517f9-cf56-4abc-a4f1-3a4b63f822ce', 'CMA CGM S.A', '123', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-04 00:00:00', 'jakarta@pamcargo.com', '2024-09-04 00:00:00', 'jakarta@pamcargo.com', '119892d8-e20b-4833-a439-1e7ef3d08516', 'APL HOLLAND', '2024-08-31', '2024-09-03', '123', NULL, NULL, '2024-08-31 00:00:00', 'LPJKT-2409002', '123', 0);
INSERT INTO "origin"."loading_report" VALUES ('771bacc2-5383-404e-aba4-b8ffa63c5480', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', 'DIRECTBO', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-04 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT', '2024-09-07', '2024-09-11', 'KOLONELDADANG', NULL, NULL, '2024-09-06 00:00:00', 'LPJKT-2409003', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('19514cba-ab37-4564-853e-4ea878c0243d', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', 'PAKMULYONO', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-04 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', NULL, NULL, '2024-09-06 00:00:00', 'LPJKT-2409004', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('22511bac-12a9-4033-8b0d-8125cc202a22', '304e18a6-493f-4c24-b0f3-e476794c5d5c', 'PIL', '41', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT', '2024-09-07', '2024-09-11', 'KOLONELDADANG', '231', '411', '2024-09-06 00:00:00', 'LPJKT-2409005', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('10265a61-3e6e-489a-9d49-5263ae1d5693', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', '44', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', NULL, NULL, '2024-10-05 14:18:00', 'LPJKT-2409006', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('49082682-402c-4683-be21-32086d18dfff', '304e18a6-493f-4c24-b0f3-e476794c5d5c', 'PIL', '214', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT', '2024-09-07', '2024-09-11', 'KOLONELDADANG', NULL, NULL, '2024-09-27 14:30:00', 'LPJKT-2409007', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('444598dd-78eb-42f6-a1bc-b374e6b4b648', '304e18a6-493f-4c24-b0f3-e476794c5d5c', 'PIL', '2141', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'KOTA SAHABAT', '2024-09-07', '2024-09-11', 'KOLONELDADANG', 'KOKO SARANG', '44W', '2024-09-06 00:00:00', 'LPJKT-2409008', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('445f2153-d251-4228-8ee1-e69c80c847a1', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', '412', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', 'KOKO SARANG', '22FW', '2024-10-05 14:52:00', 'LPJKT-2409009', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('5b155ef5-94d0-41e0-b78e-a53c6f96b5a8', '80bbd2e5-eb99-4207-ac42-a71d6200fe08', 'UNKNOWN', 'LKIO192WO', 2, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-06 00:00:00', 'jakarta@pamcargo.com', '2024-09-06 00:00:00', 'jakarta@pamcargo.com', '286a51ec-5cab-4d7f-8387-822bb952c94c', 'NORDLION', '2024-09-07', '2024-09-09', '878', 'KOKO MELON', '44 KAW', '2024-09-08 00:00:00', 'LPJKT-2409014', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('679ba1c2-ae79-4472-aaec-e7894b89b1d3', 'b8df977c-6a09-42f7-a7cb-116447948258', 'CMA CGM AND ANL NE LLC', '4442211', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-06 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '1c007e37-163f-4fdf-9be2-ffaa971bacf2', 'ESL KABIR', '2024-09-11', '2024-09-12', '09909', 'KOKO KRUNCH', '22 W', '2024-09-12 00:00:00', 'LPJKT-2409015', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('c40ff753-3091-4010-b5ca-8ede9ffe09c9', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', 'PP22', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', '2024-09-05 00:00:00', 'jakarta@pamcargo.com', '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', 'KOKO MELON', 'GQ11', '2024-09-06 00:00:00', 'LPJKT-2409012', NULL, 0);
INSERT INTO "origin"."loading_report" VALUES ('5b929449-9da4-46f6-b546-20ebe782736a', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', 'PP2', 1, NULL, '074af240-e14c-47be-b06f-d5e314fbcafe', 1, '2024-09-05 00:00:00', 'jakarta@pamcargo.com', NULL, NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', 'EVER FORTUNE', '2024-09-07', '2024-09-07', 'MULYONO', NULL, NULL, '2024-09-06 00:00:00', 'LPJKT-2409013', NULL, 0);

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
  "status" int2 DEFAULT 1
)
;

-- ----------------------------
-- Records of loading_report_bl
-- ----------------------------
INSERT INTO "origin"."loading_report_bl" VALUES ('c5d7cae9-0163-48e1-91b8-58ed90e973bb', 'BLONLINE09092024', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', '2024-09-04', 'china@pamcargo.com', NULL, 'china@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('d4642a56-42e7-4d54-999f-d948b0f40347', '123', 'fdfcd090-68e4-420c-8d3d-ceec20e56fa0', '2024-09-04', 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('eea5b864-19e1-4574-b7a5-d5343dc7f316', 'DIRECTBLTESTDADANG', '771bacc2-5383-404e-aba4-b8ffa63c5480', '2024-09-04', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('68334b2b-8980-4b34-bd50-ea5e2bb4d095', 'MULYONOSIREGAR', '19514cba-ab37-4564-853e-4ea878c0243d', '2024-09-04', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('02e6088a-36bb-461b-b710-96b32ebff03f', '512', '22511bac-12a9-4033-8b0d-8125cc202a22', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('a024de44-16c7-4fa4-a5c5-22a4a37b658d', '123', '10265a61-3e6e-489a-9d49-5263ae1d5693', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('02799d96-0f08-4ca2-b56f-f38473a44e23', '512', '49082682-402c-4683-be21-32086d18dfff', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('0167e15e-a61d-40c1-b290-e6135d821640', '5121', '444598dd-78eb-42f6-a1bc-b374e6b4b648', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('d9b7def1-8f40-4290-ae9d-b60d7c4c3c67', '45125', '445f2153-d251-4228-8ee1-e69c80c847a1', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('3c68da45-e2ef-4e33-a281-864f4eeba3c4', '9999', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab', '2024-09-05', 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('4b974a22-688c-4b07-93c0-d75cd5e0a9dc', 'BL1234', '061d03a5-3dfb-4652-a239-6e82c52ef10c', '2024-09-05', 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('b334353a-6adc-4ca3-9e6a-9d00e4b8c843', '412AA', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9', '2024-09-05', 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('9b8aca3b-e165-44c5-8fb9-0d5cb7c4a983', 'SFAS', '5b929449-9da4-46f6-b546-20ebe782736a', '2024-09-05', 'jakarta@pamcargo.com', NULL, NULL, 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('ece6772e-e844-479b-a9b6-16280016f98d', '414', '5b155ef5-94d0-41e0-b78e-a53c6f96b5a8', '2024-09-06', 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1);
INSERT INTO "origin"."loading_report_bl" VALUES ('3cc00a73-ece3-4851-a08b-190f07944fd2', '442211AAF', '679ba1c2-ae79-4472-aaec-e7894b89b1d3', '2024-09-06', 'jakarta@pamcargo.com', NULL, NULL, 1);

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
-- Records of loading_report_detail
-- ----------------------------
INSERT INTO "origin"."loading_report_detail" VALUES ('02fb757e-b85a-481f-9df0-dc9e44354813', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', 'CON20240909', 'SEAL08998921009', '40 FT', 1, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb');
INSERT INTO "origin"."loading_report_detail" VALUES ('f5a9e1ab-c72d-4cc3-8394-f0ab726fb66e', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', 'CON20240910', 'SEAL08998921010', '40 FT', 1, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb');
INSERT INTO "origin"."loading_report_detail" VALUES ('aca97769-122e-49a8-b780-5e31ef1c6146', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', 'CON20240911', 'SEAL08998921011', '20 FT', 1, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb');
INSERT INTO "origin"."loading_report_detail" VALUES ('efa1231e-ab48-4e71-b276-c4985e4bca6b', 'fdfcd090-68e4-420c-8d3d-ceec20e56fa0', '123', '123', '45 HC', 1, 'd4642a56-42e7-4d54-999f-d948b0f40347');
INSERT INTO "origin"."loading_report_detail" VALUES ('249e3f97-96a8-4c5c-81a3-ed37aff93042', '771bacc2-5383-404e-aba4-b8ffa63c5480', 'CONTROLSHIFTDEL', 'CONTROLALTDEL', '45 HC', 1, 'eea5b864-19e1-4574-b7a5-d5343dc7f316');
INSERT INTO "origin"."loading_report_detail" VALUES ('6e915522-7845-40a1-b228-d3b3597b1b77', '19514cba-ab37-4564-853e-4ea878c0243d', 'BALIKMUL', 'YONO123', '45 HC', 1, '68334b2b-8980-4b34-bd50-ea5e2bb4d095');
INSERT INTO "origin"."loading_report_detail" VALUES ('7c33d306-0af6-43f2-9910-94c389b992f2', '22511bac-12a9-4033-8b0d-8125cc202a22', '12', '22', '40 HC', 1, '02e6088a-36bb-461b-b710-96b32ebff03f');
INSERT INTO "origin"."loading_report_detail" VALUES ('51f3d3f5-48af-475f-8041-0bef781978c6', '10265a61-3e6e-489a-9d49-5263ae1d5693', '123', '44', '45 HC', 1, 'a024de44-16c7-4fa4-a5c5-22a4a37b658d');
INSERT INTO "origin"."loading_report_detail" VALUES ('ea786e43-a4f0-4aca-9922-ee874fa4e918', '49082682-402c-4683-be21-32086d18dfff', '22', 'WA1', '45 FT', 1, '02799d96-0f08-4ca2-b56f-f38473a44e23');
INSERT INTO "origin"."loading_report_detail" VALUES ('80239910-9c49-4e75-bb62-f4dadb44d014', '444598dd-78eb-42f6-a1bc-b374e6b4b648', '222', 'WA1', '45 FT', 1, '0167e15e-a61d-40c1-b290-e6135d821640');
INSERT INTO "origin"."loading_report_detail" VALUES ('227a212f-aae7-4bd8-8485-6af38d5ecec1', '445f2153-d251-4228-8ee1-e69c80c847a1', '41212', '1212', '40 HC', 1, 'd9b7def1-8f40-4290-ae9d-b60d7c4c3c67');
INSERT INTO "origin"."loading_report_detail" VALUES ('e6e1a1d6-ca83-432e-9e74-edb3e8ab05e1', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab', '999', '9999', '40 HC', 1, '3c68da45-e2ef-4e33-a281-864f4eeba3c4');
INSERT INTO "origin"."loading_report_detail" VALUES ('f8c3139f-c72b-4e75-8dcc-9cd8014ef3c6', '061d03a5-3dfb-4652-a239-6e82c52ef10c', 'CN012342343', 'SEAL123123', '40 HC', 1, '4b974a22-688c-4b07-93c0-d75cd5e0a9dc');
INSERT INTO "origin"."loading_report_detail" VALUES ('14717e5c-2a47-43e3-a091-78d7578029aa', '061d03a5-3dfb-4652-a239-6e82c52ef10c', '412', '1212', '20 FT GOH', 3, '4b974a22-688c-4b07-93c0-d75cd5e0a9dc');
INSERT INTO "origin"."loading_report_detail" VALUES ('46c5c282-6ae7-4d66-b3cf-bd4b94d6357f', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9', '2412', '222SS', '45 FT', 1, 'b334353a-6adc-4ca3-9e6a-9d00e4b8c843');
INSERT INTO "origin"."loading_report_detail" VALUES ('e106b989-a9b3-4ef7-af99-0262049a7402', '5b929449-9da4-46f6-b546-20ebe782736a', 'GFAS', 'ASD11', '40 HC', 1, '9b8aca3b-e165-44c5-8fb9-0d5cb7c4a983');
INSERT INTO "origin"."loading_report_detail" VALUES ('5626dea8-de36-4380-b25b-01cbc65db235', '5b155ef5-94d0-41e0-b78e-a53c6f96b5a8', '52A', '11', '40 HC', 1, 'ece6772e-e844-479b-a9b6-16280016f98d');
INSERT INTO "origin"."loading_report_detail" VALUES ('ab088615-1e77-4d16-a69c-ac8d18d8e848', '5b155ef5-94d0-41e0-b78e-a53c6f96b5a8', '33Z', '22', '20 FT GOH', 1, 'ece6772e-e844-479b-a9b6-16280016f98d');
INSERT INTO "origin"."loading_report_detail" VALUES ('6354d3c5-ae69-4563-8d59-4c410ec661b8', '679ba1c2-ae79-4472-aaec-e7894b89b1d3', 'FF3AAF', 'DD33', '40 HC', 1, '3cc00a73-ece3-4851-a08b-190f07944fd2');

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
INSERT INTO "origin"."loading_report_feeder" VALUES ('118c5550-43a9-4c3b-8857-6efbd3f20bb2', 'KOKO SARANG', '22FW', '2024-10-05 14:52:00', '1', 'jakarta@pamcargo.com', '2024-09-05 08:05:22', NULL, '2024-09-05 08:05:22', '445f2153-d251-4228-8ee1-e69c80c847a1');
INSERT INTO "origin"."loading_report_feeder" VALUES ('faa4fbf8-b2be-46ed-830e-eb723db6e0e0', 'KOKO SARANG', '2345AW', '2024-09-06 00:00:00', '1', 'jakarta@pamcargo.com', '2024-09-05 08:08:35', 'jakarta@pamcargo.com', '2024-09-05 08:20:46', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('1c5cc8d0-66ac-4fda-90e1-53511b04e275', 'ASFA', 'SFASF', '2024-10-04 16:20:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:20:14', NULL, '2024-09-05 09:20:26', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('31f071ac-c2fe-4274-805a-9f46ecc6b41d', 'FGAS', 'ASD', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:20:14', NULL, '2024-09-05 09:20:26', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('52a32c3d-fb77-4656-8cfd-da27ae29bafa', 'KOKO SARANG', '22z', '2024-10-03 15:23:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:37:32', NULL, '2024-09-05 08:45:52', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('ed4b0685-cf85-49dd-9369-15973ea3407f', 'KOKO SARANG', '22z', '2024-10-03 15:23:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:35:45', 'jakarta@pamcargo.com', '2024-09-05 08:46:12', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('799ded2b-398f-485e-a6c6-5bdd51d9171a', 'KOKO SARANG', '22z', '2024-10-03 15:23:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:35:42', 'jakarta@pamcargo.com', '2024-09-05 08:46:24', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('2d73127e-b102-4d13-bd87-567ceaa7c7de', 'KOKO SARANG', '23FFA', '2024-10-12 15:46:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:46:57', NULL, '2024-09-05 08:47:13', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('2f4eef51-cb72-4e3e-b40a-bf784fd0dbf1', 'KOKO SARANG', 'FSS2', '2024-10-03 15:46:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:46:57', NULL, '2024-09-05 08:47:13', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('15d40082-8dd9-4c70-9b9f-504c804b2510', 'KOKO KRUNCH', '141', '2024-10-11 15:48:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:48:13', NULL, '2024-09-05 08:48:36', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('5b324102-6a2a-4f8a-9826-4889e2d0b377', 'KOKO MELON', '5ADA', '2024-09-27 20:48:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:48:35', 'jakarta@pamcargo.com', '2024-09-05 09:06:38', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('1d23256b-3c02-439d-a93c-42da93e505d1', 'KOKO MELON', '1241', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:06:28', NULL, '2024-09-05 09:06:38', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('12675537-340a-4948-8730-36ff800e064b', 'KOKO MELON', '24AS', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:48:13', 'jakarta@pamcargo.com', '2024-09-05 09:06:38', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('24d681e7-45a5-41c1-96d4-3fef331c2c9a', 'KOKO MELON', 'GQ11', '2024-09-06 00:00:00', '1', 'jakarta@pamcargo.com', '2024-09-05 09:20:54', 'jakarta@pamcargo.com', '2024-09-05 09:21:02', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('8dbe8bec-ca56-417d-b92d-8edd265820a7', 'KOKO MELON', '412', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:06:52', 'jakarta@pamcargo.com', '2024-09-05 09:08:05', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('9ee6a9af-10ab-4e66-a3a3-fb6c4c92f34e', 'KOKO KRUNCH', '4444', '2024-10-02 16:07:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:07:16', NULL, '2024-09-05 09:08:05', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('b2df24ac-68d0-4121-a343-7e03f6ac5506', 'KOKOASD', 'ASDASD', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:07:55', NULL, '2024-09-05 09:08:05', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('6b91f2e7-8e92-4ac0-9960-90aaeaa1ec03', 'ASDA', 'SDASD', '2024-10-02 16:07:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:07:55', NULL, '2024-09-05 09:08:05', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('86f0856f-2f83-45ae-a50b-b6b11aecd0d7', 'DA', 'ASD', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:08:24', NULL, '2024-09-05 09:19:22', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('17c0b9df-5084-4ea0-ad94-3afce213fd1a', 'ASD', 'ASD', '2024-10-03 16:08:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:08:24', NULL, '2024-09-05 09:19:22', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('fbc0ef49-1c2a-4129-9888-2a6b3abf364a', 'FASF', 'ASF', '2024-10-05 16:08:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:08:24', NULL, '2024-09-05 09:19:22', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('c329b601-a822-4931-b230-58b8f0b709b3', 'AF', 'ASFASF', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:13:26', NULL, '2024-09-05 09:19:22', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('5c7da229-70f9-48c2-b771-62ef672f923f', 'AF', 'ASFAS', '2024-10-03 16:13:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:13:26', NULL, '2024-09-05 09:19:22', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('e333241d-fcf0-4a68-953b-82422797f3c2', 'DFASF', 'AFS', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:19:36', NULL, '2024-09-05 09:19:52', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('83604410-a24c-428d-a7ec-95987f5092bc', 'FFASF', 'AS', '2024-10-04 16:19:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:19:36', NULL, '2024-09-05 09:19:52', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('77fb42b3-495b-477a-b3e8-50bafc03eb97', 'FFFF', 'FFF', '2024-09-06 00:00:00', '3', 'jakarta@pamcargo.com', '2024-09-05 09:19:52', NULL, '2024-09-05 09:20:01', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('8454b7ab-9713-46a5-82ed-110b4785719e', 'KOKO MELON', 'GQ22', '2024-10-12 16:20:00', '1', 'jakarta@pamcargo.com', '2024-09-05 09:20:54', 'jakarta@pamcargo.com', '2024-09-05 09:21:02', 'c40ff753-3091-4010-b5ca-8ede9ffe09c9');
INSERT INTO "origin"."loading_report_feeder" VALUES ('63e19f89-ea4a-4b6b-b12a-83225fdc4321', 'KOKO SARANG', 'WWW', '2024-10-04 15:47:00', '3', 'jakarta@pamcargo.com', '2024-09-05 08:47:12', NULL, '2024-09-06 02:32:41', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('333629e6-7faf-4fc5-bfc0-cc7488bf3c0e', 'KOKO SARANG', 'WW333', '2024-10-12 09:39:00', '3', 'jakarta@pamcargo.com', '2024-09-06 02:39:16', NULL, '2024-09-06 02:50:11', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('e4762d02-984a-42b7-a5e1-5591fd7e0a86', 'KOKO SARANG', 'FFF222', '2024-10-12 10:14:00', '3', 'jakarta@pamcargo.com', '2024-09-06 03:14:07', NULL, '2024-09-06 03:15:26', '0f1eed6a-fecd-411e-9e40-7736f2f0a1ab');
INSERT INTO "origin"."loading_report_feeder" VALUES ('856eadd0-0856-4d08-8074-0ec43d7d1a99', 'KOKO MELON', '44 KAW', '2024-09-08 00:00:00', '1', 'jakarta@pamcargo.com', '2024-09-06 04:40:52', NULL, '2024-09-06 04:40:52', '5b155ef5-94d0-41e0-b78e-a53c6f96b5a8');
INSERT INTO "origin"."loading_report_feeder" VALUES ('0d79a0c6-a976-43dd-93b3-4dd4aa2a2771', 'KOKO KRUNCH', '22 W', '2024-09-12 00:00:00', '1', 'jakarta@pamcargo.com', '2024-09-06 07:21:50', NULL, '2024-09-06 07:21:50', '679ba1c2-ae79-4472-aaec-e7894b89b1d3');

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
-- Records of local_transport
-- ----------------------------
INSERT INTO "origin"."local_transport" VALUES ('5f0d7c4b-98ec-4733-a222-299a330ea6e5', '3ac1729a-ea03-4182-b0ac-02f29fbd2a17', '423', '23', '423', NULL, '2024-08-16 17:14:28', NULL, '2024-08-16 17:14:28', NULL, 1, '4234', NULL);

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
-- Records of mawb_stock_generation
-- ----------------------------
INSERT INTO "origin"."mawb_stock_generation" VALUES ('0bf8d795-105f-4ed2-b680-c1e4ebbc03a2', '17600000033', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000003', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('47344408-c464-4cbc-ae8d-4ff6102f337b', '17600000055', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000005', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('13e04f90-1b4a-4ffa-9df4-6170143354be', '17600000066', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000006', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('98608383-a2ff-424f-b6b1-03e803907282', '17600000070', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000007', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('43a82e57-28a6-41bf-966f-8810fe6678a2', '17600000081', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000008', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('9c9ddefd-b7f4-400c-9105-88415bf79e65', '17600000092', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000009', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('a41b5165-1b46-4b54-b0fc-c387fc96de38', '17600000103', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000010', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('5615bcdd-63b2-4072-b2f7-721cacea43c5', '17600000114', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000011', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('35da05a2-1e6d-455b-8925-012680c87919', '17600000125', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000012', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('6b1043d4-0ce3-4d93-bb5e-e96899448d49', '17600000136', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000013', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('9e4e09db-d2e6-4ddf-9fe7-76555c4a88a5', '17600000140', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000014', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('81f2fb9d-5697-4d6f-964b-1d753941fe32', '17600000151', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000015', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('ee4edc2a-bdc5-4e9d-976b-4b089a8ceb16', '17600000162', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000016', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('7e061ff5-dc9e-4772-bded-0127fb560c4e', '17600000173', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000017', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('30b8fe09-becc-442f-917b-f2ccc3af1637', '17600000184', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000018', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('843a2c65-9d11-4f5a-a808-510acbaeeb28', '17600000195', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000019', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('544b8a32-1b0c-4975-9153-8f3ea7ef7171', '17600000206', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000020', 0, NULL, 'STE', '4', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('d1e881ff-75e2-4dce-8306-71afd1065b5d', '17600000011', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000001', 0, 'LP-2408018', 'STE', '2', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('31e4096f-429c-4e58-8804-c9875977a365', '17600000022', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000002', 0, 'LP-2408019', 'STE', '2', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('1ff8ee2b-2f6a-40c5-ad20-037ce2c68631', '54999999911', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999991', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('64f1a2b6-7a8c-4142-83d5-cd0e1bb98543', '54999999922', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999992', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('20c87083-4331-47cf-af90-dc64d663b953', '54999999933', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999993', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('61ed9a42-e493-41b4-ad4e-7f23a37b2929', '54999999944', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999994', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('a4f93173-d080-424f-bbd4-3433fc78d091', '54999999955', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999995', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('e4e61c95-6219-4951-b0ba-565abf837936', '54999999966', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999996', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('89ed3c98-6018-4532-85bc-42059be5f6aa', '54999999970', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999997', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('53598f84-74d5-4fd2-8872-8cfb219a6097', '54999999981', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999998', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('8020977f-5a4c-44ff-962b-7c7118aec847', '54999999992', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999999', 0, NULL, 'STE', '4', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('dd826d49-bf4e-4a9e-b6a0-4b7f8d41721d', '54999999900', '94022317-8d22-4115-b368-2cd855325924', 'ABSA CARGO AIRLINE / LATAM CARGO BRASIL', 'DXB', '549', '9999990', 0, 'LP-2408020', 'STE', '2', NULL, NULL, '2024-08-05', 'operations@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('2b6535e2-7c0c-413b-a64e-d2e0d4ffed9c', '17600000044', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', 'DXB', '176', '0000004', 0, 'LP-2408021', 'STE', '2', 'NOTED', NULL, '2024-07-25', 'thomas@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."mawb_stock_generation" VALUES ('7aeeac4c-1966-4a04-9959-a87edb47087f', '02023424343', 'ae307878-e20a-444c-823b-1de4b1df36d4', 'LUFTHANSA CARGO AG', 'DXB', '020', '23424343', 0, 'LP-2408022', 'STE', '2', NULL, NULL, '2024-08-21', 'operations@pamcargo.com', NULL, NULL);

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
-- Records of noted_section
-- ----------------------------

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
-- Records of notification
-- ----------------------------
INSERT INTO "origin"."notification" VALUES ('d757b4d1-bbdc-47c8-9530-4aa6142ea95b', 'Status Updated', 'The CTD JKTSA2407001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-07-24 14:18:42.293304');
INSERT INTO "origin"."notification" VALUES ('6f9d64cb-f67a-4626-859e-95b4ee12e091', 'Status Updated', 'The CTD JKTSA2407001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-07-24 14:19:04.256526');
INSERT INTO "origin"."notification" VALUES ('5d2d6215-881e-459d-82e0-dabaa6d7021b', 'Status Updated', 'The CTD SRGSA2407001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-07-24 15:11:38.924243');
INSERT INTO "origin"."notification" VALUES ('05d1f9d2-11c2-4e88-a1d3-005e7a442308', 'Status Updated', 'The CTD SRGSA2407001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-07-24 15:12:19.031167');
INSERT INTO "origin"."notification" VALUES ('b2709342-94a8-419a-b858-c8e131822d0e', 'Status Updated', 'The CTD SHASA2407001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-07-24 16:30:17.147295');
INSERT INTO "origin"."notification" VALUES ('37e1b622-92db-425a-82d5-3e75d06e4924', 'Status Updated', 'The CTD SHASA2407001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-07-24 16:30:47.943469');
INSERT INTO "origin"."notification" VALUES ('6db565cc-1946-4707-8b9e-408ce08b0bae', 'Status Updated', 'The CTD HKGSA2407002 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-07-24 16:32:15.335607');
INSERT INTO "origin"."notification" VALUES ('75264aeb-b94d-4557-9282-a8dde668712d', 'Status Updated', 'The CTD HKGSA2407002 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-07-24 16:32:33.759386');
INSERT INTO "origin"."notification" VALUES ('ff685bfd-d462-4471-bb94-ba0e4eb1b32c', 'Status Updated', 'The CTD SHASA2407001A Status is update to Vessel Departed', 'operations@pamcargo.com', '2024-08-01 17:42:49.473446');
INSERT INTO "origin"."notification" VALUES ('de145656-79e7-494f-9368-4ed3d546a1fc', 'Status Updated', 'The CTD SHASA2407001A Status is update to Vessel Departed', 'operations@pamcargo.com', '2024-08-01 17:43:11.495122');
INSERT INTO "origin"."notification" VALUES ('b61a0e1a-7206-42a8-ad78-a5e77181ddfe', 'Status Updated', 'The CTD SHASA2407001A Status is update to Vessel Departed', 'operations@pamcargo.com', '2024-08-01 17:43:32.005019');
INSERT INTO "origin"."notification" VALUES ('fab12705-0e7d-466d-9712-dbc08a6c462b', 'Status Updated', 'The CTD JKTSA2408003 Status is update to Vessel Departed', 'operations@pamcargo.com', '2024-08-05 11:35:35.545579');
INSERT INTO "origin"."notification" VALUES ('ac678684-2c08-4705-a6c9-c8a1966dd4a8', 'Status Updated', 'The CTD JKTSA2408003 Status is update to Vessel Departed', 'operations@pamcargo.com', '2024-08-05 11:35:44.771345');
INSERT INTO "origin"."notification" VALUES ('ad5a9263-27ba-4e6b-86ab-98ec66259cc7', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-08-16 17:14:41.35271');
INSERT INTO "origin"."notification" VALUES ('308e9d12-87a4-4081-879d-d079c55b53d7', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-08-16 17:15:17.863736');
INSERT INTO "origin"."notification" VALUES ('9e06a4fb-1432-4106-8daa-a64cc0fab566', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-08-16 17:15:35.764797');
INSERT INTO "origin"."notification" VALUES ('29eaf887-75e6-437b-8cf3-c7c3a3cc0064', 'Status Updated', 'The CTD JKTSA2408001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-08-21 15:40:37.301576');
INSERT INTO "origin"."notification" VALUES ('edd27b72-ad96-43ce-a8f1-01a272d0975f', 'Status Updated', 'The CTD JKTSA2408002 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-08-21 16:57:30.788059');
INSERT INTO "origin"."notification" VALUES ('4a1d3c84-0b81-4d75-a096-2e086bc4d797', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'china@pamcargo.com', '2024-08-26 11:10:21.195278');
INSERT INTO "origin"."notification" VALUES ('f73310bd-c1f5-441b-8466-cd250c42d0f3', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'admin@rembon.com', '2024-08-29 10:50:54.456731');
INSERT INTO "origin"."notification" VALUES ('d2160de8-09e3-43bc-9713-43fd4406c913', 'Status Updated', 'The CTD SHASA2408001 Status is update to Vessel Departed', 'admin@rembon.com', '2024-08-29 10:52:38.348524');
INSERT INTO "origin"."notification" VALUES ('c3ad2cd6-ea1e-4c82-a555-e3c214dc1d9e', 'Status Updated', 'The CTD SRGSA2409001 Status is update to Vessel Departed', 'jakarta@pamcargo.com', '2024-09-05 15:39:36.993572');

-- ----------------------------
-- Table structure for notification_user
-- ----------------------------
DROP TABLE IF EXISTS "origin"."notification_user";
CREATE TABLE "origin"."notification_user" (
  "notification_user_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "office_id" uuid,
  "notification_id" uuid
)
;

-- ----------------------------
-- Records of notification_user
-- ----------------------------
INSERT INTO "origin"."notification_user" VALUES ('d03031ea-598b-4eb7-8117-a2d5e2a2f72c', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'b2709342-94a8-419a-b858-c8e131822d0e');
INSERT INTO "origin"."notification_user" VALUES ('5858aa0b-4c0a-46e0-a23d-80b8c3c404fb', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', '37e1b622-92db-425a-82d5-3e75d06e4924');
INSERT INTO "origin"."notification_user" VALUES ('9f1bbfec-b3a5-44dd-ab33-5fd0c921eb1b', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'ff685bfd-d462-4471-bb94-ba0e4eb1b32c');
INSERT INTO "origin"."notification_user" VALUES ('d35ea2e9-d121-4b9c-8e23-a0fd333192b7', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'de145656-79e7-494f-9368-4ed3d546a1fc');
INSERT INTO "origin"."notification_user" VALUES ('cab82559-2d2b-436e-bf6e-98ca08e43f9c', '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', 'b61a0e1a-7206-42a8-ad78-a5e77181ddfe');

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
-- Records of operation_chart
-- ----------------------------
INSERT INTO "origin"."operation_chart" VALUES ('44df9af4-e3bd-41b2-805f-2fe88cd15742', 'CSCL URANUS - CO897646BGR', 'OC24080002', 'operation_chart-OC2408000320240830065612.pdf', NULL, '', '2024-08-24', 'GMT+7', 'Thomas Varghese', 'DUBAI');
INSERT INTO "origin"."operation_chart" VALUES ('3ccd860c-40b9-44a5-aba1-7071c1bd7dbf', 'COSCO SHIPPING VIRGO - COSCOCOSMOS', 'OC24080001', 'operation_chart-OC2408000320240830083034.pdf', NULL, '', '2024-09-06', '', '', '');

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
)
;

-- ----------------------------
-- Records of operation_document
-- ----------------------------

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
)
;

-- ----------------------------
-- Records of order_document
-- ----------------------------
INSERT INTO "origin"."order_document" VALUES ('205626b6-d52a-48ab-85cd-a00f41bc9dbc', 'si_doc', '21082024/si_QSL_Card_8H79I_#1_JKTSA2408001_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', NULL, '1', '26fe19a6-dd67-4944-80b9-d5803dddd754', NULL);
INSERT INTO "origin"."order_document" VALUES ('c0f559ee-b617-495a-b627-513f76f8b9d7', 'other_doc', '21082024/other_QSL_Card_8H79I_#1_JKTSA2408001_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', NULL, '1', '26fe19a6-dd67-4944-80b9-d5803dddd754', NULL);
INSERT INTO "origin"."order_document" VALUES ('13c21bfe-9868-4517-92d5-93ad7010c257', 'si_doc', '21082024/si_qsl_card2024_08_20_10_59_00__JKTSA2408002_1.pdf', NULL, NULL, 'jakarta@pamcargo.com', NULL, '1', '99ff7f51-20ee-458c-a897-3c7807e40b76', NULL);

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
-- Records of shipping_instruction
-- ----------------------------
INSERT INTO "origin"."shipping_instruction" VALUES ('1dfc9387-daf8-42a4-9e83-5988441ab31a', '5c213b13-41db-4bbf-b831-fa282bd3b373', '2518041b-90ab-4c09-ba44-a8b1aa86faaa', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '06276e51-bd41-441c-a41f-5f265405162d', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, '2024-09-01', NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-02', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'DIADORA SPA', '<p>VIA MONTELLO, 80&nbsp;</p><p>31031 CAERANO SAN MARCO (TV) ITALY&nbsp;</p><p>C. F. E P. IVA IT 04308510264&nbsp;</p><p>CONTACT:VALENTINA ZAPPAROLI&nbsp;</p><p>P +39 0423 658359 | M +39 348 8858834</p>', 'AEROMODA (SHANGHAI) TRADING CO., LTD', '<p>RM2301, BLDG 1,</p><p>318 NORTH MAOMING ROAD</p><p>SHANGHAI – P.R.C.</p>', 'SHANGHAI', 'SHANGHAI', 'BOLOGNA', 'SINAR BAJO', NULL, 'SHASA2409006', 1, '2024-09-04 11:44:26.271037', 'victor@pamcargo.com', '2024-09-04 11:44:26.271037', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BLQ', 'CNSHA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('adbbaa57-c4a6-429f-9e2c-73aecfe792bf', '5ecc9878-90d0-4789-8622-82b1855c0a03', '73146e96-2d9a-4f28-abbb-7e7afef45cc5', '074af240-e14c-47be-b06f-d5e314fbcafe', '4b11aace-fafc-4d64-9495-345a47cd57e0', 'd8f8840d-6c5b-4dae-8731-cea29a319146', NULL, '7162f74f-a6f0-4491-9904-2ca5009ca4c4', 'QWERTY', '2024-09-06', '123', 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-07', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'LACOSTE', '<p>jalan lika-liku lacoste</p>', 'THE MARKETING STORE WORLDWIDE, LP c/o COMBINE WILL INDUSTRIAL INDONESIA, PT', '<p>DK KARANGMALANG RT.008/RW004, KEL.KARANGMALANG, KEC. MASARAN, KAB. SRAGEN, JAWA TENGAH-57282, INDONESIA</p>', 'JAKARTA', 'JAKARTA', 'LONDON', 'KOTA SAHABAT', NULL, 'JKTSA2409001', 1, '2024-09-04 15:08:27.072916', 'jakarta@pamcargo.com', '2024-09-04 15:08:27.072916', NULL, NULL, 'KOLONELDADANG', NULL, '2024-09-07', '771bacc2-5383-404e-aba4-b8ffa63c5480', NULL, 7, '2024-09-11', NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LGW', 'IDJKT', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'eea5b864-19e1-4574-b7a5-d5343dc7f316', NULL, NULL, NULL, NULL, NULL, NULL, 'jakarta@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('de50ad41-f048-40e5-9c27-42413c98e9a6', '164e330d-cfc2-4724-a1fd-19e017111efa', '6345b90b-d47a-4c39-a26d-3c0b6b31f36b', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', 'QWE', '2024-08-01', 'QWE', 'SEAAIR', 'FCL', 'Collect', 'EXW', 'OKAY', '2024-09-05', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'DOMETIC GERMANY GMBH', '<p>HOLLEFELDSTR .63</p><p>DE-48282 EMSDETTEN</p><p>GERMANY</p>', 'HANGRUN TEXTILE CO.,LTD', '<p>,HANGZHOU</p><p>SHUIHONG TEMPLE,CHONGXIAN TOWN,YUHANG DISTRICT,HANGZHOU CITY,ZHEJIANG,CHINA.</p><p><br></p>', 'SHANGHAI', 'SHANGHAI', 'HAMBURG', 'SINAR BAJO', NULL, 'SHASA2409001', 1, '2024-09-04 11:02:11.913939', 'victor@pamcargo.com', '2024-09-04 11:02:11.913939', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAM', 'CNSHA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Be careful, this is a luxury goods</p>', NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('55266cd6-7933-4fa5-9b5b-f04225430d24', 'f13d257d-c89b-4b74-9c9f-420693b6ced1', 'd940fb6a-230a-4fc3-8bf9-c292538fb302', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', 'd8f8840d-6c5b-4dae-8731-cea29a319146', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, '2024-09-01', NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-01', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'DEVRED SAS', '<p>POLE JULES VERNE 13 RUE DU</p><p>CAPITAINE NEMO BP 90200 - GLISY</p><p>80332 LONGUEAU CEDEX, FRANCE</p>', 'HANGRUN TEXTILE', '<p>SHUIHONG TEMPLE,CHONGXIAN TOWN,YUHANG DISTRICT,HANGZHOU CITY,ZHEJIANG,CHINA.</p>', 'SHANGHAI', 'SHANGHAI', 'LONDON', 'SINAR BAJO', NULL, 'SHASA2409003', 1, '2024-09-04 11:22:14.835607', 'victor@pamcargo.com', '2024-09-04 11:22:14.835607', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LGW', 'CNSHA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('9ba84c1b-5448-471a-a1df-796b99af261d', '164e330d-cfc2-4724-a1fd-19e017111efa', '0a2d2058-5ed5-4eed-ab29-17293b22602d', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', 'PEPPERMINT', '2024-09-01', 'APPROVAL', 'SEAAIR', 'FCL', 'Collect', 'EXW', 'PARTY', '2024-09-01', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'DOMETIC GERMANY GMBH', '<p>HOLLEFELDSTR .63</p><p>DE-48282 EMSDETTEN</p><p>GERMANY</p>', 'HAINING J AND N IMPORT AND  EXPORT CO. , LTD', '<p>NO.68 XIUCHUAN RD,CHANGAN TOWN,HAINING CITY,ZHEJIANG,CHINA CN</p>', 'SHANGHAI', 'SHANGHAI', 'HAMBURG', 'SINAR BAJO', NULL, 'SHASA2409002', 1, '2024-09-04 11:10:56.354076', 'victor@pamcargo.com', '2024-09-04 11:10:56.354076', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAM', 'CNSHA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Jangan di banting</p>', NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'cdc1152e-e011-466b-978d-e96710247479', '410e8aa3-609b-408f-9291-f074bf1823d4', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '0840c793-19b6-4dd1-8c3a-57e493c8a004', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, '2024-09-04', NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-06', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'AP NEDERLAND B.V.', 'LYTSHUZEN 26
8621 XG HEEG
THE NETHERLANDS
ATTN;ESTHER PLAS', 'FUZHOU TOPSAM IMPORT AND EXPORT CO.,LTD', '<p>UNIT B4-B5,7/F.,OFFICE TOWER,HONGLI BLDG,</p><p>NO.168 HUDONG ROAD,FUZHOU,CHINA</p><p>TEL:0086-591-83058776</p><p>USCI:913501025532306746</p>', 'SHANGHAI', 'SHANGHAI', 'DUSSELDORF', 'SINAR BAJO', NULL, 'SHASA2409005', 1, '2024-09-04 11:37:38.407625', 'victor@pamcargo.com', '2024-09-04 11:37:38.407625', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'DUS', 'CNSHA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Barang berbahaya Level 1</p>', NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('472030ee-bd86-4d6c-bf2f-d6791f049340', '21bff7c2-75fa-4bd7-b486-06d6ff300240', '2a6ac95b-b1ce-4ec2-86f0-df789a6e8518', '4be0108c-3bf7-4970-bc35-7b885dc9b3f9', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '2e4d37d9-af09-4faf-98bf-82f3f791ca17', NULL, '3212b041-21e7-4d31-b493-ec484ef935b3', NULL, NULL, NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-01', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'DEVELOPMENT NEVER STOPS ALPHA EMEA GMBH', '<p>STOCKHOLMER PLATZ 1 </p><p>70173 STUTTGART  GERMANY</p><p><br></p>', 'GPE OIL MACHINERY CO., LTD', '<p>888, NO.6 ROAD, MIN YING PIONEERING PARK, </p><p>JIANHU COUNTY, YANCHENG, JIANGSU, CHINA&nbsp;</p><p>TEL: 0086-515-86371902</p>', 'SHANGHAI', 'SHANGHAI', 'AGUASCALIENTES', 'SINAR BAJO', NULL, 'SHASA2409004', 1, '2024-09-04 11:29:46.540005', 'victor@pamcargo.com', '2024-09-04 11:29:46.540005', 'operations@pamcargo.com', NULL, 'SINARSURYA', NULL, '2024-09-07', 'f5ed728d-28a6-4e4f-a52f-40008afbd4e9', NULL, 7, '2024-09-12', NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AGU', 'CNSHA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>yang di bungkus pake karet nya dua itu yang pedes</p>', NULL, NULL, 2, NULL, NULL, 'c5d7cae9-0163-48e1-91b8-58ed90e973bb', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'china@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('8a0bb14d-acee-4250-b4ad-4940dc457f46', 'd27c3416-6332-4be1-a404-aa8256a1493c', '9dcd72e0-494a-42fc-b2f8-6eed7a9358ba', '074af240-e14c-47be-b06f-d5e314fbcafe', '4b11aace-fafc-4d64-9495-345a47cd57e0', 'f56521b2-6260-4cd7-82ca-440eb48ef835', NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', NULL, NULL, NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, NULL, 'Booking Received', '2024-09-07', '2024-09-07', '2024-09-06', 'DUBAI', 'SEAAIR', 'JACK WOLFSKIN', 'AUSRUSTUNG JACK WOLFSKIN KREISEL 1 65510 IDSTEIN, DEUTSCHLAND / GERMANY', 'PT. ANGGUN KREASI GARMEN', 'PEDUKUHAN BAKAL DUKUH, ARGODADI, SEDAYU 
BANTUL 55751 - INDONESIA', 'JAKARTA', 'JAKARTA', 'AARHUS', 'EVER FORTUNE', NULL, 'JKTSA2409003', 1, '2024-09-05 17:00:48.449377', 'jakarta@pamcargo.com', '2024-09-06 00:00:00', 'jakarta@pamcargo.com', '2024-09-06', 'MULYONO', NULL, '2024-09-07', '5b929449-9da4-46f6-b546-20ebe782736a', NULL, 1, '2024-09-07', NULL, NULL, '974c70f8-8497-4b0b-9e64-0dd8cfe01c1f', 'MACHINERY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AAR', 'IDJKT', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '9b8aca3b-e165-44c5-8fb9-0d5cb7c4a983', NULL, NULL, NULL, NULL, NULL, NULL, 'jakarta@pamcargo.com', NULL, 'e4762d02-984a-42b7-a5e1-5591fd7e0a86');
INSERT INTO "origin"."shipping_instruction" VALUES ('b9e85498-a6ac-4624-af18-336d8e4141cb', 'c2b8980a-56f5-469c-ade6-6d1a261dbc9d', '9dcd72e0-494a-42fc-b2f8-6eed7a9358ba', '074af240-e14c-47be-b06f-d5e314fbcafe', '4b11aace-fafc-4d64-9495-345a47cd57e0', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', NULL, NULL, NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', NULL, '2024-09-06', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'JACK WOLFSKIN', 'AUSRUSTUNG FUR DRAUSSEN GmbH & CO.KGaA  WAREHOUSE DISTRIBUTION  25 WULMSTORFER WIESEN  21629 NEU WULMSTORF, HAMBURG - GERMANY', 'PT. ANGGUN KREASI GARMEN', 'PEDUKUHAN BAKAL DUKUH, ARGODADI, SEDAYU 
BANTUL 55751 - INDONESIA', 'SEMARANG', 'JAKARTA', 'HAMBURG', 'EVER FORTUNE', 'KOKO SARANG', 'SRGSA2409001', 1, '2024-09-05 15:31:23.583769', 'jakarta@pamcargo.com', '2024-09-05 00:00:00', 'operations@pamcargo.com', NULL, 'MULYONO', '22FW', '2024-09-07', '445f2153-d251-4228-8ee1-e69c80c847a1', NULL, 7, '2024-09-07', NULL, NULL, '423c8787-a4e5-4f8d-a33a-9ba50fb0a768', 'GARMENTS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HAM', 'IDJKT', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 'd9b7def1-8f40-4290-ae9d-b60d7c4c3c67', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'jakarta@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('4d6cc804-1577-44b5-952f-fc49cf16bedf', '5ecc9878-90d0-4789-8622-82b1855c0a03', '64cbd79a-01d5-4ee9-8e41-b900cde384c5', '074af240-e14c-47be-b06f-d5e314fbcafe', '4b11aace-fafc-4d64-9495-345a47cd57e0', '82b51e23-301d-4645-90b0-d84d220025cd', NULL, '05fc6c3a-7804-4f08-abcb-99843322563e', NULL, '2024-09-04', NULL, 'SEAAIR', 'FCL', 'Collect', 'EXW', '123', '2024-09-04', 'Vessel Departed', '2024-09-07', '2024-09-07', NULL, 'DUBAI', 'SEAAIR', 'LACOSTE', '<p>jalan lika-liku lacoste</p>', 'PT. SEPATU BATA CIKARANG', '<p>Jalan produksi no</p>', 'JAKARTA', 'JAKARTA', 'LOS ANGELES', 'EVER FORTUNE', NULL, 'JKTSA2409002', 1, '2024-09-04 17:37:30.410658', 'jakarta@pamcargo.com', '2024-09-04 17:37:30.410658', 'operations@pamcargo.com', NULL, 'MULYONO', NULL, '2024-09-07', '19514cba-ab37-4564-853e-4ea878c0243d', NULL, 7, '2024-09-07', NULL, NULL, 'd9e10be1-d179-4515-9b8b-adcddc68e085', 'SHOES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LAX', 'IDJKT', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '68334b2b-8980-4b34-bd50-ea5e2bb4d095', NULL, NULL, 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', NULL, NULL, 'jakarta@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('edb80972-95ac-4005-95b7-1ed4ebbf6a75', 'e2aec050-be8e-42e0-9227-c223a1427203', '8b0c805e-73ce-4a59-b584-4638428184e5', '074af240-e14c-47be-b06f-d5e314fbcafe', '8210168b-d8dd-4da7-9cad-20d7d921e1f1', 'd8f8840d-6c5b-4dae-8731-cea29a319146', NULL, 'f130ccc9-7b93-4e60-9e89-75d4208e53d2', NULL, '2024-09-06', NULL, 'AIR', NULL, 'Collect', 'EXW', NULL, '2024-09-06', 'Departed', NULL, NULL, NULL, NULL, 'AIR', 'TRANSNORDIC WAREHOUSE', '<p>RICK VAN DINTER</p><p>BURGEMEESTER NOORDLANDSTRAAT 200</p><p>3316 LV DORDRECHT</p>', 'PT. MORICH INDO FASHION', 'JL. RAYA KARANGJATI KM.25 DESA GEMBONGAN BERGAS SEMARANG, 50552', 'JAKARTA', 'JAKARTA', 'LONDON', 'TURKISH AIRLINES', NULL, 'CGKCA2409001', 1, '2024-09-06 15:15:44.304812', 'jakarta@pamcargo.com', '2024-09-06 15:15:44.304812', NULL, NULL, NULL, NULL, NULL, '51c8aeb1-e159-48cf-a2e5-695976e3a228', NULL, 16, NULL, NULL, NULL, 'c322c5f4-51bc-4112-8d3e-40513a8b3cd0', 'ELECTRICAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'LGW', 'CGK', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jakarta@pamcargo.com', NULL, NULL);
INSERT INTO "origin"."shipping_instruction" VALUES ('5c3c5f88-1d2b-4865-9f5c-c3232d517ba3', '311dd620-8919-4602-a829-777ea228ca2b', '9dcd72e0-494a-42fc-b2f8-6eed7a9358ba', '074af240-e14c-47be-b06f-d5e314fbcafe', 'ad85f333-387b-48b3-8fad-8b4ad4e45e05', '76d2cfe8-c1a4-4c7e-a8d5-a6839d0075e5', NULL, '1c007e37-163f-4fdf-9be2-ffaa971bacf2', NULL, NULL, NULL, 'SEAAIR', 'FCL', 'Collect', 'FCA', NULL, NULL, 'Booking Received', '2024-09-11', '2024-09-11', '2024-09-12', 'DUBAI', 'SEAAIR', 'JACK WOLFSKIN GmbH and Co. KGaA', '<p>IMPORT OPERATIONS </p><p>Jack Wolfskin Kreisel 1</p><p>65510 Idstein, GERMANY</p><p>Tel: +49 6126-954 312 / 313 / 314 Fax: 06126-954 319</p><p>eMail: import.operations@jack-wolfskin.com</p><p><br></p>', 'PT. ANGGUN KREASI GARMEN', 'PEDUKUHAN BAKAL DUKUH, ARGODADI, SEDAYU 
BANTUL 55751 - INDONESIA', 'SEMARANG', 'SEMARANG', 'AALEN-HEIDENHEIM', 'ESL KABIR', 'KOKO KRUNCH', 'SRGSA2409002', 1, '2024-09-06 14:20:01.799533', 'jakarta@pamcargo.com', '2024-09-06 00:00:00', NULL, '2024-09-12', '09909', '22 W', '2024-09-11', '679ba1c2-ae79-4472-aaec-e7894b89b1d3', NULL, 1, '2024-09-12', NULL, NULL, '25de1a35-5c46-445b-919b-45a7ceeabc79', 'OTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EDPA', 'IDSRG', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, '3cc00a73-ece3-4851-a08b-190f07944fd2', NULL, NULL, NULL, NULL, NULL, NULL, 'jakarta@pamcargo.com', NULL, '0d79a0c6-a976-43dd-93b3-4dd4aa2a2771');

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
-- Records of si_order
-- ----------------------------
INSERT INTO "origin"."si_order" VALUES ('66f3c630-408b-409b-b09a-e6843ac5c42d', '9ba84c1b-5448-471a-a1df-796b99af261d', 66, 'BOX', NULL, 10000, '63.01', '<p>Men Jacket</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10444, 10501.246, NULL);
INSERT INTO "origin"."si_order" VALUES ('d7397fff-ae11-495a-b830-874dc60d5356', '9ba84c1b-5448-471a-a1df-796b99af261d', 66, 'BOX', NULL, 10000, '63.01', '<p>Men Jacket</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10444, 10501.246, NULL);
INSERT INTO "origin"."si_order" VALUES ('0e8051e4-6e88-4dfb-a2f7-6f263034584a', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 72, 'CARTON', NULL, 6000, '36.349', '<p>Chinese Food</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6058, 6057.924, NULL);
INSERT INTO "origin"."si_order" VALUES ('db467e30-3c35-4f0b-b37e-c07b721d599d', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 63, 'CARTON', NULL, 5300, '32.143', '<p>Bahan Berbahaya Mengandung Bawang</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5357, 5356.952, NULL);
INSERT INTO "origin"."si_order" VALUES ('0f1329d2-3419-4de2-886a-b83b7be2f281', '472030ee-bd86-4d6c-bf2f-d6791f049340', 50, 'BOX', NULL, 4200, '25.313', '<p>BAHAN PELEDAK PESAWAT JET</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4219, 4218.664, NULL);
INSERT INTO "origin"."si_order" VALUES ('80f09b82-9d7e-4a83-aa92-47d33ee7303a', '55266cd6-7933-4fa5-9b5b-f04225430d24', 66, 'BOX', NULL, 10000, '63.498', '<p>JACKET COWBOYS</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10583, 10582.576, NULL);
INSERT INTO "origin"."si_order" VALUES ('f2666085-0e67-40a1-b274-edd0b4fbd541', '9ba84c1b-5448-471a-a1df-796b99af261d', 66, 'BOX', NULL, 10000, '63.01', '<p>Men Jacket</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10501.5, 10501.246, NULL);
INSERT INTO "origin"."si_order" VALUES ('954d5bcc-07ca-4cb4-a25a-a60d02a2c945', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 66, 'COLLIE', NULL, 5000, '31.654', '<p>Be careful, this is a luxury goods</p>', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5275.5, 5275.455, NULL);
INSERT INTO "origin"."si_order" VALUES ('5fce4c9d-e30d-4798-ae84-410a14de7d18', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 10, 'BOX', NULL, 1299, '10', '<p>Barang Pecah Belah Terbuat dari Kaca</p>', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1667, 1666.6, NULL);
INSERT INTO "origin"."si_order" VALUES ('ad5ce491-0bbd-467c-b3ec-5cb3dc56dc51', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 100, 'BOX', NULL, 1200, '51.2', '<p>Golf Shoes for men</p>', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8533, 8532.992, NULL);
INSERT INTO "origin"."si_order" VALUES ('bd362f3d-fe77-4af4-97e8-f5e7c278c3c6', 'b9e85498-a6ac-4624-af18-336d8e4141cb', 10, 'BOX', NULL, 1000, '10', '<p>Luxury Goods</p>', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1667, 1666.6, NULL);
INSERT INTO "origin"."si_order" VALUES ('bc30f141-4ef4-4c77-8d64-d5f67a1dbf5f', '8a0bb14d-acee-4250-b4ad-4940dc457f46', 142, 'PCS', NULL, 412, '15.876', '<p>CARTOON</p>', NULL, 'jakarta@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2646, 2645.894, NULL);
INSERT INTO "origin"."si_order" VALUES ('86a41b29-3a5f-4ebc-ba48-0d93abb3fe11', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', 80, 'BOX', NULL, 1200, '80', '<p>123123123</p>', NULL, 'jakarta@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13333, 13332.8, NULL);

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
-- Records of si_order_detail
-- ----------------------------
INSERT INTO "origin"."si_order_detail" VALUES ('f37ec510-fab5-4972-b247-37717594fbdc', '9ba84c1b-5448-471a-a1df-796b99af261d', 'ORDERAN FIKTIF', 'OKELAH', 'GASKEUN', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 3, '1207872999', NULL, NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('cb342015-6b3a-4b01-86f8-190138bc6b0e', '9ba84c1b-5448-471a-a1df-796b99af261d', 'ORDERAN FIKTIF', 'OKELAH', 'GASKEUN', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 3, '1207872999', NULL, NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('4e660e08-10d5-4182-ad67-053772a8aed8', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'BLACKWHITE', 'BLACKPEARL', 'BLACKPOOL', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '23423424', 'CON20240909', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('b63ea5b8-1059-4ae1-b459-620d5457d1d6', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'BOOMERANG', 'ABORIGIN', 'AUSTRALIA', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '12382763129', 'CON20240909', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('21c46b01-27bf-4308-8149-3ec7a74b34e6', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'MENDOAN', 'TAHU', 'TEMPE', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '2342424', 'CON20240910', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('7c251e93-af01-446c-889f-a58afc3259a2', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'ORDER BY UJANG', 'STYLE DADANG', 'ART BANDUNG', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '3458723495', 'CON20240910', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('cfb347e2-4c9f-45c2-8ec6-698aef1a1ee8', '9ba84c1b-5448-471a-a1df-796b99af261d', 'ORDERAN FIKTIF', 'STYLE', 'ART IS', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '2346239424', 'CON20240911', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('ab6fbea4-10b5-487b-ad97-834638f9ade4', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'ORDER BY JHONY', 'STYLE JHONY', 'ART FR JHONY', NULL, 'victor@pamcargo.com', NULL, 'china@pamcargo.com', 1, '202408240012', 'CON20240911', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('8ebb71b9-72d7-427d-af10-99a630460cf3', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'ORDERAN GA JELAS', 'STYLE 123', 'ARTQU', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, '24234234234', 'CONTROLSHIFTDEL', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('6ba3c30a-8619-48ba-8f35-5db438dc06c8', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'LACOSTEPO', 'PRAGUE', 'ST-PRG', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, '2342344444', 'BALIKMUL', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('17efb731-228c-40c5-b37d-43706c4b5b04', 'b9e85498-a6ac-4624-af18-336d8e4141cb', '123', '123', '1233', NULL, 'jakarta@pamcargo.com', NULL, 'jakarta@pamcargo.com', 1, '1231313', '41212', NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('9c693d87-f110-4161-ba33-cbb54b739f77', '8a0bb14d-acee-4250-b4ad-4940dc457f46', NULL, NULL, NULL, NULL, 'jakarta@pamcargo.com', NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO "origin"."si_order_detail" VALUES ('a6e0bd4e-f7ed-4d30-b338-7e5472c77d4b', 'edb80972-95ac-4005-95b7-1ed4ebbf6a75', '123', '123', '123', NULL, 'jakarta@pamcargo.com', NULL, NULL, 1, '12312', NULL, NULL, NULL);

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
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d845-785d-985c-1ea94d8fe591', '1dfc9387-daf8-42a4-9e83-5988441ab31a', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d856-7611-b6a3-d09996510e05', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d863-7e63-ae23-1b9aa34c6fbd', '472030ee-bd86-4d6c-bf2f-d6791f049340', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d86f-7488-9ea5-db76d13ca0b5', '55266cd6-7933-4fa5-9b5b-f04225430d24', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d87c-7a00-9cd3-7760f84ebee0', '9ba84c1b-5448-471a-a1df-796b99af261d', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');
INSERT INTO "origin"."si_sales_office" VALUES ('0191bc1e-d889-7c78-83a2-5544b83d5548', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 1, NULL, NULL, NULL, NULL, 'PAM GERMANY');

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
-- Records of si_sales_person
-- ----------------------------
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d849-73c5-b0bc-64804e230e43', '1dfc9387-daf8-42a4-9e83-5988441ab31a', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d858-7073-9878-99fd5801cd92', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d865-7b04-ac48-48bb43a574de', '472030ee-bd86-4d6c-bf2f-d6791f049340', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d872-73f8-9264-29f7fde78eb0', '55266cd6-7933-4fa5-9b5b-f04225430d24', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d87e-7b10-95a8-081c7c48d783', '9ba84c1b-5448-471a-a1df-796b99af261d', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');
INSERT INTO "origin"."si_sales_person" VALUES ('0191bc1e-d88c-7e0c-90b8-8c2b1a35418c', 'de50ad41-f048-40e5-9c27-42413c98e9a6', '328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 1, NULL, NULL, NULL, NULL, 'Aang Wiadi');

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
		


	SELECT CAST(MAX(RIGHT(TRIM(loading_plan_number),3)) AS INT4 ) INTO hasil from "origin".loading_plan where SPLIT_PART(loading_plan_number,'-', 6) = SPLIT_PART('LP','-', 6); 
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
