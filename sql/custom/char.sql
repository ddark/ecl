/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306xder
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : characters

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-03-11 13:26:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `reserved_name`
-- ----------------------------
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE `reserved_name` (
  `name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player Reserved Names';

-- ----------------------------
-- Records of reserved_name
-- ----------------------------
INSERT INTO `reserved_name` VALUES ('Admin');
INSERT INTO `reserved_name` VALUES ('Administrator');
INSERT INTO `reserved_name` VALUES ('Developer');
INSERT INTO `reserved_name` VALUES ('Gamemaster');
INSERT INTO `reserved_name` VALUES ('Gm');
INSERT INTO `reserved_name` VALUES ('Moder');
INSERT INTO `reserved_name` VALUES ('Moderator');
INSERT INTO `reserved_name` VALUES ('Админ');
INSERT INTO `reserved_name` VALUES ('Администратор');
INSERT INTO `reserved_name` VALUES ('Гейммастер');
INSERT INTO `reserved_name` VALUES ('Гм');
INSERT INTO `reserved_name` VALUES ('Куратор');
INSERT INTO `reserved_name` VALUES ('Модер');
INSERT INTO `reserved_name` VALUES ('Модератор');
INSERT INTO `reserved_name` VALUES ('Разраб');
INSERT INTO `reserved_name` VALUES ('Разработчик');
