/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : cms_db

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 02/11/2018 19:30:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodeName` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fatherId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_nav
-- ----------------------------
INSERT INTO `cms_nav` VALUES (1, '用户管理', NULL, NULL);
INSERT INTO `cms_nav` VALUES (2, '管理用户', '/midPage/userManagePage', 1);
INSERT INTO `cms_nav` VALUES (3, '用户注册', '/midPage/regPage', 1);
INSERT INTO `cms_nav` VALUES (4, '文章管理', '/midPage/articleEditor', NULL);

SET FOREIGN_KEY_CHECKS = 1;
