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

 Date: 17/05/2021 10:00:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名\r\n',
  `m_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'map id',
  `width` int(11) NULL DEFAULT NULL COMMENT '宽度',
  `height` int(11) NULL DEFAULT NULL COMMENT '高度',
  `left` int(11) NULL DEFAULT NULL COMMENT 'x轴',
  `top` int(11) NULL DEFAULT NULL COMMENT 'y轴',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '颜色',
  `shape` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '形状',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (1, '足球场', '0', 0, 0, 0, 0, '', '');
INSERT INTO `area` VALUES (2, '风雨操场', '0', 0, 0, 0, 0, '', '');
INSERT INTO `area` VALUES (3, '篮球场', '0', 0, 0, 0, 0, '', '');
INSERT INTO `area` VALUES (4, '教学楼A区', '0', 0, 0, 0, 0, '', '');
INSERT INTO `area` VALUES (5, '教学楼B区', '0', 0, 0, 0, 0, '', '');
INSERT INTO `area` VALUES (6, '教学楼1', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (7, '范德萨', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (8, '的范德萨', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (9, 'fds', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (10, 'fdsafdsafdsa', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (11, '阿德订单', '6798218772697190400', NULL, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (12, '教学楼1', '6798219526539448320', 100, NULL, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (13, '教学楼1', '6798219814356783104', 100, 50, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (14, '教学楼2', '6798219814356783104', 200, 100, NULL, NULL, NULL, '');
INSERT INTO `area` VALUES (15, '教学楼1', '6798220074432991232', 100, 50, 50, 50, '', '');
INSERT INTO `area` VALUES (16, '教学楼2', '6798220074432991232', 200, 100, 200, 50, '', '');
INSERT INTO `area` VALUES (17, '艾弗森', '6798221539377549312', 90, 60, 687, 442, 'red', 'square');
INSERT INTO `area` VALUES (18, 'as', '6798238246225711104', 306, 218, 481, 117, '', 'square');
INSERT INTO `area` VALUES (19, '发发发', '6798218401471926272', 223, 132, 11, 153, '', '');
INSERT INTO `area` VALUES (20, '发发发', '6798218401471926272', 223, 132, 548, 163, '', '');
INSERT INTO `area` VALUES (21, 'fd ', '6798218401471926272', 331, 173, 192, 242, '', '');
INSERT INTO `area` VALUES (22, 'ac', '6798218401471926272', 122, 73, 618, 426, '', '');
INSERT INTO `area` VALUES (23, 'az', '6798070331761364992', 290, 160, 154, 104, '', '');
INSERT INTO `area` VALUES (24, '赵瑞轩的宿舍', '6798070331761364992', 326, 166, 142, 299, '#fff', '');
INSERT INTO `area` VALUES (25, '赵瑞轩的区域', '6798070331761364992', 293, 170, 498, 107, '', 'ellipse');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `s_id` int(11) NOT NULL DEFAULT 1 COMMENT '学校id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (10, '19级全栈12班', 1);
INSERT INTO `class` VALUES (11, '19级Java12班', 1);
INSERT INTO `class` VALUES (12, '19级数媒12班', 1);
INSERT INTO `class` VALUES (13, '19级Java34班', 1);
INSERT INTO `class` VALUES (14, '20级Java12班', 1);
INSERT INTO `class` VALUES (15, '20级Java34班', 1);
INSERT INTO `class` VALUES (16, '20级全栈Python班', 1);
INSERT INTO `class` VALUES (17, '20级数媒班', 1);
INSERT INTO `class` VALUES (20, '21级Java12班', 1);

-- ----------------------------
-- Table structure for map
-- ----------------------------
DROP TABLE IF EXISTS `map`;
CREATE TABLE `map`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地图名',
  `s_id` int(11) NOT NULL COMMENT '学校school id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of map
-- ----------------------------
INSERT INTO `map` VALUES ('6798070331761364992', '方法d', 1);
INSERT INTO `map` VALUES ('6798070756812132352', '方法fdsafdsa', 1);
INSERT INTO `map` VALUES ('6798218401471926272', '阿正2', 1);
INSERT INTO `map` VALUES ('6798218772697190400', '阿正', 1);
INSERT INTO `map` VALUES ('6798219526539448320', 'ac', 1);
INSERT INTO `map` VALUES ('6798219688028540928', 'acc', 1);
INSERT INTO `map` VALUES ('6798219733591265280', 'acc', 1);
INSERT INTO `map` VALUES ('6798219784585613312', 'acc', 1);
INSERT INTO `map` VALUES ('6798219814356783104', 'acc', 1);
INSERT INTO `map` VALUES ('6798220074432991232', 'acc', 1);
INSERT INTO `map` VALUES ('6798238246225711104', '范德萨', 1);

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
  `s_id` int(11) NOT NULL DEFAULT 1 COMMENT '学校id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 380 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (40, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:02:52 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (41, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:03:59 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (42, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:03:59 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (43, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:04:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (44, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:05:17 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (45, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:05:47 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (46, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:06:24 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (47, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:07:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (48, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:08:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (49, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:10:39 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (50, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:11:15 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (51, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:11:56 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (52, 'DELETE', '/principal?id=4', 'admin', 1, 'Sat Mar 13 2021 21:12:03 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (53, 'DELETE', '/principal?id=5', 'admin', 1, 'Sat Mar 13 2021 21:16:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (54, 'DELETE', '/principal?id=4', 'admin', 1, 'Sat Mar 13 2021 21:16:13 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (55, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:16:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (56, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:19:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (57, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:20:46 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (58, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:18 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (59, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:45 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (60, 'PATCH', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:21:48 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (61, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:22:56 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (62, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:23:23 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (63, 'PATCH', '/class', 'admin', 1, 'Sat Mar 13 2021 21:23:32 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (64, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:32 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (65, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:47 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (66, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:36:59 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (67, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:09 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (68, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (69, 'POST', '/class', 'admin', 1, 'Sat Mar 13 2021 21:37:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (70, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:37:46 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (71, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:39:31 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (72, 'POST', '/principal', 'admin', 1, 'Sat Mar 13 2021 21:39:38 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (73, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (74, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (75, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (76, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (77, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:43:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (78, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (79, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (80, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (81, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (82, 'POST', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (83, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (84, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:44 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (85, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:48 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (86, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (87, 'PATCH', '/status', '毛娇娇', 6, 'Sat Mar 13 2021 21:44:55 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (88, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (89, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (90, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (91, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (92, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:45:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (93, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (94, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (95, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (96, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (97, 'POST', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:06 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (98, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:14 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (99, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:18 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (100, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:21 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (101, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:25 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (102, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:29 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (103, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:32 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (104, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (105, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:39 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (106, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:43 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (107, 'PATCH', '/status', '徐丹丹', 7, 'Sat Mar 13 2021 21:46:46 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (108, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (109, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (110, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (111, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (112, 'POST', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (113, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:47:58 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (114, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (115, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:05 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (116, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:08 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (117, 'PATCH', '/status', '李闯闯', 2, 'Sat Mar 13 2021 21:48:11 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (118, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:29:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (119, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:29:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (120, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:29:38 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (121, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:29:38 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (122, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:29:38 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (123, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (124, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (125, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (126, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (127, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (128, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (129, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (130, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (131, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (132, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (133, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (134, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (135, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (136, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (137, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (138, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (139, 'POST', '/status', '李闯闯', 2, 'Sun Mar 14 2021 20:30:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (140, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:48:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (141, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:49:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (142, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:49:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (143, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:49:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (144, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:49:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (145, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:49:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (146, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:50:07 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (147, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:50:07 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (148, 'POST', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:50:07 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (149, 'PATCH', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:51:16 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (150, 'PATCH', '/status', '李闯闯', 2, 'Mon Mar 15 2021 13:51:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (151, 'POST', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:53:41 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (152, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:53:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (153, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:53:49 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (154, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:54:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (155, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:54:52 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (156, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:55:19 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (157, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:55:52 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (158, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:56:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (159, 'PATCH', '/principal', 'admin', 1, 'Mon Mar 15 2021 13:56:39 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (160, 'POST', '/class', 'admin', 1, 'Mon Mar 15 2021 13:57:26 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (161, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:23 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (162, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:27 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (163, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:31 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (164, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (165, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:39 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (166, 'PATCH', '/status', 'admin', 1, 'Wed Mar 17 2021 10:50:42 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (167, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (168, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (169, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (170, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (171, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (172, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 10:59:37 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (173, 'PATCH', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:04:29 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (174, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:32:27 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (175, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:33:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (176, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:33:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (177, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:33:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (178, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:33:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (179, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:33:28 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (180, 'POST', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:34:03 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (181, 'PATCH', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:34:31 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (182, 'PATCH', '/status', '李闯闯', 2, 'Wed Mar 17 2021 11:34:35 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (183, 'POST', '/principal', 'admin', 1, 'Wed Mar 17 2021 11:37:17 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (184, 'PATCH', '/principal', 'admin', 1, 'Wed Mar 17 2021 11:37:36 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (185, 'DELETE', '/principal?id=8', 'admin', 1, 'Wed Mar 17 2021 11:37:56 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (186, 'POST', '/class', 'admin', 1, 'Wed Mar 17 2021 11:38:18 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (187, 'PATCH', '/class', 'admin', 1, 'Wed Mar 17 2021 11:38:33 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (188, 'DELETE', '/class?id=19', 'admin', 1, 'Wed Mar 17 2021 11:38:44 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (189, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:47:29 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (190, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (191, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (192, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (193, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (194, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (195, 'POST', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:48:45 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (196, 'PATCH', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:49:20 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (197, 'PATCH', '/status', '李闯闯', 2, 'Thu Mar 18 2021 17:49:27 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (198, 'POST', '/principal', 'admin', 1, 'Thu Mar 18 2021 17:52:12 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (199, 'PATCH', '/principal', 'admin', 1, 'Thu Mar 18 2021 17:52:27 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (200, 'DELETE', '/principal?id=10', 'admin', 1, 'Thu Mar 18 2021 17:52:45 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (201, 'POST', '/class', 'admin', 1, 'Thu Mar 18 2021 17:53:03 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (202, 'PATCH', '/class', 'admin', 1, 'Thu Mar 18 2021 17:53:15 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (203, 'DELETE', '/class?id=19', 'admin', 1, 'Thu Mar 18 2021 17:53:22 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (204, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:35:00 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (205, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:36:14 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (206, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:36:47 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (207, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:36:47 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (208, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:36:48 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (209, 'POST', '/status', '李闯闯', 2, 'Tue Mar 23 2021 22:36:48 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (210, 'PATCH', '/principal', 'admin', 1, 'Thu Mar 25 2021 15:55:56 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (211, 'DELETE', '/principal?id=11', 'admin', 1, 'Thu Mar 25 2021 15:56:00 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (212, 'DELETE', '/class?id=18', 'admin', 1, 'Thu Mar 25 2021 15:56:15 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (213, 'POST', '/principal', 'admin', 1, 'Thu Mar 25 2021 16:20:10 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (214, 'PATCH', '/principal', 'admin', 1, 'Thu Mar 25 2021 16:25:21 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (215, 'PATCH', '/principal', 'admin', 1, 'Thu Mar 25 2021 16:26:13 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (216, 'DELETE', '/principal?id=12', 'admin', 1, 'Thu Mar 25 2021 16:53:51 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (217, 'POST', '/class', 'admin', 1, 'Thu Mar 25 2021 17:53:36 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (218, 'DELETE', '/class?id=19', 'admin', 1, 'Thu Mar 25 2021 17:53:42 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (219, 'POST', '/class', 'admin', 1, 'Thu Mar 25 2021 17:54:01 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (220, 'PATCH', '/class', 'admin', 1, 'Thu Mar 25 2021 18:03:38 GMT+0800 (GMT+08:00)', 1);
INSERT INTO `operation` VALUES (221, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:27:56 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (222, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:31:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (223, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:36:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (224, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:39:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (225, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:39:27 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (226, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:39:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (227, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:39:48 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (228, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:40:47 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (229, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:41:26 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (230, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 10:42:34 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (231, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 11:05:02 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (232, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 11:06:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (233, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 11:27:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (234, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 11:27:11 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (235, 'PATCH', '/school', 'admin', 1, 'Tue May 11 2021 22:44:16 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (236, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:22:14 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (237, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:22:52 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (238, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:24:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (239, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:26:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (240, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:27:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (241, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:28:41 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (242, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:29:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (243, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:30:15 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (244, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:34:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (245, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 10:35:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (246, 'PATCH', '/name', 'admin', 1, 'Wed May 12 2021 11:01:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (247, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:02:04 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (248, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:14:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (249, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:14:32 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (250, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:14:49 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (251, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:16:06 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (252, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:17:51 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (253, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:18:39 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (254, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:18:47 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (255, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:19:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (256, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:19:11 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (257, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:19:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (258, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:19:28 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (259, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:22:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (260, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:22:34 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (261, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:22:35 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (262, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:33:46 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (263, 'DELETE', '/map?s_id=1', 'admin', 1, 'Wed May 12 2021 11:38:49 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (264, 'DELETE', '/map?s_id=1', 'admin', 1, 'Wed May 12 2021 11:38:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (265, 'DELETE', '/map?s_id=1', 'admin', 1, 'Wed May 12 2021 11:39:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (266, 'DELETE', '/map?id=6798073140179243008', 'admin', 1, 'Wed May 12 2021 11:39:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (267, 'DELETE', '/map?id=6798073140179243008', 'admin', 1, 'Wed May 12 2021 11:40:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (268, 'DELETE', '/map?id=6798070978955055104', 'admin', 1, 'Wed May 12 2021 11:40:35 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (269, 'DELETE', '/map?id=6798071501976375296', 'admin', 1, 'Wed May 12 2021 11:40:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (270, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 11:44:00 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (271, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 11:44:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (272, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 11:45:15 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (273, 'DELETE', '/map?id=6798072832787091456', 'admin', 1, 'Wed May 12 2021 19:52:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (274, 'DELETE', '/map?id=6798071389808103424', 'admin', 1, 'Wed May 12 2021 19:54:37 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (275, 'DELETE', '/map?id=6798071784513081344', 'admin', 1, 'Wed May 12 2021 19:54:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (276, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:12:51 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (277, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:14:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (278, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:16:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (279, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:17:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (280, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:17:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (281, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:18:09 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (282, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:18:21 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (283, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:18:28 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (284, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:19:30 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (285, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 20:25:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (286, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:25:49 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (287, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:26:28 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (288, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:26:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (289, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:27:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (290, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:29:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (291, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:29:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (292, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:31:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (293, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:31:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (294, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:31:34 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (295, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:43:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (296, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:44:41 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (297, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:45:35 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (298, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 20:45:39 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (299, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:31:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (300, 'POST', '/map', 'admin', 1, 'Wed May 12 2021 21:31:42 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (301, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:02 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (302, 'DELETE', '/map?id=6798221539377549312', 'admin', 1, 'Wed May 12 2021 21:32:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (303, 'PATCH', '/map/name', 'admin', 1, 'Wed May 12 2021 21:32:24 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (304, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:26 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (305, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (306, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:37 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (307, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (308, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:32:42 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (309, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:33:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (310, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:34:02 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (311, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:34:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (312, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:34:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (313, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:35:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (314, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:36:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (315, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:38:06 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (316, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:40:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (317, 'PATCH', '/map', 'admin', 1, 'Wed May 12 2021 21:43:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (318, 'PATCH', '/school', 'admin', 1, 'Thu May 13 2021 10:13:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (319, 'PATCH', '/map', 'admin', 1, 'Thu May 13 2021 16:37:18 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (320, 'PATCH', '/map', 'admin', 1, 'Thu May 13 2021 18:31:18 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (321, 'PATCH', '/map', 'admin', 1, 'Thu May 13 2021 18:34:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (322, 'PATCH', '/map', 'admin', 1, 'Thu May 13 2021 18:35:47 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (323, 'POST', '/status', '李闯闯', 2, 'Fri May 14 2021 09:25:46 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (324, 'POST', '/status', '李闯闯', 2, 'Fri May 14 2021 09:41:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (325, 'POST', '/status', '李闯闯', 2, 'Fri May 14 2021 09:42:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (326, 'POST', '/status', '毛娇娇', 6, 'Fri May 14 2021 10:56:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (327, 'PATCH', '/map', 'admin', 1, 'Fri May 14 2021 20:38:56 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (328, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (329, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (330, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (331, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (332, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (333, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:05:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (334, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (335, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:55 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (336, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:55 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (337, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (338, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (339, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 17:11:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (340, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:11:47 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (341, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:12:21 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (342, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:12:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (343, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:12:51 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (344, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:31:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (345, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:32:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (346, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:36:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (347, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:43:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (348, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:43:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (349, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:44:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (350, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:44:18 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (351, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:48:33 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (352, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:48:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (353, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:49:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (354, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:50:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (355, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:50:15 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (356, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:50:23 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (357, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:50:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (358, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:51:13 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (359, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:51:26 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (360, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:51:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (361, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:52:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (362, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:52:30 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (363, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:52:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (364, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:53:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (365, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:54:00 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (366, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 18:54:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (367, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:01:42 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (368, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:02:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (369, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:02:59 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (370, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:03:02 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (371, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:03:09 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (372, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:03:46 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (373, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:04:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (374, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:05:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (375, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:05:42 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (376, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:06:55 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (377, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:07:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (378, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:09:00 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (379, 'POST', '/status/quick', '毛娇娇', 6, 'Sun May 16 2021 19:10:54 GMT+0800 (中国标准时间)', 1);

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '校名',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学校logo',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '上海开放大学', 'http://localhost:3000/school/logo?imageUrl=ef875e2f3b72ec030871797aa19facff.png');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'id',
  `class_id` int(11) NOT NULL COMMENT '班级id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `area_id` int(11) NOT NULL COMMENT '区域id',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区域名',
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间（格式：YYYY-MM-DD)',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '打扫情况（0：未检查；1：优；2：良；3：差；）',
  `principal_id` int(11) NOT NULL COMMENT '责任人id',
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '责任人名',
  PRIMARY KEY (`id`, `principal_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('6798784453255761920', 10, '19级全栈12班', 23, 'az', '2021-5-14', '0', 2, '李闯闯');
INSERT INTO `status` VALUES ('6798803284929941504', 10, '19级全栈12班', 20, '发发发', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799642677689323520', 10, '19级全栈12班', 19, '发发发', '2021-5-15', '0', 6, 'undefined');
INSERT INTO `status` VALUES ('6799642677693517824', 11, '19级java12班', 20, '发发发', '2021-5-15', '0', 6, 'undefined');
INSERT INTO `status` VALUES ('6799642677697712128', 15, '20级java34班', 22, 'ac', '2021-5-15', '0', 6, 'undefined');
INSERT INTO `status` VALUES ('6799648179445960704', 11, '19级java12班', 23, 'az', '2021-5-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799648179584372736', 10, '19级全栈12班', 24, '赵瑞轩的宿舍', '2021-5-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799648179731173376', 12, '19级数媒12班', 25, '赵瑞轩的区域', '2021-5-13', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650045558919168', 10, '19级全栈12班', 23, 'az', '2021-5-6', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650045743468544', 11, '19级java12班', 24, '赵瑞轩的宿舍', '2021-5-6', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650046053847040', 13, '19级java34班', 25, '赵瑞轩的区域', '2021-5-6', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650250580692992', 12, '19级数媒12班', 6, '教学楼1', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650250744270848', 13, '19级java34班', 7, '范德萨', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650251029483520', 14, '20级java12班', 8, '的范德萨', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650251331473408', 15, '20级java34班', 9, 'fds', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650251495051264', 16, '20级全栈python班', 10, 'fdsafdsafdsa', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650251683794944', 17, '20级数媒班', 11, '阿德订单', '2021-5-16', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650983631785984', 11, '19级java12班', 24, '赵瑞轩的宿舍', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799650983828918272', 14, '20级java12班', 25, '赵瑞轩的区域', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651052368039936', 12, '19级数媒12班', 19, '发发发', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651052502257664', 15, '20级java34班', 21, 'fd ', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651052640669696', 16, '20级全栈python班', 22, 'ac', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651361559547904', 11, '19级java12班', 23, 'az', '2021-5-7', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651361689571328', 12, '19级数媒12班', 24, '赵瑞轩的宿舍', '2021-5-7', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651361827983360', 15, '20级java34班', 25, '赵瑞轩的区域', '2021-5-7', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651882177531904', 11, '19级java12班', 23, 'az', '2021-5-5', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651882332721152', 13, '19级java34班', 24, '赵瑞轩的宿舍', '2021-5-5', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799651882500493312', 15, '20级java34班', 25, '赵瑞轩的区域', '2021-5-5', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652364874813440', 12, '19级数媒12班', 13, '教学楼1', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652365030002688', 17, '20级数媒班', 14, '教学楼2', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652365315215360', 13, '19级java34班', 15, '教学楼1', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652365587845120', 12, '19级数媒12班', 16, '教学楼2', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652365730451456', 17, '20级数媒班', 18, 'as', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652365902417920', 14, '20级java12班', 12, '教学楼1', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366078578688', 12, '19级数媒12班', 6, '教学楼1', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366263128064', 13, '19级java34班', 7, '范德萨', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366544146432', 14, '20级java12班', 8, '的范德萨', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366703529984', 15, '20级java34班', 9, 'fds', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366841942016', 16, '20级全栈python班', 10, 'fdsafdsafdsa', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652366984548352', 17, '20级数媒班', 11, '阿德订单', '2021-5-14', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652367160709120', 12, '19级数媒12班', 6, '教学楼1', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652367362035712', 11, '19级java12班', 7, '范德萨', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652367517224960', 10, '19级全栈12班', 8, '的范德萨', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652367701774336', 13, '19级java34班', 9, 'fds', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652367882129408', 14, '20级java12班', 10, 'fdsafdsafdsa', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6799652368020541440', 15, '20级java34班', 11, '阿德订单', '2021-5-21', '0', 6, '毛娇娇');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  `s_id` int(11) NOT NULL DEFAULT 1 COMMENT '学校id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 1);
INSERT INTO `user` VALUES (2, '李闯闯', '123456', 'principal', 1);
INSERT INTO `user` VALUES (6, '毛娇娇', '123456', 'principal', 1);
INSERT INTO `user` VALUES (7, '徐丹丹', '123456', 'principal', 1);
INSERT INTO `user` VALUES (9, '肖威', '123456', 'principal', 1);

SET FOREIGN_KEY_CHECKS = 1;
