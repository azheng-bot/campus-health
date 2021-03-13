/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : campus_health

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 13/03/2021 15:22:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '足球场');
INSERT INTO `area` VALUES (2, '风雨操场');
INSERT INTO `area` VALUES (3, '篮球场');
INSERT INTO `area` VALUES (4, '教学楼A区');
INSERT INTO `area` VALUES (5, '教学楼B区');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '2019级全栈1212');
INSERT INTO `class` VALUES (2, '19级Java');
INSERT INTO `class` VALUES (3, '19级python');
INSERT INTO `class` VALUES (4, '19级数媒');
INSERT INTO `class` VALUES (5, '20级全栈Python');
INSERT INTO `class` VALUES (6, '20级Java');
INSERT INTO `class` VALUES (7, '20级数媒');
INSERT INTO `class` VALUES (8, '21级全栈Python');
INSERT INTO `class` VALUES (9, '21级全栈Python1');

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'method',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人名',
  `user_id` int(11) NOT NULL COMMENT '操作人id',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (1, 'GET', '/count', 'admin', 1, '');
INSERT INTO `operation` VALUES (2, 'GET', '/operation', 'admin', 1, 'function toString() { [native code] }');
INSERT INTO `operation` VALUES (3, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:09:38 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (4, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:10:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (5, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:10:21 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (6, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:10:34 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (7, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:11:05 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (8, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:11:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (9, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:12:33 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (10, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:14:11 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (11, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:14:30 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (12, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:15:45 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (13, 'GET', '/operation', 'admin', 1, 'Sat Mar 13 2021 14:16:09 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (14, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:53:11 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (15, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:53:14 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (16, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:53:21 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (17, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:53:27 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (18, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:54:49 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (19, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:55:05 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (20, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:55:48 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (21, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:56:00 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (22, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 14:56:15 GMT+0800 (GMT+08:00)');

-- ----------------------------
-- Table structure for principal
-- ----------------------------
DROP TABLE IF EXISTS `principal`;
CREATE TABLE `principal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '责任人名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of principal
-- ----------------------------
INSERT INTO `principal` VALUES (1, '李创创');
INSERT INTO `principal` VALUES (2, '杨文林');
INSERT INTO `principal` VALUES (3, '徐丹丹');
INSERT INTO `principal` VALUES (4, '肖威');
INSERT INTO `principal` VALUES (5, '毛娇娇');
INSERT INTO `principal` VALUES (6, '的');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间（格式：YYYY-MM-DD)',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打扫情况（0：未检查；1：优；2：良；3：差；）',
  `principal_id` int(11) NOT NULL COMMENT '责任人id',
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '责任人名',
  PRIMARY KEY (`id`, `principal_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 1, '2019级全栈1212', 1, '足球场', '2021-1-20', '0', 3, '徐丹丹');
INSERT INTO `status` VALUES (7, 1, '2019级全栈1212', 1, '足球场', '2021-2-6', '1', 3, '徐丹丹');
INSERT INTO `status` VALUES (8, 1, '2019级全栈1212', 1, '足球场', '2021-1-22', '2', 2, '杨文林');
INSERT INTO `status` VALUES (9, 1, '2019级全栈1212', 1, '足球场', '2021-1-23', '3', 2, '杨文林');
INSERT INTO `status` VALUES (10, 3, '19级python', 1, '足球场', '2021-1-24', '1', 1, '李创创');
INSERT INTO `status` VALUES (11, 1, '2019级全栈1212', 1, '足球场', '2021-1-25', '3', 3, '徐丹丹');
INSERT INTO `status` VALUES (12, 1, '2019级全栈1212', 2, '风雨操场', '2021-1-26', '2', 2, '杨文林');
INSERT INTO `status` VALUES (13, 2, '19级Java', 2, '风雨操场', '2021-1-22', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (14, 2, '19级Java', 2, '风雨操场', '2021-1-23', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (15, 2, '19级Java', 2, '风雨操场', '2021-1-24', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (16, 2, '19级Java', 2, '风雨操场', '2021-1-25', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (17, 2, '19级Java', 2, '风雨操场', '2021-1-26', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (18, 2, '19级Java', 2, '风雨操场', '2021-1-27', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (19, 3, '19级python', 3, '篮球场', '2021-1-22', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (20, 3, '19级python', 3, '篮球场', '2021-1-23', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (21, 3, '19级python', 3, '篮球场', '2021-1-24', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (22, 3, '19级python', 3, '篮球场', '2021-1-25', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (23, 3, '19级python', 3, '篮球场', '2021-1-26', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (24, 3, '19级python', 3, '篮球场', '2021-1-27', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (25, 4, '19级数媒', 4, '教学楼A区', '2021-1-22', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (26, 4, '19级数媒', 4, '教学楼A区', '2021-1-23', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (27, 4, '19级数媒', 4, '教学楼A区', '2021-1-24', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (28, 4, '19级数媒', 4, '教学楼A区', '2021-1-25', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (29, 7, '2019级全栈1212', 1, '足球场', '2021-3-12', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (30, 1, '2019级全栈1212', 2, '足球场', '2021-3-13', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (31, 1, '2019级全栈1212', 2, '足球场', '2021-3-21', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (32, 2, '2019级全栈1212', 1, '足球场', '2021-3-13', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (33, 3, '2019级全栈1212', 2, '足球场', '2021-3-31', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (34, 5, '2019级全栈1212', 1, '足球场', '2021-3-21', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (35, 8, '2019级全栈1212', 1, '足球场', '2021-3-18', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (36, 6, '2019级全栈1212', 2, '足球场', '2021-3-14', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (37, 5, '2019级全栈1212', 2, '足球场', '2021-3-19', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (38, 5, '2019级全栈1212', 2, '足球场', '2021-3-24', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (39, 7, '2019级全栈1212', 2, '足球场', '2021-3-25', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (40, 1, '2019级全栈1212', 1, '足球场', '2021-4-3', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (41, 3, '2019级全栈1212', 3, '足球场', '2021-4-2', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (42, 1, '2019级全栈1212', 2, '足球场', '2021-4-1', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (43, 2, '2019级全栈1212', 4, '足球场', '2021-3-13', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (44, 4, '2019级全栈1212', 5, '足球场', '2021-3-13', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (45, 1, '2019级全栈1212', 3, '足球场', '2021-3-13', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (46, 2, '2019级全栈1212', 4, '足球场', '2021-3-14', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (47, 3, '2019级全栈1212', 3, '足球场', '2021-3-14', '0', 2, '李闯闯');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `user` VALUES (2, '李闯闯', '123456', 'principal');
INSERT INTO `user` VALUES (3, '肖威', '123456', 'principal');

SET FOREIGN_KEY_CHECKS = 1;
