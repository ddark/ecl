/*
Navicat MySQL Data Transfer

Source Server         : trinity
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : world4

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2012-04-20 00:28:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `custom_npc_tele_association`
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL DEFAULT '0',
  `dest_id` int(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`,`dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_npc_tele_association
-- ----------------------------
INSERT INTO custom_npc_tele_association VALUES ('1', '18');
INSERT INTO custom_npc_tele_association VALUES ('1', '22');
INSERT INTO custom_npc_tele_association VALUES ('1', '23');
INSERT INTO custom_npc_tele_association VALUES ('1', '39');
INSERT INTO custom_npc_tele_association VALUES ('1', '75');
INSERT INTO custom_npc_tele_association VALUES ('1', '76');
INSERT INTO custom_npc_tele_association VALUES ('1', '77');
INSERT INTO custom_npc_tele_association VALUES ('1', '78');
INSERT INTO custom_npc_tele_association VALUES ('1', '79');
INSERT INTO custom_npc_tele_association VALUES ('2', '13');
INSERT INTO custom_npc_tele_association VALUES ('2', '15');
INSERT INTO custom_npc_tele_association VALUES ('2', '23');
INSERT INTO custom_npc_tele_association VALUES ('2', '29');
INSERT INTO custom_npc_tele_association VALUES ('2', '30');
INSERT INTO custom_npc_tele_association VALUES ('2', '38');
INSERT INTO custom_npc_tele_association VALUES ('2', '48');
INSERT INTO custom_npc_tele_association VALUES ('2', '50');
INSERT INTO custom_npc_tele_association VALUES ('2', '80');
INSERT INTO custom_npc_tele_association VALUES ('2', '81');
INSERT INTO custom_npc_tele_association VALUES ('2', '82');
INSERT INTO custom_npc_tele_association VALUES ('2', '83');
INSERT INTO custom_npc_tele_association VALUES ('2', '84');
INSERT INTO custom_npc_tele_association VALUES ('3', '56');
INSERT INTO custom_npc_tele_association VALUES ('3', '57');
INSERT INTO custom_npc_tele_association VALUES ('3', '58');
INSERT INTO custom_npc_tele_association VALUES ('3', '59');
INSERT INTO custom_npc_tele_association VALUES ('3', '60');
INSERT INTO custom_npc_tele_association VALUES ('3', '61');
INSERT INTO custom_npc_tele_association VALUES ('3', '62');
INSERT INTO custom_npc_tele_association VALUES ('3', '63');
INSERT INTO custom_npc_tele_association VALUES ('3', '64');
INSERT INTO custom_npc_tele_association VALUES ('3', '65');
INSERT INTO custom_npc_tele_association VALUES ('3', '66');
INSERT INTO custom_npc_tele_association VALUES ('4', '67');
INSERT INTO custom_npc_tele_association VALUES ('4', '68');
INSERT INTO custom_npc_tele_association VALUES ('4', '69');
INSERT INTO custom_npc_tele_association VALUES ('4', '70');
INSERT INTO custom_npc_tele_association VALUES ('4', '71');
INSERT INTO custom_npc_tele_association VALUES ('4', '72');
INSERT INTO custom_npc_tele_association VALUES ('4', '73');
INSERT INTO custom_npc_tele_association VALUES ('4', '74');
INSERT INTO custom_npc_tele_association VALUES ('5', '11');
INSERT INTO custom_npc_tele_association VALUES ('5', '20');
INSERT INTO custom_npc_tele_association VALUES ('5', '33');
INSERT INTO custom_npc_tele_association VALUES ('5', '44');
INSERT INTO custom_npc_tele_association VALUES ('6', '6');
INSERT INTO custom_npc_tele_association VALUES ('6', '7');
INSERT INTO custom_npc_tele_association VALUES ('6', '8');
INSERT INTO custom_npc_tele_association VALUES ('6', '14');
INSERT INTO custom_npc_tele_association VALUES ('6', '25');
INSERT INTO custom_npc_tele_association VALUES ('6', '31');
INSERT INTO custom_npc_tele_association VALUES ('6', '32');
INSERT INTO custom_npc_tele_association VALUES ('6', '35');
INSERT INTO custom_npc_tele_association VALUES ('6', '36');
INSERT INTO custom_npc_tele_association VALUES ('6', '40');
INSERT INTO custom_npc_tele_association VALUES ('6', '43');
INSERT INTO custom_npc_tele_association VALUES ('6', '45');
INSERT INTO custom_npc_tele_association VALUES ('6', '46');
INSERT INTO custom_npc_tele_association VALUES ('6', '47');
INSERT INTO custom_npc_tele_association VALUES ('6', '49');
INSERT INTO custom_npc_tele_association VALUES ('6', '54');
INSERT INTO custom_npc_tele_association VALUES ('7', '9');
INSERT INTO custom_npc_tele_association VALUES ('7', '26');
INSERT INTO custom_npc_tele_association VALUES ('7', '27');
INSERT INTO custom_npc_tele_association VALUES ('7', '28');
INSERT INTO custom_npc_tele_association VALUES ('7', '34');
INSERT INTO custom_npc_tele_association VALUES ('7', '42');
INSERT INTO custom_npc_tele_association VALUES ('7', '55');
INSERT INTO custom_npc_tele_association VALUES ('8', '5');
INSERT INTO custom_npc_tele_association VALUES ('8', '10');
INSERT INTO custom_npc_tele_association VALUES ('8', '12');
INSERT INTO custom_npc_tele_association VALUES ('8', '19');
INSERT INTO custom_npc_tele_association VALUES ('8', '21');
INSERT INTO custom_npc_tele_association VALUES ('8', '24');
INSERT INTO custom_npc_tele_association VALUES ('8', '41');
INSERT INTO custom_npc_tele_association VALUES ('8', '53');
INSERT INTO custom_npc_tele_association VALUES ('10', '85');
INSERT INTO custom_npc_tele_association VALUES ('10', '86');
INSERT INTO custom_npc_tele_association VALUES ('10', '87');
INSERT INTO custom_npc_tele_association VALUES ('10', '88');
INSERT INTO custom_npc_tele_association VALUES ('11', '89');
INSERT INTO custom_npc_tele_association VALUES ('11', '90');
INSERT INTO custom_npc_tele_association VALUES ('12', '91');
