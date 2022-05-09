/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : autoplus

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/05/2022 14:03:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'my_test', '测试', NULL, NULL, 'Test', 'crud', 'com.ruoyi.project.admin', 'admin', 'test', '测试', 'ruoyi', '0', '/', NULL, 'admin', '2022-05-09 11:41:58', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (5, '3', 'id', '编号', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-05-09 11:41:58', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '3', 'name', '名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-05-09 11:41:58', '', NULL);

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info`  (
  `api_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ID',
  `api_method` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `api_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拦截路径',
  `api_status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：-1-删除, 0-草稿，1-发布，2-有变更，3-禁用',
  `api_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注释',
  `api_type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `api_script` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '查询脚本：xxxxxxx',
  `api_schema` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口的请求/响应数据结构',
  `api_sample` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求/响应/请求头样本数据',
  `api_option` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '扩展配置信息',
  `api_create_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建时间',
  `api_gmt_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`api_id`) USING BTREE,
  UNIQUE INDEX `uk_interface_info`(`api_path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Dataway 中的API' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO `interface_info` VALUES ('i_en4me6lk42a51', 'POST', '/data-api/getUser', '1', '', 'SQL', 'select * from sys_user', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"properties\":{\"del_flag\":{\"type\":\"string\"},\"create_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_name\":{\"type\":\"string\"},\"sex\":{\"type\":\"string\"},\"phonenumber\":{\"type\":\"string\"},\"login_date\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"remark\":{\"type\":\"string\"},\"avatar\":{\"type\":\"string\"},\"login_ip\":{\"type\":\"string\"},\"create_by\":{\"type\":\"string\"},\"password\":{\"type\":\"string\"},\"update_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_type\":{\"type\":\"string\"},\"user_id\":{\"type\":\"number\"},\"nick_name\":{\"type\":\"string\"},\"dept_id\":{\"type\":\"number\"},\"update_by\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"}}}}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":8,\\n\\t\\\"executionTime\\\":4,\\n\\t\\\"value\\\":[\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":1,\\n\\t\\t\\t\\\"dept_id\\\":103,\\n\\t\\t\\t\\\"user_name\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@163.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15888888888\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":25,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"update_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":24,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"remark\\\":\\\"管理员\\\"\\n\\t\\t},\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":2,\\n\\t\\t\\t\\\"dept_id\\\":105,\\n\\t\\t\\t\\\"user_name\\\":\\\"ry\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@qq.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15666666666\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"remark\\\":\\\"测试员\\\"\\n\\t\\t}\\n\\t]\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/data-api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1647487571236', '1647487591005');
INSERT INTO `interface_info` VALUES ('i_en4megf8c-4jj', 'POST', '/data-api/msg', '1', '', 'DataQL', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":4,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/data-api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1647487705740', '1647487706943');

-- ----------------------------
-- Table structure for interface_release
-- ----------------------------
DROP TABLE IF EXISTS `interface_release`;
CREATE TABLE `interface_release`  (
  `pub_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Publish ID',
  `pub_api_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属API ID',
  `pub_method` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `pub_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拦截路径',
  `pub_status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：-1-删除, 0-草稿，1-发布，2-有变更，3-禁用',
  `pub_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注释',
  `pub_type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `pub_script` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '查询脚本：xxxxxxx',
  `pub_script_ori` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始查询脚本，仅当类型为SQL时不同',
  `pub_schema` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口的请求/响应数据结构',
  `pub_sample` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求/响应/请求头样本数据',
  `pub_option` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '扩展配置信息',
  `pub_release_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布时间（下线不更新）',
  PRIMARY KEY (`pub_id`) USING BTREE,
  INDEX `idx_interface_release_api`(`pub_api_id`) USING BTREE,
  INDEX `idx_interface_release_path`(`pub_path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Dataway API 发布历史。' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interface_release
-- ----------------------------
INSERT INTO `interface_release` VALUES ('r_en4me0cn5-3an', 'i_en4me064kamij', 'POST', '/data-api/', '-1', '', 'SQL', 'var tempCall = @@sql(`message`)<%select * from sys_user%>;\nreturn tempCall(${message});', 'select * from sys_user', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"properties\":{\"del_flag\":{\"type\":\"string\"},\"create_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_name\":{\"type\":\"string\"},\"sex\":{\"type\":\"string\"},\"phonenumber\":{\"type\":\"string\"},\"login_date\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"remark\":{\"type\":\"string\"},\"avatar\":{\"type\":\"string\"},\"login_ip\":{\"type\":\"string\"},\"create_by\":{\"type\":\"string\"},\"password\":{\"type\":\"string\"},\"update_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_type\":{\"type\":\"string\"},\"user_id\":{\"type\":\"number\"},\"nick_name\":{\"type\":\"string\"},\"dept_id\":{\"type\":\"number\"},\"update_by\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"}}}}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":8,\\n\\t\\\"executionTime\\\":3,\\n\\t\\\"value\\\":[\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":1,\\n\\t\\t\\t\\\"dept_id\\\":103,\\n\\t\\t\\t\\\"user_name\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@163.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15888888888\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":25,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"update_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":24,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"remark\\\":\\\"管理员\\\"\\n\\t\\t},\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":2,\\n\\t\\t\\t\\\"dept_id\\\":105,\\n\\t\\t\\t\\\"user_name\\\":\\\"ry\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@qq.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15666666666\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"remark\\\":\\\"测试员\\\"\\n\\t\\t}\\n\\t]\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/data-api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1647487483181');
INSERT INTO `interface_release` VALUES ('r_en4me8840-9mm', 'i_en4me6lk42a51', 'POST', '/data-api/getUser', '1', '', 'SQL', 'var tempCall = @@sql(`message`)<%select * from sys_user%>;\nreturn tempCall(${message});', 'select * from sys_user', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"properties\":{\"del_flag\":{\"type\":\"string\"},\"create_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_name\":{\"type\":\"string\"},\"sex\":{\"type\":\"string\"},\"phonenumber\":{\"type\":\"string\"},\"login_date\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"remark\":{\"type\":\"string\"},\"avatar\":{\"type\":\"string\"},\"login_ip\":{\"type\":\"string\"},\"create_by\":{\"type\":\"string\"},\"password\":{\"type\":\"string\"},\"update_time\":{\"type\":\"object\",\"properties\":{\"dayOfWeek\":{\"type\":\"string\"},\"month\":{\"type\":\"string\"},\"hour\":{\"type\":\"number\"},\"year\":{\"type\":\"number\"},\"dayOfMonth\":{\"type\":\"number\"},\"dayOfYear\":{\"type\":\"number\"},\"monthValue\":{\"type\":\"number\"},\"nano\":{\"type\":\"number\"},\"minute\":{\"type\":\"number\"},\"second\":{\"type\":\"number\"}}},\"user_type\":{\"type\":\"string\"},\"user_id\":{\"type\":\"number\"},\"nick_name\":{\"type\":\"string\"},\"dept_id\":{\"type\":\"number\"},\"update_by\":{\"type\":\"string\"},\"email\":{\"type\":\"string\"},\"status\":{\"type\":\"string\"}}}}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":8,\\n\\t\\\"executionTime\\\":4,\\n\\t\\\"value\\\":[\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":1,\\n\\t\\t\\t\\\"dept_id\\\":103,\\n\\t\\t\\t\\\"user_name\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@163.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15888888888\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":25,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"update_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":52,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":24,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"remark\\\":\\\"管理员\\\"\\n\\t\\t},\\n\\t\\t{\\n\\t\\t\\t\\\"user_id\\\":2,\\n\\t\\t\\t\\\"dept_id\\\":105,\\n\\t\\t\\t\\\"user_name\\\":\\\"ry\\\",\\n\\t\\t\\t\\\"nick_name\\\":\\\"若依\\\",\\n\\t\\t\\t\\\"user_type\\\":\\\"00\\\",\\n\\t\\t\\t\\\"email\\\":\\\"ry@qq.com\\\",\\n\\t\\t\\t\\\"phonenumber\\\":\\\"15666666666\\\",\\n\\t\\t\\t\\\"sex\\\":\\\"1\\\",\\n\\t\\t\\t\\\"avatar\\\":\\\"\\\",\\n\\t\\t\\t\\\"password\\\":\\\"$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2\\\",\\n\\t\\t\\t\\\"status\\\":\\\"0\\\",\\n\\t\\t\\t\\\"del_flag\\\":\\\"0\\\",\\n\\t\\t\\t\\\"login_ip\\\":\\\"127.0.0.1\\\",\\n\\t\\t\\t\\\"login_date\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"create_by\\\":\\\"admin\\\",\\n\\t\\t\\t\\\"create_time\\\":{\\n\\t\\t\\t\\t\\\"month\\\":\\\"MARCH\\\",\\n\\t\\t\\t\\t\\\"year\\\":2022,\\n\\t\\t\\t\\t\\\"dayOfMonth\\\":17,\\n\\t\\t\\t\\t\\\"hour\\\":10,\\n\\t\\t\\t\\t\\\"minute\\\":25,\\n\\t\\t\\t\\t\\\"monthValue\\\":3,\\n\\t\\t\\t\\t\\\"nano\\\":0,\\n\\t\\t\\t\\t\\\"second\\\":1,\\n\\t\\t\\t\\t\\\"dayOfWeek\\\":\\\"THURSDAY\\\",\\n\\t\\t\\t\\t\\\"dayOfYear\\\":76\\n\\t\\t\\t},\\n\\t\\t\\t\\\"update_by\\\":\\\"\\\",\\n\\t\\t\\t\\\"remark\\\":\\\"测试员\\\"\\n\\t\\t}\\n\\t]\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/data-api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1647487591008');
INSERT INTO `interface_release` VALUES ('r_en4meghah-6hf', 'i_en4megf8c-4jj', 'POST', '/data-api/msg', '1', '', 'DataQL', '// a new Query.\nreturn ${message};', '// a new Query.\nreturn ${message};', '{\"requestHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"requestBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"message\":{\"type\":\"string\"}}},\"responseHeader\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{}},\"responseBody\":{\"$schema\":\"http://json-schema.org/draft-04/schema#\",\"type\":\"object\",\"properties\":{\"executionTime\":{\"type\":\"number\"},\"code\":{\"type\":\"number\"},\"success\":{\"type\":\"boolean\"},\"lifeCycleTime\":{\"type\":\"number\"},\"location\":{\"type\":[\"string\",\"boolean\",\"number\",\"object\",\"array\",\"null\"]},\"message\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}}', '{\"requestHeader\":\"[]\",\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"responseHeader\":\"{}\",\"responseBody\":\"{\\n\\t\\\"success\\\":true,\\n\\t\\\"message\\\":\\\"OK\\\",\\n\\t\\\"code\\\":0,\\n\\t\\\"lifeCycleTime\\\":4,\\n\\t\\\"executionTime\\\":0,\\n\\t\\\"value\\\":\\\"Hello DataQL.\\\"\\n}\"}', '{\"enableCrossDomain\":false,\"hasor.dataway.globalConfig.responseFormat\":\"{\\n    \\\"success\\\"      : \\\"@resultStatus\\\",\\n    \\\"message\\\"      : \\\"@resultMessage\\\",\\n    \\\"location\\\"     : \\\"@blockLocation\\\",\\n    \\\"code\\\"         : \\\"@resultCode\\\",\\n    \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n    \\\"executionTime\\\": \\\"@timeExecution\\\",\\n    \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"API_BASE_URL\":\"/data-api/\",\"resultStructure\":true,\"showGitButton\":true,\"hasor.dataway.globalConfig.enableCrossDomain\":\"true\",\"CONTEXT_PATH\":\"\",\"hasor.dataway.globalConfig.resultStructure\":\"true\",\"responseFormat\":\"{\\n  \\\"success\\\"      : \\\"@resultStatus\\\",\\n  \\\"message\\\"      : \\\"@resultMessage\\\",\\n  \\\"location\\\"     : \\\"@codeLocation\\\",\\n  \\\"code\\\"         : \\\"@resultCode\\\",\\n  \\\"lifeCycleTime\\\": \\\"@timeLifeCycle\\\",\\n  \\\"executionTime\\\": \\\"@timeExecution\\\",\\n  \\\"value\\\"        : \\\"@resultData\\\"\\n}\",\"wrapAllParameters\":false,\"hasor.dataway.globalConfig.wrapAllParameters\":\"false\",\"hasor.dataway.globalConfig.showGitButton\":\"true\",\"hasor.dataway.globalConfig.wrapParameterName\":\"root\",\"wrapParameterName\":\"root\"}', '1647487706945');

-- ----------------------------
-- Table structure for my_test
-- ----------------------------
DROP TABLE IF EXISTS `my_test`;
CREATE TABLE `my_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_test
-- ----------------------------
INSERT INTO `my_test` VALUES (1, '你好');
INSERT INTO `my_test` VALUES (2, '哈哈');
INSERT INTO `my_test` VALUES (3, '测试插入');
INSERT INTO `my_test` VALUES (4, '测试插入');
INSERT INTO `my_test` VALUES (5, '测试插入41');
INSERT INTO `my_test` VALUES (7, '预编译测试a');
INSERT INTO `my_test` VALUES (8, 'aabb');
INSERT INTO `my_test` VALUES (9, 'aabbaaa');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F95B1544878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F95B1544878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.common.utils.job.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720027636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017F95B1544878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-BIO8HC61652075252217', 1652076174271, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1652075260000, -1, 5, 'PAUSED', 'CRON', 1652075252000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1652075265000, -1, 5, 'PAUSED', 'CRON', 1652075252000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1652075260000, -1, 5, 'PAUSED', 'CRON', 1652075252000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-03-17 10:25:01', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-03-17 10:25:01', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-03-17 10:25:01', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2022-03-17 10:25:01', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-03-17 10:25:01', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-03-17 10:25:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-17 10:52:24');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-07 17:12:16');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-09 11:12:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1067 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-03-17 10:25:01', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-03-17 10:25:01', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-03-17 10:25:01', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2022-03-17 10:25:01', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-03-17 10:25:01', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-03-17 10:25:01', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-03-17 10:25:01', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-03-17 10:25:01', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-03-17 10:25:01', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-03-17 10:25:01', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-03-17 10:25:01', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-03-17 10:25:01', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-03-17 10:25:01', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-03-17 10:25:01', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-03-17 10:25:01', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-03-17 10:25:01', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-03-17 10:25:01', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-03-17 10:25:01', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-03-17 10:25:01', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-03-17 10:25:01', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-03-17 10:25:01', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-03-17 10:25:01', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-03-17 10:25:01', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '测试', 0, 1, 'test', 'admin/test/index', NULL, 1, 0, 'C', '0', '0', 'admin:test:list', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '测试菜单');
INSERT INTO `sys_menu` VALUES (1062, '测试查询', 1061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'admin:test:query', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '测试新增', 1061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'admin:test:add', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '测试修改', 1061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'admin:test:edit', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '测试删除', 1061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'admin:test:remove', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '测试导出', 1061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'admin:test:export', '#', 'admin', '2022-05-09 11:13:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'interface_release', NULL, 1, '导入失败：null', '2022-05-07 17:13:11');
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_notice', NULL, 1, '导入失败：null', '2022-05-07 17:14:05');
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', NULL, 1, '导入失败：null', '2022-05-07 17:14:35');
INSERT INTO `sys_oper_log` VALUES (4, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', NULL, 1, '导入失败：null', '2022-05-07 17:15:49');
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 17:16:41');
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 17:20:03');
INSERT INTO `sys_oper_log` VALUES (7, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 17:20:31');
INSERT INTO `sys_oper_log` VALUES (8, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-07 17:20:35');
INSERT INTO `sys_oper_log` VALUES (9, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 11:41:53');
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'my_test', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 11:41:58');
INSERT INTO `sys_oper_log` VALUES (11, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (id,name)values(null,测试插入)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'', '2022-05-09 11:57:50');
INSERT INTO `sys_oper_log` VALUES (12, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (id,name)values(null,测试插入)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'', '2022-05-09 12:07:09');
INSERT INTO `sys_oper_log` VALUES (13, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (id,name)values(null,测试插入)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'', '2022-05-09 12:07:09');
INSERT INTO `sys_oper_log` VALUES (14, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (id,name)values(null,测试插入)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'', '2022-05-09 12:07:52');
INSERT INTO `sys_oper_log` VALUES (15, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (id,name)values(null,测试插入)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'测试插入\' in \'field list\'', '2022-05-09 12:10:08');
INSERT INTO `sys_oper_log` VALUES (16, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLException: Incorrect integer value: \'null\' for column \'id\' at row 1\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into my_test (`id`,`name`)values(\"null\",\"测试插入\")\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'null\' for column \'id\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'null\' for column \'id\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'null\' for column \'id\' at row 1', '2022-05-09 12:17:35');
INSERT INTO `sys_oper_log` VALUES (17, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, 'Mapper method \'com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert attempted to return null from a method with a primitive return type (int).', '2022-05-09 12:21:42');
INSERT INTO `sys_oper_log` VALUES (18, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, 'Mapper method \'com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert attempted to return null from a method with a primitive return type (int).', '2022-05-09 12:21:52');
INSERT INTO `sys_oper_log` VALUES (19, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入\"}', NULL, 1, 'Mapper method \'com.ruoyi.project.admin.mapper.DynamicMapper.dynamicInsert attempted to return null from a method with a primitive return type (int).', '2022-05-09 12:22:26');
INSERT INTO `sys_oper_log` VALUES (20, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 12:27:35');
INSERT INTO `sys_oper_log` VALUES (21, 'Test', 3, 'com.ruoyi.project.admin.controller.TestController.remove()', 'DELETE', 1, 'admin', NULL, '/admin/test/6', '127.0.0.1', '内网IP', '{ids=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 12:48:52');
INSERT INTO `sys_oper_log` VALUES (22, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入修改\",\"id\":\"5\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'PRIMARY\'\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicUpdate-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update my_test set name=?,id=?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'PRIMARY\'\n; Duplicate entry \'5\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'PRIMARY\'', '2022-05-09 12:49:04');
INSERT INTO `sys_oper_log` VALUES (23, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入修改\",\"id\":\"5\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicUpdate-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update my_test set\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-05-09 12:51:16');
INSERT INTO `sys_oper_log` VALUES (24, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入修改\",\"id\":\"5\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in com/ruoyi/project/admin/mapper/DynamicMapper.java (best guess)\r\n### The error may involve com.ruoyi.project.admin.mapper.DynamicMapper.dynamicUpdate-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update my_test set name=?,id=? where\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2022-05-09 13:02:34');
INSERT INTO `sys_oper_log` VALUES (25, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"测试插入41\",\"id\":\"5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:21:44');
INSERT INTO `sys_oper_log` VALUES (26, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"预编译测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:26:04');
INSERT INTO `sys_oper_log` VALUES (27, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"预编译测试a\",\"id\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:27:33');
INSERT INTO `sys_oper_log` VALUES (28, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"预编译测试a\",\"id\":\"7\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:29:17');
INSERT INTO `sys_oper_log` VALUES (29, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabb\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:29:27');
INSERT INTO `sys_oper_log` VALUES (30, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabb\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:29:33');
INSERT INTO `sys_oper_log` VALUES (31, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabb\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:33:40');
INSERT INTO `sys_oper_log` VALUES (32, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabb\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:34:17');
INSERT INTO `sys_oper_log` VALUES (33, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aaa\"}', NULL, 1, '', '2022-05-09 13:34:23');
INSERT INTO `sys_oper_log` VALUES (34, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabba\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:34:55');
INSERT INTO `sys_oper_log` VALUES (35, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbaa\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:35:16');
INSERT INTO `sys_oper_log` VALUES (36, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"a\"}', NULL, 1, '', '2022-05-09 13:35:38');
INSERT INTO `sys_oper_log` VALUES (37, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"a\"}', NULL, 1, '', '2022-05-09 13:36:27');
INSERT INTO `sys_oper_log` VALUES (38, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"a\"}', NULL, 1, '', '2022-05-09 13:36:27');
INSERT INTO `sys_oper_log` VALUES (39, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"a\"}', NULL, 1, '', '2022-05-09 13:37:33');
INSERT INTO `sys_oper_log` VALUES (40, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"a\"}', NULL, 1, '', '2022-05-09 13:38:02');
INSERT INTO `sys_oper_log` VALUES (41, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbaaa\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:40:14');
INSERT INTO `sys_oper_log` VALUES (42, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbaaa\",\"id\":\"9\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:40:55');
INSERT INTO `sys_oper_log` VALUES (43, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbcc\"}', NULL, 1, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'ew.paramNameValuePairs.MPGENVAL2\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: Parameter index out of range (1 > number of parameters, which is 0).', '2022-05-09 13:41:01');
INSERT INTO `sys_oper_log` VALUES (44, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbcc\"}', NULL, 1, 'nested exception is org.apache.ibatis.type.TypeException: Could not set parameters for mapping: ParameterMapping{property=\'ew.paramNameValuePairs.MPGENVAL2\', mode=IN, javaType=class java.lang.Object, jdbcType=null, numericScale=null, resultMapId=\'null\', jdbcTypeName=\'null\', expression=\'null\'}. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: org.apache.ibatis.type.TypeException: Error setting non null for parameter #1 with JdbcType null . Try setting a different JdbcType for this parameter or a different configuration property. Cause: java.sql.SQLException: Parameter index out of range (1 > number of parameters, which is 0).', '2022-05-09 13:45:48');
INSERT INTO `sys_oper_log` VALUES (45, 'Test', 1, 'com.ruoyi.project.admin.controller.TestController.add()', 'POST', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbcc\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:47:38');
INSERT INTO `sys_oper_log` VALUES (46, 'Test', 2, 'com.ruoyi.project.admin.controller.TestController.edit()', 'PUT', 1, 'admin', NULL, '/admin/test', '127.0.0.1', '内网IP', '{\"name\":\"aabbcc\",\"id\":\"10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:48:07');
INSERT INTO `sys_oper_log` VALUES (47, 'Test', 3, 'com.ruoyi.project.admin.controller.TestController.remove()', 'DELETE', 1, 'admin', NULL, '/admin/test/10', '127.0.0.1', '内网IP', '{ids=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-09 13:48:10');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-03-17 10:25:01', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-03-17 10:25:01', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-05-09 11:12:28', 'admin', '2022-03-17 10:25:01', '', '2022-05-09 11:12:28', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-03-17 10:25:01', 'admin', '2022-03-17 10:25:01', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;