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

 Date: 19/05/2021 17:55:22
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
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
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
INSERT INTO `area` VALUES (221, '操场', '6798070331761364992', 173, 289, 52, 35, '#f1ffe6', 'ellipse');
INSERT INTO `area` VALUES (222, '风雨操场', '6798070331761364992', 351, 124, 242, 41, '#ecf9ff', 'square');
INSERT INTO `area` VALUES (223, '篮球场', '6798070331761364992', 161, 144, 241, 179, '#ffeee4', 'square');
INSERT INTO `area` VALUES (224, '网球场', '6798070331761364992', 185, 145, 408, 179, '#f2ffee', 'square');
INSERT INTO `area` VALUES (225, '教学楼（西侧）', '6798070331761364992', 294, 173, 52, 367, '#fff7e4', 'square');
INSERT INTO `area` VALUES (226, '教学楼（东侧）', '6798070331761364992', 283, 174, 357, 367, '#ffeee4', 'square');
INSERT INTO `area` VALUES (227, '宿舍楼B', '6798070331761364992', 162, 253, 702, 289, '#d9ffff', 'square');
INSERT INTO `area` VALUES (228, '宿舍楼A', '6798070331761364992', 162, 241, 702, 40, '#ddeeee', 'square');
INSERT INTO `area` VALUES (229, '教学楼', '6800427896952459264', 261, 163, 170, 88, '', 'square');
INSERT INTO `area` VALUES (239, 'B', '6800251585772523520', 267, 158, 258, 236, '', 'square');
INSERT INTO `area` VALUES (240, 'C', '6800251585772523520', 284, 136, 255, 433, '', 'square');
INSERT INTO `area` VALUES (241, '教学楼', '6800657164672307200', 354, 200, 91, 114, '', 'ellipse');
INSERT INTO `area` VALUES (242, '教学楼', '6800665510708121600', 345, 204, 188, 111, '', 'square');
INSERT INTO `area` VALUES (243, '教学楼', '6800670956407885824', 260, 148, 141, 117, '', 'square');

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
INSERT INTO `map` VALUES ('6798070331761364992', '东校区', 1);
INSERT INTO `map` VALUES ('6800251585772523520', '西校区', 1);
INSERT INTO `map` VALUES ('6800670956407885824', '新校区', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 491 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `operation` VALUES (380, 'PATCH', '/status', '毛娇娇', 6, 'Mon May 17 2021 18:02:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (381, 'PATCH', '/status', '毛娇娇', 6, 'Mon May 17 2021 18:09:40 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (382, 'PATCH', '/status', '毛娇娇', 6, 'Mon May 17 2021 18:11:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (383, 'PATCH', '/map/name', 'admin', 1, 'Mon May 17 2021 20:49:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (384, 'POST', '/principal', 'admin', 1, 'Mon May 17 2021 22:17:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (385, 'DELETE', '/map?id=6798219733591265280', 'admin', 1, 'Tue May 18 2021 08:44:22 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (386, 'DELETE', '/map?id=6798219784585613312', 'admin', 1, 'Tue May 18 2021 08:44:24 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (387, 'DELETE', '/map?id=6798070756812132352', 'admin', 1, 'Tue May 18 2021 10:51:32 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (388, 'DELETE', '/map?id=6798218401471926272', 'admin', 1, 'Tue May 18 2021 10:51:33 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (389, 'DELETE', '/map?id=6798218772697190400', 'admin', 1, 'Tue May 18 2021 10:51:35 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (390, 'DELETE', '/map?id=6798219526539448320', 'admin', 1, 'Tue May 18 2021 10:51:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (391, 'DELETE', '/map?id=6798219688028540928', 'admin', 1, 'Tue May 18 2021 10:51:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (392, 'DELETE', '/map?id=6798219814356783104', 'admin', 1, 'Tue May 18 2021 10:51:39 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (393, 'DELETE', '/map?id=6798220074432991232', 'admin', 1, 'Tue May 18 2021 10:51:43 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (394, 'DELETE', '/map?id=6798238246225711104', 'admin', 1, 'Tue May 18 2021 10:51:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (395, 'POST', '/map', 'admin', 1, 'Tue May 18 2021 10:52:00 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (396, 'PATCH', '/status', 'admin', 1, 'Tue May 18 2021 16:02:48 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (397, 'PATCH', '/status', 'admin', 1, 'Tue May 18 2021 16:02:57 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (398, 'PATCH', '/status', 'admin', 1, 'Tue May 18 2021 16:03:23 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (399, 'PATCH', '/status', 'admin', 1, 'Tue May 18 2021 16:03:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (400, 'PATCH', '/principal', 'admin', 1, 'Tue May 18 2021 16:04:49 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (401, 'DELETE', '/principal?id=2', 'admin', 1, 'Tue May 18 2021 16:04:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (402, 'PATCH', '/class', 'admin', 1, 'Tue May 18 2021 16:05:21 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (403, 'DELETE', '/class?id=10&s_id=1', 'admin', 1, 'Tue May 18 2021 16:05:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (404, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:08:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (405, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:08:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (406, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:08:46 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (407, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:08:59 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (408, 'POST', '/status/quick', '毛娇娇', 6, 'Tue May 18 2021 16:10:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (409, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:13:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (410, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:13:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (411, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:13:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (412, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 16:13:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (413, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:18:51 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (414, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:20:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (415, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:20:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (416, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:25:37 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (417, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:25:44 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (418, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:26:49 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (419, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:27:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (420, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:28:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (421, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:31:58 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (422, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:32:13 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (423, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:37:26 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (424, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:37:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (425, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:38:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (426, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 17:38:09 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (427, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:12 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (428, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (429, 'POST', '/status/quick', '毛娇娇', 6, 'Tue May 18 2021 20:38:34 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (430, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:48 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (431, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:52 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (432, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:55 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (433, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:38:59 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (434, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:39:04 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (435, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:39:08 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (436, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:39:11 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (437, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:39:15 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (438, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 20:39:18 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (439, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 21:18:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (440, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 21:18:21 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (441, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 21:21:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (442, 'POST', '/status/quick', '毛娇娇', 6, 'Tue May 18 2021 21:32:06 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (443, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (444, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:28 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (445, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (446, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:35 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (447, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (448, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:42 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (449, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (450, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 21:32:48 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (451, 'POST', '/status/quick', '毛娇娇', 6, 'Tue May 18 2021 21:42:56 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (452, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 22:28:25 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (453, 'POST', '/status/quick', '毛娇娇', 6, 'Tue May 18 2021 22:29:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (454, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 22:29:21 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (455, 'PATCH', '/status', '毛娇娇', 6, 'Tue May 18 2021 22:29:30 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (456, 'POST', '/principal', 'admin', 1, 'Tue May 18 2021 22:30:59 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (457, 'DELETE', '/principal?id=11', 'admin', 1, 'Tue May 18 2021 22:31:03 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (458, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 22:32:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (459, 'POST', '/map', 'admin', 1, 'Tue May 18 2021 22:32:36 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (460, 'POST', '/status', '毛娇娇', 6, 'Tue May 18 2021 23:19:05 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (461, 'DELETE', '/area?id=1', 'admin', 1, 'Tue May 18 2021 23:37:37 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (462, 'DELETE', '/area?id=1', 'admin', 1, 'Tue May 18 2021 23:37:53 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (463, 'DELETE', '/area?id=1', 'admin', 1, 'Tue May 18 2021 23:40:20 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (464, 'DELETE', '/area?id=1', 'admin', 1, 'Tue May 18 2021 23:40:29 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (465, 'DELETE', '/area?id=1', 'admin', 1, 'Tue May 18 2021 23:40:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (466, 'DELETE', '/area?id=218', 'admin', 1, 'Tue May 18 2021 23:41:10 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (467, 'DELETE', '/area?id=219', 'admin', 1, 'Tue May 18 2021 23:41:17 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (468, 'DELETE', '/area?id=220', 'admin', 1, 'Tue May 18 2021 23:41:32 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (469, 'PATCH', '/map', 'admin', 1, 'Tue May 18 2021 23:41:55 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (470, 'DELETE', '/area?id=238', 'admin', 1, 'Tue May 18 2021 23:42:06 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (471, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 09:36:12 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (472, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 13:40:00 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (473, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 13:40:09 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (474, 'POST', '/status/quick', '毛娇娇', 6, 'Wed May 19 2021 13:40:45 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (475, 'PATCH', '/status', '毛娇娇', 6, 'Wed May 19 2021 13:41:23 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (476, 'DELETE', '/map?id=6800427896952459264', 'admin', 1, 'Wed May 19 2021 13:43:07 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (477, 'POST', '/map', 'admin', 1, 'Wed May 19 2021 13:43:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (478, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:12:11 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (479, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:12:19 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (480, 'POST', '/status/quick', '毛娇娇', 6, 'Wed May 19 2021 14:13:11 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (481, 'POST', '/status/quick', '毛娇娇', 6, 'Wed May 19 2021 14:13:31 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (482, 'PATCH', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:13:54 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (483, 'DELETE', '/map?id=6800657164672307200', 'admin', 1, 'Wed May 19 2021 14:16:15 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (484, 'POST', '/map', 'admin', 1, 'Wed May 19 2021 14:16:47 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (485, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:33:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (486, 'POST', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:33:46 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (487, 'POST', '/status/quick', '毛娇娇', 6, 'Wed May 19 2021 14:34:34 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (488, 'PATCH', '/status', '毛娇娇', 6, 'Wed May 19 2021 14:35:02 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (489, 'DELETE', '/map?id=6800665510708121600', 'admin', 1, 'Wed May 19 2021 14:37:38 GMT+0800 (中国标准时间)', 1);
INSERT INTO `operation` VALUES (490, 'POST', '/map', 'admin', 1, 'Wed May 19 2021 14:38:26 GMT+0800 (中国标准时间)', 1);

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
INSERT INTO `school` VALUES (1, '理工大学', '/api/school/logo?imageUrl=aa5d5f303569b456d8d2953e465926dd.jpeg');

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
INSERT INTO `status` VALUES ('6800412672564269056', 11, '19级java12班', 221, '操场', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412672723652608', 12, '19级数媒12班', 222, '风雨操场', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412672857870336', 13, '19级java34班', 223, '篮球场', '2021-5-18', '3', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412673004670976', 14, '20级java12班', 224, '网球场', '2021-5-18', '3', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412673134694400', 15, '20级java34班', 225, '教学楼（西侧）', '2021-5-18', '2', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412673281495040', 16, '20级全栈python班', 226, '教学楼（东侧）', '2021-5-18', '2', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412673419907072', 17, '20级数媒班', 227, '宿舍楼b', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800412673562513408', 20, '21级java12班', 228, '宿舍楼a', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800415401663664128', 12, '19级数媒12班', 226, '教学楼a', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800415401823047680', 14, '20级java12班', 227, '教学楼b', '2021-5-18', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800415401957265408', 15, '20级java34班', 228, '教学楼c', '2021-5-18', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800426844194738176', 11, '19级java12班', 221, '操场', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427002877841408', 12, '19级数媒12班', 222, '风雨操场', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427003016253440', 13, '19级java34班', 223, '篮球场', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427003163054080', 14, '20级java12班', 224, '网球场', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427003439878144', 15, '20级java34班', 225, '教学楼（西侧）', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427003720896512', 16, '20级全栈python班', 226, '教学楼（东侧）', '2021-5-19', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427003850919936', 17, '20级数媒班', 227, '宿舍楼b', '2021-5-19', '2', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800427004001914880', 20, '21级java12班', 228, '宿舍楼a', '2021-5-19', '1', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656291653095424', 11, '19级java12班', 221, '操场', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656440487972864', 12, '19级数媒12班', 222, '风雨操场', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656440630579200', 13, '19级java34班', 223, '篮球场', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656440773185536', 14, '20级java12班', 224, '网球场', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656440949346304', 15, '20级java34班', 225, '教学楼（西侧）', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656441142284288', 16, '20级全栈python班', 226, '教学楼（东侧）', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656441322639360', 17, '20级数媒班', 227, '宿舍楼b', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800656441515577344', 20, '21级java12班', 228, '宿舍楼a', '2021-5-20', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664385489604608', 11, '19级java12班', 221, '操场', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664688255438848', 12, '19级数媒12班', 222, '风雨操场', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664688456765440', 13, '19级java34班', 223, '篮球场', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664688700035072', 14, '20级java12班', 224, '网球场', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664689140436992', 15, '20级java34班', 225, '教学楼（西侧）', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664689417261056', 16, '20级全栈python班', 226, '教学楼（东侧）', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664689580838912', 17, '20级数媒班', 227, '宿舍楼b', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800664689815719936', 20, '21级java12班', 228, '宿舍楼a', '2021-5-21', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669782183120896', 11, '19级java12班', 221, '操场', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983111254016', 12, '19级数媒12班', 222, '风雨操场', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983266443264', 13, '19级java34班', 223, '篮球场', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983400660992', 14, '20级java12班', 224, '网球场', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983547461632', 16, '20级全栈python班', 225, '教学楼（西侧）', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983677485056', 15, '20级java34班', 226, '教学楼（东侧）', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669983824285696', 17, '20级数媒班', 227, '宿舍楼b', '2021-5-22', '0', 6, '毛娇娇');
INSERT INTO `status` VALUES ('6800669984101109760', 20, '21级java12班', 228, '宿舍楼a', '2021-5-22', '0', 6, '毛娇娇');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'admin', 1);
INSERT INTO `user` VALUES (6, '毛娇娇', '123456', 'principal', 1);
INSERT INTO `user` VALUES (7, '徐丹丹', '123456', 'principal', 1);
INSERT INTO `user` VALUES (9, '肖威', '123456', 'principal', 1);
INSERT INTO `user` VALUES (10, '我呸', '54188', 'principal', 1);
INSERT INTO `user` VALUES (11, '张三', '123456', 'principal', 1);

SET FOREIGN_KEY_CHECKS = 1;
