/*
Navicat MySQL Data Transfer

Source Server         : trinity
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : world4

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2012-04-20 00:28:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `custom_npc_tele_category`
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data0` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data1` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_npc_tele_category
-- ----------------------------
INSERT INTO custom_npc_tele_category VALUES ('1', 'Азерот', '0', '1', '0');
INSERT INTO custom_npc_tele_category VALUES ('2', 'Калимдор', '0', '2', '0');
INSERT INTO custom_npc_tele_category VALUES ('3', 'Нордскоп', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('4', 'Запределье', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('5', 'Арены', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('6', '[Инсты для уровней 1-60]', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('7', '[Инсты для уровней 60+]', '5', '60', '0');
INSERT INTO custom_npc_tele_category VALUES ('8', '[Инсты для уровней 70+]', '5', '70', '0');
INSERT INTO custom_npc_tele_category VALUES ('9', 'Другие напрвления', '3', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('10', 'тайное', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('11', 'старт', '0', '0', '0');
INSERT INTO custom_npc_tele_category VALUES ('12', 'инсты', '0', '0', '0');
