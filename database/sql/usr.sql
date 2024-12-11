/*
 Navicat Premium Dump SQL

 Source Server         : Dev-203.175.10.178
 Source Server Type    : PostgreSQL
 Source Server Version : 140012 (140012)
 Source Host           : 203.175.10.178:2408
 Source Catalog        : pds-pam
 Source Schema         : usr

 Target Server Type    : PostgreSQL
 Target Server Version : 140012 (140012)
 File Encoding         : 65001

 Date: 09/12/2024 18:37:03
*/


-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "usr"."model_has_permissions";
CREATE TABLE "usr"."model_has_permissions" (
  "permission_id" uuid NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
INSERT INTO "usr"."model_has_permissions" VALUES ('636dfacd-6930-48bf-acc8-8cd8cb21fbfc', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('e223aae2-f864-41ae-bc42-0e2e4e56591d', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('557439ed-8b9a-43a0-9ba4-ac92c47d4c69', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('638e0106-b1be-4c90-88c2-dd02b03bc48d', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('1fb66e0a-1efe-4eea-8436-ace7da85dbb5', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('d9028fe3-499f-4b03-96fd-85929ec71cbd', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('7a5d159e-9918-4d8a-8bf1-083a039f894b', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('ef6f02a7-b57f-42ad-ba4b-bba9b2a99718', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('b9cc8cbd-3dae-4af1-a8d9-456ebec7d954', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('c44b9b73-7f0b-464f-b191-126eb684838b', 'App\Models\Usr\Role', 'c491418e-ccf6-4259-9e4a-377b1f59c01b');
INSERT INTO "usr"."model_has_permissions" VALUES ('636dfacd-6930-48bf-acc8-8cd8cb21fbfc', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('e223aae2-f864-41ae-bc42-0e2e4e56591d', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('557439ed-8b9a-43a0-9ba4-ac92c47d4c69', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('638e0106-b1be-4c90-88c2-dd02b03bc48d', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1fb66e0a-1efe-4eea-8436-ace7da85dbb5', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d9028fe3-499f-4b03-96fd-85929ec71cbd', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('7a5d159e-9918-4d8a-8bf1-083a039f894b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('ef6f02a7-b57f-42ad-ba4b-bba9b2a99718', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('b9cc8cbd-3dae-4af1-a8d9-456ebec7d954', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('c44b9b73-7f0b-464f-b191-126eb684838b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1725bb61-4900-450e-86ad-ec7c51ec2f59', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('9c747662-75ae-4a19-9637-4ce72eca952d', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('ccc5e872-cb2a-44cb-b894-055a5d24571b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d9863fe4-b915-4b7d-8adc-ca1e4e8fe2ec', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('f0fe157b-c50f-45df-97c2-24b1126fa956', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d4f769cc-087f-490e-8aa2-862342ddb9e5', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1c287165-0900-4e29-975b-2fd44f61193f', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('763588c6-5a3b-4237-8adc-a152a227537a', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7df0252-4baf-448b-8d80-f9d118dbe489', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('bcf43197-c6ec-4fb2-9389-374970f4310c', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('f8e5f231-0a55-4b65-8557-666e9082385b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('53d5c22d-e0b7-446b-9194-abb1e1385cf6', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('6ef6ec88-dc30-489f-8e98-39b70e2bb036', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('205d37c9-35ba-47cf-b28f-8aecb928ec41', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('eed3f093-6f18-4d6e-9fd8-0fc0273d9365', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('04c4f53d-23f2-4a4f-94c2-c12dfc0abab9', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4afdb74-2e35-40be-89d7-eb739bfeacb7', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('4218c098-e480-44f1-9b04-1ca598b9dad9', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('564699da-7175-4e7f-8e14-b6a808b99953', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('7383c41f-ccdf-4bb9-911b-01a3aa1ca36c', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('b07bffec-9aed-4c9b-a63b-7632448d0310', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('f3a44d56-36a2-4f46-86ac-d28d00e885e5', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('b52a298b-1e9d-4e0a-aade-41bcd888695f', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('bb43ff12-eb48-44f7-aed5-46174a4233a8', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('34067bf7-f06b-4403-8278-39429217f0b0', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('de6d528e-dd39-44c2-be92-2151b6145027', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('be88b3d6-6336-4a54-b657-c4c53151f93a', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('46e6ad39-7f44-4794-af88-a9eb0ea85f77', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('8935a27c-1f43-4bd4-99aa-0b8a319de225', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('0270a351-1220-4521-933d-264b304aac2d', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d39efb8b-c8c5-4681-adc2-cc0bb3fd89f6', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfd316e2-741b-4eb9-9673-e13e224ff575', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('264eef15-ac7c-4ff1-8f94-874cedf33e98', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('76fc09a1-225a-4ffc-a6f6-aed8cbd7b25a', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('88a1048e-1a07-47be-bf71-59efce31bc2b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('0073f412-2994-4ce5-9488-03cc6e9ae165', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('e1b5ba14-7df5-4335-aaa2-28993d338e13', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('8bb0940b-0e1b-4252-8e64-ff6edfbeb4a6', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1d35d16d-31f2-4ac5-ba60-b584e37fd426', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('64c8d99b-cdf8-47bc-a94c-f1e048a4cc0e', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('6a2c8714-4d5a-4d5a-ae91-8586322a2521', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a6171c3-5ae5-4a68-b2e1-6b4281626743', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('8cc7744c-cf56-4c5c-8352-0505af4aacad', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('b2a9785d-2493-45e0-a731-675e783da9e0', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('975947e1-c2c4-4f31-ad0a-7fb19517f5e2', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('e186c5d2-15b3-4b1e-963c-4a34c643ebcf', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('07007972-b92c-453b-9b1e-225cc2c4cd63', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('c6e94243-2707-4ea0-996b-470168141735', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('ee8510de-5785-48e5-9765-b8db30598c90', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('07ad0ccf-182b-489f-a268-2abd0931dcc1', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('9106fdcf-4e47-450e-bb64-0735b7482a3b', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('dba5b80c-f2f1-49f7-9ab2-5a5f7c395be0', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('d4db6451-1572-424e-ad65-db99eaf24903', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d26ad5c-2282-4405-a850-ed0ab6010955', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('b2cd61ee-82e9-4858-b7dd-2d65931807da', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('397c6290-c0dd-4772-9830-ebc1d5022102', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1fdc7486-8819-49c0-adab-940aca5f87d7', 'App\Models\Usr\Role', '6f4a96fb-29b7-413a-b76a-a97b3f98a243');
INSERT INTO "usr"."model_has_permissions" VALUES ('1725bb61-4900-450e-86ad-ec7c51ec2f59', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('9c747662-75ae-4a19-9637-4ce72eca952d', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('ccc5e872-cb2a-44cb-b894-055a5d24571b', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('d9863fe4-b915-4b7d-8adc-ca1e4e8fe2ec', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('f0fe157b-c50f-45df-97c2-24b1126fa956', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('d4f769cc-087f-490e-8aa2-862342ddb9e5', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('1c287165-0900-4e29-975b-2fd44f61193f', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('763588c6-5a3b-4237-8adc-a152a227537a', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7df0252-4baf-448b-8d80-f9d118dbe489', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('bcf43197-c6ec-4fb2-9389-374970f4310c', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('f8e5f231-0a55-4b65-8557-666e9082385b', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('53d5c22d-e0b7-446b-9194-abb1e1385cf6', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('6ef6ec88-dc30-489f-8e98-39b70e2bb036', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('205d37c9-35ba-47cf-b28f-8aecb928ec41', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('eed3f093-6f18-4d6e-9fd8-0fc0273d9365', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('04c4f53d-23f2-4a4f-94c2-c12dfc0abab9', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4afdb74-2e35-40be-89d7-eb739bfeacb7', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('4218c098-e480-44f1-9b04-1ca598b9dad9', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('564699da-7175-4e7f-8e14-b6a808b99953', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('7383c41f-ccdf-4bb9-911b-01a3aa1ca36c', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('b07bffec-9aed-4c9b-a63b-7632448d0310', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('f3a44d56-36a2-4f46-86ac-d28d00e885e5', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('b52a298b-1e9d-4e0a-aade-41bcd888695f', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('bb43ff12-eb48-44f7-aed5-46174a4233a8', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('34067bf7-f06b-4403-8278-39429217f0b0', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('de6d528e-dd39-44c2-be92-2151b6145027', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('be88b3d6-6336-4a54-b657-c4c53151f93a', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('46e6ad39-7f44-4794-af88-a9eb0ea85f77', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('8935a27c-1f43-4bd4-99aa-0b8a319de225', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('0270a351-1220-4521-933d-264b304aac2d', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('d39efb8b-c8c5-4681-adc2-cc0bb3fd89f6', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfd316e2-741b-4eb9-9673-e13e224ff575', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('264eef15-ac7c-4ff1-8f94-874cedf33e98', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('76fc09a1-225a-4ffc-a6f6-aed8cbd7b25a', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('88a1048e-1a07-47be-bf71-59efce31bc2b', 'App\Models\Usr\Role', 'd1edfc16-6abe-492f-9ecf-61c76202e2c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('0073f412-2994-4ce5-9488-03cc6e9ae165', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('e1b5ba14-7df5-4335-aaa2-28993d338e13', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('8bb0940b-0e1b-4252-8e64-ff6edfbeb4a6', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('1d35d16d-31f2-4ac5-ba60-b584e37fd426', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('64c8d99b-cdf8-47bc-a94c-f1e048a4cc0e', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('6a2c8714-4d5a-4d5a-ae91-8586322a2521', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a6171c3-5ae5-4a68-b2e1-6b4281626743', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('8cc7744c-cf56-4c5c-8352-0505af4aacad', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b2a9785d-2493-45e0-a731-675e783da9e0', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('975947e1-c2c4-4f31-ad0a-7fb19517f5e2', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('e186c5d2-15b3-4b1e-963c-4a34c643ebcf', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('07007972-b92c-453b-9b1e-225cc2c4cd63', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('c6e94243-2707-4ea0-996b-470168141735', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('ee8510de-5785-48e5-9765-b8db30598c90', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('07ad0ccf-182b-489f-a268-2abd0931dcc1', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('9106fdcf-4e47-450e-bb64-0735b7482a3b', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('dba5b80c-f2f1-49f7-9ab2-5a5f7c395be0', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('d4db6451-1572-424e-ad65-db99eaf24903', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d26ad5c-2282-4405-a850-ed0ab6010955', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b2cd61ee-82e9-4858-b7dd-2d65931807da', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('397c6290-c0dd-4772-9830-ebc1d5022102', 'App\Models\Usr\Role', '74b0fb83-8794-42be-938a-b05652f8969f');
INSERT INTO "usr"."model_has_permissions" VALUES ('a4556d66-d6b2-416e-a537-aa47b7a4480e', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('0a0ba289-1f92-42e6-b42c-fe135fd92c69', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('b53e3bb8-9ddb-4a20-aa1a-c73320b39135', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('31acfce2-ad78-43d8-8988-825e80446c28', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('2b2e1f40-c7c9-462b-91dc-cb7ed6c46199', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('6806fc1b-65de-4d42-8954-93ad75d2ad5b', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('c1071750-d84e-40e9-9a3e-83c1ec8ad125', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('95eabcbe-66be-4f08-b08b-436c54e0db18', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('c6eaf6b7-a0ef-4718-9744-32bc48f50f84', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('b9aaf430-d016-4bf2-9ccd-75cd03dba166', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('c70fed7d-b850-4403-8a7f-d671c9cbdf4f', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('4c0da314-4379-4db0-8b31-393f601f0230', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('42822ba0-6f40-4ca6-a869-fd78cb1d3429', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('83f70b3c-e529-419c-ab41-286ee4041ff8', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('103c8d8a-7163-43d2-abcf-d584c5f9adc4', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('07b4ff2e-b776-4e7d-8203-2383843645c1', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('1aee7f96-5b67-4949-af8b-dfe294fe442b', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('36dbb932-f66a-4302-aa21-8862f0a96aee', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('3cae3818-f6b2-48e1-98d1-d1332b1b2a2b', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a3db49d-8fd1-4e2d-accd-02ebb8cde9d6', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('16d745a9-b4e8-48f8-8f7f-8ef423a7b305', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('10df5a29-d8b6-4b24-ab9f-f79f54045091', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('381d659a-d387-41ef-b83c-1325da547539', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('c0c10f35-837c-4c8a-8ea3-d2154ef45c96', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('bef8f233-ffd3-4068-9e19-493ee3b1e012', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a68bb0c-1749-4174-9a9a-95a5e2333f3b', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('ec0f7a8a-b0f1-40f6-84b8-d8454bb915ae', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('b4de10db-b332-4011-b57a-d9a17cd6bf47', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('7949b024-91f1-431a-8ea6-88161e4abee8', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('86f88690-1967-48ca-b1f8-31c94bdbc549', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f5d87a5c-4b68-4892-aba1-adbae64b831c', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('21cde5e9-184d-4881-8644-8ae20fae4400', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('baae9561-e439-4751-8e55-f1c97718ad50', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('7190eb88-9af9-40cf-98e3-f454ed1cbb1e', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('abb57f00-0958-4992-9929-76bf75deae88', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('28bd2efa-0fcf-4f02-9dc7-06515eb34017', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('df0c8840-5eb8-4969-b12b-ec701660cab5', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('2ca027fe-9982-4cba-b757-22f078f91699', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('0803aff5-650b-4ab7-9c8f-6edee76514f5', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f7a0e8be-b48f-4684-8e3b-05fa2bc97ba6', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('21635964-82f7-4125-9d6a-22d96d87e1a6', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('66a730dc-42f2-4660-bafd-8b2ae36d7874', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('23f0c574-97ab-42cc-8f21-96d84338a468', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('15518487-9f08-4795-a868-878195c38074', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('20a74462-2797-47fe-9f4a-a8d428eb6292', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('3f73a4f1-19de-42fb-a826-2e6bd9b2ec19', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('d04dedfe-e340-426a-8393-bb1c6577b760', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('045aac70-7e41-4364-90d2-200b0fb55278', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('93fa5e24-3ad4-4a98-abb1-407591d1bdb5', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('6fd93a0f-1d4e-48a4-ab13-53e1a7cd3e47', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('6d923f06-fc3c-407c-92b6-e2f4c2fd1c0a', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('835370b5-926c-4a3c-b3e4-3cbef68fefe0', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a64f15fd-59b6-407e-9072-2b12b09e74ea', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('68d65b51-1c99-42e5-b12c-9b7070a706db', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f6b77c63-d70e-49ca-846f-e21905668947', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f47fa6c6-de69-435b-b256-aa0d8b11e06e', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a810d826-0b07-44dc-b816-27e961300266', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a19340e5-64e0-4aa2-97e1-30df585e5e81', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('139669eb-7ba3-4349-8893-1347493085f0', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a70f2e97-2e50-4eb4-99c6-a692f261ed52', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('85385d2c-59a5-4c88-ba27-551b9a0d98c2', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('aba49425-8c5c-4849-b30a-9fc97800d68d', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f6b7726f-abf3-429a-8c39-f11024ec3949', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('3088c8fb-a79d-4ec9-845a-f58371a58975', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('b14a4f05-24aa-4bd6-b12e-d73b47b3e700', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('bab668e2-359d-46c7-99ab-7082f18a9ee4', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('8017d28d-af63-4f39-b9d7-702c604906e2', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('8429be74-d97a-4241-a878-ffb8d42b3fdb', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('11344ad8-2628-425a-b4aa-41828977c4f7', 'App\Models\Usr\Role', '16f14016-7054-4d6a-ac66-f0c98dc30bc9');
INSERT INTO "usr"."model_has_permissions" VALUES ('c70fed7d-b850-4403-8a7f-d671c9cbdf4f', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('4c0da314-4379-4db0-8b31-393f601f0230', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('42822ba0-6f40-4ca6-a869-fd78cb1d3429', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('83f70b3c-e529-419c-ab41-286ee4041ff8', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('103c8d8a-7163-43d2-abcf-d584c5f9adc4', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('07b4ff2e-b776-4e7d-8203-2383843645c1', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('1aee7f96-5b67-4949-af8b-dfe294fe442b', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('36dbb932-f66a-4302-aa21-8862f0a96aee', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('3cae3818-f6b2-48e1-98d1-d1332b1b2a2b', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a3db49d-8fd1-4e2d-accd-02ebb8cde9d6', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('16d745a9-b4e8-48f8-8f7f-8ef423a7b305', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('10df5a29-d8b6-4b24-ab9f-f79f54045091', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('381d659a-d387-41ef-b83c-1325da547539', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('c0c10f35-837c-4c8a-8ea3-d2154ef45c96', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('bef8f233-ffd3-4068-9e19-493ee3b1e012', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a68bb0c-1749-4174-9a9a-95a5e2333f3b', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('ec0f7a8a-b0f1-40f6-84b8-d8454bb915ae', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('b4de10db-b332-4011-b57a-d9a17cd6bf47', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('7949b024-91f1-431a-8ea6-88161e4abee8', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('86f88690-1967-48ca-b1f8-31c94bdbc549', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('f5d87a5c-4b68-4892-aba1-adbae64b831c', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('21cde5e9-184d-4881-8644-8ae20fae4400', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('baae9561-e439-4751-8e55-f1c97718ad50', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('7190eb88-9af9-40cf-98e3-f454ed1cbb1e', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('abb57f00-0958-4992-9929-76bf75deae88', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('28bd2efa-0fcf-4f02-9dc7-06515eb34017', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('df0c8840-5eb8-4969-b12b-ec701660cab5', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('2ca027fe-9982-4cba-b757-22f078f91699', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('0803aff5-650b-4ab7-9c8f-6edee76514f5', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('f7a0e8be-b48f-4684-8e3b-05fa2bc97ba6', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('21635964-82f7-4125-9d6a-22d96d87e1a6', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('66a730dc-42f2-4660-bafd-8b2ae36d7874', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('23f0c574-97ab-42cc-8f21-96d84338a468', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('15518487-9f08-4795-a868-878195c38074', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('20a74462-2797-47fe-9f4a-a8d428eb6292', 'App\Models\Usr\Role', 'c4468288-bbc9-4fbf-8212-d02565b183a1');
INSERT INTO "usr"."model_has_permissions" VALUES ('3f73a4f1-19de-42fb-a826-2e6bd9b2ec19', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('d04dedfe-e340-426a-8393-bb1c6577b760', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('045aac70-7e41-4364-90d2-200b0fb55278', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('93fa5e24-3ad4-4a98-abb1-407591d1bdb5', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('6fd93a0f-1d4e-48a4-ab13-53e1a7cd3e47', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('6d923f06-fc3c-407c-92b6-e2f4c2fd1c0a', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('835370b5-926c-4a3c-b3e4-3cbef68fefe0', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('a64f15fd-59b6-407e-9072-2b12b09e74ea', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('68d65b51-1c99-42e5-b12c-9b7070a706db', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('f6b77c63-d70e-49ca-846f-e21905668947', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('f47fa6c6-de69-435b-b256-aa0d8b11e06e', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('a810d826-0b07-44dc-b816-27e961300266', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('a19340e5-64e0-4aa2-97e1-30df585e5e81', 'App\Models\Usr\Role', '7074024c-247f-4b2a-984a-4a210de2f580');
INSERT INTO "usr"."model_has_permissions" VALUES ('139669eb-7ba3-4349-8893-1347493085f0', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a70f2e97-2e50-4eb4-99c6-a692f261ed52', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('85385d2c-59a5-4c88-ba27-551b9a0d98c2', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('aba49425-8c5c-4849-b30a-9fc97800d68d', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('f6b7726f-abf3-429a-8c39-f11024ec3949', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('3088c8fb-a79d-4ec9-845a-f58371a58975', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('b14a4f05-24aa-4bd6-b12e-d73b47b3e700', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('bab668e2-359d-46c7-99ab-7082f18a9ee4', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('8017d28d-af63-4f39-b9d7-702c604906e2', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('8429be74-d97a-4241-a878-ffb8d42b3fdb', 'App\Models\Usr\Role', '64148adb-cb9f-45ec-a3bb-5e12c77703a9');
INSERT INTO "usr"."model_has_permissions" VALUES ('a4556d66-d6b2-416e-a537-aa47b7a4480e', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('0a0ba289-1f92-42e6-b42c-fe135fd92c69', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('b53e3bb8-9ddb-4a20-aa1a-c73320b39135', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('31acfce2-ad78-43d8-8988-825e80446c28', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('2b2e1f40-c7c9-462b-91dc-cb7ed6c46199', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('6806fc1b-65de-4d42-8954-93ad75d2ad5b', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('c1071750-d84e-40e9-9a3e-83c1ec8ad125', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('95eabcbe-66be-4f08-b08b-436c54e0db18', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('c6eaf6b7-a0ef-4718-9744-32bc48f50f84', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('b9aaf430-d016-4bf2-9ccd-75cd03dba166', 'App\Models\Usr\Role', '0a326325-d669-4556-8ba6-6d7a96db858a');
INSERT INTO "usr"."model_has_permissions" VALUES ('34004539-a594-4417-8a8a-1f836e39d45f', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('d3f90ce4-5ec5-4614-bd9a-642af394f50c', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('96dfbcba-4d35-408d-a89a-18173e2227ad', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('8c59026f-6a86-4b80-9d33-757eddb00c39', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('45a838f9-c27a-4519-8a30-21fe76b10dc0', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('20d2dc42-7baa-4565-b8f1-9a9c07046464', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5b07e558-ebb9-4e0a-8cf1-921cd3892c6b', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('570d5bf5-af51-40c2-9138-a87ce5b9d654', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('35bccd28-bd73-4e4b-ab74-ca669e876305', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('49bc1739-3923-4a5d-8a2d-0a99b300bf6d', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5011b921-7616-4603-a7d1-14857d2ec472', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('4c74753d-101d-4a3d-9b3d-0f070f8799fe', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('1b750360-bbfd-4ac4-ba09-09f6f2bfe79a', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('7542902d-0d87-4b8a-9e1f-4cb4678d88ed', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('bc78a002-a4e7-420d-83be-85e1654f739b', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('fd6d3e00-157a-4bae-bb58-c5c72c611a0b', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4976a7e-352c-43fd-8cde-4ab77e7a01e6', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('d67b3089-7f35-4510-bd37-70cbd3239d61', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('708672d9-1db9-423b-b7e5-df55ed87dd1a', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e85dc65-1aa8-4f52-8e7a-4b91a690524d', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('9601d5ea-6952-4f63-98ed-6c06dfd05d93', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('364ced52-4c1c-4a74-bb3f-2636fd45eca6', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b27fa03d-fb22-4329-a39e-e5b8e8c4e3ff', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('c2ce94cc-a04d-424e-9041-4eb8dd81a53f', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a98f0ee-383c-481d-abdd-a27b5d1da2a8', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5616ce80-9d39-4ae9-a8be-f043b0cacee1', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('ef79c6e9-4701-4790-b554-2fca7297e97e', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b3752950-0604-4dca-a666-c34c76956bbb', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('dcd2785e-b207-4580-808f-b0f2c7521014', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('f93c6178-c8ac-4b29-b7f5-3cf030cb9096', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('7d6162ce-c46d-4b8e-b1ea-107fdd26b484', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('538a5e2b-1f39-4872-ada3-ed4b1694da8d', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('9c7cc2ac-9b1e-48a2-962b-582c8dc6fd19', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('54380ab5-faf6-4bcd-bf10-4d2a7a82f3ed', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('a3007f81-0771-4b41-a830-cc62df023542', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d4505a4-22c2-4f58-836f-ebb4a5e01a78', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d2f2d0d-3fd9-43fd-8ff3-2f024def09f5', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('10aaa53a-5e72-44b4-bf19-9e659b419440', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('d85b363e-3da1-4533-aadb-e949f7535a25', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('8a4525ea-7b2d-45cf-8f9a-3782c078b27d', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8aca301-8798-48be-9edd-653a5f24e2c7', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('966097fe-48c2-4998-9e73-05db7a8a9c6c', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('e3320af0-c0be-4091-8a4a-0df312a8ee3b', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('7d4707b9-fe96-4e16-9693-03beded6651e', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('2f6970d0-bdc6-48ba-8f86-20e5b77db8e3', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5b1a4648-fc41-459a-a21a-73df8011f0b8', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('78dc0e6b-d608-4cfd-a940-9b3934be9561', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('313bbe50-e6a4-4df7-a6bc-be72035b4529', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('3feddbcd-25c6-479c-addb-5111e7fba20b', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8a9be41-c1ac-4a66-b3c9-04c4fb1faa36', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('44bc701b-b4ef-4573-9acb-229d9ce4a808', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b38831e3-da9c-48ac-9042-48173ecf376a', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('208256c5-8b0f-4d0d-8973-de32115ecb8a', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('d2def3c8-b5f6-4219-b77f-519bfc7d27ee', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('b662e9c3-d09e-46d3-ac45-fcde4dd2be0a', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('2c1aecdc-ee5f-4e31-ad6e-2a23d336645d', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('3fd76c75-4c0e-4c9f-8b3f-374742390997', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('74780c65-3eec-4506-b49e-f284adea7d04', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('0ed48e04-911d-44ad-9cb8-cad0b6a91734', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('bdbe0c99-c3b0-4838-85d0-02c962da36bd', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('424fe3dd-df13-4928-a003-1f697067fb21', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('7eba31af-842a-4c7e-a6dc-49e46a60abb3', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('fe28c0da-49d2-4beb-86a3-b5b0740ca8e3', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('d1097dcb-9d8c-4ad4-a011-0dc39c096dfa', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('19c5dcd3-6d68-4383-933d-f33feba01007', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('0f18f0d7-775a-4353-933d-3625ffc46c15', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('0ae6ab62-0ba6-47da-9aff-428cdda39ae7', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('e5c81d00-666c-4834-9d4b-7f096b68f3bd', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('f6447c97-d200-490a-a5a0-b8472de18096', 'App\Models\Usr\Role', '849602fa-2990-4361-8be3-8b9bb9dc2075');
INSERT INTO "usr"."model_has_permissions" VALUES ('5011b921-7616-4603-a7d1-14857d2ec472', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('4c74753d-101d-4a3d-9b3d-0f070f8799fe', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('1b750360-bbfd-4ac4-ba09-09f6f2bfe79a', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('7542902d-0d87-4b8a-9e1f-4cb4678d88ed', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('bc78a002-a4e7-420d-83be-85e1654f739b', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('fd6d3e00-157a-4bae-bb58-c5c72c611a0b', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4976a7e-352c-43fd-8cde-4ab77e7a01e6', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('d67b3089-7f35-4510-bd37-70cbd3239d61', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('708672d9-1db9-423b-b7e5-df55ed87dd1a', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e85dc65-1aa8-4f52-8e7a-4b91a690524d', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('9601d5ea-6952-4f63-98ed-6c06dfd05d93', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('364ced52-4c1c-4a74-bb3f-2636fd45eca6', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b27fa03d-fb22-4329-a39e-e5b8e8c4e3ff', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('c2ce94cc-a04d-424e-9041-4eb8dd81a53f', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a98f0ee-383c-481d-abdd-a27b5d1da2a8', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('5616ce80-9d39-4ae9-a8be-f043b0cacee1', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('ef79c6e9-4701-4790-b554-2fca7297e97e', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b3752950-0604-4dca-a666-c34c76956bbb', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('dcd2785e-b207-4580-808f-b0f2c7521014', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('f93c6178-c8ac-4b29-b7f5-3cf030cb9096', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('7d6162ce-c46d-4b8e-b1ea-107fdd26b484', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('538a5e2b-1f39-4872-ada3-ed4b1694da8d', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('9c7cc2ac-9b1e-48a2-962b-582c8dc6fd19', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('54380ab5-faf6-4bcd-bf10-4d2a7a82f3ed', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('a3007f81-0771-4b41-a830-cc62df023542', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d4505a4-22c2-4f58-836f-ebb4a5e01a78', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d2f2d0d-3fd9-43fd-8ff3-2f024def09f5', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('10aaa53a-5e72-44b4-bf19-9e659b419440', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('d85b363e-3da1-4533-aadb-e949f7535a25', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('8a4525ea-7b2d-45cf-8f9a-3782c078b27d', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8aca301-8798-48be-9edd-653a5f24e2c7', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('966097fe-48c2-4998-9e73-05db7a8a9c6c', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('e3320af0-c0be-4091-8a4a-0df312a8ee3b', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('7d4707b9-fe96-4e16-9693-03beded6651e', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('2f6970d0-bdc6-48ba-8f86-20e5b77db8e3', 'App\Models\Usr\Role', '6039e958-63bf-489c-b349-6ef09df0c23f');
INSERT INTO "usr"."model_has_permissions" VALUES ('5b1a4648-fc41-459a-a21a-73df8011f0b8', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('78dc0e6b-d608-4cfd-a940-9b3934be9561', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('313bbe50-e6a4-4df7-a6bc-be72035b4529', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('3feddbcd-25c6-479c-addb-5111e7fba20b', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8a9be41-c1ac-4a66-b3c9-04c4fb1faa36', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('44bc701b-b4ef-4573-9acb-229d9ce4a808', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b38831e3-da9c-48ac-9042-48173ecf376a', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('208256c5-8b0f-4d0d-8973-de32115ecb8a', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('d2def3c8-b5f6-4219-b77f-519bfc7d27ee', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('b662e9c3-d09e-46d3-ac45-fcde4dd2be0a', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('2c1aecdc-ee5f-4e31-ad6e-2a23d336645d', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('3fd76c75-4c0e-4c9f-8b3f-374742390997', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('74780c65-3eec-4506-b49e-f284adea7d04', 'App\Models\Usr\Role', '02530889-ae28-421c-9dfa-647f5267ac3f');
INSERT INTO "usr"."model_has_permissions" VALUES ('0ed48e04-911d-44ad-9cb8-cad0b6a91734', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('bdbe0c99-c3b0-4838-85d0-02c962da36bd', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('424fe3dd-df13-4928-a003-1f697067fb21', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('7eba31af-842a-4c7e-a6dc-49e46a60abb3', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('fe28c0da-49d2-4beb-86a3-b5b0740ca8e3', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('d1097dcb-9d8c-4ad4-a011-0dc39c096dfa', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('19c5dcd3-6d68-4383-933d-f33feba01007', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('0f18f0d7-775a-4353-933d-3625ffc46c15', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('0ae6ab62-0ba6-47da-9aff-428cdda39ae7', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('e5c81d00-666c-4834-9d4b-7f096b68f3bd', 'App\Models\Usr\Role', 'f369817b-61b8-4809-bb7a-088ec637bef2');
INSERT INTO "usr"."model_has_permissions" VALUES ('34004539-a594-4417-8a8a-1f836e39d45f', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('d3f90ce4-5ec5-4614-bd9a-642af394f50c', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('96dfbcba-4d35-408d-a89a-18173e2227ad', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('8c59026f-6a86-4b80-9d33-757eddb00c39', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('45a838f9-c27a-4519-8a30-21fe76b10dc0', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('20d2dc42-7baa-4565-b8f1-9a9c07046464', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('5b07e558-ebb9-4e0a-8cf1-921cd3892c6b', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('570d5bf5-af51-40c2-9138-a87ce5b9d654', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('35bccd28-bd73-4e4b-ab74-ca669e876305', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('49bc1739-3923-4a5d-8a2d-0a99b300bf6d', 'App\Models\Usr\Role', '60411852-9439-4ad5-93d2-ec428cbc9d37');
INSERT INTO "usr"."model_has_permissions" VALUES ('71380723-f08e-4dc4-af0a-18ead4ba9582', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('f2b65b0e-9000-45ff-96a9-863390db7267', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('6ddadb26-28dd-4266-8ba0-83870d608972', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('190612d5-8d17-44f3-8ae8-4f022c5cdd84', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('eba004d5-dd30-4201-b4fe-5d4115b5677c', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('5e0c3f9c-f6ec-4742-b714-cabbe2f06df2', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('17cfde5e-b0a0-4bab-abf1-1ae31c58a4a3', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('963f11dc-98b4-466d-a6eb-b63357733bb3', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('ccd7f32e-2b2f-4653-84b5-a0bbe9543e03', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('45552a08-30c5-4387-b818-e76d1413fd2a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('40253217-5b02-450d-9b3f-92281024371a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('a8b56c9b-ff44-4d7a-82be-763f994d0f8a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('17315464-933e-42e0-b073-0bf10415d886', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('19e98187-c951-4e9c-8bf4-e301db8f36f7', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('171bbdf8-5e22-4022-b3f6-f23921774d30', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('1e5f1e83-caa8-4ac3-930d-34b37d5d1dd4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('c71a9802-e650-44df-8cf8-7f46e216e764', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('dda3b102-63f6-443c-9ce0-72ba1874bcc0', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('4a4a278c-2624-40eb-aaef-6f8b6de5a3eb', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('f3d3ef89-d067-4009-b0ab-f92b895c56d1', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('d45fb3e8-8a87-4e08-8897-302b3e2e19af', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('b738de4d-6405-4d83-afc2-53dcd3c5a46f', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('2883c60e-1376-45ca-b888-387ec57778eb', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('54069bbd-b7ab-42e1-b8d4-d0766cbec143', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('b16ec96c-5b61-49db-a799-b4936a7b5d08', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('f1502789-85e6-497c-87b4-e9f25707c197', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('015f93d2-28bb-468b-b7ec-019860a3a3e3', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('82d12ce0-49f4-413b-813b-d45930a80a9e', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('0f04a0ff-aac6-4fc9-a834-bfac39755550', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('5c26684d-fa77-4620-886d-129e1a162dda', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('435cf722-3ecf-4576-9ce7-9ec54865d045', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('ca6a6bf6-4f16-4c7c-87e9-2e2992842db4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a67eaec-87a8-4314-bce8-0749d5879394', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('29aff692-f5c4-4bdf-8aaa-b2e3126e5de0', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d5de024-2cba-4c9e-ab55-b00a1d232ff4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('a41ba6b8-0a83-4f2a-be70-52401250a37c', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('361c8b33-b567-4107-884d-e1c4cda93fe7', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('084ed10b-26db-48f4-bef4-62d867726654', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('a5d84c39-b496-43e2-9957-8b0ef80e7dcc', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('63c6687e-bb16-4f50-ac91-c23a45e370f5', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('14209e40-1caf-4406-bd14-27e1365e0c6d', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('40836299-e191-455e-b311-8c505d37b4b2', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('20231107-0c21-4152-80d2-8aca7c8bdb0a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfb39cb9-9236-4f97-ad1c-930b52f1e799', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('50135bac-6caa-42af-aca3-56a9604bb1d4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('a498ef03-b5ae-4640-ae21-a225e09c779e', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('0b319713-02b6-4957-b663-bac6a4e767ea', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('f870f7d2-da2e-4a3e-bc50-33d0d5b6e42d', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('63042719-bf48-4e1b-b218-27aa5d8c7327', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('4983f282-cb17-4bbe-b34f-0eee9f7441fb', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('a8b0f17e-95fd-4a9d-846a-22625b81c8c4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('76d2cb9c-3f75-4b0b-9d0c-b80bf2c5ddc8', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('61b60a1d-9d48-4183-8e29-afd8ebc99db8', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('7c0dcb4c-ea44-4444-a798-6c1a00fff454', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('59444cef-3e39-4ec8-99b6-1053721a620e', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('df3a11da-08e2-4a66-9cf4-9abd56066197', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('cc12e1e9-5957-46e8-8893-ad8a15e4d0ba', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('ce066a18-af4c-4f23-8c79-b340b2b869ab', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7890294-9bc1-4595-bf6e-bbb3722da132', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('969ba578-0e5f-4ad4-b13b-00b43f654ed9', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('7b6622a1-c046-4352-8923-dbde264797c8', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8d34912-5194-4fd3-bb33-c88a06d1481e', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('076dda01-0972-49da-8f1e-b61a364354e4', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('65945c4b-7e4b-4fc1-a78b-82b2ac4f622b', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('63160309-f103-49aa-9d0d-439051ae7f9a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('9cd966d9-db4e-4d7a-9736-8e8199bdfa31', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('40c51f0b-d32f-4fe6-971d-2a2f0f98a86c', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('8173a4dc-5f25-4d90-995f-82ebd1dbbb7a', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('62f0a116-0dad-41ee-b77a-86cfdbf7c659', 'App\Models\Usr\Role', 'e3f15bf9-fcdb-4aa0-bced-275298f8008b');
INSERT INTO "usr"."model_has_permissions" VALUES ('40253217-5b02-450d-9b3f-92281024371a', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('a8b56c9b-ff44-4d7a-82be-763f994d0f8a', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('17315464-933e-42e0-b073-0bf10415d886', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('19e98187-c951-4e9c-8bf4-e301db8f36f7', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('171bbdf8-5e22-4022-b3f6-f23921774d30', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('1e5f1e83-caa8-4ac3-930d-34b37d5d1dd4', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('c71a9802-e650-44df-8cf8-7f46e216e764', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('dda3b102-63f6-443c-9ce0-72ba1874bcc0', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('4a4a278c-2624-40eb-aaef-6f8b6de5a3eb', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('f3d3ef89-d067-4009-b0ab-f92b895c56d1', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('d45fb3e8-8a87-4e08-8897-302b3e2e19af', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('b738de4d-6405-4d83-afc2-53dcd3c5a46f', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('2883c60e-1376-45ca-b888-387ec57778eb', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('54069bbd-b7ab-42e1-b8d4-d0766cbec143', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('b16ec96c-5b61-49db-a799-b4936a7b5d08', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('f1502789-85e6-497c-87b4-e9f25707c197', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('015f93d2-28bb-468b-b7ec-019860a3a3e3', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('82d12ce0-49f4-413b-813b-d45930a80a9e', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('0f04a0ff-aac6-4fc9-a834-bfac39755550', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('5c26684d-fa77-4620-886d-129e1a162dda', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('435cf722-3ecf-4576-9ce7-9ec54865d045', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('ca6a6bf6-4f16-4c7c-87e9-2e2992842db4', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a67eaec-87a8-4314-bce8-0749d5879394', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('29aff692-f5c4-4bdf-8aaa-b2e3126e5de0', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d5de024-2cba-4c9e-ab55-b00a1d232ff4', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('a41ba6b8-0a83-4f2a-be70-52401250a37c', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('361c8b33-b567-4107-884d-e1c4cda93fe7', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('084ed10b-26db-48f4-bef4-62d867726654', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('a5d84c39-b496-43e2-9957-8b0ef80e7dcc', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('63c6687e-bb16-4f50-ac91-c23a45e370f5', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('14209e40-1caf-4406-bd14-27e1365e0c6d', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('40836299-e191-455e-b311-8c505d37b4b2', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('20231107-0c21-4152-80d2-8aca7c8bdb0a', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfb39cb9-9236-4f97-ad1c-930b52f1e799', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('50135bac-6caa-42af-aca3-56a9604bb1d4', 'App\Models\Usr\Role', '00352d1b-e098-44e2-92a8-bfbc88229819');
INSERT INTO "usr"."model_has_permissions" VALUES ('a498ef03-b5ae-4640-ae21-a225e09c779e', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('0b319713-02b6-4957-b663-bac6a4e767ea', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('f870f7d2-da2e-4a3e-bc50-33d0d5b6e42d', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('63042719-bf48-4e1b-b218-27aa5d8c7327', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('4983f282-cb17-4bbe-b34f-0eee9f7441fb', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('a8b0f17e-95fd-4a9d-846a-22625b81c8c4', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('76d2cb9c-3f75-4b0b-9d0c-b80bf2c5ddc8', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('61b60a1d-9d48-4183-8e29-afd8ebc99db8', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('7c0dcb4c-ea44-4444-a798-6c1a00fff454', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('59444cef-3e39-4ec8-99b6-1053721a620e', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('df3a11da-08e2-4a66-9cf4-9abd56066197', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('cc12e1e9-5957-46e8-8893-ad8a15e4d0ba', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('ce066a18-af4c-4f23-8c79-b340b2b869ab', 'App\Models\Usr\Role', '7629ead4-bf61-4f07-b857-e57918d2a70c');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7890294-9bc1-4595-bf6e-bbb3722da132', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('969ba578-0e5f-4ad4-b13b-00b43f654ed9', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('7b6622a1-c046-4352-8923-dbde264797c8', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8d34912-5194-4fd3-bb33-c88a06d1481e', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('076dda01-0972-49da-8f1e-b61a364354e4', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('65945c4b-7e4b-4fc1-a78b-82b2ac4f622b', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('63160309-f103-49aa-9d0d-439051ae7f9a', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('9cd966d9-db4e-4d7a-9736-8e8199bdfa31', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('40c51f0b-d32f-4fe6-971d-2a2f0f98a86c', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('8173a4dc-5f25-4d90-995f-82ebd1dbbb7a', 'App\Models\Usr\Role', 'b105f162-6a2c-4c15-98d3-dc80335eca72');
INSERT INTO "usr"."model_has_permissions" VALUES ('71380723-f08e-4dc4-af0a-18ead4ba9582', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('f2b65b0e-9000-45ff-96a9-863390db7267', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('6ddadb26-28dd-4266-8ba0-83870d608972', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('190612d5-8d17-44f3-8ae8-4f022c5cdd84', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('eba004d5-dd30-4201-b4fe-5d4115b5677c', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('5e0c3f9c-f6ec-4742-b714-cabbe2f06df2', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('17cfde5e-b0a0-4bab-abf1-1ae31c58a4a3', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('963f11dc-98b4-466d-a6eb-b63357733bb3', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('ccd7f32e-2b2f-4653-84b5-a0bbe9543e03', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('45552a08-30c5-4387-b818-e76d1413fd2a', 'App\Models\Usr\Role', 'f9551b77-ed62-4bae-8c38-78e172f05609');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a526a59-d285-4fb0-b8c0-63a61b257726', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('30e34bc0-22b0-4e73-9352-fdcfa327351f', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('b446b4ad-c89a-4381-94a0-d5a074fec57c', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('76efd401-bba1-4e0b-9cfa-6e6d39cb5239', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('33c7d49d-023f-4999-afaf-3da36cb48378', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a948af2-fa03-468e-a401-b0aa2e1eb7b2', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d23b1e0-e0b4-41e8-8231-368a20dd97f4', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('f803d710-5320-4047-ad4f-9fb7740d88b2', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('24fd7e36-bbef-42a4-a704-4bd6322e901b', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('416b1f12-a16f-4577-be6b-a614225075f5', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfe8ca2b-0b7f-4ac3-b02a-b0798d5dd560', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7791cd87-b089-4547-b6ac-0f9201f0c62d', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('10460180-8997-4b1e-aa51-4ccaaad6211c', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('4833a2f6-70e4-43e6-8388-afbb7756ab7a', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7613deaf-f000-4073-8214-2f53c5502a25', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('8d4cb219-9beb-4565-9ff0-432644594b83', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('219e32a3-7481-47bc-bedf-779e00dafc31', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('52897384-561a-4721-9ebf-513f650a3131', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('91cb02ca-a4c7-4f9c-a419-1d64647aa8e8', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('b01b5dc6-24e2-46bc-861c-1b1956239e09', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('c2f5dcbc-dc98-4a8e-9f63-6a6b6389a80e', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('67a9a6ec-fcd9-428f-8bb4-9623678f407d', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('21664e4c-eaed-421f-a1ef-9bdfb0a1a53c', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('5da60ec4-d1f0-43f8-81dc-afe360f0165d', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('949595ef-ad12-4bcf-ae7f-4585cbdbe6fb', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7871a16b-83a5-4f67-9845-348569028724', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4f88956-43f8-4456-9420-1e311d30adba', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('1ec3becd-cb28-4889-b80b-4f381be32014', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d1d1886-b366-49a5-9ec6-b218e45a4feb', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e77376b-e3c7-431b-8110-969d528cf3aa', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('55607437-235e-40ae-a683-d1de9e2b5bc8', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('6f8c63e8-535c-485e-9eed-4efc65466795', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('6553673e-016f-4d60-bf25-db95756702fe', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('75de190c-3333-4283-ad0b-0e367fa3dcbd', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7f493122-2181-4234-8624-25e08dbe794a', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('f78cbbe7-690d-4f81-84dd-3561a530d5d5', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('52672ef2-f122-466c-91aa-2fc403e5ea39', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('997c754f-6624-4115-9fb0-4ff8da06b03d', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9511b7a1-5fda-4127-918a-41171c3689e0', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('4142a705-fc18-4aea-8a85-cda39a8765b6', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('d578a862-14b3-48fb-bd6d-049f242c640f', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('26954f53-f502-4bae-867c-aa492e4df6e5', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e6c2b01-5694-4019-ab88-8945f42dde30', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd4e890c-2ab5-4fe6-857b-9841a6b18e66', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('e1e8a4d2-4593-4e5a-888f-5e165a93fbf5', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7fc5020-54f4-4fb5-b888-6509e7562e58', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d6f0cda-c34d-48ae-a487-f75d492f970f', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7ec603d9-d505-4f1e-9403-02d6bda42c07', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e3758e2-76f6-4dd7-8e3f-743d9a2b921e', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('0e23cf8c-a91a-4a83-bf33-88a9c15ab69b', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('cc885c32-1c6a-456a-b5f1-aa64f0f60128', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('3bacaf87-7492-4d68-95e8-6b3256aca080', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('1da71987-cb5d-44ce-bd39-68c69d8061ab', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('77dae078-46bc-4db4-95f3-b36c3b6ba68a', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d4a75ac-68f4-44d8-b60e-40fcb8e4fb4d', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('f95c0928-ad5b-423f-90be-d3f0a6e746f5', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('56d73531-5d7c-4f3c-9e24-fd425f5ecabb', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('83c2b391-2b18-41d7-9dcf-3786fef52938', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('de9609d9-5c38-4323-bbd0-515da727b4ae', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a57e67d-0b24-48bc-8fa0-8698e8b2eff1', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('dd079b65-18e5-47c0-8f9b-274c7e63e39e', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('23d4a2e2-829b-4665-876f-cb619c944369', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('7cd322e2-0844-4ea5-bba3-e4158860a2f1', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('69754550-d60b-4b2d-af3d-6be1d69d5dc7', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('654d6479-d845-489d-8f0f-9e714ed6cf2e', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('fb3da396-2a78-462b-9f93-07f7ae4e208c', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9cb8cbd4-727c-4093-acfa-aae43bebdc50', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d6f9cb2-6ee6-412f-9641-a565639eaf38', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('d262df9a-c7ef-40ec-9f12-e0162b9f66f4', 'App\Models\Usr\Role', '8ceace45-8bbb-4055-91f6-70ecf8f55ca6');
INSERT INTO "usr"."model_has_permissions" VALUES ('dfe8ca2b-0b7f-4ac3-b02a-b0798d5dd560', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('7791cd87-b089-4547-b6ac-0f9201f0c62d', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('10460180-8997-4b1e-aa51-4ccaaad6211c', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('4833a2f6-70e4-43e6-8388-afbb7756ab7a', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('7613deaf-f000-4073-8214-2f53c5502a25', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('8d4cb219-9beb-4565-9ff0-432644594b83', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('219e32a3-7481-47bc-bedf-779e00dafc31', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('52897384-561a-4721-9ebf-513f650a3131', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('91cb02ca-a4c7-4f9c-a419-1d64647aa8e8', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('b01b5dc6-24e2-46bc-861c-1b1956239e09', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('c2f5dcbc-dc98-4a8e-9f63-6a6b6389a80e', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('67a9a6ec-fcd9-428f-8bb4-9623678f407d', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('21664e4c-eaed-421f-a1ef-9bdfb0a1a53c', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('5da60ec4-d1f0-43f8-81dc-afe360f0165d', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('949595ef-ad12-4bcf-ae7f-4585cbdbe6fb', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('7871a16b-83a5-4f67-9845-348569028724', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('c4f88956-43f8-4456-9420-1e311d30adba', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('1ec3becd-cb28-4889-b80b-4f381be32014', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d1d1886-b366-49a5-9ec6-b218e45a4feb', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e77376b-e3c7-431b-8110-969d528cf3aa', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('55607437-235e-40ae-a683-d1de9e2b5bc8', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('6f8c63e8-535c-485e-9eed-4efc65466795', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('6553673e-016f-4d60-bf25-db95756702fe', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('75de190c-3333-4283-ad0b-0e367fa3dcbd', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('7f493122-2181-4234-8624-25e08dbe794a', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('f78cbbe7-690d-4f81-84dd-3561a530d5d5', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('52672ef2-f122-466c-91aa-2fc403e5ea39', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('997c754f-6624-4115-9fb0-4ff8da06b03d', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('9511b7a1-5fda-4127-918a-41171c3689e0', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('4142a705-fc18-4aea-8a85-cda39a8765b6', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('d578a862-14b3-48fb-bd6d-049f242c640f', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('26954f53-f502-4bae-867c-aa492e4df6e5', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e6c2b01-5694-4019-ab88-8945f42dde30', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd4e890c-2ab5-4fe6-857b-9841a6b18e66', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('e1e8a4d2-4593-4e5a-888f-5e165a93fbf5', 'App\Models\Usr\Role', '3ed3e00b-7430-41b1-ba56-76b6198c923c');
INSERT INTO "usr"."model_has_permissions" VALUES ('d7fc5020-54f4-4fb5-b888-6509e7562e58', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d6f0cda-c34d-48ae-a487-f75d492f970f', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('7ec603d9-d505-4f1e-9403-02d6bda42c07', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e3758e2-76f6-4dd7-8e3f-743d9a2b921e', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('0e23cf8c-a91a-4a83-bf33-88a9c15ab69b', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('cc885c32-1c6a-456a-b5f1-aa64f0f60128', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('3bacaf87-7492-4d68-95e8-6b3256aca080', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('1da71987-cb5d-44ce-bd39-68c69d8061ab', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('77dae078-46bc-4db4-95f3-b36c3b6ba68a', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('0d4a75ac-68f4-44d8-b60e-40fcb8e4fb4d', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('f95c0928-ad5b-423f-90be-d3f0a6e746f5', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('56d73531-5d7c-4f3c-9e24-fd425f5ecabb', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('83c2b391-2b18-41d7-9dcf-3786fef52938', 'App\Models\Usr\Role', '31468f0a-8b31-4d20-879e-7d42be264fb4');
INSERT INTO "usr"."model_has_permissions" VALUES ('de9609d9-5c38-4323-bbd0-515da727b4ae', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a57e67d-0b24-48bc-8fa0-8698e8b2eff1', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('dd079b65-18e5-47c0-8f9b-274c7e63e39e', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('23d4a2e2-829b-4665-876f-cb619c944369', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('7cd322e2-0844-4ea5-bba3-e4158860a2f1', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('69754550-d60b-4b2d-af3d-6be1d69d5dc7', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('654d6479-d845-489d-8f0f-9e714ed6cf2e', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('fb3da396-2a78-462b-9f93-07f7ae4e208c', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('9cb8cbd4-727c-4093-acfa-aae43bebdc50', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d6f9cb2-6ee6-412f-9641-a565639eaf38', 'App\Models\Usr\Role', 'a4cdd475-0961-4a80-a229-2cb5dc79ecda');
INSERT INTO "usr"."model_has_permissions" VALUES ('1a526a59-d285-4fb0-b8c0-63a61b257726', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('30e34bc0-22b0-4e73-9352-fdcfa327351f', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('b446b4ad-c89a-4381-94a0-d5a074fec57c', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('76efd401-bba1-4e0b-9cfa-6e6d39cb5239', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('33c7d49d-023f-4999-afaf-3da36cb48378', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('9a948af2-fa03-468e-a401-b0aa2e1eb7b2', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('9d23b1e0-e0b4-41e8-8231-368a20dd97f4', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('f803d710-5320-4047-ad4f-9fb7740d88b2', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('24fd7e36-bbef-42a4-a704-4bd6322e901b', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('416b1f12-a16f-4577-be6b-a614225075f5', 'App\Models\Usr\Role', '5ff13439-dae7-447c-8fa5-ac22fc631475');
INSERT INTO "usr"."model_has_permissions" VALUES ('73907e0d-612a-42fb-adcf-720f07c1644d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('01d48559-4a99-437e-894d-cc694601aca2', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3792a210-604b-45ea-8421-6ab06026fca2', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('1596349d-b56d-43da-9b78-aec6dfa3469d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('f8bcaebf-e3f5-4e43-b65c-622456259dae', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8bfa287-583a-4327-96a9-fecda518e62f', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('d5ef2cb7-af46-498e-91ce-6987b4725f1a', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('2ea6ed8b-df6a-48b7-a43f-88fadf06f23d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('da2b14ef-b251-4bed-9642-d423945e94c6', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a72bb6b-8462-42b6-9561-4194a7429077', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('1c067dc7-a785-4571-a2cb-eef07181fbc8', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('d60928be-95ff-4d48-ab19-a3d7d58dcbe0', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a49a08c-1f96-49c4-a138-a9ac7d2d16e7', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('66ae85d9-4823-4400-a0c1-dd7e34e8ee7a', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('60a92dd4-25a2-4a6f-b2c4-d8d037ac2614', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('9b51c4c3-3e17-4fe6-b241-ee67f5e469b5', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('7aa90dab-75ae-42c0-8ec6-2e50e57c5ce2', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('219c5646-0967-48b4-9ddc-64a2dec4e487', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('ca4b1b7b-80ab-4e16-a0a1-fed0f37d6cf7', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd84fb09-f753-4a9a-8a7e-916d1ea1265e', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('41d7853b-22f5-40b1-a3e5-cd0b3f5a59d8', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('aff3eabf-509c-43ef-aedd-b0a5fd527e80', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e32aeea-62d3-4d52-bdcc-4d2ea26b4884', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd736f1a-5dcd-49cd-baa6-d29c79a0f9b1', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('df09cc07-b468-42b3-a37f-e491f7c317c0', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('4f305f4f-8e53-4b94-b764-7dd41bc83d17', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('e482b462-9330-4648-ba70-1b7c429f095e', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('913fbacb-5754-4f9c-a6f9-b7dcca04487d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('ac91b73d-cb50-427d-ad7c-d2ef2731c8d0', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3d42b23e-8674-457f-a854-b82e56de7114', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('49521237-a15f-4ac5-b17c-707fc0dc997e', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d5bbdf4-20e6-4e04-be01-84db9bce3f34', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('13cdb029-e1b5-45f6-bf17-18f61d547823', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('066a4976-e973-4ae1-903b-7263ff4d6a1a', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('1b540cff-48db-466f-b30b-42a160f4a3b6', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('cfdf71d2-03d3-4f65-8a54-ddfa953ccd1b', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('4890adbe-8b8f-482f-8d4b-4bfde4112c88', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('9bef9fa6-0616-420c-a06c-d10df9e8929e', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('6a790190-d856-447d-a3f6-29295ac037a4', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('eb851336-4203-4fba-85e7-f7cd8a95277d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e6efbc1-86a3-4921-8c5a-ca7883e74c84', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3a2c5af0-d47b-41e8-a57c-fc248ad32cc5', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('9b511b7c-0df1-4fdb-9e97-d35c351dcbf8', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('8fc14b7f-a097-4645-8a7d-4e0fee855d1f', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('fad20d8e-ce84-4a4f-970d-82a63f0bd346', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('798c7340-d381-4766-a5b7-548fdc636327', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('26696f7c-382a-4e34-9085-e26c8c6d394c', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('19238ce2-1217-44d8-ae0d-035d16bb019f', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('4d7babd3-bc5e-4056-92bb-0804dd7a209b', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('5e0cdf87-c405-459e-818c-703da11912e2', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('84d24bb0-3695-4d00-8101-62a43229f949', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('9476f02d-9d25-48b1-9d3c-c4fcba86051b', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('458c3a9c-f5e8-4e11-bdda-bbd6c39b3944', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('57d9c53d-ec4e-4057-92f7-2a63885ce87b', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('7fd51374-a0f5-4e5b-bb2e-473e649b4a30', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('284edc47-f70b-4af3-b84a-17506eb04df3', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('014614cb-abfc-4519-99a5-934e94d8d6bb', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('fc694e12-48c5-4d91-addf-12a8e2b12f44', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3706f285-bd7b-429c-a3e4-78750b8ad5f9', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('7bce2d95-5a42-43bc-aac5-2c7f1a36111d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('46cb8033-19ad-4bdd-96ae-3cb62294dcea', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('1e16850b-9ae9-4c09-b401-f1736efab0d4', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('18474460-db37-45d1-93f4-818cbb3f1a2d', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('d561b72d-af57-4fb2-aa2f-26c403742c2b', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('d81964b5-f8a0-440e-968c-1be7470344f0', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('66ba7041-0a10-4a59-90e2-9aab33133e71', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('7010835e-b1a3-4fb9-86e8-e30e04b89f85', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('262e695c-33a0-4db4-99e7-686ce1f29939', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('ce6c152c-c815-4799-8ff3-4c40e395c2e2', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('16582e67-4cc9-4480-ac09-0a2288f28bc6', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('3faa0d09-b937-44ac-b7ed-c262c9e48329', 'App\Models\Usr\Role', 'ff395777-48aa-442a-897b-b3ffae7e2032');
INSERT INTO "usr"."model_has_permissions" VALUES ('1c067dc7-a785-4571-a2cb-eef07181fbc8', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('d60928be-95ff-4d48-ab19-a3d7d58dcbe0', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a49a08c-1f96-49c4-a138-a9ac7d2d16e7', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('66ae85d9-4823-4400-a0c1-dd7e34e8ee7a', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('60a92dd4-25a2-4a6f-b2c4-d8d037ac2614', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('9b51c4c3-3e17-4fe6-b241-ee67f5e469b5', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('7aa90dab-75ae-42c0-8ec6-2e50e57c5ce2', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('219c5646-0967-48b4-9ddc-64a2dec4e487', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('ca4b1b7b-80ab-4e16-a0a1-fed0f37d6cf7', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd84fb09-f753-4a9a-8a7e-916d1ea1265e', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('41d7853b-22f5-40b1-a3e5-cd0b3f5a59d8', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('aff3eabf-509c-43ef-aedd-b0a5fd527e80', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('3e32aeea-62d3-4d52-bdcc-4d2ea26b4884', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('bd736f1a-5dcd-49cd-baa6-d29c79a0f9b1', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('df09cc07-b468-42b3-a37f-e491f7c317c0', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('4f305f4f-8e53-4b94-b764-7dd41bc83d17', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('e482b462-9330-4648-ba70-1b7c429f095e', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('913fbacb-5754-4f9c-a6f9-b7dcca04487d', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('ac91b73d-cb50-427d-ad7c-d2ef2731c8d0', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('3d42b23e-8674-457f-a854-b82e56de7114', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('49521237-a15f-4ac5-b17c-707fc0dc997e', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('5d5bbdf4-20e6-4e04-be01-84db9bce3f34', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('13cdb029-e1b5-45f6-bf17-18f61d547823', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('066a4976-e973-4ae1-903b-7263ff4d6a1a', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('1b540cff-48db-466f-b30b-42a160f4a3b6', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('cfdf71d2-03d3-4f65-8a54-ddfa953ccd1b', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('4890adbe-8b8f-482f-8d4b-4bfde4112c88', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('9bef9fa6-0616-420c-a06c-d10df9e8929e', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('6a790190-d856-447d-a3f6-29295ac037a4', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('eb851336-4203-4fba-85e7-f7cd8a95277d', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('9e6efbc1-86a3-4921-8c5a-ca7883e74c84', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('3a2c5af0-d47b-41e8-a57c-fc248ad32cc5', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('9b511b7c-0df1-4fdb-9e97-d35c351dcbf8', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('8fc14b7f-a097-4645-8a7d-4e0fee855d1f', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('fad20d8e-ce84-4a4f-970d-82a63f0bd346', 'App\Models\Usr\Role', 'a2414d27-a24e-4640-a66d-ee529f49d4e5');
INSERT INTO "usr"."model_has_permissions" VALUES ('798c7340-d381-4766-a5b7-548fdc636327', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('26696f7c-382a-4e34-9085-e26c8c6d394c', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('19238ce2-1217-44d8-ae0d-035d16bb019f', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('4d7babd3-bc5e-4056-92bb-0804dd7a209b', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('5e0cdf87-c405-459e-818c-703da11912e2', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('84d24bb0-3695-4d00-8101-62a43229f949', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('9476f02d-9d25-48b1-9d3c-c4fcba86051b', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('458c3a9c-f5e8-4e11-bdda-bbd6c39b3944', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('57d9c53d-ec4e-4057-92f7-2a63885ce87b', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('7fd51374-a0f5-4e5b-bb2e-473e649b4a30', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('284edc47-f70b-4af3-b84a-17506eb04df3', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('014614cb-abfc-4519-99a5-934e94d8d6bb', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('fc694e12-48c5-4d91-addf-12a8e2b12f44', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('3706f285-bd7b-429c-a3e4-78750b8ad5f9', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('7bce2d95-5a42-43bc-aac5-2c7f1a36111d', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('46cb8033-19ad-4bdd-96ae-3cb62294dcea', 'App\Models\Usr\Role', 'a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf');
INSERT INTO "usr"."model_has_permissions" VALUES ('1e16850b-9ae9-4c09-b401-f1736efab0d4', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('18474460-db37-45d1-93f4-818cbb3f1a2d', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('d561b72d-af57-4fb2-aa2f-26c403742c2b', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('d81964b5-f8a0-440e-968c-1be7470344f0', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('66ba7041-0a10-4a59-90e2-9aab33133e71', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('7010835e-b1a3-4fb9-86e8-e30e04b89f85', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('262e695c-33a0-4db4-99e7-686ce1f29939', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('ce6c152c-c815-4799-8ff3-4c40e395c2e2', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('16582e67-4cc9-4480-ac09-0a2288f28bc6', 'App\Models\Usr\Role', 'a2ab18d3-6e5c-4f11-8b05-ad3299086a12');
INSERT INTO "usr"."model_has_permissions" VALUES ('73907e0d-612a-42fb-adcf-720f07c1644d', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('01d48559-4a99-437e-894d-cc694601aca2', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('3792a210-604b-45ea-8421-6ab06026fca2', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('1596349d-b56d-43da-9b78-aec6dfa3469d', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('f8bcaebf-e3f5-4e43-b65c-622456259dae', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('b8bfa287-583a-4327-96a9-fecda518e62f', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('d5ef2cb7-af46-498e-91ce-6987b4725f1a', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('2ea6ed8b-df6a-48b7-a43f-88fadf06f23d', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('da2b14ef-b251-4bed-9642-d423945e94c6', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');
INSERT INTO "usr"."model_has_permissions" VALUES ('2a72bb6b-8462-42b6-9561-4194a7429077', 'App\Models\Usr\Role', 'c82028cd-db29-4bca-a6a2-ae54d448f8c0');

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS "usr"."model_has_roles";
CREATE TABLE "usr"."model_has_roles" (
  "role_id" uuid NOT NULL,
  "model_type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "model_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO "usr"."model_has_roles" VALUES ('6f4a96fb-29b7-413a-b76a-a97b3f98a243', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '3fa96aee-4854-4db6-81fb-feefe7521213');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', 'ec0e868e-d279-4a78-a3b4-dddcf9dde14b');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '9d8dd3c9-9553-4fc4-b421-4ec727acc43c');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '8fef9cc9-0ed4-4b20-913b-47e17351f28e');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '3aed0010-fe7b-40b8-a02d-6b1c013557a8');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '9bae318a-6c97-4628-9ea5-4438aba313a0');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', 'e084145c-2809-409f-980b-6c6ddeef07f4');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', 'fd753c19-e65c-43b4-a1a2-c633354e9565');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', 'd7614691-6940-42de-8810-bfc96f967beb');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '11e548bb-b87d-471b-9655-0153577f05c2');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', '217b5f7e-4947-4855-ac93-ccbba0deddef');
INSERT INTO "usr"."model_has_roles" VALUES ('c491418e-ccf6-4259-9e4a-377b1f59c01b', 'App\Models\Usr\User', 'b09e94c6-1c4d-411f-9f84-c54971b605d5');
INSERT INTO "usr"."model_has_roles" VALUES ('6f4a96fb-29b7-413a-b76a-a97b3f98a243', 'App\Models\Usr\User', '04ebd77a-fe90-415a-aa95-1d539ccdf5e5');
INSERT INTO "usr"."model_has_roles" VALUES ('16f14016-7054-4d6a-ac66-f0c98dc30bc9', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('16f14016-7054-4d6a-ac66-f0c98dc30bc9', 'App\Models\Usr\User', '04ebd77a-fe90-415a-aa95-1d539ccdf5e5');
INSERT INTO "usr"."model_has_roles" VALUES ('849602fa-2990-4361-8be3-8b9bb9dc2075', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('849602fa-2990-4361-8be3-8b9bb9dc2075', 'App\Models\Usr\User', '04ebd77a-fe90-415a-aa95-1d539ccdf5e5');
INSERT INTO "usr"."model_has_roles" VALUES ('e3f15bf9-fcdb-4aa0-bced-275298f8008b', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('8ceace45-8bbb-4055-91f6-70ecf8f55ca6', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('ff395777-48aa-442a-897b-b3ffae7e2032', 'App\Models\Usr\User', '7f100b41-5fa1-4fe9-af2b-66d7c4d93db5');
INSERT INTO "usr"."model_has_roles" VALUES ('a2414d27-a24e-4640-a66d-ee529f49d4e5', 'App\Models\Usr\User', '0fe50161-631a-4c6c-90ad-87799959b8c0');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "usr"."permissions";
CREATE TABLE "usr"."permissions" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "created_by" uuid,
  "modified_by" uuid,
  "status" int4
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "usr"."permissions" VALUES ('73907e0d-612a-42fb-adcf-720f07c1644d', 'crm.dashboard', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('01d48559-4a99-437e-894d-cc694601aca2', 'crm.lead', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3792a210-604b-45ea-8421-6ab06026fca2', 'crm.quotes', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('1596349d-b56d-43da-9b78-aec6dfa3469d', 'crm.mail', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('f8bcaebf-e3f5-4e43-b65c-622456259dae', 'crm.sales_person', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('b8bfa287-583a-4327-96a9-fecda518e62f', 'crm.organizations', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('d5ef2cb7-af46-498e-91ce-6987b4725f1a', 'crm.persons', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('2ea6ed8b-df6a-48b7-a43f-88fadf06f23d', 'crm.product', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('da2b14ef-b251-4bed-9642-d423945e94c6', 'crm.activity', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('2a72bb6b-8462-42b6-9561-4194a7429077', 'crm.leads', 'web', 'crm', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('1c067dc7-a785-4571-a2cb-eef07181fbc8', 'hrm.dashboard', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('d60928be-95ff-4d48-ab19-a3d7d58dcbe0', 'hrm.master_education_institute', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('2a49a08c-1f96-49c4-a138-a9ac7d2d16e7', 'hrm.master_education_title', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('66ae85d9-4823-4400-a0c1-dd7e34e8ee7a', 'hrm.master_skill_group', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('60a92dd4-25a2-4a6f-b2c4-d8d037ac2614', 'hrm.master_skill', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('9b51c4c3-3e17-4fe6-b241-ee67f5e469b5', 'hrm.master_region', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('7aa90dab-75ae-42c0-8ec6-2e50e57c5ce2', 'hrm.master_city', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('219c5646-0967-48b4-9ddc-64a2dec4e487', 'hrm.master_contract', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('ca4b1b7b-80ab-4e16-a0a1-fed0f37d6cf7', 'hrm.master_holiday', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('bd84fb09-f753-4a9a-8a7e-916d1ea1265e', 'hrm.companies', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('41d7853b-22f5-40b1-a3e5-cd0b3f5a59d8', 'hrm.companies_departement', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('aff3eabf-509c-43ef-aedd-b0a5fd527e80', 'hrm.companies_job_level', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3e32aeea-62d3-4d52-bdcc-4d2ea26b4884', 'hrm.companies_job_title', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('bd736f1a-5dcd-49cd-baa6-d29c79a0f9b1', 'hrm.companies_cost', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('df09cc07-b468-42b3-a37f-e491f7c317c0', 'hrm.employee', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('4f305f4f-8e53-4b94-b764-7dd41bc83d17', 'hrm.employee_placement', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('e482b462-9330-4648-ba70-1b7c429f095e', 'hrm.employee_mutation', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('913fbacb-5754-4f9c-a6f9-b7dcca04487d', 'hrm.employee_carrier_history', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('ac91b73d-cb50-427d-ad7c-d2ef2731c8d0', 'hrm.attendance_reason', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3d42b23e-8674-457f-a854-b82e56de7114', 'hrm.attendance_shiftment', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('49521237-a15f-4ac5-b17c-707fc0dc997e', 'hrm.attendance_work_shift', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('5d5bbdf4-20e6-4e04-be01-84db9bce3f34', 'hrm.attendance', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('13cdb029-e1b5-45f6-bf17-18f61d547823', 'hrm.attendance_summary', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('066a4976-e973-4ae1-903b-7263ff4d6a1a', 'hrm.overtime', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('1b540cff-48db-466f-b30b-42a160f4a3b6', 'hrm.leave', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('cfdf71d2-03d3-4f65-8a54-ddfa953ccd1b', 'hrm.leave_reason', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('4890adbe-8b8f-482f-8d4b-4bfde4112c88', 'hrm.payroll_salary_component', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('9bef9fa6-0616-420c-a06c-d10df9e8929e', 'hrm.payroll_salary_settings', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('6a790190-d856-447d-a3f6-29295ac037a4', 'hrm.payroll_salary_change', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('eb851336-4203-4fba-85e7-f7cd8a95277d', 'hrm.payroll_salary', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('9e6efbc1-86a3-4921-8c5a-ca7883e74c84', 'hrm.payroll_allowance', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3a2c5af0-d47b-41e8-a57c-fc248ad32cc5', 'hrm.payroll_deduction', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('9b511b7c-0df1-4fdb-9e97-d35c351dcbf8', 'hrm.payroll_salary_history', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('8fc14b7f-a097-4645-8a7d-4e0fee855d1f', 'hrm.address_company', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('fad20d8e-ce84-4a4f-970d-82a63f0bd346', 'hrm.address_employee', 'web', 'humanresource', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('798c7340-d381-4766-a5b7-548fdc636327', 'finance.dashboard', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('26696f7c-382a-4e34-9085-e26c8c6d394c', 'finance.cost_sea_freight', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('19238ce2-1217-44d8-ae0d-035d16bb019f', 'finance.cost_air_freight', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('4d7babd3-bc5e-4056-92bb-0804dd7a209b', 'finance.cost_sea_air_freight', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('5e0cdf87-c405-459e-818c-703da11912e2', 'finance.master_charge', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('84d24bb0-3695-4d00-8101-62a43229f949', 'finance.master_customer', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('9476f02d-9d25-48b1-9d3c-c4fcba86051b', 'finance.master_contract_agent', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('458c3a9c-f5e8-4e11-bdda-bbd6c39b3944', 'finance.master_transaction', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('57d9c53d-ec4e-4057-92f7-2a63885ce87b', 'finance.master_unit_type', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('7fd51374-a0f5-4e5b-bb2e-473e649b4a30', 'finance.master_vendor', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('284edc47-f70b-4af3-b84a-17506eb04df3', 'finance.master_vendor_shipping_line', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('014614cb-abfc-4519-99a5-934e94d8d6bb', 'finance.master_vendor_origin', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('fc694e12-48c5-4d91-addf-12a8e2b12f44', 'finance.master_vendor_local', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3706f285-bd7b-429c-a3e4-78750b8ad5f9', 'finance.master_vendor_carrier', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('7bce2d95-5a42-43bc-aac5-2c7f1a36111d', 'finance.transaction_shipment_list', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('46cb8033-19ad-4bdd-96ae-3cb62294dcea', 'finance.transaction_invoices', 'web', 'finance', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('1e16850b-9ae9-4c09-b401-f1736efab0d4', 'acc.dashboard', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('18474460-db37-45d1-93f4-818cbb3f1a2d', 'acc.master_accounts', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('d561b72d-af57-4fb2-aa2f-26c403742c2b', 'acc.transaction_journal', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('d81964b5-f8a0-440e-968c-1be7470344f0', 'acc.transaction_journal_entries', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('66ba7041-0a10-4a59-90e2-9aab33133e71', 'acc.transaction_automatic', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('7010835e-b1a3-4fb9-86e8-e30e04b89f85', 'acc.report_cashflow', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('262e695c-33a0-4db4-99e7-686ce1f29939', 'acc.report_balance_sheet', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('ce6c152c-c815-4799-8ff3-4c40e395c2e2', 'acc.report_cashflow_balance_sheet', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('16582e67-4cc9-4480-ac09-0a2288f28bc6', 'acc.report_profit_and_loss', 'web', 'accounting', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);
INSERT INTO "usr"."permissions" VALUES ('3faa0d09-b937-44ac-b7ed-c262c9e48329', 'role', 'web', 'user', '2024-09-03 07:34:00', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS "usr"."role_has_permissions";
CREATE TABLE "usr"."role_has_permissions" (
  "permission_id" uuid NOT NULL,
  "role_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "usr"."roles";
CREATE TABLE "usr"."roles" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "guard_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "created_by" uuid,
  "modified_by" uuid,
  "status" int4
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "usr"."roles" VALUES ('ff395777-48aa-442a-897b-b3ffae7e2032', 'admin', 'web', NULL, '2024-09-03 07:34:00', '2024-09-03 07:34:00', NULL, NULL, NULL);
INSERT INTO "usr"."roles" VALUES ('a2414d27-a24e-4640-a66d-ee529f49d4e5', 'humanresource', 'web', NULL, '2024-09-03 07:34:01', '2024-09-03 07:34:01', NULL, NULL, NULL);
INSERT INTO "usr"."roles" VALUES ('a1bee799-981d-45a1-ae1d-ff6c6a4a1bcf', 'finance', 'web', NULL, '2024-09-03 07:34:01', '2024-09-03 07:34:01', NULL, NULL, NULL);
INSERT INTO "usr"."roles" VALUES ('a2ab18d3-6e5c-4f11-8b05-ad3299086a12', 'accounting', 'web', NULL, '2024-09-03 07:34:01', '2024-09-03 07:34:01', NULL, NULL, NULL);
INSERT INTO "usr"."roles" VALUES ('c82028cd-db29-4bca-a6a2-ae54d448f8c0', 'SalesTeam', 'web', NULL, '2024-09-03 07:34:01', '2024-09-03 07:34:01', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_password_resets
-- ----------------------------
DROP TABLE IF EXISTS "usr"."user_password_resets";
CREATE TABLE "usr"."user_password_resets" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of user_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for user_sales_office
-- ----------------------------
DROP TABLE IF EXISTS "usr"."user_sales_office";
CREATE TABLE "usr"."user_sales_office" (
  "user_sales_office_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "sales_id" uuid,
  "office_id" uuid,
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "date_created" date DEFAULT now()
)
;

-- ----------------------------
-- Records of user_sales_office
-- ----------------------------
INSERT INTO "usr"."user_sales_office" VALUES ('a7de9be2-b112-48dc-a1a6-9cf8d3704311', 'b09e94c6-1c4d-411f-9f84-c54971b605d5', '1a4ec0f2-6f9a-433f-b58d-efbfce1efb32', 'user@pamcargo.com', '2024-03-08');
INSERT INTO "usr"."user_sales_office" VALUES ('cbd8647b-72aa-46e2-9fea-79e0b3153992', 'b09e94c6-1c4d-411f-9f84-c54971b605d5', '0c84f351-40cf-499b-8914-969d89ae56df', 'user@pamcargo.com', '2024-03-08');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "usr"."users";
CREATE TABLE "usr"."users" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "first_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "profile_image" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "date_created" timestamp(0),
  "date_modified" timestamp(0),
  "created_by" uuid,
  "modified_by" uuid,
  "status" int4,
  "sales_office_id" uuid,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'erp'::character varying
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "usr"."users" VALUES ('04ebd77a-fe90-415a-aa95-1d539ccdf5e5', 'Ashton', 'Wehner', 'https://via.placeholder.com/640x480.png/0099bb?text=aperiam', 'angelo71@example.net', '$2y$12$cyegvYqOa.Vccj12w//2sOzCqeowDFCCahqrjxFXVwNf5UDrORb22', 'admin', NULL, '2023-12-07 09:54:31', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('051c27a8-392c-4cc7-9f39-77a41480b597', 'Bridgette', 'Langworth', 'https://via.placeholder.com/640x480.png/003322?text=id', 'willis.hammes@example.com', '$2y$12$l9dnPFxgck868VG0oPrDYeoVb9DvFQ3Q5Zu6ajRNqGMblSb9I4Fg6', 'manager', NULL, '2023-12-07 09:54:34', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('084de907-fab8-4726-8c42-b5f26c8127e0', 'Kathryn', 'Goodwin', 'https://via.placeholder.com/640x480.png/00eebb?text=assumenda', 'pstamm@example.org', '$2y$12$WtSL7eFabGnaJXOOKw01BOFQX5p5RsPc95ZUJnGoUnj42JgtuzxBS', 'user', NULL, '2023-12-07 09:54:37', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('091e3e71-e13e-4bfb-a11a-dd28619c4679', 'Bae', 'Suzy', 'image_profile-20240112031034png', 'suzy@gmail.com', '$2y$12$2qcwMkZlAA10lNPd8Grrnu2uLYgnTLnSJOWoqP3CLNMXbt2u4kzau', 'staff', NULL, '2024-01-12 03:10:35', '2024-01-15 03:07:31', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('0e1fe7a3-1efc-4fa5-8001-293215635209', 'Alize', 'Bartoletti', 'https://via.placeholder.com/640x480.png/00cc99?text=illum', 'gavin.okuneva@example.org', '$2y$12$tEG4p8t1NHkVBYnVq5UWzuN1eoxLgVdAlyoeThpBje0KWWw404GNq', 'manager', NULL, '2023-12-07 09:54:24', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('11e548bb-b87d-471b-9655-0153577f05c2', 'WILLY', 'RIETH', 'image_profile-20240301090415png', 'willy@pamcargo.com', '$2y$12$X6PiTm7K09Y5/Kkw8IkKGeFtzaPkzKftC5z.5WQSpynfnZjSKgRRu', 'SalesTeam', NULL, '2024-03-01 09:04:16', '2024-03-04 08:18:28', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('1cb4e823-48f9-46b2-bce5-c8d73189761a', 'Cleveland', 'Kuvalis', 'https://via.placeholder.com/640x480.png/00dd77?text=ab', 'ebert.keagan@example.net', '$2y$12$Ec.d4jv3Hrqhnf/cmzNaPeGttgi/MACmoeubGP0Ti/VBEP6r1AJsW', 'manager', NULL, '2023-12-07 09:54:36', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('1d979ca4-770b-41f6-8853-9aa2feb549ed', 'Lee', 'Ji Eun', 'image_profile-20240111075400png', 'iu@gmail.com', '$2y$12$i3OuGLQGbaeklIx.Xl5zVusKnN0yVt.B9Dug4XhP8LwIWfMCPpzcO', 'admin', NULL, '2024-01-11 07:54:01', '2024-01-11 07:54:01', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('2172b6c2-d37f-4b07-b808-9085bfbd5b7c', 'Camryn', 'Sipes', 'https://via.placeholder.com/640x480.png/00bbee?text=commodi', 'yabshire@example.net', '$2y$12$x78epJjPDLUNQfFW1uMrzeB1qUuV9PnBbykDvSH/dVAZymaGbbsP.', 'admin', NULL, '2023-12-07 09:54:33', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('217b5f7e-4947-4855-ac93-ccbba0deddef', 'MARC', '-', 'image_profile-20240301090718png', 'marc@pamcargo.com', '$2y$12$JhE9tiIlBVi6gDLhEDAWTuYl7w2TAzx4c/3d.r4M5jL5cvW5NgqqO', 'SalesTeam', NULL, '2024-03-01 09:07:18', '2024-03-04 08:19:59', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('22651a68-7a2d-4354-81e6-3dab342eb9f7', 'Rembon', 'Owner', NULL, 'rembontesting01@gmail.com', '$2y$12$4/hzme/6d1L.i1lDwBErv.0UzVlAjjL7msco3uxakf8IdJYprU38q', 'sales-person', NULL, '2024-02-19 03:13:47', '2024-02-19 03:13:47', NULL, NULL, 1, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('240ee150-9ecf-4090-a0db-6f8760b61051', 'Wilfrid', 'Murazik', 'https://via.placeholder.com/640x480.png/008866?text=quidem', 'logan55@example.org', '$2y$12$Vad7ykPbKC9VzTCr0NNJy.NFznePM7MvF.YkMV..8KO/sZcmhFyp.', 'manager', NULL, '2023-12-07 09:54:33', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('25d48949-3d08-4445-9db0-a3209b760706', 'Joany', 'Eichmann', 'https://via.placeholder.com/640x480.png/0055cc?text=illo', 'gerlach.wilfred@example.com', '$2y$12$9CNOd9.ONF.LjLSg39v8Se9FqojXh3qFUaLmEKJ1WXtIiSf.AN1ym', 'user', NULL, '2023-12-07 09:54:36', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('2797bf8b-7863-483a-b584-a8f217f3297a', 'Mohamed', 'Frami', 'https://via.placeholder.com/640x480.png/006677?text=voluptas', 'hauck.america@example.org', '$2y$12$bgkyonJcQZhkxdhXcPXx4uM3CstCKM60bcqtWSHVMycurJqOipB0u', 'admin', NULL, '2023-12-07 09:54:35', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('2876100f-0d9b-426d-8f84-87666db0a085', 'Cristina', 'Mayer', 'https://via.placeholder.com/640x480.png/00aa44?text=cupiditate', 'cmitchell@example.org', '$2y$12$X7ANxy3HPW10dtwPsJ0dD.pyg7etDql2WhbxyOi5GINAbGxAcqmUW', 'manager', NULL, '2023-12-07 09:54:31', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('395460eb-fc27-449c-9f83-eb71d3949388', 'Lee', 'Ji Eun', 'image_profile-20240111081749png', 'iu@gmail.com', '$2y$12$9I5lKJCLKVTjE8kkzQmnG.B8eTIHzVUFRX6TKdjyIJDv7weYzD1BW', 'staff', NULL, '2024-01-11 08:12:05', '2024-01-12 02:35:35', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('3aed0010-fe7b-40b8-a02d-6b1c013557a8', 'STEFANO', 'PETTENO', 'image_profile-20240301092044png', 'stefano.petteno@sea-air.it', '$2y$12$MRAvAxQT0Qihwmp/mRF2fefdZTpXQi5nAHidbdUuQD3./aaJC.v/O', 'SalesTeam', NULL, '2024-03-01 09:20:45', '2024-03-01 09:20:45', NULL, NULL, NULL, '69a08044-c0f4-48ac-906c-ebf966abf62f', 'erp');
INSERT INTO "usr"."users" VALUES ('3d23c2bc-b127-4c77-968a-72326afac436', 'Lee', 'Ji Eun', 'image_profile-20240111075431png', 'iu@gmail.com', '$2y$12$0BzD/XB03VY/U/iu0Cgeh.kmqnrFGnJXdk63nMSz4qCP0MMkdPH3i', 'admin', NULL, '2024-01-11 07:54:32', '2024-01-11 07:54:32', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('3dbb5866-0fe3-43fb-9d9b-a8f6371d9578', 'Linda', 'Sawayn', 'https://via.placeholder.com/640x480.png/0022bb?text=ducimus', 'cynthia93@example.net', '$2y$12$3dUftWhXCR2BYga6SWeVQ.MNxY6UzT3sKg5tTFClaDYif1.bmtklu', 'manager', NULL, '2023-12-07 09:54:23', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('3fa96aee-4854-4db6-81fb-feefe7521213', 'Jhony', 'Doe', 'image_profile-20240221095656png', 'jhony.doe@pamcargo.com', '$2y$12$NRubkmP/EaBwXGHkHnO4QerY.2l6uzUVmLwnQU0/.1tcs7WXz6iae', 'SalesTeam', NULL, '2024-02-21 09:56:57', '2024-02-21 09:57:24', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('43b7f4fb-7c04-412d-92ab-1221d70534cc', 'Chanel', 'Gibson', 'https://via.placeholder.com/640x480.png/005555?text=eum', 'jerrell64@example.com', '$2y$12$nTxUZi02r5raT3V1nVkJs.F5u60LMhqE/xiuGWZcIZBGCkypVvZxi', 'admin', NULL, '2023-12-07 09:54:27', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('5321b8b7-0020-4c69-94ff-fdb6ab4ad21b', 'Employee', 'Examp', 'image_profile-20240112030307jpg', 'employee@pamcargo.com', '$2y$12$HM7mqal3uadZJeggbvIfuOlAOHqTzUPGYlkySyOVI6XdZn1KrkzWe', 'admin', NULL, '2024-01-12 03:03:07', '2024-01-12 03:03:07', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('57176701-6219-452c-8b94-f961435c7d7d', 'Ella', 'Friesen', 'https://via.placeholder.com/640x480.png/00bb77?text=enim', 'amira01@example.com', '$2y$12$jopc5oH67NZFE2OAHTPhRerdDKo14KlPJWKA3Jxo5UtwbjkMKJrli', 'manager', NULL, '2023-12-07 09:54:30', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('5801d336-53e7-46eb-995e-7e1d6efe68be', 'Heaven', 'Feest', 'https://via.placeholder.com/640x480.png/007777?text=sit', 'llang@example.org', '$2y$12$7lQEe6wvJcBfVzv.CbYmwuN1sFml5k03ceU9ENbJkR1x/x3zmywGK', 'user', NULL, '2023-12-07 09:54:30', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('58d10618-f2a0-4d1c-b449-ba17e5822aab', 'Muhamad Tegar', 'Kurniawan', 'image_profile-20240219025505jpg', 'tegar@sales.com', '$2y$12$aYwQueKhjN/ZA78n3G5Jmes8iYTbewx0UMq5XctnFj/7w8i.ViTKG', 'SALES TEAM', NULL, '2024-02-19 02:55:05', '2024-02-19 02:55:05', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('5e0ab519-3917-4e96-baca-03ca6e4a7d6b', 'Aang', 'Wiadi', NULL, 'aang@pamcargo.com', '$2y$12$wfAvViaMwadfr2iogilaAOdz5HV/Ju3xUj8Ai.r000.H7APOLGFEm', 'sales-person', NULL, '2023-12-13 05:06:48', '2023-12-13 05:06:48', NULL, NULL, 1, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('653b05a8-e8dd-43ef-9b46-721d13ef1bda', 'Emma', 'Wolf', 'https://via.placeholder.com/640x480.png/00ddff?text=fugiat', 'ugerlach@example.net', '$2y$12$3KrCry304rIpKIiSjFi4b.Ys5vliceypb6Ix5ZvEazb46KHN.n3pu', 'admin', NULL, '2023-12-07 09:54:27', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('692db7d7-b20b-4f6d-ad3d-5d88c8433d41', 'Muhamad Ferdinal', 'Sales', NULL, 'ferdinal@gmail.com', '$2y$12$5CsYUxiZF4VsN55WajxMSe0UPUFwFo3fqz4gvgokb/.E6JxAKFQ4G', 'sales-person', NULL, '2023-12-08 02:45:33', '2023-12-08 02:45:33', NULL, NULL, 1, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('6b6a5e34-9786-4c63-9d56-a10c0fd8562c', 'Ebony', 'Boyle', 'https://via.placeholder.com/640x480.png/0033cc?text=ea', 'dimitri70@example.com', '$2y$12$H6igQDRI6tRKZ976NRgC3O6PMNwfSafG4f/quJWkuGNOPbkAckufO', 'user', NULL, '2023-12-07 09:54:25', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('6bfa9481-a339-4263-bae1-e800bc8c7d99', 'Joong', 'Archen', 'image_profile-20240115030606png', 'joong@gmail.com', '$2y$12$m/c4JA.APRxV0O/Q/hAtAuzKg0oyUTJpJw2vMdOcFoayEhA1e6t2W', 'staff', NULL, '2024-01-15 03:06:07', '2024-01-15 03:08:06', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('6d861f20-8f24-4630-998d-710a212d7526', 'Lee', 'Ji Eun', 'image_profile-20240111080640png', 'iu@gmail.com', '$2y$12$rOABqt0tp/N2kmwdw.OrGe0b1YuSjW9nrfUn06XwD.thOYleqL386', 'admin', NULL, '2024-01-11 08:06:41', '2024-01-11 08:06:41', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('6f78b18a-4d44-4b02-925d-3a61b8d9b9a0', 'Jaunita', 'Schamberger', 'https://via.placeholder.com/640x480.png/00eeff?text=nihil', 'vada64@example.com', '$2y$12$06uHvAa1jI8rioVRbCT.Pu9Aff8ECoSVj/txQqsYWhduJ7yx9sjyW', 'admin', NULL, '2023-12-07 09:54:35', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('72b84eb1-5e89-4bd2-b714-c91e50c67e12', 'Justen', 'Cummings', 'https://via.placeholder.com/640x480.png/0000ff?text=quis', 'uboyle@example.com', '$2y$12$EHDdfxhviHkyfeaIZPVE2.Xfd3a/0YH9I7c1PbfBbatz0/9YzZ.TK', 'manager', NULL, '2023-12-07 09:54:26', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('7f100b41-5fa1-4fe9-af2b-66d7c4d93db5', 'Branson', 'Steuber', 'https://via.placeholder.com/640x480.png/0077aa?text=saepe', 'user@pamcargo.com', '$2y$12$oZoBwlgDNc/ErY1Nqp/QCeCEIoYZdzo1ljnV63XaFjVRt38Hlgc5q', 'admin', NULL, '2023-12-07 09:54:38', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('80d7ba11-6b20-46b5-b376-0aadc0dfd24f', 'Lesly', 'King', 'https://via.placeholder.com/640x480.png/008822?text=voluptatem', 'adrain.hintz@example.net', '$2y$12$K4J7DBRuVvGj2xfTf1KRq.BsW2N.Q4yvUJuFQ4fy8E1l/rIMiHjhS', 'admin', NULL, '2023-12-07 09:54:29', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('82e1a5fc-d118-43cf-a5a2-e987ee9ad612', 'Alverta', 'Jaskolski', 'https://via.placeholder.com/640x480.png/006677?text=laborum', 'colton.heathcote@example.org', '$2y$12$UyAhMbMArjSd9lgJZp0oeO6ZlmWS0Uw3lcMRv2zc/DjMt6VzdWQiu', 'manager', NULL, '2023-12-07 09:54:28', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8340dcda-3075-4126-8596-145c4876655a', 'Dubai Person', 'VIP', NULL, 'dubal@pamcargo.com', '$2y$12$jjfJhTpfoKt4weot5kscGu12/hmJsTkAA6tAD6el0KXj/mfzU33JG', 'sales-person', NULL, '2023-12-08 03:09:17', '2023-12-08 03:09:17', NULL, NULL, 1, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8b6b368e-0940-477b-bf02-056e4c36d0ab', 'Joey', 'Metz', 'https://via.placeholder.com/640x480.png/003388?text=in', 'adriana69@example.org', '$2y$12$YKIZNTB3HHPaLY4zq8Oj1uzTg5RxfMXpK.waH.YE2x/LkbdcsOJNq', 'manager', NULL, '2023-12-07 09:54:32', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8c3d9a05-e6ae-4e0e-b68b-e5b0deea660f', 'Kianna', 'Shanahan', 'https://via.placeholder.com/640x480.png/0044dd?text=maiores', 'nader.mariane@example.net', '$2y$12$8YdeQSRGttK77o0y58Dei.XIUNWEr2zO.pVSSrz14nU2J560E.VCi', 'admin', NULL, '2023-12-07 09:54:37', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8c5210f4-4ae3-48aa-b823-a6a9430135c1', 'Shanna', 'Rosenbaum', 'https://via.placeholder.com/640x480.png/008877?text=ipsum', 'andrew.bergstrom@example.org', '$2y$12$B9qV7R.yiKJTfQ8hE6OtyOjOF6wxrhTWQ8RzNoe02tKypBjoXlF46', 'admin', NULL, '2023-12-07 09:54:36', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8d6ac726-dc84-4889-9d4e-f157e764e131', 'Aang', 'Wiadi', '', 'aang@pamcargo.com', '$2y$12$NFDtGiz8oeahXbti333Sn.7ZuSHVTV/59CqmtLjRTfD7j4jg3DJYO', 'SALES TEAM', NULL, '2024-02-16 09:59:01', '2024-02-16 10:01:12', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8e77b9a6-e299-4fc3-aa39-cfb43a3d7c7a', 'Cecelia', 'Grimes', 'https://via.placeholder.com/640x480.png/007755?text=dolor', 'fritchie@example.org', '$2y$12$/RCedWO0YCaWYXKCtil06uXuJihqpdMHPdLAD3E1g7iSPWgw5Jn6y', 'admin', NULL, '2023-12-07 09:54:27', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('8fef9cc9-0ed4-4b20-913b-47e17351f28e', 'JUSTIN', 'JORDAN', 'image_profile-20240301091516png', 'Justin.Jordan@xllog.com', '$2y$12$yobDnVdRDH9gm3mA3WG27eCrYoIHFi/PPR2l6tWx8a/lavMT0CmNu', 'SalesTeam', NULL, '2024-03-01 09:15:16', '2024-03-01 09:15:16', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('95b02856-a10b-411f-93db-7d3565e322f5', 'Carmine', 'Blick', 'https://via.placeholder.com/640x480.png/0011ee?text=nostrum', 'emmanuel.carter@example.net', '$2y$12$wBB4O1DrqwyvTEfWruohP.lz6HwD7fV..u9ZThYiq1Ub3Cos9HMb2', 'manager', NULL, '2023-12-07 09:54:32', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('96b288de-4810-40e5-a661-5c7d2c249748', 'Ariane', 'Oberbrunner', 'https://via.placeholder.com/640x480.png/00ddaa?text=iure', 'ernie.grant@example.com', '$2y$12$6jFeLlaWBea7TEPhBVM5Lu/MgZVTNluMP25rgovS.90q04zJzShwm', 'user', NULL, '2023-12-07 09:54:34', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('9a3719d4-b22a-46cd-9579-c91a41e50eb9', 'Alayna', 'Stokes', 'https://via.placeholder.com/640x480.png/00cc55?text=ducimus', 'vlakin@example.org', '$2y$12$4VO6qXa5aoBJSE6b3hA14epGMHw/zWDyJGyoiAowMSnSVD0hLSBcC', 'admin', NULL, '2023-12-07 09:54:34', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('9bae318a-6c97-4628-9ea5-4438aba313a0', 'STEFAN', 'SKOGLUND', 'image_profile-20240301092302png', 'sts@linklog.com', '$2y$12$JyNYPKtOf1Vx60W7U0ydK.7aB/PRF/4GhkEqLXMDTeKQbmfK50/F6', 'SalesTeam', NULL, '2024-03-01 09:23:02', '2024-03-01 09:23:02', NULL, NULL, NULL, '8e3d8a4f-3515-4844-9319-950204e52ebe', 'erp');
INSERT INTO "usr"."users" VALUES ('9d8dd3c9-9553-4fc4-b421-4ec727acc43c', 'ALISA', 'KRAUSS', 'image_profile-20240301091304png', 'alisa.krauss@xllog.com', '$2y$12$KYOVLKKRUj8Zc50gAzj4HOLuUjxRfvhmrddbjwGpOIWRRfHPmGsci', 'SalesTeam', NULL, '2024-03-01 09:13:04', '2024-03-01 09:13:04', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('9f07ac2a-a68e-4892-aaea-429be3f5afba', 'Ara', 'Koss', 'https://via.placeholder.com/640x480.png/00ee66?text=repellat', 'cora.zieme@example.org', '$2y$12$L/ANdEDhfUqRlmrxODSHnO67EHNR7jNWhQKy/hDdqDWh.uYTkJvNO', 'manager', NULL, '2023-12-07 09:54:23', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('a86af263-06a7-4bb4-bdce-92f39539ee31', 'Vincent', 'Hammes', 'https://via.placeholder.com/640x480.png/00ee77?text=non', 'yoshiko.ohara@example.com', '$2y$12$bXvchgrUzUld0DMatnm70uEeb8svMJY8hxN58fotZMZZPhQshVUbu', 'user', NULL, '2023-12-07 09:54:24', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('addc9087-824b-4795-a584-848a1b8255c3', 'Lauren', 'Ebert', 'https://via.placeholder.com/640x480.png/007777?text=qui', 'dicki.edwardo@example.com', '$2y$12$U.FySbmjtVI5WrqNYTeVf.AbECw4MOqozxBU.PUEONV/UQHKQBMHG', 'manager', NULL, '2023-12-07 09:54:35', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('ae286ed6-117c-428b-827e-2b696a388915', 'Shayne', 'Runolfsson', 'https://via.placeholder.com/640x480.png/008844?text=veniam', 'jermey97@example.org', '$2y$12$XK.p1WA4VAczQfq2ds2BIOf0EhP84268odP.Gr2QE0UYfzVDHtL5y', 'manager', NULL, '2023-12-07 09:54:31', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('aed0ced7-6344-4043-ad19-32ff5250e96a', 'Lily', 'Pouros', 'https://via.placeholder.com/640x480.png/008855?text=similique', 'nconnelly@example.com', '$2y$12$CvLQS1qSm.3hdAZtlcU5j.L5fOd9plQShcnnTBxVbhKrOEqhTxvMa', 'admin', NULL, '2023-12-07 09:54:27', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('af4f6be4-b47a-473b-a28a-dd84670e9e0d', 'Kaylie', 'Pollich', 'https://via.placeholder.com/640x480.png/009999?text=velit', 'margarita.howe@example.com', '$2y$12$B8Atm8spbcWID1cKuOBs5.c0hq5CeW0/uLq3HglZW4tP7rZQ89Afq', 'admin', NULL, '2023-12-07 09:54:25', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('af667d81-076e-4ee0-9dee-c93c193a1cbe', 'Archibald', 'Lockman', 'https://via.placeholder.com/640x480.png/00ee55?text=deleniti', 'kimberly.thompson@example.com', '$2y$12$uUemuEFUCNtULT5vHaqu..fhxLysAMFUe5aw3sq3Dg5s/CTlQfuUa', 'admin', NULL, '2023-12-07 09:54:23', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b0700f78-ed83-4081-b0d9-4c988710a5cd', 'Rachel', 'Lebsack', 'https://via.placeholder.com/640x480.png/007788?text=minima', 'jordyn.marks@example.net', '$2y$12$cBdVO4FjWlnL4dYo1sJ2qeM8c/UZQ//lVT2RJlIYC2ozuXSsgGhlS', 'manager', NULL, '2023-12-07 09:54:32', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b09e94c6-1c4d-411f-9f84-c54971b605d5', 'Muhamad Tegar', 'Kurniawan', 'image_profile-20240308090531png', 'tegar@rembon.com', '$2y$12$em8qhTeGl3SOpAH5xLGNJuE3n3Px9Ya33RRrdi3tG1ki6L3QrVQSq', 'SalesTeam', NULL, '2024-03-08 09:05:31', '2024-03-08 09:05:31', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b2718175-d1c8-49da-a5e5-fad80afb5e50', 'Adrianna', 'Heaney', 'https://via.placeholder.com/640x480.png/004400?text=voluptas', 'rkunze@example.org', '$2y$12$XBlAV2gCaY04RLhxjHuHvOC/75RFKAwYZI5LufDpCex2a65RRSoru', 'manager', NULL, '2023-12-07 09:54:29', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b400d2ab-33d7-49dc-bc68-1add272b3d47', 'Gunner', 'Miller', 'https://via.placeholder.com/640x480.png/0066ff?text=sed', 'kylie.kshlerin@example.com', '$2y$12$hJog4maMFxAHh0RwEAL2YOM8uQoCQcuE9Jl07OjZcpVrPVISskMCa', 'manager', NULL, '2023-12-07 09:54:28', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b4f6e3ca-1bb2-44ae-a099-6820ca6a554f', 'Keanu', 'Blanda', 'https://via.placeholder.com/640x480.png/009900?text=hic', 'ischimmel@example.com', '$2y$12$im8it5bdCe5VnwrP5qETZOCIQeS3yBqvGZLWwo7ejBTQiSWf.eeRm', 'user', NULL, '2023-12-07 09:54:32', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('b7cde2c9-8a9c-4d0a-b977-143cfffb7350', 'Rembon', 'Employee', 'image_profile-20240219030613jpg', 'rembontesting@gmail.com', '$2y$12$qbviJ5Z0OFDZLBkAu5Mbn.FtUMAFY.iIjYAPvSTKhTEATB0wIyIWG', 'humanresource', NULL, '2024-02-19 03:06:13', '2024-02-19 03:06:13', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('ba55551a-082e-4c08-8098-e0e4cb7f3b72', 'Lynn', 'Jones', 'https://via.placeholder.com/640x480.png/00ff88?text=dolor', 'amara64@example.com', '$2y$12$HxoDPoADh62iManoD6m2.eP.CY1NOybIb00phDkTSdMqqFBN2KXJS', 'admin', NULL, '2023-12-07 09:54:25', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('c1224f61-ce20-4a16-9fb6-479797421f8a', 'Johathan', 'Ritchie', 'https://via.placeholder.com/640x480.png/000000?text=veniam', 'steve19@example.com', '$2y$12$EOhNPe.FoHf9nYPrRe51UuUkicUOHumIOCTtoSrgkZJPp/4OAC89C', 'manager', NULL, '2023-12-07 09:54:30', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('c555c425-7710-498d-9ea4-da7ed226641f', 'Bae', 'Suzy', 'image_profile-20240215043330png', 'suzy@gmail.com', '$2y$12$8/HhpKBX2L1.vK4n0hBqy.9eol8cbFO1VCq.5lnGmybZaAfE59yPW', 'staff', NULL, '2024-02-15 04:33:30', '2024-02-15 07:22:08', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('ca7242e8-2c7f-4cfc-82ba-36851f69f27d', 'Tegar', 'Kurniawan', 'https://via.placeholder.com/640x480.png/000099?text=maiores', 'tegar@rembon.com', '$2y$12$LkvXcqb9cHruoTzirZ5La.dCUCfQSfN2j6YAR4Fy5YMxeRtka4DC6', 'user', NULL, '2023-12-07 09:54:22', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('cba9928a-8195-4e6e-beef-3e4194e9264c', 'Felicity', 'Veum', 'https://via.placeholder.com/640x480.png/008855?text=sed', 'albertha32@example.net', '$2y$12$fkDoT.5RGA/zI/K0CNSOjuWjiT1dbMKxWMXOCLCnFaOOs..vMAURO', 'user', NULL, '2023-12-07 09:54:33', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('cd747b2f-30e9-4ea1-a84c-0df36748de6b', 'Kiara', 'Weber', 'https://via.placeholder.com/640x480.png/000022?text=maxime', 'ccummerata@example.net', '$2y$12$DUjuk2YmlSnCIbwlAoQ/leDjW1ghN7TkeUQ5FvrqUDm0C8YjyMnLu', 'user', NULL, '2023-12-07 09:54:36', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('d7614691-6940-42de-8810-bfc96f967beb', 'ALFREDO', '-', 'image_profile-20240301093148png', 'alfredo@pamcargo.com', '$2y$12$p6EM.f2FB3VYXFsIDB4XwuD.SBERgaY5p/pB09lteYMqLh108B1da', 'SalesTeam', NULL, '2024-03-01 09:31:49', '2024-03-01 09:31:49', NULL, NULL, NULL, '3ff42664-7f75-449a-9051-6b49e163e5d6', 'erp');
INSERT INTO "usr"."users" VALUES ('dab99732-5ada-408f-91b9-8bc687dbd7d8', 'Loy', 'Sauer', 'https://via.placeholder.com/640x480.png/000044?text=est', 'ctorp@example.org', '$2y$12$.zodKUUj50Vsdb30iyGotOMrtTnDgcDbZDCneUMxIsNs6ByzLcyny', 'user', NULL, '2023-12-07 09:54:30', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('db5f7462-1281-4952-8f93-ec2d48eebdda', 'Scotty', 'Bernier', 'https://via.placeholder.com/640x480.png/00aaaa?text=provident', 'stokes.kyle@example.org', '$2y$12$mz5ztDwGVKWk8kuEbJP2Zuz50XeN2yGBtvnoAY1nqV7.AD7rsYmee', 'admin', NULL, '2023-12-07 09:54:22', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('dde91f7e-9db8-4e9d-936e-e8bc1d5ea3bc', 'Muhamad Tegar', 'Kurniawan', 'image_profile-20240308085312png', 'tegar@rembon.com', '$2y$12$DEwc5NEuFreqPkpYdstmaOaa9K2WytUNLJ5A.hXrv3ApzZtu91Lui', 'SalesTeam', NULL, '2024-03-08 08:53:12', '2024-03-08 08:53:12', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('dee924ba-cb6d-4a78-92c7-7dc276becfee', 'Layla', 'Batz', 'https://via.placeholder.com/640x480.png/00ee55?text=occaecati', 'delores09@example.com', '$2y$12$LSe0x1BtOiz5YrQMJ1R6tu0s31LfAvXHZ/fYX3fhV70guzZmAw5Fa', 'admin', NULL, '2023-12-07 09:54:29', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('e084145c-2809-409f-980b-6c6ddeef07f4', 'MARTIN', 'LEHNER', 'image_profile-20240301092530png', 'martin@pamcargo.com', '$2y$12$BHeVTBmp4B8IS7gl25Zn9O5h6dlRUKFLorHMlvl0mAlKA84vvMudC', 'SalesTeam', NULL, '2024-03-01 09:25:30', '2024-03-01 09:25:30', NULL, NULL, NULL, '860bfb85-052e-41d5-ad3a-4ef5b568f205', 'erp');
INSERT INTO "usr"."users" VALUES ('ec0e868e-d279-4a78-a3b4-dddcf9dde14b', 'ANDREAS', '-', 'image_profile-20240301091118png', 'andreas@pamcargo.com', '$2y$12$XKyhf22UwmVVozft4D/4OuGIRiIFNVWBkZqsD3G4wJMT9.z3LW23.', 'SalesTeam', NULL, '2024-03-01 09:10:18', '2024-03-01 09:11:18', NULL, NULL, NULL, '12c46c87-dd6d-4310-bfaf-6c674b47d5c3', 'erp');
INSERT INTO "usr"."users" VALUES ('ed23337c-61a2-47d7-acb4-a92579e20d6d', 'Lila', 'Wintheiser', 'https://via.placeholder.com/640x480.png/00ffee?text=autem', 'pollich.zander@example.net', '$2y$12$Ax4pClllyUbmXbsEIIxlkOrLC0vvmT.yXPtWZhBumwuPmUvhYkq6S', 'admin', NULL, '2023-12-07 09:54:28', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('fc258e26-a0b4-47ca-8030-7cf01b746fab', 'Jonathan', 'Reichel', 'https://via.placeholder.com/640x480.png/00bb44?text=et', 'green.hiram@example.com', '$2y$12$lugV9a3JvJgUIB3E1lxCbO6MDgKy9gEUwmSROYrocyRqo4kDP9yQG', 'manager', NULL, '2023-12-07 09:54:26', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('fd753c19-e65c-43b4-a1a2-c633354e9565', 'JEREMY', 'JANNET', 'image_profile-20240301092848png', 'jeremy@pamcargo.com', '$2y$12$B8f1HjcjITMwC1iKz71s9eOilQJ.faOND2/m/v1nM38CT26uQOjg.', 'SalesTeam', NULL, '2024-03-01 09:28:48', '2024-03-01 09:28:48', NULL, NULL, NULL, '0a3a941f-e229-4252-b803-e54381600eb0', 'erp');
INSERT INTO "usr"."users" VALUES ('ffcd1978-ee47-41e7-88d2-0a38c2e1122f', 'Ima', 'Medhurst', 'https://via.placeholder.com/640x480.png/00ee00?text=et', 'rene49@example.net', '$2y$12$DUdFnP2rPUcw2rcsSQsCBOYaOwRegXoxKVKTbSJzpIzOW6gsTABuO', 'manager', NULL, '2023-12-07 09:54:24', NULL, NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('45b41f6d-da6d-4c8e-9a1a-55c872011df8', 'Muhamad Tegar', 'Kurniawan', '', 'tegarkurniawan145@gmail.com', '$2y$12$M8udqwDS8ZV/7mr0Eg./X.BbNQVXvWZMAGGNw7uz.bi/zji9eR3xC', 'humanresource', NULL, '2024-09-27 06:36:15', '2024-09-27 06:36:15', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('0fe50161-631a-4c6c-90ad-87799959b8c0', 'Muhamad Tegar', 'Kurniawan', 'image_profile-20240927063757jpg', 'tegarkurniawan145@gmail.com', '$2y$12$zj6.7J34RbcTscnS8SOvQOEwfeQ8l6Lj5TkO53KE/.byO1XWb1rRm', 'humanresource', NULL, '2024-09-27 06:37:57', '2024-09-27 06:37:57', NULL, NULL, NULL, NULL, 'erp');
INSERT INTO "usr"."users" VALUES ('5c67c61b-e9d5-4d07-8ce3-e2227d6a23a5', 'Pascol', 'Herzog', 'https://via.placeholder.com/640x480.png/0000ff?text=qui', 'lenora.hoppe@example.net', '$2y$12$Gvxq6ZEqKKchfWZFR.5qoODBe3YRROzBfmhmwyKBnURxsfCpwX3mu', 'admin', NULL, '2023-12-07 09:54:34', NULL, NULL, NULL, NULL, NULL, 'erp');

-- ----------------------------
-- Indexes structure for table model_has_permissions
-- ----------------------------
CREATE INDEX "model_has_permissions_model_id_model_type_index" ON "usr"."model_has_permissions" USING btree (
  "model_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_permissions
-- ----------------------------
ALTER TABLE "usr"."model_has_permissions" ADD CONSTRAINT "model_has_permissions_pkey" PRIMARY KEY ("permission_id", "model_id", "model_type");

-- ----------------------------
-- Indexes structure for table model_has_roles
-- ----------------------------
CREATE INDEX "model_has_roles_model_id_model_type_index" ON "usr"."model_has_roles" USING btree (
  "model_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "model_type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table model_has_roles
-- ----------------------------
ALTER TABLE "usr"."model_has_roles" ADD CONSTRAINT "model_has_roles_pkey" PRIMARY KEY ("role_id", "model_id", "model_type");

-- ----------------------------
-- Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "usr"."permissions" ADD CONSTRAINT "usr_permissions_name_guard_name_unique" UNIQUE ("name", "guard_name");

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "usr"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_password_resets
-- ----------------------------
ALTER TABLE "usr"."user_password_resets" ADD CONSTRAINT "user_password_resets_pkey" PRIMARY KEY ("email");

-- ----------------------------
-- Primary Key structure for table user_sales_office
-- ----------------------------
ALTER TABLE "usr"."user_sales_office" ADD CONSTRAINT "user_sales_office_pkey" PRIMARY KEY ("user_sales_office_id");

-- ----------------------------
-- Checks structure for table users
-- ----------------------------
ALTER TABLE "usr"."users" ADD CONSTRAINT "users_type_check" CHECK (type::text = ANY (ARRAY['erp'::character varying, 'operation'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "usr"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table permissions
-- ----------------------------
ALTER TABLE "usr"."permissions" ADD CONSTRAINT "usr_permissions_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "usr"."permissions" ADD CONSTRAINT "usr_permissions_modified_by_foreign" FOREIGN KEY ("modified_by") REFERENCES "usr"."users" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
