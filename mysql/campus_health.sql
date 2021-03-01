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

 Date: 01/03/2021 13:15:59
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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for principal
-- ----------------------------
DROP TABLE IF EXISTS `principal`;
CREATE TABLE `principal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `principal_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '责任人名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of principal
-- ----------------------------
INSERT INTO `principal` VALUES (1, '李创创');
INSERT INTO `principal` VALUES (2, '杨文林');
INSERT INTO `principal` VALUES (3, '徐丹丹');
INSERT INTO `principal` VALUES (4, '肖威');
INSERT INTO `principal` VALUES (5, '毛娇娇');

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 14, '20级全栈', 1, '操场', '2021-1-20', '1', 1, '李闯闯');
INSERT INTO `status` VALUES (7, 1, '20级全栈', 1, '操场', '2021-1-21', '0', 2, '李闯闯');
INSERT INTO `status` VALUES (8, 1, '20级全栈', 1, '操场', '2021-1-22', '1', 2, '李闯闯');
INSERT INTO `status` VALUES (9, 1, '20级全栈', 1, '操场', '2021-1-23', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (10, 1, '20级全栈', 1, '操场', '2021-1-24', '2', 2, '李闯闯');
INSERT INTO `status` VALUES (11, 1, '20级全栈', 1, '操场', '2021-1-25', '3', 2, '李闯闯');
INSERT INTO `status` VALUES (12, 1, '20级全栈', 1, '操场', '2021-1-26', '1', 2, '李闯闯');
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
