/*
 Navicat Premium Data Transfer

 Source Server         : Rembon Development Connection
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : user

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/09/2024 11:29:55
*/


-- ----------------------------
-- Sequence structure for password_reset_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "user"."password_reset_id_seq";
CREATE SEQUENCE "user"."password_reset_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "user"."role_role_id_seq";
CREATE SEQUENCE "user"."role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS "user"."account";
CREATE TABLE "user"."account" (
  "user_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "role_id" int8 NOT NULL,
  "date_created" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL DEFAULT 1,
  "token" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "user"."account"."status" IS '1. active 2. inactive 3. deleted';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO "user"."account" VALUES ('00d7548a-36c1-4adf-8bbb-893f4d149e62', 'srilanka@pamcargo.com', '$2y$10$VS93bGLLY8KNwqS3NvK77.7YBwCTYWNudKgjbibnfiX/pmxBxWKNa', 16, '2023-03-08 07:45:23', 'admin@gmail.com', '2023-08-31 11:26:11', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('0328dacc-8e27-4728-9563-3bfe21c8f38b', 'bigbos@pamcargo.com', '$2y$10$t5qlK4qk2WBrF03GG3Sw0.iZmzffhUScP1TCFVnXsUrVFpb86siHK', 25, '2023-07-30 06:57:15', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('043e8c73-1d21-4f81-935d-17fbe910019d', 'Theavoan@pamcargo.com', '$2y$10$CWQ.Gglb3JoQiHSSeEe3lO8c2gwPn3LZiicmW8axPvWkpbIA8Vow.', 19, '2023-03-23 07:36:48', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('0509b3a9-a9de-443a-978d-8e3cfaf85580', 'hongkong@pamcargo.com', '$2y$10$ID6I96eDe2626cRwYLp/1.8aAD3Sh5xOebEyrOnnz3i.HRVQ7iAZG', 16, '2023-03-08 07:52:43', 'admin@gmail.com', '2023-11-21 05:03:38', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('06a99af0-0281-4c21-971d-106410a2479f', 'thailand@pamcargo.com', '$2y$10$EyFdk9GhSR33i0/meLzy8OUSVPZMWlxHvrEkUSeALP41AhhVYwxbO', 21, '2023-03-08 07:42:46', 'admin@gmail.com', '2023-08-31 11:26:41', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('1004188e-a03e-4169-ae0c-a26d1cd873b8', 'alisa.krauss@xllog.com', '$2y$10$FgqqVByb5RcJB.YGFAD7mONeIv26AQ.UKMiKfPsOH4fXvM4/vDVoa', 19, '2023-11-13 04:47:36', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('13af69a1-a7c6-4d86-952c-50fd44f9c131', 'italy@pamcargo.com', '$2y$10$/zcLGuOWTadtqoFv/o1lHukcZMWU1/gu5tWeqIVhr2jWB7Hlr8LZm', 19, '2023-03-08 07:26:09', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('1b6b4919-89b2-44f6-a2fb-31927d84a3ce', 'amsaluagen@pamcargo.com', '$2y$10$eqvzSDCQoFH6ja7Qak6nzeyQAjl2Jw7Sqj.dESk1FPW64xiSKKerS', 19, '2023-03-23 05:58:16', 'admin@gmail.com', '2023-03-23 06:00:15', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('1c29428d-bc20-4013-b152-acf163ca1e80', 'yihun@pamcargo.com', '$2y$10$jFsfIWuB6f8T5Anh.u7N..MZIuMe.OlDaD6qklMcta1quqnfg/HBK', 16, '2023-03-08 05:04:09', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('20633d92-3e4b-4c47-b192-cdb43b1333da', 'shjun@pamcargo.com', '$2y$10$h4y8zQolISEhckI3hRvQVugLBuEE74MRUWMgK.P1yPDUl0EMYQH82', 16, '2023-03-08 04:53:45', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('21678e61-ec13-4183-bfa8-da768a0a330a', 'fijuffer@pamcargo.com', '$2y$10$DwUmezx9zDC6NkesLhC3MO9SAeDeW3O38vGso67bcAgmngjTdKwT2', 17, '2023-05-11 02:32:22', 'admin@gmail.com', '2023-11-22 06:41:37', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('2487613b-737b-42e5-a4bf-2bc742bcff59', 'lucia.nguyen@pamvn.com', '$2y$10$GOlCtXgzdCGwy5ry5ZQVtu8ZxX8WccIl25DyOdwdZ.sUfZkYtnzcq', 16, '2023-03-08 05:14:27', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('2867e644-e476-4072-a2d0-4aa3b690c832', 'admin@rembon.com', '$2y$10$a.WWm2N4dXXxwPj6IYDa4uOwMcrQ7en44hAsoOjGWEj07sYaKPrDO', 14, '2023-02-01 07:31:33', NULL, NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('29a1f4bc-0615-4744-befe-84b40f461df8', 'superadmin@gmail.com', '$2y$10$TY.SZQxVI2m7xlUnIOdOH.f4b5X4Q6CK4ee2FRTKqq2SFeqnDw7sS', 14, '2023-03-01 05:03:12', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('2da343cc-49b4-430e-9df5-fc87443902ea', 'switzerland@pamcargo.com', '$2y$10$H/69mz7P4AKuXH/JH5IlReNVk9HLzpMPn2FsTAxD6bWdDW4tgKZ6G', 19, '2023-03-08 07:24:45', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('3214dd6c-86d7-457d-b3c8-9f010f3fa714', 'Martin@pamcargo.com', '$2y$10$BGp3HsOmpmS/fuomwLvYgOK31Vgo72mMm3mCEHNJui8uTsRlFAZnS', 19, '2023-03-23 06:52:51', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('32b67f82-b2d7-4bbe-bbcd-1539cdd3087a', 'marcs@pamcargo.com', '$2y$10$Vj2FWH3Ct7lddPn4UpCq/e44d3aDevolLLPNL02WNgWNrpm7KWFiC', 19, '2023-03-08 05:23:26', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('330c8ce3-cb89-41c0-b757-c59f9288ea24', 'dennis.nguyen@pamcargo.com', '$2y$10$UO4o271fDBjcJk963YOxR.3ESv.8r/dR/TFnfIOOpCkyA5p./hW.u', 19, '2023-03-23 06:57:36', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('3394fb75-b8a2-4a71-bd35-ad1e04212366', 'Lasitha.abanchy@pamcargo.com', '$2y$10$UUjSdJZjEMr/wwGJ60RyS.eiHPa5z5oT3HLPwMEY2qhkRCe3ofdoO', 19, '2023-03-23 07:14:18', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('384d16e3-7f5d-4dbc-88f4-076e8f57b8a8', 'Neon@pamcargo.com', '$2y$10$/E775FbGLjDnWUEIG2V0ourCJqwFR/MOP1ARuKZZa9ueMtmU1J/sO', 19, '2023-03-07 07:53:26', 'admin@gmail.com', '2023-03-08 05:09:48', NULL, 3, NULL);
INSERT INTO "user"."account" VALUES ('3cebf429-7299-483b-9fbc-e51662fcc3eb', 'austria@pamcargo.com', '$2y$10$DWQS5kT/eSgVnAwWY9Qwje/NwxRtprUwx03yt2rF2GbISjcL2q/ny', 19, '2023-03-08 07:30:04', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('3dcd86ce-21c3-4db9-9954-d933401b6aec', 'Danang@pamcargo.com', '$2y$10$w1ZWNo6KXBHtJ3EQP88kReQrjx30YsdXrtiJFep/s1fpgkwJ5v89y', 19, '2023-03-23 07:09:14', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('426866ab-bd28-401c-85c9-90897b6178f6', 'indonesia@pamcargo.com', '$2y$10$WOye2JRf/Hh6xo7VZ/3Qy.M1nbAYzbzhANmDivz21E4RqICuoHlwu', 16, '2023-03-08 07:48:36', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('46cd810c-865b-44f1-96c5-2e5d2b440f13', 'marc.dxb@pamcargo.com', '$2y$10$zSZgUtuSfLxV4s44zDdNcurfd/z3yJz63JYLzxG8YpYTDZ5I.X3hG', 17, '2023-09-18 07:20:56', 'admin@rembon.com', '2023-09-18 07:25:55', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('48064fdc-a4c8-418d-857d-83cfe1f3f923', 'bossuniq@pamcargo.com', '$2y$10$8iyo2nStWlu55UaA6mbXOeX4dQMtmhhdEVkYXLM2Wl3z.OqG98/t2', 25, '2023-09-11 07:10:54', 'admin@rembon.com', '2023-09-20 08:40:25', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('4c3c87eb-9dcf-4b8f-b2d0-ce53110d129d', 'france@pamcargo.com', '$2y$10$3KKs5ZdJpRz34Wq4SJlJvO2eiOBPPxUJFWMGaEk6Bnfh5RJ1DtQRG', 21, '2023-03-08 07:28:55', 'admin@gmail.com', '2023-03-09 02:53:47', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('4ec50eb9-151b-4f0c-9787-50a0004b5ce2', 'admin.pam@logichain.com', '$2y$10$ADvswzaWISnYb.3sHNLx7.cs2Vlst.HLvH2UZqZtL3J9yCBCezz3S', 14, '2023-05-17 04:18:20', 'admin@gmail.com', '2023-05-17 04:19:28', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('555bb33c-da00-44e1-8d1d-77a27cfb4f19', 'gac.jerman@pamcargo.com', '$2y$10$zoAmyfh/nKJB6ZWDzmuh0eT9AEtyqUa9usRsa7fvSf3uNa2i2ueaW', 19, '2023-03-27 04:16:01', 'admin@gmail.com', '2023-04-14 04:05:03', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('5806805c-a47e-4e1e-8a6e-877cc8c8adbd', 'marc.jkt@pamcargo.com', '$2y$10$mqIzPtIkdzzFtwMpS/jl3uiG4VJwhTxJl/nPnGNns99nEy/qXsO42', 16, '2023-09-18 07:18:40', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('5921aa92-737a-4f27-93d8-a99c56c52e40', 'rieth@pamcargo.com', '$2y$10$HIBwVSp2m8lrb4AJGsSNgenwN.7jN6zRWA4tChK2oQb/U0VGg2O9u', 19, '2023-03-23 06:11:34', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('59d6e308-9054-4707-a2b9-4fcc12e0eb73', 'zakir@pamcargo.com', '$2y$10$j/tWCZUREspMC/xOdshtgO9QFsT.dml1JuVyDMXTZfnGONfGTA8gC', 17, '2023-05-11 02:33:02', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('5ba06b57-79d8-4762-bd09-6089d4e55d17', 'chennai@pamcargo.com', '$2y$10$3J3AlbGKi5A5XCZ55mF90e8tCJqxTW5igVfikUIFo.qMGGQYAq0YK', 16, '2023-03-08 07:51:11', 'admin@gmail.com', '2023-08-31 11:25:05', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('5fd99bbc-96a4-4c0c-963e-1495ac06ec1e', 'Mas.soen@pamcargo.com', '$2y$10$27zxnr8Bue/sdr8wZyv.Vus8YpenICQJB.8Sj0FJBCuQP609haUiG', 19, '2023-03-23 07:27:23', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('601ebb71-e1dc-4c86-8459-ff9d42cfc8c0', 'Yihung.chen@pamcargo.com', '$2y$10$oijk3Mq.9vtNQyXEHcQAnues8kPjS5k6BTAaLQdu555c6g.mK.PtG', 19, '2023-03-23 07:12:21', 'admin@gmail.com', '2023-04-14 07:25:29', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('601f3adc-fbbe-4b0b-91dc-f757e3392565', 'pinpinat@pamcargo.com', '$2y$10$LtOzW/jqwSmMyZCiLbe60OlFtZ3NQu3q720svQeDR2D/.vJ2zrPJm', 16, '2023-03-08 05:05:20', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('615aa921-16a1-4ee0-88f4-a4e34258ce2e', 'wing@pamcargo.com', '$2y$10$nsQ2A9oTxwSAeIY10LcIHuYMow9ZskqYepl2My9RmwyL2IJ0OjCo.', 19, '2023-03-23 07:32:41', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('61ffc4aa-24d2-46a2-84b6-c88b650fecf1', 'raju@pamcargo.com', '$2y$10$zfMHoQ1JAXCtRXJB1UHXz.tBXJ0a7JTHEYHRmezSONxkadAByFqzK', 17, '2023-05-11 02:28:25', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('63d4fea2-b6b6-4ad0-91e5-dfc7b8d63ae0', 'mumbai@pamcargo.com', '$2y$10$24xjtzyXNuvZmpuie2MSiONjcQFuVYNHwrBLk7rOY/SA33lSeIxES', 16, '2023-03-08 07:50:00', 'admin@gmail.com', '2023-08-31 11:25:20', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('65153dc2-d9a1-4d90-a9e8-99ac5ae58c98', 'jakarta@pamcargo.com', '$2y$10$MHrFY6TmkTqCw1H.R.W.YuQmRUkWnTQmvS1LTnTrUwtdzwsatOL3q', 16, '2023-02-02 08:05:22', NULL, '2023-03-20 06:52:38', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('2699b09d-37ab-41d5-a82f-64e17b38a06c', 'vivek@pamcargo.com', '$2y$10$Ov0JN68W/sNp4xGfUr7Myeu5eoDCoiQZ1c9a.eNXh25jbUv0bK.U.', 14, '2023-02-09 03:18:55', NULL, NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('51a9c59c-6f88-4153-912c-a672d5741875', 'operations@pamcargo.com', '$2y$10$wS/J3AcyIRfo9844djebF.Y.RBERM.e2ClX8wVDHz54NiyCyes6xy', 17, '2023-11-23 11:09:33', 'vivek@pamcargo.com', '2024-05-08 08:12:15', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('5fb0b1ba-c3b9-416d-94b1-1d0ca40c2456', 'marc@pamcargo.com', '$2y$10$K1e9bC7576dz/g3WXMaCCuliwWS7DI/q94Q8ScMKoRl4OQj.a9Lsy', 19, '2023-03-23 06:48:51', 'admin@gmail.com', '2023-04-14 04:15:56', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('6404a947-fdba-448f-b613-99652dc1100c', 'razick@pamcargo.com', '$2y$10$eRJ8nwpYr.IJXSXr6fJ1sOk0vpIbnpVditR6qCwu/9LAZW13jsYjG', 17, '2023-05-11 02:29:00', 'admin@gmail.com', '2024-04-19 10:52:07', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('6c862b65-b11f-494e-9151-25e86740cb7b', 'korea@pamcargo.com', '$2y$10$getnzMA3KvyorWI0aZr.eui0ZvTizVvU6uC9YfEZSJkUAeijYmYm6', 16, '2023-03-08 07:46:42', 'admin@gmail.com', '2023-08-31 11:25:41', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('72d06924-98ff-40c3-81f7-51042b05fcb3', 'canadapam@logichain.com', '$2y$10$wOkT6OVypPcic213HqlR/u5tI9iynzuipkN.iyghqkPuTFcp2MjYS', 16, '2023-05-15 05:25:56', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('73274e6b-fa30-4f0b-8e7b-4e832d2b9a7f', 'jerry@gmail.com', '$2y$10$avsQoszu6ex7NAqf1oIU0Ovq56F16O7Uvxaq.gV6Zxp//lpwh0mWu', 19, '2023-03-21 09:16:28', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('73d97454-c54d-4529-9e67-6aca28f2b065', 'hongkong5@pamcargo.com', '$2y$10$vy1c8MT68x1zH9I0h68i6u5My7sZi5QBz6suyFkAX2CLjdmoJqWMC', 16, '2023-11-22 06:51:02', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('75566787-2bec-4b15-92ce-453224cab6ad', 'stefano@pamcargo.com', '$2y$10$zZmbuBKRQS/3TN5Imn5X.OVDM3glO0CoWSFqkgpj6d2xTFQgAjJtS', 16, '2023-03-08 05:24:24', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('76687c67-4b04-4b21-92cb-a3ac672fa631', 'Sathish.kumar@pamcargo.com', '$2y$10$VMdnLbOq7YkEodlLivksv.HKpW6sFJSPeGjduqxa1qBQtuRQA7ywW', 19, '2023-03-23 07:30:44', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('76c33171-9f13-4372-8dab-17ae93c8e6ed', 'soen@pamcargo.com', '$2y$10$IghycuHYAUHraCweKgCU..yOYe/UvrK3cZZ2wgboq5DpU/U61NYri', 16, '2023-03-08 04:51:31', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('7b199203-d932-4c5b-aeda-8600e455ebe7', 'deepak@pamcargo.com', '$2y$10$XZK8uD1kJYSKaWtDXPz8KuQhq7CzBmAqLGTGWk6QCFcRjEHaspRBS', 17, '2023-05-11 02:31:21', 'admin@gmail.com', '2023-09-11 08:59:27', 'admin.pam@logichain.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('7b3cafbb-6f20-4292-af7e-0af13f471b37', 'kayumaskh@pamcargo.com', '$2y$10$NPHgKGTxm9MdvZ.udQlOcukGeAbziRRoHeQDxPV/RaHNSUt07pWIe', 16, '2023-03-08 04:50:16', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('7fce0747-14f7-4943-8ddb-39a78a451c3a', 'dennis.nguyen@pamvn.com', '$2y$10$t.VF8ICFaOaEgcDEso9Qa.qfYH.L/os03F.qV8XDzn195x4k9WfwS', 16, '2023-03-08 05:18:43', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('8101a3c6-b1a9-4f47-a024-8c9acc5d9d08', 'china@pamcargo.com', '$2y$10$miHDOkkPlJ3pvOxrFNU6guAVoLrlRBlpXzZOHQfnzROkTKVBDEgLO', 16, '2023-03-08 07:54:00', 'admin@gmail.com', '2023-08-31 11:24:26', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('82455141-70c9-4111-91e0-4619c291dee0', 'shanghai1@pamcargo.com', '$2y$10$dvsgz6.iw/Ww63l16UNuFea3Wv3TdNBEyhjGN3S4Rhrmp8zZxQBXq', 16, '2023-07-21 06:18:02', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('848a2af2-df9e-4602-88e8-7c8990ccde97', 'joniky@gmail.com', '$2y$10$tSrgq126xfmAJNmuj/SovuXa/VOLFSO2JjxkZNm8ysW0xPmfOF.8q', 20, '2023-02-08 05:25:57', NULL, NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('872e2053-becc-4d5a-99c2-b85e09761b48', 'shankwan@pamcargo.com', '$2y$10$gpWFqaKzfSMZhuOFakELDei2QAkhNWfjRq6.hjch/7.AMPMS9N3uG', 16, '2023-03-08 04:46:57', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('87ef04be-1996-40a3-837e-26375d367e00', 'Petteno@pamcargo.com', '$2y$10$aL3WGQd0YzQvCdKeRaObCuyFIN1pTledTX5Y3Jf8Ys30Lq3e0AYV2', 19, '2023-03-23 06:38:56', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('88cf4352-30c6-4434-b9d4-b58cb9b384fd', 'victor@pamcargo.com', '$2y$10$IJDXnWJY8Rm0oERFTm5oHeBm2LbWfrFmbDfCof54xMVSkHI0b5VUO', 16, '2023-03-08 04:44:14', 'admin@gmail.com', '2023-03-08 04:45:03', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('8979dfe4-b8ee-45ed-9fd6-b8ada1686a06', 'sarah@pamcargo.com', '$2y$10$3AczHoGAAu1dZI4EauoMk./jKHoT72L9HMwqrKMv8QWeouHdpWspu', 17, '2023-11-20 09:07:35', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('8a821d02-2e79-4587-b447-87ccd2e28dd8', 'Victor.chang@pamcargo.com', '$2y$10$1U8cAWWoH9i5G.k5ia.BruuQmE5UTpDC6m7d5QCU0ntNmN8QWcZlm', 19, '2023-03-23 07:35:04', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('8f22bb91-a5c1-4616-88d4-523c8805c891', 'theavoan@pamcargo.com', '$2y$10$TfHd3Cl2K6T4y.OELdmU2eOuHgkfTb5gnSSKjtCqTiqef8NQYwMEq', 17, '2023-03-08 04:43:19', 'admin@gmail.com', '2023-03-09 03:00:03', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('928baee0-555c-482d-9eaf-bd92b4154bcc', 'devacc@pamcargo.com', '$2y$10$sGyhPsvmm2dEZPEjUYIEreKLXyHbwm/FYwKztd4bL4nDitS2nL0F2', 16, '2023-06-21 09:33:30', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('9d3981cf-facc-456a-b765-743a3afef2a8', 'satishkr@cargomarketingintl.com', '$2y$10$M5umrJr3KXaVJAxqzsiFNOGLFsnYPj9x32ESxRShnunyMn.0hB.1y', 16, '2023-03-08 04:48:41', 'admin@gmail.com', '2023-03-08 04:48:59', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('9f15e93f-c48f-4264-b0f0-c5dcac81c54d', 'miaitalia@pamcargo.com', '$2y$10$rkuTMr.OBj7wav4/0XsR9uh8LVduY3JOatKC2/n9Ixm1BzfGLWWGm', 19, '2023-03-27 07:09:55', 'admin@gmail.com', '2023-03-29 08:54:51', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('a140dca7-e4e8-45c3-b75b-7d3494aa1eb0', 'amsalu@pamcargo.com', '$2y$10$6kO0MricVsU94DfQAkGXIu6EKltxaHlMGx3TruGk/LLDvJdzk9XqG', 16, '2023-03-08 05:26:25', 'admin@gmail.com', '2023-03-08 06:32:29', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('a810b304-fff3-4522-9e4e-7c6e3582797f', 'hongkong2@pamcargo.com', '$2y$10$e4QAIicwU9LGEHiretWkCe/Xi0pqTVly4B/J265W8lQEJf/9HpuPq', 16, '2023-09-20 08:29:45', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('ac481803-c00b-4c6f-98fb-8593a1d497d4', 'agnelo@pamcargo.com', '$2y$10$s4xECYj/A05Z.kQptWSSFeJaSWxYTM6cfZcOiGEextaEEnJ0RjIIK', 17, '2023-05-11 02:31:51', 'admin@gmail.com', '2023-10-05 07:47:51', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('ac76f0c2-5ae0-4593-96d1-b124700c682a', 'bangladesh@pamcargo.com', '$2y$10$Lb28/bE.9TwkQmo4s2N3JOudlv.3L92RyAd7rZIiEC8opG9Oz/DUm', 16, '2023-02-03 03:09:21', NULL, '2023-09-11 12:02:34', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('afd5d4bc-d5f1-4189-8c32-fab23b5c8ed3', 'jose@pamcargo.com', '$2y$10$yeslY5Yo2WIF/tJLdHdVvumcUGxIumHnz4Hm37vdeMrFQ331TvX9.', 16, '2023-05-19 03:52:35', 'admin@rembon.com', '2023-11-09 06:10:50', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('b3c10adf-4893-46fe-a0f8-5d21fa5a0aad', 'Kenny@pamcargo.com', '$2y$10$9l2cxr7k7c8rIEOTteUMW.ABIIsO1rTExan4E3nl7TtOlvRng33qa', 19, '2023-03-23 07:02:30', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('b8e68eac-141f-4728-97d9-a10f2d7043e4', 'chandran@pamcargo.com', '$2y$10$mRa.OBmifeWnWF9IFpbRZugdgWXoR41uBoY1252y13GXAgvwmwmn2', 18, '2023-09-11 06:50:19', 'admin@rembon.com', '2023-09-11 09:40:10', 'admin.pam@logichain.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('c77dbc92-edd1-49d6-8b44-6507ab68a968', 'Lina@pamcargo.com', '$2y$10$XXackfkhiSOmnt1j0dyR6uhBnC7Ll5h9cqW2acaL0gYoKNROmS0lC', 19, '2023-03-23 07:17:00', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('c88024b5-4879-4b52-819e-554b600eb0e2', 'kangmaman@gmail.com', '$2y$10$yBycPsGrYoaalgaORoNB1.cl6b6Kv3gg2amLRumKa0l5OR/RILvnu', 19, '2023-02-14 06:41:58', NULL, NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('c9eb1226-b14f-4b0a-82cc-72377de596ad', 'kenny@pamcargo.com', '$2y$10$YeXms3P62Ue3rpy9i0YtZOyHPwNQLtFB9YHZGFMA3IScgDWqFMOYi', 16, '2023-03-08 05:17:46', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('6c878228-cd2c-4757-9cad-d02348c5e209', 'muneer@pamcargo.com', '$2y$10$nMmTTY/VI4H0FV2DXuKiNOEC9ZfrYSpQ.rPHZsmHvF.QRZGI1p.sy', 17, '2023-05-11 02:29:26', 'admin@gmail.com', '2023-10-05 07:48:33', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('7b085a2d-ef41-4b80-8234-8c45ba7da90f', 'myanmar2@pamcargo.com', '$2y$10$t6vhDF7omUM.HmOcWNwIoO2uBJorFtmL65dXZZB0KfKsrz1qajSsS', 16, '2023-09-12 06:41:58', 'admin@rembon.com', '2023-12-12 08:27:53', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('afb8c9b0-b363-4251-9491-ecdf60c98059', 'dhaka@pamcargo.com', '$2y$10$Wgs2Xw65WgSrYJwO2sL6m.xTEnihTIZ8sPc/S8Cu5r5O7JkdYBR6q', 16, '2023-05-15 04:43:53', 'admin@gmail.com', '2024-01-02 05:16:08', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('b0537e41-bda4-44cb-8a1e-af9dba6b50df', 'hochiminh2@pamcargo.com', '$2y$10$riZunn/YOso43rukBCNEKeNi1HjvC55m6y0J/uiGjA.j06hwUztaG', 17, '2023-03-02 10:05:05', 'admin@gmail.com', '2023-12-14 09:42:26', NULL, 3, NULL);
INSERT INTO "user"."account" VALUES ('cc1500c2-a261-46c1-9a8a-d45419d0d1ca', 'dubaicargo@pamcargo.com', '$2y$10$3nqxL.IpJF9/k3/fSadXBOPceTAkcQcWHMV1C./GEiGL2Y.o.J7bG', 18, '2023-03-08 07:32:02', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('cd40e51e-8410-462d-9034-3aac1d4692e2', 'amal@pamcargo.com', '$2y$10$oZph8TYO4m9soZhICdDXtOBjcQW787kg0hCJsXMTijHJOw8hD6Xcm', 17, '2023-05-10 08:17:45', 'admin@gmail.com', '2023-10-05 07:46:49', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('ce72b337-9990-42b8-899b-657d3fe407a3', 'origin@gmail.com', '$2y$10$zxqh5Muq78Bd4ARhrSYMiOOqcY4K0eYt0CiFHudmGVSl9UGYmFDXm', 16, '2023-02-13 03:43:26', NULL, '2023-06-01 11:23:26', NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('96fa9372-581b-4ee4-bb93-e411d9070025', 'ccnair@pamcargo.com', '$2y$10$sQGI0Btr1WYsXRMzWx.7/.Basp.dRyGQa5fFx0DEE1WR4M/OeG48m', 30, '2023-05-11 02:27:07', 'admin@gmail.com', '2024-01-23 03:23:02', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('a6ad906c-45d8-4b5f-991e-4610b27943bc', 'sajith@pamcargo.com', '$2y$10$Q1/DPwUPqeLNwugZTBtMNuDEh8R4isyrdp02e2tsmbWRjP0501.5y', 17, '2023-05-11 02:29:58', 'admin@gmail.com', '2024-05-07 07:10:20', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('b0aa6bf3-1dbf-47b3-bafa-ff2968874767', 'vietnam2@pamcargo.com', '$2y$10$yNyNrIb/vWANqgg37JiIb.oItMJmWzissvh6ElTZgLYJ6jFBEhdF.', 16, '2023-09-12 06:40:58', 'admin@rembon.com', '2024-05-09 05:39:44', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('b3e4755e-b2cd-4c80-bd00-0cedd1cea2f9', 'myanmar@pamcargo.com', '$2y$10$BvmkGWgHCxy8Occf33m6W.ik1UQB7o9GxX3ujS4EYWGPIOMkhHPVK', 16, '2023-02-18 01:40:52', NULL, '2024-05-10 09:05:06', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('ce93f4cb-1b14-419e-b8cb-96a05693486d', 'haipong@pamcargo.com', '$2y$10$F5RkZ.txWKoYNbIo9xeu0.jUgDqg9m25yi5.C3LH8Yz4y1vCvU/d2', 16, '2023-03-08 07:38:35', 'admin@gmail.com', '2023-09-01 07:21:55', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('cf737ecd-86de-4759-8eac-628c57feaefd', 'manila@office.com', '$2y$10$4K3JLnbbHkTHzPEU7nMF9.RGkfeKb95Efk0Fjk2.VA3ZTVdfC7tei', 17, '2023-03-02 08:20:57', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('d0b5e5d6-c3b6-4752-9997-ffebcde2447f', 'lasitha@abanchy.com', '$2y$10$I44TsafqhrrpRyaFw9W.ruU5bkaZxLqLDhhiIK3LQ7/jErrPrDX4O', 16, '2023-03-08 04:55:47', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('d5302cdc-97bc-4a63-a851-ccd110df0517', 'glspakistan@pamcargo.com', '$2y$10$DHnynckVeaYuj4Lt87mc6uPhXJPrQGw3f8aigszHyQh6Sp0xQ.vyu', 16, '2023-11-17 09:30:41', 'joz@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('d9135723-9b34-4aa8-b4ff-d2b2bafc526d', 'cambodia@pamcargo.com', '$2y$10$EVBhmu0JTY4MtEfxwulZ8OROxge/K7CagJHz3OtVMvi0QRWmRJ81G', 16, '2023-03-08 07:55:13', 'admin@gmail.com', '2023-08-31 11:24:12', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('db8496c6-a2c2-4897-9e7d-27343daed6b8', 'africa@pamcargo.com', '$2y$10$UI6PmEg7xpAijXyI/L3qyeVJihmys7egbzlLSDf1.r7MK7//399A2', 19, '2023-03-08 07:23:24', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('db8c11c2-2083-4442-8740-975072865b81', 'taiwan@pamcargo.com', '$2y$10$2HUa2HV.MifoWnO38zp./OL7Gg0QkSPWky1dMI87/sWJSBs.TT4A.', 16, '2023-03-08 07:44:15', 'admin@gmail.com', '2023-08-31 11:26:25', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('ddf751cb-b688-44f2-9b00-e60628b28b8e', 'Kayum.shaikh@pamcargo.com', '$2y$10$HrNqSm5we8gbvs8wbQzyx.v.4hoUjwM1nmVtHTeVM7AQ/4kx24O9S', 19, '2023-03-23 07:29:13', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('de304fd0-d29c-4379-b46c-b71065c2c55a', 'Eric.thanh@pamcargo.com', '$2y$10$/UO3kc3ejPvsWHfQ1oPRWuO22fLPuF.zUj1qMBQHGmoNFjP5w8ACS', 19, '2023-03-23 07:07:35', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('e5c992e8-ef0c-4c2f-9ffd-ddb88a052165', 'hanoi@pamcargo.com', '$2y$10$hTH8PcHtHmSKqNVN90btauRn06yWuwNgzkW6W.TsltiwnxsQBCH8y', 16, '2023-03-08 07:39:51', 'admin@gmail.com', '2023-08-31 11:27:46', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('e65fbbdc-4619-48ff-9f5c-5ab3881aa4ab', 'thomasvrgh@pamcargo.com', '$2y$10$5k3R/KoEvtIUFZPV8DXQ2O9QOzBO94V8F7ueRu4yLcQE2o8IBjHW2', 16, '2023-03-08 05:20:04', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('ee3744cb-ae6a-4bf1-9c6e-53cd43b18eb7', 'hongkong1@pamcargo.com', '$2y$10$p6LfImlzly1hkMY3WA9S5ObuCn4.Dwon40zZdJoTSVQAHqmAXO6RC', 19, '2023-11-22 06:47:39', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('eeb8b284-efcd-4b16-9f74-b0c5cd3b582c', 'cs_hkg@pamcargo.com', '$2y$10$a4nRHpqIx6q.7OMffNnlWurVyRujc2/WLrO0a9FBElbpkYHCg4sj6', 16, '2023-05-19 03:53:06', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('efa422c5-4e2f-4031-b927-739a128e2c9b', 'eric.thanh@pamvn.com', '$2y$10$RsX7C1YfFpvoYfJjJs1OkORpL5OCNN5wgkTpVmMwwKeXMeYMw/tEe', 16, '2023-03-08 05:16:14', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('efcd0d98-cd38-4f5d-bde9-e5ca9c1d3085', 'singapore@pamcargo.com', '$2y$10$LFxgANYLw8z1ZyRC/g5Q2uVf1l86a9TYPkXo/d4ZgzYwX4FOyKodK', 20, '2023-03-09 02:56:35', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('f291cea3-4e31-40a8-9e3b-e712b086de89', 'danang@pamcargo.com', '$2y$10$9.ae4erXO0Iu.W0jNGK3geMFfH4FvdFf4AE5kRgLELIHjEkG6kqTW', 16, '2023-03-08 07:41:27', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('f3c7c5fc-30bc-4829-acc9-6969d202f76c', 'Sh.jun@pamcargo.com', '$2y$10$yIAUqr6pYDuTvd554bIq4uKLckk1LTE4JqkdX0lwSBRyWysKRbSX2', 19, '2023-03-23 07:18:37', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('f69120bf-4c1a-4f82-a64b-d74866f4af9d', 'Jeremy@pamcargo.com', '$2y$10$GfTels8HARPjAnzKv0axJuU3o5rnRkY/Evvo3PhjvtxpS4i/nnscC', 19, '2023-03-23 06:51:03', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('fda199b6-c1c9-4173-bcd6-33d05b36a21c', 'dubai@pamcargo.com', '$2y$10$Ng91zTk3b0bezaU0zlN.Cewz9GiMiS/lUuYIN6b7gbyrPXvIbwkoC', 17, '2023-03-01 10:05:27', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('fdc6542b-01a0-4f94-8c1b-f7dca385a896', 'austriapam@logichain.com', '$2y$10$qcED4R8Qpv95IQ36zfA4Bu3lfelD6wIOHnBpPK1IN8xiT1OXXDbgW', 16, '2023-05-15 05:19:42', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('1942cfa8-bf7e-435e-8747-b97410bf690a', 'myanmar5@pamcargo.com', '$2y$10$POIau.9tXyrqHg2tbmKD0.atRuijdXpZkoCktGT9jfytm/jUdXkR.', 16, '2023-12-12 05:48:38', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('27895811-ac6e-4a68-b18f-53c2bcd3ec75', 'vietnamhochi@pamcargo.com', '$2y$10$Pl5IuhfgZahIT1kXNBEyp.Ps5rjFtkCihEkuhb8O9qUGM0pncHNFm', 16, '2023-12-15 08:37:12', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('408dd043-94ff-42c3-9bf6-ab1cb931b663', 'martin@pamcargo.com', '$2y$10$4BBVa.rwAqh2pfqbJH1p1eTVLfPH0KJhUZmMKuvHKd/dh4awEzN/u', 28, '2023-12-06 13:24:21', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('4b743225-9eb9-4742-b570-490c5cd0f5c2', 'sts@linklog.com', '$2y$10$bXXnQQIh2a5Jjd6x6W594eYwLeJrBa5Ps3niHEoZ8w/XZWr83f4oG', 28, '2023-12-06 11:33:39', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('6079250a-9979-4f08-9a43-7318e0198a82', 'stefano.petteno@sea-air.it', '$2y$10$866W8HtCaDEAJKyM4T1CtetJB6LX/CwyPPOWLUPs6rd86qEgVo9lG', 28, '2023-12-06 11:24:36', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('64b5a19e-3a49-4e6b-a275-0da8d263c838', 'Justin.Jordan@xllog.com', '$2y$10$55tEiwsGWrdph48DIIwfCOKt4TrIdpaVkWAZx6ISOojIONdgc5pT6', 28, '2023-12-07 05:48:35', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('6a1c8d31-1ed0-4b14-b682-6e59983f6e2a', 'hochiminh@pamcargo.com', '$2y$10$wcgdAyEjVfr4y8MtNCNn1.WpPc1be/Q3ksUXWCsAlb6zr9.iosEu.', 16, '2023-12-14 09:55:13', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('d2523f37-35b0-426d-ad51-178dee069a28', 'nurul@pamcargo.com', '$2y$10$c5SlxnbO86bdJ1x6KXTW5eBlPGBoTrBEJRkSFH.G38p.SjBiirgB.', 16, '2023-03-08 04:38:27', 'admin@gmail.com', '2023-09-25 08:07:39', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('f751279e-8b35-4e21-832f-a4c571125f10', 'joz@pamcargo.com', '$2y$10$gyFSV53ygdZv9tCy8NCpbuKbdzL/RP4qtzYyK2TGIqlTQdbzkzBdO', 18, '2023-09-11 06:51:15', 'admin@rembon.com', '2024-01-11 10:22:10', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('97f3cd5e-dabb-4736-a574-e2fb248f90e8', 'vietnam5@pamcargo.com', '$2y$10$wD5eymhCZgmZH1bDr4.MleysXr3B0lOGf4Ymuq2mWNABE322Q5tVO', 16, '2023-12-07 13:01:35', 'vivek@pamcargo.com', '2024-03-11 06:20:17', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('b63e0e64-d8b6-4e99-b52c-da3bea18adad', 'hochiminh5@pamcargo.com', '$2y$10$7iUFm9uM4Bbke6h/u7vvvOXLBNPUrp0d8bLazjltRRHOtXe3FTrdu', 16, '2024-01-18 08:57:47', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('cde9be6f-9a7d-4c9c-9375-26006f7dba50', 'alfredo@pamcargo.com', '$2y$10$n/tBBcmYVcl3NePRQRnXUO6rLngROOuwnSlw9/3Uc0lXpqpRNyIj6', 28, '2023-12-06 13:27:25', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('e066e4a4-8e3f-4ab1-b792-0be2aa1abdec', 'thomas@pamcargo.com', '$2y$10$1rEGu22YFqMOw/C2TTE36.Y4BtZke.rkdEaDPXXG4utgeQez3ncoS', 18, '2023-03-05 00:56:58', 'admin@gmail.com', '2023-11-06 02:57:36', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('e30b788c-b4bd-4cba-9cd8-bda15ebdef66', 'Esther@pamcargo.com', '$2y$10$nP8daehV5SP74Ta7WRO1yeJvpITLeUzwAyQBDwcqNL8CLrr6dKp9u', 16, '2023-03-08 03:52:35', 'admin@gmail.com', '2024-05-10 09:05:48', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('ff8ffa21-8673-47fa-9dc6-0e0fb0790344', 'jeremy@pamcargo.com', '$2y$10$u/Q/WPx7e2jp/Lvy8t5LZuptg4SbGBXkTVUntwqK/VcWQhs.3IHJS', 28, '2023-12-07 05:45:26', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('14a73b80-22c9-4880-a5e7-cc3630edbabb', 'glo@grand-long.com', '$2y$10$fVM8inH6d.Wu9OZnvpk.vupm43ryJ5Z0XV1BuADQ4yLXAoSiqk6Ge', 16, '2024-03-29 05:41:38', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('27d74d60-2c7f-4329-9da3-a2acef55962e', 'sales.france@pamcargo.com', '$2y$10$AzHEXrWyEZAb.fBXMnT6heOiX5LWIvDltn8Se0yM1L5t9OYCFyqAG', 28, '2024-03-06 08:04:08', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('3305705a-b5d3-4939-b289-d762b3b7787a', 'operations@cargomarketingintl.com', '$2y$10$F1N7gOB8RmdjVXXV1JPObe.QuQryyELhoAhQ5LEJWhLDhjrB7g96C', 16, '2024-03-29 05:57:18', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('4c1b8411-4163-44e1-a20d-beb4fc19990c', 'airmgr@victorylogistics-kh.com', '$2y$10$9dhy6pUHPxTpUV0c0Y.rhuM036t7Dy6rmkLEc4/VKumby2L1F5nvq', 16, '2024-03-29 05:48:54', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('67e6380f-d761-46ff-8a09-b69e8da181ea', 'bangladesh2@pamcargo.com', '$2y$10$.kNsgJgQX/tpJwF.x24PgeNebVMLG/ecYC9oh4w4zqTZrj24rqcWu', 16, '2024-01-23 07:03:08', 'admin@rembon.com', '2024-02-20 07:45:26', 'vivek@pamcargo.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('705b276a-8651-4689-b13f-523083f9a795', 'maasales1@cargomarketingintl.com', '$2y$10$UphU7CyTWPAF0WMQ7IIQnufq05IFn3qiqOgwq4y7Rp8mtfzjWjg.O', 16, '2024-03-29 05:59:23', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('83c6b3c3-b3c2-4157-a18c-e22c0eef4750', 'rembondxb@gmail.com', '$2y$10$jEKFoMop1bDaIc1uni/JjOOugasxXJ6hZ8czgGmByUZjS0D25cuSa', 16, '2024-02-05 08:15:01', 'admin@rembon.com', '2024-05-09 07:03:05', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('87e36617-f442-40d0-904c-ee2c7aa14a51', 'andreas@pamcargo.com', '$2y$10$DL1lUtQIhXoEUn2zyXn49uKZCZ.FiWft3ZiqXueE3fIoeuOauidX2', 30, '2024-03-01 03:11:58', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('aa1805af-0ed5-4cbb-b801-4cfe14512059', 'riyab@pamcargo.com', '$2y$10$jdtMwP6xBnLuVnCfTIZ8jev7Fxh8U5iqrfwGZTxRr.3VtFP7FUz8K', 17, '2024-05-07 06:13:22', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('b078ec5a-e187-4218-ba46-fe8ce4c4232e', 'bombaytest@pamcargo.com', '$2y$10$gbfNrlqw0daq1bj85LXXnuMFul/iucKrkNvkCquYBfj1bNS2E7FCO', 16, '2024-05-08 09:34:22', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('b38bb584-0dbe-454a-8344-6bd45db38bde', 'sales.germany@pamcargo.com', '$2y$10$0EoKFyxJzDjFrZN6kX6Q5OWjJ90aBd.hEwa.rpUwhNHyxJ12TSl4O', 28, '2024-03-06 08:03:15', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('c89a2018-c57a-4c65-8bb1-8b9c911c506c', 'sales.austria@pamcargo.com', '$2y$10$7u.0FeuIJtxPybJnEdMurOdk2ycOwPTViwehPsTM6VsrnemwhKG7O', 28, '2024-03-06 08:47:56', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('cb7de63a-e04d-4eed-b752-56959e8ba67b', 'bangladeshtest@pamcargo.com', '$2y$10$5GcT/D6YPO4D8yM8DLyGO.wK8Sw9ahsy8sh/HRvhlCgze9qyynjy6', 16, '2024-04-19 05:54:01', 'vivek@pamcargo.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('ce798d1f-cd40-429b-aaef-21f4c0058fb5', 'sales.portugal@pamcargo.com', '$2y$10$ib9mLiydE1d3ODGIy..HD.f9xnVFdAG05EkFFkGyBH8NnW/i7byQC', 28, '2024-03-06 08:47:03', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('d060596f-3941-44cb-8412-c88bf0b33469', 'sales.italy@pamcargo.com', '$2y$10$ORT5VZGqCfNrYu8EUmhxbuwnu0T7pzIUX1vwGJ10Ir7mod1gvmOgC', 28, '2024-03-06 08:02:13', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('e0380af6-4744-4cd8-8eca-d0ff9b1330cf', 'sales.sweden@pamcargo.com', '$2y$10$UeQRL.KARVzHyanK/6RE7uwcj2dyCLtICXznSidDZYs6WPkRZ.ZaG', 28, '2024-03-06 08:46:02', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('02db270a-a5a7-4fff-a717-6d0bbb51ff45', 'germany@pamcargo.com', '$2y$10$xHCRVk4QTcgNK2gJ6VF2yOk5Lq0vfd9Udz.t5NRPdkiCXyxb.K1NS', 19, '2023-03-08 07:27:45', 'admin@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('849e7449-1c30-4785-9686-41cb2f4d4d4a', 'willy@pamcargo.com', '$2y$10$WlN6rthMWGTtHMicUBlOKO9Vxf.Le5pw5AL1mdtQC/YVZUPPdrrw.', 30, '2023-03-08 05:25:18', 'admin@gmail.com', '2023-12-06 03:37:08', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('3c6ce50e-55e0-4328-b965-093bc096762d', 'jhonydoe@gmail.com', '$2y$10$5iUApLFbmB/y5Qu1w0qjc.0K4iShYZQSyWSl35w5SoVAnPEyt.85K', 31, '2024-06-07 13:25:33', 'admin@rembon.com', '2024-06-07 08:31:35', 'admin@rembon.com', 1, NULL);
INSERT INTO "user"."account" VALUES ('328c383f-e3b8-44f0-bf9a-da442b8c1a8f', 'aang.wiadi@gmail.com', '$2y$10$WPWy3FxSlHwt.FNkjq3JL.kuy/zREZ9vvWic.GH/4t3Dqn4.QYJve', 29, '2024-07-24 11:46:57', 'admin@rembon.com', NULL, NULL, 1, NULL);
INSERT INTO "user"."account" VALUES ('69880162-6f4b-461d-a424-e05d48a24bb0', 'junaedi@example.com', '$2y$10$QQ3eu5tD6sEMRTH5zpnXAepE1XT7p7LHY6rkx6qsqiLhTwtHbrHYK', 30, '2024-07-17 13:37:33', 'admin@rembon.com', '2024-09-04 08:24:08', 'admin@rembon.com', 1, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "user"."customer";
CREATE TABLE "user"."customer" (
  "user_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "username" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL DEFAULT 1,
  "role_id" int2,
  "customer_id" uuid
)
;
COMMENT ON COLUMN "user"."customer"."status" IS '1. active 2. inactive 3. deleted';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO "user"."customer" VALUES ('035fda00-c671-4a66-aa0d-fc092b287d52', 'chicago@cargo.com', '$2y$10$RNRjhWmZtwSpaLlBTmfIw.Y1zT5BHl8h.N409lbdRwFySlDYi3fMS', '2023-03-27 06:10:30', NULL, NULL, NULL, 1, 21, '873e2c47-339b-4119-93a2-0317bd7b87ff');
INSERT INTO "user"."customer" VALUES ('03705043-5124-45ee-9285-12c67d701f08', 'alltrans@pamcargo.com', '$2y$10$YDSqXMyZTHQ16hrY.NEVI.cz1MhX7Q.dW9HLSKvvX.Nfu000JaLbK', '2023-03-14 04:46:16', NULL, NULL, NULL, 1, 21, '07734f9d-5e61-4e35-8aaf-a59a71eb8654');
INSERT INTO "user"."customer" VALUES ('03881019-344c-4146-81f4-1b6a4c80706a', 'aesmhkg@angloeasterngroup.com', '$2y$10$zubHEt9QYtuKzXHzrdASp.LBzgB0YrItWWhe/9X2gkMaUFaVz6IWW', '2023-03-27 06:19:39', NULL, NULL, NULL, 1, 20, '69836f5d-4b21-4d58-9be1-6a5ef794c16d');
INSERT INTO "user"."customer" VALUES ('063c67b3-a253-4fc8-b5f9-af3d5f91f2b3', 'bangladesh@pamcargo.com', '$2y$10$YB3L2JzSbago6eOMh6dzU.4hjmXLXH5n5uGxdRmDHffaUT6nx4k.e', '2023-08-10 10:25:02', 'bangladesh@pamcargo.com', NULL, NULL, 1, 26, 'f1229587-df5b-4237-9f8c-f6de27eb2221');
INSERT INTO "user"."customer" VALUES ('0db9e4c1-4169-4455-b2f0-15d015e4e9da', 'Sweden@pamcargo.com', '$2y$10$gDw5gHQiQ.rW7gpfB/MvTukqej4GUmo2oN9lYAAu.Fz6zt2vTeJfu', '2023-03-23 08:29:58', NULL, NULL, NULL, 1, 21, '682976c3-92ef-4f6c-b267-0f0ed95b0a1a');
INSERT INTO "user"."customer" VALUES ('0ebe6f2d-b34c-4ac4-9035-baa7acd7a87f', 'sutoyo@gmail.com', '$2y$10$9yB9ucQL6rZKzJaxEtSt.OzJrSTPMDPOyzJ2qVzqSEVuICZpOfxGG', '2023-03-09 04:14:15', NULL, NULL, NULL, 1, 20, '5c653867-1d66-464e-a81f-63062680171e');
INSERT INTO "user"."customer" VALUES ('1090a7e0-06e4-4556-922c-4d44c4391220', 'asd3@gmail.com', '$2y$10$C.ocbh3pHSkwcyqPNJqSt.0rMuPQnXMmZszBCbNXUnRB4QIpP2Xt.', '2023-04-18 03:00:22', NULL, NULL, NULL, 1, 20, 'f0558678-007b-4b5c-a738-f5a68ce6f05a');
INSERT INTO "user"."customer" VALUES ('12264b09-f20c-41a9-bb0d-e9df8bf2d89b', 'korea@cargo.com', '$2y$10$1G1DfIx/O7KZ32uDeRlYNOiBaXnmLPUfZ3QSIVHLf3/9dc3bb4JZG', '2023-03-27 06:06:54', NULL, NULL, NULL, 1, 20, '1da1eb97-0a12-47e3-bba9-9ede8b7fb5b4');
INSERT INTO "user"."customer" VALUES ('12a10436-359c-439d-a2fa-159c46f4b3cd', 'South.africa@pamcargo.com', '$2y$10$AjGdrPqQ49KImTKFtAhoaOSzry6qWcY6TH3bYbSoAEaA8FRJTfuc.', '2023-03-23 08:36:06', NULL, NULL, NULL, 1, 21, '347560b5-80bc-4592-aa92-17e962875c48');
INSERT INTO "user"."customer" VALUES ('15c63baa-1a34-49bc-ad6d-cac36d58dc40', 'tegarkurniawan', NULL, '2023-03-08 07:02:11', NULL, NULL, NULL, 1, 1, '5ea7b070-3f1f-4a09-91cb-e5cd96e93468');
INSERT INTO "user"."customer" VALUES ('1cb29eb3-959f-4c4d-bfdd-129f5dfd59a3', 'swiss@cargo.com', '$2y$10$GGsJUKrKvlLjK62WsKPioeTOhJeUzc2KDia1cFRrhJSsAfS65ih2K', '2023-03-27 06:13:58', NULL, NULL, NULL, 1, 21, '4057a5d7-cc90-46ab-871e-0a6a9d9c289c');
INSERT INTO "user"."customer" VALUES ('221f5947-0d48-46c4-be6f-1ea7355ceaaa', 'Bulgaria@pamcargo.com', '$2y$10$mJHy/f0IutB0kG7ikcd9a.D8k3wZqSEN8fABdkUOFoQsYGmklJFS.', '2023-03-23 08:19:23', NULL, NULL, NULL, 1, 21, '6482fcfb-0980-419c-ac20-d8b7d5e22a5d');
INSERT INTO "user"."customer" VALUES ('22edd41e-9130-4c84-a507-27b687c1c279', 'moller@maersk.com', '$2y$10$.VzMs7zqCZjG1DUzJlzsH.TTnGFa4W4hEmnywYUxyqmblGDwn6UOm', '2023-03-27 05:37:07', NULL, NULL, NULL, 1, 20, '8cb4406a-909e-4d8a-9055-c762d00f46f6');
INSERT INTO "user"."customer" VALUES ('24cd495d-8b03-47ab-b29a-58566fcaffaa', 'island@cargo.com', '$2y$10$V9QQcVjDFyRB0FvNB.IbsuGU0tZJ0/qaw.3JV8wpcVW8I6ip73Hu6', '2023-03-27 06:09:07', NULL, NULL, NULL, 1, 20, 'a751e973-aeb4-4504-b9f3-0c5c542929ca');
INSERT INTO "user"."customer" VALUES ('2539f6af-479e-49a3-b820-d09ceab5234e', 'korea@cargo.com', '$2y$10$T.zyQu96E6xrd2IWGROGZeFXziLtF1cUp.U/C0OtU9gE5jRkQlEUO', '2023-03-27 06:06:58', NULL, NULL, NULL, 1, 20, '1da1eb97-0a12-47e3-bba9-9ede8b7fb5b4');
INSERT INTO "user"."customer" VALUES ('2807c870-b129-463a-a5fa-d7c615e2c669', 'willy@pamcargo.com', '$2y$10$QXLTJfLqpKk63ZIc8DbSLelYh9zVoLEX5qYjzMuD8KhAMmz6EIoDu', '2023-03-27 04:59:10', NULL, NULL, NULL, 1, 20, '0c4d5d41-c5ea-4433-bc0c-82bff1c51925');
INSERT INTO "user"."customer" VALUES ('2a4d59e0-45ac-48b9-8aeb-1e1aeeb736ba', 'tegarkurniawan4', '$2y$10$JV.XzC0xFXex.jMuVMc9f.bdlqsiUhYY.CK/SurV1K6koCVG2CxSa', '2023-03-08 07:13:10', NULL, NULL, NULL, 1, 1, '5ea7b070-3f1f-4a09-91cb-e5cd96e93468');
INSERT INTO "user"."customer" VALUES ('2d13ccf8-2f9a-48e9-981a-cc0254d9fa44', 'Sudan@pamcargo.com', '$2y$10$gbnVYR/UFNSk5uD8PxXP2uebPolDyl0TYtirOwnZiS78lV4q2l2va', '2023-03-23 08:33:37', NULL, NULL, NULL, 1, 21, 'e1ca9382-d7bc-46da-b7f1-7f44fa7a7085');
INSERT INTO "user"."customer" VALUES ('2db51c7d-b276-49d2-a051-5f0d67f3fcd5', 'info@yanmar.com', '$2y$10$zLRlgZZPVjyxCAeOv6gVteZQssI/3yB57dHe9Yo6JfWQfKzztve8m', '2023-03-24 04:09:12', NULL, NULL, NULL, 1, 21, '1ffe9250-5975-4ed0-a1c6-6c2109ad2be1');
INSERT INTO "user"."customer" VALUES ('2dd37185-0cc7-477a-8aeb-b41bd9f40c60', 'Ireland@pamcargo.com', '$2y$10$4xZbYXztsCk0zjmKx76h7uSkAZG7Sa6nNz5hDqZGiqEoj30aSXsue', '2023-03-23 08:27:40', NULL, NULL, NULL, 1, 21, '2ce19d8e-a781-4647-9327-1833a109b280');
INSERT INTO "user"."customer" VALUES ('2e92d6ad-0089-4544-9f4f-0a53240ce706', 'testinginfina@gmail.com', '$2y$10$bVwOr88RiPVt5r5H//8uGun9T2e2.fxLTZg/rrEzLbuRXn.XbzoW.', '2023-03-21 10:00:15', NULL, NULL, NULL, 1, 21, '535714ac-68be-4e8f-a208-13e2c18ff410');
INSERT INTO "user"."customer" VALUES ('2f50c3f3-4131-4117-978d-330c0d3c0a89', 'muhammadali@gmail.com', NULL, '2023-03-08 06:49:01', NULL, NULL, NULL, 1, 20, '30cc9090-98d1-4304-8658-7841ba3d0e00');
INSERT INTO "user"."customer" VALUES ('2f5c43ac-8ab9-4dcb-a548-e972be1de578', 'Ivory.coast@pamcargo.com', '$2y$10$VpX4DvzVkWlFldwgK1JOkOYGcksPvIzdHlPATUoYHrRfk9HOI.Zri', '2023-03-23 08:40:03', NULL, NULL, NULL, 1, 21, 'f42bb6c4-3bff-47cf-9b91-6a905bd09590');
INSERT INTO "user"."customer" VALUES ('30722782-53e6-46b9-9def-b109780b98a8', 'dede.thida@itlvn.com', '$2y$10$00Sitte6isXZ7omjJgi2A.MCTspweVtzFzVcTmK39uPM3Wxogdvca', '2023-03-27 06:14:29', NULL, NULL, NULL, 1, 21, '6cd094be-7095-4258-bab6-1fdfc5106b1b');
INSERT INTO "user"."customer" VALUES ('30f69ec0-b8c4-4242-a700-4d6535edacc2', 'shipper@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2023-01-17 08:25:12', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "user"."customer" VALUES ('3254f56c-1f00-4df4-bd5a-93e358e95910', 'aesm.hkg@angloeasterngroup.com', '$2y$10$rVK..XA.zlhWHG1mtpZnBumnh07Ozb1jKzUcv4E3luZ4ROtPlqyHC', '2023-03-27 06:13:13', NULL, NULL, NULL, 1, 21, '39fd542b-1b20-4438-a344-00b8cf0ed53e');
INSERT INTO "user"."customer" VALUES ('3e63d9c9-896a-4676-95d0-dca69cf5ebb2', 'taiwan@cargo.com', '$2y$10$fOwyTUaSwDV3.NsQkUuVROwX9mC7vVoGpDcFYQPCVYfI30UYWkUAq', '2023-03-27 06:11:49', NULL, NULL, NULL, 1, 21, 'ce28e9b1-ff39-4b4f-8dd3-3688ed44afa9');
INSERT INTO "user"."customer" VALUES ('482e63a6-b0fa-43fc-95ee-21fbc8aac9e0', 'panama@cargo.com', '$2y$10$htOtX0IY5ZOgsaEdRViXyubsvUKUR.EoVcpRIWGwj2DxnLolmg.Fq', '2023-03-27 06:07:54', NULL, NULL, NULL, 1, 20, '0c4d5d41-c5ea-4433-bc0c-82bff1c51925');
INSERT INTO "user"."customer" VALUES ('4d28d789-9b4d-41cd-8370-84d1d148aa42', 'fabioviandino@gmail.com', '$2y$10$ykz5AM7xYqLOKRyDNqXYD.AfbNz3sIGHtdrSWb74DNH2Qcb/B.rDi', '2023-03-08 09:22:53', NULL, NULL, NULL, 1, 21, '123419a3-5dba-4aa2-ae51-c442775fa958');
INSERT INTO "user"."customer" VALUES ('4fbb909d-fc73-4f24-91dc-c6714190ce7d', 'fabio1@gmail.com', '$2y$10$B87OKHog6viDK7OMUUCzTu11sbYanKExslXu2fsRW/xMlk2D4fOMG', '2023-03-08 10:42:48', NULL, NULL, NULL, 1, 21, '1b0a1fc5-8bcd-4154-a750-0596b4ed9856');
INSERT INTO "user"."customer" VALUES ('510fa561-2052-4cdd-8f20-b492e8a0fcf7', 'fabio.viandino@gmail.com', '$2y$10$5urK2uRvNCbVFUcgohx6AOscr6XN.6hFKeV8ulnGaHpgVw2lsNJSy', '2023-03-08 07:15:46', NULL, NULL, NULL, 1, 20, '15e5e29e-767f-40cd-a6ae-fbc30866ed96');
INSERT INTO "user"."customer" VALUES ('51ca2873-d350-4b47-8768-14dfcaa4bec3', 'sales@sab.co.id', '$2y$10$RjPnLyYavde5cuRQFgaeBOwJEwUhmNAl0NJFiFLG9hyehYro2K9DG', '2023-03-27 07:46:06', NULL, NULL, NULL, 1, 21, 'e4aae22d-451c-4041-b096-6ee6c8cdb309');
INSERT INTO "user"."customer" VALUES ('64683207-e1bb-490a-a37d-68bd06f6bb4f', 'chicago@cargo.com', '$2y$10$.R2F4mo7vf4uD.VCEWx93uXa/IEWa28G1pb4sb3AVr8sbnS6w89au', '2023-03-27 06:10:22', NULL, NULL, NULL, 1, 21, '873e2c47-339b-4119-93a2-0317bd7b87ff');
INSERT INTO "user"."customer" VALUES ('667bdf4e-06c4-4c29-8bf1-475679a6c52f', 'Swedia@pamcargo.com', '$2y$10$28Rl59zQr7kXptF6j2PUdueBLG8EIvBINfKAr5b.6LLP9dkzZUwj2', '2023-04-18 02:23:30', NULL, NULL, NULL, 1, 21, 'd0a4befa-0b49-41a2-9423-a55721b0932e');
INSERT INTO "user"."customer" VALUES ('680e634d-0872-454d-88cc-c992897168d3', 'taiwan@cargo.com', '$2y$10$pKzPWAf23EjaX5MYkmaUq.PVSU9LALXXFiMDiCfI1fD/Js3P1QKoC', '2023-03-27 06:11:43', NULL, NULL, NULL, 1, 21, 'ce28e9b1-ff39-4b4f-8dd3-3688ed44afa9');
INSERT INTO "user"."customer" VALUES ('7087b5a4-91d4-4c95-a977-d766e74a8f7e', 'consigne@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2023-01-17 08:25:12', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "user"."customer" VALUES ('70ae6fbc-8294-4880-af03-6b61bb8096c7', 'Senegal@pamcargo.com', '$2y$10$/uTRaEZwuAkTqbcW9xt9DOFMSAufxCjaSg8K7RjNxy33fZgx/KdSC', '2023-03-23 08:39:06', NULL, NULL, NULL, 1, 21, 'beff4ea8-fcf6-417e-bfdd-de777b49b32b');
INSERT INTO "user"."customer" VALUES ('75140686-4bcd-458c-8a84-32e45bb3c82e', 'bambang@gmail.com', '$2y$10$.JxNadXRQ/VmIDdl1ar.deRtLVIB8HRVb/e.VVSI6zVdQkgI4SY/q', '2023-03-09 04:10:32', NULL, NULL, NULL, 1, 20, '3b563909-9eb8-4471-a5de-415abae463bb');
INSERT INTO "user"."customer" VALUES ('75759f0c-0216-44e9-997e-4337e6de5ad5', 'tegarkurniawan2', '123456789', '2023-03-08 07:10:22', NULL, NULL, NULL, 1, 1, '5ea7b070-3f1f-4a09-91cb-e5cd96e93468');
INSERT INTO "user"."customer" VALUES ('76b84686-567e-40f0-b8b0-8f8a3af32163', 'fabioichsan7@gmail.com', '$2y$10$vGrLhnBeEtGQBnpVdTgdFOSego5dyfkHbklzT2C.i2QRkzLe7kAjK', '2023-03-08 06:54:03', NULL, NULL, NULL, 1, 20, 'ce26e50b-9288-4a42-9b7d-1027d13fc242');
INSERT INTO "user"."customer" VALUES ('7b9fb905-28a4-431d-a574-603ff0ae218b', 'Nigeria@pamcargo.com', '$2y$10$LJotj6v1QxLtzRLl19qAgOZ2kteJjbHJ/hD8BOn57R.i.73bSf1VG', '2023-03-23 08:37:10', NULL, NULL, NULL, 1, 21, '3d1e7fa1-bad8-490a-83de-b919f0928141');
INSERT INTO "user"."customer" VALUES ('7e05f524-c36c-4904-9d01-e228ad896c45', 'aweidha@pamcargo.com', '$2y$10$Cbasz50SIKbsAdRjA/pr1u4AS6.69kYcWJxr5LZrZLX8Rbg/NPvZO', '2023-03-14 04:41:19', NULL, NULL, NULL, 1, 21, '1da1eb97-0a12-47e3-bba9-9ede8b7fb5b4');
INSERT INTO "user"."customer" VALUES ('85ed2408-78ac-46f0-a8bd-8e5dcaaa233c', 'customer@rockport.com', '$2y$10$tx9LHSSnFLmP.vRCKMj5puivdZUjPls0YpC1CH4y4KoCPdrmq5oKC', '2023-03-27 07:45:18', NULL, NULL, NULL, 1, 20, 'e8061a61-364a-49e3-9572-41e38a8aa484');
INSERT INTO "user"."customer" VALUES ('8c3195cf-a495-4681-90d6-62532acf5013', 'Hungary@pamcargo.com', '$2y$10$rLBUGfDoFKX6A0FZIo2ur.FFpZko3iN2r8eSeWxaj8ug7urLOpRMS', '2023-03-23 08:20:47', NULL, NULL, NULL, 1, 21, 'df08a9e0-77a5-4453-96c8-72878a045a46');
INSERT INTO "user"."customer" VALUES ('8db84dcd-f134-421e-aeb1-0b051c4afe74', 'Somalia@pamcargo.com', '$2y$10$3BFIajIDRQB5QJMFyQC4BOwopZPWQRdw0Z9PieCJHV5cNx3vgLgw6', '2023-03-23 08:32:32', NULL, NULL, NULL, 1, 21, '63132bea-fdf3-43d4-8062-9a6ecbbb02f2');
INSERT INTO "user"."customer" VALUES ('92cb7539-26a3-459b-b8df-c708b35df6f5', 'jepang@cargo.com', '$2y$10$eH.UsefNJGI69dssPCZ1NOlyxERnSqXN7.Nmh.gDxPuCgbBUgIANG', '2023-03-27 06:01:12', NULL, NULL, NULL, 1, 21, 'ba46a552-ac88-4d86-8cf0-86c146e8e0b2');
INSERT INTO "user"."customer" VALUES ('97508926-7c20-42eb-87c1-03ce50afbf37', 'fabioviandino@gmail.com', '$2y$10$X8M2JhuAvn7TiQykSmNEg.iAmR15YNbqCT4C6ou2HIGFzPPiD5Pzu', '2023-03-08 09:19:44', NULL, NULL, NULL, 1, 21, NULL);
INSERT INTO "user"."customer" VALUES ('98b32b83-ce04-4a5f-a548-7515cd2be50a', 'mediterran@shipping.com', '$2y$10$8YVSKrepFPmy/QG5.gPbZewpWXNaO4tFsrEh12e.Ih7lGxJX0lOhK', '2023-03-27 06:12:16', NULL, NULL, NULL, 1, 21, 'b4f0bc05-262f-4328-bb23-407ebabd8a2b');
INSERT INTO "user"."customer" VALUES ('9a1d4198-f760-4e99-8172-ab4b6f6eafbb', 'taiwan@cargo.com', '$2y$10$MYY3bM/xl4GmjazNAP4KGuKhWWl8RfS8yxbgkFuhSVGCym4ZGqGTi', '2023-03-27 06:11:49', NULL, NULL, NULL, 1, 21, 'ce28e9b1-ff39-4b4f-8dd3-3688ed44afa9');
INSERT INTO "user"."customer" VALUES ('9a783b8b-ee4e-4ba7-a3de-e7f062a2b644', 'tampang@gmail.com', '$2y$10$EpScZQ2um/pGuzTPR6Ydb.p0xfwjlJl2oyG.pDpEg/VATf3oPYARG', '2023-03-17 03:04:41', NULL, NULL, NULL, 1, 21, '3c573db8-2954-4649-ad31-8791ee9e5b8e');
INSERT INTO "user"."customer" VALUES ('a04a03cf-7df9-4a7c-a625-108a237b7934', 'elmo@pamcargo.com', '$2y$10$DkXoRIrPGHNISvtL8ZmjWer5JxlhEsEZqQaYRDUj4ihIpeEXCNjlC', '2023-04-18 02:34:36', NULL, NULL, NULL, 1, 21, 'cd3508b0-d8b1-4676-bc52-0f2cd7cf09f9');
INSERT INTO "user"."customer" VALUES ('a24972d3-2475-4a27-9f8e-5abd950ceaee', 'Greece@pamcargo.com', '$2y$10$ijaD4e6rDBXp2Pplyq98Uec.cwkpFEKQ3s3gdOO2V4UvMZ0m3uILm', '2023-03-23 08:16:48', NULL, NULL, NULL, 1, 21, '4be938aa-8641-4f0e-a612-4271d2774e0d');
INSERT INTO "user"."customer" VALUES ('a5ff12ca-83cc-45fb-bc05-298f182b36e7', 'Cameroon@pamcargo.com', '$2y$10$auRoeoyYhudZFXaiGscIC.ydP.HMHEXt7rUXwxBUQGnASc7cnpeea', '2023-03-23 08:34:59', NULL, NULL, NULL, 1, 21, '9f98d607-d64f-4029-84fb-e40a238b0af1');
INSERT INTO "user"."customer" VALUES ('a6f6aba1-75d6-4d25-bddd-1fff45029a08', 'garudaindo@gmail.com', '$2y$10$cgdxjfWiF/3.M72KF032b.fy9jp3KxDQhvmo9bviHgLtxr3wVn7o2', '2023-03-27 06:18:45', NULL, NULL, NULL, 1, 20, '69836f5d-4b21-4d58-9be1-6a5ef794c16d');
INSERT INTO "user"."customer" VALUES ('ad9d422b-a61a-48b4-8d41-527042ad4479', 'Botswana@pamcargo.com', '$2y$10$O4E153nZwl228sl1fpyy4.qoSyi6sbTqjdsqTUH8biIaZPM.Vawc6', '2023-03-23 08:38:10', NULL, NULL, NULL, 1, 21, '366c167b-84a2-44e6-8b13-ce1f09dc0f33');
INSERT INTO "user"."customer" VALUES ('aed08e0a-8f5b-462f-9a96-1095dfcfcfba', 'sysusagi@gmail.com', '$2y$10$9ZJnGjlZQLwSz80OP.7rYuoTCu.9QXU40pnhb5xKsOKy5ZRfR7Muy', '2023-03-08 12:36:27', NULL, NULL, NULL, 1, 20, '9c5c49b5-1b0f-47ae-ab2f-9c57fab14d02');
INSERT INTO "user"."customer" VALUES ('b35582b5-27a5-4173-91b2-0e1e6e6cb578', 'china@cargo.com', '$2y$10$zSp2RwQgc2IcsowfjGQFTulW2cpqAIH.qBTQxZFHUDDxtKvRkdQQ2', '2023-03-27 06:13:07', NULL, NULL, NULL, 1, 21, '9765da48-66ab-4047-9dff-0043dcd6884c');
INSERT INTO "user"."customer" VALUES ('b571d9bf-0358-4c4a-b810-8ac7717e9513', 'panama@cargo.com', '$2y$10$1bcDUhRrW9sr6fj7/Lz4LujDZNg5A7aBh9BUg9q0XiCU9MHqGf9ei', '2023-03-27 06:07:53', NULL, NULL, NULL, 1, 20, '0c4d5d41-c5ea-4433-bc0c-82bff1c51925');
INSERT INTO "user"."customer" VALUES ('b753ace5-5fe3-466a-bfd0-4edd82a8e087', 'Poland@pamcargo.com', '$2y$10$AD6PlDqOC5XqFFKCqM3chOSfflJ4txpCNQv5lABsWzY9J6j1KhJHa', '2023-03-23 08:28:51', NULL, NULL, NULL, 1, 21, 'c8162a9f-5c64-4a70-a863-740642ad0b1a');
INSERT INTO "user"."customer" VALUES ('c257f1d0-33ca-4779-bbdd-2b4874f509ec', 'italy@cargo.com', '$2y$10$P6p19arLpyASYKzbUOyWOe7XnMbTJ/8x9zFvzi63d58zmv96sw3hW', '2023-03-27 06:04:33', NULL, NULL, NULL, 1, 20, '3e3f58fe-92f1-445f-a8c9-4252424b124a');
INSERT INTO "user"."customer" VALUES ('c28452c7-dd14-4adb-b1f2-720360bf90da', 'bambangsutoyo@gmail.com', '$2y$10$FdMBs6N3kEkaIINNcurOIuTZkjRBmbbeLV1n4NuK3M.8osWoO1.9u', '2023-04-18 02:32:25', NULL, NULL, NULL, 1, 21, '575a5040-9c15-4392-ab52-ffe8007e431e');
INSERT INTO "user"."customer" VALUES ('c38d08a2-c423-4c2c-99c4-328e48492276', 'panama@cargo.com', '$2y$10$XVrBICBmaYwkBtdsgOU4w.bMn8qHDbLwRdol59Zc9dqz4yRQ8s8Ha', '2023-03-27 06:07:55', NULL, NULL, NULL, 1, 20, '0c4d5d41-c5ea-4433-bc0c-82bff1c51925');
INSERT INTO "user"."customer" VALUES ('c90bfcad-31f9-421d-8000-1717476cb9d7', 'cosco@shipping.com', '$2y$10$Y0kbo202iihfjRwj.j8FAOv2rr7aoVBn44VmR0l555JJ1.LomYiyW', '2023-03-27 06:10:33', NULL, NULL, NULL, 1, 21, 'ce28e9b1-ff39-4b4f-8dd3-3688ed44afa9');
INSERT INTO "user"."customer" VALUES ('c9f60b06-5d69-4e83-8335-89607a2596ef', 'Malawi@pamcargo.com', '$2y$10$Khxy0gexKiLrbAKhBbJGKe5nyGA8fUiuSdGZi3POjJdaEpYSRRPkm', '2023-03-23 08:31:24', NULL, NULL, NULL, 1, 21, '3dbb85f8-95f5-4c53-83da-422449a0e26d');
INSERT INTO "user"."customer" VALUES ('cad2d55c-a2a7-4f75-9270-744052da9d9c', 'tegarkurniawan3', '$2y$10$Y/jUaqoejHndrCf1x3SscuQ.za8K0unbJ2MLAIla4ZtjUvXSGi0ue', '2023-03-08 07:12:28', NULL, NULL, NULL, 1, 1, '5ea7b070-3f1f-4a09-91cb-e5cd96e93468');
INSERT INTO "user"."customer" VALUES ('d2b09618-3729-4e42-b313-4ba790a104a5', 'zidan@gmail.com', NULL, '2023-03-08 03:11:56', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO "user"."customer" VALUES ('d409016f-fda5-40c2-b550-4c4365d04f68', 'fabioviandino@gmail.com', '$2y$10$UsaG5dAilc7Ef0SL4wNnj.qe./uR0WuNfaU2xWe8azxelHwIhMOMG', '2023-03-08 09:22:31', NULL, NULL, NULL, 1, 21, NULL);
INSERT INTO "user"."customer" VALUES ('d781173e-ae35-4d4c-9e9f-22858e9f55b6', 'fabioviandino@gmail.com', '$2y$10$1.2Z5KKlN0uWS5YZpuD8V.CwDv/7PWP58E6lFQfdPCHOyeLYvX5Te', '2023-03-08 09:24:33', NULL, NULL, NULL, 1, 21, 'f759a18f-80ba-4ae3-b915-912f5c3b430e');
INSERT INTO "user"."customer" VALUES ('dff4d367-6f62-4434-a389-423b0e026022', 'Mangoon@pamcargo.com', '$2y$10$8TkKvZHddM.bF7LBghyIbOq5UuGsZvafWHm6uZnSaDR76joIkUyCO', '2023-04-18 02:30:53', NULL, NULL, NULL, 1, 21, '144763f4-016e-4532-bd33-b963a68b460f');
INSERT INTO "user"."customer" VALUES ('e1ad6496-5b7a-4eb1-a70c-320429551655', 'china@cargo.com', '$2y$10$5ZHcR4BxHy8eCleUU8j6yeop3wnyV/xL2SmLiA/iqyhMNaZFi6g7u', '2023-03-27 06:13:09', NULL, NULL, NULL, 1, 21, '9765da48-66ab-4047-9dff-0043dcd6884c');
INSERT INTO "user"."customer" VALUES ('e57a17c4-878d-4952-882f-c8dc6854eda9', 'bangladesh@pamcargo.com', '$2y$10$B27vQS.7zWt4ZbbiZn5eTughzKASf9u2w2q6uxfvyPonk/ZnZtcM2', '2023-08-19 10:07:41', 'bangladesh@pamcargo.com', NULL, NULL, 1, 26, 'e6b014c4-a528-47f8-b333-0ada42de29e4');
INSERT INTO "user"."customer" VALUES ('e9d32390-d1a1-4247-aede-b757deef86f7', 'bangladesh@pamcargo.com', '$2y$10$gcBSeSpE7Go9eRK3X4eEf.peBM2jVQ84WT3KQgIzqOIyxiHjlpzY6', '2023-08-10 10:26:06', 'bangladesh@pamcargo.com', NULL, NULL, 1, 26, 'f9a2c203-d6e3-4ec2-a914-bff3a1cf1851');
INSERT INTO "user"."customer" VALUES ('f651f787-d380-49b6-8842-7cfabb331155', 'import.operations@jack-wolfskin.com', '$2y$10$.TSxZJUSjZ8On.q8tm.KKukR6XEV08RDqKEjTQthPf5scOZHXFN62', '2023-07-30 08:34:36', NULL, NULL, NULL, 1, 20, '5afb5d68-5db4-47ad-8b8a-82220c99b7ee');
INSERT INTO "user"."customer" VALUES ('f774523e-1a93-453d-9f2b-3f2f37491f77', 'muhamadsechansyadat@gmail.com', '$2y$10$vGrLhnBeEtGQBnpVdTgdFOSego5dyfkHbklzT2C.i2QRkzLe7kAjK', '2023-03-08 03:55:23', NULL, NULL, NULL, 1, 20, NULL);
INSERT INTO "user"."customer" VALUES ('fb8975e2-cb1c-42c6-a092-0976b49b2a90', 'ADIRA@gmail.com', '$2y$10$SWqf47KfFLIe39iCkqO.euWQc1bkNg0Qh451E4BhcTsp7ohMQb3gO', '2023-07-31 04:20:54', NULL, NULL, NULL, 1, 26, '01ca4f03-cb4e-4736-9915-5b8219d6088a');
INSERT INTO "user"."customer" VALUES ('fe50fd6a-3c6c-4716-9e48-44d511373d74', 'exim@marvelsports-int.com', '$2y$10$2a/0TPXheiL42VRkVNaBoel3xgOp42SzJijBa93Z2MWbXX02CCx8y', '2023-07-30 08:29:37', NULL, NULL, NULL, 1, 21, 'b4664848-b1e9-4d01-876c-6517e593c2e1');

-- ----------------------------
-- Table structure for password_reset
-- ----------------------------
DROP TABLE IF EXISTS "user"."password_reset";
CREATE TABLE "user"."password_reset" (
  "id" int8 NOT NULL DEFAULT nextval('"user".password_reset_id_seq'::regclass),
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0),
  "expired_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_reset
-- ----------------------------
INSERT INTO "user"."password_reset" VALUES (1, 'adminit@gmail.com', 'fBwz3JbBwAAzTDHPhXaDcIWWKGhW4seqVJQkhfdzi3QW11NNjwU3iOBdYSW73ZQk', '2023-01-24 06:16:39', '2023-01-31 06:16:39', '2023-02-01 06:37:01');
INSERT INTO "user"."password_reset" VALUES (2, 'adminit@gmail.com', '42vGR4itS89wzJUpAmbKdyjWsS0XCF2KWISGPqUfBnTKFfzsd4AboIJf1uIf0g9i', '2023-01-24 06:29:32', '2023-01-31 06:29:32', '2023-02-01 06:37:01');
INSERT INTO "user"."password_reset" VALUES (3, 'adminit@gmail.com', 'ZQjpNXZLH7TnJI73Mnt00FUQdiA1CQIdXEB352bPCNwkCz4h7h9N40LZCNCnC4S4', '2023-01-24 07:11:39', '2023-01-31 07:11:39', '2023-02-01 06:37:01');
INSERT INTO "user"."password_reset" VALUES (4, 'adminit@gmail.com', 'ywhZmRwgUAQfq2fJ1Fx5ARFB6ZQSK81weWgNWNyVJ6J0mfA4BCUTqizHvVze8NgV', '2023-01-25 11:25:52', '2023-02-01 11:25:52', '2023-02-01 06:37:01');
INSERT INTO "user"."password_reset" VALUES (5, 'adminit@gmail.com', 'CI0rcsrDrl5BsacPGgHet0CHobSnuPzPvBlt4Y2HnSXLj84ZGTc1kO8xYOurniDd', '2023-02-01 06:36:42', '2023-02-08 06:36:42', '2023-02-01 06:37:01');
INSERT INTO "user"."password_reset" VALUES (6, 'jakarta@pamcargo.com', 'NEnM7e3at2K8ggYWy4jpmoOJMsrow0zqS107bWvVAtxMcXAhKcFVSpftfwkWo4Ns', '2023-02-13 08:08:15', '2023-02-20 08:08:15', NULL);
INSERT INTO "user"."password_reset" VALUES (7, 'jakarta@pamcargo.com', 'QXmRLNg6Ahbv1HtEEnfZDBSk78ZfnfQvUHiymA4M3x0fE75whbvNpKg1XhSAhO5f', '2023-03-01 09:05:57', '2023-03-08 09:05:57', NULL);
INSERT INTO "user"."password_reset" VALUES (8, 'thomas@pamcargo.com', 'r2WtMjsflT3XyQWtv2SmS2evQsUBhJj2XDvmzicZEzfLpmhVrTLgq4Ae4KOP26os', '2023-03-06 05:30:09', '2023-03-13 05:30:09', NULL);
INSERT INTO "user"."password_reset" VALUES (9, 'thomas@pamcargo.com', 'h4jnoVQCc8gkDZchlCQPE9qKmoOCzlhYjZtynlyWkMIlX4EIIv5RMEpk8RbGhQ00', '2023-03-06 07:01:52', '2023-03-13 07:01:52', NULL);
INSERT INTO "user"."password_reset" VALUES (10, 'thomas@pamcargo.com', '0sQs6iRKuLnGBCBECBR0lBZ94LGPfGrI5PG94fWL6xVdcEmRpjFJYjz5RsRwMAdQ', '2023-03-06 07:24:57', '2023-03-13 07:24:57', NULL);
INSERT INTO "user"."password_reset" VALUES (11, 'thomas@pamcargo.com', 'Mh39mmJzaWTSjBpjBokPN4YDWhAcsqFukj4k2lO3WjXMKsxrJ9bQKXIpHpxJAu2H', '2023-03-06 07:25:31', '2023-03-13 07:25:31', NULL);
INSERT INTO "user"."password_reset" VALUES (12, 'thomas@pamcargo.com', '9tBZD8SevdqLFQOnN9QIxiVoHQvkgnS6xWvLhE1Yug65FBkiEJsnC0IqmxUIjY5Q', '2023-03-08 04:25:57', '2023-03-15 04:25:57', NULL);
INSERT INTO "user"."password_reset" VALUES (13, 'muhamadsechansyadat@gmail.com', '2OoIJlc4dlskxLfkbYau5Rug4AqVvAm9t5sOF6zATAhedhgaX0PH674yAV5AMorg', '2023-03-08 04:58:14', '2023-03-15 04:58:14', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (14, 'muhamadsechansyadat@gmail.com', 'Qdqid4fnWx5Jb7Nz84GcqtZgKdY2FfpdiK0MvECCuenLcYWjLBXID47NQQNjMczU', '2023-03-08 07:02:29', '2023-03-15 07:02:29', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (15, 'fabioichsan7@gmail.com', '8anXwK5rsS6E5pTpZ7ZNHx8XX77MZVKFdkOA7DDoESf7KBGKfr1jph0XnQWqveZw', '2023-03-20 06:38:42', '2023-03-27 06:38:42', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (16, 'fabioichsan7@gmail.com', 'TEqxz35qBGT5xO5eVv2x6aujErDfFpT7D96Xq44QR7ziN4l3XlhQ5O1ZKItiqVy9', '2023-03-20 07:03:37', '2023-03-27 07:03:37', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (17, 'fabioichsan7@gmail.com', 'cmBmQyZ47tXj2EXVEltVklNf2aKQjoR6nmF0aDYgwFQ6QFH5GoUqA0tnyiYcgBWq', '2023-03-20 07:05:26', '2023-03-27 07:05:26', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (18, 'fabioichsan7@gmail.com', 'oZaLYe6RU1yHGYgcgrpPHRrnMkxfLHi2Ng87Gl0xlhVVWkNpjOjeXhs1mEFGWdkL', '2023-03-20 07:12:43', '2023-03-27 07:12:43', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (19, 'fabioichsan7@gmail.com', 'LBpHBNlnNeE55M6DDEqSqtkEB4cYTntfRtSf8AFbWLrB9UvsTyRQPi5kJQgRmrqM', '2023-03-20 07:13:25', '2023-03-27 07:13:25', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (20, 'fabioichsan7@gmail.com', 'qydVtDNWyxqrlYHXsdcOVBnvz0LgP0glMBeqRgKUi32ajtr4YUgjE2bqIvnVp1uD', '2023-03-20 07:15:46', '2023-03-27 07:15:46', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (21, 'fabioichsan7@gmail.com', 'CkKhqPTDvd8YBnQVJjBjJC1pTP65F0AXOKINo0UJVSDKFWBLNfGuRhuV0rIZEgLe', '2023-03-20 07:16:34', '2023-03-27 07:16:34', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (22, 'fabioichsan7@gmail.com', 'HXWBAa82uVeyPsPZqRmEKRV7h3C7ULWLgfP4siEKkTuTQRe3KXJFX2LTiT5OMJQi', '2023-03-20 07:17:15', '2023-03-27 07:17:15', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (23, 'fabioichsan7@gmail.com', 'kKuBW1VNxOqWSsZeyT25rjglC3Wn5b4R7II6qyyxmaCKRXxgELyPRgLKnQpGJoRp', '2023-03-20 07:18:51', '2023-03-27 07:18:51', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (24, 'fabioichsan7@gmail.com', 'Ekb0qnNb1vDl6RJ8OQrcOdeSlaSezNb6fAlVZOYVKhio9XL8OzqpAFj7f6MLIybA', '2023-03-20 07:24:24', '2023-03-27 07:24:24', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (25, 'fabioichsan7@gmail.com', 'Nn5MmsK7C1WiXmiGIMPkV0v4J2bzIe2OHueu6KPm2cw06AmiV3S5PMo3uyeFov4N', '2023-03-20 07:25:50', '2023-03-27 07:25:50', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (26, 'fabioichsan7@gmail.com', 'Wx5clLwu1bdwRXTy5FvTVgVcBmOLubrQ7S8bFE794g594qCJoQDUAj6ncwDMt0gA', '2023-03-20 07:28:18', '2023-03-27 07:28:18', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (27, 'fabioichsan7@gmail.com', 'BP9jY2xrfEXh5alCQAaLSRAZSoj4oZ41qrek2fAPbw9VDe7UjgGDNYzbgyXfqoym', '2023-03-20 07:31:56', '2023-03-27 07:31:56', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (28, 'fabioichsan7@gmail.com', 'xhlcWoKorZfJpwjXPqOkA6bV5PwRyr2c4Gr0A6aLG3bojsuYL1LMZxL6lGTZcd2Z', '2023-03-20 07:35:16', '2023-03-27 07:35:16', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (29, 'fabioichsan7@gmail.com', 'Ku8SgNemih724kR1MdNTsFwLyvtVfKouPWjLH90axD8bWzolLVH2SiiPxrRjOG6a', '2023-03-20 07:40:42', '2023-03-27 07:40:42', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (30, 'fabioichsan7@gmail.com', 'tyfh05AlPcP6HnXdCnQ5jYirAN1eyHvURBd2uOSLPk9U1OJNJHmIox8EveXGnUMe', '2023-03-20 07:54:25', '2023-03-27 07:54:25', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (31, 'fabioichsan7@gmail.com', 'kq4NoprxALpoGBbHZ9hitdfmK1uZN3PQZ5WiHSko4EX3jbXD7lH0Ur5D4SxF6oUv', '2023-03-21 03:14:04', '2023-03-28 03:14:04', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (32, 'fabioichsan7@gmail.com', 'g2FNkH8LpVVa1fk2sduDrIUSeOb2kPhJBgoJGsCA1uuDfm0RrzFN0RY8LKpcceGE', '2023-03-21 04:52:25', '2023-03-28 04:52:25', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (33, 'adeyusuf005@gmail.com', 'ytCmwQkTVNtXJ91NkaENuIDMZu0btl2drMwiAhMkgcCYqAZkCBN8Qkzf2QF0OoLx', '2023-03-21 07:13:50', '2023-03-28 07:13:50', NULL);
INSERT INTO "user"."password_reset" VALUES (34, 'testinginfina@gmail.com', 'mnV2AySY2DnhNthZ9XQq1HF6uDdBabpNwzhmuXwny9YPjktrvCo9WwkeSPoaCzi0', '2023-03-21 10:07:02', '2023-03-28 10:07:02', '2023-03-21 10:07:50');
INSERT INTO "user"."password_reset" VALUES (35, 'muhamadsechansyadat@gmail.com', 'ZNIYGPIc2Uce6TuDXDr9n9vfUeYSc61ptydcpsEeFNm6g21b6IGdtAYPOOPfivYj', '2023-05-10 06:40:25', '2023-05-17 06:40:25', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (36, 'muhamadsechansyadat@gmail.com', 'ONA1WS3i0kfSOfod5NVXnz1tkUuVVQOG31TbxZm07vZXAfQyIcD2JH9b2zpPa0mk', '2023-05-10 06:44:34', '2023-05-17 06:44:34', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (37, 'muhamadsechansyadat@gmail.com', 'qbpjAKdW47vHcaC4lod9S3O0VLiVuskaY5FV9lAR70iXj4w9JEo6eXAVNt4QQ8bA', '2023-05-10 06:47:47', '2023-05-17 06:47:47', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (38, 'muhamadsechansyadat@gmail.com', 'TagoySE3zdDOVZtwQ79dQ3t5EKATzQhI2v1RqBet0WW1rN3phQ7FlUlb4IQrKr6e', '2023-05-10 07:01:37', '2023-05-17 07:01:37', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (39, 'muhamadsechansyadat@gmail.com', '8yxh2IpRFb8bJhnj3LImWEyIqzbmUgOVQpzGZJpgoAw0YDpoj3r1nnai6jZi0SdG', '2023-05-10 07:11:09', '2023-05-17 07:11:09', '2023-05-10 07:11:45');
INSERT INTO "user"."password_reset" VALUES (40, 'fabioichsan7@gmail.com', 'BshnIWd3nCk35i8XLjrFGP9VlbCfsxTSvsuaVduXMcCOdWQt04C321rY7BgCmRFX', '2023-05-10 07:13:43', '2023-05-17 07:13:43', '2023-05-10 07:14:25');
INSERT INTO "user"."password_reset" VALUES (41, 'shankwan@pamcargo.com', 'wSlH2RmcHHSi8ijeKw1RqyJenMYByz4Bg9A2Xb76yvYMA4NIZ9yCC6TjFdZprRmS', '2023-05-18 05:08:50', '2023-05-25 05:08:50', '2023-05-18 05:09:53');
INSERT INTO "user"."password_reset" VALUES (42, 'myanmar@pamcargo.com', 'BggmFVVr8ZRmjP84MZMSOlj2MhpcZ6PlQdlWhtQUarEobZCE1jkf21SkOQpmf5sz', '2023-06-05 03:30:44', '2023-06-12 03:30:44', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "user"."role";
CREATE TABLE "user"."role" (
  "role_id" int4 NOT NULL DEFAULT nextval('"user".role_role_id_seq'::regclass),
  "role_name" varchar(100) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "date_created" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_modified" timestamp(0),
  "modified_by" varchar(255) COLLATE "pg_catalog"."default",
  "status" int4 NOT NULL DEFAULT 1
)
;
COMMENT ON COLUMN "user"."role"."status" IS '1. active 2. inactive 3. deleted';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "user"."role" VALUES (14, 'Super Admin', 'Super Admin Description', '2023-01-24 02:13:45', NULL, '2023-04-14 04:03:11', NULL, 1);
INSERT INTO "user"."role" VALUES (16, 'Origin', 'role origin', '2023-01-24 05:43:26', '5ea7b070-3f1f-4a09-91cb-e5cd96e93468', '2023-02-17 09:24:27', NULL, 1);
INSERT INTO "user"."role" VALUES (17, 'DXB Staff', 'Dubai Head office Staff', '2023-01-25 08:21:28', NULL, '2023-02-16 09:10:09', NULL, 1);
INSERT INTO "user"."role" VALUES (18, 'DXB Manager', 'Dubai Opreation Staff', '2023-01-25 08:22:06', NULL, '2023-02-16 03:54:52', NULL, 1);
INSERT INTO "user"."role" VALUES (19, 'Agen', 'Agen PAM Offices', '2023-01-25 08:24:06', NULL, '2023-02-17 09:24:19', NULL, 1);
INSERT INTO "user"."role" VALUES (20, 'Consignee', 'Consignee / Customer PAM', '2023-01-25 08:24:24', NULL, '2023-03-17 03:48:24', NULL, 1);
INSERT INTO "user"."role" VALUES (21, 'Shipper', 'Shipper', '2023-01-25 08:24:37', NULL, '2023-02-17 09:42:17', NULL, 1);
INSERT INTO "user"."role" VALUES (25, 'DXB Executive', 'Dubai Boss', '2023-05-23 08:59:15', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (15, 'DXB Supervisor', 'DUBAI', '2023-09-19 04:04:17', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (27, 'Destination Agent', NULL, '2023-10-31 06:48:20', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (28, 'Sales Offices', NULL, '2023-10-31 06:48:25', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (29, 'Sales', NULL, '2023-11-13 11:21:36', NULL, '2023-11-13 11:21:51', NULL, 1);
INSERT INTO "user"."role" VALUES (30, 'Executive', NULL, '2023-11-29 02:50:38', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (26, 'Group Customer', NULL, '2023-07-30 09:07:01', NULL, NULL, NULL, 1);
INSERT INTO "user"."role" VALUES (31, 'Operation', NULL, '2024-06-05 14:55:25', NULL, NULL, NULL, 1);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "user"."password_reset_id_seq"
OWNED BY "user"."password_reset"."id";
SELECT setval('"user"."password_reset_id_seq"', 36, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "user"."role_role_id_seq"
OWNED BY "user"."role"."role_id";
SELECT setval('"user"."role_role_id_seq"', 26, true);

-- ----------------------------
-- Primary Key structure for table account
-- ----------------------------
ALTER TABLE "user"."account" ADD CONSTRAINT "account_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "user"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table password_reset
-- ----------------------------
ALTER TABLE "user"."password_reset" ADD CONSTRAINT "password_reset_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "user"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Foreign Keys structure for table account
-- ----------------------------
ALTER TABLE "user"."account" ADD CONSTRAINT "user_account_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "user"."role" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
