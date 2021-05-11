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

 Date: 13/03/2021 23:28:59
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (10, '19级全栈12班');
INSERT INTO `class` VALUES (11, '19级Java12班');
INSERT INTO `class` VALUES (12, '19级数媒12班');
INSERT INTO `class` VALUES (13, '19级Java34班');
INSERT INTO `class` VALUES (14, '20级Java12班');
INSERT INTO `class` VALUES (15, '20级Java34班');
INSERT INTO `class` VALUES (16, '20级全栈Python班');
INSERT INTO `class` VALUES (17, '20级数媒班');

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
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (40, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:02:52 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (41, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:03:59 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (42, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:03:59 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (43, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:04:01 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (44, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:05:17 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (45, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:05:47 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (46, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:06:24 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (47, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:07:28 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (48, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:08:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (49, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:10:39 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (50, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:11:15 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (51, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:11:56 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (52, 'DELETE', '/principal?id=4', 'admin', 1, 'Sat Mar 13 2021 21:12:03 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (53, 'DELETE', '/principal?id=5', 'admin', 1, 'Sat Mar 13 2021 21:16:01 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (54, 'DELETE', '/principal?id=4', 'admin', 1, 'Sat Mar 13 2021 21:16:13 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (55, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:16:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (56, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:19:20 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (57, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:20:46 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (58, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:18 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (59, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:45 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (60, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:48 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (61, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:22:56 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (62, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:23:23 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (63, 'PATCH', '/class', 'admin', 1, 'Sat Mar 13 2021 21:23:32 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (64, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:32 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (65, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:47 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (66, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:59 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (67, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:09 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (68, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:28 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (69, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:35 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (70, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:37:46 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (71, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:39:31 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (72, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:39:38 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (73, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (74, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (75, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (76, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (77, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (78, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (79, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (80, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (81, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (82, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (83, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (84, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:44 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (85, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:48 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (86, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (87, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:55 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (88, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (89, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (90, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (91, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (92, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (93, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (94, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (95, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (96, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (97, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (98, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:14 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (99, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:18 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (100, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:21 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (101, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:25 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (102, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:29 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (103, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:32 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (104, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:35 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (105, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:39 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (106, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:43 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (107, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:46 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (108, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (109, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (110, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (111, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (112, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (113, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:58 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (114, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:01 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (115, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:05 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (116, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:08 GMT+0800 (GMT+08:00)');
INSERT INTO `operation` VALUES (117, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:11 GMT+0800 (GMT+08:00)');


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
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (48, 10, '19级全栈12班', 1, '足球场', '2021-3-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES (49, 11, '19级Java12班', 2, '风雨操场', '2021-3-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES (50, 12, '19级数媒12班', 3, '篮球场', '2021-3-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES (51, 14, '20级Java12班', 4, '教学楼A区', '2021-3-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES (52, 17, '20级数媒班', 5, '教学楼B区', '2021-3-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES (53, 10, '19级全栈12班', 1, '足球场', '2021-3-12', '3', 6, '毛娇娇');
INSERT INTO `status` VALUES (54, 11, '19级Java12班', 2, '风雨操场', '2021-3-12', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES (55, 13, '19级Java34班', 3, '篮球场', '2021-3-12', '3', 6, '毛娇娇');
INSERT INTO `status` VALUES (56, 14, '20级Java12班', 4, '教学楼A区', '2021-3-12', '2', 6, '毛娇娇');
INSERT INTO `status` VALUES (57, 16, '20级全栈Python班', 5, '教学楼B区', '2021-3-12', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES (58, 10, '19级全栈12班', 1, '足球场', '2021-3-1', '1', 7, '徐丹丹');
INSERT INTO `status` VALUES (59, 11, '19级Java12班', 2, '风雨操场', '2021-3-1', '1', 7, '徐丹丹');
INSERT INTO `status` VALUES (60, 12, '19级数媒12班', 3, '篮球场', '2021-3-1', '1', 7, '徐丹丹');
INSERT INTO `status` VALUES (61, 14, '20级Java12班', 4, '教学楼A区', '2021-3-1', '1', 7, '徐丹丹');
INSERT INTO `status` VALUES (62, 15, '20级Java34班', 5, '教学楼B区', '2021-3-1', '2', 7, '徐丹丹');
INSERT INTO `status` VALUES (63, 14, '20级Java12班', 1, '足球场', '2021-3-3', '3', 7, '徐丹丹');
INSERT INTO `status` VALUES (64, 15, '20级Java34班', 3, '篮球场', '2021-3-3', '3', 7, '徐丹丹');
INSERT INTO `status` VALUES (65, 15, '20级Java34班', 2, '风雨操场', '2021-3-3', '1', 7, '徐丹丹');
INSERT INTO `status` VALUES (66, 16, '20级全栈Python班', 4, '教学楼A区', '2021-3-3', '2', 7, '徐丹丹');
INSERT INTO `status` VALUES (67, 17, '20级数媒班', 5, '教学楼B区', '2021-3-3', '2', 7, '徐丹丹');
INSERT INTO `status` VALUES (68, 12, '19级数媒12班', 2, '风雨操场', '2021-3-8', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (69, 10, '19级全栈12班', 1, '足球场', '2021-3-8', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (70, 13, '19级Java34班', 3, '篮球场', '2021-3-8', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (71, 15, '20级Java34班', 4, '教学楼A区', '2021-3-8', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (72, 17, '20级数媒班', 5, '教学楼B区', '2021-3-8', '1', 2, '李闯闯');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `user` VALUES (2, '李闯闯', '123456', 'principal');
INSERT INTO `user` VALUES (6, '毛娇娇', '123456', 'principal');
INSERT INTO `user` VALUES (7, '徐丹丹', '123456', 'principal');
INSERT INTO `user` VALUES (8, '杨文林', '123456', 'principal');

SET FOREIGN_KEY_CHECKS = 1;
