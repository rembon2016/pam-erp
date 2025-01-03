/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : finance

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 03/01/2025 09:42:37
*/


-- ----------------------------
-- Table structure for account_groups
-- ----------------------------
DROP TABLE IF EXISTS "finance"."account_groups";
CREATE TABLE "finance"."account_groups" (
  "id" uuid NOT NULL,
  "code" int2 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of account_groups
-- ----------------------------
INSERT INTO "finance"."account_groups" VALUES ('9dc04d59-e526-4eb3-a6dc-373a29d01a64', 1, 'ASSETS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."account_groups" VALUES ('9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', 2, 'LIABILITIES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."account_groups" VALUES ('9dc04d59-f176-4dd8-84ac-03b16fd1205a', 3, 'INCOME', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."account_groups" VALUES ('9dc04d59-f20d-4f67-908e-05a95b0fe609', 4, 'EXPENDITURE', '2024-12-18 03:29:30', '2024-12-18 03:29:30');

-- ----------------------------
-- Table structure for agent_contract
-- ----------------------------
DROP TABLE IF EXISTS "finance"."agent_contract";
CREATE TABLE "finance"."agent_contract" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "contract_no" varchar(255) COLLATE "pg_catalog"."default",
  "contract_date" varchar(255) COLLATE "pg_catalog"."default",
  "contract_start" date,
  "contract_end" date,
  "contract_file" varchar(255) COLLATE "pg_catalog"."default",
  "contract_description" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of agent_contract
-- ----------------------------
INSERT INTO "finance"."agent_contract" VALUES ('9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', 'CO 1.0', '2024-12-27 00:00:00', '2024-12-27', '2025-01-11', NULL, 'tes', '2024-12-27 02:05:47', '2024-12-27 03:09:29', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9dccdf92-263b-46a0-a7f4-707e2bd5ba84', '9dc26619-8753-49cb-ac0b-813cfc7aff51', 'CONTRACT NO', '2024-12-24 00:00:00', '2024-12-25', '2024-12-31', NULL, 'DESCRIPTION', '2024-12-24 09:28:17', '2024-12-27 03:29:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9dd2aa97-d50c-411d-bb59-06d0ca374c58', '9dc26619-c08c-4785-8e5e-f70568859a24', 'CO 2.0', '2024-12-27 00:00:00', '2024-12-31', '2025-01-11', NULL, 'tes', '2024-12-27 06:35:07', '2024-12-27 06:35:07', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dc2661c-65af-4b75-89cd-435f41533c42', 'CO 3.0', '2024-12-27 00:00:00', '2024-12-27', '2025-01-11', NULL, 'tes', '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9dd2ade2-c774-4f09-b1e4-7b06166703b0', '9dc2661a-1149-42a2-a547-a08c0cde7667', 'CO 4.0', '2024-12-27 00:00:00', '2024-12-27', '2025-01-11', NULL, 'tes', '2024-12-27 06:44:20', '2024-12-27 06:44:20', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9dded936-0ea3-4650-a5f9-73d1561d1965', '9dc4b134-dac8-499d-8acc-50bafd68e70d', 'CO 5.0', '2025-01-02 00:00:00', '2025-01-02', '2025-01-30', NULL, 'tes', '2025-01-02 07:55:24', '2025-01-02 07:55:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract" VALUES ('9ddeda4f-5e7c-45da-a590-1f0b72590ab0', '9dc26619-ba8b-4f0a-9600-82af8e83028c', 'CO 6.0', '2025-01-02 00:00:00', '2025-01-02', '2025-01-31', NULL, 'tes', '2025-01-02 07:58:29', '2025-01-02 07:58:29', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for agent_contract_charge
-- ----------------------------
DROP TABLE IF EXISTS "finance"."agent_contract_charge";
CREATE TABLE "finance"."agent_contract_charge" (
  "id" uuid NOT NULL,
  "agent_contract_service_id" uuid,
  "agent_contract_id" uuid,
  "charge_id" uuid,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "currency_id" uuid,
  "amount_per_unit" float8,
  "minimum_amount" float8,
  "por" varchar(255) COLLATE "pg_catalog"."default",
  "fdc" varchar(255) COLLATE "pg_catalog"."default",
  "pp_cc" varchar(255) COLLATE "pg_catalog"."default",
  "routed" varchar(255) COLLATE "pg_catalog"."default",
  "imco" varchar(255) COLLATE "pg_catalog"."default",
  "commodity" varchar(255) COLLATE "pg_catalog"."default",
  "crn" varchar(255) COLLATE "pg_catalog"."default",
  "loading_bay" varchar(255) COLLATE "pg_catalog"."default",
  "valid_from_date" date,
  "valid_to_date" date,
  "from_0_to_44" float8,
  "from_45_to_99" float8,
  "from_100_to_299" float8,
  "from_300_to_499" float8,
  "from_500" int4,
  "from_500_to_999" float8,
  "from_1000_to_infinity" float8,
  "twenty_feet" float8,
  "forty_feet" float8,
  "forty_five_feet" float8,
  "forty_five_feet_hc" float8,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "manual_input_routed" varchar(255) COLLATE "pg_catalog"."default",
  "via_port" varchar(255) COLLATE "pg_catalog"."default",
  "unit_id" int8,
  "twenty_feet_goh" float8,
  "forty_feet_goh" float8,
  "forty_feet_hc" float8,
  "forty_feet_hc_goh" float8,
  "forty_five_feet_goh" float8
)
;

-- ----------------------------
-- Records of agent_contract_charge
-- ----------------------------
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dccdf92-431d-4ccb-b875-7e880fa10c30', '9dccdf92-3562-424d-b78b-2d5b6f851b49', '9dccdf92-263b-46a0-a7f4-707e2bd5ba84', '9dc05a03-4b92-41f0-99e8-46f7441a573a', 'CUSTINP', '9dc46317-16e9-4e1b-b48c-facb13e65a93', 100, 100, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'COMMODITY', 'cost', 'KG', '2024-12-24', '2024-12-31', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2024-12-24 09:28:17', '2024-12-24 09:28:17', NULL, NULL, NULL, NULL, NULL, 'VIA PORT', 190, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dd24a45-a649-4ac7-9179-6feaf9e11b11', '9dd24a45-953a-4584-aa64-efa6d0349b3e', '9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dc059dd-95b8-4568-92aa-e1ad21e9d2b8', 'FEHAND', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 2, 2, NULL, NULL, NULL, 'DUBAI', 'SHIPMENT', 'other', 'cost', 'SHIPMENT', '2024-12-27', '2025-01-11', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2024-12-27 02:05:47', '2024-12-27 03:29:01', NULL, NULL, NULL, NULL, NULL, NULL, 189, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dd26809-1397-4ca5-9eca-0b0e8a83d862', '9dd24a45-953a-4584-aa64-efa6d0349b3e', '9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dc05a03-4b92-41f0-99e8-46f7441a573a', 'CUSTINP', '9dc05df3-722e-4981-adaf-985ea2bf0af8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'others', 'cost', NULL, '2024-12-27', '2025-01-11', 0, 0, 0, 0, NULL, 0, 0, 2, 2, 2, NULL, '2024-12-27 03:29:01', '2024-12-27 03:31:29', NULL, NULL, NULL, NULL, NULL, NULL, 190, 2, 2, 2, 2, 2);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dd2aa97-f554-4694-9378-069d6d6393ee', '9dd2aa97-e5cc-4e54-ae7b-1cf2c4c75cd2', '9dd2aa97-d50c-411d-bb59-06d0ca374c58', '9dc05a16-d81d-42bc-ac79-092280167706', 'EESUB', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 5, 5, NULL, NULL, 'SHIPMENT', 'DUBAI', 'SHIPMENT', NULL, 'cost', 'SHIPMENT', '2024-12-27', '2025-01-11', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2024-12-27 06:35:07', '2024-12-27 06:35:07', NULL, NULL, NULL, NULL, NULL, NULL, 189, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dd2ac2f-f38f-4099-8300-9c359613b407', '9dd2ac2f-e4a9-4a5d-9350-2d0723c50ecf', '9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dc059ee-04df-4777-9e7c-d47a69ebd6b7', 'BLOFEE', '9dc05df3-722e-4981-adaf-985ea2bf0af8', NULL, NULL, NULL, NULL, 'KG', 'DUBAI', 'KG', NULL, 'cost', 'KG', '2024-12-27', '2025-01-11', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL, NULL, NULL, 11, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dd2ade2-e96d-476c-9146-006f10c1dd40', '9dd2ade2-d812-47c5-aad3-0ae0df664b9d', '9dd2ade2-c774-4f09-b1e4-7b06166703b0', '9dc05a16-d81d-42bc-ac79-092280167706', 'EESUB', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 10, 10, NULL, NULL, 'SHIPMENT', 'DUBAI', 'SHIPMENT', NULL, 'cost', 'SHIPMENT', '2024-12-27', '2025-01-11', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2024-12-27 06:44:20', '2024-12-27 06:44:20', NULL, NULL, NULL, NULL, NULL, NULL, 189, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9dded936-2c03-4624-95a6-f6cb5ad25b55', '9dded936-1f55-4512-a632-ab2845529beb', '9dded936-0ea3-4650-a5f9-73d1561d1965', '9dd2c1c4-71b3-415c-97c5-f367661f31ed', 'FREIGHT CHARGE', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 4, 4, NULL, NULL, 'SHIPMENT', 'DUBAI', 'SHIPMENT', NULL, 'cost', 'SHIPMENT', '2025-01-02', '2025-01-31', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2025-01-02 07:55:25', '2025-01-02 07:55:25', NULL, NULL, NULL, NULL, NULL, NULL, 189, 0, 0, 0, 0, 0);
INSERT INTO "finance"."agent_contract_charge" VALUES ('9ddeda4f-7d5d-4616-a2e7-15d7adafc275', '9ddeda4f-6dbe-4d33-8f02-5aac16e44125', '9ddeda4f-5e7c-45da-a590-1f0b72590ab0', '9dc05a16-d81d-42bc-ac79-092280167706', 'EESUB', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'cost', NULL, '2025-01-02', '2025-01-31', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, '2025-01-02 07:58:29', '2025-01-02 07:58:29', NULL, NULL, NULL, NULL, NULL, NULL, 189, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for agent_contract_charge_detail
-- ----------------------------
DROP TABLE IF EXISTS "finance"."agent_contract_charge_detail";
CREATE TABLE "finance"."agent_contract_charge_detail" (
  "id" uuid NOT NULL,
  "agent_contract_id" uuid,
  "agent_contract_service_id" uuid,
  "agent_contract_charge_id" uuid,
  "from" varchar(255) COLLATE "pg_catalog"."default",
  "to" varchar(255) COLLATE "pg_catalog"."default",
  "value" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of agent_contract_charge_detail
-- ----------------------------
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dccdf92-50cd-499a-883a-ba23240f93e8', '9dccdf92-263b-46a0-a7f4-707e2bd5ba84', '9dccdf92-3562-424d-b78b-2d5b6f851b49', '9dccdf92-431d-4ccb-b875-7e880fa10c30', NULL, NULL, NULL, '2024-12-24 09:28:17', '2024-12-27 03:29:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd24a45-b648-45d8-ad30-389e009f87ab', '9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dd24a45-953a-4584-aa64-efa6d0349b3e', '9dd24a45-a649-4ac7-9179-6feaf9e11b11', NULL, NULL, NULL, '2024-12-27 02:05:47', '2024-12-27 03:31:29', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd26809-21c1-45bc-a6d9-3f1fc62dde39', '9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dd24a45-953a-4584-aa64-efa6d0349b3e', '9dd26809-1397-4ca5-9eca-0b0e8a83d862', NULL, NULL, NULL, '2024-12-27 03:29:01', '2024-12-27 03:31:29', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd2aa98-0447-42b2-9290-ec582be78564', '9dd2aa97-d50c-411d-bb59-06d0ca374c58', '9dd2aa97-e5cc-4e54-ae7b-1cf2c4c75cd2', '9dd2aa97-f554-4694-9378-069d6d6393ee', NULL, NULL, NULL, '2024-12-27 06:35:07', '2024-12-27 06:35:07', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd2ac30-027a-411d-8dcc-dad8fc059b48', '9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dd2ac2f-e4a9-4a5d-9350-2d0723c50ecf', '9dd2ac2f-f38f-4099-8300-9c359613b407', '0', '1000', '3', '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd2ac30-09a9-40ca-818f-29337edcf650', '9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dd2ac2f-e4a9-4a5d-9350-2d0723c50ecf', '9dd2ac2f-f38f-4099-8300-9c359613b407', '1001', '2000', '4', '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd2ac30-10a2-4ade-bdb3-99c6ee87c27e', '9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dd2ac2f-e4a9-4a5d-9350-2d0723c50ecf', '9dd2ac2f-f38f-4099-8300-9c359613b407', '2000', '999999999', '5', '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dd2ade2-f9ab-4122-bef1-9e14a9f0e61f', '9dd2ade2-c774-4f09-b1e4-7b06166703b0', '9dd2ade2-d812-47c5-aad3-0ae0df664b9d', '9dd2ade2-e96d-476c-9146-006f10c1dd40', NULL, NULL, NULL, '2024-12-27 06:44:20', '2024-12-27 06:44:20', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9dded936-38dc-436d-a033-4bee278bc306', '9dded936-0ea3-4650-a5f9-73d1561d1965', '9dded936-1f55-4512-a632-ab2845529beb', '9dded936-2c03-4624-95a6-f6cb5ad25b55', NULL, NULL, NULL, '2025-01-02 07:55:25', '2025-01-02 07:55:25', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_charge_detail" VALUES ('9ddeda4f-8c37-4fad-a222-291cac0ab568', '9ddeda4f-5e7c-45da-a590-1f0b72590ab0', '9ddeda4f-6dbe-4d33-8f02-5aac16e44125', '9ddeda4f-7d5d-4616-a2e7-15d7adafc275', NULL, NULL, NULL, '2025-01-02 07:58:29', '2025-01-02 07:58:29', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for agent_contract_service
-- ----------------------------
DROP TABLE IF EXISTS "finance"."agent_contract_service";
CREATE TABLE "finance"."agent_contract_service" (
  "id" uuid NOT NULL,
  "agent_contract_id" uuid,
  "service_type_id" uuid,
  "port" int4,
  "por_country_id" int4,
  "por_port_id" uuid,
  "fdc_country_id" int4,
  "fdc_port_id" uuid,
  "tos" varchar(255) COLLATE "pg_catalog"."default",
  "tos_name" varchar(255) COLLATE "pg_catalog"."default",
  "transit_via" varchar(255) COLLATE "pg_catalog"."default",
  "carrier_id" uuid,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default",
  "party" varchar(255) COLLATE "pg_catalog"."default",
  "notes" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "manual_input_transit" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of agent_contract_service
-- ----------------------------
INSERT INTO "finance"."agent_contract_service" VALUES ('9dccdf92-3562-424d-b78b-2d5b6f851b49', '9dccdf92-263b-46a0-a7f4-707e2bd5ba84', '9dc0623d-b079-4cdc-b540-dafe711a683e', NULL, 1, '46eba779-ab9f-4fcb-9ab4-e0fa5f579fc1', 2, '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', 'TOS', 'TOS NAME', 'SEATTLE', '616a0aa9-5776-405f-bebb-c6a2a8a9d5b1', 'CNN Indonesia', 'PARTY', 'SERVICE NOTES', '2024-12-24 09:28:17', '2024-12-24 09:28:17', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9dd24a45-953a-4584-aa64-efa6d0349b3e', '9dd24a45-7c9a-4e14-8179-eb6ff59feac1', '9dc06255-1f05-41bf-ac8d-dea3fce325ca', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', 229, 'b384b57a-142f-4b64-8c83-3e5b0601cd3c', NULL, NULL, 'DUBAI', NULL, NULL, NULL, NULL, '2024-12-27 02:05:47', '2024-12-27 03:07:10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9dd2aa97-e5cc-4e54-ae7b-1cf2c4c75cd2', '9dd2aa97-d50c-411d-bb59-06d0ca374c58', '9dc06255-1f05-41bf-ac8d-dea3fce325ca', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', 229, 'b384b57a-142f-4b64-8c83-3e5b0601cd3c', NULL, NULL, 'DUBAI', NULL, NULL, NULL, NULL, '2024-12-27 06:35:07', '2024-12-27 06:35:07', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9dd2ac2f-e4a9-4a5d-9350-2d0723c50ecf', '9dd2ac2f-d60d-4698-92f2-220b64e3b876', '9dc0623d-b079-4cdc-b540-dafe711a683e', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', 229, 'b384b57a-142f-4b64-8c83-3e5b0601cd3c', NULL, NULL, 'DUBAI', 'b7bd1e94-ca3e-405e-b01c-49e0ec922fb5', 'EMIRATES', NULL, NULL, '2024-12-27 06:39:35', '2024-12-27 06:39:35', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9dd2ade2-d812-47c5-aad3-0ae0df664b9d', '9dd2ade2-c774-4f09-b1e4-7b06166703b0', '9dc061e7-2ac1-4117-967c-7d4bd892a0dd', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', 229, 'b384b57a-142f-4b64-8c83-3e5b0601cd3c', NULL, NULL, 'DUBAI', NULL, NULL, NULL, NULL, '2024-12-27 06:44:20', '2024-12-27 06:44:20', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9dded936-1f55-4512-a632-ab2845529beb', '9dded936-0ea3-4650-a5f9-73d1561d1965', '9dc06255-1f05-41bf-ac8d-dea3fce325ca', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 07:55:25', '2025-01-02 07:55:25', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "finance"."agent_contract_service" VALUES ('9ddeda4f-6dbe-4d33-8f02-5aac16e44125', '9ddeda4f-5e7c-45da-a590-1f0b72590ab0', '9dc06255-1f05-41bf-ac8d-dea3fce325ca', NULL, 98, 'db703fdb-19b6-4f72-8aa7-177b8da49e56', NULL, NULL, NULL, NULL, 'DUBAI', NULL, NULL, NULL, NULL, '2025-01-02 07:58:29', '2025-01-02 07:58:29', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bank_information
-- ----------------------------
DROP TABLE IF EXISTS "finance"."bank_information";
CREATE TABLE "finance"."bank_information" (
  "id" uuid NOT NULL,
  "customer_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "customer_type" varchar(255) COLLATE "pg_catalog"."default",
  "bank_account_number" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "bank_account_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "bank_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "bank_branch" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person_name" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person_number" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of bank_information
-- ----------------------------

-- ----------------------------
-- Table structure for charges
-- ----------------------------
DROP TABLE IF EXISTS "finance"."charges";
CREATE TABLE "finance"."charges" (
  "id" uuid NOT NULL,
  "charge_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "transport_type" varchar(255) COLLATE "pg_catalog"."default",
  "unit_id" int8,
  "revenue_id" uuid,
  "cost_id" uuid,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "is_agreed_rate" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of charges
-- ----------------------------
INSERT INTO "finance"."charges" VALUES ('9dc059dd-95b8-4568-92aa-e1ad21e9d2b8', 'FE', 'FEHAND', 'tes', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-18 04:04:29', '2024-12-18 04:04:29', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dc05a03-4b92-41f0-99e8-46f7441a573a', 'CUSTINP', 'CUSTINP', 'tes', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-18 04:04:54', '2024-12-18 04:04:54', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dc05a16-d81d-42bc-ac79-092280167706', 'EESUB', 'EESUB', 'tes', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-18 04:05:07', '2024-12-18 04:05:07', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dc059ee-04df-4777-9e7c-d47a69ebd6b7', 'BLOFEE', 'BLOFEE', 'Test', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-18 04:04:40', '2024-12-20 07:55:05', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dc4b2ac-5cbf-482e-8062-096d1ba55a05', 'fee', 'corefee', 'Test', 190, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-20 07:56:07', '2024-12-20 07:56:07', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dd2c238-bda8-456b-ad74-9dfc8aaeb1e8', 'FTS', 'FREIGHT TAX SURCHARGE', 'SEA AIR', 189, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-27 07:41:11', '2024-12-27 07:41:11', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dd2c2e3-c7da-46ae-a16a-967852fd0bd3', 'TRANSPORT', ',TRANSPORTATION CHARGES', 'SEA AIR', 189, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-27 07:43:04', '2024-12-27 07:43:04', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dd2c30b-6964-4802-a2a5-e4eccf2a5810', 'COO', 'CERTIFICATE OF ORIGIN CHARGES', 'SEA AIR', 189, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-27 07:43:29', '2024-12-27 07:43:29', NULL, NULL, NULL, NULL, 'f');
INSERT INTO "finance"."charges" VALUES ('9dd2c1c4-71b3-415c-97c5-f367661f31ed', 'FRT', 'FREIGHT CHARGE', 'SEA', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-27 07:39:55', '2024-12-30 06:38:18', NULL, NULL, NULL, NULL, 't');
INSERT INTO "finance"."charges" VALUES ('9dd2c205-a4be-4bf3-98f9-705f8f3e8243', 'FSR', 'FUEL SURCHARGE', 'SEA AIR', 11, '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '2024-12-27 07:40:38', '2024-12-30 06:38:28', NULL, NULL, NULL, NULL, 't');

-- ----------------------------
-- Table structure for chart_of_accounts
-- ----------------------------
DROP TABLE IF EXISTS "finance"."chart_of_accounts";
CREATE TABLE "finance"."chart_of_accounts" (
  "id" uuid NOT NULL,
  "account_group_id" uuid NOT NULL,
  "sub_account_group_id" uuid NOT NULL,
  "account_number" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "account_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "subledger_code" varchar(255) COLLATE "pg_catalog"."default",
  "subledger_name" varchar(255) COLLATE "pg_catalog"."default",
  "is_cashflow" bool NOT NULL DEFAULT false,
  "account_position" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'debit'::character varying,
  "cashflow_type" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of chart_of_accounts
-- ----------------------------
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dc059c5-c6b8-422b-b3f1-9e6ed3197887', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f544-45a6-a29e-c6c22bbc4961', '1101000000', 'Tes', '11', 'tes', 'f', 'debit', NULL, '2024-12-18 04:04:14', '2024-12-18 04:04:14');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7547-8ebc-45d4-9f1c-18acdf3a36d3', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101160001', 'MITSUBISHI CANTER - T-20190', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:31:05', '2024-12-24 04:31:05');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7593-ffaf-4ca4-a0b6-527f67e0edfe', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101160002', 'TOYOTA HILUX - BB-39789', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:31:55', '2024-12-24 04:31:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc764c-3d70-4cd1-8316-46299075efd2', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610001', 'COMPUTERS', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:33:55', '2024-12-24 04:33:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7677-4b8e-4c7c-ba63-79d5ff63ed92', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610002', 'FURNITURE   FIXTURES', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:34:24', '2024-12-24 04:34:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc76e9-2e34-4f25-8a4f-516bf9581129', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610003', 'OFFICE EQUIPMENT', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:35:38', '2024-12-24 04:35:38');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc770d-4d39-4a52-ac05-cf412e94ae2a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610004', 'VEHICLE - CAR - R - 22865', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:36:02', '2024-12-24 04:36:02');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc773d-edd2-4b3d-9ea9-f5a76ec194c1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610005', 'PHOTO COPIER', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:36:34', '2024-12-24 04:36:34');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7761-3b80-498c-b3da-77aa5374ffbe', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610006', 'CAR - NISSAN ALTIMA - R - 22865', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:36:57', '2024-12-24 04:36:57');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7a18-b09a-4237-a4a6-1a48bb7a593a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610007', 'ENFIELD - 55286', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:44:33', '2024-12-24 04:44:33');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7a3a-537a-46b5-8550-a36304ec8574', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610008', 'PAM NEW OFFICE - AL FATTAN - FURNITURE   FIXTURES', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:44:55', '2024-12-24 04:44:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7a61-206d-458a-9906-8251481fc5f4', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610009', 'PAM NEW OFFICE - AL FATTAN - COMPUTERS', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:45:20', '2024-12-24 04:45:20');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7a7f-cf52-4eb5-9a5a-f75bb51221dd', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '1101610010', 'SOFTWARE - PDS', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:45:40', '2024-12-24 04:45:40');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7ae1-1a3f-461c-a4c1-e36c24c96606', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f9e6-4faf-b1f1-179d96ac1421', '1105010001', 'PAM HONG KONG OFFICE', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:46:44', '2024-12-24 04:46:44');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7b0d-df18-43e8-ac4d-7561d80fb059', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-f9e6-4faf-b1f1-179d96ac1421', '1105010002', 'PAM HONG KONG BANK ACCOUNT', NULL, NULL, 't', 'debit', 'investing', '2024-12-24 04:47:13', '2024-12-24 04:47:13');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca5da-286b-49ec-bfd0-72f715c71c62', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'TRIBURG FREIGHT SERVICES LLC', 'C001867', NULL, 't', 'debit', 'operating', '2024-12-24 06:46:54', '2024-12-24 06:46:54');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7d8e-13d9-4ca3-97dd-6aa40376abf7', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'FAST LOGISTICS CARGO FZCO', 'C002769', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 04:54:13', '2024-12-24 04:56:15');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7e14-04c1-4518-b287-166cd6b6d726', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MR. CARSTEN SEITZBERG', 'C002773', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 04:55:41', '2024-12-24 04:56:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7eb7-4a49-42d7-86c9-36bbe141f0c0', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SMARTPLUS CARGO', NULL, 'C002798', 't', 'debit', 'operating', '2024-12-24 04:57:28', '2024-12-24 04:57:28');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcc7f87-f9a8-4b1d-9fb4-ec9faf086a78', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DUBAI CABLE CO ( PVT ) LTD', 'C002805', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 04:59:45', '2024-12-24 04:59:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca100-11ae-46e3-8cca-9ace006a1d84', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MAYFAIR WRAPPING TECHNICAL SERVICES LLC', 'C002404', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:33:20', '2024-12-24 06:33:20');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca15b-2b84-47a1-b9d1-6cd62e3e57a9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'OCEAN NETWORK EXPRESS PTD LTD (ONE)', 'C000885', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:34:19', '2024-12-24 06:34:19');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca19e-e59d-4bec-920f-83dc348b2b11', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'TIC SOUND EXPERIENCE RADIO TV STATIONS CINEMA AND THEATRE EQUIPMENT TRADING LLC', 'C002489', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:35:04', '2024-12-24 06:35:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca1e2-bdfa-41b1-83f3-8699f6255a2c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SUN AND SANDS SPORTS (LLC)', 'C000235', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:35:48', '2024-12-24 06:35:48');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca21b-684c-4802-86ef-21eded8ac208', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'VIBEX INTERNATIONAL CARGO LLC', 'C000883', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:36:25', '2024-12-24 06:36:25');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca264-b00a-4d8c-b828-7bf37f3f0f85', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL FADHA BICYCLES', 'C002089', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:37:13', '2024-12-24 06:37:13');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca298-cf42-4fe7-b354-3a41cd91cc70', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL AAFIA GENERAL TRADING FZE', 'C002107', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:37:48', '2024-12-24 06:37:48');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca2bf-3f48-42bc-aace-e7f4ffd90708', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'HELLMANN WORLDWIDE LOGISTICS LLC', 'C002112', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:38:13', '2024-12-24 06:38:13');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca30f-15bc-4cae-bd1b-6d08508587e8', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PROPACK GLOBAL F.Z.E', 'C002109', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:39:05', '2024-12-24 06:39:05');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca35a-05a7-443d-8b74-52754209aa40', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'NATIONAL PAINTS FACTORIES CO LTD', 'C001355', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:39:54', '2024-12-24 06:39:54');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca386-750d-48ef-894c-72d832853dd1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'C EAU LLC', 'C001381', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:40:23', '2024-12-24 06:40:23');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca3b4-8952-4c33-b0ad-0632b2cb2bdc', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'TAJUDEEN READYMADE GARMENT TRADING', 'C002717', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:40:54', '2024-12-24 06:40:54');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca41e-c4ed-4a66-b6e1-a2013aeb893d', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'Q2 INTERNATIONAL GENERAL TRADING LLC', 'C002853', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:42:03', '2024-12-24 06:42:03');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca43c-e475-405e-9080-18c4373e7e3c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DARK BLUE SHIPPING LLC BRANCH', 'C002882', NULL, 't', 'debit', 'operating', '2024-12-24 06:42:23', '2024-12-24 06:42:23');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca463-2f9e-4d21-aacd-66dd0f7dc7b0', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'P N I LOGISTICS LLC', 'C000304', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:42:48', '2024-12-24 06:42:48');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca4b4-3f87-4236-9bcf-fcc0f95e61d9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SPRAYING SYSTEMS MIDDLE EAST FZE', 'C000948', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:43:41', '2024-12-24 06:43:41');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca4d7-b88f-443e-9ee4-46b97356d74b', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PETRO ENGINEERING POWER SERVICES LLC', 'C000961', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:44:04', '2024-12-24 06:44:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca507-0265-4792-a6c7-b6d31bfae0ca', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'FIRST PRIORITY CARGO LLC', 'C000992', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:44:35', '2024-12-24 06:44:35');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca528-ea4e-4e9f-bddb-7ef4865b6036', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'CHAPMAN VENTILATION LIMITED', 'C000143', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:44:58', '2024-12-24 06:44:58');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca55c-cec4-42a6-a5ed-e7b3c095e161', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ARTISTA BUILDING MATERIALS TRADING LLC', 'C001625', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:45:32', '2024-12-24 06:45:32');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca588-e0da-4124-a613-7c073334f40c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SPEED WAY AUTO SPARE PARTS TRADING LLC', 'C001628', NULL, 't', 'debit', 'operating', '2024-12-24 06:46:01', '2024-12-24 06:46:01');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca5ad-202a-4f96-8727-637e2ac17c69', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DATEX ENERGY FZC', 'C001863', 'DEBTORS LOCAL', 't', 'debit', 'operating', '2024-12-24 06:46:24', '2024-12-24 06:46:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca62e-5392-4d9e-9cd3-a48f8166fa0f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'EV CARGO', 'C002759', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:47:49', '2024-12-24 06:47:49');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca654-5b83-4f01-8ca3-0eec2cd0e29c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'CLEARSHIP FORWARDERS PVT LTD - DELHI', 'C002801', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:48:14', '2024-12-24 06:48:14');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca679-eb9a-497f-b6e1-5d43f5d37a46', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'ELECTRICAL AND GENERAL APPLIANCES LTD', 'C000888', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:48:38', '2024-12-24 06:48:38');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca6ac-4e26-41d2-bcdf-e7a41efbff5f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'XLLOG GMBH C/O FERD HAUBER GMBH', 'C001574', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:49:11', '2024-12-24 06:49:11');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca6ce-5a5b-4b6a-ab1f-b9353a4a070b', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'XLLOG GMBH C/O GLIDE', 'C002348', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:49:34', '2024-12-24 06:49:34');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca6f6-23d4-4b21-b0a7-6f01e557a0c1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050005', 'XLLOG C/O LEINEWEBER GMBH AND CO.KG', 'C002492', 'DEBTORS OVERSEAS', 't', 'debit', 'operating', '2024-12-24 06:50:00', '2024-12-24 06:50:00');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca754-1349-4425-a775-e1bf21fb4185', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050025', 'ECU LINE MIDDLE EAST L.L.C', 'C000004', 'DEBTORS AGENTS', 't', 'debit', 'operating', '2024-12-24 06:51:01', '2024-12-24 06:51:01');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca77f-cd29-410e-9671-2d9f886844a6', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050025', 'THOMAS VARGHESE', '3180001', 'DEBTORS AGENTS', 't', 'debit', 'operating', '2024-12-24 06:51:30', '2024-12-24 06:51:30');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca7a1-a386-49ea-9586-6220b9c2c381', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050025', 'PAM CARGO INTERNATIONAL CO.LTD', 'OP90001', 'DEBTORS AGENTS', 't', 'debit', 'operating', '2024-12-24 06:51:52', '2024-12-24 06:51:52');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dcca83a-9d94-4155-ae17-ac0e86880408', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110100005', 'PETTY CASH', 'S000006', 'PETTY CASH ACCOUNT', 'f', 'debit', NULL, '2024-12-24 06:53:33', '2024-12-24 06:53:33');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dccaa5b-d5ea-4551-8798-3a2205e10e78', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '9dc04d59-ffe9-4477-8b39-41c14e7f2b71', '1201020001', 'PAM CAPITAL', NULL, NULL, 't', 'credit', 'financing', '2024-12-24 06:59:30', '2024-12-24 06:59:30');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dccab22-305d-495c-989d-d91e33e4273f', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '9dc04d5a-00f7-4408-bf88-fee9afa46ce9', '1205010001', 'ENBD - MITSUBISHI CANTER - T-20190', NULL, NULL, 't', 'credit', 'financing', '2024-12-24 07:01:40', '2024-12-24 07:01:40');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dccab4e-a440-4322-abf9-08172609a504', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '9dc04d5a-00f7-4408-bf88-fee9afa46ce9', '1205010002', 'ENBD - TOYOTA HILUX - BB 39789', NULL, NULL, 't', 'credit', 'financing', '2024-12-24 07:02:09', '2024-12-24 07:02:09');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dccabd9-ee0f-473a-b2e6-69dd5108b5ac', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '9dc04d5a-00f7-4408-bf88-fee9afa46ce9', '1205050001', 'SHARE HOLDER LOAN', NULL, NULL, 't', 'credit', 'financing', '2024-12-24 07:03:40', '2024-12-24 07:03:40');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda74dd-d09b-4fb8-b2c5-122a94f6aaca', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ATS TRADING FZCO', 'C002480', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:31:31', '2024-12-31 03:31:31');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7791-272a-4dd5-9fee-b833f413e08e', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'HIGH FLYER MARKETING MANAGEMENT L.L.C', 'C000126', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:39:04', '2024-12-31 03:39:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7823-c6f3-45c1-a607-f871acc554ab', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL REYAMI TECHNOLOGIES LLC', 'C000129', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:40:40', '2024-12-31 03:40:40');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7931-b7a2-46a0-9ba6-b20b6c1e7271', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GREEN COAST NURSERIES', 'C000144', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:43:37', '2024-12-31 03:43:37');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda79af-e05b-4e20-b6f1-21da39435bf7', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'FREIGHT SHIPPING (LLC)', 'C000221', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:45:00', '2024-12-31 03:45:00');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7a29-6b81-4b29-befd-3124b7759a3b', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DCFC LOGISTICS DISTRIBUTION LLC', 'C00022', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:46:19', '2024-12-31 03:46:19');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7ac9-5400-4920-8339-f4a6b8a4d3fb', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GRACEVALVE REFRIGERATION TRADING FZE', 'C000311', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:48:04', '2024-12-31 03:48:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7b96-88f7-4b8e-a495-2b2223f60c28', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'CORYS PIPING SYSTEM LLC DUBAI', 'C002962', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:50:18', '2024-12-31 03:50:18');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7c70-6366-4571-9448-7b7c128c236a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'KRATOS GLASS LLC', 'C002957', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:52:41', '2024-12-31 03:52:41');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7d3d-250c-4ed5-b7b5-a171942a9a27', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WGS MIDDLE EAST FZ LLC', 'C002960', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:54:55', '2024-12-31 03:54:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7db4-6efa-4bc4-b25f-689cfb343dd6', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SAUD JAMAL HUSSIAN ALSHAALI', 'C002987', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:56:14', '2024-12-31 03:56:14');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dda7e2e-89fb-4780-a01d-cbfbf2a7d666', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AVISH AQUATECH TRADDING LLC', 'C003010', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 03:57:34', '2024-12-31 03:57:34');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddecf68-2abd-4c4c-b39e-e7f40e28899a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'IGNITE TECHNOLOGY LLC', 'C003010', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:28:00', '2025-01-02 07:28:00');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded075-5475-489a-8b62-f961e6035c48', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WINNER SPORTS LLC', 'C000609', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:30:56', '2025-01-02 07:30:56');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded14a-c9b8-4fc0-b8d0-e4708ff91213', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SCOTT BADER MIDDLE EAST', 'C003017', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:33:16', '2025-01-02 07:33:16');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded1cd-3d53-4123-81c8-29f15af4d2e1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WE SHAPE KITCHENS CATERING EQUIPMENT TRADING L.L.C', 'C003004', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:34:41', '2025-01-02 07:34:41');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded232-9c96-4a89-8292-935516596cfe', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'JLS YACHTS LLC', 'C003040', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:35:48', '2025-01-02 07:35:48');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded2a6-f299-4100-8fff-278efcb6b640', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WORK POINT GENERAL TRADING LLC', 'C003012', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:37:04', '2025-01-02 07:37:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded2f7-cb29-4ce0-93a8-ccec0758a2cb', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'JAYCEE BRAND LLC', 'C003051', NULL, 't', 'debit', 'operating', '2025-01-02 07:37:57', '2025-01-02 07:37:57');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded35e-f68e-43dc-8aef-858236496cd6', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'THOMAS GEN. TR. LLC', 'C000438', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:39:05', '2025-01-02 07:39:05');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded3ba-dbd7-4f84-ad35-9072cc3c6b0f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ALJOUD LOOTAH DESING', 'C000176', NULL, 't', 'debit', 'operating', '2025-01-02 07:40:05', '2025-01-02 07:40:05');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded411-c207-4053-bc57-80eee841ddfa', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'RIGHT DIRECTION SHIPPING LLC', 'C000400', NULL, 't', 'debit', 'operating', '2025-01-02 07:41:02', '2025-01-02 07:41:02');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded44e-a395-4a15-9952-0605e865b5e0', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'CASH DEBTORS', 'C000405', NULL, 't', 'debit', 'operating', '2025-01-02 07:41:42', '2025-01-02 07:41:42');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded4ab-47fb-4e43-b5c1-53fdeec0d685', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'T AND M TRADING FZCO', 'C001895', NULL, 't', 'debit', 'operating', '2025-01-02 07:42:42', '2025-01-02 07:42:42');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded50b-2087-455a-a8c0-3e3f6d37ae36', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MANSOOR CONCRETE BLOK INDUSTRY LLC', 'C001638', NULL, 't', 'debit', 'operating', '2025-01-02 07:43:45', '2025-01-02 07:43:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded566-4d35-4566-bfc2-5656989bd6b1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL MAJDAL GENERAL TRADING LLC', 'C001910', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:44:45', '2025-01-02 07:44:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded607-8f06-46f1-8411-ce75e5b423ab', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'BMW MIDDLE EAST RETAIL COMPETENCY CENTRE DWC LLC', 'C001642', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:46:31', '2025-01-02 07:46:31');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded6d0-eff4-4d22-9b0f-a46d43f88936', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL QALMOON GARDENS DESI EST', 'C001900', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:48:43', '2025-01-02 07:48:43');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded7b1-1a89-44c8-8ead-d6c030008d16', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'EMEX DWC LLC', 'C001558', NULL, 't', 'debit', 'operating', '2025-01-02 07:51:10', '2025-01-02 07:51:10');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded814-77ae-46cf-aa07-9b1c83092064', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'KIRBY BUILDING SYSTEMS UAE LLC', 'C001931', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 07:52:15', '2025-01-02 07:52:15');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded859-9549-4c38-8efd-aae228fb9e6f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SCHENKER LLC', 'C001927', NULL, 't', 'debit', 'operating', '2025-01-02 07:53:00', '2025-01-02 07:53:00');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded8b5-da7d-48fd-9e6d-f9dae0e5789f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'RIO INTERNATIONAL LLC', 'C001941', NULL, 't', 'debit', 'operating', '2025-01-02 07:54:00', '2025-01-02 07:54:00');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9dded911-9fab-4ee1-8459-b057ae05080c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'UNIPEX DAIRY PRODUCT CO LTD', 'C000855', NULL, 't', 'debit', 'operating', '2025-01-02 07:55:01', '2025-01-02 07:55:01');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddabd94-ec18-4035-b059-31260661b3f5', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AREEN MIDDLE EAST (LLC)', 'C000062', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2024-12-31 06:54:50', '2025-01-02 07:56:26');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeedd5-4be8-4728-ab62-22bd895c784b', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'THOMAS VARGHESE', '3180001', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 08:53:04', '2025-01-02 08:53:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeee75-0628-4535-84ce-3ff3557aafd9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'THOMAS VARGHESE', 'C000082', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 08:54:49', '2025-01-02 08:54:49');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeeeca-a87c-4d59-a594-9b8d4dac67f0', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', '3S LIGHTING SOLUTIONS LLC', 'C003126', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 08:55:45', '2025-01-02 08:55:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeef1a-2706-403e-9376-871e2a7e8e96', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PARAMED INTERNATIONAL FZE', 'C003166', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 08:56:37', '2025-01-02 08:56:37');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeefdf-46b0-4d2d-a2b6-1d276b3fc0d9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GEO ELECTRICAL CONTRACTING TRADING CO LLC', 'C003234', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 08:58:46', '2025-01-02 08:58:46');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef03b-9ed9-4e7e-99a9-5dc6d7962624', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MAX LINE LLC', 'C003034', NULL, 't', 'debit', 'operating', '2025-01-02 08:59:47', '2025-01-02 08:59:47');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef0b3-6d30-40f6-91bf-bf46cb860f6c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WELLNESS FIRST MIDDLE EAST SPORT EQUIPMENT TRADING LLC', 'C003335', NULL, 't', 'debit', 'operating', '2025-01-02 09:01:05', '2025-01-02 09:01:05');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef116-bc95-4056-a302-e13a58c9ba24', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'TECHNOPRO MIDDLE EAST FZCO', 'C003336', NULL, 't', 'debit', 'operating', '2025-01-02 09:02:10', '2025-01-02 09:02:10');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef164-566c-4aa6-b295-af509981f4e4', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL RAED PIONEERS', 'C001191', NULL, 't', 'debit', 'operating', '2025-01-02 09:03:01', '2025-01-02 09:03:01');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef1c3-0ca0-46e3-9f5e-502cfac76477', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'OCEAN WORLD LINES INTERNATIONAL LLC', 'C000581', NULL, 't', 'debit', 'operating', '2025-01-02 09:04:03', '2025-01-02 09:04:03');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef236-5517-4187-9687-705cd138258a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'EASYGO GENERAL TRADING L.L.C', 'C001234', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:05:19', '2025-01-02 09:05:19');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef30c-85d8-42e2-91ff-36b319f5a6f2', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'HAWKLINE INTERNATIONAL FZE', 'C001238', NULL, 't', 'debit', 'operating', '2025-01-02 09:07:39', '2025-01-02 09:07:39');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef3b9-9cf9-489f-a4ec-728020f54d7a', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'VICTOR SYSTEM LLC', 'C001275', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:09:33', '2025-01-02 09:09:33');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef436-a20d-4559-93aa-c6188b7788f6', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'QASR AL NASHMI SPORT EQUIPMENT TRADING L.L.C', 'C001293', NULL, 't', 'debit', 'operating', '2025-01-02 09:10:55', '2025-01-02 09:10:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef4e7-dddc-40ac-ac44-95990c41cb38', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'RITU KUMAR FASHION LLC', 'C001242', NULL, 't', 'debit', 'operating', '2025-01-02 09:12:51', '2025-01-02 09:12:51');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef562-5f7e-4bc7-ba78-be5230b30307', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'KHALED OMAR FOAD ANABTAWI', 'C001308', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:14:11', '2025-01-02 09:14:11');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef5d2-467b-423c-b512-d11837769fd3', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MADOS MIDDLE EAST GENERAL TRADING L.L.C', 'C001036', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:15:24', '2025-01-02 09:15:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef62d-b7a5-4f0e-b2ec-1f3d81382613', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'UNITED HEALTHCARE LLC', 'C001083', NULL, 't', 'debit', 'operating', '2025-01-02 09:16:24', '2025-01-02 09:16:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef6c5-3b4f-45a2-ae1e-72564d7ba809', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DREAMWAY FREIGHT CARRIERS LLC', 'C000287', NULL, 't', 'debit', 'operating', '2025-01-02 09:18:04', '2025-01-02 09:18:04');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef719-249c-4869-91fd-865716b5b28d', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'IL BORRO TUSCAN BISTRO', 'C000872', NULL, 't', 'debit', 'operating', '2025-01-02 09:18:59', '2025-01-02 09:18:59');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef786-1b0e-44e6-953b-7cc5d76a0d60', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SOLUTIONS FZC', 'C000969', NULL, 't', 'debit', 'operating', '2025-01-02 09:20:10', '2025-01-02 09:20:10');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0694-5e97-4f7e-9172-244c6a1c8ada', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'BMORE DISTRIBUTORS DMCC', 'C000184', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:02:16', '2025-01-02 10:02:16');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef932-b283-47d3-8ac6-36448a859392', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL SHIBA GENERAL TRADING', 'C002147', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:24:51', '2025-01-02 09:25:59');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddef9f0-8286-45da-9dea-17a991480fcb', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'APPLE SHIPPNG LLC', 'C001961', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:26:55', '2025-01-02 09:26:55');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefa77-7bc4-42af-85c1-a875e7495868', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PRECISION METAL INDUSTRIES FZC', 'C002155', NULL, 't', 'debit', 'operating', '2025-01-02 09:28:24', '2025-01-02 09:28:24');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefb92-3934-49a7-b18a-de3dcb3ea8d2', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'DMC GLOBAL LOGISTIC LLC', 'C002162', NULL, 't', 'debit', 'operating', '2025-01-02 09:31:29', '2025-01-02 09:31:29');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefbe3-d8e9-4681-b8a8-b9303afa1823', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'FARNEK SERVICE LLC', 'C002169', NULL, 't', 'debit', 'operating', '2025-01-02 09:32:23', '2025-01-02 09:32:23');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefc34-47fc-4fb6-9adf-76a3b6b09bcd', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PLATINUM VISION LLC', 'C002184', NULL, 't', 'debit', 'operating', '2025-01-02 09:33:15', '2025-01-02 09:33:15');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefc8e-f50a-4b8b-9b38-e49ef62e7762', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ART STONE INTERNATIONAL GENERAL TRADING LLC', 'C002196', NULL, 't', 'debit', 'operating', '2025-01-02 09:34:15', '2025-01-02 09:34:15');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefcde-8498-4d3d-a705-e5ddfdefc719', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ROIC GENERAL TRADING LLC', 'C002198', NULL, 't', 'debit', 'operating', '2025-01-02 09:35:07', '2025-01-02 09:35:07');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefd49-4c68-495c-95e6-18727afe846f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'CROSS POINT MIDDLE EAST TECHNOLOGIES LLC', 'C002839', NULL, 't', 'debit', 'operating', '2025-01-02 09:36:17', '2025-01-02 09:36:17');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddefed4-12b7-4e62-99cb-f3585b7ab42f', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'UNDER THE SKIN TRADING LLC', 'C002851', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:40:36', '2025-01-02 09:40:36');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeff41-9165-4ad4-9b41-485a4ff512e1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SAS EXPRESS BUILDING MATERIALS TRADING LLC', 'C003164', NULL, 't', 'debit', 'operating', '2025-01-02 09:41:47', '2025-01-02 09:41:47');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddeffce-a0f5-4c5f-b134-d2d238f56dd9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'XENIA HOSPITALITY FACILITIES MANAGMENT LLC', 'C003186', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:43:20', '2025-01-02 09:43:20');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf007c-bcaf-4ba3-8aa7-472408cff21c', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'ALOKOZAY GROUP OF COMPANIES', 'C003214', NULL, 't', 'debit', 'operating', '2025-01-02 09:45:14', '2025-01-02 09:45:14');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf00d5-c8d8-47c4-b871-6823b4adeaca', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL HATIMI TRADING FZE', 'C003195', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:46:12', '2025-01-02 09:46:12');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0158-6dcd-4265-9172-e1d29e5acbd1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'VANANAM VENTURES GENERAL TRADING LLC', 'C003231', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:47:38', '2025-01-02 09:48:12');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf01d7-dc35-4eb1-a45e-c49482225008', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MURANO LIGHTING DMCC', 'C003246', NULL, 't', 'debit', 'operating', '2025-01-02 09:49:01', '2025-01-02 09:49:01');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf029a-86d8-43a4-94e9-0df0fbb8e71e', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SAYEM INTERNATIONAL FOODSTUFF TRADING LLC', 'C003219', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:51:09', '2025-01-02 09:51:09');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf02fc-a88f-4f3e-b9ba-857f65d815aa', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'VERMEER WEST AFRICA FZCO', 'C003248', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:52:13', '2025-01-02 09:52:13');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf037b-6584-44f9-9c24-5eb3a39913e3', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'TRANS VISION SEA SHIPPING LINES AGENTS LLC', 'C001345', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:53:36', '2025-01-02 09:53:36');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf049b-590d-449f-9c6b-ee1665ab23de', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'QARYAT HIRAT MARBLE AND GRANITE INDUST', 'C001479', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:56:45', '2025-01-02 09:56:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0504-76eb-40a7-adda-0d69c9ba1dcf', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AL TAJIR GLASS INDUSTRIES', 'C001237', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:57:54', '2025-01-02 09:57:54');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf054f-da06-4091-bdae-32a2abcff00d', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'BRENTTA GENERAL TRADING LLC', 'C001511', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:58:43', '2025-01-02 09:58:43');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0591-84ae-4672-bb47-a09a56b90954', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SATEEF TRADING LLC', 'C002311', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 09:59:26', '2025-01-02 09:59:26');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf05f5-05dc-4c0b-aedb-0dadece387bc', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'RUKN ALSHARARA GOODS WHOLESALERS LLC', 'C002552', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:00:32', '2025-01-02 10:00:32');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf063e-4128-4eec-bb0d-3a8ba668d279', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GOODRICH DUBAI', 'C000354', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:01:20', '2025-01-02 10:01:20');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0700-6782-441c-a53c-1be3189c1023', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SHAHRAEINI GENERAL TRADING LLC', 'C001026', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:03:27', '2025-01-02 10:03:27');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf076a-3efa-4282-9edc-76afba9673f6', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'VERMEER MIDDLE EAST FZCO', 'C000469', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:04:36', '2025-01-02 10:04:36');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf07c7-789e-460f-bb84-6c9a1e5ef2f3', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'S A G LOGISTIC SERVICES LLC', 'C001719', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:05:37', '2025-01-02 10:05:37');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf081d-581e-43b2-b6b8-7f897ca9ae7d', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'SEAMASTER MARITIME (L.L.C)', 'C001322', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:06:34', '2025-01-02 10:06:34');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0882-40fc-4f87-af19-148b8c1da037', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'PROJECTS AND SUPPLIES CO.LTD.LLC', 'C001889', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:07:40', '2025-01-02 10:07:40');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf08db-db88-447c-a85d-af530fa2b340', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'JUST IN TIME IT SOLUTIONS', 'C000240', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:08:38', '2025-01-02 10:08:38');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0949-c2a1-4b80-a75b-0d0985d74c45', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GEMCO GENERAL TRADING LLC', 'C000658', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:09:50', '2025-01-02 10:09:50');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0998-8c7e-4584-bfcd-05ddfecd8729', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'GCC AUTO PARTS FZCO', 'C003111', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:10:42', '2025-01-02 10:10:42');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf09f1-b200-4d5b-83d9-3f30165216df', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'AKS SCIENTIFIC SUPPLIES FZ LLC', 'C003105', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:11:41', '2025-01-02 10:11:41');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0a51-e8d8-4509-8c14-d716d93c3b18', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'WHITE ALUMINIUM EXTRUSION LLC', 'C003151', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:12:44', '2025-01-02 10:12:44');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0ab0-4708-45cd-909d-1125ede823f1', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'MULTILINE TECHNICAL CO WLL', 'C003163', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:13:45', '2025-01-02 10:13:45');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0af2-0805-477c-b629-945fec91fd68', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'UNIGRAF LLC', 'C003160', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:14:29', '2025-01-02 10:14:29');
INSERT INTO "finance"."chart_of_accounts" VALUES ('9ddf0b59-548a-4ba0-8a6e-313f73ccf431', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '1110050001', 'POWER PLUS CABLE CO.L.L.C', 'C001948', 'DEBITORS LOCAL', 't', 'debit', 'operating', '2025-01-02 10:15:36', '2025-01-02 10:15:36');

-- ----------------------------
-- Table structure for costing
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing";
CREATE TABLE "finance"."costing" (
  "id" uuid NOT NULL,
  "job_order_id" uuid,
  "type" text COLLATE "pg_catalog"."default",
  "status" int2,
  "notes" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing
-- ----------------------------

-- ----------------------------
-- Table structure for costing_detail
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_detail";
CREATE TABLE "finance"."costing_detail" (
  "id" uuid NOT NULL,
  "costing_id" uuid,
  "shipment_type" varchar(255) COLLATE "pg_catalog"."default",
  "costing_type" varchar(255) COLLATE "pg_catalog"."default",
  "costing_value" varchar(255) COLLATE "pg_catalog"."default",
  "transaction_date" date,
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "charge_id" uuid,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "rate" float8,
  "amount" float8,
  "local_amount" float8,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "costing_head_id" uuid,
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing_detail
-- ----------------------------

-- ----------------------------
-- Table structure for costing_head
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_head";
CREATE TABLE "finance"."costing_head" (
  "id" uuid NOT NULL,
  "costing_id" uuid NOT NULL,
  "costing_value" varchar(255) COLLATE "pg_catalog"."default",
  "costing_type" varchar(255) COLLATE "pg_catalog"."default",
  "shipment_type" varchar(255) COLLATE "pg_catalog"."default",
  "reference_id" uuid,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing_head
-- ----------------------------

-- ----------------------------
-- Table structure for costing_special
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_special";
CREATE TABLE "finance"."costing_special" (
  "id" uuid NOT NULL,
  "costing_id" uuid,
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "charge_id" uuid,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "rate" float8,
  "amount" float8,
  "local_amount" float8,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "costing_type" varchar(255) COLLATE "pg_catalog"."default",
  "currency_id" uuid
)
;

-- ----------------------------
-- Records of costing_special
-- ----------------------------

-- ----------------------------
-- Table structure for costing_vendor_agent
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_vendor_agent";
CREATE TABLE "finance"."costing_vendor_agent" (
  "id" uuid NOT NULL,
  "costing_id" uuid,
  "mawb" varchar(255) COLLATE "pg_catalog"."default",
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing_vendor_agent
-- ----------------------------

-- ----------------------------
-- Table structure for costing_vendor_port
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_vendor_port";
CREATE TABLE "finance"."costing_vendor_port" (
  "id" uuid NOT NULL,
  "costing_id" uuid NOT NULL,
  "port_id" uuid,
  "port_code" varchar(255) COLLATE "pg_catalog"."default",
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing_vendor_port
-- ----------------------------

-- ----------------------------
-- Table structure for costing_vendor_trucking
-- ----------------------------
DROP TABLE IF EXISTS "finance"."costing_vendor_trucking";
CREATE TABLE "finance"."costing_vendor_trucking" (
  "id" uuid NOT NULL,
  "costing_id" uuid,
  "container_no" text COLLATE "pg_catalog"."default",
  "vendor_id" uuid,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "value" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of costing_vendor_trucking
-- ----------------------------

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS "finance"."currencies";
CREATE TABLE "finance"."currencies" (
  "id" uuid NOT NULL,
  "currency_code" varchar(8) COLLATE "pg_catalog"."default" NOT NULL,
  "currency_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO "finance"."currencies" VALUES ('9dc05e1c-5f3a-4273-be1f-c28891d5bf57', 'AED', 'Dirham (Unied Arabs Emirates)', '2024-12-18 04:16:21', '2024-12-20 04:11:30', '2024-12-20 04:11:30', NULL, NULL, NULL);
INSERT INTO "finance"."currencies" VALUES ('9dc46317-16e9-4e1b-b48c-facb13e65a93', 'AED', 'Dirham (United Arab Emirates)', '2024-12-20 04:13:36', '2024-12-20 04:14:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."currencies" VALUES ('9dc060a3-f58f-453e-9608-1d42a29d940a', 'EUR', 'Euro', '2024-12-18 04:23:26', '2024-12-18 04:23:26', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."currencies" VALUES ('9dc05df3-722e-4981-adaf-985ea2bf0af8', 'USD', 'Dollar (United States)', '2024-12-18 04:15:55', '2024-12-18 04:17:46', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer";
CREATE TABLE "finance"."customer" (
  "id" uuid NOT NULL,
  "customer_code" varchar(255) COLLATE "pg_catalog"."default",
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "eori_number" varchar(255) COLLATE "pg_catalog"."default",
  "credit_terms" varchar(255) COLLATE "pg_catalog"."default",
  "credit_limit" int4,
  "overseas" varchar(255) COLLATE "pg_catalog"."default",
  "currency_id" uuid,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "finance"."customer" VALUES ('9dc2a25d-b05f-4a5f-bfda-48625cbef589', '04348N', 'CNN Indonesia', '43948', 'collect', 4000, 'Local', '9dc05df3-722e-4981-adaf-985ea2bf0af8', '2024-12-19 07:18:52', '2024-12-19 07:18:52', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-7126-4877-b6b5-a6b661401292', 'CR24110028', ' KENYA AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-756b-447c-9060-4da9da11eec7', 'CR24110030', ' CAYMAN AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-793b-4f19-bb14-4c9718fde1a4', 'CR24110031', 'AZERBAIJAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-7bca-47e8-a330-8ceb3a3357a9', 'CR24110032', ' AIR MAURITIUS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-7e0b-4a92-bf26-655a6555ee85', 'CR24110033', 'AMERICAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-803c-4b8f-ba41-8e77732b1308', 'CR24110034', ' AIR ALGERIE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-8297-4292-9b32-0c37931e8a02', 'CR24110037', 'VARIG', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-84ff-4829-8934-fbe5120cdd93', 'CR24110038', ' AEGEAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-877d-47ab-9201-a05c614e3dbb', 'CR24110039', ' AIR ARABIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-8a10-489b-a664-f478cf5fd2be', 'CR24110040', ' ICELANDAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-8cd1-4b93-817d-2e9a33327243', 'CR24110041', ' NATIONAL AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-93e9-431b-aa2b-aee3016cf540', 'CR24110042', ' CARGOLUX AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-980d-4df1-9072-22e34cf69611', 'CR24110043', 'CANADIAN AIRLINES INTERNATIONAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-9c29-4347-96be-abe802588448', 'CR24110044', 'SYRIAN ARAB AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-9ff8-4526-b038-5e2a27d29c31', 'CR24110045', ' LIAT AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-a2c7-4ce3-b3a1-bccf34160ac8', 'CR24110046', ' ACTC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-a561-4811-b81f-b50a98210723', 'CR24110047', ' SAS-SCANDINAVIAN AIRLINES SYSTEM', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-a7cd-4e05-b41d-fd860128f985', 'CR24110048', 'IRAN AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-aa13-4d5e-b2e9-0ed00f2fad91', 'CR24110049', ' AIR CHINA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-ac64-4c1e-bccb-0baddf88f632', 'CR24110050', ' SHENZHEN AIRLINES ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-aed1-45fa-830c-91de0b939741', 'CR24110051', ' QATAR AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-b13c-4a66-96e9-404c6cf53812', 'CR24110052', ' CORSAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-b38c-45be-a319-a447fcde0e34', 'CR24110053', ' MASAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-b67a-482a-9c79-a1b469f82479', 'CR24110054', ' OMAN AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-beeb-4e72-9e82-eef93e400d1b', 'CR24110055', ' UNI AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-c2b5-4c92-b8eb-c696e2e4b683', 'CR24110058', 'SIBERIA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-c6b2-4b72-84ef-4a3c5fba72f7', 'CR24110059', ' ETIHAD AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-ca02-482d-980f-fda7b5c482ee', 'CR24110060', ' CHINA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-cca7-417b-8b80-332d75296970', 'CR24110061', ' JET AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-cedb-4eac-97e4-3c4cf7094567', 'CR24110062', ' ABX AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-d0f2-4a1f-8fd3-d75623cdde7e', 'CR24110063', 'CUBANA DE AVIACION', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-d38f-4f1b-80b5-9d419e0d9696', 'CR24110064', ' AEROUNION', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-d621-40a8-b6a3-70d6fec06641', 'CR24110065', ' AIRASIA BERHAD', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-d88c-4ce0-a90e-e9f394581b44', 'CR24110066', 'GETJET AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-db6f-41b9-b34d-16a83174016a', 'CR24110067', ' BIMAN BANGLADESH', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-dfee-4601-813a-79fb3470241d', 'CR24110068', 'ALITALIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-e3f5-4b22-a93d-b0d30533ab70', 'CR24110069', ' BRINGER AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-e7f9-4ca0-a60e-821055479063', 'CR24110071', ' PEGASUS CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-ec92-443a-a12d-6c7e1f7bb8d3', 'CR24110072', 'AIR INDIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-f07b-4989-9b79-60c4cb585fd4', 'CR24110073', ' MANDARIN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-f37c-434c-ab02-c437f4f3ba4a', 'CR24110074', ' ALOHA AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-f630-4abd-b762-8fd1f84ea1d9', 'CR24110075', 'JUBBA AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-f877-4cf7-bcd3-003a297375e2', 'CR24110070', ' LACSA AIRLINES OF COSTA RICA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-fa8a-4909-b1e1-4dd833e69032', 'CR24110076', ' MERCURY AMERICAS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-fcea-41a9-9908-a1664606307b', 'CR24110077', ' ALLIED AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-ff30-4a49-924f-7c2d46e9b264', 'CR24110078', 'DRAGONAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-0143-4ff3-8ea1-07205a25c940', 'CR24110079', ' AIR SERBIA (JAT)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-0584-44d0-88a7-df83b53416e5', 'CR24110080', 'CYPRUS AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-09b9-4dcc-b669-eeb07a5eb111', 'CR24110081', ' XIAMENAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-0deb-4b7a-bf05-43cebcad904d', 'CR24110082', 'GABON AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-1205-451e-914a-8443f5e71b80', 'CR24110083', ' SATA INTERNATIONAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-1654-4b6d-aa29-9fd5864f79c7', 'CR24110084', ' CARGOLOGICAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-19c3-4eb1-a76d-acfa7e89ed27', 'CR24110085', 'AER LINGUS CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-1cd4-4d48-bfff-9e75e1101723', 'CR24110086', 'EGYPT AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-1fc2-4a8a-8117-6dd9ddff76a3', 'CR24110087', ' NORWEGIAN AIR UK', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-22b4-4e85-9ce5-a6fe94228851', 'CR24110088', ' GOL AIRLINES (VRG LINHAS AÉREAS)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-25a4-4e39-b1fb-5d52e0b74081', 'CR24110089', 'CANBERRA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-288a-40e1-8e2a-21ee2437a41c', 'CR24110090', ' TACA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-2d0d-4b17-85fc-2058a888bfad', 'CR24110091', ' MAHAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-31a7-4776-bbc6-478e0cd63eb7', 'CR24110092', 'SAUDI ARABIAN AIRLINES ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-35cf-48ae-ac10-ead037a855bc', 'CR24110093', ' ESTAFETA CARGA AEREA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-397a-4634-884d-e15e3841c439', 'CR24110094', 'GARUDA INDONESIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-3d0c-4f42-a5be-13cd04fa792b', 'CR24110095', 'DHL WORLDWIDE EXPRESS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-3fa4-4822-b319-5230e105eca9', 'CR24110096', ' SKYLEASE CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-41b5-4d29-a365-0556ec4f8f1d', 'CR24110097', ' AIR TRANSAT ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-43bd-4b51-9ef8-7a2bcc0adae7', 'CR24110098', ' THAI AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-4601-408c-80aa-77b7b12e3978', 'CR24110099', ' ATLAS AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-483f-47ff-b868-518911fa47e2', 'CR24110100', ' AIR PREMIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-4acf-4670-8857-68aed334878b', 'CR24110101', ' PAKISTAN INT´L AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-4d3c-4439-8754-c825efb4444f', 'CR24110102', ' AER LINGUS CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-4f5e-4f21-8055-51d1e8e7b4d7', 'CR24110103', ' AIR INCHEON', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-540d-4d0a-8470-a6d0c685f600', 'CR24110104', ' AIRBRIDGE CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-5864-4fbf-9487-f27078b3b923', 'CR24110105', ' SILK WAY AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-5d7c-4877-8388-118c87debbdb', 'CR24110106', 'OLYMPIC AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-6185-4b15-b1e8-6e7e379bcefd', 'CR24110107', ' KALITTA AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-6520-4b01-ae41-25fb5294459b', 'CR24110108', ' AIR ITALY', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-67f8-4bb7-b4fd-65b6ba7096bf', 'CR24110109', 'QANTAS AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-6aad-4419-b011-d1cf9223d05e', 'CR24110110', ' HAWAIIAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-6d58-4914-a021-1661d3932ee3', 'CR24110111', ' SUPARNA / JINPENG / YANGTZE RIVER EXPRESS AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-6ff6-4510-923a-af76cf76bd83', 'CR24110112', ' JETAIRFLY', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-7290-4b51-9336-9915b350e075', 'CR24110113', ' DHL AERO EXPRESO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-7566-48dc-8e2c-f2826af1f55e', 'CR24110114', ' TAB TRANSPORTES AEREOS BOLIVIANOS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-7918-454c-8163-32d5525f003c', 'CR24110115', ' FLYDUBAI CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-7d83-490a-9923-48d3413392b4', 'CR24110116', ' SICHUAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-833f-4eaa-9e0a-e06ee9a280bd', 'CR24110117', 'CHICAGO EXPRESS AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-8790-4c0d-afc8-34f488fb406e', 'CR24110118', ' CHINA SOUTHERN AIRLINES ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-8b78-4d2f-923b-606ef7e93b00', 'CR24110119', 'AEROMEXICO CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-8eaa-48f7-9975-0cdf13d03f2e', 'CR24110120', 'TAP AIR PORTUGAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-917c-4062-922a-41f44f49eba0', 'CR24110121', ' STARLUX CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-9429-49fc-a995-1e747c1aae0f', 'CR24110122', ' AIR GREENLAND', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-96b4-4eb3-b747-f77b37c5bd23', 'CR24110123', ' HONG KONG AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-9928-4622-9f50-ac74ec431140', 'CR24110124', 'IBERIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-9bc7-4919-adc7-ec379c1c8883', 'CR24110125', ' AIR MOLDOVA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-9e7b-4054-bb8a-8923c5e53757', 'CR24110126', ' INSEL AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-a2ad-4dfb-a779-2b2708c2838b', 'CR24110127', ' SATA AIR ACORES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-a81c-4252-ab12-5471b8e8e81c', 'CR24110128', ' CARGOLUX ITALIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-ac7b-4fa1-b073-174e39fd58bd', 'CR24110130', ' VIRGIN ATLANTIC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-b0f4-4794-b4b1-2c1aaeb344c6', 'CR24110131', ' VIETNAM AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-b5f5-4cb8-9282-a951a42c739b', 'CR24110132', ' AIR NIUGINI', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-b94d-4e38-9806-30891d864dcb', 'CR24110133', ' SPICEJET', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-bbda-4681-b4b6-35a5b2846870', 'CR24110134', 'AEROLINEA DEL CARIBE / AERCARIBE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-be62-4044-9a8d-48535e840af5', 'CR24110135', ' NOK AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-c107-4d3a-8ab7-900d43e0ce81', 'CR24110136', ' CONDOR FLUGDIENST', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-c3b5-4b1f-9871-3a3bbbec8778', 'CR24110137', ' AIRCLASS LINEAS AEREAS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-c74a-45d2-a8a1-17ff0c23b2ce', 'CR24110138', 'ETHIOPIAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-cc03-442e-a563-e732ead347a4', 'CR24110139', ' VENSECAR INTERNACIONAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-d06b-46d2-aec2-930a51a59807', 'CR24110141', ' UZBEKISTAN AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-d50b-44f6-ab3b-d64de918bcb0', 'CR24110142', ' NORSE ATLANTIC AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-d952-43f8-8148-1a634f9eee15', 'CR24110143', ' YEMENIA YEMEN AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-dc79-437f-b09b-46f99103d8e8', 'CR24110144', ' JETSTAR ASIA AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-dfe2-4d91-af8d-a6f5dd98e94d', 'CR24110145', 'MIDDLE EAST AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-e2eb-4ef7-a39a-4183f357a2a7', 'CR24110140', ' AIR NAMIBIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-e56b-41f6-8a13-5d2f6ca02307', 'CR24110146', ' TUI AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-e7e8-42e8-a891-3baf650df153', 'CR24110147', ' ABSA CARGO AIRLINE / LATAM CARGO BRASIL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-ea90-4e3a-82ee-84ff1d5d6e4d', 'CR24110148', ' TATA SIA AIRLINES/VISTARA CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-ed36-41d4-9e6e-4cc0d852c81c', 'CR24110149', ' ROYAL JORDANIAN', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-f0e5-49b9-8473-855377cb303f', 'CR24110150', ' TAMPA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-f5ef-4abd-ab74-4e80e703b42e', 'CR24110151', ' CARGOJET AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-fa8f-4897-837c-d70e5202203c', 'CR24110152', ' JAPAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661b-ff23-4cd2-8174-8eeda30c646b', 'CR24110153', ' ASIANA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-0291-42e0-837f-0dc4319f45a4', 'CR24110154', ' COPA AIRLINES CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-0542-49ba-bdfc-84f5a6374ccd', 'CR24110155', 'AEROLINEAS ARGENTINAS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-07b2-45c6-9f8c-924763520456', 'CR24110156', ' CEBU AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-0a2d-4eb0-b9c0-2ac51d119237', 'CR24110157', ' ASTRAL AVIATION', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-0cc1-474c-82e7-8120af4f9292', 'CR24110158', ' URAL AIRLINES CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-0f09-45f1-90db-c2577882cbc9', 'CR24110159', 'UNITED AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-11a2-4c0f-998e-36b307c4dc1b', 'CR24110160', 'GULF AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-152f-477b-a1bd-a7f21035ccad', 'CR24110161', ' JEJU AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-19b5-4f34-821a-1c9efc49c983', 'CR24110162', 'NIGER AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-1de9-4885-9261-480eece5d0e3', 'CR24110163', 'AIR FRANCE ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-2344-4292-96e6-c597ce616808', 'CR24110164', 'AIRASIA INDIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-28ab-47f2-9414-338e9a1e282f', 'CR24110166', ' LATAM AIRLINES BRASIL / TAM LINHAS AEREAS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-2adc-4247-94f0-6102ef736545', 'CR24110167', ' MARTINAIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-2d70-4748-9697-c2ae63e205c5', 'CR24110168', 'LOT POLISH AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-3045-4bc5-b2c4-aea66b5f3ed1', 'CR24110169', ' MCS AEROCARGA DE MEXICO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-32fa-4fed-bbe6-63d29d516d15', 'CR24110171', ' UPS AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-3599-4ed7-b99d-cad38de45136', 'CR24110173', ' MALINDO AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-37fa-4049-96f0-42754d23e349', 'CR24110174', 'LUFTHANSA CARGO AG', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-3b61-4927-8e28-fe6db91bb41c', 'CR24110175', ' JET AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-4011-4e59-a6be-c74048713723', 'CR24110176', ' WESTJET CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-4419-4bb8-8842-b953bbe970ca', 'CR24110177', ' CARIBBEAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-47c2-4dfb-bd10-c7cbfbcff850', 'CR24110179', ' AMERIJET INTERNATIONAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-4b8f-4a17-8bce-71ecd9fa6012', 'CR24110180', ' SINGAPORE AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-51e5-46db-992f-19dd42c4cb4e', 'CR24110181', ' LAS CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-54bb-4ac9-85ff-e093929ffa18', 'CR24110182', ' AIR BELGIUM', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-575e-441f-92e9-d6b094293aaa', 'CR24110183', ' SKY WEST AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-59ee-45a3-9efa-c10736f3a5fa', 'CR24110184', 'ALASKA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-5c7b-4094-a774-08b391618d46', 'CR24110186', ' NEOS SPA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-61a6-4537-9e54-d452c6195768', 'CR24110187', ' TAAG ANGOLA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-65af-4b75-89cd-435f41533c42', 'CR24110188', ' EMIRATES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-6aa7-42a9-97e2-325170e7c998', 'CR24110189', ' LAN ECUADOR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-6f50-4589-8590-c833698757f7', 'CR24110190', ' VIETJET', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-738b-4b57-a72a-a22debf27b71', 'CR24110192', ' WOW AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-772a-4e3c-b39a-f4b65be2a8c3', 'CR24110193', ' ROYAL BRUNEI AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-7a5e-4ceb-9a40-e7fca4852e71', 'CR24110194', 'AIR SEYCHELLES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-7d49-4d2a-a4e0-569217ea652b', 'CR24110195', ' ASL AIRLINES BELGIUM ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-7fb8-48f6-8a86-c7789bce6e2d', 'CR24110196', ' SAC SOUTH AMERICAN AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-81c8-40f7-8241-3cedaf2f9319', 'CR24110197', ' JET CLUB', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-83d9-49e6-b2a7-df37500a823e', 'CR24110199', 'PHILIPPINE AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc4b134-dac8-499d-8acc-50bafd68e70d', 'FADKJFD', 'FUCEK LTD', '212121', 'collect', 1111111, 'Local', NULL, '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-8623-48d0-a890-1ae972a191b0', 'CR24110201', ' BULGARIA AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-88c2-4a9b-8b90-b9376354163b', 'CR24110202', ' CHINA EASTERN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-8d15-41c6-a51a-9fc80f8dbd7c', 'CR24110203', ' AEROFLOT', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-9182-4f8b-aa19-31d6338e6dab', 'CR24110205', ' CHARTERLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-9547-4dbb-9834-c0addc5a1382', 'CR24110206', 'BAHAMAS AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-995a-4f92-8178-70127c367427', 'CR24110207', ' ANA ALL NIPPON CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-9cb6-4d72-b054-7a5a5705297e', 'CR24110208', ' BANGKOK AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-9efa-4b5a-a7f6-e873722e815c', 'CR24110209', ' STABO AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-a17e-4c1d-ba7d-3210719a0b4f', 'CR24110211', ' AIR MADAGASCAR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-a3ee-4d91-b895-e2e0fdb095f2', 'CR24110212', 'SF AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-a628-4da7-a2ba-ce06bc00f1ad', 'CR24110213', ' RUS (RELIABLE UNIQUE SERVICES) AVIATION', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-a869-4957-a561-19b2986a28de', 'CR24110214', ' AIR MALTA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-aa74-4fa3-bb04-01b6bc433e0a', 'CR24110215', ' AIRMAX CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-acd4-40a4-8c32-1df9dff3828b', 'CR24110216', 'HONGKONG EXPRESS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-aee4-4644-a944-2ed34cfd2538', 'CR24110218', 'LAN AIRLINES (LATAM)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-b185-4592-9cef-c4f191533142', 'CR24110219', 'DELTA AIR LINES ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-b482-431d-9ede-d48814fd822e', 'CR24110220', ' AIR ASTANA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-b766-46a2-a3a2-e5c3b561760b', 'CR24110221', ' UNI-TOP AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-bb11-4b31-82e3-4fcf55b99f4f', 'CR24110222', ' BRITISH AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-bf9c-46aa-b606-363e4ccd28e1', 'CR24110224', ' SRILANKAN CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-c33a-4165-acd1-22b150f09050', 'CR24110225', ' HAINAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-c649-4ac8-8228-769a7b412fba', 'CR24110226', ' AIR HONG KONG', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-c90b-4f67-9fd9-b9dea0bbf4d9', 'CR24110035', 'BRUSSELS AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-cbfa-4e64-a86d-11f79f436142', 'CR24110227', ' AIR BALTIC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-cea7-450c-bd6a-9646bf2cdf28', 'CR24110228', ' SHANDONG AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-d10e-4dbd-a935-9ae26d6fa878', 'CR24110229', ' KUWAIT AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-d38e-4f65-b7e9-718b1dfd9a2d', 'CR24110231', ' EL AL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-d5e8-4184-af71-5c435caeea5b', 'CR24110232', ' COYNE AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-da69-4f89-a85d-4a90b1b557f7', 'CR24110233', ' NORTHERN AIR CARGO / STRATAIR ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-ded1-4af6-b6ec-432247418951', 'CR24110234', ' KOREAN AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-e2e4-451a-b72c-eb668c9b19e3', 'CR24110235', ' SOUTHWEST AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-e8d2-4396-a385-2b960dd4433c', 'CR24110236', ' CHINA CARGO AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-ebd5-4b05-a238-66ace434ebe1', 'CR24110238', ' NIPPON CARGO AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-ee24-4189-83b1-ce5169b9e908', 'CR24110239', 'AUSTRIAN CARGO ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-f05b-4d2f-9c9e-eac1ed06239e', 'CR24110240', ' FIJI AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-f27e-493d-a8d8-e02e27448ba4', 'CR24110241', ' STARLIGHT AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-f493-4b82-bb9f-781209f17e8f', 'CR24110242', ' FINNAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-f6ce-488d-ab23-c687bcce9d4d', 'CR24110243', 'KLM AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-f9a1-4887-9747-1cc1f2e93bfc', 'CR24110245', ' AIGLE AZUR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661c-fc19-4ade-8939-38338db20da7', 'CR24110246', ' HONG KONG AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-00b5-40b4-aef7-a56664727393', 'CR24110247', ' AZUL CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-064e-481b-aaca-88ada62f336e', 'CR24110248', ' XL AIRWAYS FRANCE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-0ac1-4454-be08-552041d8b08a', 'CR24110249', ' SWISS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-0ee1-4e25-a8da-da9ee00592c9', 'CR24110251', 'CHALLENGER AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-12ca-4244-a446-278b9337bbe3', 'CR24110252', 'MYANMAR AIRWAYS INTERNATIONAL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-15a2-4086-97c7-ddd228eb907c', 'CR24110001', ' UKRAINE INT´L AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-17f4-4e4f-b30e-2fb2dd0c06b7', 'CR24110002', ' INDIGO AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-1a2b-4879-a5e2-a5ccabacba5e', 'CR24110003', ' POLAR AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-1c84-4b60-b997-24917aa9206c', 'CR24110004', ' CALM AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-1ef9-4720-baff-36c2249c5aa0', 'CR24110057', ' AIR MACAU', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-218b-475c-9e02-100631cfae53', 'CR24110129', ' TAROM', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-23da-4990-be91-a8b8548c1844', 'CR24110170', 'FEDEX', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-27e9-4152-b556-38f7fa4e1019', 'CR24110056', ' TRANS AMERICAN AIRWAYS/TACA PERU', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-2ca8-4147-903e-3b407ede465f', 'CR24110165', 'CZECH AIRLINES ', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-3176-4a32-8fdd-2ea180f09f43', 'CR24110172', ' GLOBAL AVIATION AND SERVICES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-3b89-46fc-9712-0ca3641472b8', 'CR24110178', ' LATAM CARGO COLOMBIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-3e63-43b0-bf1a-bd613a7473f7', 'CR24110185', ' AIR TAHITI NUI', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-4097-4bbc-8135-2bf2980052b8', 'CR24110191', ' MY INDO AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-42e3-488d-a25a-2b38562e6400', 'CR24110198', ' AIRASIA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-4511-4a99-b321-b7dedd013bc0', 'CR24110200', 'CAMAIR-CO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-474b-43b0-b31d-dce6ee9d8a25', 'CR24110204', ' SOLAR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-4991-4018-bf35-67234b671f22', 'CR24110210', ' AIR EUROPA CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-4c03-4495-8e4d-790da1c36184', 'CR24110217', 'AIR CANADA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-5074-49a0-8a36-a856c3a80835', 'CR24110223', ' ROYAL AIR MAROC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-5563-4191-9f48-c0b5e320c5d2', 'CR24110230', ' DHL AVIATION / EUROPEAN AIR TRANSPORT', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-5ad5-4b26-900a-5c2a9bda4ade', 'CR24110237', ' TURKISH AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-6076-4bfe-b73d-ec421154bf9c', 'CR24110244', ' COBALTAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661d-62e9-4a70-810b-c73854b9ac9e', 'CR24110250', ' SILK AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dca6088-f88d-47be-978e-776d5be4d7af', 'SHP92391', 'SHOPEE INDONESIA', '329LDFASHP', 'prepaid', 3000, 'local', '9dc05df3-722e-4981-adaf-985ea2bf0af8', '2024-12-23 03:41:25', '2024-12-24 08:20:19', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dd25e0a-1fa1-4ecd-b24d-6353ae0c4284', NULL, 'GOTO (Gojek Tokopedia)', '112233', '30', 3000, 'local', '9dc05df3-722e-4981-adaf-985ea2bf0af8', '2024-12-27 03:01:04', '2024-12-27 03:01:41', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-6d4f-4d87-8dac-c6c99d9baed6', NULL, 'INDOMIE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-7555-42db-be4f-519bcba1df29', 'CUSTOMER CODE 3', 'CUSTOMER NAME 3', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-77ef-4165-bab5-0d338e719063', 'W1R4001', 'WIRA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-7a4e-485a-9645-239f587f8bf8', 'F3RD1', 'FERDI', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-7e5f-4713-b0b4-ee404e65b590', 'VE24110038', 'SENORIAL SHIPPING SERVICES LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-82b1-488a-9051-deabc052b78d', 'VE24110004', 'PIL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-8753-49cb-ac0b-813cfc7aff51', 'VE24110018', 'ZIM INTEGRATED SHIPPING SERVICES LTD', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-8b8c-4542-95ec-e30cf30ed8fc', 'VE24110020', 'HAPAG LLOYD(HLL)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-8f96-4f6a-ade7-ca416831dc19', 'VE24110021', 'ONE – OCEAN NETWORK EXPRESS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-927e-43b4-b3a5-94ffb8e70466', 'VE24110022', 'EMIRATES SHIPPING LINE(ESL)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-9796-492e-a0a7-2bb876dadfc8', 'T3G4R04', 'TEGAR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-9caa-4f19-8319-b10b69d78556', 'VE24110001', 'OOCL', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-9f43-4ef5-9490-d64633fcd6d8', 'VE24110039', 'GENIO SHIPPING LINE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-a1ca-414f-8bc2-8451076b3ebb', 'VE24110011', 'REGIONAL CONTAINER LINES (RCL)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-a62d-4e18-a36e-3f011b3daa65', 'VE24110028', 'COSCO Shipping Lines Co', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-a9df-49cf-bc5f-3f6a1204738e', 'VE24110023', 'KMTC LINE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-ad67-4efe-8594-7a2806d3952d', 'VE24110012', 'UNKNOWN', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-b0ba-4635-903d-362caf0e8aa2', 'VE24110013', 'CMA CGM S.A', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-b40b-4f63-9e3f-d01279459dc6', 'VE24110024', 'ECU LINE MIDDLE EAST (L.L.C)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-ba8b-4f0a-9600-82af8e83028c', 'V24120001', 'Truckindo', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-bd97-436f-89c7-df65a0cac253', 'V24120001', 'CSAT', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-c08c-4785-8e5e-f70568859a24', 'V24120001', 'CASS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-c387-43f5-a104-942f99246f48', 'V24120001', 'CUSS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-c6be-47a8-9c92-06255f284414', 'V24120001', 'Garuda', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-c999-44bb-81e2-271b78575102', 'V24120001', 'LION', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-cd83-481b-a03c-cbe9e8053081', 'VE24110002', 'SC LINES LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-d0e0-4c05-9a55-3d43aa18af44', 'VE24110003', 'MSC - MEDI', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-d453-4a56-9c14-d34ce5b51eed', 'VE24110005', 'APM-MAERSK', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-d837-41af-85f4-f9507e1c5c0f', 'VE24110041', 'BRIGHT LINE SHIPPING LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-dbe3-4851-9539-65cc9356cf73', 'VE24110042', 'MSM SHIPPING LINES LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-df23-434a-86d8-94726a735785', 'VE24110007', 'ORIENT EXPRESS LINES (OEL)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-e1dd-4cab-9708-4bd84f55ea0b', 'VE24110008', 'COSCO SHIPPING LINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-e481-4462-96eb-e89f4eded6c4', 'VE24110026', 'OOCL(UAE) LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-e74f-4ecc-bcaa-d04844574a98', 'VE24110037', 'SHIPNER SHIPPING LINE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-ea0f-4af6-bd20-ac0d9292a77d', 'VE24110025', 'SK SHIPPING LINE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-ec5c-454c-96a8-9a6aa2df3be5', 'VE24110006', 'HYUNDAI MERCHANT MARINE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-eee5-4692-b0db-9470e36114f2', 'VE24110035', 'TRANSWORLD SHIPPING AND LOGISTICS LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-f21a-4e89-b7e5-22732838b652', 'VE24110027', 'MAERSK KANOO UAE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-f5e8-417f-adda-49a0bf60e325', 'VE24110009', 'CHINA UNITED LINES LTD', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-f963-4425-a500-2715cb37ae2e', 'VE24110010', 'EVERGREEN LINE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc26619-fd6e-4106-a5f8-08cecd31e5c1', 'VE24110029', 'MEDITERRANEAN SHPG CO.UAE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-0115-4cf6-882a-0cfd96f537fc', 'VE24110030', 'YANG MING (UAE)L.L.C', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-046e-46cb-9e95-b9a23e11171a', 'VE24110014', 'WAN HAI LINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-07f4-4d80-aea7-9081a5f3767f', 'VE24110036', 'ALLIED SHIPPLING LINE L.L.C', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-0b2a-4bd6-a804-f3b7448cada6', 'VE24110031', 'CMA CGM AND ANL NE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-0e85-4147-984a-35edfec5c489', 'VE24110015', 'SSC CONSOLIDATION (L.L.C)', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-1149-42a2-a547-a08c0cde7667', 'VE24110032', 'APPLE SHIPPING LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-13df-40b5-a842-c39dbd5707e8', 'VE24110016', 'YANG MING LINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-16d3-4418-b7d9-58a436a137e2', 'VE24110017', 'DMC GLOBAL LOGISTICS LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-1a98-41d0-aca2-c3ac77d1f6f8', 'VE24110040', 'A N C EXPRESS SHIPPING LINE LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-1e7f-49c1-a093-b23fd04ad2c4', 'VE24110034', 'NAVIO SHIPPING LLC', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-229f-4565-8baf-c90693ba3d06', 'VE24110033', 'OCEAN WORLD LINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-2637-4517-bc46-ba39c8feef88', 'VE24110019', 'GLOBAL FEEDER SERVICE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-2a53-44c1-b62d-030c1f33f16d', 'CR24110036', ' TIANJIN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-2d42-4924-ab6b-52c0c23de708', 'CR24110029', ' VARIG', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-2fc2-4e77-8614-f65a8b2d66b9', 'CR24110005', ' ESTONIAN AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-323d-47ff-afc7-e6667430f7ed', 'CR24110006', ' SILK WAY WEST AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-34e3-4208-8351-d07b579f09a4', 'CR24110007', 'CMA CGM AIR CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-3770-4552-a359-1db6ea38da33', 'CR24110008', ' SHANGHAI AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-39e6-4875-ab64-8ea480712442', 'CR24110009', ' CROATIA AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-3c2a-4a5c-87fb-a8df41b530e5', 'CR24110010', ' TUNISAIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-3e95-4cec-a70d-463dfd422b5e', 'CR24110011', ' AVIANCA CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-41ae-4a3e-b62d-5e770a193254', 'CR24110012', ' MNG AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-454d-4168-80ff-7c274e171d4f', 'CR24110013', ' RAYA AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-48e9-44fd-8c58-4fdf3a7e5b72', 'CR24110014', ' CAL CARGO AIR LINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-4c25-49ea-8aed-cece2eee33a6', 'CR24110015', ' SUNCLASS AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-4f7e-4ac8-9789-611ec5e09b38', 'CR24110016', 'DHL AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-52e4-495c-8206-f7036278936b', 'CR24110017', ' CATHAY PACIFIC AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-5582-412e-85f1-82385e4f4c48', 'CR24110018', ' LAN CHILE CARGO', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-5812-407c-9fc9-c63541dd14cc', 'CR24110019', 'SOUTH AFRICAN AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-5a91-4761-b0d9-b662a6e35d90', 'CR24110020', ' MALAYSIAN AIRLINE SYSTEM', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-5ce0-48f6-952f-82766210a061', 'CR24110021', ' NORWEGIAN AIR SHUTTLE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-5f54-4ab7-a766-71c5be3f5e41', 'CR24110022', ' FLY ONE', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-61ea-4ad6-87e1-1e5583a961ce', 'CR24110023', 'AIR NEW ZEALAND', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-643e-4a6d-b662-82241e0ace4f', 'CR24110024', ' EVA AIRWAYS', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-6700-4929-9367-0774e9134aff', 'CR24110025', ' BELAVIA BELARUSIAN AIRLINES', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-6a68-46c5-a0e7-c9885a7d6a75', 'CR24110026', ' RWAND AIR', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer" VALUES ('9dc2661a-6dbb-450c-b44d-aa412a90b9bc', 'CR24110027', ' AIR BOTSWANA', NULL, NULL, NULL, NULL, NULL, '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_account
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_account";
CREATE TABLE "finance"."customer_account" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "chart_of_account_id" uuid,
  "currency_id" uuid,
  "lov_status" varchar(255) COLLATE "pg_catalog"."default",
  "notes" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_account
-- ----------------------------
INSERT INTO "finance"."customer_account" VALUES ('9dc2a25d-bc9c-4c0d-bb17-c235011012c5', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', NULL, NULL, NULL, '2024-12-19 07:18:52', '2024-12-19 07:18:52', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_account" VALUES ('9dc4b134-f6e6-455e-b747-7d85dc697e6b', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', NULL, NULL, NULL, '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_account" VALUES ('9dca6089-04b8-438b-85ec-edc087b80099', '9dca6088-f88d-47be-978e-776d5be4d7af', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', NULL, NULL, NULL, '2024-12-23 03:41:25', '2024-12-23 03:41:25', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_account" VALUES ('9dd25e0a-29ba-4610-9b21-908772ec4e18', '9dd25e0a-1fa1-4ecd-b24d-6353ae0c4284', '9dc059c5-c6b8-422b-b3f1-9e6ed3197887', NULL, NULL, NULL, '2024-12-27 03:01:04', '2024-12-27 03:01:04', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_address";
CREATE TABLE "finance"."customer_address" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "address_type" varchar(255) COLLATE "pg_catalog"."default",
  "bank_dlr_code" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "address" text COLLATE "pg_catalog"."default",
  "country" varchar(255) COLLATE "pg_catalog"."default",
  "zip_code" int8,
  "po_box" int8,
  "phone_number" varchar(255) COLLATE "pg_catalog"."default",
  "fax_number" varchar(255) COLLATE "pg_catalog"."default",
  "warehouse_provider" varchar(255) COLLATE "pg_catalog"."default",
  "contact_informations" json,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_address
-- ----------------------------
INSERT INTO "finance"."customer_address" VALUES ('9dc2a488-557d-4e35-8504-adc55aac0356', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', 'Business Address', '001', 'Jakarta', 'Indonesia', 'Jakarta, Indonesia', '102', 30393, 2323343, '+610987654321', '239023', 'CNN', '"[{\"contact_person_name\":\"Asep\",\"contact_person_number\":\"+621234567890\",\"contact_person_email\":\"halo@cnnindonesia.com\",\"contact_person_address\":\"Jakarta\"},{\"contact_person_name\":\"Juned\",\"contact_person_number\":\"+626879349872\",\"contact_person_email\":\"halo@cnnindonesia.com\",\"contact_person_address\":\"Bogor\"},{\"contact_person_name\":\"Merry jane\",\"contact_person_number\":\"+62567898765\",\"contact_person_email\":\"halo@cnnindonesia.com\",\"contact_person_address\":\"Manila, Filipina\"}]"', '2024-12-19 07:24:56', '2024-12-19 07:25:54', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_address" VALUES ('9dd25d19-14f7-4107-9a57-571b2591a16c', '9dca6088-f88d-47be-978e-776d5be4d7af', 'Billing Address', NULL, NULL, NULL, NULL, '102', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-27 02:58:26', '2024-12-27 02:58:45', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_address" VALUES ('9dd25e71-bb79-4a45-8db6-92e8c7bd773b', '9dd25e0a-1fa1-4ecd-b24d-6353ae0c4284', 'Business Address', NULL, NULL, NULL, 'Jakarta, Indonesia', '102', NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-27 03:02:12', '2024-12-27 03:05:49', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_bank
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_bank";
CREATE TABLE "finance"."customer_bank" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "account_number" varchar(255) COLLATE "pg_catalog"."default",
  "account_name" varchar(255) COLLATE "pg_catalog"."default",
  "bank_name" varchar(255) COLLATE "pg_catalog"."default",
  "iban_number" varchar(255) COLLATE "pg_catalog"."default",
  "swift_code" varchar(255) COLLATE "pg_catalog"."default",
  "bank_address" text COLLATE "pg_catalog"."default",
  "bank_guarantee_ac_number" varchar(255) COLLATE "pg_catalog"."default",
  "blz_number_sort_code" varchar(255) COLLATE "pg_catalog"."default",
  "paye_beneficiary_id" varchar(255) COLLATE "pg_catalog"."default",
  "payment_type" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_code" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_ac_number" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_ac_type" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_name" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_address" int4,
  "beneficiary_first_address" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_second_a" int4,
  "beneficiary_second_address" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_third_address" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_city" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_state" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_pincode" varchar(255) COLLATE "pg_catalog"."default",
  "ifsc_code" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_mobile_number" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_bank_number" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_bank_name" varchar(255) COLLATE "pg_catalog"."default",
  "beneficiary_bank_branch_name" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_bank
-- ----------------------------

-- ----------------------------
-- Table structure for customer_contract
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_contract";
CREATE TABLE "finance"."customer_contract" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "contract_from" int4,
  "contract_to" int4,
  "contract_start" date,
  "contract_end" date,
  "contract_file" text COLLATE "pg_catalog"."default",
  "contract_description" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "contract_no" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "total_amount" float8,
  "charge_id" uuid,
  "currency_id" uuid,
  "unit_id" int8
)
;

-- ----------------------------
-- Records of customer_contract
-- ----------------------------
INSERT INTO "finance"."customer_contract" VALUES ('9dd8b679-c4b4-4acf-8e72-64e59b412317', '9dc2661c-65af-4b75-89cd-435f41533c42', NULL, NULL, '2024-12-01', '2024-12-31', NULL, 'TEST CONTRACT', '2024-12-30 06:43:19', '2024-12-30 06:43:19', NULL, NULL, NULL, NULL, 'Q-0001', NULL, '9dd2c1c4-71b3-415c-97c5-f367661f31ed', '9dc46317-16e9-4e1b-b48c-facb13e65a93', 11);
INSERT INTO "finance"."customer_contract" VALUES ('9dda9209-fbf9-409c-a0c0-fa28e351147f', '9dc2661d-0ac1-4454-be08-552041d8b08a', NULL, NULL, '2025-01-01', '2025-01-31', NULL, 'Quotation', '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, 'Q-0002', NULL, '9dd2c1c4-71b3-415c-97c5-f367661f31ed', '9dc05df3-722e-4981-adaf-985ea2bf0af8', 11);

-- ----------------------------
-- Table structure for customer_contract_charge
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_contract_charge";
CREATE TABLE "finance"."customer_contract_charge" (
  "id" uuid NOT NULL,
  "customer_contract_id" uuid,
  "charge_id" uuid,
  "rate" int4,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "currency_id" uuid,
  "unit_id" int8,
  "quantity" int4,
  "amount" float8,
  "from" int8,
  "to" int8
)
;

-- ----------------------------
-- Records of customer_contract_charge
-- ----------------------------
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dd8b679-c8f5-41d9-8a66-4de5fca6e000', '9dd8b679-c4b4-4acf-8e72-64e59b412317', NULL, 3, '2024-12-30 06:43:19', '2024-12-30 06:43:19', NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dd8b679-c9c5-4017-8d2c-d288c0a7477b', '9dd8b679-c4b4-4acf-8e72-64e59b412317', NULL, 2, '2024-12-30 06:43:19', '2024-12-30 06:43:19', NULL, NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, NULL);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dd8b679-ca47-46d2-8167-21780c6aef68', '9dd8b679-c4b4-4acf-8e72-64e59b412317', NULL, 1, '2024-12-30 06:43:19', '2024-12-30 06:43:19', NULL, NULL, NULL, NULL, NULL, NULL, 1000, NULL, NULL, NULL);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dda920a-002a-4c3d-9df3-9750ec569965', '9dda9209-fbf9-409c-a0c0-fa28e351147f', NULL, 5, '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 300);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dda920a-00f9-4c30-b014-50b361050bcf', '9dda9209-fbf9-409c-a0c0-fa28e351147f', NULL, 4, '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 301, 500);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dda920a-01a6-46d0-aa5b-9dd4b9974181', '9dda9209-fbf9-409c-a0c0-fa28e351147f', NULL, 3, '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 501, 800);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dda920a-022a-409f-a476-fcdd41c06f1f', '9dda9209-fbf9-409c-a0c0-fa28e351147f', NULL, 2, '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 801, 1000);
INSERT INTO "finance"."customer_contract_charge" VALUES ('9dda920a-02c1-42b0-b401-1d3597a6f32d', '9dda9209-fbf9-409c-a0c0-fa28e351147f', NULL, 1, '2024-12-31 04:53:05', '2024-12-31 04:53:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 9999);

-- ----------------------------
-- Table structure for customer_email
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_email";
CREATE TABLE "finance"."customer_email" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_email
-- ----------------------------
INSERT INTO "finance"."customer_email" VALUES ('9dc2a5c4-95fe-4e20-a307-a2462021808d', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', 'hi@cnnindonesia', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_email" VALUES ('9dc2a5c4-9888-4c8c-b632-0fb12cdccacd', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', 'halo@cnnindonesia.com', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_email" VALUES ('9dc2a5c4-9982-40d1-a069-7ca1f3075e12', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', 'donotreplay@cnnindonesia.com', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_gst
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_gst";
CREATE TABLE "finance"."customer_gst" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "address_type" varchar(255) COLLATE "pg_catalog"."default",
  "arn_number" int4,
  "msme" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "hs" int4,
  "hsn_codes" varchar(255) COLLATE "pg_catalog"."default",
  "uam_number" varchar(255) COLLATE "pg_catalog"."default",
  "state" varchar(255) COLLATE "pg_catalog"."default",
  "nac_codes" varchar(255) COLLATE "pg_catalog"."default",
  "type_of_enterprise" varchar(255) COLLATE "pg_catalog"."default",
  "address" text COLLATE "pg_catalog"."default",
  "uin_number" varchar(255) COLLATE "pg_catalog"."default",
  "pan_mandatory" varchar(255) COLLATE "pg_catalog"."default",
  "composit_regular" varchar(255) COLLATE "pg_catalog"."default",
  "sez_valid_from_date" varchar(255) COLLATE "pg_catalog"."default",
  "sez" varchar(255) COLLATE "pg_catalog"."default",
  "pan_number" varchar(255) COLLATE "pg_catalog"."default",
  "sez_valid_to_date" varchar(255) COLLATE "pg_catalog"."default",
  "gst_registration_status" varchar(255) COLLATE "pg_catalog"."default",
  "passport_number" varchar(255) COLLATE "pg_catalog"."default",
  "tan_number" varchar(255) COLLATE "pg_catalog"."default",
  "gsg_id" varchar(255) COLLATE "pg_catalog"."default",
  "gsg_provisional_id" varchar(255) COLLATE "pg_catalog"."default",
  "gsd_id" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_gst
-- ----------------------------

-- ----------------------------
-- Table structure for customer_sales
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_sales";
CREATE TABLE "finance"."customer_sales" (
  "id" uuid NOT NULL,
  "location" varchar(255) COLLATE "pg_catalog"."default",
  "segment" varchar(255) COLLATE "pg_catalog"."default",
  "salesman" varchar(255) COLLATE "pg_catalog"."default",
  "customer_services" varchar(255) COLLATE "pg_catalog"."default",
  "credit_days" int8,
  "limit_amount" float8,
  "publish_credit_days" int8,
  "publish_amount" float8,
  "review_date" date,
  "override_amount" float8,
  "allowed_days" int4,
  "tos" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "customer_email" varchar(255) COLLATE "pg_catalog"."default",
  "auto_more_than_percentage" int4,
  "email_days" int4,
  "automatic_email_to" varchar(255) COLLATE "pg_catalog"."default",
  "sales_coordinator" varchar(255) COLLATE "pg_catalog"."default",
  "acc_handling_person" varchar(255) COLLATE "pg_catalog"."default",
  "note" text COLLATE "pg_catalog"."default",
  "invoices_to_email" varchar(255) COLLATE "pg_catalog"."default",
  "clearance_email" varchar(255) COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_sales
-- ----------------------------

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_type";
CREATE TABLE "finance"."customer_type" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "customer_id" uuid,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_type
-- ----------------------------
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-6edd-496f-8847-c5c8b6982fc5', 'Carrier Agent', '9dc2661b-6d58-4914-a021-1661d3932ee3', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-7181-45a2-8707-ebd879583298', 'Carrier Agent', '9dc2661b-6ff6-4510-923a-af76cf76bd83', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-744d-480c-a65e-5bd7259e3860', 'Carrier Agent', '9dc2661b-7290-4b51-9336-9915b350e075', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-772f-40b0-a28d-028e0a8de55a', 'Carrier Agent', '9dc2661b-7566-48dc-8e2c-f2826af1f55e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-7bba-4efe-ba3a-6d49faafc788', 'Carrier Agent', '9dc2661b-7918-454c-8163-32d5525f003c', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-8037-445e-a0e0-691f7da51a30', 'Carrier Agent', '9dc2661b-7d83-490a-9923-48d3413392b4', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-85b9-486f-a81f-6506e4a61271', 'Carrier Agent', '9dc2661b-833f-4eaa-9e0a-e06ee9a280bd', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-8a25-4fdc-9bf1-f0cf1142b23b', 'Carrier Agent', '9dc2661b-8790-4c0d-afc8-34f488fb406e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-8d55-461a-b701-a65c3b716c30', 'Carrier Agent', '9dc2661b-8b78-4d2f-923b-606ef7e93b00', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-9083-49d0-b4c7-5ece5401d76c', 'Carrier Agent', '9dc2661b-8eaa-48f7-9975-0cdf13d03f2e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-92e2-46b2-a798-3193af29eded', 'Carrier Agent', '9dc2661b-917c-4062-922a-41f44f49eba0', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-95b5-4867-84fc-7c07e12154ec', 'Carrier Agent', '9dc2661b-9429-49fc-a995-1e747c1aae0f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-9822-4690-ba36-c9b2142c41d7', 'Carrier Agent', '9dc2661b-96b4-4eb3-b747-f77b37c5bd23', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-9aa0-4f94-b616-18f6ccd80572', 'Carrier Agent', '9dc2661b-9928-4622-9f50-ac74ec431140', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-9d39-4a54-b1e5-a99533152627', 'Carrier Agent', '9dc2661b-9bc7-4919-adc7-ec379c1c8883', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-a0f9-4d3d-ae22-f104dbfdc020', 'Carrier Agent', '9dc2661b-9e7b-4054-bb8a-8923c5e53757', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-a58e-461c-a6c2-9b4581451d23', 'Carrier Agent', '9dc2661b-a2ad-4dfb-a779-2b2708c2838b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-aaac-4f46-a2be-c28bd5257e31', 'Carrier Agent', '9dc2661b-a81c-4252-ab12-5471b8e8e81c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-af2c-489f-bc89-e40dadaca408', 'Carrier Agent', '9dc2661b-ac7b-4fa1-b073-174e39fd58bd', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-b319-431d-9628-3018cd4886b4', 'Carrier Agent', '9dc2661b-b0f4-4794-b4b1-2c1aaeb344c6', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-b837-4768-bc63-c45bbd5ec3c1', 'Carrier Agent', '9dc2661b-b5f5-4cb8-9282-a951a42c739b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-bad5-423c-b95b-1b79fc7d42c0', 'Carrier Agent', '9dc2661b-b94d-4e38-9806-30891d864dcb', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-bd46-4982-936f-35e740f569d3', 'Carrier Agent', '9dc2661b-bbda-4681-b4b6-35a5b2846870', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-bfde-4b07-8be6-ecda2f0b4fda', 'Carrier Agent', '9dc2661b-be62-4044-9a8d-48535e840af5', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-c29e-4bd0-a903-5aae5acb2ba1', 'Carrier Agent', '9dc2661b-c107-4d3a-8ab7-900d43e0ce81', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-c561-43e8-a305-dba1f9fa0926', 'Carrier Agent', '9dc2661b-c3b5-4b1f-9871-3a3bbbec8778', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-ca23-484b-b5cc-234deee2ad2c', 'Carrier Agent', '9dc2661b-c74a-45d2-a8a1-17ff0c23b2ce', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-cebc-47ef-97f0-0a9666c807c1', 'Carrier Agent', '9dc2661b-cc03-442e-a563-e732ead347a4', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-d314-4e10-9bd6-bd9c2e173f2e', 'Carrier Agent', '9dc2661b-d06b-46d2-aec2-930a51a59807', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-d77a-4a68-80c6-1402db982e22', 'Carrier Agent', '9dc2661b-d50b-44f6-ab3b-d64de918bcb0', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-db36-44c0-9225-6ae8b14ba778', 'Carrier Agent', '9dc2661b-d952-43f8-8148-1a634f9eee15', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-de69-4e6e-8517-be478d756429', 'Carrier Agent', '9dc2661b-dc79-437f-b09b-46f99103d8e8', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-e1bb-40b0-a088-511c9a38951f', 'Carrier Agent', '9dc2661b-dfe2-4d91-af8d-a6f5dd98e94d', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-e457-4b39-b598-8c151c450247', 'Carrier Agent', '9dc2661b-e2eb-4ef7-a39a-4183f357a2a7', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-e6de-4649-b598-d2d127c5311c', 'Carrier Agent', '9dc2661b-e56b-41f6-8a13-5d2f6ca02307', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-e99c-47a6-92ff-19fa91617cab', 'Carrier Agent', '9dc2661b-e7e8-42e8-a891-3baf650df153', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-ebdc-44bd-9014-f0fb186ece42', 'Carrier Agent', '9dc2661b-ea90-4e3a-82ee-84ff1d5d6e4d', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-ef61-471b-bcd4-98e736aff0bb', 'Carrier Agent', '9dc2661b-ed36-41d4-9e6e-4cc0d852c81c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-f403-412f-8972-3478735ac0a4', 'Carrier Agent', '9dc2661b-f0e5-49b9-8473-855377cb303f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-f8c5-47c5-89f1-8ed303c8667d', 'Carrier Agent', '9dc2661b-f5ef-4abd-ab74-4e80e703b42e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-fd66-44ae-a6b5-f2cebab5d1fb', 'Carrier Agent', '9dc2661b-fa8f-4897-837c-d70e5202203c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-0157-41ae-85cf-b0acda2ef145', 'Carrier Agent', '9dc2661b-ff23-4cd2-8174-8eeda30c646b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-0430-429c-bf39-2ef639438b02', 'Carrier Agent', '9dc2661c-0291-42e0-837f-0dc4319f45a4', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-06b4-4862-b5ee-2cd7182346d2', 'Carrier Agent', '9dc2661c-0542-49ba-bdfc-84f5a6374ccd', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-092d-4bcd-ba41-4461cf48bd97', 'Carrier Agent', '9dc2661c-07b2-45c6-9f8c-924763520456', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-0baf-4dba-a0e9-87c89e6d2523', 'Carrier Agent', '9dc2661c-0a2d-4eb0-b9c0-2ac51d119237', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-0e20-4cb1-9920-7abefd2d1177', 'Carrier Agent', '9dc2661c-0cc1-474c-82e7-8120af4f9292', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-10a8-4170-873d-6328e80b89b5', 'Carrier Agent', '9dc2661c-0f09-45f1-90db-c2577882cbc9', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-1315-481f-9c8a-3c4c1277c8b9', 'Carrier Agent', '9dc2661c-11a2-4c0f-998e-36b307c4dc1b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-17f3-4bf7-8075-c0246f2d021d', 'Carrier Agent', '9dc2661c-152f-477b-a1bd-a7f21035ccad', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-1c29-4efe-91e8-51e202b0c320', 'Carrier Agent', '9dc2661c-19b5-4f34-821a-1c9efc49c983', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-213a-4218-9019-f0ec30456478', 'Carrier Agent', '9dc2661c-1de9-4885-9261-480eece5d0e3', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-2727-48e7-8931-944a507d51ca', 'Carrier Agent', '9dc2661c-2344-4292-96e6-c597ce616808', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-2a00-431c-8edf-b6f60632dd94', 'Carrier Agent', '9dc2661c-28ab-47f2-9414-338e9a1e282f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-2c71-4387-8777-3424d8a3ce31', 'Carrier Agent', '9dc2661c-2adc-4247-94f0-6102ef736545', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-2f2e-489e-8b3c-a0efcbaa40f4', 'Carrier Agent', '9dc2661c-2d70-4748-9697-c2ae63e205c5', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-31d7-455b-a047-862b31821ac1', 'Carrier Agent', '9dc2661c-3045-4bc5-b2c4-aea66b5f3ed1', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-3484-4c40-8763-c5d47b7e3b9a', 'Carrier Agent', '9dc2661c-32fa-4fed-bbe6-63d29d516d15', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-36ef-4114-93e1-eae3a5879d83', 'Carrier Agent', '9dc2661c-3599-4ed7-b99d-cad38de45136', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-39aa-4c17-bff7-f38fb1b765e3', 'Carrier Agent', '9dc2661c-37fa-4049-96f0-42754d23e349', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-3e07-461c-9e4c-79d2aece7dd6', 'Carrier Agent', '9dc2661c-3b61-4927-8e28-fe6db91bb41c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-426b-4cbb-abef-e36a318867fe', 'Carrier Agent', '9dc2661c-4011-4e59-a6be-c74048713723', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-4656-406c-bc4c-5712eccf8e7c', 'Carrier Agent', '9dc2661c-4419-4bb8-8842-b953bbe970ca', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-49dc-4d3a-86ff-8078e65b0436', 'Carrier Agent', '9dc2661c-47c2-4dfb-bd10-c7cbfbcff850', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-5061-400a-b10f-5999e8ac643b', 'Carrier Agent', '9dc2661c-4b8f-4a17-8bce-71ecd9fa6012', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-5392-4283-a7cf-00fa4e6b1896', 'Carrier Agent', '9dc2661c-51e5-46db-992f-19dd42c4cb4e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-5642-436d-b0b1-dcbe2beb21c0', 'Carrier Agent', '9dc2661c-54bb-4ac9-85ff-e093929ffa18', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-58e2-4b63-9538-60fafe34c360', 'Carrier Agent', '9dc2661c-575e-441f-92e9-d6b094293aaa', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-5b91-49b5-8de2-13221a70aa97', 'Carrier Agent', '9dc2661c-59ee-45a3-9efa-c10736f3a5fa', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-6020-4a10-b9ed-0bf06921e106', 'Carrier Agent', '9dc2661c-5c7b-4094-a774-08b391618d46', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-6400-4dd2-bf8a-b25d3e714d62', 'Carrier Agent', '9dc2661c-61a6-4537-9e54-d452c6195768', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-6885-47a2-887e-2e895d63fe67', 'Carrier Agent', '9dc2661c-65af-4b75-89cd-435f41533c42', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-6d0e-4b16-a2a9-d0a62a194d87', 'Carrier Agent', '9dc2661c-6aa7-42a9-97e2-325170e7c998', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-71d2-4e17-af39-f97a4f6fff45', 'Carrier Agent', '9dc2661c-6f50-4589-8590-c833698757f7', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-75ce-4139-8873-453e0ff670f1', 'Carrier Agent', '9dc2661c-738b-4b57-a72a-a22debf27b71', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-7903-43e6-b39a-8eb4fe024f85', 'Carrier Agent', '9dc2661c-772a-4e3c-b39a-f4b65be2a8c3', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-7c14-43bc-9974-5a6ad958284c', 'Carrier Agent', '9dc2661c-7a5e-4ceb-9a40-e7fca4852e71', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-7ed1-4a8b-a0d1-4d80c6b67aaf', 'Carrier Agent', '9dc2661c-7d49-4d2a-a4e0-569217ea652b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-80fe-401a-bc3f-c6e933a37f3b', 'Carrier Agent', '9dc2661c-7fb8-48f6-8a86-c7789bce6e2d', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-82ff-4084-8336-06205ccd6b0f', 'Carrier Agent', '9dc2661c-81c8-40f7-8241-3cedaf2f9319', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-8539-4258-88b1-b6528830d49c', 'Carrier Agent', '9dc2661c-83d9-49e6-b2a7-df37500a823e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-73ec-4930-93f5-2c4b738cc61a', 'Billing Customer', '9dc26619-6d4f-4d87-8dac-c6c99d9baed6', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-770c-4945-b2a6-373986adce16', 'Billing Customer', '9dc26619-7555-42db-be4f-519bcba1df29', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-797a-499e-b0c6-ca5a275c9b70', 'Forwarder', '9dc26619-77ef-4165-bab5-0d338e719063', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-7c8b-474f-8324-0495e3619740', 'Forwarder', '9dc26619-7a4e-485a-9645-239f587f8bf8', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-80c7-4b0a-a295-289eef6eb00f', 'Shipping Line', '9dc26619-7e5f-4713-b0b4-ee404e65b590', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-85b5-47dd-9ec8-14e0ad4c0e5b', 'Shipping Line', '9dc26619-82b1-488a-9051-deabc052b78d', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-89e1-4c45-9db5-4ccfa16f60cc', 'Shipping Line', '9dc26619-8753-49cb-ac0b-813cfc7aff51', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-8e60-415f-97b5-1247c828eea9', 'Shipping Line', '9dc26619-8b8c-4542-95ec-e30cf30ed8fc', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-916b-4f83-a1b2-4904da921a6c', 'Shipping Line', '9dc26619-8f96-4f6a-ade7-ca416831dc19', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-943a-4bba-abbd-0afba21e37dd', 'Shipping Line', '9dc26619-927e-43b4-b3a5-94ffb8e70466', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-968f-404d-a379-1c583542b57a', 'Billing Customer', '9dc26619-7a4e-485a-9645-239f587f8bf8', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-9943-4463-bebe-1cdd82fe50bd', 'Handling Agent', '9dc26619-9796-492e-a0a7-2bb876dadfc8', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-9bc0-47d9-9fe5-d16960ac094a', 'T1 Sub Address', '9dc26619-9796-492e-a0a7-2bb876dadfc8', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-9e4d-48bd-82dc-f43b05092e54', 'Shipping Line', '9dc26619-9caa-4f19-8319-b10b69d78556', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-a0e7-41bf-aca3-77061f7bb298', 'Shipping Line', '9dc26619-9f43-4ef5-9490-d64633fcd6d8', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-a477-40fa-a6d2-50e5a59fcecc', 'Shipping Line', '9dc26619-a1ca-414f-8bc2-8451076b3ebb', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-a88d-48ac-9e7c-fd25d276120e', 'Shipping Line', '9dc26619-a62d-4e18-a36e-3f011b3daa65', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-ac37-401a-9b32-51ffbf589f34', 'Shipping Line', '9dc26619-a9df-49cf-bc5f-3f6a1204738e', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-af90-4690-855c-a7b87add2173', 'Shipping Line', '9dc26619-ad67-4efe-8594-7a2806d3952d', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-b2c6-4ba1-b510-b4873a770c21', 'Shipping Line', '9dc26619-b0ba-4635-903d-362caf0e8aa2', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-b641-45d4-ae1e-9d5267c3b93d', 'Shipping Line', '9dc26619-b40b-4f63-9e3f-d01279459dc6', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-b961-4f30-a4e7-a428ab916e1e', 'Billing Customer', '9dc26619-77ef-4165-bab5-0d338e719063', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-bc81-4704-aeec-631b6baeb297', 'Trucking Company', '9dc26619-ba8b-4f0a-9600-82af8e83028c', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-bf7a-4993-8534-b80cf21de9ec', 'Trucking Company', '9dc26619-bd97-436f-89c7-df65a0cac253', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-c26c-4e7a-94ca-32493f3532dd', 'Dubai Port', '9dc26619-c08c-4785-8e5e-f70568859a24', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-c58c-40cd-9eac-171c1981d7a6', 'Dubai Port', '9dc26619-c387-43f5-a104-942f99246f48', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-c890-447d-a815-f4ae61da8ca5', 'Carrier Agent', '9dc26619-c6be-47a8-9c92-06255f284414', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-cc15-47e4-9eb0-4a58b69d4919', 'Carrier Agent', '9dc26619-c999-44bb-81e2-271b78575102', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-cfaa-4426-8b50-2dd94e287b65', 'Shipping Line', '9dc26619-cd83-481b-a03c-cbe9e8053081', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-d2fa-4813-9f72-66b547fd649c', 'Shipping Line', '9dc26619-d0e0-4c05-9a55-3d43aa18af44', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-d6d1-45db-afc8-c581755d0918', 'Shipping Line', '9dc26619-d453-4a56-9c14-d34ce5b51eed', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-da64-4c07-bf2d-821a306578b9', 'Shipping Line', '9dc26619-d837-41af-85f4-f9507e1c5c0f', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-ddf2-4c52-963f-2f0f4f879435', 'Shipping Line', '9dc26619-dbe3-4851-9539-65cc9356cf73', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-e0db-4b26-a3ee-47f631095840', 'Corporate', '9dc26619-df23-434a-86d8-94726a735785', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-e38a-4d60-8a99-77d4b49a4701', 'Corporate', '9dc26619-e1dd-4cab-9708-4bd84f55ea0b', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-e638-46a7-b717-d034ff403812', 'Shipping Line', '9dc26619-e481-4462-96eb-e89f4eded6c4', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-e928-434b-8499-77a773f9bf47', 'Shipping Line', '9dc26619-e74f-4ecc-bcaa-d04844574a98', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-eb88-496b-a92b-0f68deb42acd', 'Shipping Line', '9dc26619-ea0f-4af6-bd20-ac0d9292a77d', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-edee-4b68-9ae2-443f44638beb', 'Shipping Line', '9dc26619-ec5c-454c-96a8-9a6aa2df3be5', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-f0ac-42f3-a414-bbe3001432f4', 'Shipping Line', '9dc26619-eee5-4692-b0db-9470e36114f2', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-f46c-469e-8a7d-c2bafd14d0ef', 'Shipping Line', '9dc26619-f21a-4e89-b7e5-22732838b652', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-f81c-48da-9fec-18e5f39e3620', 'Shipping Line', '9dc26619-f5e8-417f-adda-49a0bf60e325', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-fc0a-43f3-9a3b-f7b16126ef34', 'Shipping Line', '9dc26619-f963-4425-a500-2715cb37ae2e', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc26619-ffc4-45c1-86c5-115aca3641e0', 'Shipping Line', '9dc26619-fd6e-4106-a5f8-08cecd31e5c1', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-0336-4e8b-8961-3feb9aa27fdd', 'Shipping Line', '9dc2661a-0115-4cf6-882a-0cfd96f537fc', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-06a8-47ef-9a41-07b42e2f2b39', 'Shipping Line', '9dc2661a-046e-46cb-9e95-b9a23e11171a', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-0a03-43e8-b711-7f166ba2ad3f', 'Shipping Line', '9dc2661a-07f4-4d80-aea7-9081a5f3767f', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-0d40-4d84-a520-4dea795aab6b', 'Shipping Line', '9dc2661a-0b2a-4bd6-a804-f3b7448cada6', '2024-12-19 04:30:21', '2024-12-19 04:30:21', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-1061-4abb-b771-9b47708a07b9', 'Shipping Line', '9dc2661a-0e85-4147-984a-35edfec5c489', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-12d7-408c-9aec-add1f5efcd45', 'Shipping Line', '9dc2661a-1149-42a2-a547-a08c0cde7667', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-15bd-46a1-85a7-4bad682ac5fe', 'Shipping Line', '9dc2661a-13df-40b5-a842-c39dbd5707e8', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-1923-46e5-beb0-fa9ccf5c15ad', 'Shipping Line', '9dc2661a-16d3-4418-b7d9-58a436a137e2', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-1d0c-47bc-8672-98fab87a9c6b', 'Shipping Line', '9dc2661a-1a98-41d0-aca2-c3ac77d1f6f8', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-2143-447a-989c-8679e8518e68', 'Shipping Line', '9dc2661a-1e7f-49c1-a093-b23fd04ad2c4', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-24ca-4612-8ba8-ef5bd392aa78', 'Shipping Line', '9dc2661a-229f-4565-8baf-c90693ba3d06', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-28b1-4e57-a10f-620651c7d771', 'Corporate', '9dc2661a-2637-4517-bc46-ba39c8feef88', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-2c03-466e-a404-d9eac51b932c', 'Carrier Agent', '9dc2661a-2a53-44c1-b62d-030c1f33f16d', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-2ec9-43d8-8416-451958379d02', 'Carrier Agent', '9dc2661a-2d42-4924-ab6b-52c0c23de708', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-3129-4fa4-bfba-0d49c4905541', 'Carrier Agent', '9dc2661a-2fc2-4e77-8614-f65a8b2d66b9', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-33c3-4c28-a7d2-eb55bf476c0d', 'Carrier Agent', '9dc2661a-323d-47ff-afc7-e6667430f7ed', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-3677-49c7-b19e-4d821b87fc35', 'Carrier Agent', '9dc2661a-34e3-4208-8351-d07b579f09a4', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-38e2-4d0b-bb67-ec2fdc7ca1bc', 'Carrier Agent', '9dc2661a-3770-4552-a359-1db6ea38da33', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-3b3b-4216-b9ad-4f8555f9361a', 'Carrier Agent', '9dc2661a-39e6-4875-ab64-8ea480712442', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-3d7c-4096-a1ea-e55b3a6f4924', 'Carrier Agent', '9dc2661a-3c2a-4a5c-87fb-a8df41b530e5', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-4063-443a-8792-49170a6894b0', 'Carrier Agent', '9dc2661a-3e95-4cec-a70d-463dfd422b5e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-43dd-49b8-91cf-f1271bc5e53d', 'Carrier Agent', '9dc2661a-41ae-4a3e-b62d-5e770a193254', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-4755-4af0-8d80-4f261a108ecf', 'Carrier Agent', '9dc2661a-454d-4168-80ff-7c274e171d4f', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-4aec-4027-abc3-7cf481cebcd5', 'Carrier Agent', '9dc2661a-48e9-44fd-8c58-4fdf3a7e5b72', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-4e10-46a5-98aa-2ac2b34ff5fe', 'Carrier Agent', '9dc2661a-4c25-49ea-8aed-cece2eee33a6', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-5190-4333-aa70-6d706474374c', 'Carrier Agent', '9dc2661a-4f7e-4ac8-9789-611ec5e09b38', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-5476-4570-8dea-ab1443d9ae04', 'Carrier Agent', '9dc2661a-52e4-495c-8206-f7036278936b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-570c-4a78-8ae3-c1ed9bbc9f84', 'Carrier Agent', '9dc2661a-5582-412e-85f1-82385e4f4c48', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-59a2-45c9-829b-ad2a25985364', 'Carrier Agent', '9dc2661a-5812-407c-9fc9-c63541dd14cc', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-5bfb-4864-bf73-509a08645451', 'Carrier Agent', '9dc2661a-5a91-4761-b0d9-b662a6e35d90', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-5e48-43f5-af9f-47c8593a74d1', 'Carrier Agent', '9dc2661a-5ce0-48f6-952f-82766210a061', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-60e6-45b0-ae39-5582a05c7b6e', 'Carrier Agent', '9dc2661a-5f54-4ab7-a766-71c5be3f5e41', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-634b-4f7b-89f4-f5c1d9438218', 'Carrier Agent', '9dc2661a-61ea-4ad6-87e1-1e5583a961ce', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-65b0-493b-b609-4c867b1e0136', 'Carrier Agent', '9dc2661a-643e-4a6d-b662-82241e0ace4f', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-68ee-45ed-a751-756b8203b4a7', 'Carrier Agent', '9dc2661a-6700-4929-9367-0774e9134aff', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-6c6b-4d52-8071-5ae76a44fd33', 'Carrier Agent', '9dc2661a-6a68-46c5-a0e7-c9885a7d6a75', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-6fd4-4b6a-9ccc-3600c86bfbfd', 'Carrier Agent', '9dc2661a-6dbb-450c-b44d-aa412a90b9bc', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-73eb-474e-aead-c75b137c8347', 'Carrier Agent', '9dc2661a-7126-4877-b6b5-a6b661401292', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-77cf-4b0e-860f-eae326654fff', 'Carrier Agent', '9dc2661a-756b-447c-9060-4da9da11eec7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-7abd-4e8d-aae2-e77e04bc34b3', 'Carrier Agent', '9dc2661a-793b-4f19-bb14-4c9718fde1a4', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-7d31-46ed-82c0-5c3431f6a1d2', 'Carrier Agent', '9dc2661a-7bca-47e8-a330-8ceb3a3357a9', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-7f50-4625-8ccb-18c896969fd9', 'Carrier Agent', '9dc2661a-7e0b-4a92-bf26-655a6555ee85', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-81a1-4409-8db2-531287b9eca7', 'Carrier Agent', '9dc2661a-803c-4b8f-ba41-8e77732b1308', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-8401-427e-b686-435879111007', 'Carrier Agent', '9dc2661a-8297-4292-9b32-0c37931e8a02', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-868e-4490-9946-89382de12cc1', 'Carrier Agent', '9dc2661a-84ff-4829-8934-fbe5120cdd93', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-88f4-47fa-8620-16fe407f8175', 'Carrier Agent', '9dc2661a-877d-47ab-9201-a05c614e3dbb', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-8b9d-4f95-bb64-5d04442c6405', 'Carrier Agent', '9dc2661a-8a10-489b-a664-f478cf5fd2be', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-91ff-47a9-a8ae-5144948ec9d3', 'Carrier Agent', '9dc2661a-8cd1-4b93-817d-2e9a33327243', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-966c-4c1e-b82b-6214a40cdf56', 'Carrier Agent', '9dc2661a-93e9-431b-aa2b-aee3016cf540', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-9a94-47c3-bb96-46b1f03099fc', 'Carrier Agent', '9dc2661a-980d-4df1-9072-22e34cf69611', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-9e4e-40d3-970f-d956a55b66d6', 'Carrier Agent', '9dc2661a-9c29-4347-96be-abe802588448', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-a1c4-4fe7-9166-537afd2b2b58', 'Carrier Agent', '9dc2661a-9ff8-4526-b038-5e2a27d29c31', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-a441-4592-a72c-ba2ed145124c', 'Carrier Agent', '9dc2661a-a2c7-4ce3-b3a1-bccf34160ac8', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-a6c7-41fa-b512-789be6ed89b6', 'Carrier Agent', '9dc2661a-a561-4811-b81f-b50a98210723', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-a93b-4b20-bf00-1b91c68d3597', 'Carrier Agent', '9dc2661a-a7cd-4e05-b41d-fd860128f985', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-ab67-4429-b828-c57692731453', 'Carrier Agent', '9dc2661a-aa13-4d5e-b2e9-0ed00f2fad91', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-ade5-488d-895c-ce8aea3e9209', 'Carrier Agent', '9dc2661a-ac64-4c1e-bccb-0baddf88f632', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-b030-496e-abc3-a976ee3adb91', 'Carrier Agent', '9dc2661a-aed1-45fa-830c-91de0b939741', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-b29c-4ea0-8127-7208995fdec0', 'Carrier Agent', '9dc2661a-b13c-4a66-96e9-404c6cf53812', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-b51c-488e-be57-1f4641cc9be8', 'Carrier Agent', '9dc2661a-b38c-45be-a319-a447fcde0e34', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-bd53-41a8-bc54-b8a7b1793811', 'Carrier Agent', '9dc2661a-b67a-482a-9c79-a1b469f82479', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-c123-478c-8a99-ac7e32c52c6c', 'Carrier Agent', '9dc2661a-beeb-4e72-9e82-eef93e400d1b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-c503-480d-a11b-e831fd75cf51', 'Carrier Agent', '9dc2661a-c2b5-4c92-b8eb-c696e2e4b683', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-c8c2-40cb-8ebd-6805cb310717', 'Carrier Agent', '9dc2661a-c6b2-4b72-84ef-4a3c5fba72f7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-cb90-41fd-9743-27a5d6ceb40a', 'Carrier Agent', '9dc2661a-ca02-482d-980f-fda7b5c482ee', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-ce02-49c6-8942-a46e460edcce', 'Carrier Agent', '9dc2661a-cca7-417b-8b80-332d75296970', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-d019-4dcc-8e55-e7f687c7e384', 'Carrier Agent', '9dc2661a-cedb-4eac-97e4-3c4cf7094567', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-d29a-40eb-a191-92f196fee986', 'Carrier Agent', '9dc2661a-d0f2-4a1f-8fd3-d75623cdde7e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-d514-4a7d-a5eb-c5a71961ea9a', 'Carrier Agent', '9dc2661a-d38f-4f1b-80b5-9d419e0d9696', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-d778-409e-ad3e-d79164dc9e61', 'Carrier Agent', '9dc2661a-d621-40a8-b6a3-70d6fec06641', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-d9e6-4df9-93df-3e75dd9ce514', 'Carrier Agent', '9dc2661a-d88c-4ce0-a90e-e9f394581b44', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-de10-4c6b-9773-65192b9dd3ea', 'Carrier Agent', '9dc2661a-db6f-41b9-b34d-16a83174016a', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-e227-40bb-9254-6395ae7aca60', 'Carrier Agent', '9dc2661a-dfee-4601-813a-79fb3470241d', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-e601-415b-9312-05b6d75e0908', 'Carrier Agent', '9dc2661a-e3f5-4b22-a93d-b0d30533ab70', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-ea74-4c52-b1a4-a6f4a283c5ec', 'Carrier Agent', '9dc2661a-e7f9-4ca0-a60e-821055479063', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-ef27-4f8e-a48b-40ba83fd8c27', 'Carrier Agent', '9dc2661a-ec92-443a-a12d-6c7e1f7bb8d3', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-f253-4b06-856d-81a55a701e4c', 'Carrier Agent', '9dc2661a-f07b-4989-9b79-60c4cb585fd4', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-f528-4ca7-b06a-c2b079ed1395', 'Carrier Agent', '9dc2661a-f37c-434c-ab02-c437f4f3ba4a', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-f783-461b-b63b-9fa82ca9e531', 'Carrier Agent', '9dc2661a-f630-4abd-b762-8fd1f84ea1d9', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-f9b5-443d-a4c4-eae242d404c7', 'Carrier Agent', '9dc2661a-f877-4cf7-bcd3-003a297375e2', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-fc09-4c0c-96ba-a684355e7bfc', 'Carrier Agent', '9dc2661a-fa8a-4909-b1e1-4dd833e69032', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661a-fe1e-40c7-83aa-0612a164d95c', 'Carrier Agent', '9dc2661a-fcea-41a9-9908-a1664606307b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-006d-4fe0-91d1-8dfd7b2cc8bb', 'Carrier Agent', '9dc2661a-ff30-4a49-924f-7c2d46e9b264', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-03b6-44c9-8876-6d659fa1e8a9', 'Carrier Agent', '9dc2661b-0143-4ff3-8ea1-07205a25c940', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-0816-4c32-899a-fa38abf91feb', 'Carrier Agent', '9dc2661b-0584-44d0-88a7-df83b53416e5', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-0c0d-425b-8ae8-63e14bd80996', 'Carrier Agent', '9dc2661b-09b9-4dcc-b669-eeb07a5eb111', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-1046-4862-8dbc-e8f3e6905f91', 'Carrier Agent', '9dc2661b-0deb-4b7a-bf05-43cebcad904d', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-146c-47b1-b0df-7fa1c67ae47f', 'Carrier Agent', '9dc2661b-1205-451e-914a-8443f5e71b80', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-1869-4c06-862c-9b54b927a0ff', 'Carrier Agent', '9dc2661b-1654-4b6d-aa29-9fd5864f79c7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-1b90-4dd0-a345-4b6086bbb3c9', 'Carrier Agent', '9dc2661b-19c3-4eb1-a76d-acfa7e89ed27', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-1e93-41ff-bd7a-0e92b17f78f1', 'Carrier Agent', '9dc2661b-1cd4-4d48-bfff-9e75e1101723', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-217b-4c45-900a-96f432b8cf51', 'Carrier Agent', '9dc2661b-1fc2-4a8a-8117-6dd9ddff76a3', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-2474-4b81-8dbe-cdf46d4eb10e', 'Carrier Agent', '9dc2661b-22b4-4e85-9ce5-a6fe94228851', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-2769-43d8-8900-103565857d5a', 'Carrier Agent', '9dc2661b-25a4-4e39-b1fb-5d52e0b74081', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-2b23-4458-8c48-9931918ad3cc', 'Carrier Agent', '9dc2661b-288a-40e1-8e2a-21ee2437a41c', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-2fa4-458f-a6f6-88e38bcca5ae', 'Carrier Agent', '9dc2661b-2d0d-4b17-85fc-2058a888bfad', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-3436-4377-8756-dc0a19742360', 'Carrier Agent', '9dc2661b-31a7-4776-bbc6-478e0cd63eb7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-3829-4183-aabe-476fcacbd3d4', 'Carrier Agent', '9dc2661b-35cf-48ae-ac10-ead037a855bc', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-3ba1-4adf-b692-d3a251c81782', 'Carrier Agent', '9dc2661b-397a-4634-884d-e15e3841c439', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-3eaa-402b-b533-531e2336a717', 'Carrier Agent', '9dc2661b-3d0c-4f42-a5be-13cd04fa792b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-40ea-4e8e-8198-b3565c7d9b76', 'Carrier Agent', '9dc2661b-3fa4-4822-b319-5230e105eca9', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-42e1-4550-808c-63a985dc9a0d', 'Carrier Agent', '9dc2661b-41b5-4d29-a365-0556ec4f8f1d', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-451a-48cb-8482-d78057bf533a', 'Carrier Agent', '9dc2661b-43bd-4b51-9ef8-7a2bcc0adae7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-475d-44fe-9bc0-3af882cabecb', 'Carrier Agent', '9dc2661b-4601-408c-80aa-77b7b12e3978', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-49a7-4fa3-b698-47af4e1b152d', 'Carrier Agent', '9dc2661b-483f-47ff-b868-518911fa47e2', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-4c50-4bb1-90b7-912a5b0d344d', 'Carrier Agent', '9dc2661b-4acf-4670-8857-68aed334878b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-4e80-4212-a374-3be709edf4fc', 'Carrier Agent', '9dc2661b-4d3c-4439-8754-c825efb4444f', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-5265-48be-9c41-c059fd473fe2', 'Carrier Agent', '9dc2661b-4f5e-4f21-8055-51d1e8e7b4d7', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-56a5-419f-a3c4-4c5c45930560', 'Carrier Agent', '9dc2661b-540d-4d0a-8470-a6d0c685f600', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-5ac8-439a-aeae-d78926211e44', 'Carrier Agent', '9dc2661b-5864-4fbf-9487-f27078b3b923', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-5fd6-4529-87fd-2d52eb6b21b3', 'Carrier Agent', '9dc2661b-5d7c-4877-8388-118c87debbdb', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-63e5-4c9e-aa06-47178e94de1c', 'Carrier Agent', '9dc2661b-6185-4b15-b1e8-6e7e379bcefd', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-66cc-421e-8c91-90f96aaf9dd2', 'Carrier Agent', '9dc2661b-6520-4b01-ae41-25fb5294459b', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-6994-429c-a0da-bf52d213369d', 'Carrier Agent', '9dc2661b-67f8-4bb7-b4fd-65b6ba7096bf', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661b-6c40-4317-a88a-40809fc38572', 'Carrier Agent', '9dc2661b-6aad-4419-b011-d1cf9223d05e', '2024-12-19 04:30:22', '2024-12-19 04:30:22', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-8776-4c08-af9e-00d3b850099e', 'Carrier Agent', '9dc2661c-8623-48d0-a890-1ae972a191b0', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-8b66-4af3-a658-5528149458e9', 'Carrier Agent', '9dc2661c-88c2-4a9b-8b90-b9376354163b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-8fbc-4fa4-9cf8-bd71973f54f0', 'Carrier Agent', '9dc2661c-8d15-41c6-a51a-9fc80f8dbd7c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-938d-47f7-95a1-3145cfaf6010', 'Carrier Agent', '9dc2661c-9182-4f8b-aa19-31d6338e6dab', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-9773-47f6-b70d-ec7d38ed110f', 'Carrier Agent', '9dc2661c-9547-4dbb-9834-c0addc5a1382', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-9b5c-42e5-ab5e-25ab416d1fb1', 'Carrier Agent', '9dc2661c-995a-4f92-8178-70127c367427', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-9e1e-455e-bff0-cb22e3c6b484', 'Carrier Agent', '9dc2661c-9cb6-4d72-b054-7a5a5705297e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-a06e-4872-ac97-275eeb092b5a', 'Carrier Agent', '9dc2661c-9efa-4b5a-a7f6-e873722e815c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-a2f2-4e5d-86b7-2111466ffa65', 'Carrier Agent', '9dc2661c-a17e-4c1d-ba7d-3210719a0b4f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-a546-4a18-ad5b-22da86050f2f', 'Carrier Agent', '9dc2661c-a3ee-4d91-b895-e2e0fdb095f2', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-a75d-4329-9a5c-5c9e5d1c1758', 'Carrier Agent', '9dc2661c-a628-4da7-a2ba-ce06bc00f1ad', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-a9a6-44d1-837b-95a09a860fe0', 'Carrier Agent', '9dc2661c-a869-4957-a561-19b2986a28de', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-abba-4e63-abc2-0058d98aedf6', 'Carrier Agent', '9dc2661c-aa74-4fa3-bb04-01b6bc433e0a', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-ae16-44c4-bb05-14ab95c4294c', 'Carrier Agent', '9dc2661c-acd4-40a4-8c32-1df9dff3828b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-b072-4201-a7a3-d1594fda03e4', 'Carrier Agent', '9dc2661c-aee4-4644-a944-2ed34cfd2538', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-b32d-403a-8448-851136d0ffdb', 'Carrier Agent', '9dc2661c-b185-4592-9cef-c4f191533142', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-b652-4c6a-972c-1d6c28fbbede', 'Carrier Agent', '9dc2661c-b482-431d-9ede-d48814fd822e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-b977-4eb3-b718-4584a4ce66c7', 'Carrier Agent', '9dc2661c-b766-46a2-a3a2-e5c3b561760b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-bdd0-406e-bb60-d437fd87d151', 'Carrier Agent', '9dc2661c-bb11-4b31-82e3-4fcf55b99f4f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-c1bf-4ae1-a968-f0ba8e75da1c', 'Carrier Agent', '9dc2661c-bf9c-46aa-b606-363e4ccd28e1', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-c522-491a-aa10-86a582380782', 'Carrier Agent', '9dc2661c-c33a-4165-acd1-22b150f09050', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-c7ef-4e17-a67a-af9b969eb2b5', 'Carrier Agent', '9dc2661c-c649-4ac8-8228-769a7b412fba', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-ca90-4185-92c4-24f58eaeae56', 'Carrier Agent', '9dc2661c-c90b-4f67-9fd9-b9dea0bbf4d9', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-cda0-4ebf-bf66-d6d2cf651a8a', 'Carrier Agent', '9dc2661c-cbfa-4e64-a86d-11f79f436142', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-d01a-4ea2-8310-b0b22ad517bf', 'Carrier Agent', '9dc2661c-cea7-450c-bd6a-9646bf2cdf28', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-d287-40e3-a697-f91dba506275', 'Carrier Agent', '9dc2661c-d10e-4dbd-a935-9ae26d6fa878', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-d4fb-4905-be15-4c4631a03599', 'Carrier Agent', '9dc2661c-d38e-4f65-b7e9-718b1dfd9a2d', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-d871-40eb-8792-cc580d84f2a4', 'Carrier Agent', '9dc2661c-d5e8-4184-af71-5c435caeea5b', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-dd08-4e02-9860-7cb4270fff03', 'Carrier Agent', '9dc2661c-da69-4f89-a85d-4a90b1b557f7', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-e13e-4eee-a64e-51a16851d2c1', 'Carrier Agent', '9dc2661c-ded1-4af6-b6ec-432247418951', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-e714-4329-8ec2-9e165e0d241e', 'Carrier Agent', '9dc2661c-e2e4-451a-b72c-eb668c9b19e3', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-eae9-4ac0-9338-84c0a40c9743', 'Carrier Agent', '9dc2661c-e8d2-4396-a385-2b960dd4433c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-ed2b-4139-bde5-801c38ef43e9', 'Carrier Agent', '9dc2661c-ebd5-4b05-a238-66ace434ebe1', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-ef7b-4392-b043-a4af956f8cde', 'Carrier Agent', '9dc2661c-ee24-4189-83b1-ce5169b9e908', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-f1a4-4ee5-9918-a94dba55bf3c', 'Carrier Agent', '9dc2661c-f05b-4d2f-9c9e-eac1ed06239e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-f3b6-4f93-abbb-201487317dd2', 'Carrier Agent', '9dc2661c-f27e-493d-a8d8-e02e27448ba4', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-f5e5-4bfa-9526-b3f2c750ac84', 'Carrier Agent', '9dc2661c-f493-4b82-bb9f-781209f17e8f', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-f89c-4504-95a7-2d45aaac86e8', 'Carrier Agent', '9dc2661c-f6ce-488d-ab23-c687bcce9d4d', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-fb1a-4253-89c4-67f5e657597d', 'Carrier Agent', '9dc2661c-f9a1-4887-9747-1cc1f2e93bfc', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661c-feed-4f3d-9fcf-e6335c8f5750', 'Carrier Agent', '9dc2661c-fc19-4ade-8939-38338db20da7', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-044f-4eb4-a0de-51dcbf2d3532', 'Carrier Agent', '9dc2661d-00b5-40b4-aef7-a56664727393', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-090a-40b6-8b0f-42a20a5d614b', 'Carrier Agent', '9dc2661d-064e-481b-aaca-88ada62f336e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-0d16-4292-8a8e-d51cb781b579', 'Carrier Agent', '9dc2661d-0ac1-4454-be08-552041d8b08a', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-1122-4d3d-9e7b-2bde02463a20', 'Carrier Agent', '9dc2661d-0ee1-4e25-a8da-da9ee00592c9', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-1465-4258-9bf3-05ef1dee74b4', 'Carrier Agent', '9dc2661d-12ca-4244-a446-278b9337bbe3', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-16f6-40a6-a73f-68996235d2ce', 'Carrier Agent', '9dc2661d-15a2-4086-97c7-ddd228eb907c', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-193a-45b2-a0a2-b92c0845ba9d', 'Carrier Agent', '9dc2661d-17f4-4e4f-b30e-2fb2dd0c06b7', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-1b7a-4e7d-933e-e73958506a1f', 'Carrier Agent', '9dc2661d-1a2b-4879-a5e2-a5ccabacba5e', '2024-12-19 04:30:23', '2024-12-19 04:30:23', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-1deb-46ca-acd7-9015bff4f5ff', 'Carrier Agent', '9dc2661d-1c84-4b60-b997-24917aa9206c', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-2073-4488-97f2-e5fdcdf4f4dd', 'Carrier Agent', '9dc2661d-1ef9-4720-baff-36c2249c5aa0', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-22ef-4173-9730-90e84868a8f1', 'Carrier Agent', '9dc2661d-218b-475c-9e02-100631cfae53', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-2628-49b1-a184-b5646801dd48', 'Carrier Agent', '9dc2661d-23da-4990-be91-a8b8548c1844', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-2a71-4199-a7c8-fc87e4ff96ec', 'Carrier Agent', '9dc2661d-27e9-4152-b556-38f7fa4e1019', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-2f8e-4833-8979-c92b69a50850', 'Carrier Agent', '9dc2661d-2ca8-4147-903e-3b407ede465f', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-3a1a-45c1-a755-944f1fc2d9ca', 'Carrier Agent', '9dc2661d-3176-4a32-8fdd-2ea180f09f43', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-3d68-42ff-b5dc-bf827a1328f7', 'Carrier Agent', '9dc2661d-3b89-46fc-9712-0ca3641472b8', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-3fb7-46de-b478-3f6a6eb90f45', 'Carrier Agent', '9dc2661d-3e63-43b0-bf1a-bd613a7473f7', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-41f0-4a58-9a84-662b055414c1', 'Carrier Agent', '9dc2661d-4097-4bbc-8135-2bf2980052b8', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-442d-4a3a-93c2-aaf200a711b4', 'Carrier Agent', '9dc2661d-42e3-488d-a25a-2b38562e6400', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-466f-4090-b13e-2b726891a0c3', 'Carrier Agent', '9dc2661d-4511-4a99-b321-b7dedd013bc0', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-48a7-48c1-ab84-e9c536ec87ca', 'Carrier Agent', '9dc2661d-474b-43b0-b31d-dce6ee9d8a25', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-4ad1-4941-a654-b9c2286f51fe', 'Carrier Agent', '9dc2661d-4991-4018-bf35-67234b671f22', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-4e86-4b6a-a703-08bb79f71ce4', 'Carrier Agent', '9dc2661d-4c03-4495-8e4d-790da1c36184', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-536b-4331-8a8e-d2baba97c128', 'Carrier Agent', '9dc2661d-5074-49a0-8a36-a856c3a80835', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-590f-492b-8c1f-914eb8dd0a0b', 'Carrier Agent', '9dc2661d-5563-4191-9f48-c0b5e320c5d2', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-5ed3-4cc2-b12a-cee13ff7477e', 'Carrier Agent', '9dc2661d-5ad5-4b26-900a-5c2a9bda4ade', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-61e9-4327-819f-8b56e18fcf21', 'Carrier Agent', '9dc2661d-6076-4bfe-b73d-ec421154bf9c', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('9dc2661d-644a-4faa-8704-5094734bbb5a', 'Carrier Agent', '9dc2661d-62e9-4a70-810b-c73854b9ac9e', '2024-12-19 04:30:24', '2024-12-19 04:30:24', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."customer_type" VALUES ('bbbb8aa4-dccd-4de1-b62c-b81e14031e9a', 'Billing Customer', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('1f7f6dbb-3c6e-4862-8a64-bfeb485dac3d', 'Carrier Agent', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('2580665b-8806-4ce6-9ba7-805d7f1157ef', 'Consignee', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('561eebd0-121b-4bed-95d2-550e64563c5d', 'Corporate', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('af27116d-e0e0-45a4-bfb3-3e919e1aa511', 'Custom Stop', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('df8d9b2e-9298-4972-bbce-2a7817162239', 'Final Delivery', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('18d6ef05-3a26-4eff-b139-37996aa0695e', 'Forwarder', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('e36ea6df-5bb8-4452-a85b-c1919b6aeb58', 'Handling Agent', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('507793ba-e009-4d8c-bf1a-df4e2798c533', 'Notify Party', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('ae020901-3633-4d9f-9d9c-56d0226af8ef', 'Shipper', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('88b014bd-7a9d-40b5-b077-5dfd95fd39dc', 'Shipping Line', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('cfcc0cbf-b540-43ca-874a-b49a9553faf4', 'Supplier', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('4ffb0b66-4eb4-4d54-b5b9-953dcaa0f480', 'T1 Custom Clearance', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('43bd4fcf-533e-4498-bd9d-77993ca080df', 'T1 Sub Address', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('5c21af2f-9041-4e28-8696-03154f4df798', 'Transporter', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('4795006b-7523-443f-81fb-32d631a3dc4b', 'Trucking Company', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('2f303c74-2a7d-477e-b592-f2476a2d8933', 'Warehouse', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '2024-12-19 07:28:23', '2024-12-19 07:28:23', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('83682b29-4ee2-426f-a76e-5b476f4261da', 'Billing Customer', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('931da8d8-d16d-4745-8571-be2e06c4714e', 'Carrier Agent', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('deb3098d-4a10-4b12-beb9-d3d201145f38', 'Consignee', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('28c0d8ba-21bd-48fe-8eab-9cfaebfb6d81', 'Corporate', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('fe4f409f-35bb-47ad-8182-8d8c52ab920c', 'Custom Stop', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('82d9f6ec-9918-4fc3-a226-fe0fa4080c8a', 'Final Delivery', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('011f7771-bc12-4693-be54-bbcf4d89b2eb', 'Forwarder', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('41294fba-3567-4e9c-ba12-a18689377b47', 'Handling Agent', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('bcc115b7-5cab-42ba-9c3f-d752947784ef', 'Notify Party', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('ca7e68c9-3fa9-4eb0-a225-50057bf6705b', 'Shipper', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('ac68170a-58fd-4360-a7ed-ee03405f8862', 'Shipping Line', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('13a4caf3-0f32-4f33-85aa-ba480855e1c4', 'Supplier', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('bd086631-2a37-4cb2-8ee9-6ff07d071790', 'T1 Custom Clearance', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('a758327e-7431-45d2-80b7-2c4dd89070fc', 'T1 Sub Address', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('fa2f1540-cdc2-4668-9e05-1548a938d230', 'Transporter', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('046c7c21-a660-4477-9abf-3f2d9350c110', 'Trucking Company', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('130365a4-4dac-43c2-896d-480334c2342b', 'Warehouse', '9dc4b134-dac8-499d-8acc-50bafd68e70d', '2024-12-20 07:52:01', '2024-12-20 07:52:01', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('76caf887-5678-46b4-8092-b6609aed924e', 'Forwarder', '9dca6088-f88d-47be-978e-776d5be4d7af', '2024-12-27 02:58:45', '2024-12-27 02:58:45', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('0927fb8e-5d83-485a-b905-f063a233c6cf', 'Shipper', '9dca6088-f88d-47be-978e-776d5be4d7af', '2024-12-27 02:58:45', '2024-12-27 02:58:45', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('699738ac-e78a-4903-adc8-b751e30e719e', 'Warehouse', '9dca6088-f88d-47be-978e-776d5be4d7af', '2024-12-27 02:58:45', '2024-12-27 02:58:45', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('34bb09bd-2f20-43fa-98f2-18b698a6d19e', 'Corporate', '9dd25e0a-1fa1-4ecd-b24d-6353ae0c4284', '2024-12-27 03:05:48', '2024-12-27 03:05:48', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);
INSERT INTO "finance"."customer_type" VALUES ('1a5f25b2-a1d0-420e-bc97-8ab61adc5042', 'Warehouse', '9dd25e0a-1fa1-4ecd-b24d-6353ae0c4284', '2024-12-27 03:05:48', '2024-12-27 03:05:48', NULL, 'thomas@pamcargo.com', 'thomas@pamcargo.com', NULL);

-- ----------------------------
-- Table structure for customer_vat
-- ----------------------------
DROP TABLE IF EXISTS "finance"."customer_vat";
CREATE TABLE "finance"."customer_vat" (
  "id" uuid NOT NULL,
  "customer_id" uuid,
  "vat_number" varchar(255) COLLATE "pg_catalog"."default",
  "local_vat_number" varchar(255) COLLATE "pg_catalog"."default",
  "vat_excemted" varchar(255) COLLATE "pg_catalog"."default",
  "excemted_reason" text COLLATE "pg_catalog"."default",
  "ait_number" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of customer_vat
-- ----------------------------
INSERT INTO "finance"."customer_vat" VALUES ('9dc2a56d-bc20-4d4f-8617-707925d83ab7', '9dc2a25d-b05f-4a5f-bfda-48625cbef589', '001-289232-2928', '001-32739-232938', 'Yes', 'Because, im a good person', '2938-29382', '2024-12-19 07:27:26', '2024-12-19 07:27:26', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for daybooks
-- ----------------------------
DROP TABLE IF EXISTS "finance"."daybooks";
CREATE TABLE "finance"."daybooks" (
  "id" uuid NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of daybooks
-- ----------------------------
INSERT INTO "finance"."daybooks" VALUES ('9dc04ed1-749d-4969-bb8e-951b7ecbf3d7', '1001', 'Transaction SEA AIR INBOUND', 'SEATRANSPORT', 'Test Data', '2024-12-18 03:33:36', '2024-12-20 04:04:22', '2024-12-20 04:04:22', NULL, NULL, NULL);
INSERT INTO "finance"."daybooks" VALUES ('9dc45ffa-6b89-40a2-8c5b-e6847ad4d51e', '1001', 'Transaction SEA AIR INBOUND', 'SEATRANSPORT', 'TEST DATA', '2024-12-20 04:04:53', '2024-12-20 04:04:53', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for fixed_asset_statuses
-- ----------------------------
DROP TABLE IF EXISTS "finance"."fixed_asset_statuses";
CREATE TABLE "finance"."fixed_asset_statuses" (
  "id" uuid NOT NULL,
  "status_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of fixed_asset_statuses
-- ----------------------------

-- ----------------------------
-- Table structure for fixed_asset_types
-- ----------------------------
DROP TABLE IF EXISTS "finance"."fixed_asset_types";
CREATE TABLE "finance"."fixed_asset_types" (
  "id" uuid NOT NULL,
  "type_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type_code" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of fixed_asset_types
-- ----------------------------

-- ----------------------------
-- Table structure for fixed_assets
-- ----------------------------
DROP TABLE IF EXISTS "finance"."fixed_assets";
CREATE TABLE "finance"."fixed_assets" (
  "id" uuid NOT NULL,
  "asset_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "asset_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fixed_asset_type_id" uuid,
  "acquisition_date" date,
  "purchase_price" numeric(10,4) NOT NULL DEFAULT '0'::numeric,
  "useful_life" varchar(255) COLLATE "pg_catalog"."default",
  "fixed_asset_status_id" uuid,
  "notes" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of fixed_assets
-- ----------------------------

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS "finance"."invoice";
CREATE TABLE "finance"."invoice" (
  "id" uuid NOT NULL,
  "invoice_no" varchar(255) COLLATE "pg_catalog"."default",
  "invoice_date" date,
  "invoice_due_date" date,
  "customer_billing_id" uuid,
  "chw" float8,
  "total" float8,
  "description" text COLLATE "pg_catalog"."default",
  "revenue_recognition" bool,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "is_approved" bool NOT NULL DEFAULT false,
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "date_revenue_recognizition" date
)
;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for invoice_shipment
-- ----------------------------
DROP TABLE IF EXISTS "finance"."invoice_shipment";
CREATE TABLE "finance"."invoice_shipment" (
  "id" uuid NOT NULL,
  "invoice_id" uuid,
  "job_id" uuid,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of invoice_shipment
-- ----------------------------

-- ----------------------------
-- Table structure for invoice_shipment_charge
-- ----------------------------
DROP TABLE IF EXISTS "finance"."invoice_shipment_charge";
CREATE TABLE "finance"."invoice_shipment_charge" (
  "id" uuid NOT NULL,
  "invoice_id" uuid,
  "invoice_shipment_id" uuid,
  "currency_id" uuid,
  "charge_id" uuid,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "rate" float8,
  "chw" float8,
  "amount" float8,
  "local_amount" float8,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default",
  "unit_id" int8
)
;

-- ----------------------------
-- Records of invoice_shipment_charge
-- ----------------------------

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS "finance"."payment_methods";
CREATE TABLE "finance"."payment_methods" (
  "id" uuid NOT NULL,
  "payment_terms" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------

-- ----------------------------
-- Table structure for service_types
-- ----------------------------
DROP TABLE IF EXISTS "finance"."service_types";
CREATE TABLE "finance"."service_types" (
  "id" uuid NOT NULL,
  "service_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "service_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_by" varchar(255) COLLATE "pg_catalog"."default",
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of service_types
-- ----------------------------
INSERT INTO "finance"."service_types" VALUES ('9dc061e7-2ac1-4117-967c-7d4bd892a0dd', 'FCL', 'Full Container Load', '2024-12-18 04:26:58', '2024-12-18 04:26:58', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."service_types" VALUES ('9dc061cc-33ba-4a3e-998a-4b8c8dbdc887', 'LCL', 'Less Container Load', '2024-12-18 04:26:40', '2024-12-18 04:27:36', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."service_types" VALUES ('9dc0623d-b079-4cdc-b540-dafe711a683e', 'AIR', 'Air Freight', '2024-12-18 04:27:54', '2024-12-18 04:27:54', NULL, NULL, NULL, NULL);
INSERT INTO "finance"."service_types" VALUES ('9dc06255-1f05-41bf-ac8d-dea3fce325ca', 'LAND', 'Trucking, Port', '2024-12-18 04:28:10', '2024-12-18 04:28:10', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sub_account_groups
-- ----------------------------
DROP TABLE IF EXISTS "finance"."sub_account_groups";
CREATE TABLE "finance"."sub_account_groups" (
  "id" uuid NOT NULL,
  "account_group_id" uuid NOT NULL,
  "code" char(20) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of sub_account_groups
-- ----------------------------
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-f544-45a6-a29e-c6c22bbc4961', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '00                  ', 'ASSET', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-f816-4cbe-b3a1-f6d3d0b9cba3', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '01                  ', 'FIXED ASSET', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-f9e6-4faf-b1f1-179d96ac1421', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '05                  ', 'INVESTMENTS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-fb50-4f14-abbf-a8d9bd7ba93d', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '10                  ', 'CURRENT ASSETS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-fcf5-48d5-ad70-dd17cfc5bef9', '9dc04d59-e526-4eb3-a6dc-373a29d01a64', '15                  ', 'MISCELLANEOUS EXPENDITURE', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-fe76-4df6-aa23-a6bad1378140', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '00                  ', 'LIABILITIES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d59-ffe9-4477-8b39-41c14e7f2b71', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '01                  ', 'SHARE HOLDER FUNDS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-00f7-4408-bf88-fee9afa46ce9', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '05                  ', 'LOAN FUNDS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-022f-4713-9994-f6ff25e366f9', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '10                  ', 'CURRENT LIABILITIES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0372-4625-93d7-eea5cefa6014', '9dc04d59-f0ab-4fd1-a7fc-9b217ef761b0', '15                  ', 'PAYABLES PROVISIONS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0485-48d2-812a-2bd65c83df47', '9dc04d59-f176-4dd8-84ac-03b16fd1205a', '00                  ', 'INCOME', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-05b4-45d0-ac64-aad69578ee7c', '9dc04d59-f176-4dd8-84ac-03b16fd1205a', '01                  ', 'TRADE INCOME', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-06ce-45fa-ad77-dae824abb596', '9dc04d59-f176-4dd8-84ac-03b16fd1205a', '05                  ', 'NON TRADE INCOME', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-07eb-43c4-9225-fbee018ee54c', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '00                  ', 'EXPENDITURE', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-091a-4665-8367-39ced884da13', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '01                  ', 'COST OF SALES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0a29-43da-af6e-b4f2f738edc3', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '05                  ', 'PERSONNEL ADMINISTRATIVE OVERHEADS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0b3c-4c9e-9fe7-d9e7d28178f2', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '06                  ', 'ENTERTAINMENT EXPENSES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0c3c-4284-aa1b-1ecc243a5f8b', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '07                  ', 'INSURANCE', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0d07-4625-9593-95fe458ea8f7', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '08                  ', 'LEGAL STATUTORY COST', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0dcd-4ea8-9c70-0a61302a10b5', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '10                  ', 'FINANCE EXPENSES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0e8a-431c-86bf-808debf824ff', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '15                  ', 'NON CASH COST', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-0f88-4d60-ab68-b79db71a02e7', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '20                  ', 'BAD DOUBTFUL DEBTS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-106e-4b1a-9887-1375ec455b8f', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '25                  ', 'TAXES', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-1164-4a97-a0dc-5d4860733c9d', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '30                  ', 'DIVIDEND', '2024-12-18 03:29:30', '2024-12-18 03:29:30');
INSERT INTO "finance"."sub_account_groups" VALUES ('9dc04d5a-1269-4497-a4e5-29436aa72e2d', '9dc04d59-f20d-4f67-908e-05a95b0fe609', '50                  ', 'DIRECT ALLOCATED COSTS', '2024-12-18 03:29:30', '2024-12-18 03:29:30');

-- ----------------------------
-- Uniques structure for table account_groups
-- ----------------------------
ALTER TABLE "finance"."account_groups" ADD CONSTRAINT "finance_account_groups_code_unique" UNIQUE ("code");
ALTER TABLE "finance"."account_groups" ADD CONSTRAINT "finance_account_groups_name_unique" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table account_groups
-- ----------------------------
ALTER TABLE "finance"."account_groups" ADD CONSTRAINT "account_groups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table agent_contract
-- ----------------------------
ALTER TABLE "finance"."agent_contract" ADD CONSTRAINT "agent_contract_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table agent_contract_charge
-- ----------------------------
ALTER TABLE "finance"."agent_contract_charge" ADD CONSTRAINT "agent_contract_charge_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table agent_contract_charge_detail
-- ----------------------------
ALTER TABLE "finance"."agent_contract_charge_detail" ADD CONSTRAINT "agent_contract_charge_detail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table agent_contract_service
-- ----------------------------
ALTER TABLE "finance"."agent_contract_service" ADD CONSTRAINT "agent_contract_service_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bank_information
-- ----------------------------
ALTER TABLE "finance"."bank_information" ADD CONSTRAINT "bank_information_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table charges
-- ----------------------------
ALTER TABLE "finance"."charges" ADD CONSTRAINT "charges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Checks structure for table chart_of_accounts
-- ----------------------------
ALTER TABLE "finance"."chart_of_accounts" ADD CONSTRAINT "chart_of_accounts_account_position_check" CHECK (account_position::text = ANY (ARRAY['debit'::character varying, 'credit'::character varying]::text[]));
ALTER TABLE "finance"."chart_of_accounts" ADD CONSTRAINT "chart_of_accounts_cashflow_type_check" CHECK (cashflow_type::text = ANY (ARRAY['operating'::character varying, 'financing'::character varying, 'investing'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table chart_of_accounts
-- ----------------------------
ALTER TABLE "finance"."chart_of_accounts" ADD CONSTRAINT "chart_of_accounts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing
-- ----------------------------
ALTER TABLE "finance"."costing" ADD CONSTRAINT "costing_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_detail
-- ----------------------------
ALTER TABLE "finance"."costing_detail" ADD CONSTRAINT "costing_detail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_head
-- ----------------------------
ALTER TABLE "finance"."costing_head" ADD CONSTRAINT "costing_head_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_special
-- ----------------------------
ALTER TABLE "finance"."costing_special" ADD CONSTRAINT "costing_special_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_vendor_agent
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_agent" ADD CONSTRAINT "costing_vendor_agent_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_vendor_port
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_port" ADD CONSTRAINT "costing_vendor_port_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table costing_vendor_trucking
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_trucking" ADD CONSTRAINT "costing_vendor_trucking_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table currencies
-- ----------------------------
ALTER TABLE "finance"."currencies" ADD CONSTRAINT "currencies_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "finance"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_account
-- ----------------------------
ALTER TABLE "finance"."customer_account" ADD CONSTRAINT "customer_account_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_address
-- ----------------------------
ALTER TABLE "finance"."customer_address" ADD CONSTRAINT "customer_address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_bank
-- ----------------------------
ALTER TABLE "finance"."customer_bank" ADD CONSTRAINT "customer_bank_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table customer_contract
-- ----------------------------
ALTER TABLE "finance"."customer_contract" ADD CONSTRAINT "finance_customer_contract_contract_no_unique" UNIQUE ("contract_no");

-- ----------------------------
-- Primary Key structure for table customer_contract
-- ----------------------------
ALTER TABLE "finance"."customer_contract" ADD CONSTRAINT "customer_contract_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_contract_charge
-- ----------------------------
ALTER TABLE "finance"."customer_contract_charge" ADD CONSTRAINT "customer_contract_charge_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_email
-- ----------------------------
ALTER TABLE "finance"."customer_email" ADD CONSTRAINT "customer_email_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_gst
-- ----------------------------
ALTER TABLE "finance"."customer_gst" ADD CONSTRAINT "customer_gst_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_sales
-- ----------------------------
ALTER TABLE "finance"."customer_sales" ADD CONSTRAINT "customer_sales_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_type
-- ----------------------------
ALTER TABLE "finance"."customer_type" ADD CONSTRAINT "customer_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_vat
-- ----------------------------
ALTER TABLE "finance"."customer_vat" ADD CONSTRAINT "customer_vat_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table daybooks
-- ----------------------------
ALTER TABLE "finance"."daybooks" ADD CONSTRAINT "daybooks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fixed_asset_statuses
-- ----------------------------
ALTER TABLE "finance"."fixed_asset_statuses" ADD CONSTRAINT "fixed_asset_statuses_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fixed_asset_types
-- ----------------------------
ALTER TABLE "finance"."fixed_asset_types" ADD CONSTRAINT "fixed_asset_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table fixed_assets
-- ----------------------------
ALTER TABLE "finance"."fixed_assets" ADD CONSTRAINT "fixed_assets_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table invoice
-- ----------------------------
ALTER TABLE "finance"."invoice" ADD CONSTRAINT "invoice_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table invoice_shipment
-- ----------------------------
ALTER TABLE "finance"."invoice_shipment" ADD CONSTRAINT "invoice_shipment_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table invoice_shipment_charge
-- ----------------------------
ALTER TABLE "finance"."invoice_shipment_charge" ADD CONSTRAINT "invoice_shipment_charge_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table payment_methods
-- ----------------------------
ALTER TABLE "finance"."payment_methods" ADD CONSTRAINT "payment_methods_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table service_types
-- ----------------------------
ALTER TABLE "finance"."service_types" ADD CONSTRAINT "service_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table sub_account_groups
-- ----------------------------
ALTER TABLE "finance"."sub_account_groups" ADD CONSTRAINT "finance_sub_account_groups_name_unique" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table sub_account_groups
-- ----------------------------
ALTER TABLE "finance"."sub_account_groups" ADD CONSTRAINT "sub_account_groups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table agent_contract
-- ----------------------------
ALTER TABLE "finance"."agent_contract" ADD CONSTRAINT "finance_agent_contract_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table agent_contract_charge
-- ----------------------------
ALTER TABLE "finance"."agent_contract_charge" ADD CONSTRAINT "finance_agent_contract_charge_agent_contract_id_foreign" FOREIGN KEY ("agent_contract_id") REFERENCES "finance"."agent_contract" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "finance"."agent_contract_charge" ADD CONSTRAINT "finance_agent_contract_charge_agent_contract_service_id_foreign" FOREIGN KEY ("agent_contract_service_id") REFERENCES "finance"."agent_contract_service" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table agent_contract_charge_detail
-- ----------------------------
ALTER TABLE "finance"."agent_contract_charge_detail" ADD CONSTRAINT "finance_agent_contract_charge_detail_agent_contract_charge_id_f" FOREIGN KEY ("agent_contract_charge_id") REFERENCES "finance"."agent_contract_charge" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."agent_contract_charge_detail" ADD CONSTRAINT "finance_agent_contract_charge_detail_agent_contract_id_foreign" FOREIGN KEY ("agent_contract_id") REFERENCES "finance"."agent_contract" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."agent_contract_charge_detail" ADD CONSTRAINT "finance_agent_contract_charge_detail_agent_contract_service_id_" FOREIGN KEY ("agent_contract_service_id") REFERENCES "finance"."agent_contract_service" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table agent_contract_service
-- ----------------------------
ALTER TABLE "finance"."agent_contract_service" ADD CONSTRAINT "finance_agent_contract_service_agent_contract_id_foreign" FOREIGN KEY ("agent_contract_id") REFERENCES "finance"."agent_contract" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "finance"."agent_contract_service" ADD CONSTRAINT "finance_agent_contract_service_service_type_id_foreign" FOREIGN KEY ("service_type_id") REFERENCES "finance"."service_types" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table chart_of_accounts
-- ----------------------------
ALTER TABLE "finance"."chart_of_accounts" ADD CONSTRAINT "finance_chart_of_accounts_account_group_id_foreign" FOREIGN KEY ("account_group_id") REFERENCES "finance"."account_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."chart_of_accounts" ADD CONSTRAINT "finance_chart_of_accounts_sub_account_group_id_foreign" FOREIGN KEY ("sub_account_group_id") REFERENCES "finance"."sub_account_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_detail
-- ----------------------------
ALTER TABLE "finance"."costing_detail" ADD CONSTRAINT "finance_costing_detail_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_head
-- ----------------------------
ALTER TABLE "finance"."costing_head" ADD CONSTRAINT "finance_costing_head_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_special
-- ----------------------------
ALTER TABLE "finance"."costing_special" ADD CONSTRAINT "finance_costing_special_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_vendor_agent
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_agent" ADD CONSTRAINT "finance_costing_vendor_agent_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_vendor_port
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_port" ADD CONSTRAINT "finance_costing_vendor_port_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table costing_vendor_trucking
-- ----------------------------
ALTER TABLE "finance"."costing_vendor_trucking" ADD CONSTRAINT "finance_costing_vendor_trucking_costing_id_foreign" FOREIGN KEY ("costing_id") REFERENCES "finance"."costing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table customer_account
-- ----------------------------
ALTER TABLE "finance"."customer_account" ADD CONSTRAINT "finance_customer_account_chart_of_account_id_foreign" FOREIGN KEY ("chart_of_account_id") REFERENCES "finance"."chart_of_accounts" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."customer_account" ADD CONSTRAINT "finance_customer_account_currency_id_foreign" FOREIGN KEY ("currency_id") REFERENCES "finance"."currencies" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."customer_account" ADD CONSTRAINT "finance_customer_account_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_address
-- ----------------------------
ALTER TABLE "finance"."customer_address" ADD CONSTRAINT "finance_customer_address_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_bank
-- ----------------------------
ALTER TABLE "finance"."customer_bank" ADD CONSTRAINT "finance_customer_bank_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_contract
-- ----------------------------
ALTER TABLE "finance"."customer_contract" ADD CONSTRAINT "finance_customer_contract_charge_id_foreign" FOREIGN KEY ("charge_id") REFERENCES "finance"."charges" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."customer_contract" ADD CONSTRAINT "finance_customer_contract_currency_id_foreign" FOREIGN KEY ("currency_id") REFERENCES "finance"."currencies" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."customer_contract" ADD CONSTRAINT "finance_customer_contract_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_contract_charge
-- ----------------------------
ALTER TABLE "finance"."customer_contract_charge" ADD CONSTRAINT "finance_customer_contract_charge_currency_id_foreign" FOREIGN KEY ("currency_id") REFERENCES "finance"."currencies" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."customer_contract_charge" ADD CONSTRAINT "finance_customer_contract_charge_customer_contract_id_foreign" FOREIGN KEY ("customer_contract_id") REFERENCES "finance"."customer_contract" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_email
-- ----------------------------
ALTER TABLE "finance"."customer_email" ADD CONSTRAINT "finance_customer_email_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_gst
-- ----------------------------
ALTER TABLE "finance"."customer_gst" ADD CONSTRAINT "finance_customer_gst_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_sales
-- ----------------------------
ALTER TABLE "finance"."customer_sales" ADD CONSTRAINT "finance_customer_sales_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_type
-- ----------------------------
ALTER TABLE "finance"."customer_type" ADD CONSTRAINT "finance_customer_type_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table customer_vat
-- ----------------------------
ALTER TABLE "finance"."customer_vat" ADD CONSTRAINT "finance_customer_vat_customer_id_foreign" FOREIGN KEY ("customer_id") REFERENCES "finance"."customer" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table fixed_assets
-- ----------------------------
ALTER TABLE "finance"."fixed_assets" ADD CONSTRAINT "finance_fixed_assets_fixed_asset_status_id_foreign" FOREIGN KEY ("fixed_asset_status_id") REFERENCES "finance"."fixed_asset_statuses" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "finance"."fixed_assets" ADD CONSTRAINT "finance_fixed_assets_fixed_asset_type_id_foreign" FOREIGN KEY ("fixed_asset_type_id") REFERENCES "finance"."fixed_asset_types" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table invoice_shipment_charge
-- ----------------------------
ALTER TABLE "finance"."invoice_shipment_charge" ADD CONSTRAINT "finance_invoice_shipment_charge_currency_id_foreign" FOREIGN KEY ("currency_id") REFERENCES "finance"."currencies" ("id") ON DELETE SET NULL ON UPDATE NO ACTION;
ALTER TABLE "finance"."invoice_shipment_charge" ADD CONSTRAINT "finance_invoice_shipment_charge_invoice_id_foreign" FOREIGN KEY ("invoice_id") REFERENCES "finance"."invoice" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "finance"."invoice_shipment_charge" ADD CONSTRAINT "finance_invoice_shipment_charge_invoice_shipment_id_foreign" FOREIGN KEY ("invoice_shipment_id") REFERENCES "finance"."invoice_shipment" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sub_account_groups
-- ----------------------------
ALTER TABLE "finance"."sub_account_groups" ADD CONSTRAINT "finance_sub_account_groups_account_group_id_foreign" FOREIGN KEY ("account_group_id") REFERENCES "finance"."account_groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
