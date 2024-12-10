/*
 Navicat Premium Dump SQL

 Source Server         : Dev-203.175.10.178
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : accounting

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/12/2024 18:35:55
*/


-- ----------------------------
-- Sequence structure for account_account_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."account_account_id_seq";
CREATE SEQUENCE "accounting"."account_account_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for account_group_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."account_group_group_id_seq";
CREATE SEQUENCE "accounting"."account_group_group_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for account_type_group_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."account_type_group_type_id_seq";
CREATE SEQUENCE "accounting"."account_type_group_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for accounts_account_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."accounts_account_id_seq";
CREATE SEQUENCE "accounting"."accounts_account_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for audits_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."audits_id_seq";
CREATE SEQUENCE "accounting"."audits_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for cashflow_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."cashflow_id_seq";
CREATE SEQUENCE "accounting"."cashflow_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for financial_statement_fs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."financial_statement_fs_id_seq";
CREATE SEQUENCE "accounting"."financial_statement_fs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jurnal_detail_jurnal_detail_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."jurnal_detail_jurnal_detail_id_seq";
CREATE SEQUENCE "accounting"."jurnal_detail_jurnal_detail_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."migrations_id_seq";
CREATE SEQUENCE "accounting"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for personal_access_tokens_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."personal_access_tokens_id_seq";
CREATE SEQUENCE "accounting"."personal_access_tokens_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_rbac_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."role_rbac_role_id_seq";
CREATE SEQUENCE "accounting"."role_rbac_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."role_role_id_seq";
CREATE SEQUENCE "accounting"."role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for statement_cashflow_cf_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."statement_cashflow_cf_id_seq";
CREATE SEQUENCE "accounting"."statement_cashflow_cf_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for statement_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."statement_id_seq";
CREATE SEQUENCE "accounting"."statement_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 922337203685477
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for transaksi_kode_recuring_detail_detail_transaksi_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "accounting"."transaksi_kode_recuring_detail_detail_transaksi_id_seq";
CREATE SEQUENCE "accounting"."transaksi_kode_recuring_detail_detail_transaksi_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."account";
CREATE TABLE "accounting"."account" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "account_type_id" uuid NOT NULL,
  "cashflow_statement_id" uuid NOT NULL,
  "account_code" varchar(255) COLLATE "pg_catalog"."default",
  "header_account_code" varchar(255) COLLATE "pg_catalog"."default",
  "account_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "position" varchar(255) COLLATE "pg_catalog"."default",
  "report_code" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO "accounting"."account" VALUES ('03aae8cf-b89c-48f7-a822-602884bf553d', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01', '11', 'FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:18:50', '2024-09-04 03:18:50', 1);
INSERT INTO "accounting"."account" VALUES ('e1e77b72-92bb-4de0-892b-d22090fa97be', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.11', '11.01', 'COMPUTER EQUIPMENT ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:19:47', '2024-09-04 03:19:47', 1);
INSERT INTO "accounting"."account" VALUES ('7acc6322-e157-43dd-b378-69e6bd1bc1ce', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.11.0005', '11.01', 'COMPUTER EQUIPMENT ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:46:10', '2024-09-04 03:46:10', 1);
INSERT INTO "accounting"."account" VALUES ('a391973c-2c9c-4d37-a1f6-36f74c41e942', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.12', '11.01', 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:49:14', '2024-09-04 03:49:14', 1);
INSERT INTO "accounting"."account" VALUES ('96a530c3-7492-475b-80fb-9e96bb37764a', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.12.0005', '11.01', 'FURNITURE AND FIXTURES ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:50:01', '2024-09-04 03:50:01', 1);
INSERT INTO "accounting"."account" VALUES ('455723d3-a31d-493f-ae70-c97902ad765e', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.11.01.13', '11.11', 'OFFICE EQUIPMENTS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:50:39', '2024-09-04 03:50:39', 1);
INSERT INTO "accounting"."account" VALUES ('b3159260-2ec0-46cc-bf92-01ac73bfe90c', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.13', '11.01', 'OFFICE EQUIPMENTS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:51:09', '2024-09-04 03:51:09', 1);
INSERT INTO "accounting"."account" VALUES ('e69cd0b4-529c-4a13-b132-4ce8fb92fe45', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.13.0005', '11.01', 'OFFICE EQUIPMENTS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:51:39', '2024-09-04 03:51:39', 1);
INSERT INTO "accounting"."account" VALUES ('ded91215-0c4b-4f67-9358-1b5af0eeedb9', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.14', '11.01', 'LEASEHOLD IMPROVEMENTS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:52:21', '2024-09-04 03:52:21', 1);
INSERT INTO "accounting"."account" VALUES ('7dbf5d4e-0b33-4a12-88d7-4f2cfe2f38dc', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.14.0005', '11.01', 'LEASEHOLD IMPROVEMENTS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:52:57', '2024-09-04 03:52:57', 1);
INSERT INTO "accounting"."account" VALUES ('3c75c9c5-3b1b-47c4-b6b8-bdc1e56db538', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.15', '11.01', 'INTANGIBLE ASSETS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:54:45', '2024-09-04 03:54:45', 1);
INSERT INTO "accounting"."account" VALUES ('09d8a37e-d853-418c-a7e9-f4065418bc49', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.15.0005', '11.01', 'INTANGIBLE ASSETS ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:55:17', '2024-09-04 03:55:17', 1);
INSERT INTO "accounting"."account" VALUES ('d4ca8fad-4ce4-4e5a-9e6c-a3ef0741169f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.16', '11.01', 'VEHICLES ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:56:21', '2024-09-04 03:56:21', 1);
INSERT INTO "accounting"."account" VALUES ('499e6c8e-cc54-494a-ad37-8925eb04ec5e', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.16.0005', '11.01', 'VEHICLES ORIGINAL COST OF FIXED ASSETS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:56:57', '2024-09-04 03:56:57', 1);
INSERT INTO "accounting"."account" VALUES ('2ca75d31-8afa-45bd-89a1-ada78e55ca7f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.21', '11.01', 'COMPUTER EQUIPMENT ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:58:21', '2024-09-04 03:58:21', 1);
INSERT INTO "accounting"."account" VALUES ('0caf413b-cf3c-4b81-91b0-a5e1b2dfa917', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.22', '11.01', 'FURNITURE AND FIXTURES ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:00:31', '2024-09-04 04:00:31', 1);
INSERT INTO "accounting"."account" VALUES ('de63ac61-aa07-4be7-a02e-41ca6cca2ff4', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.22.0005', '11.01', 'FURNITURE AND FIXTURES ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:02:27', '2024-09-04 04:02:27', 1);
INSERT INTO "accounting"."account" VALUES ('70855f06-64aa-4ad6-b558-781fa4361b2d', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.22.005', '11.01', 'FURNITURE AND FIXTURES ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:01:00', '2024-09-04 04:02:48', 3);
INSERT INTO "accounting"."account" VALUES ('20df031c-8edf-4eaa-84e6-7ee522382ac2', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.23', '11.01', 'OFFICE EQUIPMENTS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:10:15', '2024-09-04 04:10:15', 1);
INSERT INTO "accounting"."account" VALUES ('ec5de5b2-652b-4608-945f-247a89ac36f1', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.23.0005', '11.01', 'OFFICE EQUIPMENTS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:10:52', '2024-09-04 04:10:52', 1);
INSERT INTO "accounting"."account" VALUES ('e90d7353-230d-4675-aff1-5e9d94074916', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.24', '11.01', 'LEASEHOLD IMPROVEMENTS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:11:40', '2024-09-04 04:11:40', 1);
INSERT INTO "accounting"."account" VALUES ('4f568ec7-f4d4-45af-be12-e1d0304895e1', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.24.0005', '11.01', 'LEASEHOLD IMPROVEMENTS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:12:30', '2024-09-04 04:12:30', 1);
INSERT INTO "accounting"."account" VALUES ('0a54f30f-c50d-497c-b617-150c39c0f135', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.25', '11.01', 'INTANGIBLE ASSETS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:13:00', '2024-09-04 04:13:00', 1);
INSERT INTO "accounting"."account" VALUES ('e0ec4740-e47c-4364-9d8a-5dd270d0dd80', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.25.0005', '11.01', 'INTANGIBLE ASSETS ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:13:31', '2024-09-04 04:13:31', 1);
INSERT INTO "accounting"."account" VALUES ('844c0cac-f1d6-4ad9-b726-a06b5ef391c2', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.26', '11.01', 'VEHICLES ORIGINAL ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:14:04', '2024-09-04 04:14:04', 1);
INSERT INTO "accounting"."account" VALUES ('446f696f-a206-4cd5-8095-82ccb61d1d48', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.26.0005', '11.01', 'VEHICLES ORIGINAL ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:14:22', '2024-09-04 04:14:22', 1);
INSERT INTO "accounting"."account" VALUES ('7282d9ad-cd5f-4da2-b68c-86cf1636ee85', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05', '11', 'INVESTMENTS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:15:33', '2024-09-04 04:15:33', 1);
INSERT INTO "accounting"."account" VALUES ('1ce58d1a-d427-40a8-aecc-45746ebdaa0a', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0010', '11.05', 'CAPITAL GUARANTEED BONDS WITH BANKS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:26:38', '2024-09-04 04:26:38', 1);
INSERT INTO "accounting"."account" VALUES ('24b53730-4c36-42e7-8576-13f206c9a3ba', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0005', '11.05', 'SHARES OF OTHER COMPANIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:25:00', '2024-09-04 04:28:00', 3);
INSERT INTO "accounting"."account" VALUES ('e85e6f5f-9348-4742-bcec-4c615a56ae5b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.11.05.05.0005', '11.11', 'SHARES OF OTHER COMPANIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:29:41', '2024-09-04 04:29:41', 1);
INSERT INTO "accounting"."account" VALUES ('85c84297-b594-4639-8524-04b1dab94252', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.01', '11.05', 'INVESTMENTS IN FOREIGN OFFICES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:17:21', '2024-09-04 04:17:21', 1);
INSERT INTO "accounting"."account" VALUES ('7859fcff-facb-4138-9568-def7671f227d', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0005', '11.05', 'SHARES OF OTHER COMPANIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:31:04', '2024-09-04 04:31:04', 1);
INSERT INTO "accounting"."account" VALUES ('6d5dd719-278f-4ad3-8f5f-6964f208ba1e', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '89020c54-5076-48f2-9417-2d786b2a521b', '11.01.21.0005', '11.01', 'COMPUTER EQUIPMENT ACCUMULATED DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 03:59:57', '2024-09-04 04:19:08', 1);
INSERT INTO "accounting"."account" VALUES ('6dfbc54a-b983-4ba6-a59e-6ee70646d8dc', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.01.0005', '11.05', 'INVESTMENT IN FOREIGN OFFICES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:22:16', '2024-09-04 04:22:16', 1);
INSERT INTO "accounting"."account" VALUES ('7a166147-724a-42a9-a099-ae743482a71f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05', '11.05', 'OTHER INVESTMENTS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:23:29', '2024-09-04 04:23:29', 1);
INSERT INTO "accounting"."account" VALUES ('c85e9c3c-0b23-4fd4-9963-0f4a724dbc32', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0005', '11.05', 'SHARES OF OTHER COMPANIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:30:27', '2024-09-04 04:31:32', 3);
INSERT INTO "accounting"."account" VALUES ('6afec160-03fe-41d6-82dc-02a61fe2069a', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0015', '11.05', 'INVESTMENT IN GOVERNMENT SECURITIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:46:47', '2024-09-04 04:46:47', 1);
INSERT INTO "accounting"."account" VALUES ('da11e527-0919-4ab5-904a-5c027069236f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0020', '11.05', 'INVESTMENT IN SUBSIDIARIES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:47:29', '2024-09-04 04:47:29', 1);
INSERT INTO "accounting"."account" VALUES ('8792f780-72e0-42f5-a666-d5ddc0719bec', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.15', '11.05', 'ACCRUED INTEREST   BANK INTEREST', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:49:09', '2024-09-04 04:49:09', 1);
INSERT INTO "accounting"."account" VALUES ('2bf1302a-4ce6-46f7-bb84-15a4c6dab5a3', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.15..0020', '11.05', 'ACCRUED INTEREST   BANK INTEREST', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:49:57', '2024-09-04 04:49:57', 1);
INSERT INTO "accounting"."account" VALUES ('6b337f90-3e81-422b-a1a7-ee1a4151a2a3', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10', '11', 'CURRENT ASSETS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:50:53', '2024-09-04 04:50:53', 1);
INSERT INTO "accounting"."account" VALUES ('1eb90430-3f94-42b1-bd28-76c6a5609518', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05', '11.10', 'SUNDRY DEBTORS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:51:55', '2024-09-04 04:51:55', 1);
INSERT INTO "accounting"."account" VALUES ('4bf3cf03-84dc-4882-ac66-7ac835da40fd', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.05.05.0010', '11.05', 'CAPITAL GUARANTEED BONDS WITH BANKS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 04:35:24', '2024-09-04 04:54:50', 3);
INSERT INTO "accounting"."account" VALUES ('b29006fe-b2c6-411b-9467-70e6649a4a2b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05.0001', '11.10', 'DEBTORS LOCAL', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 05:01:14', '2024-09-04 05:01:42', 1);
INSERT INTO "accounting"."account" VALUES ('2c2dcc6b-5e39-4291-9d11-499d9c0d5864', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05.0005', '11.10', 'DEBTORS OVERSEAS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 05:02:34', '2024-09-04 05:02:34', 1);
INSERT INTO "accounting"."account" VALUES ('3d12cd0e-cf85-493d-9b2c-4977c1f69ea7', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05.0035', '11.10', 'SALES PROVISIONS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:44:29', '2024-09-04 06:44:29', 1);
INSERT INTO "accounting"."account" VALUES ('c17ad3bc-e871-46b9-84fa-41c74fb4473f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05.0025', '11.10', 'DEBTORS AGENTS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:45:20', '2024-09-04 06:45:20', 1);
INSERT INTO "accounting"."account" VALUES ('8ae336e1-6111-4afc-8b99-ac700f55166a', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.05.0500', '11.10', 'PROVISIONS FOR DOUBTFUL DEBTS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:46:37', '2024-09-04 06:46:37', 1);
INSERT INTO "accounting"."account" VALUES ('74cccfc3-b3e6-4d60-b793-d09911f68bbc', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.07', '11.10', 'DUE FROM RELATED CONCERNS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:49:26', '2024-09-04 06:49:26', 1);
INSERT INTO "accounting"."account" VALUES ('2a6c1c8f-dcc8-4318-b9ae-185908469e8e', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.07.0005', '11.10', 'DUE FROM RELATED CONCERNS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:50:19', '2024-09-04 06:50:19', 1);
INSERT INTO "accounting"."account" VALUES ('05b9b1c4-4847-48c9-a299-731f43918ff1', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10', '11.10', 'CASH   BANK BALANCES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:51:47', '2024-09-04 06:51:47', 1);
INSERT INTO "accounting"."account" VALUES ('25d718af-a6c0-40f4-8ff9-c9a455a9ceb5', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0005', '11.10', 'PETTY CASH ACCOUNT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:53:01', '2024-09-04 06:53:01', 1);
INSERT INTO "accounting"."account" VALUES ('033e023a-f598-446f-bc8a-b860f4cd8f36', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0006', '11.10', 'MAIN CASH ACCOUNT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:54:00', '2024-09-04 06:54:00', 1);
INSERT INTO "accounting"."account" VALUES ('817776df-b339-4e95-a54c-e5646bdfd62c', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0100', '11.10', 'FUNDS IN TRANSIT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 06:57:47', '2024-09-04 06:57:47', 1);
INSERT INTO "accounting"."account" VALUES ('ec715f4d-20d8-49fd-9a09-20f266fd0d64', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0105', '11.10', 'FIXED DEPOSITS WITH BANKS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:02:29', '2024-09-04 07:02:29', 1);
INSERT INTO "accounting"."account" VALUES ('bb708302-6d6d-48a0-b884-0ca4549fc30b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0110', '11.10', 'BANK BALANCES   LOCAL CURRENCY', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:03:09', '2024-09-04 07:03:09', 1);
INSERT INTO "accounting"."account" VALUES ('a9483c7d-a5ff-4bb3-82e8-f8989d951bef', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0115', '11.10', 'BANK BALANCES   FOREIGN CURRENCY', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:04:08', '2024-09-04 07:04:08', 1);
INSERT INTO "accounting"."account" VALUES ('69af225c-cbbb-46c9-b975-3db12036a2af', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0125', '11.10', 'MARGIN ON BANK GUARANTEE', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:06:05', '2024-09-04 07:06:05', 1);
INSERT INTO "accounting"."account" VALUES ('b55024b0-3e69-465f-83da-d2896d38bdf4', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0130', '11.10', 'POST DATED CHEQUE COLLECTION ACCOUNT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:06:38', '2024-09-04 07:06:38', 1);
INSERT INTO "accounting"."account" VALUES ('a7cbcbe2-0f79-423a-b664-8375a69a793c', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.11', '11.10', 'JOBS IN PROGRESS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:08:30', '2024-09-04 07:08:30', 1);
INSERT INTO "accounting"."account" VALUES ('1d2add77-e514-4ed6-bbbb-3836886f1d93', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.11.0005', '11.10', 'JOBS IN PROGRESS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:09:57', '2024-09-04 07:09:57', 1);
INSERT INTO "accounting"."account" VALUES ('669f97ac-3bbc-4e9c-bed4-70599186e616', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.12', '11.10', 'FIDUCIARY DEPOSITS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:10:28', '2024-09-04 07:10:28', 1);
INSERT INTO "accounting"."account" VALUES ('efc64828-dd0b-4f56-89fb-e4466dcc6aee', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.12.0005', '11.10', 'BANK GAURANTEE DEPOSITS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:11:00', '2024-09-04 07:11:00', 1);
INSERT INTO "accounting"."account" VALUES ('f277fdd8-f424-4f89-8acf-31443b7a8e1f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.15', '11.10', 'ACCRUED INCOME', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:11:26', '2024-09-04 07:11:26', 1);
INSERT INTO "accounting"."account" VALUES ('e36ef2f6-7bc9-4b4d-86f1-4d5f858e7f3b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.15.0005', '11.10', 'INCOME ACCRUED', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:12:14', '2024-09-04 07:12:14', 1);
INSERT INTO "accounting"."account" VALUES ('5ee430cb-30d6-46a5-9922-686b6baf91e8', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.15.0010', '11.10', 'INTEREST ACCRUED', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:12:57', '2024-09-04 07:12:57', 1);
INSERT INTO "accounting"."account" VALUES ('005fc8a7-bf58-467a-b899-593dfacac33c', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20', '11.10', 'OTHER RECOVERABLE', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:13:40', '2024-09-04 07:13:40', 1);
INSERT INTO "accounting"."account" VALUES ('c35c4d20-305c-41fb-a04d-5863f99dd693', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.10.0005', '11.10', 'RECOVERABLE COSTS   JOBS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:14:18', '2024-09-04 07:14:18', 1);
INSERT INTO "accounting"."account" VALUES ('282a0328-46c0-406e-95b8-bb661807621d', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20.0005', '11.10', 'RECOVERABLE COSTS   JOBS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:15:24', '2024-09-04 07:15:24', 1);
INSERT INTO "accounting"."account" VALUES ('9bcc8aae-688a-4dd9-97f1-7f59278d3021', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20.0010', '11.10', 'CLAIMS RECOVERABLE', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:16:03', '2024-09-04 07:16:03', 1);
INSERT INTO "accounting"."account" VALUES ('9005665c-b7aa-466d-b419-09db5570aced', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20.0015', '11.10', 'CONTAINER DEPOSIT   RECEIVABLE', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:16:43', '2024-09-04 07:16:43', 1);
INSERT INTO "accounting"."account" VALUES ('7f8221f0-492b-42c2-abd2-bf49b7400aee', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20.0016', '11.10', 'OTHER RECEIVABLES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:17:31', '2024-09-04 07:17:31', 1);
INSERT INTO "accounting"."account" VALUES ('2f107765-2e8d-4a21-a74d-a3c78a94a304', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.20.0505', '11.10', 'VAT RECEIVABLE', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:18:15', '2024-09-04 07:18:15', 1);
INSERT INTO "accounting"."account" VALUES ('d01d0453-5201-4bfc-a443-40eac009b498', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.30', '11.10', 'INTER COMPANY CURRENT ACCOUNTS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:19:00', '2024-09-04 07:19:00', 1);
INSERT INTO "accounting"."account" VALUES ('4ac32fae-6a4f-4dd0-8dba-67aeb45039a3', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.30.0005', '11.10', 'INTER COMPANY CURRENT ACCOUNTS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:21:40', '2024-09-04 07:21:40', 1);
INSERT INTO "accounting"."account" VALUES ('623e3379-17ac-43aa-bc1a-e6db7c9775fd', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.35', '11.10', 'SHORT TERM DEPOSITS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:22:18', '2024-09-04 07:22:18', 1);
INSERT INTO "accounting"."account" VALUES ('5bc0d086-5dbf-4112-b951-24de95a4fa60', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.35.0005', '11.10', 'RENT DEPOSIT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:23:22', '2024-09-04 07:23:22', 1);
INSERT INTO "accounting"."account" VALUES ('a5287f0d-094c-4ac5-8808-9356398bc8e1', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.35.0010', '11.10', 'UTILITY BILL DEPOSIT', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:24:01', '2024-09-04 07:24:01', 1);
INSERT INTO "accounting"."account" VALUES ('ba565a81-6d44-4608-8c8e-c1fbf91dd206', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.35.0015', '11.10', 'OTHER DEPOSITS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:24:57', '2024-09-04 07:24:57', 1);
INSERT INTO "accounting"."account" VALUES ('8dc54429-e188-46e6-99b9-9deec202b2c6', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.35.0020', '11.10', 'CUSTOM DEPOSITS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:25:44', '2024-09-04 07:25:44', 1);
INSERT INTO "accounting"."account" VALUES ('79483e11-83b4-4920-8536-798b092fb31b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40', '11.10', 'ADVANCES   PREPAYMENTS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:26:17', '2024-09-04 07:26:17', 1);
INSERT INTO "accounting"."account" VALUES ('df6ed3c9-aa64-466d-a0e1-a7032d511616', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0001', '11.10', 'ADVANCES   PREPAYMENTS_OPERATION FLQ', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:26:52', '2024-09-04 07:26:52', 1);
INSERT INTO "accounting"."account" VALUES ('18f85a9f-90ec-48ee-92df-a83e6fdfe2fd', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0020', '11.10', 'PREPAYMENTS   GENERAL', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:27:48', '2024-09-04 07:27:48', 1);
INSERT INTO "accounting"."account" VALUES ('cc6904c3-6940-4c26-ac68-6ea29009730f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0025', '11.10', 'PREPAYMENTS   JOBS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:28:13', '2024-09-04 07:28:13', 1);
INSERT INTO "accounting"."account" VALUES ('c81bb06b-04e7-4997-a33e-b267014f0f14', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0080', '11.10', 'ADVACE TO OTHERS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:29:28', '2024-09-04 07:29:28', 1);
INSERT INTO "accounting"."account" VALUES ('a662edee-da1d-4bca-885e-0b8f520b0e24', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0505', '11.10', 'PREPAID EXPENSE   JOBS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:35:22', '2024-09-04 07:35:22', 1);
INSERT INTO "accounting"."account" VALUES ('c0040948-c4e7-4bcb-ab7e-14ec40482416', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.40.0505', '11.10', 'PREPAID EXPENSE   JOBS', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:35:06', '2024-09-04 07:38:55', 3);
INSERT INTO "accounting"."account" VALUES ('9d8c496f-2b58-4a28-9526-53b2468a7ccf', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.42', '11.10', 'STAFF ADVANCES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:39:46', '2024-09-04 07:39:46', 1);
INSERT INTO "accounting"."account" VALUES ('9ae92d39-187c-4188-89b9-54855259a331', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.42.0005', '11.10', 'STAFF ADVANCES', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:40:34', '2024-09-04 07:40:34', 1);
INSERT INTO "accounting"."account" VALUES ('a4662a8e-72ca-473a-9ae8-a9c13a56f68c', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.45', '11.10', 'DEFERRED TAX ASSETS', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:43:12', '2024-09-04 07:43:12', 1);
INSERT INTO "accounting"."account" VALUES ('71097f94-821a-4773-855b-27a636f0c189', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.42.0010', '11.10', 'STAFF LOAN', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 07:41:38', '2024-09-04 07:43:39', 1);
INSERT INTO "accounting"."account" VALUES ('c89c4cfb-81d6-4fde-bd0b-831b66974603', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.45.0001', '11.10', 'ADVANCE INCOME TAX', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:44:21', '2024-09-04 07:44:21', 1);
INSERT INTO "accounting"."account" VALUES ('680e43c8-2d37-42a9-8187-65b262b16524', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.45.0005', '11.10', 'ADVANCE WEALTH TAX', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:45:06', '2024-09-04 07:45:06', 1);
INSERT INTO "accounting"."account" VALUES ('2a6f5a86-096f-4f6f-a8d5-d7dae4520466', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.45.0010', '11.10', 'DEFERRED INCOME TAX', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:46:07', '2024-09-04 07:46:07', 1);
INSERT INTO "accounting"."account" VALUES ('576cd9ce-a93f-4cda-87af-a1235b23eefe', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.45.0015', '11.10', 'FRINGE BENEFIT TAX', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:46:55', '2024-09-04 07:46:55', 1);
INSERT INTO "accounting"."account" VALUES ('7cb2a7d2-8232-4af6-9705-a9654d310c44', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.50', '11.10', 'SUSPENSE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:47:46', '2024-09-04 07:47:46', 1);
INSERT INTO "accounting"."account" VALUES ('b09ea497-d5de-4218-a79d-5781f998a80b', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.10.50.0001', '11.10', 'SUSPENSE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:48:21', '2024-09-04 07:48:21', 1);
INSERT INTO "accounting"."account" VALUES ('fdb7d368-c9dc-4976-b264-421986efe506', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15', '11', 'MISCELLANEOUS EXPENDITURE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:04:41', '2024-09-04 08:04:41', 1);
INSERT INTO "accounting"."account" VALUES ('3871e059-4552-424b-a301-e4ae5c73093f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.50', '11.15', 'MISCELLANEOUS EXPENDITURE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:50:06', '2024-09-04 08:04:57', 3);
INSERT INTO "accounting"."account" VALUES ('c9d69e65-5bfd-40be-a451-d456ab052e33', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.50', '11.15', 'MISCELLANEOUS EXPENDITURE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 07:51:04', '2024-09-04 08:05:06', 3);
INSERT INTO "accounting"."account" VALUES ('b812c9f8-0a0c-4b5d-a8f3-6a159cb86eb7', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.01', '11.15', 'MISCELLANEOUS EXPENDITURE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 07:49:03', '2024-09-04 08:05:38', 1);
INSERT INTO "accounting"."account" VALUES ('db9ed06a-fab1-4003-9224-6c390b9c109f', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.01.0001', '11.15', 'PRELIMINARY EXPENSE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:07:11', '2024-09-04 08:07:11', 1);
INSERT INTO "accounting"."account" VALUES ('ed53466c-f84b-4519-a7a7-89c580f882f9', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.01.0005', '11.15', 'DEFERRED EXPENSE', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:07:50', '2024-09-04 08:07:50', 1);
INSERT INTO "accounting"."account" VALUES ('5ec77f2c-81bd-4bcc-a6a6-c010114fda71', '3a423be5-ed00-4dfe-a408-fbd18cce007b', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '11.15.01.0010', '11.15', 'PRE OPERATIVE EXPENSES', NULL, 'debit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:08:21', '2024-09-04 08:08:21', 1);
INSERT INTO "accounting"."account" VALUES ('7ee200a4-262a-48a8-b23a-87cc819c707a', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.00.10', '12.00', 'UNEARNED REVENUE', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:10:55', '2024-09-04 08:10:55', 1);
INSERT INTO "accounting"."account" VALUES ('67fd3726-e2b1-4dc0-a14c-e02300ce547d', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.00', '12', 'UNEARNED REVENUE', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 08:14:27', '2024-09-04 08:14:40', 1);
INSERT INTO "accounting"."account" VALUES ('44e500e2-d10f-4faa-a651-cff37d01a1fa', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.00.10', '12.00', 'UNEARNED REVENUE', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:12:46', '2024-09-04 08:14:49', 3);
INSERT INTO "accounting"."account" VALUES ('f5ac4a06-7f1a-4910-b2d8-bad3b46c8ec1', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01', '12', 'SHARE HOLDERS'' FUNDS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:16:14', '2024-09-04 08:16:14', 1);
INSERT INTO "accounting"."account" VALUES ('ee183391-be8a-4c2e-93bf-bf5be50732d1', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.01', '12.01', 'SHARE CAPITAL', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:17:43', '2024-09-04 08:17:43', 1);
INSERT INTO "accounting"."account" VALUES ('298cab18-b7e1-446d-8c44-92ee20c05bac', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.01.0005', '12.01', 'PAID UP SHARE CAPITAL', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:18:56', '2024-09-04 08:18:56', 1);
INSERT INTO "accounting"."account" VALUES ('6453d26b-358a-49a9-a5a2-2b6f9620e77a', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.01.0008', '12.01', 'SHARE CAPITAL APPLICATION MONEY', NULL, 'debit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:19:58', '2024-09-04 08:19:58', 1);
INSERT INTO "accounting"."account" VALUES ('4f8c3faa-2363-42f9-bd15-b6ea7dc9c4ca', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.01.0010', '12.01', 'CALLED UP SHARE CAPITAL', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 08:20:44', '2024-09-04 08:20:44', 1);
INSERT INTO "accounting"."account" VALUES ('6329f2a9-d429-4294-a543-142667faf4d7', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.05', '12.01', 'DIRECTORS CURRENT ACCOUNTS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 09:03:23', '2024-09-04 09:03:36', 1);
INSERT INTO "accounting"."account" VALUES ('82aaa863-d5d4-49cf-9800-2ca05e664954', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.05.0001', '12.01', 'DRAWINGS BY DIRECTORS / PARTNERS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:23:37', '2024-09-04 09:23:37', 1);
INSERT INTO "accounting"."account" VALUES ('f4d1faed-7ef6-417b-a7dd-15f6f3b97ec7', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.06', '12.01', 'ACCUMULATED RETAINED EARNINGS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:26:29', '2024-09-04 09:26:29', 1);
INSERT INTO "accounting"."account" VALUES ('20d9b134-d434-4f90-a263-4a508feeb020', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.05.0010', '12.01', 'PROFIT REMITTANCE FROM FOREIGN OFFICES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 09:25:38', '2024-09-04 09:26:44', 1);
INSERT INTO "accounting"."account" VALUES ('ff11389e-9888-421d-b3c7-4b685ec32c0e', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.05.0005', '12.01', 'INVESTMENT IN FOREIGN OFFICES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 09:24:37', '2024-09-04 09:26:55', 1);
INSERT INTO "accounting"."account" VALUES ('b4d253c9-4a08-448c-b217-597d0496eeb0', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.06.0005', '12.01', 'ACCUMULATED RETAINED EARNINGS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:28:23', '2024-09-04 09:28:23', 1);
INSERT INTO "accounting"."account" VALUES ('5dd51d73-95ce-4314-aa25-300d52449d49', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.08', '12.01', 'CURRENT NET PROFIT (LOSS)', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:36:39', '2024-09-04 09:36:39', 1);
INSERT INTO "accounting"."account" VALUES ('8a5feb2a-1ed0-4ede-99f1-6ee92d1527d3', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.08.0005', '12.01', 'CURRENT NET PROFIT (LOSS)', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:37:14', '2024-09-04 09:37:14', 1);
INSERT INTO "accounting"."account" VALUES ('4c159ae0-6fed-4bf3-a87f-0ac3c92eb0ad', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.10', '12.01', 'BRANCH ACCOUNTS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:41:32', '2024-09-04 09:41:32', 1);
INSERT INTO "accounting"."account" VALUES ('91f07bdc-b8d1-41ff-a731-9d48335aaa73', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.10.0005', '12.01', 'BRANCH CURRENT ACCOUNTS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:42:05', '2024-09-04 09:42:05', 1);
INSERT INTO "accounting"."account" VALUES ('7397c2b9-bea5-4cc1-b109-1bdcaaefa6ef', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15', '12.01', 'RESERVES   SURPLUS', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:42:45', '2024-09-04 09:42:45', 1);
INSERT INTO "accounting"."account" VALUES ('3f263708-b0ee-4917-ac96-caa7ecef7115', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15.0005', '12.01', 'STATUTORY RESERVES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:46:01', '2024-09-04 09:46:01', 1);
INSERT INTO "accounting"."account" VALUES ('80b300fe-74ab-4dbc-a741-9960536863bc', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15.0010', '12.01', 'GENERAL RESERVES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-04 09:46:54', '2024-09-04 09:47:35', 1);
INSERT INTO "accounting"."account" VALUES ('49ebbecf-135b-425f-a228-26ad9fad61e6', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15.0015', '12.01', 'VOLUNTRY RESERVES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:48:26', '2024-09-04 09:48:26', 1);
INSERT INTO "accounting"."account" VALUES ('f2b884e2-7d92-4800-8f2e-429a88dd35a2', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15.0020', '12.01', 'VOLUNTRY RESERVES', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:49:09', '2024-09-04 09:49:09', 1);
INSERT INTO "accounting"."account" VALUES ('b1607bce-bdc4-4e8d-9f48-3b747ca645b6', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.01.15.0025', '12.01', 'SHARE PREMIUM', NULL, 'credit', '2', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:49:44', '2024-09-04 09:49:44', 1);
INSERT INTO "accounting"."account" VALUES ('51b3a4d7-96a4-48d0-b4ab-9b975ddd242b', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05', '12', 'LOAN FUNDS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:50:47', '2024-09-04 09:50:47', 1);
INSERT INTO "accounting"."account" VALUES ('eb652b72-d474-4412-926f-b07d1b4d603b', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.01', '12.05', 'SECURED LOANS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:54:18', '2024-09-04 09:54:18', 1);
INSERT INTO "accounting"."account" VALUES ('89de58dc-669d-4d17-9b42-bcfdc5533cd5', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.01.0005', '12.05', 'TERM LOAN FROM BANKS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:55:09', '2024-09-04 09:55:09', 1);
INSERT INTO "accounting"."account" VALUES ('7e0a67c9-1076-46c1-beab-b6e9ee574db1', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.01.0010', '12.05', 'VEHICLE LOANS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:55:54', '2024-09-04 09:55:54', 1);
INSERT INTO "accounting"."account" VALUES ('aed79dbb-8aaf-4887-a934-5e1f4a8ab14c', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.01.0020', '12.05', 'BANK OVERDRAFTS   LOCAL CURRENCY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:57:04', '2024-09-04 09:57:04', 1);
INSERT INTO "accounting"."account" VALUES ('6e834615-8929-46f7-ae17-55418c04f291', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.01.0025', '12.05', 'INVOICE DISCOUNTING WITH BANKS   LOCAL CURRENCY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:57:38', '2024-09-04 09:57:38', 1);
INSERT INTO "accounting"."account" VALUES ('6ee22464-85d0-4561-804d-56255d8f8c35', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.05', '12.05', 'UNSECURED LOANS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:58:41', '2024-09-04 09:58:41', 1);
INSERT INTO "accounting"."account" VALUES ('a7a06793-18ab-46b6-94c5-a599452ed717', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.05.0005', '12.05', 'LOANS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 09:59:18', '2024-09-04 09:59:18', 1);
INSERT INTO "accounting"."account" VALUES ('8991cb4a-b736-46b5-a603-26598ed5404e', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.05.0010', '12.05', 'LOAN FROM BANKS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:00:14', '2024-09-04 10:00:14', 1);
INSERT INTO "accounting"."account" VALUES ('440ea6e1-4d8d-4b37-a56e-2359684d9977', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.05.05.0015', '12.05', 'LOAN FROM OTHERS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:00:52', '2024-09-04 10:00:52', 1);
INSERT INTO "accounting"."account" VALUES ('0188a04d-5754-4fbe-ab7a-ab3f680cd9d2', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10', '12', 'CURRENT LIABILITIES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:01:55', '2024-09-04 10:01:55', 1);
INSERT INTO "accounting"."account" VALUES ('54e2cc7f-3f42-43f0-b397-ae2bcfd031c2', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01', '12.10', 'SUNDRY CREDITORS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:02:36', '2024-09-04 10:02:36', 1);
INSERT INTO "accounting"."account" VALUES ('02abe2ab-6bfd-41f9-b055-eb66d4545ebe', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01.0001', '12.10', 'CREDITORS LOCAL', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:03:30', '2024-09-04 10:03:30', 1);
INSERT INTO "accounting"."account" VALUES ('ecfe2330-adb7-47b7-8057-f70dc5db1633', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01.0005', '12.10', 'CREDITORS OVERSEAS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:04:15', '2024-09-04 10:04:15', 1);
INSERT INTO "accounting"."account" VALUES ('48bfe76b-04a8-470c-8410-2f35b1cc9a63', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01.0020', '12.10', 'CREDITORS AGENT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:04:56', '2024-09-04 10:04:56', 1);
INSERT INTO "accounting"."account" VALUES ('9f543e87-0ecd-4f78-98d7-c36cadc21b6e', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01.0025', '12.10', 'CREDITORS MISCELLANEOUS PAYABLE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:05:34', '2024-09-04 10:05:34', 1);
INSERT INTO "accounting"."account" VALUES ('1be4b843-d11f-4f58-b0e3-1c2cd228a90b', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.01.0110', '12.10', 'POST DATED CHEQUE ISSUED ACCOUNT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:07:10', '2024-09-04 10:07:10', 1);
INSERT INTO "accounting"."account" VALUES ('a74fcf7d-c8f8-409d-b036-fd84bd3afea1', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.02', '12.10', 'DUE TO RELATED CONCERNS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:09:06', '2024-09-04 10:09:06', 1);
INSERT INTO "accounting"."account" VALUES ('097fbfae-4b33-4291-8134-dea56af70664', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.02.0005', '12.10', 'DUE TO RELATED CONCERNS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:10:06', '2024-09-04 10:10:06', 1);
INSERT INTO "accounting"."account" VALUES ('6926e0bb-10dd-499b-ab2e-be7b6518d938', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05', '12.10', 'STATUTORY LIABILITIES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:11:21', '2024-09-04 10:11:21', 1);
INSERT INTO "accounting"."account" VALUES ('551cdf63-ec53-4ee3-8c0d-0188e8a99505', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0030', '12.10', 'PROVISIONS FOR INCOME TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:11:56', '2024-09-04 10:11:56', 1);
INSERT INTO "accounting"."account" VALUES ('82618a10-736a-43af-897a-aaa5b059b81d', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0035', '12.10', 'PROVISIONS FOR WEALTH TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:12:43', '2024-09-04 10:12:43', 1);
INSERT INTO "accounting"."account" VALUES ('5dc7f046-658a-4492-a6fb-f031932b6941', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0036', '12.10', 'PROVISIONS FOR FRINGE BENEFIT TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:13:48', '2024-09-04 10:13:48', 1);
INSERT INTO "accounting"."account" VALUES ('583301fb-27dc-4ccd-b2f7-e0640f312586', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0037', '12.10', 'PAYABLE   INTEREST ON FRINGE BENEFIT TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:14:30', '2024-09-04 10:14:30', 1);
INSERT INTO "accounting"."account" VALUES ('5a0d97be-b1a1-4369-8810-7de1954a0745', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0040', '12.10', 'PROVISIONS FOR DIVIDEND TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:15:15', '2024-09-04 10:15:15', 1);
INSERT INTO "accounting"."account" VALUES ('cf8aedde-7722-464d-9ba1-4c4eb4bb6324', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0065', '12.10', 'PAYABLE   EMPLOYEE PROFESSION TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:16:02', '2024-09-04 10:16:02', 1);
INSERT INTO "accounting"."account" VALUES ('2411f182-0bc1-47cc-9e22-e806e3c84945', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0100', '12.10', 'PAYABLE   LABOUR WELFARE FUND PAYABLE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:16:31', '2024-09-04 10:16:31', 1);
INSERT INTO "accounting"."account" VALUES ('dcd2b135-374e-4a83-8d8e-fa610d3ed080', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.05.0120', '12.10', 'VAT PAYABLE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:17:26', '2024-09-04 10:17:26', 1);
INSERT INTO "accounting"."account" VALUES ('2fe34267-1981-45fb-b427-c99ae12edbc5', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.20', '12.10', 'LONG-TERM DEBPOSIT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:18:12', '2024-09-04 10:18:12', 1);
INSERT INTO "accounting"."account" VALUES ('59eb2d21-7cad-445c-af21-dcec66ca817f', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.10.20.0005', '12.10', 'LONG-TERM DEBPOSIT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:18:49', '2024-09-04 10:18:49', 1);
INSERT INTO "accounting"."account" VALUES ('6d9e3f3a-3545-4ece-bf9b-53cc817d3e55', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15', '12', 'PAYABLES   PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:19:29', '2024-09-04 10:19:29', 1);
INSERT INTO "accounting"."account" VALUES ('3774007b-e743-43d1-b775-6ed74a15fa12', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01', '12.15', 'PAYABLES   PROVISIONS   EMPLOYEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:20:10', '2024-09-04 10:20:10', 1);
INSERT INTO "accounting"."account" VALUES ('8368e91f-56da-4e0f-b891-e8f45c190833', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0001', '12.15', 'NET WAGES CONTROL ACCOUNT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:50:40', '2024-09-04 10:50:40', 1);
INSERT INTO "accounting"."account" VALUES ('11c6be75-2b9a-4bf4-a033-61548c45f6dc', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0005', '12.15', 'GRATUITY   PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-04 10:51:38', '2024-09-04 10:51:38', 1);
INSERT INTO "accounting"."account" VALUES ('6155cc95-9974-4bd7-86a8-7cf9109f9f94', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0010', '12.15', 'LEAVE SALARY   PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:56:21', '2024-09-05 01:56:21', 1);
INSERT INTO "accounting"."account" VALUES ('faf5c449-83f2-4838-8536-00ca97bb46e0', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0020', '12.15', 'LEAVE PASSAGE   PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:56:53', '2024-09-05 01:56:53', 1);
INSERT INTO "accounting"."account" VALUES ('21d31e50-aa0c-424c-8725-90f4f2d8d94f', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0025', '12.15', 'BONUS   PROVISOINS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:57:21', '2024-09-05 01:57:21', 1);
INSERT INTO "accounting"."account" VALUES ('a612f29d-a09c-4b58-abab-ff5643ab9b1b', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.01.0030', '12.15', 'OTHERS   PROVISOINS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:57:48', '2024-09-05 01:57:48', 1);
INSERT INTO "accounting"."account" VALUES ('ca9b5738-3492-4a1b-804b-83a1754eea4c', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.02', '12.15', 'PROVISIONS FOR LEAVES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:58:19', '2024-09-05 01:58:19', 1);
INSERT INTO "accounting"."account" VALUES ('3b32d323-2ae3-4729-9c49-e9f9e3c58ef0', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.02.0005', '12.15', 'PROVISIONS FOR LEAVES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:58:48', '2024-09-05 01:58:48', 1);
INSERT INTO "accounting"."account" VALUES ('d655afbf-1045-445e-af4c-1ca1b0b924cd', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.05', '12.15', 'ACCRUED EXPENSES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:59:12', '2024-09-05 01:59:12', 1);
INSERT INTO "accounting"."account" VALUES ('a2972c4e-a10d-4133-8e16-86e9557b5b35', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.05.0001', '12.15', 'ACCRUAL PAYABLE   JOB RELATED', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 01:59:42', '2024-09-05 01:59:42', 1);
INSERT INTO "accounting"."account" VALUES ('c27349bb-ffe8-4f4a-a21d-0cb4b18ad5fc', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.05.0005', '12.15', 'ACCRUAL PAYABLE   GENERAL', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:00:03', '2024-09-05 02:00:03', 1);
INSERT INTO "accounting"."account" VALUES ('49961e4c-c1b0-463e-a1aa-54d842222d68', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.05.0010', '12.15', 'JOB RELATED - CLOSING PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:00:42', '2024-09-05 02:00:42', 1);
INSERT INTO "accounting"."account" VALUES ('b94eb519-67e6-42b8-8b11-150c44589b4a', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.20', '12.15', 'PROVISIONS FOR AIRFARE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:01:32', '2024-09-05 02:01:32', 1);
INSERT INTO "accounting"."account" VALUES ('3ec59520-d5bc-4206-9624-20bb5d575984', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.20.0005', '12.15', 'PROVISIONS FOR AIRFARE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:02:05', '2024-09-05 02:02:05', 1);
INSERT INTO "accounting"."account" VALUES ('1c8055be-acc6-4f6e-934a-50e27af1b1c4', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.40', '12.15', 'SERVICE BENEFITS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:02:28', '2024-09-05 02:02:28', 1);
INSERT INTO "accounting"."account" VALUES ('b261bfe2-1b1f-4c54-97ae-0734d4e6506d', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.40.0005', '12.15', 'SERVICE BENEFITS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:02:47', '2024-09-05 02:02:47', 1);
INSERT INTO "accounting"."account" VALUES ('42c9a2e0-6380-4804-8bb7-1a0d38103837', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.60', '12.15', 'OTHER PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:03:44', '2024-09-05 02:03:44', 1);
INSERT INTO "accounting"."account" VALUES ('8d064454-d5e1-4a03-aaea-b50d0cc783af', '67325d95-4634-40ac-b33a-29f18b0615ab', 'e186628a-d25b-45e2-bcc6-952cefdac9db', '12.15.60.0005', '12.15', 'OTHER PROVISIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:04:01', '2024-09-05 02:04:01', 1);
INSERT INTO "accounting"."account" VALUES ('ee319d9b-618a-4e8c-9c1e-4b43db8e4c45', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01', '13', 'TRADE INCOME', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:05:52', '2024-09-05 02:05:52', 1);
INSERT INTO "accounting"."account" VALUES ('c7f5ef21-11a6-4f65-a6ef-1ef0944dee31', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.10', '13.01', 'SALES AIR FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:08:41', '2024-09-05 02:08:41', 1);
INSERT INTO "accounting"."account" VALUES ('f9e3985e-40d5-4d41-90a9-6ead1c544adb', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.10.0001', '13.01', 'SALES AIR FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:09:13', '2024-09-05 02:09:13', 1);
INSERT INTO "accounting"."account" VALUES ('6cee1293-629d-4235-a840-13bb825a4512', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.15', '13.01', 'SALES AIR FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:09:45', '2024-09-05 02:09:45', 1);
INSERT INTO "accounting"."account" VALUES ('f8ab4d5b-12a4-450b-b318-8b2674ee221c', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.15.001', '13.01', 'SALES AIR FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:10:26', '2024-09-05 02:10:26', 1);
INSERT INTO "accounting"."account" VALUES ('91bf92ff-bde6-4d1d-9699-61393245181f', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.20', '13.01', 'SALES SEA FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:11:25', '2024-09-05 02:11:25', 1);
INSERT INTO "accounting"."account" VALUES ('e87def3d-65a4-498d-878e-181d975a3bfb', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.20.0001', '13.01', 'SALES SEA FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:12:07', '2024-09-05 02:12:07', 1);
INSERT INTO "accounting"."account" VALUES ('45f19fbd-60e3-4e99-a6af-5cef6c046d13', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.25', '13.01', 'SALES SEA FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:12:34', '2024-09-05 02:12:34', 1);
INSERT INTO "accounting"."account" VALUES ('13c2514b-d7ca-4aa1-b150-a8966ef16821', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.25.0001', '13.01', 'SALES SEA FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:23:37', '2024-09-05 02:23:37', 1);
INSERT INTO "accounting"."account" VALUES ('90c4ac56-38d6-4514-9bcb-b40ff403aa6f', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.30', '13.01', 'SALES LAND FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:25:21', '2024-09-05 02:25:21', 1);
INSERT INTO "accounting"."account" VALUES ('f06dc979-d487-459e-b6c0-f5be7e95774b', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.30.0001', '13.01', 'SALES LAND FREIGHT INBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:25:39', '2024-09-05 02:25:39', 1);
INSERT INTO "accounting"."account" VALUES ('5f8b4ce8-c557-4e33-b55b-2c4ece2c63c6', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.35', '13.01', 'SALES LAND FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:26:07', '2024-09-05 02:26:07', 1);
INSERT INTO "accounting"."account" VALUES ('cd264bb5-cd74-4173-b39f-c2042e5d4d85', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.35.0001', '13.01', 'SALES LAND FREIGHT OUTBOUND', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:26:54', '2024-09-05 02:26:54', 1);
INSERT INTO "accounting"."account" VALUES ('6d3d11ba-277e-41d2-afca-c440beefcda5', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.40.0001', '13.01', 'SALES CLEARANCE', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:27:39', '2024-09-05 02:27:39', 1);
INSERT INTO "accounting"."account" VALUES ('f9d4b3a9-57a5-48cf-9334-596085a0afdc', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.45', '13.01', 'SALES PACKING', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:27:59', '2024-09-05 02:27:59', 1);
INSERT INTO "accounting"."account" VALUES ('b1617c8a-ca48-4f78-bc0d-c6e71209eac3', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.40', '13.01', 'SALES CLEARANCE', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 02:27:20', '2024-09-05 02:28:32', 1);
INSERT INTO "accounting"."account" VALUES ('0ffb5570-b572-49cd-a96e-0261aa04bb71', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.45.0001', '13.01', 'SALES PACKING', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:29:13', '2024-09-05 02:29:13', 1);
INSERT INTO "accounting"."account" VALUES ('79693395-267b-45af-b663-5b8777f724e7', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.50', '13.01', 'SALES DELIVERY ORDERS', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:30:04', '2024-09-05 02:30:04', 1);
INSERT INTO "accounting"."account" VALUES ('1fc0193b-5967-42a5-841f-a5c5db2b7ebb', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.50.0001', '13.01', 'SALES DELIVERY ORDERS', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:30:27', '2024-09-05 02:30:27', 1);
INSERT INTO "accounting"."account" VALUES ('64e827ec-787b-4efd-ab40-3afde0533484', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.55', '13.01', 'SALES WAREHOUSING', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:35:24', '2024-09-05 02:35:24', 1);
INSERT INTO "accounting"."account" VALUES ('8119ce40-e8eb-404b-af92-7c5440722b53', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.55.0001', '13.01', 'SALES WAREHOUSING', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:35:51', '2024-09-05 02:35:51', 1);
INSERT INTO "accounting"."account" VALUES ('7c2d3bcd-1aa6-4a7c-82e6-a8878d9e4ec7', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.60', '13.01', 'SALES INSURANCE', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:36:29', '2024-09-05 02:36:29', 1);
INSERT INTO "accounting"."account" VALUES ('3c8249a7-ade3-42d7-a554-da6eb4c86176', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.60.0001', '13.01', 'SALES INSURANCE', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:36:46', '2024-09-05 02:36:46', 1);
INSERT INTO "accounting"."account" VALUES ('ab46dc37-0741-4a3b-82f2-1adca23eebd6', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.83', '13.01', 'SALES OTHERS TRUCKING SERVICES', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:37:19', '2024-09-05 02:37:19', 1);
INSERT INTO "accounting"."account" VALUES ('8b99a7f5-73ec-4986-ac96-bbf530fa8f49', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.01.83.0005', '13.01', 'SALES OTHERS TRUCKING SERVICES', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:37:44', '2024-09-05 02:37:44', 1);
INSERT INTO "accounting"."account" VALUES ('26976cfd-f373-4076-8f92-c0a39eb9b25f', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05', '13', 'NON TRADE INCOME', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:38:15', '2024-09-05 02:38:15', 1);
INSERT INTO "accounting"."account" VALUES ('99f30386-351b-415c-a1a1-20ae1d442d48', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01', '13.05', 'OTHER INCOME', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:39:00', '2024-09-05 02:39:00', 1);
INSERT INTO "accounting"."account" VALUES ('ab2ee64d-9476-4201-a312-c51fa32cbb7e', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0010', '13.05', 'PROFIT   LOSS ON SALE OF ASSET', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:40:10', '2024-09-05 02:40:10', 1);
INSERT INTO "accounting"."account" VALUES ('d9846475-9533-43e0-9675-edd6f4ad5645', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0015', '13.05', 'EXCHANGE GAIN   LOSS', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:41:23', '2024-09-05 02:41:23', 1);
INSERT INTO "accounting"."account" VALUES ('73c85ecd-a6f5-42fa-b6b5-eeae341596b7', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0020', '13.05', 'INTEREST RECEIVED', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:41:48', '2024-09-05 02:41:48', 1);
INSERT INTO "accounting"."account" VALUES ('b385d699-82be-45c4-9d5c-d10f52a6e0d5', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0025', '13.05', 'DIVIDEND RECEIVED', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:42:29', '2024-09-05 02:42:29', 1);
INSERT INTO "accounting"."account" VALUES ('ecaf5fe2-4c7d-4c7a-a27e-69b6a54ef399', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0030', '13.05', 'SUNDRY BALANCE WRITE BACK / OFF', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:42:54', '2024-09-05 02:42:54', 1);
INSERT INTO "accounting"."account" VALUES ('393a3b8c-e049-4a04-87bf-0f1ddfee43bd', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0005', '13.05', 'MISCELLANEOUS INCOME', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 02:39:36', '2024-09-05 02:43:34', 1);
INSERT INTO "accounting"."account" VALUES ('577598a8-9ece-4f00-bde4-ff1a0740129e', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0035', '13.05', 'BAD DEBTS WRITTEN OFF RECOVERED', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:44:05', '2024-09-05 02:44:05', 1);
INSERT INTO "accounting"."account" VALUES ('eb651c15-cbf1-4129-b484-091d8e63cd34', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.01.0040', '13.05', 'EXCESS PROVISION WRITTEN BACK', NULL, 'debit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:44:26', '2024-09-05 02:44:26', 1);
INSERT INTO "accounting"."account" VALUES ('45b306e6-810f-4473-845d-382e48f42b36', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01', '14', 'COST OF SALES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:45:28', '2024-09-05 02:45:28', 1);
INSERT INTO "accounting"."account" VALUES ('b3ecc46a-a74c-403e-a697-a2a9579faad4', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.10', '14.01', 'COST OF SALES AIR FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:45:53', '2024-09-05 02:45:53', 1);
INSERT INTO "accounting"."account" VALUES ('85024f2a-04c7-42da-b66b-73be402f2389', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.10.0001', '14.01', 'COST OF SALES AIR FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:46:15', '2024-09-05 02:46:15', 1);
INSERT INTO "accounting"."account" VALUES ('e981b1c7-6e10-4025-b936-069897365e67', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.15', '14.01', 'COST OF SALES AIR FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:46:44', '2024-09-05 02:46:44', 1);
INSERT INTO "accounting"."account" VALUES ('96d5aced-22ee-499d-b462-d1b1fb0cf94a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.15.0001', '14.01', 'COST OF SALES AIR FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:47:16', '2024-09-05 02:47:16', 1);
INSERT INTO "accounting"."account" VALUES ('adac5982-cfd0-4e2f-905c-cd3ce47d40aa', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.20', '14.01', 'COST OF SALES SEA FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:47:43', '2024-09-05 02:47:43', 1);
INSERT INTO "accounting"."account" VALUES ('5ac9eac9-61a1-4a27-8806-91ce21bacc6c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.20.0001', '14.01', 'COST OF SALES SEA FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 02:48:03', '2024-09-05 02:48:52', 1);
INSERT INTO "accounting"."account" VALUES ('50bcdc81-2af1-4599-896b-d22b29ccc1eb', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.25', '14.01', 'COST OF SALES SEA FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:49:29', '2024-09-05 02:49:29', 1);
INSERT INTO "accounting"."account" VALUES ('fb2cf14f-92fe-4781-a3e4-2c66f7155fcb', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.25.0001', '14.01', 'COST OF SALES SEA FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:49:50', '2024-09-05 02:49:50', 1);
INSERT INTO "accounting"."account" VALUES ('a3865e86-a368-4b9d-b8bf-ce3e40eeafe6', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.30', '14.01', 'COST OF SALES LAND FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:50:14', '2024-09-05 02:50:14', 1);
INSERT INTO "accounting"."account" VALUES ('256bee68-2131-4b52-975a-c71bd90e5208', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.30.0001', '14.01', 'COST OF SALES LAND FREIGHT INBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:50:37', '2024-09-05 02:50:37', 1);
INSERT INTO "accounting"."account" VALUES ('4f435798-e2da-4a46-a770-477bf7a087f3', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.30.0031', '14.01', 'OTHER OPERATIONAL EXPENSES OFFICE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:51:12', '2024-09-05 02:51:12', 1);
INSERT INTO "accounting"."account" VALUES ('3402a4f3-be84-4737-89ab-cf73ff5dafcf', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.30.0035', '14.01', 'TRUCK HIRE CHARGES   MONTHLY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:51:42', '2024-09-05 02:51:42', 1);
INSERT INTO "accounting"."account" VALUES ('d758712e-5972-4c45-9ffe-37774d272c8b', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.35', '14.01', 'COST OF SALES LAND FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:52:01', '2024-09-05 02:52:01', 1);
INSERT INTO "accounting"."account" VALUES ('f445a25f-e314-43ff-98bc-924be6aaa719', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.35.0001', '14.01', 'COST OF SALES LAND FREIGHT OUTBOUND', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:52:27', '2024-09-05 02:52:27', 1);
INSERT INTO "accounting"."account" VALUES ('11645490-5a83-4324-a553-642f2eb06b7a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.40', '14.01', 'COST OF SALES CLEARANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:52:49', '2024-09-05 02:52:49', 1);
INSERT INTO "accounting"."account" VALUES ('479bddc0-bede-4650-87ed-840f0a66da3e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.40.0001', '14.01', 'COST OF SALES CLEARANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:53:10', '2024-09-05 02:53:10', 1);
INSERT INTO "accounting"."account" VALUES ('3b190926-e4d0-42f5-b42e-cfe7ff30a594', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.40.0002', '14.01', 'COST OF SALES CLEARANCE_NON JOB', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:53:39', '2024-09-05 02:53:39', 1);
INSERT INTO "accounting"."account" VALUES ('f3e3ecc1-d269-4d81-bee0-e0940be4ef54', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.45', '14.01', 'COST OF SALES PACKING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:54:06', '2024-09-05 02:54:06', 1);
INSERT INTO "accounting"."account" VALUES ('1507d2c6-b082-48eb-a58d-69ee3e6ee3d0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.45.0001', '14.01', 'COST OF SALES PACKING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:54:25', '2024-09-05 02:54:25', 1);
INSERT INTO "accounting"."account" VALUES ('7d1e088d-7b7f-473e-8a3c-e9a11238b773', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.50', '14.01', 'COST OF SALES DELIVERY ORDERS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:54:56', '2024-09-05 02:54:56', 1);
INSERT INTO "accounting"."account" VALUES ('e7e4c752-04d4-4a77-984f-3ffbb33f3f2f', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.50.0001', '14.01', 'COST OF SALES DELIVERY ORDERS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:55:21', '2024-09-05 02:55:21', 1);
INSERT INTO "accounting"."account" VALUES ('1671b9af-fef3-4435-8db7-a17e2288527d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.55', '14.01', 'COST OF SALES WAREHOUSING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:55:58', '2024-09-05 02:55:58', 1);
INSERT INTO "accounting"."account" VALUES ('f23345c3-26ce-467c-8e34-440bbb89f72a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.55.0001', '14.01', 'COST OF SALES WAREHOUSING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:56:46', '2024-09-05 02:56:46', 1);
INSERT INTO "accounting"."account" VALUES ('bcd77181-a61d-472a-b948-c839c365fcbd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.60', '14.01', 'COST OF SALES INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:57:03', '2024-09-05 02:57:03', 1);
INSERT INTO "accounting"."account" VALUES ('d54678b0-01cf-4bb7-9c93-9b9b06b7fb24', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.60.0001', '14.01', 'COST OF SALES INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:57:21', '2024-09-05 02:57:21', 1);
INSERT INTO "accounting"."account" VALUES ('5f232ee7-d491-4770-9f44-f4bb3247e010', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.83', '14.01', 'COST OF SALES OTHERS TRUCKING SERVICES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:58:04', '2024-09-05 02:58:04', 1);
INSERT INTO "accounting"."account" VALUES ('1cbed5fc-7c7c-4586-a1bd-6ba351604762', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.01.83.0005', '14.01', 'COST OF SALES OTHERS TRUCKING SERVICES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:58:22', '2024-09-05 02:58:22', 1);
INSERT INTO "accounting"."account" VALUES ('d749381e-ae40-4275-9fd4-939d615dac86', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05', '14', 'PERSONNEL   ADMINISTRATIVE OVERHEADS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:58:48', '2024-09-05 02:58:48', 1);
INSERT INTO "accounting"."account" VALUES ('2bf8ffb0-7661-4044-a668-3226a3e87921', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.01', '14.05', 'MANAGEMENT COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 02:59:24', '2024-09-05 02:59:24', 1);
INSERT INTO "accounting"."account" VALUES ('11f23ff5-f35a-44ed-9952-e12e31232a6a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.01.0005', '14.05', 'DIRECTORS REMUNERATION', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:00:06', '2024-09-05 03:00:06', 1);
INSERT INTO "accounting"."account" VALUES ('50e73017-2dfe-4996-a126-60d7b04c73d5', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.01.0015', '14.05', 'DIRECTORS INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:00:49', '2024-09-05 03:00:49', 1);
INSERT INTO "accounting"."account" VALUES ('c59e1121-8b72-48f8-8361-6c5971545fc4', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.01.0010', '14.05', 'DIRECTORS RESIDENCE RENT', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 03:00:25', '2024-09-05 03:01:25', 1);
INSERT INTO "accounting"."account" VALUES ('3e87f462-07ba-4b7d-b5c1-2dab741d7870', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.02', '14.05', 'OFFICE RENT   UTILITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:01:56', '2024-09-05 03:01:56', 1);
INSERT INTO "accounting"."account" VALUES ('aed96709-31d0-4dff-994c-07635e00dc1e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.02.0001', '14.05', 'OFFICE RENT   UTILITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:02:17', '2024-09-05 03:02:17', 1);
INSERT INTO "accounting"."account" VALUES ('2d712743-596d-427d-84c7-811bd4467bd0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.03', '14.05', 'OFFICE INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:02:43', '2024-09-05 03:02:43', 1);
INSERT INTO "accounting"."account" VALUES ('87626a54-367e-4e9f-a356-b685ab74aa22', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.03.0001', '14.05', 'OFFICE INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:03:09', '2024-09-05 03:03:09', 1);
INSERT INTO "accounting"."account" VALUES ('87ffe770-fb39-4237-82dc-7efff8c3c8b9', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.04', '14.05', 'PRINTINGS   STATIONERY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:03:41', '2024-09-05 03:03:41', 1);
INSERT INTO "accounting"."account" VALUES ('68b20c07-1e43-4d2c-a7f1-d8e4f96a8bf7', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.04.0001', '14.05', 'PRINTINGS   STATIONERY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:03:58', '2024-09-05 03:03:58', 1);
INSERT INTO "accounting"."account" VALUES ('14e3a9bb-9dc6-445d-9d4d-2064e02ffce8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05', '14.05', 'MANPOWER COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:04:23', '2024-09-05 03:04:23', 1);
INSERT INTO "accounting"."account" VALUES ('4c79f55e-0481-480b-bbb2-2abf000f19cc', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0005', '14.05', 'BASIC SALARY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:05:03', '2024-09-05 03:05:03', 1);
INSERT INTO "accounting"."account" VALUES ('5694f79c-a447-4ce2-8ce8-0fe541f488fb', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0010', '14.05', 'HOUSE RENT ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:05:22', '2024-09-05 03:05:22', 1);
INSERT INTO "accounting"."account" VALUES ('4de58e4c-1986-42ee-a30e-255d66f9c7e8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0015', '14.05', 'CAR ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:05:40', '2024-09-05 03:05:40', 1);
INSERT INTO "accounting"."account" VALUES ('ddfc7848-6dc2-480a-a794-4cd883cc60e2', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0020', '14.05', 'TRANSPORT ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:06:14', '2024-09-05 03:06:14', 1);
INSERT INTO "accounting"."account" VALUES ('64b0680f-de74-4ebc-9250-f5f2ffc15d6a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0025', '14.05', 'FURNISHING ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:06:44', '2024-09-05 03:06:44', 1);
INSERT INTO "accounting"."account" VALUES ('d4d63e33-7537-44b8-b9c8-e7b7e9e8f7cd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0030', '14.05', 'COST OF LIVING ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:07:15', '2024-09-05 03:07:15', 1);
INSERT INTO "accounting"."account" VALUES ('9a2d4344-9c35-4167-9bd2-30c0a493a7b8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0035', '14.05', 'PERFOMANCE ALLOWANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:07:40', '2024-09-05 03:07:40', 1);
INSERT INTO "accounting"."account" VALUES ('fe2f8076-8a36-4359-a319-627daa24cd4f', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0045', '14.05', 'EX GRATIA', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:08:06', '2024-09-05 03:08:06', 1);
INSERT INTO "accounting"."account" VALUES ('42f07c5b-e750-4fbb-a5a6-217a5fc6fe3d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0050', '14.05', 'INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:08:43', '2024-09-05 03:08:43', 1);
INSERT INTO "accounting"."account" VALUES ('54191794-a734-400d-af04-160281a4b978', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0055', '14.05', 'OVERTIME', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:09:00', '2024-09-05 03:09:00', 1);
INSERT INTO "accounting"."account" VALUES ('3eb1cf83-a13f-4a35-b835-2bfdc7e64ceb', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0060', '14.05', 'BONUS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:09:43', '2024-09-05 03:09:43', 1);
INSERT INTO "accounting"."account" VALUES ('7b5d7d8f-3b55-4842-b7be-4630a4293702', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0065', '14.05', 'GRATUITY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:10:01', '2024-09-05 03:10:01', 1);
INSERT INTO "accounting"."account" VALUES ('d9c34456-5656-4758-99e9-50bf42286cd2', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0070', '14.05', 'LEAVE SALARY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:10:29', '2024-09-05 03:10:29', 1);
INSERT INTO "accounting"."account" VALUES ('671d1ce6-54c8-4405-9ce7-771660c0e27a', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.05.05.0075', '13.05', 'LEAVE PASSAGE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:10:49', '2024-09-05 03:10:49', 1);
INSERT INTO "accounting"."account" VALUES ('c33e9fc8-ffd6-45b1-a29b-5097cdf2e5b0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0080', '14.05', 'WELFARE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:11:15', '2024-09-05 03:11:15', 1);
INSERT INTO "accounting"."account" VALUES ('f0e90e98-0925-4f87-82b7-dfbe4d7c162e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0085', '14.05', 'UNIFORM', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:12:08', '2024-09-05 03:12:08', 1);
INSERT INTO "accounting"."account" VALUES ('b15df779-7709-4f64-ac6e-31b96d580c4b', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0130', '14.05', 'TRAINING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:12:41', '2024-09-05 03:12:41', 1);
INSERT INTO "accounting"."account" VALUES ('240a593a-6dac-4039-a1f2-94f3fbc61a68', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.05.0135', '14.05', 'RECRUITMENT EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 03:13:15', '2024-09-05 03:13:30', 1);
INSERT INTO "accounting"."account" VALUES ('c6a2a78e-2afe-4b10-a482-d9703bb07d52', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.06', '14.05', 'POSTAGES   COURIER', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:14:02', '2024-09-05 03:14:02', 1);
INSERT INTO "accounting"."account" VALUES ('30afa2e3-6739-4313-8394-3b50dd1a0910', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.06.0001', '14.05', 'POSTAGES   COURIER', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:14:30', '2024-09-05 03:14:30', 1);
INSERT INTO "accounting"."account" VALUES ('e1881b8c-1c65-4034-bee8-f72c73ee97cb', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.07', '14.05', 'VISAS   FORMALITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:14:58', '2024-09-05 03:14:58', 1);
INSERT INTO "accounting"."account" VALUES ('11aad8c6-a064-4c1e-a757-a922d0922192', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.07.0001', '14.05', 'VISAS   FORMALITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:15:34', '2024-09-05 03:15:34', 1);
INSERT INTO "accounting"."account" VALUES ('a1da8234-e401-4e90-b0a1-43a564fc7aec', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.08', '14.05', 'MEDICAL INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:16:11', '2024-09-05 03:16:11', 1);
INSERT INTO "accounting"."account" VALUES ('92de9339-a307-4d6d-b839-134bc05b82ff', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.08.0001', '14.05', 'MEDICAL INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:16:35', '2024-09-05 03:16:35', 1);
INSERT INTO "accounting"."account" VALUES ('3d33a879-a89a-4b68-99a4-6d8f2196ba8a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.10', '14.05', 'PROPERTY COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:17:13', '2024-09-05 03:17:13', 1);
INSERT INTO "accounting"."account" VALUES ('66819ce1-87f0-41d9-bd39-cf57d95c0c17', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.10.0001', '14.05', 'PROPERTY COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:17:39', '2024-09-05 03:17:39', 1);
INSERT INTO "accounting"."account" VALUES ('2859745e-29a0-400d-95d5-730237e05a37', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.10.0006', '14.05', 'SERVICE CHARGES   DAFZA', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:18:04', '2024-09-05 03:18:04', 1);
INSERT INTO "accounting"."account" VALUES ('b0fc8272-aa7f-48d9-967c-5e3276320af1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.10.0010', '14.05', 'RATES   TAXES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:20:26', '2024-09-05 03:20:26', 1);
INSERT INTO "accounting"."account" VALUES ('2d50370d-e2e7-41a8-9a4b-98c351ff8a3e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.10.0015', '14.05', 'SECURITY CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:20:49', '2024-09-05 03:20:49', 1);
INSERT INTO "accounting"."account" VALUES ('13cb6665-ac32-49d4-8c4d-59cf117e8398', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.12', '14.05', 'REPAIRS   MAINTENANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:21:21', '2024-09-05 03:21:21', 1);
INSERT INTO "accounting"."account" VALUES ('3e59593c-8a76-4e0e-8635-d1577ee67307', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.12.0025', '14.05', 'REPAIRS   MAINTENANCE PROPERTY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:21:45', '2024-09-05 03:21:45', 1);
INSERT INTO "accounting"."account" VALUES ('f48d002e-6294-44bc-9c1c-3103deb3d08c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.12.0030', '14.05', 'REPAIRS   MAINTENANCE ASSET', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:22:10', '2024-09-05 03:22:10', 1);
INSERT INTO "accounting"."account" VALUES ('e600d061-69f9-431d-98db-f367b94ac8e4', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.13', '14.05', 'UTILITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:22:37', '2024-09-05 03:22:37', 1);
INSERT INTO "accounting"."account" VALUES ('1b341bf5-ef75-4680-8823-53c8cc297604', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.13.0045', '14.05', 'WATER CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:23:08', '2024-09-05 03:23:08', 1);
INSERT INTO "accounting"."account" VALUES ('6a9c0e62-0ea3-440f-978f-631d8056c40d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.13.0050', '14.05', 'ELECTRICITY CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:23:51', '2024-09-05 03:23:51', 1);
INSERT INTO "accounting"."account" VALUES ('48b7d147-c211-4319-8833-6ba5989168dd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.13.0090', '14.05', 'GUEST HOUSE EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:24:16', '2024-09-05 03:24:16', 1);
INSERT INTO "accounting"."account" VALUES ('da9ee9df-0a3b-49c6-900c-b38772d5863a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15', '14.05', 'COMMUNICATION COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:24:40', '2024-09-05 03:24:40', 1);
INSERT INTO "accounting"."account" VALUES ('a3dcd8d3-8a46-4876-9c03-56e5f00a2ec5', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15.0005', '14.05', 'TELEPHONE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:25:06', '2024-09-05 03:25:06', 1);
INSERT INTO "accounting"."account" VALUES ('4498558e-b429-4ff9-a0b7-55864f1c6276', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15.0010', '14.05', 'FAX', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:25:36', '2024-09-05 03:25:36', 1);
INSERT INTO "accounting"."account" VALUES ('0effffb4-675c-4a8c-a7e2-7c24f79569fa', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15.0015', '14.05', 'MOBILES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:26:03', '2024-09-05 03:26:03', 1);
INSERT INTO "accounting"."account" VALUES ('ae56841c-b85d-43e3-adab-7f898a387136', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15.0020', '14.05', 'INTERNET', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:26:28', '2024-09-05 03:26:28', 1);
INSERT INTO "accounting"."account" VALUES ('c10af78e-f437-428a-8230-166220dbcbca', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.15.0040', '14.05', 'COMMUNICATION COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:26:49', '2024-09-05 03:26:49', 1);
INSERT INTO "accounting"."account" VALUES ('9bae6480-b828-4c6e-9a5f-65bf49d01314', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.20', '14.05', 'TRAVEL', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:27:08', '2024-09-05 03:27:08', 1);
INSERT INTO "accounting"."account" VALUES ('d7050987-d4b2-483f-9444-173828985dc6', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.20.0005', '14.05', 'BUSINESS TRAVEL EXPENSES   DOMESTIC', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:27:38', '2024-09-05 03:27:38', 1);
INSERT INTO "accounting"."account" VALUES ('06d37437-7d0c-4f2d-8f14-28af568bf7f2', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.20.0010', '14.05', 'BUSINESS TRAVEL EXPENSES   INTERNATIONAL', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:28:08', '2024-09-05 03:28:08', 1);
INSERT INTO "accounting"."account" VALUES ('4ea81e51-5114-47b5-9a98-ec617ff93e26', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.25', '14.05', 'ADVERTISMENT   PROMOTION', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:29:46', '2024-09-05 03:29:46', 1);
INSERT INTO "accounting"."account" VALUES ('90543044-b5c2-427e-a1d1-2492e5e8bb58', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.25.0005', '14.05', 'ADVERTISIMENT   NEWS PAPER   MAGAZINE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:30:17', '2024-09-05 03:30:17', 1);
INSERT INTO "accounting"."account" VALUES ('9291162b-ee63-4bc7-b57a-09d97b90703b', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.25.0010', '14.05', 'ADVERTISIMENT   DIRECTORY', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:30:39', '2024-09-05 03:30:39', 1);
INSERT INTO "accounting"."account" VALUES ('df180953-458f-46e4-8b87-93a28333ce2f', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.25.0020', '14.05', 'GIFTS   GIVEAWAYS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:30:56', '2024-09-05 03:30:56', 1);
INSERT INTO "accounting"."account" VALUES ('c7b66d87-c69c-4deb-94cf-c5b1c26a7f75', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.25.0030', '14.05', 'ADVERTISEMENT MARKETING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:31:21', '2024-09-05 03:31:21', 1);
INSERT INTO "accounting"."account" VALUES ('b943a436-1b28-4003-bf45-196d4b4c8a2a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.30', '14.05', 'OTHER EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:31:48', '2024-09-05 03:31:48', 1);
INSERT INTO "accounting"."account" VALUES ('ef50dc16-0b84-4873-8321-1c7e42971c74', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.30.0001', '14.05', 'CAFETERIA EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:32:20', '2024-09-05 03:32:20', 1);
INSERT INTO "accounting"."account" VALUES ('86237eb0-bbe1-4110-ac39-d3d357467b5e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.30.0025', '14.05', 'BOOKS   PERIODICALS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:32:44', '2024-09-05 03:32:44', 1);
INSERT INTO "accounting"."account" VALUES ('a7af802b-5808-4770-94d7-ae117cd4152f', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.30.0030', '14.05', 'DONATIONS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:33:13', '2024-09-05 03:33:13', 1);
INSERT INTO "accounting"."account" VALUES ('a69c68e2-9eef-4831-a78f-04087fccb3fe', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.30.000', '14.05', 'SUNDRY EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:33:31', '2024-09-05 03:33:31', 1);
INSERT INTO "accounting"."account" VALUES ('1f2889fe-a917-4bea-9956-4f37a7daa0f9', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35', '14.05', 'VEHICLE RUNNING EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:33:50', '2024-09-05 03:33:50', 1);
INSERT INTO "accounting"."account" VALUES ('48a809ed-de2f-496b-8b95-dcba92b229f0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0010', '14.05', 'REPAIR   MAINTENANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:34:21', '2024-09-05 03:34:21', 1);
INSERT INTO "accounting"."account" VALUES ('b92ddddd-739f-4a7d-9bcc-96e28c3318c5', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0015', '14.05', 'VEHICLE INSURANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:34:45', '2024-09-05 03:34:45', 1);
INSERT INTO "accounting"."account" VALUES ('3b31ca19-b457-4fe7-b53e-08d6b80ca678', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0020', '14.05', 'FUEL   OIL', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:35:07', '2024-09-05 03:35:07', 1);
INSERT INTO "accounting"."account" VALUES ('478dd47a-c7e9-4df0-8a27-22a4caad5b63', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0025', '14.05', 'VEHICLE REGISTRATION FEES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:35:26', '2024-09-05 03:35:26', 1);
INSERT INTO "accounting"."account" VALUES ('f47a0cf0-2bd8-4ad9-8050-2488635b87ff', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0030', '14.05', 'PARKING FEE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:35:44', '2024-09-05 03:35:44', 1);
INSERT INTO "accounting"."account" VALUES ('9c2d5f57-bee9-4815-997d-b96c561544af', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0035', '14.05', 'VEHICLE HIRE CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:36:18', '2024-09-05 03:36:18', 1);
INSERT INTO "accounting"."account" VALUES ('72b592d7-c654-4847-be66-5827988949ad', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.35.0040', '14.05', 'SALIK CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:37:03', '2024-09-05 03:37:03', 1);
INSERT INTO "accounting"."account" VALUES ('544dfa41-09d0-4b35-94c5-c59c7c969599', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.06', '14', 'ENTERTAINMENT EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:37:48', '2024-09-05 03:37:48', 1);
INSERT INTO "accounting"."account" VALUES ('9d6fc607-d12e-432d-b94b-b069572c200e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.06.45', '14.06', 'ENTERTAINMENT EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:38:19', '2024-09-05 03:38:19', 1);
INSERT INTO "accounting"."account" VALUES ('223a06a5-1e5b-42d7-a77c-ae71f670a38a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.06.45.0005', '14.06', 'ENTERTAINMENT GUEST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:38:45', '2024-09-05 03:38:45', 1);
INSERT INTO "accounting"."account" VALUES ('63533e84-919c-4d9f-aa5c-9f7aa786c83e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.06.45.0010', '14.06', 'ENTERTAINMENT STAFF', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:39:20', '2024-09-05 03:39:20', 1);
INSERT INTO "accounting"."account" VALUES ('6723ef9b-1f38-4e1d-8dd4-b8184d3a7f7a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.06.55', '14.06', 'COST OF SALES WAREHOUSING', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 03:40:05', '2024-09-05 03:40:17', 1);
INSERT INTO "accounting"."account" VALUES ('59a623a0-be1b-4dfb-b059-37e9389d20e1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.07', '14', 'INSURANCE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:40:47', '2024-09-05 03:40:47', 1);
INSERT INTO "accounting"."account" VALUES ('9d687e82-530d-4bfe-87ec-c0646d909f53', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.07.50', '14.07', 'INSURANCE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:41:16', '2024-09-05 03:41:16', 1);
INSERT INTO "accounting"."account" VALUES ('ddf5b30d-f8f7-4713-b2c3-6dd340f7a336', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.07.50.0005', '14.07', 'FF LIABILITY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:41:47', '2024-09-05 03:41:47', 1);
INSERT INTO "accounting"."account" VALUES ('31df88e0-4540-4f85-a2e5-acbc68a1028b', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.07.50.0010', '14.07', 'THIRD PARTY LIABILITY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 03:42:16', '2024-09-05 03:42:26', 1);
INSERT INTO "accounting"."account" VALUES ('00f00b31-f0e4-4d75-9d51-9aca65869c73', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.07.50.0015', '14.07', 'OTHER INSURANCE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:42:49', '2024-09-05 03:42:49', 1);
INSERT INTO "accounting"."account" VALUES ('5d3c804a-da6d-4aea-a856-d5a89a152f7c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08', '14', 'LEGAL   STATUTORY COST', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:43:20', '2024-09-05 03:43:20', 1);
INSERT INTO "accounting"."account" VALUES ('c5ddff53-1ef4-4518-8d4b-99730bb4aad3', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40', '14.08', 'LEGAL   STATUTORY COST', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:43:45', '2024-09-05 03:43:45', 1);
INSERT INTO "accounting"."account" VALUES ('d327099b-aa7e-4c7a-bb3d-104413210ae6', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0015', '14.08', 'PROFESSIONAL FEE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:44:19', '2024-09-05 03:44:19', 1);
INSERT INTO "accounting"."account" VALUES ('11dbb78e-5daf-4dc3-b468-fae5dd076d3e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0020', '14.08', 'LEGAL FEE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:45:03', '2024-09-05 03:45:03', 1);
INSERT INTO "accounting"."account" VALUES ('a0e06c96-856b-4d3e-b640-b831d89a4896', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0025', '14.08', 'COMPUTER CONSULTANCY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:45:25', '2024-09-05 03:45:25', 1);
INSERT INTO "accounting"."account" VALUES ('395a1a74-a1fb-4d49-aca8-260bdeba3cb4', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0030', '14.08', 'SOFTWARE RENTAL', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:45:43', '2024-09-05 03:45:43', 1);
INSERT INTO "accounting"."account" VALUES ('41d5b871-99a6-4e0b-81c8-828b90ab73c8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0040', '14.08', 'TRADE LICENSE FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:46:22', '2024-09-05 03:46:22', 1);
INSERT INTO "accounting"."account" VALUES ('2fc20372-7418-4214-aed7-afe74a3203db', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.40.0050', '14.08', 'ACCOUNTING FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:46:43', '2024-09-05 03:46:43', 1);
INSERT INTO "accounting"."account" VALUES ('c25f054e-645d-4739-91f0-9923fcdf6831', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.50', '14.08', 'SUBSCRIPTION FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:47:22', '2024-09-05 03:47:22', 1);
INSERT INTO "accounting"."account" VALUES ('b795c3ad-b0e3-451c-94c2-2ce98f280cf9', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.50.0001', '14.08', 'SUBSCRIPTION FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:47:44', '2024-09-05 03:47:44', 1);
INSERT INTO "accounting"."account" VALUES ('927caf59-68d8-4712-a665-bf959c095d70', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.60', '14.08', 'SPONSORSHIP AND CONSULTANCY FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:48:12', '2024-09-05 03:48:12', 1);
INSERT INTO "accounting"."account" VALUES ('0c502a0e-6618-49a2-b22b-2d0c15743663', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.60.0001', '14.08', 'SPONSORSHIP AND CONSULTANCY FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:48:32', '2024-09-05 03:48:32', 1);
INSERT INTO "accounting"."account" VALUES ('8230d800-18e3-4b66-9fa5-b3fd377c832c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.70', '14.08', 'AUDIT FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:48:49', '2024-09-05 03:48:49', 1);
INSERT INTO "accounting"."account" VALUES ('3c24c941-cec7-4182-a35a-630b4d084c51', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.08.70.0001', '14.08', 'AUDIT FEES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:49:49', '2024-09-05 03:49:49', 1);
INSERT INTO "accounting"."account" VALUES ('8f6d5158-d570-43ff-8366-e8cda4115517', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10', '14', 'FINANCE EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:50:28', '2024-09-05 03:50:28', 1);
INSERT INTO "accounting"."account" VALUES ('73ed3f4f-8a2a-4a10-9e97-1546ed53f646', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01', '14.10', 'INTEREST EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:50:53', '2024-09-05 03:50:53', 1);
INSERT INTO "accounting"."account" VALUES ('bb8b19de-9c97-4ee3-8e2d-a6bf57e32905', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01.0005', '14.10', 'INTEREST   OVERDRAFT', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:51:22', '2024-09-05 03:51:22', 1);
INSERT INTO "accounting"."account" VALUES ('7d2c71b6-5613-4936-9151-7d9412dbda4f', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01.0010', '14.10', 'INTEREST   TERM LOANS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:51:50', '2024-09-05 03:51:50', 1);
INSERT INTO "accounting"."account" VALUES ('48e6225d-7d46-46c6-b1bf-d276ccf8d37d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01.0015', '14.10', 'INTEREST   LEASE   HIRE PURCHASE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:52:16', '2024-09-05 03:52:16', 1);
INSERT INTO "accounting"."account" VALUES ('84ac7e7b-1ee6-4d67-a967-08627160491a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01.0020', '14.10', 'INTEREST ON FRINGE BENEFIT TAX', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:52:39', '2024-09-05 03:52:39', 1);
INSERT INTO "accounting"."account" VALUES ('cf888555-a9e0-4b98-8e66-1078a3423560', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.01.0100', '14.10', 'INTEREST   OTHERS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:52:57', '2024-09-05 03:52:57', 1);
INSERT INTO "accounting"."account" VALUES ('7d0c73fa-b2a0-4a7c-91ab-bb5aca6c61db', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.05', '14.10', 'BANK CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:53:38', '2024-09-05 03:53:38', 1);
INSERT INTO "accounting"."account" VALUES ('f1a47737-ee44-47d5-9597-059fbc987992', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.05.0005', '14.10', 'BANK CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:54:02', '2024-09-05 03:54:02', 1);
INSERT INTO "accounting"."account" VALUES ('fd1a27cc-90ae-45c0-8f1b-4059aabfe8b7', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.05.0010', '14.10', 'BANK GAURANTEE CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:54:19', '2024-09-05 03:54:19', 1);
INSERT INTO "accounting"."account" VALUES ('6b61c09b-3991-4310-8604-be4394b54395', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.10.05.0015', '14.10', 'BANK OTHER CHARGES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:54:44', '2024-09-05 03:54:44', 1);
INSERT INTO "accounting"."account" VALUES ('53fbbb4b-6cbc-4e5f-a64f-e1241f92265d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15', '14', 'NON CASH COST', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:55:18', '2024-09-05 03:55:18', 1);
INSERT INTO "accounting"."account" VALUES ('ae5772bb-5cb1-4657-a953-bc04b0d2103e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01', '14.15', 'DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:55:45', '2024-09-05 03:55:45', 1);
INSERT INTO "accounting"."account" VALUES ('08c2c7ed-18d9-4953-b9d6-75bd4e376665', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0001', '14.15', 'LAND', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:56:13', '2024-09-05 03:56:13', 1);
INSERT INTO "accounting"."account" VALUES ('2a7b13dd-7127-4881-bd00-f233f40acf69', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0004', '14.15', 'DEPRECIATION OTHERS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:56:51', '2024-09-05 03:56:51', 1);
INSERT INTO "accounting"."account" VALUES ('e680d746-6b5b-4a66-ad7f-aeac70ef1374', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0010', '14.15', 'OFFICE BUILDING', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:57:14', '2024-09-05 03:57:14', 1);
INSERT INTO "accounting"."account" VALUES ('c4a45f22-7f4b-4a98-9b97-1c2d8f4cdc56', '3a423be5-ed00-4dfe-a408-fbd18cce007b', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '11.15.01.0015', '11.15', 'PLANT   MACHINERY', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:57:45', '2024-09-05 03:57:45', 1);
INSERT INTO "accounting"."account" VALUES ('065b0f40-ee7c-4671-8dd6-cdcbcb185704', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0020', '14.15', 'ELECTRICAL INSTALLATIONS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:58:06', '2024-09-05 03:58:06', 1);
INSERT INTO "accounting"."account" VALUES ('03d41de7-2608-4388-ac5f-a41b60f17e8a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.05.01.0025', '14.05', 'OFFICE EQUIPMENTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:58:26', '2024-09-05 03:58:26', 1);
INSERT INTO "accounting"."account" VALUES ('a1b59b0d-0723-4e0c-b54f-1cc3d9c64ed7', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0030', '14.15', 'COMPUTER HARDWARE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 03:58:59', '2024-09-05 03:58:59', 1);
INSERT INTO "accounting"."account" VALUES ('02fb21ec-6001-4ba9-ba16-81b6558697c5', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0035', '14.15', 'FURNITURE   FIXTURES   OFFICE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:00:07', '2024-09-05 04:00:07', 1);
INSERT INTO "accounting"."account" VALUES ('d0a2df9f-cb4a-41f3-bcab-903c71807f31', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0040', '14.15', 'FURNITURE   FIXTURES   RESIDENCE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:00:41', '2024-09-05 04:00:41', 1);
INSERT INTO "accounting"."account" VALUES ('6192472a-73bf-42eb-a6c7-5536de0686cd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0045', '14.15', 'LEASEHOLD IMPROVEMENTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:01:12', '2024-09-05 04:01:12', 1);
INSERT INTO "accounting"."account" VALUES ('946c0f61-8e76-42f8-9114-9ab461592fa8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0055', '14.15', 'MOTOR CYCLES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:01:37', '2024-09-05 04:01:37', 1);
INSERT INTO "accounting"."account" VALUES ('085b614e-af78-4c62-95e1-7775a12030ef', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0060', '14.15', 'FORKLIFTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:02:41', '2024-09-05 04:02:41', 1);
INSERT INTO "accounting"."account" VALUES ('349c7369-b8c9-461b-ac7e-d7169869670e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0065', '14.15', 'TRUCK / PICKUPS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:03:15', '2024-09-05 04:03:15', 1);
INSERT INTO "accounting"."account" VALUES ('6aabf513-687a-43dd-ba1f-24de3e6a0d50', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0070', '14.15', 'TRAILERS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:03:35', '2024-09-05 04:03:35', 1);
INSERT INTO "accounting"."account" VALUES ('e8a52817-5040-432a-a47b-b288da258149', 'd6b04961-8cc4-4952-8162-1eaae78d6ef0', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '13.15.01.0075', '13.15', 'RACKING AND WHS OTHER EQUIPMENT', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:03:54', '2024-09-05 04:03:54', 1);
INSERT INTO "accounting"."account" VALUES ('353e7867-ce00-471a-98a3-755325551638', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0080', '14.15', 'INTANGIBLE ASSETS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:04:28', '2024-09-05 04:04:28', 1);
INSERT INTO "accounting"."account" VALUES ('266d36b1-95b2-4ae4-bf7b-6fa16dcf95a1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.15.01.0099', '14.15', 'PRELIMINARY EXPENSE WRITTEN OFF', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:04:47', '2024-09-05 04:04:47', 1);
INSERT INTO "accounting"."account" VALUES ('1a346ab1-afcc-4b85-862c-d82afd5f6060', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.01', '14.20', 'BAD DEBTS WRITTEN OFF', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:05:14', '2024-09-05 04:05:14', 1);
INSERT INTO "accounting"."account" VALUES ('da3278fb-ea27-4ecf-9bab-f28823a11570', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.01.0005', '14.20', 'BAD DEBTS WRITTEN OFF', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:05:50', '2024-09-05 04:05:50', 1);
INSERT INTO "accounting"."account" VALUES ('1fe93275-4f49-423c-bd07-7d87d1778721', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20', '14', 'BAD DEBTS WRITTEN OFF', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:06:39', '2024-09-05 04:06:39', 1);
INSERT INTO "accounting"."account" VALUES ('72288559-69cb-4d98-ae80-183277cfedcc', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.01.0010', '14.20', 'PROVISION FOR DOUBTFUL DEBTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 04:07:16', '2024-09-05 04:07:49', 1);
INSERT INTO "accounting"."account" VALUES ('ad4cbbfd-878d-496a-b039-7697fdc69bca', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.02', '14.20', 'BAD   DOUBTFUL DEBTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:08:09', '2024-09-05 04:08:09', 1);
INSERT INTO "accounting"."account" VALUES ('ecac3a4d-9419-4381-92b1-882172daca6d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.02.0005', '14.20', 'BAD DEBTS WRITTEN OFF', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:08:52', '2024-09-05 04:08:52', 1);
INSERT INTO "accounting"."account" VALUES ('27bc64ca-97e9-4951-84e3-d7a525a6a8e1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.20.02.0010', '14.20', 'PROVISION FOR DOUBTFUL DEBTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:09:29', '2024-09-05 04:09:29', 1);
INSERT INTO "accounting"."account" VALUES ('0cbe4d7f-5cfc-495c-96c3-f74bde2d06a5', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25', '14', 'TAXES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:10:14', '2024-09-05 04:10:14', 1);
INSERT INTO "accounting"."account" VALUES ('15c2e9ff-ab27-40a8-8c1d-170b45cd3c42', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01', '14.25', 'TAXES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:11:09', '2024-09-05 04:11:09', 1);
INSERT INTO "accounting"."account" VALUES ('b9e94f48-cbc2-43af-9495-f3ce3a85de11', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0001', '14.25', 'INCOME TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:11:33', '2024-09-05 04:11:33', 1);
INSERT INTO "accounting"."account" VALUES ('e994ab10-6308-4562-bc4c-626c023a9fae', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0005', '14.25', 'WEALTH TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:12:00', '2024-09-05 04:12:00', 1);
INSERT INTO "accounting"."account" VALUES ('0629c3b4-b94b-4edf-b431-b6ecdf777f12', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0010', '14.25', 'DEFERRED TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:12:31', '2024-09-05 04:12:31', 1);
INSERT INTO "accounting"."account" VALUES ('4c95404c-eace-41ac-9606-f26ce85363bd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0015', '14.25', 'ECONOMIC SERVICE SURCHARGE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:12:54', '2024-09-05 04:12:54', 1);
INSERT INTO "accounting"."account" VALUES ('ddb56e8a-3337-4567-bcc5-8e1ce87c892e', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0100', '14.25', 'FRINGE BENEFIT TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:13:14', '2024-09-05 04:13:14', 1);
INSERT INTO "accounting"."account" VALUES ('873532bd-a718-46d4-abc8-a8fca3511fe3', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.01.0105', '14.25', 'NATIONAL BUILDING TAX (NBT)', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:13:56', '2024-09-05 04:13:56', 1);
INSERT INTO "accounting"."account" VALUES ('9fec0b37-dddb-4e73-a829-ef94a6606865', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.02', '14.25', 'TAXES', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:14:21', '2024-09-05 04:14:21', 1);
INSERT INTO "accounting"."account" VALUES ('5b038b0f-eaca-4b45-bbbd-04411274b8e9', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.02.0005', '14.25', 'WEALTH TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:14:54', '2024-09-05 04:14:54', 1);
INSERT INTO "accounting"."account" VALUES ('95214a47-846a-4949-a1f2-aaaf78d25d45', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.02.0010', '14.25', 'DEFERRED TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:15:17', '2024-09-05 04:15:17', 1);
INSERT INTO "accounting"."account" VALUES ('4ae7b222-bc7b-4f91-9548-38249a179114', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.25.02.0015', '14.25', 'ECONOMIC SERVICE SURCHARGE', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:15:43', '2024-09-05 04:15:43', 1);
INSERT INTO "accounting"."account" VALUES ('0c25a423-ad30-4884-9003-5ab42d3b8802', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.30', '14', 'DIVIDEND', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:16:13', '2024-09-05 04:16:13', 1);
INSERT INTO "accounting"."account" VALUES ('a4476413-9e33-4a5a-af70-71a042b9082d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.30.01', '14.30', 'DIVIDEND', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:17:06', '2024-09-05 04:17:06', 1);
INSERT INTO "accounting"."account" VALUES ('2cc44c12-399e-4cd9-a613-89c128def5c0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.30.01.0005', '14.30', 'INTERIM DIVIDEND', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:17:33', '2024-09-05 04:17:33', 1);
INSERT INTO "accounting"."account" VALUES ('08b1eff1-2cb2-47ef-b7ac-28d7b4d7ad55', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.30.01.0010', '14.30', 'PROPOSED DIVIDEND', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:18:06', '2024-09-05 04:18:06', 1);
INSERT INTO "accounting"."account" VALUES ('49e3c240-5671-42f6-b28b-7774aa84e8ff', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.30.01.0015', '14.30', 'DIVIDED TAX', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:18:29', '2024-09-05 04:18:29', 1);
INSERT INTO "accounting"."account" VALUES ('464aa82d-1b52-42b4-9a3d-6e015f04d934', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50', '14', 'REPAIRS   MAINTENANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:19:10', '2024-09-05 04:19:10', 1);
INSERT INTO "accounting"."account" VALUES ('d4ac7469-d4b3-4412-991c-5c8297568791', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.12', '14.50', 'REPAIRS   MAINTENANCE', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:19:59', '2024-09-05 04:19:59', 1);
INSERT INTO "accounting"."account" VALUES ('0e3303e1-c5f8-48a5-b132-66c6bfe233ba', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.12.0025', '14.50', 'REPAIRS   MAINTENANCE PROPERTY - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:20:23', '2024-09-05 04:20:23', 1);
INSERT INTO "accounting"."account" VALUES ('2a356df5-0742-45ad-8dc2-0692b17376a8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.12.0030', '14.50', 'REPAIRS   MAINTENANCE ASSET - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:21:22', '2024-09-05 04:21:22', 1);
INSERT INTO "accounting"."account" VALUES ('17452700-c0f7-436f-bc46-1d2ed78fa7df', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.13', '14.50', 'UTILITIES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:21:51', '2024-09-05 04:21:51', 1);
INSERT INTO "accounting"."account" VALUES ('03e56c52-e208-49d4-9915-045608aaa4e7', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.13.0045', '14.50', 'WATER CHARGES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:22:12', '2024-09-05 04:22:12', 1);
INSERT INTO "accounting"."account" VALUES ('8549b9fd-a596-4e82-a2da-a29d112c7d56', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.13.0050', '14.50', 'ELECTRICITY CHARGES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:22:52', '2024-09-05 04:22:52', 1);
INSERT INTO "accounting"."account" VALUES ('197f37ec-0d94-464e-a47c-ae53f530d1fd', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.13.0090', '14.50', 'GUEST HOUSE EXPENSES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:23:25', '2024-09-05 04:23:25', 1);
INSERT INTO "accounting"."account" VALUES ('6780b7c5-5092-4814-bf58-1d69f9311858', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15', '14.50', 'COMMUNICATION COST', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:24:10', '2024-09-05 04:24:10', 1);
INSERT INTO "accounting"."account" VALUES ('66196e43-af51-4dbb-80f0-4aec7bac63be', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15.0005', '14.50', 'TELEPHONE - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:24:44', '2024-09-05 04:24:44', 1);
INSERT INTO "accounting"."account" VALUES ('82111efa-0361-408f-b117-b9cf207085d1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15.0010', '14.50', 'FAX - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:25:07', '2024-09-05 04:25:07', 1);
INSERT INTO "accounting"."account" VALUES ('c1d3210a-31aa-4ad6-bc1c-dbd9828de417', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15.0015', '14.50', 'MOBILES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:25:34', '2024-09-05 04:25:34', 1);
INSERT INTO "accounting"."account" VALUES ('4946e896-2644-403c-ba73-9b9474f6e090', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15.0020', '14.50', 'INTERNET - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:25:57', '2024-09-05 04:25:57', 1);
INSERT INTO "accounting"."account" VALUES ('76e7cda2-b9e5-4a39-bfd0-1325ce0bb2f3', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.15.0040', '14.50', 'COMMUNICATION COST - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:26:30', '2024-09-05 04:26:30', 1);
INSERT INTO "accounting"."account" VALUES ('151b73c2-3491-4c13-92fc-3ddb90ae5e4a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.30', '14.50', 'OTHER EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:27:03', '2024-09-05 04:27:03', 1);
INSERT INTO "accounting"."account" VALUES ('7292b7fd-9f57-4b0d-b2d6-1289a72ab930', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.30.0001', '14.50', 'CAFETERIA EXPENSES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:27:40', '2024-09-05 04:27:40', 1);
INSERT INTO "accounting"."account" VALUES ('be55f453-13f0-475d-9b1c-8c7990749b7a', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.30.0025', '14.50', 'BOOKS   PERIODICALS - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:28:11', '2024-09-05 04:28:11', 1);
INSERT INTO "accounting"."account" VALUES ('ffacd8f1-1ced-44ed-b169-2a051dbec6b8', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.30.0030', '14.50', 'DONATIONS - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:28:27', '2024-09-05 04:28:27', 1);
INSERT INTO "accounting"."account" VALUES ('0d8b1400-7e9a-4f97-a631-2244a52e311c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.30.0040', '14.50', 'SUNDRY EXPENSES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:28:44', '2024-09-05 04:28:44', 1);
INSERT INTO "accounting"."account" VALUES ('978c9432-43ec-4379-b554-3cf2c5f9b4d1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35', '14.50', 'VEHICLE RUNNING EXPENSES', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:29:18', '2024-09-05 04:29:18', 1);
INSERT INTO "accounting"."account" VALUES ('01e4fc0b-dd29-412b-93da-ef48ca8e1051', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0010', '14.50', 'REPAIR   MAINTENANCE - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 04:29:39', '2024-09-05 04:30:00', 1);
INSERT INTO "accounting"."account" VALUES ('2b3ff148-14eb-46e9-b612-c820e2792a5d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0015', '14.50', 'VEHICLE INSURANCE - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 04:30:26', '2024-09-05 04:30:43', 1);
INSERT INTO "accounting"."account" VALUES ('20b573d9-9f43-4bf9-89bc-2f1fa786f284', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0020', '14.50', 'FUEL   OIL - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:31:10', '2024-09-05 04:31:10', 1);
INSERT INTO "accounting"."account" VALUES ('bd52558a-e7ec-40e3-8e6e-932e57db114d', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0025', '14.50', 'VEHICLE REGISTRATION FEES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:31:29', '2024-09-05 04:31:29', 1);
INSERT INTO "accounting"."account" VALUES ('bbe92326-4dc3-457f-9407-2dee3528d158', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0030', '14.50', 'PARKING FEE - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:32:16', '2024-09-05 04:32:16', 1);
INSERT INTO "accounting"."account" VALUES ('ba7ace10-242c-4df8-960d-8986d35bdd67', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0035', '14.50', 'VEHICLE HIRE CHARGES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:32:40', '2024-09-05 04:32:40', 1);
INSERT INTO "accounting"."account" VALUES ('26f82605-4ace-4f94-bae5-37601b3ea352', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.35.0040', '14.50', 'SALIK CHARGES - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:33:06', '2024-09-05 04:33:06', 1);
INSERT INTO "accounting"."account" VALUES ('524b3bcc-a058-49fb-8f0c-7031f0273618', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50', '14.50', 'DEPRECIATION', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:34:07', '2024-09-05 04:34:07', 1);
INSERT INTO "accounting"."account" VALUES ('caad552c-a5f5-4ba9-9647-822fba410c63', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0001', '14.50', 'LAND - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:34:46', '2024-09-05 04:34:46', 1);
INSERT INTO "accounting"."account" VALUES ('98948f51-50ce-480f-a916-d902d02c268c', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0004', '14.50', 'DEPRECIATION OTHERS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:35:10', '2024-09-05 04:35:10', 1);
INSERT INTO "accounting"."account" VALUES ('84e91b79-28ab-4d2c-bf23-4aba3c824178', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0010', '14.50', 'OFFICE BUILDING - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:35:26', '2024-09-05 04:35:26', 1);
INSERT INTO "accounting"."account" VALUES ('1e3d8d3c-9999-4ada-8fc1-ea748d1d44b2', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0015', '14.50', 'PLANT   MACHINERY - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:35:48', '2024-09-05 04:35:48', 1);
INSERT INTO "accounting"."account" VALUES ('73662866-d2c5-4d11-bf6e-306cb8a39f09', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0020', '14.50', 'ELECTRICAL INSTALLATIONS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:36:05', '2024-09-05 04:36:05', 1);
INSERT INTO "accounting"."account" VALUES ('614b614b-074c-4fa0-8d5a-4d71bf56a9d1', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0030', '14.50', 'COMPUTER HARDWARE - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:36:57', '2024-09-05 04:36:57', 1);
INSERT INTO "accounting"."account" VALUES ('99d1113c-13d0-46dc-b9e2-e684b43afb77', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0032', '14.50', 'COMPUTER SOFTWARE - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:37:19', '2024-09-05 04:37:19', 1);
INSERT INTO "accounting"."account" VALUES ('02861958-b56f-4fc1-88ac-47e4d2a624da', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0035', '14.50', 'FURNITURE   FIXTURES   OFFICE - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:37:38', '2024-09-05 04:37:38', 1);
INSERT INTO "accounting"."account" VALUES ('9b6201e8-76d3-43f4-814e-4b1b567e7190', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0040', '14.50', 'FURNITURE   FIXTURES   RESIDENCE - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:37:56', '2024-09-05 04:37:56', 1);
INSERT INTO "accounting"."account" VALUES ('fa8b6c0e-33ef-43c8-b43c-a786ae88fcf2', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0025', '14.50', 'OFFICE EQUIPMENTS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 04:36:24', '2024-09-05 04:38:33', 1);
INSERT INTO "accounting"."account" VALUES ('ae423b60-cf70-4616-a4ba-9d2ba463a557', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0045', '14.50', 'SHIPS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:39:07', '2024-09-05 04:39:07', 1);
INSERT INTO "accounting"."account" VALUES ('3f67c615-1cb0-414c-9c70-9e3cec11d031', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0050', '14.50', 'MOTOR CARS - DIRECT ALLOCATED COSTS', NULL, 'credit', '1', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:39:23', '2024-09-05 04:39:23', 1);
INSERT INTO "accounting"."account" VALUES ('d0697560-29b3-49da-9ae6-875a3a484112', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0055', '14.50', 'MOTOR CYCLES - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 04:39:38', '2024-09-05 04:39:51', 1);
INSERT INTO "accounting"."account" VALUES ('368f62ca-2ad7-4625-9d4b-0900c1e13714', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0060', '14.50', 'FORKLIFTS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:40:16', '2024-09-05 04:40:16', 1);
INSERT INTO "accounting"."account" VALUES ('f3694365-c25f-4728-be5f-dbc1cb06aef0', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0065', '14.50', 'TRUCK / PICKUPS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:40:34', '2024-09-05 04:40:34', 1);
INSERT INTO "accounting"."account" VALUES ('b5cb779c-df67-4dc2-9278-9ebbf0c14f58', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0070', '14.50', 'TRAILERS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:40:54', '2024-09-05 04:40:54', 1);
INSERT INTO "accounting"."account" VALUES ('e3a98be6-2cf6-4858-a7cf-53936fe2c323', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0075', '14.50', 'RACKING AND WHS OTHER EQUIPMENT - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:41:30', '2024-09-05 04:41:30', 1);
INSERT INTO "accounting"."account" VALUES ('472ce99e-71f2-4b89-9487-1c000be0ba50', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0080', '14.50', 'INTANGIBLE ASSETS - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:41:51', '2024-09-05 04:41:51', 1);
INSERT INTO "accounting"."account" VALUES ('b1f9b023-ac22-4919-b64c-61c22acf2998', '96e22348-bf9c-4ed2-8161-4e449f696f94', '1d5dd0b1-3f42-4514-9a05-280d6e842e51', '14.50.50.0099', '14.50', 'PRELIMINARY EXPENSE WRITTEN OFF - DIRECT ALLOCATED COSTS', NULL, 'credit', '3', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', NULL, '2024-09-05 04:42:35', '2024-09-05 04:42:35', 1);

-- ----------------------------
-- Table structure for account_types
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."account_types";
CREATE TABLE "accounting"."account_types" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "type_name" varchar(255) COLLATE "pg_catalog"."default",
  "digit" varchar(255) COLLATE "pg_catalog"."default",
  "default" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of account_types
-- ----------------------------
INSERT INTO "accounting"."account_types" VALUES ('67325d95-4634-40ac-b33a-29f18b0615ab', 'LIABILITIES', '12', 'credit', '2024-08-29 03:44:37', '2024-08-29 03:44:37', 1);
INSERT INTO "accounting"."account_types" VALUES ('d6b04961-8cc4-4952-8162-1eaae78d6ef0', 'INCOME', '13', 'debit', '2024-08-29 03:44:37', '2024-08-29 03:44:37', 1);
INSERT INTO "accounting"."account_types" VALUES ('96e22348-bf9c-4ed2-8161-4e449f696f94', 'EXPENDITURE', '14', 'credit', '2024-08-29 03:44:37', '2024-08-29 03:44:37', 1);
INSERT INTO "accounting"."account_types" VALUES ('3a423be5-ed00-4dfe-a408-fbd18cce007b', 'ASSETS', '11', 'debit', '2024-08-29 03:44:37', '2024-08-29 03:44:37', 1);

-- ----------------------------
-- Table structure for carriers
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."carriers";
CREATE TABLE "accounting"."carriers" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "number" varchar(255) COLLATE "pg_catalog"."default",
  "scac" varchar(255) COLLATE "pg_catalog"."default",
  "us_custom_scac" varchar(255) COLLATE "pg_catalog"."default",
  "iata_carrier" varchar(255) COLLATE "pg_catalog"."default",
  "edi_line_code" varchar(255) COLLATE "pg_catalog"."default",
  "pan_number" varchar(255) COLLATE "pg_catalog"."default",
  "lov_status" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of carriers
-- ----------------------------

-- ----------------------------
-- Table structure for charges
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."charges";
CREATE TABLE "accounting"."charges" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "group_charge_id" uuid NOT NULL,
  "charge_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "note" varchar(255) COLLATE "pg_catalog"."default",
  "currency_code" varchar(255) COLLATE "pg_catalog"."default",
  "currency_amount" varchar(255) COLLATE "pg_catalog"."default",
  "unit_id" int4,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of charges
-- ----------------------------

-- ----------------------------
-- Table structure for contract_agent_charges
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."contract_agent_charges";
CREATE TABLE "accounting"."contract_agent_charges" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "contract_agent_id" uuid NOT NULL,
  "charge_id" uuid,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "crn" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "currency" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "unit_id" int8 NOT NULL,
  "via_port" varchar(255) COLLATE "pg_catalog"."default",
  "amount_per_unit" float8,
  "minimum_amount" float8,
  "por" varchar(255) COLLATE "pg_catalog"."default",
  "fdc" varchar(255) COLLATE "pg_catalog"."default",
  "pp_cc" varchar(255) COLLATE "pg_catalog"."default",
  "routed" varchar(255) COLLATE "pg_catalog"."default",
  "imco" varchar(255) COLLATE "pg_catalog"."default",
  "commodity" varchar(255) COLLATE "pg_catalog"."default",
  "loading_bay" varchar(255) COLLATE "pg_catalog"."default",
  "valid_from_date" date NOT NULL,
  "valid_to_date" date NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "service_contract_id" uuid,
  "from_0_to_44" float8 NOT NULL DEFAULT '0'::double precision,
  "from_45_to_99" float8 NOT NULL DEFAULT '0'::double precision,
  "from_100_to_299" float8 NOT NULL DEFAULT '0'::double precision,
  "from_300_to_499" float8 NOT NULL DEFAULT '0'::double precision,
  "from_500_to_999" float8 NOT NULL DEFAULT '0'::double precision,
  "from_1000_to_infinity" float8 NOT NULL DEFAULT '0'::double precision,
  "20_feet" float8 NOT NULL DEFAULT '0'::double precision,
  "40_feet" float8 NOT NULL DEFAULT '0'::double precision,
  "45_feet_hc" float8 NOT NULL DEFAULT '0'::double precision,
  "45_feet" float8 NOT NULL DEFAULT '0'::double precision,
  "manual_input_routed" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of contract_agent_charges
-- ----------------------------
INSERT INTO "accounting"."contract_agent_charges" VALUES ('921d0ec8-7f43-4020-823b-97ce9976858c', '65ea5bf8-3fa0-4302-aad8-c79b6609c6ee', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'cost', 'USD', 17, NULL, 100, 10, 'SHANGHAI', 'OKE', NULL, 'DUBAI', NULL, 'GARMENTS', NULL, '2024-09-01', '2024-09-30', '2024-09-04 07:06:49', '2024-09-04 07:06:49', 'e99ebfab-6f5f-4e21-b22d-6062b5eca60b', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('ab9daba4-fd48-4daa-a776-1c581704f16a', '363cc595-988d-40d7-b359-5091ad0e4172', '50caf177-8df3-4840-9466-ebe6ffc16cce', 'DPC', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', NULL, 'INDONESIA', NULL, 'SHOES', NULL, '2024-09-05', '2024-09-05', '2024-09-05 10:23:07', '2024-09-05 10:23:07', '70bd4b87-cda9-4d3d-ab96-cec3f1f43e23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('23931c49-08ac-48fa-9ff9-49af9a9e92da', '8eef8902-d7e0-40cf-912b-cf8c4caef547', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'R', 'USD', 17, NULL, 100, 1, '10', '10', NULL, 'DUBAI', NULL, 'other', 'KG', '2024-09-05', '2024-09-30', '2024-09-05 08:55:38', '2024-09-05 10:09:24', 'cf935d85-4274-45d6-88b7-3abb0a212e70', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('ff5af544-8603-4ce2-86ce-fcf8fa907daf', 'a9138d11-ddb9-408d-ad78-e9c111da2a3e', 'edfdccf1-745f-4bf9-afc5-50081dbca9fa', 'THC', 'R', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', NULL, 'DUBAI', NULL, 'SHOES', NULL, '2024-09-05', '2024-09-05', '2024-09-05 10:32:42', '2024-09-05 10:32:42', '0027c242-9c7e-4dac-b503-75e106b9bef5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('d482e78f-ade9-40a0-ab1c-257cae8dce59', '0a3e4b26-bcf6-4823-bbbf-5938dbfbcd37', '5e4301d9-a06d-47d8-940d-eabdb3af93a0', 'CUSSEL', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', NULL, 'DUBAI', NULL, 'SHOES', NULL, '2024-09-14', '2024-09-13', '2024-09-05 10:37:32', '2024-09-05 10:37:32', '2f565f3b-0840-419c-abed-57e449250669', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('8b8db5c0-4199-41c2-b377-237892ceffc6', '0a3e4b26-bcf6-4823-bbbf-5938dbfbcd37', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'R', 'USD', 12, 'TJ PERAK', 1000, 100, 'POR', 'FDC', NULL, 'DUBAI', NULL, 'SHOES', NULL, '2024-09-13', '2024-09-21', '2024-09-05 10:37:32', '2024-09-05 10:37:32', 'f9d0dcde-b5ab-4ef3-a0a9-e9aff04cc245', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('82d8c8b8-5ab1-4cb3-8cdd-d06734116bb9', '8eef8902-d7e0-40cf-912b-cf8c4caef547', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'cost', 'USD', 19, 'tes', 100, NULL, '1', '1', NULL, 'DUBAI', NULL, 'others', NULL, '2024-09-05', '2024-09-30', '2024-09-05 08:55:38', '2024-09-05 10:09:24', 'cf935d85-4274-45d6-88b7-3abb0a212e70', 0, 0, 0, 0, 0, 0, 10, 50, 100, 120, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('6585a0a0-683c-40ce-8d89-27add4227885', '8eef8902-d7e0-40cf-912b-cf8c4caef547', '7d52dff5-e06f-4a82-a562-ad2330068eac', 'EXW', 'N', 'AED', 17, NULL, 100, 1, 'sada', 'sadad', NULL, 'DUBAI', NULL, 'others', NULL, '2024-09-05', '2024-09-30', '2024-09-05 10:09:24', '2024-09-05 10:09:24', '0e75a0b9-5c09-4cd6-a2f0-02762e513db6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('1963b604-d265-45c4-90da-2f514c38b5da', '2653232f-f6c7-4c13-9310-36ae9c3c55de', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 12, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'SINGAPORE', NULL, 'SHOES', NULL, '2024-09-20', '2024-09-14', '2024-09-05 10:39:49', '2024-09-05 10:52:31', '4d21f10d-57bd-424d-90ee-62e22b81231d', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('545185f4-a71e-499a-8ef7-b13f5dde6f39', '1bd3b83f-97a7-42c9-bcfa-9fb42661fdaf', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'cost', 'USD', 13, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'DUBAI', NULL, 'SHOES', NULL, '2024-09-05', '2024-09-06', '2024-09-05 10:04:27', '2024-09-05 10:04:27', '2b8821cc-fdbf-4bd7-8ab8-5df19dda184d', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('87a2cc5e-846b-4681-93a0-ec2fd8589c9b', '65ea5bf8-3fa0-4302-aad8-c79b6609c6ee', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'cost', 'USD', 11, NULL, NULL, NULL, 'SHANGHAI', 'JEBEL ALI', 'KG', 'DUBAI', NULL, 'GARMENTS', NULL, '2024-09-01', '2024-09-30', '2024-09-04 07:06:49', '2024-09-04 07:06:49', 'e99ebfab-6f5f-4e21-b22d-6062b5eca60b', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('d1e1d5fc-a232-47c1-b4f8-4e7c9d184da5', 'a9138d11-ddb9-408d-ad78-e9c111da2a3e', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'Cost', 'USD', 17, NULL, 1000, 100, 'POR', 'FDC', 'KG', 'DUBAI', NULL, 'SHOES', NULL, '2024-09-13', '2024-09-13', '2024-09-05 10:32:42', '2024-09-05 10:32:42', '8a9948eb-136d-48bd-8d36-c297bdbafaa4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e431cfb3-0c78-45e1-8f53-3232935684ce', '1e062107-391c-409a-986b-68784c2a0c44', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'cost', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-20', '2024-09-13', '2024-09-05 10:51:46', '2024-09-05 10:51:46', '01c47107-b9cd-4a7e-9ce8-391ea6087976', 44, 99, 299, 499, 999, 5000, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('c9963231-2890-434c-8864-4ad9365d4010', '0bde4ead-7f67-4e25-a114-01113cc88650', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-05', '2024-09-30', '2024-09-05 04:54:47', '2024-09-05 04:54:47', '4921cb38-eb09-4899-8f96-60eb2f5689aa', 101, 202, 303, 404, 505, 606, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('ba0f0699-7037-4f8c-9d00-535786b23b5b', '8eef8902-d7e0-40cf-912b-cf8c4caef547', 'e4489011-13f6-4d21-bb04-cf38ea2df4d6', 'Freight Rate Collect', 'cost', 'AED', 11, NULL, NULL, NULL, 'sadad', 'sadad', 'KG', 'DUBAI', 'KG', 'others', 'KG', '2024-09-05', '2024-09-30', '2024-09-05 10:05:27', '2024-09-05 10:09:24', 'cf935d85-4274-45d6-88b7-3abb0a212e70', 100, 200, 300, 400, 500, 600, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('8af47acc-71f3-4964-a871-420e791f49f8', '062eacf6-d15d-4621-8847-3ae930126528', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'N', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'GARMENTS', 'KG', '2024-09-05', '2024-09-07', '2024-09-05 10:08:23', '2024-09-05 10:08:23', '5a933611-865a-44c8-8abe-bc016658ba33', 44, 99, 299, 350, 600, 1500, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('81effa4b-bfaf-48f5-a0cc-c4bc40f71404', 'ec88c3c5-95b7-4771-b9b8-f30c1abaa3b1', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'cost', 'USD', 13, 'TJ PERAK', 1000, 10, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-08-29', '2024-08-31', '2024-08-29 10:53:20', '2024-08-29 10:53:20', 'bf6dda8f-b125-4484-ab09-0e4ac1f6c368', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('7db37d84-3067-4f92-86bf-1afea0da2176', '965cdd54-aa46-4f4b-9957-6c46ceb4de1d', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'cost', 'USD', 19, '400', 100, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-05', '2024-09-09', '2024-09-05 04:51:10', '2024-09-05 04:51:10', '5d89644d-5e9d-4d26-84b8-93c51355e1dd', 0, 0, 0, 0, 0, 0, 100, 200, 300, 400, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('780ae0b7-7b13-42a0-a515-ff252d5a36a6', '6c27b723-7ea5-4c86-b378-c93c55f39929', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity 2', 'KG', '2024-09-04', '2024-09-12', '2024-09-04 09:56:50', '2024-09-04 10:54:49', 'f8059546-13aa-47ae-9fbf-b1a152dfb0a2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('627a7549-a512-4a46-bc26-0bf3d9e2c54e', '0bde4ead-7f67-4e25-a114-01113cc88650', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-06', '2024-09-20', '2024-09-05 04:54:47', '2024-09-05 04:54:47', '4921cb38-eb09-4899-8f96-60eb2f5689aa', 110, 220, 330, 440, 550, 660, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('5a336a80-759e-43fd-82f3-a1efea297d48', 'c09068ee-09ed-4627-9fc5-ce1fde612428', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity charge item', 'KG', '2024-09-05', '2024-09-06', '2024-09-05 04:42:05', '2024-09-05 04:42:05', '9fb1ec81-b66b-4885-ab4c-b0524ba9ba91', 100, 200, 300, 400, 500, 600, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('57a7fc02-841e-4f38-907c-c154dcfc360f', '0bde4ead-7f67-4e25-a114-01113cc88650', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-05', '2024-09-30', '2024-09-05 04:54:47', '2024-09-05 04:54:47', 'f6937207-7775-429f-b4aa-d23d87f5d175', 101, 202, 303, 404, 505, 606, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('369fa321-07c9-450f-b4b2-1ea97021faeb', '965cdd54-aa46-4f4b-9957-6c46ceb4de1d', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity 3', 'KG', '2024-09-06', '2024-09-30', '2024-09-05 04:51:10', '2024-09-05 04:51:10', '5d89644d-5e9d-4d26-84b8-93c51355e1dd', 111, 222, 333, 444, 555, 666, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('277f4a82-af39-4fb7-90d9-5ff2d65e5487', 'de855056-1765-48f5-8ce7-df5131cc08a5', '5e4301d9-a06d-47d8-940d-eabdb3af93a0', 'CUSSEL', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-05', '2024-09-06', '2024-09-05 08:44:22', '2024-09-05 09:49:43', '576a0f27-2044-42a0-83df-37297a19df7f', 100, 200, 300, 400, 500, 600, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('1ddafbe9-b7c0-4a13-8ac7-2297b3241dae', '0bde4ead-7f67-4e25-a114-01113cc88650', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-06', '2024-09-20', '2024-09-05 04:54:47', '2024-09-05 04:54:47', 'f6937207-7775-429f-b4aa-d23d87f5d175', 110, 220, 330, 440, 550, 660, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('134f00ce-171f-4a00-bebb-dd1fd591c95c', 'de855056-1765-48f5-8ce7-df5131cc08a5', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'cost', 'USD', 19, '20', 100, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity', 'KG', '2024-09-05', '2024-09-30', '2024-09-05 08:44:22', '2024-09-05 09:49:43', 'a08837b6-2257-41f9-a88e-63515afbac60', 0, 0, 0, 0, 0, 0, 300, 400, 500, 600, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('036afee7-204e-4a40-86c4-76a3bf8784d6', '6c27b723-7ea5-4c86-b378-c93c55f39929', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'cost', 'USD', 11, NULL, NULL, NULL, 'por', 'fdc', 'KG', 'DUBAI', 'KG', 'commodity 2', 'KG', '2024-09-04', '2024-09-12', '2024-09-04 09:56:49', '2024-09-04 10:54:49', 'f8059546-13aa-47ae-9fbf-b1a152dfb0a2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('df019c8c-16e2-4f4d-9081-70940d77695a', '96192b40-a310-4a80-802e-7b13c1a29841', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'R', 'USD', 12, 'TJ PERAK', 1000, 500, 'POR', 'FDC', NULL, NULL, NULL, 'SHOES', NULL, '2024-09-14', '2024-09-15', '2024-09-09 04:27:49', '2024-09-09 04:27:49', '2f5b200a-1c95-4fec-86a8-8017f498afd1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('c78650fe-bc92-49bd-babb-1310bfceec4d', 'bf6c4bd1-3500-4c72-906d-d9b089eb3dcc', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-19', '2024-09-20', '2024-09-18 02:46:20', '2024-09-18 02:46:20', 'db52e88a-75f8-445f-982f-f5d5153a0bc8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('f1c2531e-820e-416c-a2d4-6316eaf4e097', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', '74e6a8c5-d96e-4a64-a06d-56040bf1cd47', 'TLUC', 'R', 'USD', 18, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-19', '2024-09-20', '2024-09-18 03:09:00', '2024-09-18 03:09:00', 'd9045aac-8b8b-4a2c-8258-ee13deafe229', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('038e932d-bc64-4601-9624-18b46d0e7b1b', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', 'JAKARTA', 'SHPT', 'GARMENTS', 'KG', '2024-09-18', '2024-09-20', '2024-09-18 03:09:00', '2024-09-18 03:09:00', 'd9045aac-8b8b-4a2c-8258-ee13deafe229', 44, 99, 299, 0, 999, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e810fdde-63d7-4548-8962-cb4421357255', '81568e5c-324f-47fd-b433-5a7d73d2dc69', 'c51be55a-104f-4095-905f-ba66aa1a4ce2', 'FINAL STAMP', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-19', '2024-09-20', '2024-09-18 03:11:39', '2024-09-18 03:11:39', '918a87fa-fa0c-459a-9860-6b27bff6b1ce', 0, 0, 0, 0, 0, 0, 20, 0, 45, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('ee865bc0-cabf-4c74-9f7d-3b6dc03b7b79', '39305fca-5bad-452a-932a-d35eef42266d', 'edfdccf1-745f-4bf9-afc5-50081dbca9fa', 'THC', 'cost', 'USD', 11, 'TJ PERAK', 1000, 500, NULL, NULL, 'KG', 'SINGAPORE', 'SHPT', 'SHOES', 'KG', '2024-09-18', '2024-09-19', '2024-09-18 03:55:28', '2024-09-18 03:55:28', '85af2f52-29e6-4ab1-bd87-3ebc149bc273', 0, 0, 0, 0, 0, 0, 20, 0, 45, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('b9815e7c-680c-4add-9e5b-772afcd9c9c5', '39305fca-5bad-452a-932a-d35eef42266d', '350a5789-36d2-488d-93d0-c73d5d481560', 'EESUB', 'R', 'USD', 17, NULL, 1000, 100, 'POR', 'FDC', 'KG', 'LOS ANGELES', 'SHPT', 'SHOES', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-18 03:55:28', '2024-09-18 03:55:28', '7132bdd9-8006-4611-9244-02bcd9fc96cb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('9b5bc96f-36b9-462c-b2af-d93da8673313', 'b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'R', 'USD', 13, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-20', '2024-09-21', '2024-09-18 04:19:27', '2024-09-18 04:19:27', '99d54c41-47dc-49e2-80f3-91f804a63d89', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('689cd9c5-7719-4ff0-a291-a59cb8c53b2f', 'b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', 'a121a634-3278-4118-92fe-8d737d079e8b', 'Handling Fee', 'R', 'AED', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', 'LOS ANGELES', 'SHPT', 'SHOES', 'KG', '2024-09-13', '2024-09-21', '2024-09-18 04:19:27', '2024-09-18 04:19:27', '04c0e312-bd9b-4e02-8934-a119818f5651', 44, 99, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('99b60be6-762e-4377-8ceb-28476abfb4f9', 'b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', 'c51be55a-104f-4095-905f-ba66aa1a4ce2', 'FINAL STAMP', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'KG', 'JAKARTA', 'KG', 'OTHER', 'KG', '2024-09-19', '2024-09-21', '2024-09-18 04:19:27', '2024-09-18 04:19:27', '04c0e312-bd9b-4e02-8934-a119818f5651', 0, 0, 0, 0, 0, 0, 20, 0, 45, 45, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('097dab0b-bfc4-4d0a-b086-6eaed6178cdb', 'bf6c4bd1-3500-4c72-906d-d9b089eb3dcc', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-19', '2024-09-20', '2024-09-18 07:05:20', '2024-09-18 07:05:20', '470ea3f2-b92c-40b9-b4c5-9b47daa0fe87', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('16490f68-d207-4ce9-931c-d5555812bd93', '96192b40-a310-4a80-802e-7b13c1a29841', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'R', 'USD', 12, 'TJ PERAK', 1000, 500, 'POR', 'FDC', NULL, NULL, NULL, 'SHOES', NULL, '2024-09-14', '2024-09-15', '2024-09-18 07:09:31', '2024-09-18 07:09:31', '4eb7db4d-2b02-446b-9896-3ec6acb096bd', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('8e10bcde-1eef-41e2-a2fd-46b985a125d1', '96192b40-a310-4a80-802e-7b13c1a29841', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'INSURANCE', 'R', 'USD', 11, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-14', '2024-09-15', '2024-09-18 07:09:42', '2024-09-18 07:09:42', 'e6d6da24-c96d-4434-975d-2b31e2549291', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('af2dea25-d7ab-4ade-86ad-98e44e119af0', '81568e5c-324f-47fd-b433-5a7d73d2dc69', 'a121a634-3278-4118-92fe-8d737d079e8b', 'Handling Fee', 'cost', 'AED', 18, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-19', '2024-09-20', '2024-09-18 07:19:10', '2024-09-18 07:19:10', '421927d0-d46c-43ef-bf95-7e235e40d8db', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('aaff6cf0-3fd3-415b-9a63-203669d5bc39', '81568e5c-324f-47fd-b433-5a7d73d2dc69', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'R', 'USD', 13, 'TJ PRIUK', 100000, 1000, 'POR', 'FDC', 'KG', 'JAKARTA', 'KG', 'GARMENTS', 'CNTR', '2024-09-24', '2024-09-27', '2024-09-18 07:19:10', '2024-09-18 07:19:10', '421927d0-d46c-43ef-bf95-7e235e40d8db', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('951548fb-d27f-4da6-8658-6f9ed41abef9', '79f34603-6864-42bb-b185-2091384391dc', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-17', '2024-09-20', '2024-09-18 07:41:19', '2024-09-18 07:41:19', 'd3533570-ac05-4f1d-8b7e-aabaf9292ef3', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('d53e53ca-f903-4147-9298-ca1fe168eab7', '79f34603-6864-42bb-b185-2091384391dc', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-17', '2024-09-20', '2024-09-18 07:43:39', '2024-09-18 07:43:39', '6bb6bf13-441f-4ab6-83d0-9eebe256d496', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('704e4bd0-229f-4c4b-9803-052b612974e4', '79f34603-6864-42bb-b185-2091384391dc', 'f76eeb16-35bc-4e46-aee5-1a0196282742', 'INSURANCE', 'cost', 'USD', 17, NULL, 1000, 100, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-19', '2024-09-21', '2024-09-18 07:43:39', '2024-09-18 07:43:39', '7324ede4-0713-4bd6-9bab-3f5210d1ed5b', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('c5cee2c3-518d-473d-b7ae-c7d5dff52a74', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', '74e6a8c5-d96e-4a64-a06d-56040bf1cd47', 'TLUC', 'R', 'USD', 18, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-19', '2024-09-20', '2024-09-18 07:48:32', '2024-09-18 07:48:32', 'befd988f-4f15-4052-bf10-a2ca2b672cbc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('38460b13-87e2-4303-951c-6496433c27c9', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', NULL, 'SHPT', 'GARMENTS', 'KG', '2024-09-18', '2024-09-20', '2024-09-18 07:48:32', '2024-09-18 07:48:32', 'befd988f-4f15-4052-bf10-a2ca2b672cbc', 44, 99, 299, 0, 999, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('9031d516-b407-4ff3-bac8-07a3393e5e77', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'CNTR', 'SHOES', 'SHPT', '2024-09-17', '2024-09-21', '2024-09-18 08:04:02', '2024-09-18 08:04:02', 'efa0e487-c7d7-4f85-b586-afb38ba3b273', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('f82f8639-072d-4747-9864-ac5cf5093820', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'CNTR', 'SHOES', 'SHPT', '2024-09-17', '2024-09-21', '2024-09-18 08:10:04', '2024-09-18 08:10:04', '0fac5074-a693-40ea-aa5f-b776a46fed96', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e0c28b45-ced9-46ab-b827-9d6e5ec0750d', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', 'a7cf80e1-0bdb-4116-ac5c-8b845324b78a', 'TPC', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-17', '2024-09-20', '2024-09-18 08:10:04', '2024-09-18 08:10:04', '8c0c6b3f-6af6-49a4-ad37-15587b78e23c', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('42b69327-9722-46db-aaa5-4cdb2a7a99f4', '39305fca-5bad-452a-932a-d35eef42266d', 'edfdccf1-745f-4bf9-afc5-50081dbca9fa', 'THC', 'cost', 'USD', 11, NULL, NULL, NULL, NULL, NULL, 'KG', 'SINGAPORE', 'SHPT', 'SHOES', 'KG', '2024-09-18', '2024-09-19', '2024-09-18 08:10:58', '2024-09-18 08:10:58', '2b4df19f-dc7d-40c3-b7db-00d4d2ff7ea1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('6cbbf82d-6e6a-4a37-9bb6-2c5c953527a9', '39305fca-5bad-452a-932a-d35eef42266d', '350a5789-36d2-488d-93d0-c73d5d481560', 'EESUB', 'R', 'USD', 17, NULL, 1000, 100, 'POR', 'FDC', 'KG', 'LOS ANGELES', 'SHPT', 'SHOES', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-18 08:10:58', '2024-09-18 08:10:58', '1ae2a07d-f107-4d1b-80ee-6cdd9762ce16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('6e47ed72-afce-44f0-8319-ef72d850d319', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'KG', 'LOS ANGELES', 'KG', 'SHOES', 'SHPT', '2024-09-17', '2024-09-21', '2024-09-18 08:14:24', '2024-09-18 08:14:24', '1f977567-d488-4c7e-9baf-3f68e9201674', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('8134bb9a-f3a9-40a6-930e-bf76dcc2c2eb', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'cost', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'KG', 'LOS ANGELES', 'KG', 'SHOES', 'SHPT', '2024-09-17', '2024-09-21', '2024-09-18 08:38:10', '2024-09-18 08:38:10', '42c1502f-393c-4550-a036-4669097f2f1e', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('169f3f3e-9fff-499c-978e-2617b137ecdd', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', 'c51be55a-104f-4095-905f-ba66aa1a4ce2', 'FINAL STAMP', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'CNTR', '2024-09-19', '2024-09-21', '2024-09-18 08:38:10', '2024-09-18 08:38:10', 'cbae7eaf-36aa-4eef-a363-2112c97a7841', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('c6ee5ce0-64e7-4e87-8988-448d6813ad2c', '8ea0628d-9181-4e3d-a4f4-352b9b6c7ca3', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'cost', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'SHPT', 'DUBAI', 'KG', 'GARMENTS', 'SHPT', '2024-09-17', '2024-09-21', '2024-09-18 08:39:51', '2024-09-18 08:39:51', '49d391f9-2ea9-4533-a341-c16acf974f48', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('2f65fcb3-c7a1-4755-a982-595e5ce331df', '662b6729-2cf4-42a1-9dca-8b34d1a66f22', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'R', 'USD', 13, 'Via Port', 100, 10, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'Commodity', 'SHPT', '2024-09-05', '2024-09-06', '2024-09-18 10:39:18', '2024-09-18 10:39:18', 'a6c4f036-a62d-4e84-a118-63876801813a', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e36c0b88-ae7e-4c04-9417-f498e51c3fad', '662b6729-2cf4-42a1-9dca-8b34d1a66f22', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'R', 'USD', 13, 'Via Port', 100, 10, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'Commodity', 'SHPT', '2024-09-05', '2024-09-06', '2024-09-18 10:58:09', '2024-09-18 10:58:09', 'f1439c26-3b22-46dd-bcca-bbf912391a0b', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('31c36fe4-d1b8-4a15-9be5-ed2c60d3bbc8', '662b6729-2cf4-42a1-9dca-8b34d1a66f22', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'R', 'USD', 19, 'Via Port 2', 250, NULL, 'POR 2', 'FDC 2', 'KG', 'DUBAI', 'KG', 'COM 2', 'KG', '2024-09-08', '2024-09-09', '2024-09-18 10:58:09', '2024-09-18 10:58:09', 'f1439c26-3b22-46dd-bcca-bbf912391a0b', 0, 0, 0, 0, 0, 0, 10, 20, 30, 40, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('042838bb-c412-4247-85bf-025ba191d4f9', '60ab54f5-7af7-41f3-8958-1d973648087e', '7c4f6b7b-5fe5-4180-912d-ed3697486417', 'TRANSPORT', 'cost', 'USD', 17, NULL, 100, 10, 'POR', 'FDC', 'SHPT', 'DUBAI', 'KG', 'Commodity', 'KG', '2024-09-19', '2024-09-19', '2024-09-18 11:02:12', '2024-09-18 11:02:12', 'd2e5a28b-91a2-4b84-a7ae-6cb793cde8e7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('cc0ba01f-e449-4cbe-bd36-9fed6a9b3dcb', '60ab54f5-7af7-41f3-8958-1d973648087e', 'd95607b6-657c-4d20-9540-c11d93f5f6b8', 'CUSTINP', 'R', 'USD', 19, 'Via Port 2', 250, NULL, 'POR 2', 'FDC 2', 'SHPT', 'SINGAPORE', 'SHPT', 'COM 2', 'SHPT', '2024-09-21', '2024-09-22', '2024-09-18 11:02:12', '2024-09-18 11:02:12', 'd2e5a28b-91a2-4b84-a7ae-6cb793cde8e7', 0, 0, 0, 0, 0, 0, 15, 25, 35, 45, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('0d21a087-884e-4275-8ce7-a8f2ccbb7f34', 'df8e1781-c445-4e9a-a06c-b5446bd6f388', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'cost', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', NULL, 'KG', 'ELECTRONIC', 'KG', '2024-09-19', '2024-09-21', '2024-09-19 02:45:35', '2024-09-19 02:45:35', 'b6094940-3df7-4959-964c-1e6a85955a44', 44, 99, 299, 499, 999, 0, 0, 0, 0, 0, 'JAKARTA');
INSERT INTO "accounting"."contract_agent_charges" VALUES ('1560118e-26b4-4c18-812f-4185252c6680', '4fc9fe8c-fab8-4277-ae61-32a8beedea7e', '72b140b9-9742-4025-8eef-cec8bc21f829', 'FE', 'cost', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'SHPT', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-18', '2024-09-21', '2024-09-19 02:54:24', '2024-09-19 02:54:24', 'be88aaa2-afc4-4641-8408-0b42e8505c4e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('fc788e3a-bdd9-4e33-98c4-2144bf81d1a0', '00ecd526-f1ab-423e-83b3-5ae2b4288c60', '73221da2-81cd-4a5c-bf9a-3fdb00e5ed43', 'Freight Rate Prepaid', 'N', 'AED', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'DUBAI', 'KG', 'GARMENTS', 'CNTR', '2024-09-18', '2024-09-20', '2024-09-19 02:57:46', '2024-09-19 02:57:46', 'cdc8311a-f05a-4621-91af-8bc978eaa86f', 0, 0, 0, 0, 0, 0, 20, 40, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('75ec7270-f072-400d-a781-652edafbc8e5', '0305c87b-1fe9-4ed1-b1c1-c253fb081145', '8d4146a7-c947-4ac1-aa43-43c972349134', 'FEHAND', 'R', 'USD', 12, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'CNTR', 'DUBAI', 'SHPT', 'SHOES', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-19 03:02:04', '2024-09-19 03:02:04', '370938e3-05fb-4a72-a0ae-5262cf28cf59', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('db1d52ab-cab8-402a-9d93-bd12bce77674', '0305c87b-1fe9-4ed1-b1c1-c253fb081145', 'd95607b6-657c-4d20-9540-c11d93f5f6b8', 'CUSTINP', 'cost', 'USD', 17, NULL, 10000, 1000, 'POR', 'FDC', 'KG', 'SINGAPORE', 'SHPT', 'GARMENTS', 'KG', '2024-09-18', '2024-09-21', '2024-09-19 03:02:04', '2024-09-19 03:02:04', '370938e3-05fb-4a72-a0ae-5262cf28cf59', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('80eb1b41-cfd8-406f-83ab-e69037647186', '534ad214-8f1b-4409-a37b-d9a4fd656df7', '42bb4997-b58b-4800-830a-31a66595c732', 'OLC', 'cost', 'USD', 18, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'CNTR', 'SINGAPORE', 'KG', 'GARMENTS', 'KG', '2024-09-18', '2024-09-21', '2024-09-19 03:04:27', '2024-09-19 03:04:27', '2bf6b582-833c-43ce-b2e4-cd39c23fef6f', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('730484b8-3f65-4825-b5fd-f07dfc6251fe', 'e52b0496-923e-4866-a259-160d0802237e', '8d4146a7-c947-4ac1-aa43-43c972349134', 'FEHAND', 'N', 'USD', 13, 'TJ PERAK', 1000, 100, 'POR', 'FDC', 'SHPT', NULL, 'KG', 'SHOES', 'CNTR', '2024-09-19', '2024-09-20', '2024-09-19 03:10:17', '2024-09-19 03:10:17', '3679941f-e2bc-495c-b608-46b4cb1e5f98', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'JAKARTA');
INSERT INTO "accounting"."contract_agent_charges" VALUES ('fe21e1ec-c122-4ec1-b0d7-3f003ffe7e6a', 'e52b0496-923e-4866-a259-160d0802237e', 'a121a634-3278-4118-92fe-8d737d079e8b', 'Handling Fee', 'cost', 'AED', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', 'SEATTLE', 'KG', 'SHOES', 'SHPT', '2024-09-03', '2024-09-19', '2024-09-19 03:10:17', '2024-09-19 03:10:17', '2d071270-b0b7-4abb-a817-fd76c1c4e008', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e85729c9-2153-4876-94a5-c040ae729502', '303167d6-2472-460f-86cc-3df274cb90a7', 'edfdccf1-745f-4bf9-afc5-50081dbca9fa', 'THC', 'R', 'USD', 19, 'TJ PERAK', 1000, NULL, 'POR', 'FDC', 'SHPT', 'DUBAI', 'SHPT', 'GARMENTS', 'KG', '2024-09-18', '2024-09-21', '2024-09-19 03:17:25', '2024-09-19 03:17:25', '000109b3-cda8-4e3a-b911-dbddb0ad8724', 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('6fb8778b-e70b-48a8-ab5d-e84a1e1dc08b', '303167d6-2472-460f-86cc-3df274cb90a7', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'N', 'USD', 13, 'TJ PERAK', 1000, 100, 'POR', 'FDC', 'KG', 'DUBAI', 'KG', 'SHOES', 'SHPT', '2024-09-12', '2024-09-20', '2024-09-19 03:17:25', '2024-09-19 03:17:25', 'ef1beee0-09aa-4d8d-957a-273bff325ad8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('d9a1132c-1f06-4fc7-854d-374d9c8c1169', '303167d6-2472-460f-86cc-3df274cb90a7', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'cost', 'USD', 12, 'TJ PERAK', 1000, 400, 'POR', 'FDC', 'SHPT', 'DUBAI', NULL, 'OTHER', NULL, '2024-09-19', '2024-09-20', '2024-09-19 03:17:25', '2024-09-19 03:17:25', 'ef1beee0-09aa-4d8d-957a-273bff325ad8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('25a0de72-1775-47ec-bde1-845a3c645bc1', 'df8e1781-c445-4e9a-a06c-b5446bd6f388', 'a7cf80e1-0bdb-4116-ac5c-8b845324b78a', 'TPC', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'KG', NULL, 'KG', 'ELECTRONIC', 'KG', '2024-09-19', '2024-09-21', '2024-09-19 03:20:20', '2024-09-19 03:20:20', 'fbfa8240-b517-4152-8bb0-7e20182a0022', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'JAKARTA');
INSERT INTO "accounting"."contract_agent_charges" VALUES ('d4fe28e5-c5f8-4b94-952c-92faa21f8e7d', '4fc9fe8c-fab8-4277-ae61-32a8beedea7e', '50caf177-8df3-4840-9466-ebe6ffc16cce', 'DPC', 'N', 'USD', 13, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'SHPT', 'DUBAI', 'KG', 'SHOES', 'KG', '2024-09-18', '2024-09-21', '2024-09-19 03:21:41', '2024-09-19 03:21:41', 'f45bb73a-6508-489a-959f-34035dde9303', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('44b83a16-7e3f-4a42-8baf-c903fd041da2', '9d2096b0-a96c-4d56-82df-9fc040c84d61', '5c997699-2ae6-43fe-825b-c0472dc53143', 'ENSFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-19', '2024-09-30', '2024-09-19 03:24:32', '2024-09-19 03:24:32', '0c67d8bb-cd8d-4156-8247-4448c84f7d25', 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('6ff2cccb-9239-46af-9809-e59f607f1566', '9d2096b0-a96c-4d56-82df-9fc040c84d61', '350a5789-36d2-488d-93d0-c73d5d481560', 'EESUB', 'R', 'USD', 17, NULL, 1000, 500, 'POR', 'FDC', 'SHPT', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-19', '2024-09-30', '2024-09-19 03:25:18', '2024-09-19 03:25:18', '4f60ebf8-3bac-45d1-af53-ebc4e4f5ca9e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('8565a545-deb6-4769-9ed8-f40c0d656849', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'GARMENTS', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-19 03:33:39', '2024-09-19 03:40:53', '87a35cde-0a38-4d9b-ac8c-9ebe451e8fee', 44, 99, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('81f7f0ea-8236-4da1-a41f-b8feb678cfc7', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'GARMENTS', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-19 03:38:02', '2024-09-19 03:40:53', '15ec24db-4f9e-4524-ad86-7d06f733fe69', 44, 99, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('e1a9e58d-cb9b-421c-9a41-0ea297aed59e', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', '74e6a8c5-d96e-4a64-a06d-56040bf1cd47', 'TLUC', 'R', 'USD', 11, NULL, NULL, NULL, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'SHPT', '2024-09-20', '2024-09-20', '2024-09-19 03:38:02', '2024-09-19 03:40:54', '8a481c8d-ec8d-4069-af6c-2c8302e9bad7', 44, 99, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('2e2917a8-a076-451c-99a1-a049b8a23d51', '428b6e36-e12a-4418-8146-82f887526fa4', 'a7cf80e1-0bdb-4116-ac5c-8b845324b78a', 'TPC', 'cost', 'USD', 13, 'TJ PERAK', 1000, 500, 'POR', 'FDC', 'KG', 'SINGAPORE', 'KG', 'SHOES', 'KG', '2024-09-20', '2024-09-21', '2024-09-19 04:02:37', '2024-09-19 04:38:24', 'f53f7b7e-9823-4e78-af52-2cf27e06fdc1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO "accounting"."contract_agent_charges" VALUES ('798e8c47-2ea4-45c0-b525-05474ce39a0d', '428b6e36-e12a-4418-8146-82f887526fa4', 'e793ce5e-c947-414e-ab89-fbadbbf3543e', 'FRT', 'R', 'USD', 17, NULL, 1000, 100, 'POR', 'FDC', 'SHPT', 'DUBAI', 'CNTR', 'SHOES', 'KG', '2024-09-18', '2024-09-30', '2024-09-19 04:17:34', '2024-09-19 04:38:25', '01e5ba2c-7a82-4b89-aee8-60edba7b97c5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for contract_agent_documents
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."contract_agent_documents";
CREATE TABLE "accounting"."contract_agent_documents" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "contract_agent_id" uuid NOT NULL,
  "filename" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "size" int4 NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "url" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of contract_agent_documents
-- ----------------------------
INSERT INTO "accounting"."contract_agent_documents" VALUES ('8f5f295c-cf40-4f79-9e7c-427242f728d1', '1bd3b83f-97a7-42c9-bcfa-9fb42661fdaf', 'TEST.pdf', 23269, 'contract/attachment', 'http://203.175.10.178:8085/contract/attachment/attachment-20240905100427.pdf', '2024-09-05 10:04:27', '2024-09-05 10:04:27');
INSERT INTO "accounting"."contract_agent_documents" VALUES ('a743fed9-a53b-4914-a0e1-ecd203755d4d', '062eacf6-d15d-4621-8847-3ae930126528', 'TEST.pdf', 23269, 'contract/attachment', 'http://203.175.10.178:8085/contract/attachment/attachment-20240905100823.pdf', '2024-09-05 10:08:23', '2024-09-05 10:08:23');

-- ----------------------------
-- Table structure for contract_agents
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."contract_agents";
CREATE TABLE "accounting"."contract_agents" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "vendor_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "vendor_id" uuid NOT NULL,
  "vendor_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "contract_date" date NOT NULL,
  "start_contract_date" date NOT NULL,
  "end_contract_date" date NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "contract_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "notes" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of contract_agents
-- ----------------------------
INSERT INTO "accounting"."contract_agents" VALUES ('9d2096b0-a96c-4d56-82df-9fc040c84d61', 'shippingline', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', '2024-09-20', '2024-09-21', '2024-09-30', '2024-09-19 03:24:32', '2024-09-19 03:24:32', 'CA-20240919032432-T4A', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('ec88c3c5-95b7-4771-b9b8-f30c1abaa3b1', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-08-29', '2024-08-29', '2024-08-31', '2024-08-29 10:53:20', '2024-08-29 10:53:20', 'CA-20240829105320-ICU', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('bf6c4bd1-3500-4c72-906d-d9b089eb3dcc', 'shippingline', 'cc03810e-ae64-4a4d-bc1b-e76d0567fc3d', 'A N C EXPRESS SHIPPING LINE LLC', '2024-09-18', '2024-09-18', '2024-09-20', '2024-09-18 02:46:20', '2024-09-18 07:05:20', 'CA-20240918024620-L5D', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('65ea5bf8-3fa0-4302-aad8-c79b6609c6ee', 'shippingline', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', '2024-09-01', '2024-09-01', '2024-09-30', '2024-09-04 07:06:49', '2024-09-04 07:06:49', 'CA-20240904070649-LQS', 'Please look at this contract');
INSERT INTO "accounting"."contract_agents" VALUES ('79f34603-6864-42bb-b185-2091384391dc', 'shippingline', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', '2024-09-15', '2024-09-17', '2024-09-21', '2024-09-18 07:41:19', '2024-09-18 07:41:19', 'CA-20240918074119-LXS', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', 'shippingline', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', '2024-09-19', '2024-09-20', '2024-09-20', '2024-09-18 08:04:02', '2024-09-18 08:04:02', 'CA-20240918080402-K2V', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('39305fca-5bad-452a-932a-d35eef42266d', 'shippingline', '808fe7df-b3e8-4900-b8bf-60de0afb8d88', 'KMTC LINE', '2024-09-18', '2024-09-19', '2024-09-19', '2024-09-18 03:55:28', '2024-09-18 08:10:58', 'CA-20240918035528-BPQ', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('d217d84a-d8e4-40dc-b411-d26d813c6c96', 'shippingline', '238af942-5d77-4f8b-94d6-7eb48b3ec36b', 'SC LINES LLC', '2024-09-15', '2024-09-16', '2024-09-25', '2024-09-18 08:14:24', '2024-09-18 08:14:24', 'CA-20240918081424-C6Y', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('8ea0628d-9181-4e3d-a4f4-352b9b6c7ca3', 'shippingline', '12513594-22da-4cd7-88dc-abf658890a81', 'SENORIAL SHIPPING SERVICES LLC', '2024-09-20', '2024-09-21', '2024-10-01', '2024-09-18 08:39:51', '2024-09-18 08:39:51', 'CA-20240918083951-YG7', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('662b6729-2cf4-42a1-9dca-8b34d1a66f22', 'shippingline', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', '2024-09-01', '2024-09-02', '2024-09-03', '2024-09-18 10:39:18', '2024-09-18 10:39:18', 'CA-20240918103918-LFA', 'njkbubuiygyu');
INSERT INTO "accounting"."contract_agents" VALUES ('cdcf6fe5-3669-484b-8517-8bc4caef7dae', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-21', '2024-09-21', '2024-09-30', '2024-09-19 03:33:39', '2024-09-19 03:33:39', 'CA-20240919033339-QOC', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('428b6e36-e12a-4418-8146-82f887526fa4', 'shippingline', '9c49c4f0-6958-4302-acee-207978b12c84', 'WAN HAI LINES', '2024-09-21', '2024-09-20', '2024-09-21', '2024-09-19 04:02:37', '2024-09-19 04:02:37', 'CA-20240919040237-8Q7', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('60ab54f5-7af7-41f3-8958-1d973648087e', 'shippingline', '714c672a-859f-400d-9717-2c6a282d4888', 'EVERGREEN LINE', '2024-09-18', '2024-09-19', '2024-09-20', '2024-09-18 11:02:12', '2024-09-18 11:02:12', 'CA-20240918110212-AWY', 'dsdandjbads');
INSERT INTO "accounting"."contract_agents" VALUES ('df8e1781-c445-4e9a-a06c-b5446bd6f388', 'shippingline', '2bbdf6bc-d651-4258-8907-083a334896bb', 'MSC - MEDI', '2024-09-20', '2024-09-20', '2024-09-28', '2024-09-19 02:45:35', '2024-09-19 02:45:35', 'CA-20240919024535-RLZ', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('4fc9fe8c-fab8-4277-ae61-32a8beedea7e', 'shippingline', '4248bff7-acf8-4f11-ab50-2df4993c31ca', 'HYUNDAI MERCHANT MARINE', '2024-09-20', '2024-09-21', '2024-09-30', '2024-09-19 02:54:24', '2024-09-19 02:54:24', 'CA-20240919025424-MIH', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('00ecd526-f1ab-423e-83b3-5ae2b4288c60', 'shippingline', 'cc03810e-ae64-4a4d-bc1b-e76d0567fc3d', 'A N C EXPRESS SHIPPING LINE LLC', '2024-09-16', '2024-09-19', '2024-09-30', '2024-09-19 02:57:46', '2024-09-19 02:57:46', 'CA-20240919025746-5FI', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('0305c87b-1fe9-4ed1-b1c1-c253fb081145', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-20', '2024-09-21', '2024-10-01', '2024-09-19 03:02:04', '2024-09-19 03:02:04', 'CA-20240919030204-XJA', 'asdrawrs');
INSERT INTO "accounting"."contract_agents" VALUES ('534ad214-8f1b-4409-a37b-d9a4fd656df7', 'shippingline', '238af942-5d77-4f8b-94d6-7eb48b3ec36b', 'SC LINES LLC', '2024-09-21', '2024-09-21', '2024-09-22', '2024-09-19 03:04:27', '2024-09-19 03:04:27', 'CA-20240919030427-9U9', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('e52b0496-923e-4866-a259-160d0802237e', 'localvendor', 'e2db5667-a25f-4935-9551-46e89a79b2aa', 'GLOBAL FEEDER SERVICE', '2024-09-19', '2024-09-19', '2024-09-21', '2024-09-19 03:10:17', '2024-09-19 03:10:17', 'CA-20240919031017-DWB', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('303167d6-2472-460f-86cc-3df274cb90a7', 'shippingline', 'db3a59b3-5f30-4a06-8e1b-256a3e393e98', 'ZIM INTEGRATED SHIPPING SERVICES LTD', '2024-09-27', '2024-09-20', '2024-09-30', '2024-09-19 03:17:25', '2024-09-19 03:17:25', 'CA-20240919031725-2MJ', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('6c27b723-7ea5-4c86-b378-c93c55f39929', 'shippingline', 'cc03810e-ae64-4a4d-bc1b-e76d0567fc3d', 'A N C EXPRESS SHIPPING LINE LLC', '2024-09-04', '2024-09-05', '2024-09-05', '2024-09-04 09:56:49', '2024-09-04 09:56:49', 'CA-20240904095649-P5U', 'anc e s l llc');
INSERT INTO "accounting"."contract_agents" VALUES ('c09068ee-09ed-4627-9fc5-ce1fde612428', 'shippingline', '33ee0bac-be75-4576-8a39-ec946ff9228c', 'BRIGHT LINE SHIPPING LLC', '2024-09-05', '2024-09-06', '2024-09-07', '2024-09-05 04:42:05', '2024-09-05 04:42:05', 'CA-20240905044205-UYB', 'agent contract notes');
INSERT INTO "accounting"."contract_agents" VALUES ('965cdd54-aa46-4f4b-9957-6c46ceb4de1d', 'shippingline', '3a705900-2534-4e74-a6ba-83ba8f0fa153', 'SHIPNER SHIPPING LINE LLC', '2024-09-05', '2024-09-06', '2024-09-11', '2024-09-05 04:51:10', '2024-09-05 04:51:10', 'CA-20240905045110-SVB', 'notes');
INSERT INTO "accounting"."contract_agents" VALUES ('0bde4ead-7f67-4e25-a114-01113cc88650', 'shippingline', '9f6c3ed8-0a23-49fc-b85e-a1cc26f8f185', 'ALLIED SHIPPLING LINE L.L.C', '2024-09-05', '2024-09-06', '2024-09-07', '2024-09-05 04:54:47', '2024-09-05 04:54:47', 'CA-20240905045447-6Z3', 'alied notes');
INSERT INTO "accounting"."contract_agents" VALUES ('de855056-1765-48f5-8ce7-df5131cc08a5', 'shippingline', '42937d55-4a98-4494-a237-0947954ec5ac', 'TRANSWORLD SHIPPING AND LOGISTICS LLC', '2024-09-05', '2024-09-06', '2024-09-06', '2024-09-05 08:44:22', '2024-09-05 08:44:22', 'CA-20240905084422-YBQ', 'notes');
INSERT INTO "accounting"."contract_agents" VALUES ('8eef8902-d7e0-40cf-912b-cf8c4caef547', 'shippingline', '7b045039-7a10-48c8-a752-f3edd3399107', 'COSCO Shipping Lines Co', '2024-09-05', '2024-09-05', '2024-09-30', '2024-09-05 08:55:38', '2024-09-05 08:55:38', 'CA-20240905085538-RCJ', 'tes');
INSERT INTO "accounting"."contract_agents" VALUES ('1bd3b83f-97a7-42c9-bcfa-9fb42661fdaf', 'shippingline', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', '2024-09-05', '2024-09-05', '2024-09-07', '2024-09-05 10:04:27', '2024-09-05 10:04:27', 'CA-20240905100427-OGD', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('062eacf6-d15d-4621-8847-3ae930126528', 'shippingline', '33ee0bac-be75-4576-8a39-ec946ff9228c', 'BRIGHT LINE SHIPPING LLC', '2024-09-05', '2024-09-09', '2024-09-14', '2024-09-05 10:08:23', '2024-09-05 10:08:23', 'CA-20240905100823-GCS', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('363cc595-988d-40d7-b359-5091ad0e4172', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-05', '2024-09-07', '2024-09-17', '2024-09-05 10:23:07', '2024-09-05 10:23:07', 'CA-20240905102307-J0T', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('a9138d11-ddb9-408d-ad78-e9c111da2a3e', 'shippingline', '9c49c4f0-6958-4302-acee-207978b12c84', 'WAN HAI LINES', '2024-09-19', '2024-09-14', '2024-09-26', '2024-09-05 10:32:42', '2024-09-05 10:32:42', 'CA-20240905103242-VOF', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('0a3e4b26-bcf6-4823-bbbf-5938dbfbcd37', 'carrier', '0fccce3b-67a1-41b9-9989-124d70732df9', ' CATHAY PACIFIC AIRWAYS', '2024-09-05', '2024-09-07', '2024-09-12', '2024-09-05 10:37:32', '2024-09-05 10:37:32', 'CA-20240905103732-GAI', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('2653232f-f6c7-4c13-9310-36ae9c3c55de', 'shippingline', '3a705900-2534-4e74-a6ba-83ba8f0fa153', 'SHIPNER SHIPPING LINE LLC', '2024-09-05', '2024-09-06', '2024-09-07', '2024-09-05 10:39:49', '2024-09-05 10:39:49', 'CA-20240905103949-HEJ', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('1e062107-391c-409a-986b-68784c2a0c44', 'shippingline', '808fe7df-b3e8-4900-b8bf-60de0afb8d88', 'KMTC LINE', '2024-09-05', '2024-09-05', '2024-09-14', '2024-09-05 10:51:46', '2024-09-05 10:51:46', 'CA-20240905105146-1BE', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('96192b40-a310-4a80-802e-7b13c1a29841', 'shippingline', 'a64117ae-70ae-449e-9eb3-aa7b536816d5', 'KOKO SARANG', '2024-09-09', '2024-09-09', '2024-09-14', '2024-09-09 04:27:49', '2024-09-09 04:27:49', 'CA-20240909042749-JKW', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('5c3d8a53-d2a5-4245-9cbb-d09066f5f443', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-19', '2024-09-19', '2024-09-20', '2024-09-18 03:09:00', '2024-09-18 03:09:00', 'CA-20240918030900-VP6', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('81568e5c-324f-47fd-b433-5a7d73d2dc69', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-18', '2024-09-19', '2024-09-20', '2024-09-18 03:11:39', '2024-09-18 03:11:39', 'CA-20240918031139-LVU', 'Notes');
INSERT INTO "accounting"."contract_agents" VALUES ('b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', 'shippingline', '466fe9b7-1d5c-4a44-94ca-8c8733031bef', 'MSM SHIPPING LINES LLC', '2024-09-19', '2024-09-20', '2024-09-21', '2024-09-18 04:19:27', '2024-09-18 04:19:27', 'CA-20240918041927-M8M', 'Notes');

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."cost";
CREATE TABLE "accounting"."cost" (
  "cost_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "job_id" uuid,
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default",
  "charge_id" uuid,
  "charge_code" varchar(255) COLLATE "pg_catalog"."default",
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "charge" float4,
  "date_created" timestamp(6) DEFAULT now(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 DEFAULT 1,
  "job_order_type" varchar(255) COLLATE "pg_catalog"."default",
  "charge_type" varchar(255) COLLATE "pg_catalog"."default",
  "position" int4
)
;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO "accounting"."cost" VALUES ('a975207c-3933-46e8-95bc-151896f22db1', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHASA2409001', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 25.126, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('731d5baf-485f-4dc4-85b9-8366aca7218a', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHASA2409001', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);
INSERT INTO "accounting"."cost" VALUES ('f8567d5f-680f-4955-8eb8-08c02d24d7f4', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '9ba84c1b-5448-471a-a1df-796b99af261d', 'SHASA2409002', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 50.014, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('c3be476b-b63c-496b-a3e9-983406873100', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '9ba84c1b-5448-471a-a1df-796b99af261d', 'SHASA2409002', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);
INSERT INTO "accounting"."cost" VALUES ('5b063631-f740-4d7d-ad03-b7166f0a38f7', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'SHASA2409003', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 50.402, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('d7e0feab-b0d7-4c29-a1d4-574b412a899c', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'SHASA2409003', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);
INSERT INTO "accounting"."cost" VALUES ('ba837dc9-ec21-41a1-8c9e-14414425d027', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'SHASA2409004', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 20.094, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('8d0ddf90-b358-45b5-9a5d-d67275261602', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '472030ee-bd86-4d6c-bf2f-d6791f049340', 'SHASA2409004', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);
INSERT INTO "accounting"."cost" VALUES ('5b805ab9-6c74-4840-939c-72c817220861', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'SHASA2409005', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 25.514, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('96e49e0d-61ab-4a92-b6af-6059c5def105', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'SHASA2409005', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);
INSERT INTO "accounting"."cost" VALUES ('fbebbf41-53c2-4d02-8f39-9468fb5d9d83', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'SHASA2409006', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 28.852, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 0);
INSERT INTO "accounting"."cost" VALUES ('5c070aaa-b749-4c9a-b018-e38c00c5121b', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'SHASA2409006', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1, 'sea_air', 'Split', 1);

-- ----------------------------
-- Table structure for cost_details
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."cost_details";
CREATE TABLE "accounting"."cost_details" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "cost_id" uuid NOT NULL,
  "vendor_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "container_type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "currency" varchar(50) COLLATE "pg_catalog"."default",
  "charge_name" varchar(100) COLLATE "pg_catalog"."default",
  "teus" int4 NOT NULL DEFAULT 1,
  "status_payment" int2 NOT NULL DEFAULT '0'::smallint,
  "amount" numeric(255,0) NOT NULL DEFAULT '0'::numeric,
  "sub_total" numeric(255,0) NOT NULL DEFAULT '0'::numeric,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;
COMMENT ON COLUMN "accounting"."cost_details"."status_payment" IS '0:unpaid, 1:paid';

-- ----------------------------
-- Records of cost_details
-- ----------------------------

-- ----------------------------
-- Table structure for cost_job_order
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."cost_job_order";
CREATE TABLE "accounting"."cost_job_order" (
  "cost_job_order_id" uuid DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "charge_id" uuid,
  "charge_code" varchar(255) COLLATE "pg_catalog"."default",
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "charge" float4,
  "position" int4,
  "date_created" timestamp(6),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(6),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4
)
;

-- ----------------------------
-- Records of cost_job_order
-- ----------------------------
INSERT INTO "accounting"."cost_job_order" VALUES ('9ee59b7a-15ab-48f1-b025-26ec98375973', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '76edaba2-bc89-4dd9-85e9-cdfb93df5197', 'DO', 'DO', 200, 0, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1);
INSERT INTO "accounting"."cost_job_order" VALUES ('47e27267-ecce-40cc-9785-16d990bc2397', 'b4fd743c-4ed0-4160-b4a2-42760e8b469b', '9223d0e1-5cf5-4b90-8e24-370570b22ba6', 'BLEFEE', 'BLEFEE', 0, 1, '2024-09-05 05:41:13', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05 05:41:13', NULL, 1);

-- ----------------------------
-- Table structure for costs
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."costs";
CREATE TABLE "accounting"."costs" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "job_order_id" uuid,
  "modified_by" varchar COLLATE "pg_catalog"."default",
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4,
  "ctd_number" varchar(150) COLLATE "pg_catalog"."default",
  "charge" int4,
  "charge_id" uuid,
  "charge_code" varchar(255) COLLATE "pg_catalog"."default",
  "charge_name" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "job_id" uuid
)
;

-- ----------------------------
-- Records of costs
-- ----------------------------

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."countries";
CREATE TABLE "accounting"."countries" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "region_id" uuid,
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
-- Records of countries
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."customer";
CREATE TABLE "accounting"."customer" (
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
INSERT INTO "accounting"."customer" VALUES ('6c958c5e-b3a6-4693-98cd-b1aa394bfc9d', 'Customer 001', 'Jakarta', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-08-28 17:59:27', 'user@pamcargo.com', '2024-08-28 18:00:36', NULL, 3, '0daa95fa-9cf4-4448-b31e-99f241f2fd39', NULL, 'b4df4caa-ec8b-4471-8eb6-e72fc76a4224', NULL, '0c84f351-40cf-499b-8914-969d89ae56df', NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('33c5d04b-0b92-4b7c-a392-73bb886db5fe', 'FOOM ETC', '<p>Indonesia</p>', 'foometc@gmail.com', '81251251', NULL, '081212', '512', NULL, 102, '2024-10-17 10:30:26', 'admin@rembon.com', '2024-10-17 10:30:26', 'thomas@pamcargo.com', 1, '1115bd80-47e8-48f7-a4f6-917dd3ff65ce', 'SSF2', '68ae0095-a143-4b7f-99db-ea98616d343f', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('0f9833fa-71fc-41f3-9893-a7e64cf0b84c', 'tes', 'tes', NULL, NULL, NULL, NULL, NULL, NULL, 102, '2024-11-18 11:30:25', NULL, '2024-11-18 11:30:25', NULL, 1, '2fa1ad4c-6cb1-4c61-9858-4949a33b8eea', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('e61b5257-4f1d-42ad-a960-8fbe79e73ba1', 'Test', 'Kp manggis rt 04 rw 04 no. 122
Dramaga', NULL, '085966670173', NULL, NULL, NULL, 'tegar', NULL, '2024-09-18 04:40:16', 'user@pamcargo.com', '2024-09-18 06:35:51', NULL, 3, '2fa1ad4c-6cb1-4c61-9858-4949a33b8eea', NULL, NULL, NULL, NULL, NULL, NULL, '41fb4714-aca3-41a9-a004-87f1a49b8d5b');
INSERT INTO "accounting"."customer" VALUES ('de21ef29-4f96-42f3-ab33-17cab38e2780', 'Customer 001', 'Jakarta', NULL, NULL, NULL, NULL, NULL, NULL, 12, '2024-08-28 18:01:12', 'user@pamcargo.com', '2024-08-28 18:01:12', NULL, 3, '0daa95fa-9cf4-4448-b31e-99f241f2fd39', 'C-001', 'b4df4caa-ec8b-4471-8eb6-e72fc76a4224', NULL, '5b62d2b4-0e8e-4d5e-a47b-f977e058b9ae', NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('1c63741c-00e2-4c2d-a826-5c442a01f086', 'BANTENG MERAH', '<p>Jakarta, Indonesia</p>', 'banteng@merah.com', '+62123456789', NULL, '08123456789', '112233', 'MEGA', 102, '2024-10-14 10:47:53', 'admin@rembon.com', '2024-10-14 10:47:53', NULL, 3, '717cdbef-dccb-4235-a00b-a26cf682658f', NULL, 'b4df4caa-ec8b-4471-8eb6-e72fc76a4224', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('54bc4831-a71c-4ab6-b2bf-340f56360a8a', 'PUTRA MULYONO', '<p>Solo</p>', 'halo@testing.com', '+123456789', NULL, '08987654321', '444', 'MULYONO', 102, '2024-10-14 10:51:12', 'admin@rembon.com', '2024-10-14 10:51:12', 'admin@rembon.com', 3, '1115bd80-47e8-48f7-a4f6-917dd3ff65ce', 'pmy', '5e413180-7d24-41f6-8e3b-d0a71d3f29f9', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('ff2a9440-54e5-4efe-9a08-784867ccad91', 'BILL GATES', '<p>New York</p>', 'halo@bill.com', '+981234567890', NULL, '882345678', '333', 'BILL GATES', NULL, '2024-10-14 11:18:37', 'admin@rembon.com', '2024-10-14 11:18:37', NULL, 3, '0daa95fa-9cf4-4448-b31e-99f241f2fd39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', 'Paris Saint Germany', 'sales@ladusing.com', '23434444', '234234234', '43234234', NULL, '24234', 82, '2024-09-04 08:19:08', 'user@pamcargo.com', '2024-09-04 08:19:08', NULL, 3, 'f65e068e-a3bf-4a7d-bc80-875c27eee1a2', '345345', 'd97b4586-6346-4cd1-bc61-98f70f624468', '345345', '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'PARIS', '345345', NULL);
INSERT INTO "accounting"."customer" VALUES ('71966173-f8ed-4ff1-8e63-ddb82eb18042', 'KUDA MERAH', 'Jalan Jalak Harupat Kel. Gedebage Kec. Tegal Gundil Kota Bandung', NULL, '08998921009', NULL, NULL, NULL, 'Aang Wiadi', NULL, '2024-09-18 06:18:26', 'user@pamcargo.com', '2024-09-18 06:18:26', NULL, 3, '2fa1ad4c-6cb1-4c61-9858-4949a33b8eea', NULL, NULL, NULL, NULL, NULL, NULL, '54ed7b23-800e-4292-b3fa-f1b38a2d0cc3');
INSERT INTO "accounting"."customer" VALUES ('2ac0f861-4a1c-436a-bd54-79a009c40942', 'Lamborghini', 'Sant''Agata Bolognese, Italy', NULL, '01928927837', NULL, NULL, NULL, 'Michael Tajur', NULL, '2024-09-18 06:31:41', 'user@pamcargo.com', '2024-09-18 06:36:55', NULL, 3, '2fa1ad4c-6cb1-4c61-9858-4949a33b8eea', NULL, NULL, NULL, NULL, NULL, NULL, '54c2a1f3-6280-42da-881a-b366a01e51a5');
INSERT INTO "accounting"."customer" VALUES ('5149bedd-c507-447e-ad34-0f649ee30197', 'VASCO DA GAMMA', 'Kp manggis rt 04 rw 04 no. 122
Dramaga', NULL, '085966670173', NULL, NULL, NULL, 'tegar sianipar', NULL, '2024-09-18 06:44:41', 'user@pamcargo.com', '2024-09-18 06:45:03', NULL, 3, '2fa1ad4c-6cb1-4c61-9858-4949a33b8eea', NULL, NULL, NULL, NULL, NULL, NULL, '59372cf0-55a3-4c55-8c15-674150671564');
INSERT INTO "accounting"."customer" VALUES ('ab69c8e9-dd6e-4f94-afd4-2b809e430ac8', 'KING MU', '<p>Manchester</p>', 'halo@mu.com', '+7777123456789', NULL, '0773456788', '777', 'ANTHONY', 230, '2024-10-14 11:40:21', 'admin@rembon.com', '2024-10-14 11:40:21', NULL, 3, '717cdbef-dccb-4235-a00b-a26cf682658f', NULL, '5e413180-7d24-41f6-8e3b-d0a71d3f29f9', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('f5a7e244-31c7-4bde-9939-55072e48a2c8', 'Mulyono bin Slamet', '<p>Indonesia</p>', 'halo@dinasti.com', '+6211987633', NULL, '082256755', 'MLYNO-2K24', 'Mulyono', 102, '2024-10-14 13:32:41', 'admin@rembon.com', '2024-10-14 13:32:41', 'admin@rembon.com', 1, 'f65e068e-a3bf-4a7d-bc80-875c27eee1a2', 'mulyn', '3f0a240e-784b-4799-852f-b6339a5a8e7c', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('aab15850-4c19-43d1-a525-043c901931b6', 'PT. Perusahaan Tukang', '<p>Jakarta</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-14 15:31:22', 'admin@rembon.com', '2024-10-14 15:31:22', NULL, 1, '0daa95fa-9cf4-4448-b31e-99f241f2fd39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('459fe69d-e85f-474d-9749-0f606ad02405', 'OXVA', '<p>JAKARTA</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-17 09:32:02', 'admin@rembon.com', '2024-10-17 09:32:02', NULL, 1, '1115bd80-47e8-48f7-a4f6-917dd3ff65ce', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('6d687f40-42f3-4497-970b-d648e20b952b', 'ASD', '<p>ad</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-17 09:45:21', 'admin@rembon.com', '2024-10-17 09:45:21', NULL, 3, '0daa95fa-9cf4-4448-b31e-99f241f2fd39', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "accounting"."customer" VALUES ('2d6cfaf0-4a6c-4189-b8d1-760a58d08ce7', 'FOOM', '<p>jAKARTA</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, '2024-10-17 10:01:11', 'admin@rembon.com', '2024-10-17 10:01:11', NULL, 3, '1115bd80-47e8-48f7-a4f6-917dd3ff65ce', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."customer_groups";
CREATE TABLE "accounting"."customer_groups" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "telp_number" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "fax" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for customer_types
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."customer_types";
CREATE TABLE "accounting"."customer_types" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of customer_types
-- ----------------------------

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."customers";
CREATE TABLE "accounting"."customers" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "country_id" uuid NOT NULL,
  "customer_type_id" uuid NOT NULL,
  "customer_group_id" uuid,
  "sales_office_id" uuid,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "telp_number" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(255) COLLATE "pg_catalog"."default",
  "fax" varchar(255) COLLATE "pg_catalog"."default",
  "tax_id" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "customer_code" varchar(255) COLLATE "pg_catalog"."default",
  "iata_code" varchar(255) COLLATE "pg_catalog"."default",
  "zip_code" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for group_charges
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."group_charges";
CREATE TABLE "accounting"."group_charges" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "object_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "group_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "note" text COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of group_charges
-- ----------------------------

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."invoices";
CREATE TABLE "accounting"."invoices" (
  "invoices_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "customer_id" uuid,
  "customer_name" varchar(255) COLLATE "pg_catalog"."default",
  "due_date" date NOT NULL,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date,
  "date_modified" date,
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int2 NOT NULL,
  "status_payment" int2 DEFAULT 0,
  "note" varchar(255) COLLATE "pg_catalog"."default",
  "invoices_number" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of invoices
-- ----------------------------
INSERT INTO "accounting"."invoices" VALUES ('725036cc-f9fa-4669-8089-8688e9714ed5', 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', '2024-09-05', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05', NULL, NULL, 1, 0, '', '2409-001', NULL, NULL);
INSERT INTO "accounting"."invoices" VALUES ('90be2e06-ef8a-4157-92a6-b65c7cd1e696', 'de21ef29-4f96-42f3-ab33-17cab38e2780', 'Customer 001', '2024-09-05', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05', NULL, NULL, 1, 0, '', '2409-002', NULL, NULL);
INSERT INTO "accounting"."invoices" VALUES ('4ac78c3c-95d7-480e-84b0-01ab02fa0a8d', 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', '2024-09-05', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05', NULL, NULL, 1, 0, '', '2409-003', NULL, NULL);
INSERT INTO "accounting"."invoices" VALUES ('63657da9-c435-4147-9968-c771f0ba60e8', 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', '2024-09-05', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-05', NULL, NULL, 1, 0, '', '2409-004', NULL, NULL);
INSERT INTO "accounting"."invoices" VALUES ('f04826c0-6c72-4fcb-9b3d-075b9d6784b2', 'b8612cba-96e2-4833-907a-aac1532e83ca', 'LADUSING COMPANY CORP', '2024-09-19', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-09-19', NULL, NULL, 1, 0, 'tes invoices', '2409-005', NULL, NULL);
INSERT INTO "accounting"."invoices" VALUES ('5da2183d-cb1e-4654-adf6-f9e46f83517a', '33c5d04b-0b92-4b7c-a392-73bb886db5fe', 'FOOM ETC', '2024-11-19', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', '2024-11-19', NULL, NULL, 1, 0, 'sadad', '2411-001', NULL, NULL);

-- ----------------------------
-- Table structure for invoices_detail
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."invoices_detail";
CREATE TABLE "accounting"."invoices_detail" (
  "invoices_detail_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "invoices_id" uuid,
  "job_id" uuid,
  "origin_name" varchar(255) COLLATE "pg_catalog"."default",
  "consigne_name" varchar(255) COLLATE "pg_catalog"."default",
  "ctd_number" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of invoices_detail
-- ----------------------------
INSERT INTO "accounting"."invoices_detail" VALUES ('b7c6ebe8-5dd1-4994-b29a-4ab279957c38', '61b5769a-0a3d-44a3-b6ef-bf1deaca8a03', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'SHANGHAI', 'DIADORA SPA', 'SHASA2409006', '2024-09-05 05:24:41', '2024-09-05 05:24:41');
INSERT INTO "accounting"."invoices_detail" VALUES ('69aa1b10-4ec7-4460-a809-af863a59650b', '3cc88247-ebb2-4eec-bebd-415e03e6846a', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'SHANGHAI', 'AP NEDERLAND B.V.', 'SHASA2409005', '2024-09-05 05:42:23', '2024-09-05 05:42:23');
INSERT INTO "accounting"."invoices_detail" VALUES ('742da147-304c-44ea-b8f4-313b69aeec16', '09301b6c-2a85-4337-bfff-b37945ead22b', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHANGHAI', 'DOMETIC GERMANY GMBH', 'SHASA2409001', '2024-09-05 05:47:29', '2024-09-05 05:47:29');
INSERT INTO "accounting"."invoices_detail" VALUES ('3193a71c-0fd0-4631-8b4f-1da167a5bd2a', '4ecfebc1-7b6f-48de-8168-d0aaca21f690', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHANGHAI', 'DOMETIC GERMANY GMBH', 'SHASA2409001', '2024-09-05 05:48:10', '2024-09-05 05:48:10');
INSERT INTO "accounting"."invoices_detail" VALUES ('8f7da7f6-aebb-48e0-9883-2e05373af23c', 'e703cbdf-e8d3-4f0c-894d-a6723a0c67e1', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHANGHAI', 'DOMETIC GERMANY GMBH', 'SHASA2409001', '2024-09-05 05:52:50', '2024-09-05 05:52:50');
INSERT INTO "accounting"."invoices_detail" VALUES ('c32932c5-b1f7-49e3-bbd2-3b7106d326fa', 'e703cbdf-e8d3-4f0c-894d-a6723a0c67e1', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'JAKARTA', 'LACOSTE', 'JKTSA2409001', '2024-09-05 05:52:50', '2024-09-05 05:52:50');
INSERT INTO "accounting"."invoices_detail" VALUES ('41a0737d-f795-44a3-9d3b-ce73b2a203aa', '7c744709-5150-4a23-b732-d7f08695abce', '4d6cc804-1577-44b5-952f-fc49cf16bedf', 'JAKARTA', 'LACOSTE', 'JKTSA2409002', '2024-09-05 05:54:57', '2024-09-05 05:54:57');
INSERT INTO "accounting"."invoices_detail" VALUES ('1ed8ae60-baa5-4fde-9e3c-a3899cf45de5', '725036cc-f9fa-4669-8089-8688e9714ed5', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHANGHAI', 'DOMETIC GERMANY GMBH', 'SHASA2409001', '2024-09-05 05:56:43', '2024-09-05 05:56:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('fc9b6002-94a4-4bdd-88b2-6a87c8473228', '0a7d9d70-e037-4010-a8ef-f508916f613c', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'JAKARTA', 'LACOSTE', 'JKTSA2409001', '2024-09-05 06:05:44', '2024-09-05 06:05:44');
INSERT INTO "accounting"."invoices_detail" VALUES ('1c9accf9-f60b-46c5-a423-1cbd8f4eb2b0', '90be2e06-ef8a-4157-92a6-b65c7cd1e696', 'adbbaa57-c4a6-429f-9e2c-73aecfe792bf', 'JAKARTA', 'LACOSTE', 'JKTSA2409001', '2024-09-05 06:06:35', '2024-09-05 06:06:35');
INSERT INTO "accounting"."invoices_detail" VALUES ('e7d723bb-af14-4882-8d86-c96f8e1e5424', '4ac78c3c-95d7-480e-84b0-01ab02fa0a8d', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'SHANGHAI', 'AP NEDERLAND B.V.', 'SHASA2409005', '2024-09-05 06:07:12', '2024-09-05 06:07:12');
INSERT INTO "accounting"."invoices_detail" VALUES ('5104bb7d-e2b1-46ad-b09e-68c6c2c96fdf', '63657da9-c435-4147-9968-c771f0ba60e8', '51f13c8d-91f5-4fa3-9ef6-d67dce596be3', 'SHANGHAI', 'AP NEDERLAND B.V.', 'SHASA2409005', '2024-09-05 09:07:09', '2024-09-05 09:07:09');
INSERT INTO "accounting"."invoices_detail" VALUES ('3fd8c5c4-cf7a-4c4e-9761-6780c0df2a16', '63657da9-c435-4147-9968-c771f0ba60e8', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'SHANGHAI', 'DIADORA SPA', 'SHASA2409006', '2024-09-05 09:07:09', '2024-09-05 09:07:09');
INSERT INTO "accounting"."invoices_detail" VALUES ('3226cf51-d3f4-4264-9aaa-40d4eceb1f02', 'f04826c0-6c72-4fcb-9b3d-075b9d6784b2', '1dfc9387-daf8-42a4-9e83-5988441ab31a', 'SHANGHAI', 'DIADORA SPA', 'SHASA2409006', '2024-09-19 04:30:47', '2024-09-19 04:30:47');
INSERT INTO "accounting"."invoices_detail" VALUES ('3cf49075-66b8-4215-99d6-441bdf45c0d1', 'f04826c0-6c72-4fcb-9b3d-075b9d6784b2', 'de50ad41-f048-40e5-9c27-42413c98e9a6', 'SHANGHAI', 'DOMETIC GERMANY GMBH', 'SHASA2409001', '2024-09-19 04:30:47', '2024-09-19 04:30:47');
INSERT INTO "accounting"."invoices_detail" VALUES ('196ec078-decf-4280-8488-dfa6fa2fbe99', 'f04826c0-6c72-4fcb-9b3d-075b9d6784b2', '55266cd6-7933-4fa5-9b5b-f04225430d24', 'SHANGHAI', 'DEVRED SAS', 'SHASA2409003', '2024-09-19 04:30:47', '2024-09-19 04:30:47');
INSERT INTO "accounting"."invoices_detail" VALUES ('39c844b2-6e23-4869-9d17-88c336671729', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '022206fc-875e-412a-b6ff-839c100c654f', 'SHANGHAI', 'JAS WORLDWIDE SWEDEN AB', 'SHASA2409049', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('e083d0c8-2732-4810-a1ec-526a360fff56', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '09a4063a-0414-450f-98b8-f65f77daebfc', 'HO CHI MINH', 'ASICS EUROPE BV / EDC', 'HCMSA2410012', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('41343275-bf6e-4bac-b7a6-0e011111e741', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '0a5ffdfc-4ee5-4b7d-83c4-caa3c593b950', 'SHANGHAI', 'DEUTSCHE BANK', 'SHASA2410001', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('77ed088a-0999-423c-9ebc-9466e955f5e0', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '0cd0b7f5-6b32-4303-a095-0348d88b5192', 'SHENZHEN', 'BLASER GROUP GMBH', 'SZXSA2410005', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('41e1337b-c9e9-4042-97d5-e7cac092294f', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '139d4f2a-a916-495f-9d6c-f5aa2ad6fcf9', 'CHITTAGONG', 'JACK WOLFSKIN AUSRUESTUNG FUER DRAUSSEN GMBH & AND CO. KGAA', 'CGPSA2410006', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('36e2af4a-d9bd-4c65-b226-85855bdba4f9', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '141bb955-bf50-4545-a0f2-8700d43e98b3', 'CHENNAI', 'AMB Industri AB', 'MAASA2410001', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('c9c7685e-42e1-415f-bb9b-777d595c71eb', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '15df90d4-2535-43af-9cdb-42df048b9730', 'HO CHI MINH', 'ASICS EUROPE B.V./ DCS', 'HCMSA2410005', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('7923b4d8-dbb6-4079-a003-9d0c83dc2dfe', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '1c4381e8-a899-4729-bc6d-a006dab1f737', 'CHITTAGONG', 'OSPIG GMBH', 'CGPSA2409089', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('887dedd8-2743-4923-b480-e86118e8a924', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', '1d08d5f8-876d-4cd5-bf68-8b980a78eeba', 'HO CHI MINH', 'ASICS EUROPE B.V./ DCS', 'HCMSA2410008', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('4f1b8916-2bd6-49f0-8ac3-0c623d43b571', '5cb4c391-7a54-49c1-bafa-7fe1a79b858c', 'b3037327-aa86-43c2-ad66-111666d5cc98', 'HAIPHONG', 'ASICS EUROPE BV / EDC', 'HPHSA2410001', '2024-11-01 10:22:43', '2024-11-01 10:22:43');
INSERT INTO "accounting"."invoices_detail" VALUES ('2ef18917-862a-4cc0-a235-36d24eb204fc', '5da2183d-cb1e-4654-adf6-f9e46f83517a', '1d5e2ad1-71cc-4df0-8144-5cd2b0bf2cc2', 'CHITTAGONG', 'VAN DER HELM AIR & OCEAN AMSTERDAM BV', 'CGPSA2409090', '2024-11-19 02:54:33', '2024-11-19 02:54:33');
INSERT INTO "accounting"."invoices_detail" VALUES ('5502d1b2-62b6-406b-b70d-447ba450efac', '5da2183d-cb1e-4654-adf6-f9e46f83517a', 'b3037327-aa86-43c2-ad66-111666d5cc98', 'HAIPHONG', 'ASICS EUROPE BV / EDC', 'HPHSA2410001', '2024-11-19 02:54:33', '2024-11-19 02:54:33');

-- ----------------------------
-- Table structure for invoices_rate
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."invoices_rate";
CREATE TABLE "accounting"."invoices_rate" (
  "rate_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "charge_id" uuid,
  "charge_code" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "charge_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(10,2) NOT NULL,
  "currency_code" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "invoices_id" uuid NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of invoices_rate
-- ----------------------------
INSERT INTO "accounting"."invoices_rate" VALUES ('db556491-0425-4b67-9758-d9eebf2312ab', '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 'EXW', 'EX_WORK', 1.00, 'USD', '', '61b5769a-0a3d-44a3-b6ef-bf1deaca8a03', '2024-09-05 05:24:41', '2024-09-05 05:24:41');
INSERT INTO "accounting"."invoices_rate" VALUES ('1682811a-314d-4386-b5a4-0a512dcf5171', '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 'EXW', 'EX_WORK', 1.00, 'USD', '', 'e703cbdf-e8d3-4f0c-894d-a6723a0c67e1', '2024-09-05 05:52:50', '2024-09-05 05:52:50');
INSERT INTO "accounting"."invoices_rate" VALUES ('0b6959ed-ba01-4c54-af40-f9b3d1fcc8ef', '511e66d7-4a63-447f-920b-1182219b8c78', 'HF', 'HANDLING FEE', 1.00, 'USD', '', '7c744709-5150-4a23-b732-d7f08695abce', '2024-09-05 05:54:57', '2024-09-05 05:54:57');
INSERT INTO "accounting"."invoices_rate" VALUES ('7ad2c82b-7e6f-41e1-b83d-45b902e50939', '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 'EXW', 'EX_WORK', 1.00, 'USD', '', '725036cc-f9fa-4669-8089-8688e9714ed5', '2024-09-05 05:56:43', '2024-09-05 05:56:43');
INSERT INTO "accounting"."invoices_rate" VALUES ('60fccf18-8354-448e-94c5-39499d3dd32d', '5561c96e-1813-4531-9426-28fc8ef2b241', 'FRC', 'FREIGHT RATE COLLECT', 1.00, 'USD', 'saad', '90be2e06-ef8a-4157-92a6-b65c7cd1e696', '2024-09-05 06:06:35', '2024-09-05 06:06:35');
INSERT INTO "accounting"."invoices_rate" VALUES ('79a921dd-72d9-4c24-b569-91195a27a6c2', 'b7e1b951-bd2c-479b-a538-408b57135977', 'FRP', 'FREIGHT RATE PREPAID', 100.00, 'USD', 'TES', '4ac78c3c-95d7-480e-84b0-01ab02fa0a8d', '2024-09-05 06:07:12', '2024-09-05 06:07:12');
INSERT INTO "accounting"."invoices_rate" VALUES ('22a7dbdf-278c-4d8a-89ce-e9f2dd3ac931', '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 'EXW', 'EX_WORK', 1.00, 'USD', '', '63657da9-c435-4147-9968-c771f0ba60e8', '2024-09-05 09:07:09', '2024-09-05 09:07:09');
INSERT INTO "accounting"."invoices_rate" VALUES ('2676b777-5b90-4c9a-ae88-d55a72b5bfd6', '5561c96e-1813-4531-9426-28fc8ef2b241', 'FRC', 'FREIGHT RATE COLLECT', 1.00, 'USD', '', 'f04826c0-6c72-4fcb-9b3d-075b9d6784b2', '2024-09-19 04:30:47', '2024-09-19 04:30:47');
INSERT INTO "accounting"."invoices_rate" VALUES ('5e6d59ed-2085-4598-b00c-3febfd2d6bf1', '709e113a-c8e9-47ae-a0ca-89f7b92ed6eb', 'EXW', 'EX_WORK', 1.00, 'USD', '', 'f04826c0-6c72-4fcb-9b3d-075b9d6784b2', '2024-09-19 04:30:47', '2024-09-19 04:30:47');
INSERT INTO "accounting"."invoices_rate" VALUES ('de7da4ac-0e66-4128-b8d9-d62f05620cc6', '5561c96e-1813-4531-9426-28fc8ef2b241', 'FRC', 'FREIGHT RATE COLLECT', 1.00, 'USD', 'sadad', '5da2183d-cb1e-4654-adf6-f9e46f83517a', '2024-11-19 02:54:33', '2024-11-19 02:54:33');

-- ----------------------------
-- Table structure for journal
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."journal";
CREATE TABLE "accounting"."journal" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "transaction_recurring_id" uuid,
  "transaction_date" date,
  "ref_number" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "additional_description" varchar(255) COLLATE "pg_catalog"."default",
  "is_automatic_transaction" bool NOT NULL DEFAULT false,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of journal
-- ----------------------------

-- ----------------------------
-- Table structure for journal_details
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."journal_details";
CREATE TABLE "accounting"."journal_details" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "journal_id" uuid NOT NULL,
  "debit" numeric(255,0),
  "credit" numeric(255,0),
  "currency_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "account_code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "activity_code" uuid,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of journal_details
-- ----------------------------

-- ----------------------------
-- Table structure for journal_has_file_storages
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."journal_has_file_storages";
CREATE TABLE "accounting"."journal_has_file_storages" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "journal_id" uuid NOT NULL,
  "file_storage_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of journal_has_file_storages
-- ----------------------------

-- ----------------------------
-- Table structure for offices
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."offices";
CREATE TABLE "accounting"."offices" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "telp" varchar(255) COLLATE "pg_catalog"."default",
  "fax" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "tax_id" varchar(255) COLLATE "pg_catalog"."default",
  "office_contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "country_id" uuid NOT NULL,
  "prefix" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "office_alias" varchar(255) COLLATE "pg_catalog"."default",
  "office_type" int4,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of offices
-- ----------------------------

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."regions";
CREATE TABLE "accounting"."regions" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO "accounting"."regions" VALUES ('70b300e0-23d8-49e6-9bdd-6021a148ae0f', 'ASIA', 'AS', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('33bd9cff-1d0b-4c9a-b20e-2a5bc8bf38f5', 'AFRICA', 'AFR', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('f9757140-dca0-4d1c-b34d-0f2e3ebd1fab', 'NORTH AMERICA', 'NA', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('4b5c6af0-71c3-41c2-ba2a-a168e8d8daf6', 'SOUTH AMERICA', 'SA', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('c8a7d8e5-e190-4e08-a986-2dfa4186360f', 'ANTARTICA', 'ATC', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('850b0a34-94d5-4aa7-8e92-87a5e3c012b5', 'EUROPE', 'EU', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);
INSERT INTO "accounting"."regions" VALUES ('d7ce4138-50e0-4701-9fae-056d3b1f5283', 'AUSTRALIA', 'AUS', NULL, NULL, '2024-08-29 03:44:36', '2024-08-29 03:44:36', 1);

-- ----------------------------
-- Table structure for sales_offices
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."sales_offices";
CREATE TABLE "accounting"."sales_offices" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of sales_offices
-- ----------------------------

-- ----------------------------
-- Table structure for service_contracts
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."service_contracts";
CREATE TABLE "accounting"."service_contracts" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "service_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "por_country" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "por_port" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fdc_country" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fdc_port" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tos" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tos_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "transit" varchar(255) COLLATE "pg_catalog"."default",
  "carrier_id" uuid NOT NULL,
  "carrier_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "notes" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "contract_agent_id" uuid NOT NULL,
  "party" varchar(255) COLLATE "pg_catalog"."default",
  "manual_input_transit" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of service_contracts
-- ----------------------------
INSERT INTO "accounting"."service_contracts" VALUES ('bf6dda8f-b125-4484-ab09-0e4ac1f6c368', 'air', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-08-29 10:53:20', '2024-08-29 10:53:20', 'ec88c3c5-95b7-4771-b9b8-f30c1abaa3b1', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('e99ebfab-6f5f-4e21-b22d-6062b5eca60b', 'lcl_and_fcl', '44', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', '82', '120ebedb-b5f5-4ef7-8202-a0a0331c24ad', 'TOS DULU GAES', 'TOS AJA DULU', 'DUBAI', 'ae307878-e20a-444c-823b-1de4b1df36d4', 'LUFTHANSA CARGO AG', NULL, '2024-09-04 07:06:49', '2024-09-04 07:06:49', '65ea5bf8-3fa0-4302-aad8-c79b6609c6ee', NULL, NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f8059546-13aa-47ae-9fbf-b1a152dfb0a2', 'lcl_and_fcl', '1', '3b061b94-9963-4a5c-9e60-636f32c617b3', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'tos', 'tos name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'notes', '2024-09-04 09:56:49', '2024-09-04 09:56:49', '6c27b723-7ea5-4c86-b378-c93c55f39929', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('9fb1ec81-b66b-4885-ab4c-b0524ba9ba91', 'air', '191', '8212138f-c42b-4d1c-bddc-7a4eccca2a78', '44', 'bd0e0eca-8d08-4a03-9a25-d568d8f3dd79', 'tos', 'tos name', 'DUBAI', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'notes', '2024-09-05 04:42:05', '2024-09-05 04:42:05', 'c09068ee-09ed-4627-9fc5-ce1fde612428', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('5d89644d-5e9d-4d26-84b8-93c51355e1dd', 'air', '13', '58e2e0b4-6b19-4083-8d90-8c417f024c48', '109', 'c1a95a6e-5e97-45f1-95ee-1b7ea478fa00', 'tos t', 'tos name', 'DUBAI', '03ae285c-dafe-46a9-89b4-df644114dc0b', 'CALM AIR', 'notes', '2024-09-05 04:51:10', '2024-09-05 04:51:10', '965cdd54-aa46-4f4b-9957-6c46ceb4de1d', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f6937207-7775-429f-b4aa-d23d87f5d175', 'lcl_and_fcl', '2', '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', '109', '68a64431-4e90-49e8-8529-2fa305646bef', 'tos', 'tos name', 'DUBAI', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'notes', '2024-09-05 04:54:47', '2024-09-05 04:54:47', '0bde4ead-7f67-4e25-a114-01113cc88650', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('4921cb38-eb09-4899-8f96-60eb2f5689aa', 'lcl_and_fcl', '109', 'c1a95a6e-5e97-45f1-95ee-1b7ea478fa00', '44', 'd177586c-62a7-4170-b5f7-1d236d1f74c2', 'tos', 'tos name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'notes', '2024-09-05 04:54:47', '2024-09-05 04:54:47', '0bde4ead-7f67-4e25-a114-01113cc88650', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('a08837b6-2257-41f9-a88e-63515afbac60', 'lcl_and_fcl', '1', '1672bc78-9f89-4f36-9195-87a3f6a1af26', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', 'tos', 'tos name', 'DUBAI', '0431136a-17e9-47ae-a81b-9a2b9278d3d3', 'ESTONIAN AIR', 'notes', '2024-09-05 08:44:22', '2024-09-05 08:44:22', 'de855056-1765-48f5-8ce7-df5131cc08a5', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('576a0f27-2044-42a0-83df-37297a19df7f', 'lcl_and_fcl', '30', 'cb6530ab-f612-4529-b07a-41d931726cc7', '20', '5aab7907-7e11-4b0b-a33b-37085adef01f', 'tos', 'tos name', 'DUBAI', '0431136a-17e9-47ae-a81b-9a2b9278d3d3', 'ESTONIAN AIR', 'notes', '2024-09-05 08:44:22', '2024-09-05 08:44:22', 'de855056-1765-48f5-8ce7-df5131cc08a5', 'party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('cf935d85-4274-45d6-88b7-3abb0a212e70', 'lcl_and_fcl', '102', '7f3a2989-b7d3-4cc6-8121-a553a40eeb0e', '229', '0562a989-3a20-4cdf-bb1f-81c5e467e5b0', 'tes', 'tes', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'tes', '2024-09-05 08:55:38', '2024-09-05 08:55:38', '8eef8902-d7e0-40cf-912b-cf8c4caef547', '123', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2b8821cc-fdbf-4bd7-8ab8-5df19dda184d', 'land', '102', 'c4e644bf-531f-4079-80fc-4387f7a1150d', '132', '1d4565b4-fe38-4f38-8d0f-f2d6da51bdf2', 'TOS', 'TOS Name', 'DUBAI', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-05 10:04:27', '2024-09-05 10:04:27', '1bd3b83f-97a7-42c9-bcfa-9fb42661fdaf', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('5a933611-865a-44c8-8abe-bc016658ba33', 'lcl_and_fcl', '196', 'ca8802f6-9e99-4b5f-850c-92d97298f480', '217', '632baff3-86f8-4ddb-a2f3-2cb909b770c7', 'TOS', 'TOS Name', 'SINGAPORE', '023b1135-3814-4c0d-8180-67aefefc14bb', 'POLAR AIR CARGO', 'Notes', '2024-09-05 10:08:23', '2024-09-05 10:08:23', '062eacf6-d15d-4621-8847-3ae930126528', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('0e75a0b9-5c09-4cd6-a2f0-02762e513db6', 'air', '102', '4b11aace-fafc-4d64-9495-345a47cd57e0', '82', '9574c1f2-aa2d-430a-aff0-ff7f841e0893', 'tes', 'tes', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'sadad', '2024-09-05 10:09:24', '2024-09-05 10:09:24', '8eef8902-d7e0-40cf-912b-cf8c4caef547', '2121', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('70bd4b87-cda9-4d3d-ab96-cec3f1f43e23', 'air', '30', 'b2cbe192-8cac-453d-a078-44fb4cc66218', '3', '6e007669-5d02-44ae-8510-893f8f314191', 'TOS', 'TOS Name', 'Transit', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', NULL, '2024-09-05 10:23:07', '2024-09-05 10:23:07', '363cc595-988d-40d7-b359-5091ad0e4172', NULL, NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('0027c242-9c7e-4dac-b503-75e106b9bef5', 'land', '3', '6e007669-5d02-44ae-8510-893f8f314191', '38', '8f2b59be-9106-4404-8819-61d24b5d4480', 'TOS', 'TOS Name', 'LOS ANGELES', '264da7ca-07ae-4a08-a075-84f89373d394', 'ICELANDAIR', 'Notes', '2024-09-05 10:32:42', '2024-09-05 10:32:42', 'a9138d11-ddb9-408d-ad78-e9c111da2a3e', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('8a9948eb-136d-48bd-8d36-c297bdbafaa4', 'land', '44', 'af1b3f59-6950-4bba-b473-575c963220cb', '37', '838ffcfa-d30c-46e0-ae4e-83ec6d5f27d9', 'TOS', 'TOS Neme', 'Transit', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-05 10:32:42', '2024-09-05 10:32:42', 'a9138d11-ddb9-408d-ad78-e9c111da2a3e', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2f565f3b-0840-419c-abed-57e449250669', 'air', '1', '46eba779-ab9f-4fcb-9ab4-e0fa5f579fc1', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'DUBAI', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-05 10:37:32', '2024-09-05 10:37:32', '0a3e4b26-bcf6-4823-bbbf-5938dbfbcd37', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f9d0dcde-b5ab-4ef3-a0a9-e9aff04cc245', 'lcl_and_fcl', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', '18', '760d5c6d-3cab-4b94-826b-31aaea94f0c8', 'TOS', 'TOS Neme', 'SINGAPORE', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-05 10:37:32', '2024-09-05 10:37:32', '0a3e4b26-bcf6-4823-bbbf-5938dbfbcd37', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('4d21f10d-57bd-424d-90ee-62e22b81231d', 'air', '6', '50ffcb47-5cec-41ec-ae2b-00c552d4fe53', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'SEATTLE', '023b1135-3814-4c0d-8180-67aefefc14bb', 'POLAR AIR CARGO', 'Notes', '2024-09-05 10:39:49', '2024-09-05 10:39:49', '2653232f-f6c7-4c13-9310-36ae9c3c55de', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('01c47107-b9cd-4a7e-9ce8-391ea6087976', 'lcl_and_fcl', '32', '1430c238-a89e-4cdd-bba2-7b2147664265', '38', '9441ad74-9f16-49d2-ab0e-f812bd749047', 'TOS', 'TOS Name', 'LOS ANGELES', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-05 10:51:46', '2024-09-05 10:51:46', '1e062107-391c-409a-986b-68784c2a0c44', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2f5b200a-1c95-4fec-86a8-8017f498afd1', 'lcl_and_fcl', '132', '1e64c324-a84c-4382-a46e-8732efc3843c', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'LOS ANGELES', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-09 04:27:49', '2024-09-09 04:27:49', '96192b40-a310-4a80-802e-7b13c1a29841', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('db52e88a-75f8-445f-982f-f5d5153a0bc8', 'lcl_and_fcl', '38', '9441ad74-9f16-49d2-ab0e-f812bd749047', '82', '6d240974-bf1f-407d-bead-8fe81ff4fb27', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 02:46:20', '2024-09-18 02:46:20', 'bf6c4bd1-3500-4c72-906d-d9b089eb3dcc', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('d9045aac-8b8b-4a2c-8258-ee13deafe229', 'air', '12', 'c765c771-be11-41ee-819e-5be84525452d', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 03:09:00', '2024-09-18 03:09:00', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('918a87fa-fa0c-459a-9860-6b27bff6b1ce', 'lcl_and_fcl', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', 'TOS', 'TOS Name', NULL, '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 03:11:39', '2024-09-18 03:11:39', '81568e5c-324f-47fd-b433-5a7d73d2dc69', 'Party', 'JAKARTA');
INSERT INTO "accounting"."service_contracts" VALUES ('85af2f52-29e6-4ab1-bd87-3ebc149bc273', 'lcl_and_fcl', '27', '69d7ec30-3819-4ffb-b98b-11d563038dd4', '2', '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', 'TOS', 'TOS Name', 'SINGAPORE', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-18 03:55:28', '2024-09-18 03:55:28', '39305fca-5bad-452a-932a-d35eef42266d', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('7132bdd9-8006-4611-9244-02bcd9fc96cb', 'air', '35', '4dc97af1-5195-419f-891f-5b5186e17131', '99', 'f561a8b5-c317-4722-881c-389ae996016d', 'TOS', 'TOS Neme', 'JAKARTA', '023b1135-3814-4c0d-8180-67aefefc14bb', 'POLAR AIR CARGO', 'Notes', '2024-09-18 03:55:28', '2024-09-18 03:55:28', '39305fca-5bad-452a-932a-d35eef42266d', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('99d54c41-47dc-49e2-80f3-91f804a63d89', 'air', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', 'TOS', 'TOS Name', 'SINGAPORE', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-18 04:19:27', '2024-09-18 04:19:27', 'b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('04c0e312-bd9b-4e02-8934-a119818f5651', 'land', '1', '3b061b94-9963-4a5c-9e60-636f32c617b3', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', 'TOS', 'TOS Name', 'SEATTLE', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 04:19:27', '2024-09-18 04:19:27', 'b3593b6c-ce3e-46cf-aeb8-16d1f036fd75', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('470ea3f2-b92c-40b9-b4c5-9b47daa0fe87', 'lcl_and_fcl', '38', '9441ad74-9f16-49d2-ab0e-f812bd749047', '82', '6d240974-bf1f-407d-bead-8fe81ff4fb27', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 07:05:20', '2024-09-18 07:05:20', 'bf6c4bd1-3500-4c72-906d-d9b089eb3dcc', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('4eb7db4d-2b02-446b-9896-3ec6acb096bd', 'lcl_and_fcl', '132', '1e64c324-a84c-4382-a46e-8732efc3843c', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'LOS ANGELES', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 07:09:31', '2024-09-18 07:09:31', '96192b40-a310-4a80-802e-7b13c1a29841', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('e6d6da24-c96d-4434-975d-2b31e2549291', 'air', '132', '40025863-a2bd-4ca5-bf37-a519f4700376', '2', '0aea5f64-2e9d-462c-aba8-ed643d6a0717', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 07:09:42', '2024-09-18 07:09:42', '96192b40-a310-4a80-802e-7b13c1a29841', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('421927d0-d46c-43ef-bf95-7e235e40d8db', 'land', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', '3', 'd7d7f1d7-db24-4ef8-920f-f525d94d746a', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 07:19:10', '2024-09-18 07:19:10', '81568e5c-324f-47fd-b433-5a7d73d2dc69', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('d3533570-ac05-4f1d-8b7e-aabaf9292ef3', 'air', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 07:41:19', '2024-09-18 07:41:19', '79f34603-6864-42bb-b185-2091384391dc', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('6bb6bf13-441f-4ab6-83d0-9eebe256d496', 'air', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', '3', '7cb01a46-d53b-4efa-b1f6-a9d088d1796d', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 07:43:39', '2024-09-18 07:43:39', '79f34603-6864-42bb-b185-2091384391dc', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('7324ede4-0713-4bd6-9bab-3f5210d1ed5b', 'land', '36', '60ce009b-e6de-43ab-b425-158e0098f064', '34', '706ca1e7-13e2-4685-b8ec-02d4ecfca4af', 'TOS', 'TOS Name', 'JAKARTA', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-18 07:43:39', '2024-09-18 07:43:39', '79f34603-6864-42bb-b185-2091384391dc', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('befd988f-4f15-4052-bf10-a2ca2b672cbc', 'air', '12', 'c765c771-be11-41ee-819e-5be84525452d', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 07:48:32', '2024-09-18 07:48:32', '5c3d8a53-d2a5-4245-9cbb-d09066f5f443', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('efa0e487-c7d7-4f85-b586-afb38ba3b273', 'air', '69', '73b61e67-e8ea-4721-ad0b-ad7c286538dd', '12', 'c765c771-be11-41ee-819e-5be84525452d', 'TOS', 'TOS Name', 'SEATTLE', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 08:04:02', '2024-09-18 08:04:02', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('0fac5074-a693-40ea-aa5f-b776a46fed96', 'air', '69', '73b61e67-e8ea-4721-ad0b-ad7c286538dd', '12', 'c765c771-be11-41ee-819e-5be84525452d', 'TOS', 'TOS Name', 'SEATTLE', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-18 08:10:04', '2024-09-18 08:10:04', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('8c0c6b3f-6af6-49a4-ad37-15587b78e23c', 'lcl_and_fcl', '35', '4dc97af1-5195-419f-891f-5b5186e17131', '2', 'b44a4f9b-e7db-401d-afdc-b1cbfc1f58e1', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 08:10:04', '2024-09-18 08:10:04', '85c26f6c-a7f3-49a4-bfd2-1ef7da4c577f', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2b4df19f-dc7d-40c3-b7db-00d4d2ff7ea1', 'lcl_and_fcl', '27', '69d7ec30-3819-4ffb-b98b-11d563038dd4', '2', '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', 'TOS', 'TOS Name', 'SINGAPORE', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-18 08:10:58', '2024-09-18 08:10:58', '39305fca-5bad-452a-932a-d35eef42266d', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('1ae2a07d-f107-4d1b-80ee-6cdd9762ce16', 'air', '35', '4dc97af1-5195-419f-891f-5b5186e17131', '99', 'f561a8b5-c317-4722-881c-389ae996016d', 'TOS', 'TOS Neme', 'SEATTLE', '023b1135-3814-4c0d-8180-67aefefc14bb', 'POLAR AIR CARGO', 'Notes', '2024-09-18 08:10:58', '2024-09-18 08:10:58', '39305fca-5bad-452a-932a-d35eef42266d', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('1f977567-d488-4c7e-9baf-3f68e9201674', 'air', '6', '2aba8880-1392-438f-9418-1eef1adc2835', '3', '6e007669-5d02-44ae-8510-893f8f314191', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 08:14:24', '2024-09-18 08:14:24', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('42c1502f-393c-4550-a036-4669097f2f1e', 'air', '6', '2aba8880-1392-438f-9418-1eef1adc2835', '3', '6e007669-5d02-44ae-8510-893f8f314191', 'TOS', 'TOS Name', 'DUBAI', '5fe89109-ef47-4c63-b7ef-5f361c794fed', 'GARUDA INDONESIA', 'Notes', '2024-09-18 08:38:10', '2024-09-18 08:38:10', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('cbae7eaf-36aa-4eef-a363-2112c97a7841', 'land', '38', 'fc7dc58e-963f-49d6-a373-d688e2c76e48', '33', 'c50e384f-88d1-4ea7-a11d-820e607418b4', 'TOS', 'TOS Name', 'JAKARTA', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-18 08:38:10', '2024-09-18 08:38:10', 'd217d84a-d8e4-40dc-b411-d26d813c6c96', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('49d391f9-2ea9-4533-a341-c16acf974f48', 'lcl_and_fcl', '3', '6e007669-5d02-44ae-8510-893f8f314191', '3', '8639a1eb-1eae-4b0e-bed5-ff9c2d181d0d', 'TOS', 'TOS Name', 'SINGAPORE', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-18 08:39:51', '2024-09-18 08:39:51', '8ea0628d-9181-4e3d-a4f4-352b9b6c7ca3', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('a6c4f036-a62d-4e84-a118-63876801813a', 'lcl_and_fcl', '1', '1672bc78-9f89-4f36-9195-87a3f6a1af26', '1', '1672bc78-9f89-4f36-9195-87a3f6a1af26', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-18 10:39:18', '2024-09-18 10:39:18', '662b6729-2cf4-42a1-9dca-8b34d1a66f22', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f1439c26-3b22-46dd-bcca-bbf912391a0b', 'lcl_and_fcl', '1', '1672bc78-9f89-4f36-9195-87a3f6a1af26', '1', '1672bc78-9f89-4f36-9195-87a3f6a1af26', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-18 10:58:09', '2024-09-18 10:58:09', '662b6729-2cf4-42a1-9dca-8b34d1a66f22', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('b6094940-3df7-4959-964c-1e6a85955a44', 'lcl_and_fcl', '39', 'cd0e381d-06e1-44aa-88f8-cada88e778f4', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', 'TOS', 'TOS Name', NULL, '050eca09-d234-4e8f-a1df-03c142b20379', 'CROATIA AIRLINES', 'Notes', '2024-09-19 02:45:35', '2024-09-19 02:45:35', 'df8e1781-c445-4e9a-a06c-b5446bd6f388', 'Party', 'JAKARTA');
INSERT INTO "accounting"."service_contracts" VALUES ('be88aaa2-afc4-4641-8408-0b42e8505c4e', 'land', '38', '9441ad74-9f16-49d2-ab0e-f812bd749047', '32', '74d97706-d473-404d-8a09-a2a915047721', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-19 02:54:24', '2024-09-19 02:54:24', '4fc9fe8c-fab8-4277-ae61-32a8beedea7e', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('cdc8311a-f05a-4621-91af-8bc978eaa86f', 'lcl_and_fcl', '75', '2197ab38-d1bb-458e-aae6-bb3ef9f9d8c7', '36', '60ce009b-e6de-43ab-b425-158e0098f064', 'TOS', 'TOS Name', 'SINGAPORE', '1b08eb0c-dfb1-4478-ae84-05a1d0ae294d', 'AIR MAURITIUS', 'Notes', '2024-09-19 02:57:46', '2024-09-19 02:57:46', '00ecd526-f1ab-423e-83b3-5ae2b4288c60', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('370938e3-05fb-4a72-a0ae-5262cf28cf59', 'air', '32', '7c41669c-dc04-4da3-a2de-239e3942bc74', '69', 'b7dce098-220e-4cb8-aca4-333dd6b4412c', 'TOS', 'TOS Name', 'DUBAI', '0a6d2749-64e3-4a5b-b2e1-3ebafa9c36f1', 'RAYA AIRWAYS', 'Notes', '2024-09-19 03:02:04', '2024-09-19 03:02:04', '0305c87b-1fe9-4ed1-b1c1-c253fb081145', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2bf6b582-833c-43ce-b2e4-cd39c23fef6f', 'lcl_and_fcl', '4', 'f6bf0d3e-42b8-43fc-b5c0-15b1ec9fe1ac', '35', '4dc97af1-5195-419f-891f-5b5186e17131', 'TOS', 'TOS Name', 'SINGAPORE', '164f2127-ee3b-47c9-9d56-4b236505f395', 'RWAND AIR', 'Notes', '2024-09-19 03:04:27', '2024-09-19 03:04:27', '534ad214-8f1b-4409-a37b-d9a4fd656df7', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('3679941f-e2bc-495c-b608-46b4cb1e5f98', 'air', '37', '33394dc0-48fe-4f2d-b01c-517f023ff26e', '3', 'cec1e518-d166-4233-9243-5e3efdc5cfd1', 'TOS', 'TOS Name', 'DUBAI', '29d7ca5c-bf21-49c0-b490-4c10cc45f3ac', 'CARGOLUX AIRLINES', 'Notes', '2024-09-19 03:10:17', '2024-09-19 03:10:17', 'e52b0496-923e-4866-a259-160d0802237e', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('2d071270-b0b7-4abb-a817-fd76c1c4e008', 'air', '81', 'cf955428-f530-4a28-9c09-ffde3dc5a4ba', '102', '1201ec35-10a4-409c-b832-c3bc2ed0956a', 'TOS', 'TOS Name', NULL, '164f2127-ee3b-47c9-9d56-4b236505f395', 'RWAND AIR', 'Notes', '2024-09-19 03:10:17', '2024-09-19 03:10:17', 'e52b0496-923e-4866-a259-160d0802237e', 'Party', 'JAKARTA');
INSERT INTO "accounting"."service_contracts" VALUES ('000109b3-cda8-4e3a-b911-dbddb0ad8724', 'air', '36', '60ce009b-e6de-43ab-b425-158e0098f064', '3', 'cec1e518-d166-4233-9243-5e3efdc5cfd1', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:17:25', '2024-09-19 03:17:25', '303167d6-2472-460f-86cc-3df274cb90a7', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('ef1beee0-09aa-4d8d-957a-273bff325ad8', 'lcl_and_fcl', '38', '8f2b59be-9106-4404-8819-61d24b5d4480', '35', '4dc97af1-5195-419f-891f-5b5186e17131', 'TOS', 'TOS Name', 'DUBAI', '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-19 03:17:25', '2024-09-19 03:17:25', '303167d6-2472-460f-86cc-3df274cb90a7', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('fbfa8240-b517-4152-8bb0-7e20182a0022', 'air', '38', 'b3927629-c431-4a55-90a0-52efaa422f83', '33', 'c50e384f-88d1-4ea7-a11d-820e607418b4', 'TOS', 'TOS Name', 'LOS ANGELES', '04a7d9ac-8c62-4e73-a4cd-611bdcbc8c47', 'SHANGHAI AIRLINES', 'Notes', '2024-09-19 03:20:20', '2024-09-19 03:20:20', 'df8e1781-c445-4e9a-a06c-b5446bd6f388', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f45bb73a-6508-489a-959f-34035dde9303', 'air', '38', '7d594aef-cd35-48ad-ba82-b9c569101253', '113', '3a9928d9-a1f5-4fd2-ba7a-24933aa644c0', 'TOS', 'TOS Name', 'DUBAI', '7f2c5e7f-8596-49ec-abe9-a531d245760d', 'CHICAGO EXPRESS AIRLINES', 'Notes', '2024-09-19 03:21:41', '2024-09-19 03:21:41', '4fc9fe8c-fab8-4277-ae61-32a8beedea7e', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('0c67d8bb-cd8d-4156-8247-4448c84f7d25', 'lcl_and_fcl', '41', 'dd8988e2-aba0-4f26-bb67-38a0acb88e36', '33', 'faaabfb4-a04f-4dc7-b6a4-b227a243be52', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:24:32', '2024-09-19 03:24:32', '9d2096b0-a96c-4d56-82df-9fc040c84d61', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('4f60ebf8-3bac-45d1-af53-ebc4e4f5ca9e', 'air', '41', '48432307-d126-4176-b404-53120b299645', '33', 'faaabfb4-a04f-4dc7-b6a4-b227a243be52', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:25:18', '2024-09-19 03:25:18', '9d2096b0-a96c-4d56-82df-9fc040c84d61', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('87a35cde-0a38-4d9b-ac8c-9ebe451e8fee', 'air', '2', '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', '15', '9120c251-1234-4351-8ff5-9844a5c3f630', 'TOS', 'TOS Name', 'DUBAI', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:33:39', '2024-09-19 03:33:39', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('15ec24db-4f9e-4524-ad86-7d06f733fe69', 'air', '2', '9805c7c5-e6a0-4d09-bcf6-4d9c94c223d0', '15', '9120c251-1234-4351-8ff5-9844a5c3f630', 'TOS', 'TOS Name', 'DUBAI', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:38:02', '2024-09-19 03:38:02', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('8a481c8d-ec8d-4069-af6c-2c8302e9bad7', 'lcl_and_fcl', '35', '4dc97af1-5195-419f-891f-5b5186e17131', '51', '7627aafe-cda0-4661-9c32-4b89e7c12b44', 'TOS', 'TOS Name', 'DUBAI', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 03:38:02', '2024-09-19 03:38:02', 'cdcf6fe5-3669-484b-8517-8bc4caef7dae', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('f53f7b7e-9823-4e78-af52-2cf27e06fdc1', 'land', '33', 'b540048f-fe0e-440f-ad89-657fab22caa8', '38', '86d6ea81-3911-4574-bf2e-b6d9b0baaa2b', 'TOS', 'TOS Name', 'SINGAPORE', '6010d9bb-03d7-4c75-8ab7-c6c173250e0e', 'DHL WORLDWIDE EXPRESS', 'Notes', '2024-09-19 04:02:37', '2024-09-19 04:38:24', '428b6e36-e12a-4418-8146-82f887526fa4', 'Party', NULL);
INSERT INTO "accounting"."service_contracts" VALUES ('01e5ba2c-7a82-4b89-aee8-60edba7b97c5', 'air', '35', '4dc97af1-5195-419f-891f-5b5186e17131', '35', '4dc97af1-5195-419f-891f-5b5186e17131', 'TOS', 'TOS Name', NULL, '5c7ab7d7-4d95-4f91-a08e-5ff3cdc95b2c', 'CANBERRA', 'Notes', '2024-09-19 04:17:34', '2024-09-19 04:38:25', '428b6e36-e12a-4418-8146-82f887526fa4', 'Party', 'JAKARTA');

-- ----------------------------
-- Table structure for statement_cashflow
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."statement_cashflow";
CREATE TABLE "accounting"."statement_cashflow" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "cashflow_description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of statement_cashflow
-- ----------------------------
INSERT INTO "accounting"."statement_cashflow" VALUES ('1d5dd0b1-3f42-4514-9a05-280d6e842e51', 'Operational Activities', NULL, NULL, NULL, NULL, 1);
INSERT INTO "accounting"."statement_cashflow" VALUES ('89020c54-5076-48f2-9417-2d786b2a521b', 'Investment', NULL, NULL, NULL, NULL, 1);
INSERT INTO "accounting"."statement_cashflow" VALUES ('e186628a-d25b-45e2-bcc6-952cefdac9db', 'Financing Activities', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for statement_financial
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."statement_financial";
CREATE TABLE "accounting"."statement_financial" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "financial_description" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of statement_financial
-- ----------------------------
INSERT INTO "accounting"."statement_financial" VALUES ('d6b5b0e1-f8cb-46de-b358-4f3338f8d85a', 'Balance Sheet', NULL, NULL, NULL, NULL, 1);
INSERT INTO "accounting"."statement_financial" VALUES ('09bc1d9e-0f25-45f5-b6bb-7bdaa78daf8d', 'Profit and Loss Statement', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for transaction_recurring
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."transaction_recurring";
CREATE TABLE "accounting"."transaction_recurring" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "recurring_code" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of transaction_recurring
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_recurring_detail
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."transaction_recurring_detail";
CREATE TABLE "accounting"."transaction_recurring_detail" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "transaction_recurring_id" uuid NOT NULL,
  "account_id" uuid NOT NULL,
  "percentage" numeric(8,2),
  "position" varchar(6) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of transaction_recurring_detail
-- ----------------------------

-- ----------------------------
-- Table structure for vendor_rates
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."vendor_rates";
CREATE TABLE "accounting"."vendor_rates" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "charge_id" uuid NOT NULL,
  "vendor_id" uuid,
  "per_kilo" int8 NOT NULL,
  "price_per_kilo" numeric(12,0) NOT NULL,
  "currency" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "valid_date" date NOT NULL,
  "type" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of vendor_rates
-- ----------------------------

-- ----------------------------
-- Table structure for vendors
-- ----------------------------
DROP TABLE IF EXISTS "accounting"."vendors";
CREATE TABLE "accounting"."vendors" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "vendor_type_id" uuid,
  "country_id" uuid,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "contact_person" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(255) COLLATE "pg_catalog"."default",
  "telp_number" varchar(255) COLLATE "pg_catalog"."default",
  "created_by" uuid,
  "modified_by" uuid,
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "status" int4
)
;

-- ----------------------------
-- Records of vendors
-- ----------------------------

-- ----------------------------
-- Function structure for generate_invoices_number
-- ----------------------------
DROP FUNCTION IF EXISTS "accounting"."generate_invoices_number"();
CREATE OR REPLACE FUNCTION "accounting"."generate_invoices_number"()
  RETURNS "pg_catalog"."text" AS $BODY$
	-- Routine body goes here...

	DECLARE hasil INT ; 
	DECLARE tahun varchar(2);
	DECLARE bulan varchar(2);
	
	BEGIN
	
	    SELECT TO_CHAR(CURRENT_DATE, 'YY') INTO tahun;
		  SELECT TO_CHAR(CURRENT_DATE, 'MM') INTO  bulan;
	
      SELECT CAST(MAX(RIGHT(invoices_number,3)) AS INT2) INTO hasil  from invoices WHERE LEFT(invoices_number,4) = concat(tahun,bulan);
			 	RETURN concat(tahun,bulan,'-',lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
   
	
				 


	
	
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for generate_kode_akun
-- ----------------------------
DROP FUNCTION IF EXISTS "accounting"."generate_kode_akun"("jenis" varchar);
CREATE OR REPLACE FUNCTION "accounting"."generate_kode_akun"("jenis" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
	-- Routine body goes here...

	DECLARE hasil INT ; 
	DECLARE tahun varchar(2);
	DECLARE bulan varchar(2);
	
	BEGIN
	
		IF LENGTH(jenis)=5 THEN
       SELECT CAST(MAX(RIGHT(kode_akun,3)) AS INT2)  INTO hasil from akun_template WHERE LEFT(header_kode_akun,5) = concat(jenis);
			 	RETURN concat(jenis,'.',lpad((coalesce(hasil,0) + 1)::varchar,3,'0'));
    ELSE
       SELECT CAST(MAX(RIGHT(kode_akun,2)) AS INT2)  INTO hasil from akun_template WHERE LEFT(kode_akun,3) = concat(jenis,'.');
			 	RETURN concat(jenis,'.',lpad((coalesce(hasil,0) + 1)::varchar,2,'0'));
    END IF;
	
				 


	
	
END; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."account_account_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."account_group_group_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."account_type_group_type_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."accounts_account_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."audits_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."cashflow_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."financial_statement_fs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."jurnal_detail_jurnal_detail_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."migrations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."personal_access_tokens_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."role_rbac_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."role_role_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."statement_cashflow_cf_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."statement_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"accounting"."transaksi_kode_recuring_detail_detail_transaksi_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table account
-- ----------------------------
ALTER TABLE "accounting"."account" ADD CONSTRAINT "account_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account_types
-- ----------------------------
ALTER TABLE "accounting"."account_types" ADD CONSTRAINT "account_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table carriers
-- ----------------------------
ALTER TABLE "accounting"."carriers" ADD CONSTRAINT "carriers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table charges
-- ----------------------------
ALTER TABLE "accounting"."charges" ADD CONSTRAINT "charges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table contract_agent_charges
-- ----------------------------
ALTER TABLE "accounting"."contract_agent_charges" ADD CONSTRAINT "contract_agent_charges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table contract_agent_documents
-- ----------------------------
ALTER TABLE "accounting"."contract_agent_documents" ADD CONSTRAINT "contract_agent_documents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table contract_agents
-- ----------------------------
ALTER TABLE "accounting"."contract_agents" ADD CONSTRAINT "accounting_contract_agents_contract_code_unique" UNIQUE ("contract_code");

-- ----------------------------
-- Checks structure for table contract_agents
-- ----------------------------
ALTER TABLE "accounting"."contract_agents" ADD CONSTRAINT "contract_agents_vendor_type_check" CHECK (vendor_type::text = ANY (ARRAY['shippingline'::character varying::text, 'origin'::character varying::text, 'localvendor'::character varying::text, 'carrier'::character varying::text]));

-- ----------------------------
-- Primary Key structure for table contract_agents
-- ----------------------------
ALTER TABLE "accounting"."contract_agents" ADD CONSTRAINT "contract_agents_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cost
-- ----------------------------
ALTER TABLE "accounting"."cost" ADD CONSTRAINT "cost_pkey" PRIMARY KEY ("cost_id");

-- ----------------------------
-- Primary Key structure for table cost_details
-- ----------------------------
ALTER TABLE "accounting"."cost_details" ADD CONSTRAINT "cost_details_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table costs
-- ----------------------------
CREATE INDEX "accounting_costs_job_order_id_index" ON "accounting"."costs" USING btree (
  "job_order_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table costs
-- ----------------------------
ALTER TABLE "accounting"."costs" ADD CONSTRAINT "costs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table countries
-- ----------------------------
ALTER TABLE "accounting"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "accounting"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

-- ----------------------------
-- Primary Key structure for table customer_groups
-- ----------------------------
ALTER TABLE "accounting"."customer_groups" ADD CONSTRAINT "customer_groups_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customer_types
-- ----------------------------
ALTER TABLE "accounting"."customer_types" ADD CONSTRAINT "customer_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table customers
-- ----------------------------
ALTER TABLE "accounting"."customers" ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table group_charges
-- ----------------------------
ALTER TABLE "accounting"."group_charges" ADD CONSTRAINT "group_charges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table invoices
-- ----------------------------
ALTER TABLE "accounting"."invoices" ADD CONSTRAINT "invoices_pkey" PRIMARY KEY ("invoices_id");

-- ----------------------------
-- Primary Key structure for table journal
-- ----------------------------
ALTER TABLE "accounting"."journal" ADD CONSTRAINT "journal_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table journal_details
-- ----------------------------
ALTER TABLE "accounting"."journal_details" ADD CONSTRAINT "journal_details_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table journal_has_file_storages
-- ----------------------------
CREATE INDEX "journal_storage_idx" ON "accounting"."journal_has_file_storages" USING btree (
  "journal_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "file_storage_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table journal_has_file_storages
-- ----------------------------
ALTER TABLE "accounting"."journal_has_file_storages" ADD CONSTRAINT "journal_has_file_storages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table offices
-- ----------------------------
ALTER TABLE "accounting"."offices" ADD CONSTRAINT "offices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table regions
-- ----------------------------
ALTER TABLE "accounting"."regions" ADD CONSTRAINT "regions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sales_offices
-- ----------------------------
ALTER TABLE "accounting"."sales_offices" ADD CONSTRAINT "sales_offices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table service_contracts
-- ----------------------------
ALTER TABLE "accounting"."service_contracts" ADD CONSTRAINT "service_contracts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table statement_cashflow
-- ----------------------------
ALTER TABLE "accounting"."statement_cashflow" ADD CONSTRAINT "statement_cashflow_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table statement_financial
-- ----------------------------
ALTER TABLE "accounting"."statement_financial" ADD CONSTRAINT "statement_financial_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table transaction_recurring
-- ----------------------------
ALTER TABLE "accounting"."transaction_recurring" ADD CONSTRAINT "transaction_recurring_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table transaction_recurring_detail
-- ----------------------------
ALTER TABLE "accounting"."transaction_recurring_detail" ADD CONSTRAINT "transaction_recurring_detail_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table vendor_rates
-- ----------------------------
CREATE INDEX "accounting_vendor_rates_vendor_id_index" ON "accounting"."vendor_rates" USING btree (
  "vendor_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table vendor_rates
-- ----------------------------
ALTER TABLE "accounting"."vendor_rates" ADD CONSTRAINT "vendor_rates_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vendors
-- ----------------------------
ALTER TABLE "accounting"."vendors" ADD CONSTRAINT "vendors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table charges
-- ----------------------------
ALTER TABLE "accounting"."charges" ADD CONSTRAINT "accounting_charges_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."charges" ADD CONSTRAINT "accounting_charges_group_charge_id_foreign" FOREIGN KEY ("group_charge_id") REFERENCES "accounting"."group_charges" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."charges" ADD CONSTRAINT "accounting_charges_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table journal_details
-- ----------------------------
ALTER TABLE "accounting"."journal_details" ADD CONSTRAINT "accounting_journal_details_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."journal_details" ADD CONSTRAINT "accounting_journal_details_journal_id_foreign" FOREIGN KEY ("journal_id") REFERENCES "accounting"."journal" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."journal_details" ADD CONSTRAINT "accounting_journal_details_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table journal_has_file_storages
-- ----------------------------
ALTER TABLE "accounting"."journal_has_file_storages" ADD CONSTRAINT "accounting_journal_has_file_storages_file_storage_id_foreign" FOREIGN KEY ("file_storage_id") REFERENCES "public"."file_storages" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "accounting"."journal_has_file_storages" ADD CONSTRAINT "accounting_journal_has_file_storages_journal_id_foreign" FOREIGN KEY ("journal_id") REFERENCES "accounting"."journal" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table offices
-- ----------------------------
ALTER TABLE "accounting"."offices" ADD CONSTRAINT "accounting_offices_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "accounting"."countries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."offices" ADD CONSTRAINT "accounting_offices_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."offices" ADD CONSTRAINT "accounting_offices_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table regions
-- ----------------------------
ALTER TABLE "accounting"."regions" ADD CONSTRAINT "accounting_regions_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."regions" ADD CONSTRAINT "accounting_regions_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sales_offices
-- ----------------------------
ALTER TABLE "accounting"."sales_offices" ADD CONSTRAINT "accounting_sales_offices_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."sales_offices" ADD CONSTRAINT "accounting_sales_offices_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table service_contracts
-- ----------------------------
ALTER TABLE "accounting"."service_contracts" ADD CONSTRAINT "accounting_service_contracts_carrier_id_foreign" FOREIGN KEY ("carrier_id") REFERENCES "master"."carrier" ("carrier_id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "accounting"."service_contracts" ADD CONSTRAINT "accounting_service_contracts_contract_agent_id_foreign" FOREIGN KEY ("contract_agent_id") REFERENCES "accounting"."contract_agents" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table statement_cashflow
-- ----------------------------
ALTER TABLE "accounting"."statement_cashflow" ADD CONSTRAINT "accounting_statement_cashflow_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."statement_cashflow" ADD CONSTRAINT "accounting_statement_cashflow_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table statement_financial
-- ----------------------------
ALTER TABLE "accounting"."statement_financial" ADD CONSTRAINT "accounting_statement_financial_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."statement_financial" ADD CONSTRAINT "accounting_statement_financial_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table transaction_recurring
-- ----------------------------
ALTER TABLE "accounting"."transaction_recurring" ADD CONSTRAINT "accounting_transaction_recurring_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."transaction_recurring" ADD CONSTRAINT "accounting_transaction_recurring_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table transaction_recurring_detail
-- ----------------------------
ALTER TABLE "accounting"."transaction_recurring_detail" ADD CONSTRAINT "accounting_transaction_recurring_detail_account_id_foreign" FOREIGN KEY ("account_id") REFERENCES "accounting"."account" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."transaction_recurring_detail" ADD CONSTRAINT "accounting_transaction_recurring_detail_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."transaction_recurring_detail" ADD CONSTRAINT "accounting_transaction_recurring_detail_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."transaction_recurring_detail" ADD CONSTRAINT "accounting_transaction_recurring_detail_transaction_recurring_i" FOREIGN KEY ("transaction_recurring_id") REFERENCES "accounting"."transaction_recurring" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table vendor_rates
-- ----------------------------
ALTER TABLE "accounting"."vendor_rates" ADD CONSTRAINT "accounting_vendor_rates_charge_id_foreign" FOREIGN KEY ("charge_id") REFERENCES "accounting"."charges" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."vendor_rates" ADD CONSTRAINT "accounting_vendor_rates_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."vendor_rates" ADD CONSTRAINT "accounting_vendor_rates_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table vendors
-- ----------------------------
ALTER TABLE "accounting"."vendors" ADD CONSTRAINT "accounting_vendors_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "accounting"."countries" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."vendors" ADD CONSTRAINT "accounting_vendors_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."vendors" ADD CONSTRAINT "accounting_vendors_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "accounting"."vendors" ADD CONSTRAINT "accounting_vendors_vendor_type_id_foreign" FOREIGN KEY ("vendor_type_id") REFERENCES "accounting"."customer_types" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
