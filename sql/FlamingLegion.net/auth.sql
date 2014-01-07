/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2013-08-05 23:45:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(32) DEFAULT NULL,
  `staff_id` int(32) DEFAULT NULL,
  `vp` varchar(32) DEFAULT NULL,
  `dp` varchar(32) DEFAULT NULL,
  `isactive` int(32) DEFAULT NULL,
  `activation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Account System';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', 'WOW1', '7F537C66B65FEF5656AD19A55DEF310397BED826', '2F69DC767C4CD657ED6BE976464A4E1A7A3A67B9CAA7F488312235AAF78DD4D6F7B737AB959F82AA', '82E2B5AB5D2E7F0C60ED68AD7B32ABB8CC3296AC65E7B640F2AC9EE90D85AFBB', '91376261040B27BF5F96DE4D9D0F6E48FE35A450B6432CD4A7A1B99043ED700B', '', '2012-11-06 01:44:50', '192.168.1.4', '0', '0', '00', '2013-05-30 21:11:12', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('2', 'WOW2', 'FA1D95A914654F8BD19C24A6E4380BE6914344AE', '901CB5093FCC04DF04C673F95B3D1B1837EDF633977A39451ECDA6068BE944A4FE8719D9EB45C41D', '6864004B8E80CA3083C727BF5BAFF3E1EEB1DA1D8E7575BB080BD63EAEC6C442', 'F68A6CB08B95D8C004C9646389A9253DFC16F705C2979262AAC634F6A2184669', '', '2012-11-30 03:44:32', '127.0.0.1', '0', '0', '00', '2013-08-04 17:22:53', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('3', 'WOW3', '3D068872C0C502F0548F3AC6E819AB9136AE6684', 'FECDD2CCF7A2EE51093E70531166772569D0018C1BA08D7AB87A99188976B0C85A2AC6B885EE0870', '3D20C23FF42EAFAD4D55334FB368D5249E3F56154428501CA52175C1D27F0818', '8D399A9959AFF0B7B4FD8DE76F57FB8AF7FE50573A1D0B0C241244EC24597041', '', '2012-11-30 03:44:48', '127.0.0.1', '0', '0', '00', '2013-08-01 23:34:11', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('4', 'WOWW', 'BD9254216A74AE746E1172B4B71D3232F56B5A8E', '4077FA92E9979E2A9CDBBE9083AA3803BD3D8E719B6AC5D75BE7166C32B8EC823E6FC3681C3A7ECF', '1DEE93DEF8C01E5BB5F6B4172FA61C35669A41071FDFEDCBE5963759760E0DE7', '80DCB309D74E1F5276F1582C2F01AFDD40714D431982546C8F27568C5AAFC377', '', '2012-12-06 21:23:46', '127.0.0.1', '0', '0', '00', '2013-08-05 00:38:29', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('5', 'WOWW2', 'D0B3F987AFDD406E7E1D1A560CAFE9094CADA9D8', '2926C6F7BD7D04AF1CFFA8FDAF87F2AF77E29F0D86A51ADD0FD966D7899E82651ED4DF2921DFC07A', '4840C0B6B24F1F0575159D7F8CF558F849DCCD1A7C4A0F4EC1461B9200C2961D', 'E2DC87E1E8D59E7A035B8E4CC30447908B11DD32C3EB1B0ED8B1B3E0FB6B7A23', '', '2012-12-06 21:29:01', '127.0.0.1', '0', '0', '00', '2013-06-01 17:42:15', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('6', 'MANYACHOK', 'D1637718D95D856D540DFD12DFA6AAC77568AA68', 'A2127F0C2902FB835121FA4D50AEC2E1560B2750DCA7170B151CC4B2B7F1B4FD61CA254FD4E8B8B9', '1A0598CD877CCC8B3C59625AD0940DC75F9D8480676027BD44EFD089459180E1', 'BAB9C9A76077E3875AB73F285301CF20F4164BC5EFB49CD0949DEA6DFF3A7A11', '', '2012-12-19 01:50:18', '178.127.236.48', '0', '0', '00', '2013-05-30 20:25:43', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('7', 'vip', '37ab928d6e1bd740ecc97159671224a653b9dcd9', '', '', '', 'vip@m.ru', '2012-12-19 17:30:53', '127.0.0.1', '0', '0', '00', '0000-00-00 00:00:00', '0', '2', '0', '', '', '0', '', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('8', 'WOW5', 'FCADE39741F85E802DB414471438EE60CD3E4130', '', '', '', '', '2012-12-23 19:12:09', '127.0.0.1', '0', '0', '00', '0000-00-00 00:00:00', '0', '2', '0', '', '', '0', '', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('9', 'LIMER', '1AE14628C175A3202192890C56F45E89DA27C698', '2B7BB584661B2043AC558E1BA109B3AC2DF5D4A1BC9132905E0E2ADFAE6ABA6C4F6BF92D1958C8B7', '791144D674654BECB94ECE22C520A1D623316B8A781B6835F47CA35F950894E5', '98BFD32E248002D0369CFBCBF8AA1B954B1CB12C970A53DC48970BB453128EA1', '', '2012-12-23 19:14:04', '95.83.108.122', '0', '0', '00', '2013-05-30 20:36:01', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('10', 'WOW4', 'BDC81DD137773783A38902B3B2FC34D21D397A91', '3388FE874539AFE1CDC156F7AABC657FF7C8F3C519114EA2541AFAD51E27CF88974C61AE9538B2B6', '70B862FFED17EA305558C6DE42D5176BDCFE8AD360F5595CAF931A66E894FBEF', '815449DC0FA1BB0E84AE06A093550C526EA7BB3C03BE36A4695A58A4C6241071', '', '2012-12-30 04:23:32', '127.0.0.1', '0', '0', '00', '2013-07-27 19:43:21', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('11', 'LIINA', '4D40F618DFAC4B6E2EE4BD544CC7CE6DBB77E04F', '', '2865CC9ADC1F86EE8573A94DA6D7084797BB02C926983DB5FB5A0449DA16C121', 'A4C2F1FDBF74CB79F642C67D409E434477A23A81ED2B6418ED6BF6CB75DEB7AF', '', '2013-02-03 00:47:00', '31.129.123.137', '0', '0', '00', '2013-02-06 19:42:01', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('12', 'QWERTY', '29E4B96FA73BB9DE02DB0F402C6C7F898B4880D7', '', '292FC40994E3BA798FC07382B96F9E36A4CCC9995E85A9E8A68302EA8B514408', 'CEAB4831C66A8E421CA46C8F0781254ACD15DD929F6BEB7979FA1A71A9A7D595', '', '2013-02-03 00:47:49', '109.254.70.192', '0', '0', '00', '2013-02-06 16:55:07', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('13', 'loh', '5b5d1913690553c8a58aa3ab033deee28f58f366', 'D27ECA37362A21DBEEAA75E6CD6AAE7F8F07D7B38FDE2302C2BE3EDCEBA6BB194668E39FA7EC368E', '6DADED0EBE5DD9BD409AB73BFE4D28C4F0C0F671DCC6432D9922DBF6661FD1DA', '8552144B353E8A55716BD125799E86356C4D346007BEA92D0DA843CECFA6C449', 'ffdw2fw@mail.ru', '2013-05-29 18:16:27', '178.127.101.214', '0', '0', '00', '2013-05-29 19:40:50', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('14', 'ddark93', '40275b544f291bb3ea6a722e61071f5b3cdae48f', '7C10E91F5F92C455298C9A8AB39AA1AD7A9AA426EBEB3ED784C0D3CE708D522508E8B85D451D25EE', '79E841C11E022B14B0785358A482EEC42EF5F5B4EBBE723E108828650255E6CF', 'DB7B349ADF2895011600BF102DA35CC44C6FE77340BFF112B891A16CDA1A4BD1', 'ddark@m.ru', '2013-05-29 19:44:21', '192.168.1.4', '0', '0', '00', '2013-05-29 19:49:16', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('15', 'rere23', '55ff64890584f6c03f7c553437484ae0919d7c53', '3DB69808E66A23634507960EF15AC45AE39D4931AB382BE1E51E8173A54AD9F245B21D43258E68D5', '365ED86B76DEE1C6539D403486212745654D00C62F5740FA0A9E10F107DEA629', 'A9DA6F9551FCF9CD396B8B577934642AE95194523A34A50F3EFC91B0BB4675D5', 'dd@tut.by', '2013-05-29 19:49:34', '178.123.226.114', '0', '0', '00', '2013-05-29 19:49:49', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('16', 'ilona_v', '1ee66ff3220aef9d175ec3188e422c47a182114a', '8CC8332EE983C9E9A0D2D0D2FB94E19212F5F9D57513B405A794D943D7D3FFBEEE544D8F0F1160A3', '8686936589EAF8E6EF42BC692668C6D63283A57A0B81DC96EE433588B8584DA4', 'B6732EF0F2099BDFBA5574E50EFD5ED75210E547E6E451E96AFA9C13AF787F9D', 'askylaykipro100@mail.ru', '2013-05-29 20:00:04', '31.41.111.154', '0', '0', '00', '2013-05-29 20:01:10', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('17', 'pannika', 'dcb86b8589a2d639b0c0a7dcbf88b398f98fcab7', '74F2DC3B47059BEC62BFDF55D93957E762F9746BE4FF778A3663690A73A30446309A8F96D40A4035', '167008453FE9537AE2DB2C4184A7CADFC44F843C4D9381DFEEF3FA7279444FCD', 'C2699D214A4D4D69C81AA87DB1F7AA617FD96CF54B59E63709C1A8393346F19F', 'ffdw3412fw@mail.ru', '2013-05-29 20:16:03', '128.73.75.64', '0', '0', '00', '2013-05-29 20:34:47', '0', '2', '0', '', '', '8', 'Win', '0', '0', null, null, null, '1', null);
INSERT INTO `account` VALUES ('18', '', '05A79F06CF3F67F726DAE68D18A2290F6C9A50C9', '', '', '', '', '2013-06-26 19:33:33', '127.0.0.1', '0', '0', '00', '0000-00-00 00:00:00', '0', '2', '0', '', '', '0', '', '0', '2', '84463', null, null, '1', null);

-- ----------------------------
-- Table structure for `account_access`
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_access
-- ----------------------------
INSERT INTO `account_access` VALUES ('2', '4', '-1');
INSERT INTO `account_access` VALUES ('3', '3', '1');
INSERT INTO `account_access` VALUES ('6', '4', '-1');
INSERT INTO `account_access` VALUES ('9', '4', '-1');
INSERT INTO `account_access` VALUES ('11', '4', '-1');
INSERT INTO `account_access` VALUES ('12', '3', '-1');
INSERT INTO `account_access` VALUES ('18', '4', '-1');

-- ----------------------------
-- Table structure for `account_banned`
-- ----------------------------
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- ----------------------------
-- Records of account_banned
-- ----------------------------
INSERT INTO `account_banned` VALUES ('6', '1356282659', '1356282660', 'Xzfv', 'читак', '0');

-- ----------------------------
-- Table structure for `account_premium`
-- ----------------------------
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Accounts';

-- ----------------------------
-- Records of account_premium
-- ----------------------------
INSERT INTO `account_premium` VALUES ('10', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `account_rate`
-- ----------------------------
DROP TABLE IF EXISTS `account_rate`;
CREATE TABLE `account_rate` (
  `id` int(10) unsigned NOT NULL,
  `rate` float unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_rate
-- ----------------------------

-- ----------------------------
-- Table structure for `autobroadcast`
-- ----------------------------
DROP TABLE IF EXISTS `autobroadcast`;
CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of autobroadcast
-- ----------------------------

-- ----------------------------
-- Table structure for `character_history`
-- ----------------------------
DROP TABLE IF EXISTS `character_history`;
CREATE TABLE `character_history` (
  `HistoryId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AccountId` int(10) unsigned NOT NULL DEFAULT '0',
  `RealmId` int(10) unsigned NOT NULL DEFAULT '0',
  `SessionIP` varchar(32) NOT NULL,
  `HistoryType` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `CharacterGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `CharacterName` varchar(12) NOT NULL,
  `HistoryTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HistoryId`)
) ENGINE=MyISAM AUTO_INCREMENT=1869 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of character_history
-- ----------------------------
INSERT INTO `character_history` VALUES ('1', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2012-12-31 14:46:49');
INSERT INTO `character_history` VALUES ('2', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2012-12-31 15:04:49');
INSERT INTO `character_history` VALUES ('3', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2012-12-31 19:25:50');
INSERT INTO `character_history` VALUES ('4', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2012-12-31 19:31:56');
INSERT INTO `character_history` VALUES ('5', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-01 02:35:11');
INSERT INTO `character_history` VALUES ('6', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-01 02:44:08');
INSERT INTO `character_history` VALUES ('7', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-01 02:53:44');
INSERT INTO `character_history` VALUES ('8', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-01 03:00:06');
INSERT INTO `character_history` VALUES ('9', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-01 03:01:27');
INSERT INTO `character_history` VALUES ('10', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-01 03:09:32');
INSERT INTO `character_history` VALUES ('11', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-02 01:13:13');
INSERT INTO `character_history` VALUES ('12', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-02 01:14:44');
INSERT INTO `character_history` VALUES ('13', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-02 01:23:19');
INSERT INTO `character_history` VALUES ('14', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-02 01:33:44');
INSERT INTO `character_history` VALUES ('15', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-02 01:35:05');
INSERT INTO `character_history` VALUES ('16', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-02 01:50:24');
INSERT INTO `character_history` VALUES ('17', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-02 01:50:55');
INSERT INTO `character_history` VALUES ('18', '2', '1', '127.0.0.1', '1', '87', 'Шггш', '2013-01-02 01:51:47');
INSERT INTO `character_history` VALUES ('19', '2', '1', '127.0.0.1', '2', '87', 'Шггш', '2013-01-02 01:57:22');
INSERT INTO `character_history` VALUES ('20', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 19:36:21');
INSERT INTO `character_history` VALUES ('21', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 19:38:15');
INSERT INTO `character_history` VALUES ('22', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 19:40:37');
INSERT INTO `character_history` VALUES ('23', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 19:43:46');
INSERT INTO `character_history` VALUES ('24', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 19:47:55');
INSERT INTO `character_history` VALUES ('25', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 19:48:32');
INSERT INTO `character_history` VALUES ('26', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 19:50:54');
INSERT INTO `character_history` VALUES ('27', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 19:51:20');
INSERT INTO `character_history` VALUES ('28', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 20:49:59');
INSERT INTO `character_history` VALUES ('29', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 20:50:25');
INSERT INTO `character_history` VALUES ('30', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 20:52:26');
INSERT INTO `character_history` VALUES ('31', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 20:52:32');
INSERT INTO `character_history` VALUES ('32', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 21:10:02');
INSERT INTO `character_history` VALUES ('33', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 21:14:12');
INSERT INTO `character_history` VALUES ('34', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 21:22:25');
INSERT INTO `character_history` VALUES ('35', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-06 21:23:52');
INSERT INTO `character_history` VALUES ('36', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 22:51:03');
INSERT INTO `character_history` VALUES ('37', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 23:06:42');
INSERT INTO `character_history` VALUES ('38', '2', '1', '127.0.0.1', '1', '26', 'Hjbh', '2013-01-06 23:14:56');
INSERT INTO `character_history` VALUES ('39', '2', '1', '127.0.0.1', '1', '26', 'Hjbh', '2013-01-06 23:23:46');
INSERT INTO `character_history` VALUES ('40', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 23:49:57');
INSERT INTO `character_history` VALUES ('41', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-06 23:57:33');
INSERT INTO `character_history` VALUES ('42', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-12 16:59:22');
INSERT INTO `character_history` VALUES ('43', '2', '1', '127.0.0.1', '2', '31', 'Xzpr', '2013-01-12 16:59:51');
INSERT INTO `character_history` VALUES ('44', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-12 18:16:39');
INSERT INTO `character_history` VALUES ('45', '2', '1', '127.0.0.1', '2', '31', 'Xzpr', '2013-01-12 18:19:59');
INSERT INTO `character_history` VALUES ('46', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-12 18:20:07');
INSERT INTO `character_history` VALUES ('47', '2', '1', '127.0.0.1', '2', '31', 'Xzpr', '2013-01-12 18:20:19');
INSERT INTO `character_history` VALUES ('48', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-12 18:25:09');
INSERT INTO `character_history` VALUES ('49', '2', '1', '127.0.0.1', '2', '31', 'Xzpr', '2013-01-12 18:27:49');
INSERT INTO `character_history` VALUES ('50', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-12 19:00:21');
INSERT INTO `character_history` VALUES ('51', '2', '1', '127.0.0.1', '2', '31', 'Xzpr', '2013-01-12 19:00:45');
INSERT INTO `character_history` VALUES ('52', '1', '1', '127.0.0.1', '1', '30', 'Crashik', '2013-01-13 01:46:31');
INSERT INTO `character_history` VALUES ('53', '2', '1', '127.0.0.1', '1', '31', 'Xzpr', '2013-01-13 03:43:42');
INSERT INTO `character_history` VALUES ('54', '2', '1', '127.0.0.1', '3', '49', 'Уркен', '2013-01-13 04:11:57');
INSERT INTO `character_history` VALUES ('55', '2', '1', '127.0.0.1', '3', '26', 'Hjbh', '2013-01-13 04:12:06');
INSERT INTO `character_history` VALUES ('56', '2', '1', '127.0.0.1', '3', '45', 'Testik', '2013-01-13 04:12:10');
INSERT INTO `character_history` VALUES ('57', '2', '1', '127.0.0.1', '3', '53', 'Пукп', '2013-01-13 04:12:15');
INSERT INTO `character_history` VALUES ('58', '2', '1', '127.0.0.1', '3', '76', 'Уаау', '2013-01-13 04:12:23');
INSERT INTO `character_history` VALUES ('59', '2', '1', '127.0.0.1', '3', '31', 'Xzpr', '2013-01-13 04:12:32');
INSERT INTO `character_history` VALUES ('60', '2', '1', '127.0.0.1', '3', '83', 'Вуау', '2013-01-13 04:12:36');
INSERT INTO `character_history` VALUES ('61', '2', '1', '127.0.0.1', '3', '84', 'Fregrgtr', '2013-01-13 04:12:42');
INSERT INTO `character_history` VALUES ('62', '2', '1', '127.0.0.1', '3', '87', 'Шггш', '2013-01-13 04:12:46');
INSERT INTO `character_history` VALUES ('63', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-13 04:13:13');
INSERT INTO `character_history` VALUES ('64', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-13 04:29:51');
INSERT INTO `character_history` VALUES ('65', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-13 04:47:54');
INSERT INTO `character_history` VALUES ('66', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-13 04:49:47');
INSERT INTO `character_history` VALUES ('67', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-13 23:46:00');
INSERT INTO `character_history` VALUES ('68', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-13 23:55:07');
INSERT INTO `character_history` VALUES ('69', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-14 01:07:50');
INSERT INTO `character_history` VALUES ('70', '3', '1', '127.0.0.1', '1', '67', 'Лёшара', '2013-01-14 01:20:24');
INSERT INTO `character_history` VALUES ('71', '3', '1', '127.0.0.1', '2', '67', 'Лёшара', '2013-01-14 01:24:05');
INSERT INTO `character_history` VALUES ('72', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-14 01:28:00');
INSERT INTO `character_history` VALUES ('73', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-15 20:28:58');
INSERT INTO `character_history` VALUES ('74', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-15 20:29:59');
INSERT INTO `character_history` VALUES ('75', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-15 20:30:09');
INSERT INTO `character_history` VALUES ('76', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-15 20:39:25');
INSERT INTO `character_history` VALUES ('77', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-16 21:58:34');
INSERT INTO `character_history` VALUES ('78', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-16 22:00:18');
INSERT INTO `character_history` VALUES ('79', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-18 02:04:59');
INSERT INTO `character_history` VALUES ('80', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-18 02:08:07');
INSERT INTO `character_history` VALUES ('81', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-19 13:00:54');
INSERT INTO `character_history` VALUES ('82', '3', '1', '127.0.0.1', '4', '89', 'Арп', '2013-01-19 13:01:48');
INSERT INTO `character_history` VALUES ('83', '3', '1', '127.0.0.1', '1', '89', 'Арп', '2013-01-19 13:02:14');
INSERT INTO `character_history` VALUES ('84', '3', '1', '127.0.0.1', '2', '89', 'Арп', '2013-01-19 13:04:00');
INSERT INTO `character_history` VALUES ('85', '3', '1', '127.0.0.1', '1', '89', 'Арп', '2013-01-19 13:05:37');
INSERT INTO `character_history` VALUES ('86', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-19 13:06:28');
INSERT INTO `character_history` VALUES ('87', '3', '1', '127.0.0.1', '2', '89', 'Арп', '2013-01-19 13:06:30');
INSERT INTO `character_history` VALUES ('88', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-20 18:22:31');
INSERT INTO `character_history` VALUES ('89', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-20 18:40:53');
INSERT INTO `character_history` VALUES ('90', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-20 21:04:12');
INSERT INTO `character_history` VALUES ('91', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-20 21:22:55');
INSERT INTO `character_history` VALUES ('92', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-20 22:19:59');
INSERT INTO `character_history` VALUES ('93', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-20 22:24:31');
INSERT INTO `character_history` VALUES ('94', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-25 17:18:28');
INSERT INTO `character_history` VALUES ('95', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-25 17:40:01');
INSERT INTO `character_history` VALUES ('96', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-25 17:41:51');
INSERT INTO `character_history` VALUES ('97', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-25 17:46:40');
INSERT INTO `character_history` VALUES ('98', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-25 18:31:57');
INSERT INTO `character_history` VALUES ('99', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-25 18:36:26');
INSERT INTO `character_history` VALUES ('100', '2', '1', '127.0.0.1', '4', '90', 'Ggrg', '2013-01-25 18:36:42');
INSERT INTO `character_history` VALUES ('101', '2', '1', '127.0.0.1', '1', '90', 'Ggrg', '2013-01-25 18:36:52');
INSERT INTO `character_history` VALUES ('102', '2', '1', '127.0.0.1', '2', '90', 'Ggrg', '2013-01-25 18:41:03');
INSERT INTO `character_history` VALUES ('103', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-25 23:31:20');
INSERT INTO `character_history` VALUES ('104', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-25 23:31:49');
INSERT INTO `character_history` VALUES ('105', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-25 23:31:59');
INSERT INTO `character_history` VALUES ('106', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-25 23:34:22');
INSERT INTO `character_history` VALUES ('107', '2', '1', '127.0.0.1', '1', '90', 'Ggrg', '2013-01-25 23:34:32');
INSERT INTO `character_history` VALUES ('108', '2', '1', '127.0.0.1', '2', '90', 'Ggrg', '2013-01-25 23:47:31');
INSERT INTO `character_history` VALUES ('109', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-26 21:10:48');
INSERT INTO `character_history` VALUES ('110', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-26 21:24:49');
INSERT INTO `character_history` VALUES ('111', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-01-26 22:25:39');
INSERT INTO `character_history` VALUES ('112', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-01-26 22:27:47');
INSERT INTO `character_history` VALUES ('113', '2', '1', '127.0.0.1', '4', '91', 'Ulduar', '2013-01-26 22:28:01');
INSERT INTO `character_history` VALUES ('114', '2', '1', '127.0.0.1', '1', '91', 'Ulduar', '2013-01-26 22:28:13');
INSERT INTO `character_history` VALUES ('115', '2', '1', '127.0.0.1', '2', '91', 'Ulduar', '2013-01-26 22:34:59');
INSERT INTO `character_history` VALUES ('116', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-03 00:53:26');
INSERT INTO `character_history` VALUES ('117', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-03 00:53:43');
INSERT INTO `character_history` VALUES ('118', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-03 01:04:29');
INSERT INTO `character_history` VALUES ('119', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-03 01:05:39');
INSERT INTO `character_history` VALUES ('120', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-03 01:05:51');
INSERT INTO `character_history` VALUES ('121', '12', '1', '109.254.70.192', '4', '92', 'Dereviashaka', '2013-02-03 01:05:54');
INSERT INTO `character_history` VALUES ('122', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-03 01:06:04');
INSERT INTO `character_history` VALUES ('123', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-03 01:06:35');
INSERT INTO `character_history` VALUES ('124', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-03 01:08:14');
INSERT INTO `character_history` VALUES ('125', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-03 01:14:26');
INSERT INTO `character_history` VALUES ('126', '2', '1', '127.0.0.1', '4', '93', 'Mmoo', '2013-02-03 01:14:40');
INSERT INTO `character_history` VALUES ('127', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-03 01:14:49');
INSERT INTO `character_history` VALUES ('128', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-03 01:16:56');
INSERT INTO `character_history` VALUES ('129', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-03 01:17:30');
INSERT INTO `character_history` VALUES ('130', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-03 01:44:43');
INSERT INTO `character_history` VALUES ('131', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-03 01:45:05');
INSERT INTO `character_history` VALUES ('132', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-03 01:50:01');
INSERT INTO `character_history` VALUES ('133', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-03 01:50:13');
INSERT INTO `character_history` VALUES ('134', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-03 02:05:20');
INSERT INTO `character_history` VALUES ('135', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-03 02:05:52');
INSERT INTO `character_history` VALUES ('136', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-03 21:34:48');
INSERT INTO `character_history` VALUES ('137', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-03 21:37:32');
INSERT INTO `character_history` VALUES ('138', '2', '1', '127.0.0.1', '4', '94', 'Crashaman', '2013-02-04 22:32:06');
INSERT INTO `character_history` VALUES ('139', '2', '1', '127.0.0.1', '1', '94', 'Crashaman', '2013-02-04 22:32:29');
INSERT INTO `character_history` VALUES ('140', '2', '1', '127.0.0.1', '2', '94', 'Crashaman', '2013-02-04 22:35:33');
INSERT INTO `character_history` VALUES ('141', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-05 22:01:35');
INSERT INTO `character_history` VALUES ('142', '11', '1', '31.129.121.1', '4', '95', 'Tiraelife', '2013-02-05 22:03:49');
INSERT INTO `character_history` VALUES ('143', '11', '1', '31.129.121.1', '1', '95', 'Tiraelife', '2013-02-05 22:05:33');
INSERT INTO `character_history` VALUES ('144', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 22:08:07');
INSERT INTO `character_history` VALUES ('145', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-05 22:30:35');
INSERT INTO `character_history` VALUES ('146', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 22:31:15');
INSERT INTO `character_history` VALUES ('147', '11', '1', '31.129.121.1', '2', '95', 'Tiraelife', '2013-02-05 22:53:25');
INSERT INTO `character_history` VALUES ('148', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-05 23:21:13');
INSERT INTO `character_history` VALUES ('149', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-05 23:21:47');
INSERT INTO `character_history` VALUES ('150', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-05 23:22:24');
INSERT INTO `character_history` VALUES ('151', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 23:24:02');
INSERT INTO `character_history` VALUES ('152', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-05 23:27:17');
INSERT INTO `character_history` VALUES ('153', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-05 23:27:39');
INSERT INTO `character_history` VALUES ('154', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-05 23:27:41');
INSERT INTO `character_history` VALUES ('155', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 23:28:05');
INSERT INTO `character_history` VALUES ('156', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-05 23:33:45');
INSERT INTO `character_history` VALUES ('157', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 23:34:11');
INSERT INTO `character_history` VALUES ('158', '11', '1', '31.129.123.15', '4', '96', 'Архангел', '2013-02-05 23:46:58');
INSERT INTO `character_history` VALUES ('159', '11', '1', '31.129.123.15', '1', '96', 'Архангел', '2013-02-05 23:47:20');
INSERT INTO `character_history` VALUES ('160', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-05 23:49:41');
INSERT INTO `character_history` VALUES ('161', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-05 23:50:05');
INSERT INTO `character_history` VALUES ('162', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-05 23:50:05');
INSERT INTO `character_history` VALUES ('163', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-05 23:51:47');
INSERT INTO `character_history` VALUES ('164', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-06 00:03:37');
INSERT INTO `character_history` VALUES ('165', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 00:04:03');
INSERT INTO `character_history` VALUES ('166', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-06 00:22:00');
INSERT INTO `character_history` VALUES ('167', '11', '1', '31.129.123.15', '2', '96', 'Архангел', '2013-02-06 00:31:56');
INSERT INTO `character_history` VALUES ('168', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-06 00:32:23');
INSERT INTO `character_history` VALUES ('169', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 15:52:27');
INSERT INTO `character_history` VALUES ('170', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-06 16:00:33');
INSERT INTO `character_history` VALUES ('171', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-06 16:19:30');
INSERT INTO `character_history` VALUES ('172', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-06 16:19:48');
INSERT INTO `character_history` VALUES ('173', '11', '1', '31.129.121.78', '1', '96', 'Архангел', '2013-02-06 16:24:51');
INSERT INTO `character_history` VALUES ('174', '11', '1', '31.129.121.78', '2', '96', 'Архангел', '2013-02-06 16:32:50');
INSERT INTO `character_history` VALUES ('175', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 16:36:48');
INSERT INTO `character_history` VALUES ('176', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-06 16:38:19');
INSERT INTO `character_history` VALUES ('177', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 16:38:24');
INSERT INTO `character_history` VALUES ('178', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-06 16:38:48');
INSERT INTO `character_history` VALUES ('179', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 16:39:59');
INSERT INTO `character_history` VALUES ('180', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-06 16:55:43');
INSERT INTO `character_history` VALUES ('181', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 16:57:44');
INSERT INTO `character_history` VALUES ('182', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 16:57:49');
INSERT INTO `character_history` VALUES ('183', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 17:40:18');
INSERT INTO `character_history` VALUES ('184', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 17:41:34');
INSERT INTO `character_history` VALUES ('185', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-06 17:42:55');
INSERT INTO `character_history` VALUES ('186', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 17:43:23');
INSERT INTO `character_history` VALUES ('187', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-06 18:16:17');
INSERT INTO `character_history` VALUES ('188', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 19:00:21');
INSERT INTO `character_history` VALUES ('189', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 19:01:43');
INSERT INTO `character_history` VALUES ('190', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 19:40:17');
INSERT INTO `character_history` VALUES ('191', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-06 19:40:26');
INSERT INTO `character_history` VALUES ('192', '12', '1', '109.254.70.192', '1', '92', 'Dereviashaka', '2013-02-06 19:41:23');
INSERT INTO `character_history` VALUES ('193', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 19:43:02');
INSERT INTO `character_history` VALUES ('194', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 19:57:21');
INSERT INTO `character_history` VALUES ('195', '11', '1', '31.129.123.137', '1', '96', 'Архангел', '2013-02-06 19:58:23');
INSERT INTO `character_history` VALUES ('196', '11', '1', '31.129.123.137', '2', '96', 'Архангел', '2013-02-06 20:03:49');
INSERT INTO `character_history` VALUES ('197', '12', '1', '109.254.70.192', '2', '92', 'Dereviashaka', '2013-02-06 20:33:07');
INSERT INTO `character_history` VALUES ('198', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 21:58:55');
INSERT INTO `character_history` VALUES ('199', '6', '1', '178.127.6.58', '1', '32', 'Hero', '2013-02-06 22:02:40');
INSERT INTO `character_history` VALUES ('200', '6', '1', '178.127.6.58', '2', '32', 'Hero', '2013-02-06 22:03:12');
INSERT INTO `character_history` VALUES ('201', '6', '1', '178.127.6.58', '1', '32', 'Hero', '2013-02-06 22:03:35');
INSERT INTO `character_history` VALUES ('202', '6', '1', '178.127.6.58', '2', '32', 'Hero', '2013-02-06 22:06:49');
INSERT INTO `character_history` VALUES ('203', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-06 22:11:29');
INSERT INTO `character_history` VALUES ('204', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-06 22:11:45');
INSERT INTO `character_history` VALUES ('205', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 17:01:13');
INSERT INTO `character_history` VALUES ('206', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 17:04:17');
INSERT INTO `character_history` VALUES ('207', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 17:19:16');
INSERT INTO `character_history` VALUES ('208', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 17:19:35');
INSERT INTO `character_history` VALUES ('209', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 20:51:54');
INSERT INTO `character_history` VALUES ('210', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 21:26:14');
INSERT INTO `character_history` VALUES ('211', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 21:26:53');
INSERT INTO `character_history` VALUES ('212', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 21:29:31');
INSERT INTO `character_history` VALUES ('213', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 21:37:18');
INSERT INTO `character_history` VALUES ('214', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 21:41:08');
INSERT INTO `character_history` VALUES ('215', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 21:43:43');
INSERT INTO `character_history` VALUES ('216', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 21:48:11');
INSERT INTO `character_history` VALUES ('217', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 22:59:26');
INSERT INTO `character_history` VALUES ('218', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 23:12:03');
INSERT INTO `character_history` VALUES ('219', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 23:18:04');
INSERT INTO `character_history` VALUES ('220', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 23:20:52');
INSERT INTO `character_history` VALUES ('221', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 23:21:01');
INSERT INTO `character_history` VALUES ('222', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-07 23:47:29');
INSERT INTO `character_history` VALUES ('223', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-07 23:50:04');
INSERT INTO `character_history` VALUES ('224', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-08 00:04:31');
INSERT INTO `character_history` VALUES ('225', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-08 00:08:59');
INSERT INTO `character_history` VALUES ('226', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-08 00:19:29');
INSERT INTO `character_history` VALUES ('227', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-08 00:54:03');
INSERT INTO `character_history` VALUES ('228', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-09 12:06:07');
INSERT INTO `character_history` VALUES ('229', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-09 12:20:14');
INSERT INTO `character_history` VALUES ('230', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-10 22:51:17');
INSERT INTO `character_history` VALUES ('231', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-10 23:17:03');
INSERT INTO `character_history` VALUES ('232', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-10 23:18:04');
INSERT INTO `character_history` VALUES ('233', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-10 23:18:40');
INSERT INTO `character_history` VALUES ('234', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-10 23:25:18');
INSERT INTO `character_history` VALUES ('235', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-10 23:26:19');
INSERT INTO `character_history` VALUES ('236', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-10 23:28:13');
INSERT INTO `character_history` VALUES ('237', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-10 23:28:29');
INSERT INTO `character_history` VALUES ('238', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-10 23:33:56');
INSERT INTO `character_history` VALUES ('239', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-11 00:04:55');
INSERT INTO `character_history` VALUES ('240', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-11 00:16:43');
INSERT INTO `character_history` VALUES ('241', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-11 00:31:06');
INSERT INTO `character_history` VALUES ('242', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-11 00:46:17');
INSERT INTO `character_history` VALUES ('243', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-11 00:55:38');
INSERT INTO `character_history` VALUES ('244', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 00:47:07');
INSERT INTO `character_history` VALUES ('245', '3', '1', '127.0.0.1', '1', '65', 'Дикообраз', '2013-02-12 00:58:24');
INSERT INTO `character_history` VALUES ('246', '3', '1', '127.0.0.1', '1', '65', 'Дикообраз', '2013-02-12 01:01:46');
INSERT INTO `character_history` VALUES ('247', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 01:02:01');
INSERT INTO `character_history` VALUES ('248', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 01:06:50');
INSERT INTO `character_history` VALUES ('249', '3', '1', '127.0.0.1', '2', '65', 'Дикообраз', '2013-02-12 01:06:54');
INSERT INTO `character_history` VALUES ('250', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 17:14:34');
INSERT INTO `character_history` VALUES ('251', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 17:16:57');
INSERT INTO `character_history` VALUES ('252', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 17:30:38');
INSERT INTO `character_history` VALUES ('253', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 17:31:22');
INSERT INTO `character_history` VALUES ('254', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 17:33:28');
INSERT INTO `character_history` VALUES ('255', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 17:34:52');
INSERT INTO `character_history` VALUES ('256', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 17:41:20');
INSERT INTO `character_history` VALUES ('257', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 17:42:00');
INSERT INTO `character_history` VALUES ('258', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-12 19:32:32');
INSERT INTO `character_history` VALUES ('259', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-12 19:45:07');
INSERT INTO `character_history` VALUES ('260', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-13 16:41:38');
INSERT INTO `character_history` VALUES ('261', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-13 17:03:39');
INSERT INTO `character_history` VALUES ('262', '2', '1', '127.0.0.1', '4', '97', 'Gtrh', '2013-02-13 21:30:12');
INSERT INTO `character_history` VALUES ('263', '2', '1', '127.0.0.1', '4', '98', 'Rgeg', '2013-02-13 21:30:38');
INSERT INTO `character_history` VALUES ('264', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-13 21:31:02');
INSERT INTO `character_history` VALUES ('265', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-13 21:38:59');
INSERT INTO `character_history` VALUES ('266', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-02-13 21:39:16');
INSERT INTO `character_history` VALUES ('267', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-02-13 21:45:49');
INSERT INTO `character_history` VALUES ('268', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-14 01:50:05');
INSERT INTO `character_history` VALUES ('269', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-14 01:50:43');
INSERT INTO `character_history` VALUES ('270', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-14 01:51:32');
INSERT INTO `character_history` VALUES ('271', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-14 01:53:42');
INSERT INTO `character_history` VALUES ('272', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-14 01:57:38');
INSERT INTO `character_history` VALUES ('273', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-14 01:58:01');
INSERT INTO `character_history` VALUES ('274', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-14 23:25:54');
INSERT INTO `character_history` VALUES ('275', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-14 23:32:40');
INSERT INTO `character_history` VALUES ('276', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-15 20:10:22');
INSERT INTO `character_history` VALUES ('277', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-15 20:14:30');
INSERT INTO `character_history` VALUES ('278', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-15 20:16:14');
INSERT INTO `character_history` VALUES ('279', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-15 20:17:39');
INSERT INTO `character_history` VALUES ('280', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-15 22:57:50');
INSERT INTO `character_history` VALUES ('281', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-15 22:58:03');
INSERT INTO `character_history` VALUES ('282', '2', '1', '127.0.0.1', '4', '99', 'Uuhyk', '2013-02-15 22:58:28');
INSERT INTO `character_history` VALUES ('283', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-15 22:58:41');
INSERT INTO `character_history` VALUES ('284', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-15 23:00:47');
INSERT INTO `character_history` VALUES ('285', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-15 23:12:54');
INSERT INTO `character_history` VALUES ('286', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-15 23:13:30');
INSERT INTO `character_history` VALUES ('287', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-16 01:28:59');
INSERT INTO `character_history` VALUES ('288', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-16 01:34:36');
INSERT INTO `character_history` VALUES ('289', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-22 18:38:20');
INSERT INTO `character_history` VALUES ('290', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-22 18:42:31');
INSERT INTO `character_history` VALUES ('291', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-22 18:51:40');
INSERT INTO `character_history` VALUES ('292', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-22 18:52:16');
INSERT INTO `character_history` VALUES ('293', '2', '1', '127.0.0.1', '4', '100', 'Ssd', '2013-02-23 00:41:45');
INSERT INTO `character_history` VALUES ('294', '2', '1', '127.0.0.1', '1', '100', 'Ssd', '2013-02-23 00:42:04');
INSERT INTO `character_history` VALUES ('295', '2', '1', '127.0.0.1', '2', '100', 'Ssd', '2013-02-23 00:46:15');
INSERT INTO `character_history` VALUES ('296', '2', '1', '127.0.0.1', '1', '100', 'Ssd', '2013-02-23 01:07:24');
INSERT INTO `character_history` VALUES ('297', '2', '1', '127.0.0.1', '2', '100', 'Ssd', '2013-02-23 01:07:55');
INSERT INTO `character_history` VALUES ('298', '2', '1', '127.0.0.1', '1', '100', 'Ssd', '2013-02-23 01:19:30');
INSERT INTO `character_history` VALUES ('299', '2', '1', '127.0.0.1', '2', '100', 'Ssd', '2013-02-23 01:23:21');
INSERT INTO `character_history` VALUES ('300', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-23 16:32:15');
INSERT INTO `character_history` VALUES ('301', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-23 16:33:18');
INSERT INTO `character_history` VALUES ('302', '2', '1', '127.0.0.1', '1', '99', 'Uuhyk', '2013-02-23 16:37:19');
INSERT INTO `character_history` VALUES ('303', '2', '1', '127.0.0.1', '2', '99', 'Uuhyk', '2013-02-23 16:39:49');
INSERT INTO `character_history` VALUES ('304', '2', '1', '127.0.0.1', '1', '100', 'Ssd', '2013-02-23 16:43:31');
INSERT INTO `character_history` VALUES ('305', '2', '1', '127.0.0.1', '2', '100', 'Ssd', '2013-02-23 16:43:39');
INSERT INTO `character_history` VALUES ('306', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-23 16:44:01');
INSERT INTO `character_history` VALUES ('307', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-23 16:45:04');
INSERT INTO `character_history` VALUES ('308', '2', '1', '127.0.0.1', '1', '98', 'Rgeg', '2013-02-23 20:58:02');
INSERT INTO `character_history` VALUES ('309', '2', '1', '127.0.0.1', '2', '98', 'Rgeg', '2013-02-23 20:58:37');
INSERT INTO `character_history` VALUES ('310', '2', '1', '127.0.0.1', '4', '101', 'Rdv', '2013-02-23 21:02:03');
INSERT INTO `character_history` VALUES ('311', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-23 21:02:20');
INSERT INTO `character_history` VALUES ('312', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-23 21:03:57');
INSERT INTO `character_history` VALUES ('313', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-23 21:37:49');
INSERT INTO `character_history` VALUES ('314', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-23 21:54:04');
INSERT INTO `character_history` VALUES ('315', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-23 21:55:28');
INSERT INTO `character_history` VALUES ('316', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-24 22:28:36');
INSERT INTO `character_history` VALUES ('317', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-24 22:29:30');
INSERT INTO `character_history` VALUES ('318', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-24 22:32:48');
INSERT INTO `character_history` VALUES ('319', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-24 22:33:31');
INSERT INTO `character_history` VALUES ('320', '2', '1', '127.0.0.1', '1', '100', 'Ssd', '2013-02-24 22:37:33');
INSERT INTO `character_history` VALUES ('321', '2', '1', '127.0.0.1', '2', '100', 'Ssd', '2013-02-24 22:38:28');
INSERT INTO `character_history` VALUES ('322', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-24 22:38:39');
INSERT INTO `character_history` VALUES ('323', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-24 22:38:53');
INSERT INTO `character_history` VALUES ('324', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-24 22:42:14');
INSERT INTO `character_history` VALUES ('325', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-24 22:43:19');
INSERT INTO `character_history` VALUES ('326', '2', '1', '127.0.0.1', '1', '101', 'Rdv', '2013-02-25 17:34:59');
INSERT INTO `character_history` VALUES ('327', '2', '1', '127.0.0.1', '2', '101', 'Rdv', '2013-02-25 17:43:07');
INSERT INTO `character_history` VALUES ('328', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-25 19:14:18');
INSERT INTO `character_history` VALUES ('329', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-25 19:25:59');
INSERT INTO `character_history` VALUES ('330', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-27 21:39:51');
INSERT INTO `character_history` VALUES ('331', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-27 21:41:34');
INSERT INTO `character_history` VALUES ('332', '2', '1', '127.0.0.1', '3', '101', 'Rdv', '2013-02-27 21:41:48');
INSERT INTO `character_history` VALUES ('333', '2', '1', '127.0.0.1', '4', '102', 'Апке', '2013-02-27 21:41:59');
INSERT INTO `character_history` VALUES ('334', '2', '1', '127.0.0.1', '1', '102', 'Апке', '2013-02-27 21:42:13');
INSERT INTO `character_history` VALUES ('335', '2', '1', '127.0.0.1', '2', '102', 'Апке', '2013-02-27 21:42:35');
INSERT INTO `character_history` VALUES ('336', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-28 23:10:18');
INSERT INTO `character_history` VALUES ('337', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-28 23:15:33');
INSERT INTO `character_history` VALUES ('338', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-02-28 23:15:41');
INSERT INTO `character_history` VALUES ('339', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-02-28 23:58:27');
INSERT INTO `character_history` VALUES ('340', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-03 12:51:02');
INSERT INTO `character_history` VALUES ('341', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-03 12:52:23');
INSERT INTO `character_history` VALUES ('342', '2', '1', '127.0.0.1', '3', '102', 'Апке', '2013-03-03 19:33:24');
INSERT INTO `character_history` VALUES ('343', '2', '1', '127.0.0.1', '4', '103', 'Пукпут', '2013-03-03 19:33:53');
INSERT INTO `character_history` VALUES ('344', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-03-03 19:34:19');
INSERT INTO `character_history` VALUES ('345', '3', '1', '127.0.0.1', '1', '42', 'Ёж', '2013-03-03 19:43:45');
INSERT INTO `character_history` VALUES ('346', '3', '1', '127.0.0.1', '2', '42', 'Ёж', '2013-03-03 19:47:07');
INSERT INTO `character_history` VALUES ('347', '10', '1', '127.0.0.1', '4', '104', 'Gtyg', '2013-03-03 19:47:37');
INSERT INTO `character_history` VALUES ('348', '10', '1', '127.0.0.1', '1', '104', 'Gtyg', '2013-03-03 19:47:50');
INSERT INTO `character_history` VALUES ('349', '10', '1', '127.0.0.1', '2', '104', 'Gtyg', '2013-03-03 19:50:35');
INSERT INTO `character_history` VALUES ('350', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-03-03 19:50:39');
INSERT INTO `character_history` VALUES ('351', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-04 00:04:15');
INSERT INTO `character_history` VALUES ('352', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-04 00:13:18');
INSERT INTO `character_history` VALUES ('353', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-04 00:14:35');
INSERT INTO `character_history` VALUES ('354', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-04 00:19:47');
INSERT INTO `character_history` VALUES ('355', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-04 00:55:39');
INSERT INTO `character_history` VALUES ('356', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-04 00:57:10');
INSERT INTO `character_history` VALUES ('357', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-04 01:07:20');
INSERT INTO `character_history` VALUES ('358', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-04 01:08:16');
INSERT INTO `character_history` VALUES ('359', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-03-07 22:56:40');
INSERT INTO `character_history` VALUES ('360', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-03-07 23:02:20');
INSERT INTO `character_history` VALUES ('361', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-03-07 23:08:58');
INSERT INTO `character_history` VALUES ('362', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-03-07 23:11:37');
INSERT INTO `character_history` VALUES ('363', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-03-09 13:01:59');
INSERT INTO `character_history` VALUES ('364', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-03-09 13:02:27');
INSERT INTO `character_history` VALUES ('365', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-03-09 13:02:45');
INSERT INTO `character_history` VALUES ('366', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-03-09 13:04:01');
INSERT INTO `character_history` VALUES ('367', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-03-09 13:06:07');
INSERT INTO `character_history` VALUES ('368', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-03-09 13:06:41');
INSERT INTO `character_history` VALUES ('369', '2', '1', '127.0.0.1', '3', '100', 'Ssd', '2013-03-12 21:00:34');
INSERT INTO `character_history` VALUES ('370', '2', '1', '127.0.0.1', '4', '105', 'Прг', '2013-03-12 21:01:15');
INSERT INTO `character_history` VALUES ('371', '2', '1', '127.0.0.1', '1', '105', 'Прг', '2013-03-12 21:01:41');
INSERT INTO `character_history` VALUES ('372', '2', '1', '127.0.0.1', '2', '105', 'Прг', '2013-03-12 21:03:01');
INSERT INTO `character_history` VALUES ('373', '2', '1', '127.0.0.1', '3', '105', 'Прг', '2013-03-12 21:03:12');
INSERT INTO `character_history` VALUES ('374', '2', '1', '127.0.0.1', '4', '106', 'Ерк', '2013-03-12 21:04:03');
INSERT INTO `character_history` VALUES ('375', '2', '1', '127.0.0.1', '1', '106', 'Ерк', '2013-03-12 21:04:12');
INSERT INTO `character_history` VALUES ('376', '2', '1', '127.0.0.1', '2', '106', 'Ерк', '2013-03-12 21:06:53');
INSERT INTO `character_history` VALUES ('377', '2', '1', '127.0.0.1', '3', '106', 'Ерк', '2013-03-12 23:42:43');
INSERT INTO `character_history` VALUES ('378', '2', '1', '127.0.0.1', '4', '107', 'Кеак', '2013-03-12 23:42:53');
INSERT INTO `character_history` VALUES ('379', '2', '1', '127.0.0.1', '1', '107', 'Кеак', '2013-03-12 23:43:13');
INSERT INTO `character_history` VALUES ('380', '2', '1', '127.0.0.1', '2', '107', 'Кеак', '2013-03-12 23:44:59');
INSERT INTO `character_history` VALUES ('381', '2', '1', '127.0.0.1', '1', '107', 'Кеак', '2013-03-12 23:48:03');
INSERT INTO `character_history` VALUES ('382', '2', '1', '127.0.0.1', '2', '107', 'Кеак', '2013-03-12 23:48:09');
INSERT INTO `character_history` VALUES ('383', '2', '1', '127.0.0.1', '3', '107', 'Кеак', '2013-03-12 23:48:18');
INSERT INTO `character_history` VALUES ('384', '2', '1', '127.0.0.1', '4', '108', 'Пввамв', '2013-03-12 23:48:32');
INSERT INTO `character_history` VALUES ('385', '2', '1', '127.0.0.1', '1', '108', 'Пввамв', '2013-03-12 23:48:39');
INSERT INTO `character_history` VALUES ('386', '2', '1', '127.0.0.1', '2', '108', 'Пввамв', '2013-03-12 23:48:47');
INSERT INTO `character_history` VALUES ('387', '2', '1', '127.0.0.1', '3', '108', 'Пввамв', '2013-03-12 23:52:19');
INSERT INTO `character_history` VALUES ('388', '2', '1', '127.0.0.1', '4', '109', 'Пвавпекпек', '2013-03-12 23:52:45');
INSERT INTO `character_history` VALUES ('389', '2', '1', '127.0.0.1', '1', '109', 'Пвавпекпек', '2013-03-12 23:52:55');
INSERT INTO `character_history` VALUES ('390', '2', '1', '127.0.0.1', '2', '109', 'Пвавпекпек', '2013-03-12 23:59:53');
INSERT INTO `character_history` VALUES ('391', '2', '1', '127.0.0.1', '3', '109', 'Пвавпекпек', '2013-03-21 22:43:45');
INSERT INTO `character_history` VALUES ('392', '2', '1', '127.0.0.1', '4', '110', 'Pristi', '2013-03-21 22:45:03');
INSERT INTO `character_history` VALUES ('393', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-03-21 22:45:28');
INSERT INTO `character_history` VALUES ('394', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-03-21 22:53:34');
INSERT INTO `character_history` VALUES ('395', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-03-31 22:02:16');
INSERT INTO `character_history` VALUES ('396', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-03-31 22:08:18');
INSERT INTO `character_history` VALUES ('397', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-04-01 23:25:24');
INSERT INTO `character_history` VALUES ('398', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-04-02 00:12:58');
INSERT INTO `character_history` VALUES ('399', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-05 20:59:19');
INSERT INTO `character_history` VALUES ('400', '3', '1', '127.0.0.1', '1', '42', 'Ёж', '2013-04-05 21:08:19');
INSERT INTO `character_history` VALUES ('401', '3', '1', '127.0.0.1', '2', '42', 'Ёж', '2013-04-05 21:09:26');
INSERT INTO `character_history` VALUES ('402', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-05 21:22:23');
INSERT INTO `character_history` VALUES ('403', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-05 21:22:31');
INSERT INTO `character_history` VALUES ('404', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-05 21:33:42');
INSERT INTO `character_history` VALUES ('405', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-05 23:01:50');
INSERT INTO `character_history` VALUES ('406', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-05 23:07:45');
INSERT INTO `character_history` VALUES ('407', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 12:35:17');
INSERT INTO `character_history` VALUES ('408', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 13:19:15');
INSERT INTO `character_history` VALUES ('409', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 15:23:58');
INSERT INTO `character_history` VALUES ('410', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 15:38:28');
INSERT INTO `character_history` VALUES ('411', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 19:55:14');
INSERT INTO `character_history` VALUES ('412', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 19:56:38');
INSERT INTO `character_history` VALUES ('413', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 22:29:50');
INSERT INTO `character_history` VALUES ('414', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 22:30:12');
INSERT INTO `character_history` VALUES ('415', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 23:20:12');
INSERT INTO `character_history` VALUES ('416', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 23:23:16');
INSERT INTO `character_history` VALUES ('417', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 23:23:25');
INSERT INTO `character_history` VALUES ('418', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-06 23:38:18');
INSERT INTO `character_history` VALUES ('419', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-06 23:38:27');
INSERT INTO `character_history` VALUES ('420', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-07 00:11:24');
INSERT INTO `character_history` VALUES ('421', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-07 13:20:55');
INSERT INTO `character_history` VALUES ('422', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-07 13:23:09');
INSERT INTO `character_history` VALUES ('423', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-07 13:27:47');
INSERT INTO `character_history` VALUES ('424', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-07 13:28:38');
INSERT INTO `character_history` VALUES ('425', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-08 23:13:34');
INSERT INTO `character_history` VALUES ('426', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-09 00:03:23');
INSERT INTO `character_history` VALUES ('427', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-09 00:22:00');
INSERT INTO `character_history` VALUES ('428', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-09 00:22:59');
INSERT INTO `character_history` VALUES ('429', '2', '1', '127.0.0.1', '1', '103', 'Пукпут', '2013-04-11 21:41:16');
INSERT INTO `character_history` VALUES ('430', '2', '1', '127.0.0.1', '2', '103', 'Пукпут', '2013-04-11 21:47:15');
INSERT INTO `character_history` VALUES ('431', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-04-11 22:52:21');
INSERT INTO `character_history` VALUES ('432', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-04-11 22:53:22');
INSERT INTO `character_history` VALUES ('433', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-04-11 22:53:27');
INSERT INTO `character_history` VALUES ('434', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-04-11 23:12:01');
INSERT INTO `character_history` VALUES ('435', '2', '1', '127.0.0.1', '3', '90', 'Ggrg', '2013-04-11 23:12:33');
INSERT INTO `character_history` VALUES ('436', '2', '1', '127.0.0.1', '3', '91', 'Ulduar', '2013-04-11 23:12:45');
INSERT INTO `character_history` VALUES ('437', '2', '1', '127.0.0.1', '3', '94', 'Crashaman', '2013-04-11 23:12:58');
INSERT INTO `character_history` VALUES ('438', '2', '1', '127.0.0.1', '3', '97', 'Gtrh', '2013-04-11 23:13:11');
INSERT INTO `character_history` VALUES ('439', '2', '1', '127.0.0.1', '3', '98', 'Rgeg', '2013-04-11 23:13:21');
INSERT INTO `character_history` VALUES ('440', '2', '1', '127.0.0.1', '3', '99', 'Uuhyk', '2013-04-11 23:13:37');
INSERT INTO `character_history` VALUES ('441', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-11 23:14:54');
INSERT INTO `character_history` VALUES ('442', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-12 00:18:34');
INSERT INTO `character_history` VALUES ('443', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-12 22:10:35');
INSERT INTO `character_history` VALUES ('444', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-12 22:56:37');
INSERT INTO `character_history` VALUES ('445', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 09:58:53');
INSERT INTO `character_history` VALUES ('446', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 10:01:43');
INSERT INTO `character_history` VALUES ('447', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 10:02:00');
INSERT INTO `character_history` VALUES ('448', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 10:06:04');
INSERT INTO `character_history` VALUES ('449', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 11:36:27');
INSERT INTO `character_history` VALUES ('450', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 11:37:04');
INSERT INTO `character_history` VALUES ('451', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 11:37:30');
INSERT INTO `character_history` VALUES ('452', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 11:39:15');
INSERT INTO `character_history` VALUES ('453', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 19:56:59');
INSERT INTO `character_history` VALUES ('454', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 19:57:08');
INSERT INTO `character_history` VALUES ('455', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 19:59:58');
INSERT INTO `character_history` VALUES ('456', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 20:33:03');
INSERT INTO `character_history` VALUES ('457', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 20:36:08');
INSERT INTO `character_history` VALUES ('458', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 21:06:27');
INSERT INTO `character_history` VALUES ('459', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-13 21:16:04');
INSERT INTO `character_history` VALUES ('460', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-13 21:17:11');
INSERT INTO `character_history` VALUES ('461', '2', '1', '127.0.0.1', '4', '111', 'Варре', '2013-04-13 23:03:21');
INSERT INTO `character_history` VALUES ('462', '2', '1', '127.0.0.1', '1', '111', 'Варре', '2013-04-13 23:03:38');
INSERT INTO `character_history` VALUES ('463', '2', '1', '127.0.0.1', '2', '111', 'Варре', '2013-04-13 23:04:28');
INSERT INTO `character_history` VALUES ('464', '2', '1', '127.0.0.1', '4', '112', 'Gtgf', '2013-04-13 23:06:26');
INSERT INTO `character_history` VALUES ('465', '2', '1', '127.0.0.1', '1', '112', 'Gtgf', '2013-04-13 23:06:31');
INSERT INTO `character_history` VALUES ('466', '2', '1', '127.0.0.1', '2', '112', 'Gtgf', '2013-04-13 23:07:39');
INSERT INTO `character_history` VALUES ('467', '2', '1', '127.0.0.1', '4', '113', 'De', '2013-04-13 23:17:08');
INSERT INTO `character_history` VALUES ('468', '2', '1', '127.0.0.1', '1', '113', 'De', '2013-04-13 23:17:16');
INSERT INTO `character_history` VALUES ('469', '2', '1', '127.0.0.1', '2', '113', 'De', '2013-04-13 23:19:44');
INSERT INTO `character_history` VALUES ('470', '2', '1', '127.0.0.1', '4', '114', 'Hggy', '2013-04-13 23:19:53');
INSERT INTO `character_history` VALUES ('471', '2', '1', '127.0.0.1', '1', '114', 'Hggy', '2013-04-13 23:20:00');
INSERT INTO `character_history` VALUES ('472', '2', '1', '127.0.0.1', '2', '114', 'Hggy', '2013-04-13 23:32:04');
INSERT INTO `character_history` VALUES ('473', '2', '1', '127.0.0.1', '3', '114', 'Hggy', '2013-04-13 23:59:10');
INSERT INTO `character_history` VALUES ('474', '2', '1', '127.0.0.1', '4', '115', 'Porrnns', '2013-04-14 00:11:52');
INSERT INTO `character_history` VALUES ('475', '2', '1', '127.0.0.1', '1', '115', 'Porrnns', '2013-04-14 00:12:08');
INSERT INTO `character_history` VALUES ('476', '2', '1', '127.0.0.1', '2', '115', 'Porrnns', '2013-04-14 00:13:08');
INSERT INTO `character_history` VALUES ('477', '2', '1', '127.0.0.1', '1', '115', 'Porrnns', '2013-04-14 00:14:55');
INSERT INTO `character_history` VALUES ('478', '2', '1', '127.0.0.1', '2', '115', 'Porrnns', '2013-04-14 00:21:41');
INSERT INTO `character_history` VALUES ('479', '2', '1', '127.0.0.1', '3', '115', 'Porrnns', '2013-04-15 08:25:58');
INSERT INTO `character_history` VALUES ('480', '2', '1', '127.0.0.1', '4', '116', 'Гнн', '2013-04-15 08:26:17');
INSERT INTO `character_history` VALUES ('481', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-15 08:26:30');
INSERT INTO `character_history` VALUES ('482', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-15 08:30:33');
INSERT INTO `character_history` VALUES ('483', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-15 23:17:33');
INSERT INTO `character_history` VALUES ('484', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-15 23:19:12');
INSERT INTO `character_history` VALUES ('485', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-04-15 23:20:22');
INSERT INTO `character_history` VALUES ('486', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-04-15 23:23:55');
INSERT INTO `character_history` VALUES ('487', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-04-15 23:26:19');
INSERT INTO `character_history` VALUES ('488', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-04-15 23:26:55');
INSERT INTO `character_history` VALUES ('489', '2', '1', '127.0.0.1', '4', '117', 'Uyuy', '2013-04-15 23:27:38');
INSERT INTO `character_history` VALUES ('490', '2', '1', '127.0.0.1', '3', '117', 'Uyuy', '2013-04-16 18:42:17');
INSERT INTO `character_history` VALUES ('491', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-16 18:42:33');
INSERT INTO `character_history` VALUES ('492', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-16 18:46:45');
INSERT INTO `character_history` VALUES ('493', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-16 22:31:04');
INSERT INTO `character_history` VALUES ('494', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-16 22:37:15');
INSERT INTO `character_history` VALUES ('495', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-16 22:37:54');
INSERT INTO `character_history` VALUES ('496', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-16 22:52:25');
INSERT INTO `character_history` VALUES ('497', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-17 23:09:47');
INSERT INTO `character_history` VALUES ('498', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-17 23:17:24');
INSERT INTO `character_history` VALUES ('499', '2', '1', '127.0.0.1', '4', '117', 'Tf', '2013-04-20 20:29:42');
INSERT INTO `character_history` VALUES ('500', '2', '1', '127.0.0.1', '1', '117', 'Tf', '2013-04-20 20:30:02');
INSERT INTO `character_history` VALUES ('501', '2', '1', '127.0.0.1', '2', '117', 'Tf', '2013-04-20 20:34:01');
INSERT INTO `character_history` VALUES ('502', '2', '1', '127.0.0.1', '3', '112', 'Gtgf', '2013-04-21 09:57:50');
INSERT INTO `character_history` VALUES ('503', '2', '1', '127.0.0.1', '3', '113', 'De', '2013-04-21 09:57:57');
INSERT INTO `character_history` VALUES ('504', '2', '1', '127.0.0.1', '3', '117', 'Tf', '2013-04-21 09:58:05');
INSERT INTO `character_history` VALUES ('505', '2', '1', '127.0.0.1', '3', '111', 'Варре', '2013-04-21 10:03:46');
INSERT INTO `character_history` VALUES ('506', '2', '1', '127.0.0.1', '4', '118', 'Warche', '2013-04-21 10:04:32');
INSERT INTO `character_history` VALUES ('507', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-21 10:04:48');
INSERT INTO `character_history` VALUES ('508', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-21 10:10:07');
INSERT INTO `character_history` VALUES ('509', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-21 10:10:14');
INSERT INTO `character_history` VALUES ('510', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-21 10:18:49');
INSERT INTO `character_history` VALUES ('511', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-21 16:56:08');
INSERT INTO `character_history` VALUES ('512', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-21 19:32:34');
INSERT INTO `character_history` VALUES ('513', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-21 19:34:42');
INSERT INTO `character_history` VALUES ('514', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-21 19:35:16');
INSERT INTO `character_history` VALUES ('515', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-21 19:37:41');
INSERT INTO `character_history` VALUES ('516', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-21 19:40:04');
INSERT INTO `character_history` VALUES ('517', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-21 19:41:19');
INSERT INTO `character_history` VALUES ('518', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-21 20:00:18');
INSERT INTO `character_history` VALUES ('519', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-21 23:51:42');
INSERT INTO `character_history` VALUES ('520', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-22 00:14:16');
INSERT INTO `character_history` VALUES ('521', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-22 21:39:11');
INSERT INTO `character_history` VALUES ('522', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-22 21:43:33');
INSERT INTO `character_history` VALUES ('523', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-22 21:46:27');
INSERT INTO `character_history` VALUES ('524', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-22 21:47:29');
INSERT INTO `character_history` VALUES ('525', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-24 19:47:31');
INSERT INTO `character_history` VALUES ('526', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-24 19:50:35');
INSERT INTO `character_history` VALUES ('527', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-04-25 14:19:03');
INSERT INTO `character_history` VALUES ('528', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-04-25 14:25:01');
INSERT INTO `character_history` VALUES ('529', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-25 22:41:09');
INSERT INTO `character_history` VALUES ('530', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-25 23:48:14');
INSERT INTO `character_history` VALUES ('531', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-25 23:51:48');
INSERT INTO `character_history` VALUES ('532', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-26 00:21:51');
INSERT INTO `character_history` VALUES ('533', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-26 00:23:06');
INSERT INTO `character_history` VALUES ('534', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-26 00:51:06');
INSERT INTO `character_history` VALUES ('535', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-26 01:06:46');
INSERT INTO `character_history` VALUES ('536', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-26 01:17:44');
INSERT INTO `character_history` VALUES ('537', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-26 01:21:50');
INSERT INTO `character_history` VALUES ('538', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-04-27 07:24:00');
INSERT INTO `character_history` VALUES ('539', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-04-27 07:32:12');
INSERT INTO `character_history` VALUES ('540', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-27 16:07:20');
INSERT INTO `character_history` VALUES ('541', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-27 16:10:58');
INSERT INTO `character_history` VALUES ('542', '3', '1', '127.0.0.1', '1', '65', 'Дикообраз', '2013-04-27 21:29:02');
INSERT INTO `character_history` VALUES ('543', '1', '1', '127.0.0.1', '1', '12', 'Ука', '2013-04-27 21:29:27');
INSERT INTO `character_history` VALUES ('544', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-27 21:30:03');
INSERT INTO `character_history` VALUES ('545', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-27 21:32:42');
INSERT INTO `character_history` VALUES ('546', '1', '1', '127.0.0.1', '2', '12', 'Ука', '2013-04-27 21:32:46');
INSERT INTO `character_history` VALUES ('547', '3', '1', '127.0.0.1', '2', '65', 'Дикообраз', '2013-04-27 21:33:05');
INSERT INTO `character_history` VALUES ('548', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-28 10:05:30');
INSERT INTO `character_history` VALUES ('549', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-28 10:09:25');
INSERT INTO `character_history` VALUES ('550', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-29 22:16:41');
INSERT INTO `character_history` VALUES ('551', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-29 22:25:38');
INSERT INTO `character_history` VALUES ('552', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-29 22:29:32');
INSERT INTO `character_history` VALUES ('553', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-29 22:31:47');
INSERT INTO `character_history` VALUES ('554', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-29 23:29:00');
INSERT INTO `character_history` VALUES ('555', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-29 23:39:15');
INSERT INTO `character_history` VALUES ('556', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-04-29 23:39:22');
INSERT INTO `character_history` VALUES ('557', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-04-29 23:40:20');
INSERT INTO `character_history` VALUES ('558', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-04-29 23:52:19');
INSERT INTO `character_history` VALUES ('559', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-04-30 00:17:32');
INSERT INTO `character_history` VALUES ('560', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-01 23:46:14');
INSERT INTO `character_history` VALUES ('561', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-01 23:52:43');
INSERT INTO `character_history` VALUES ('562', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-05-02 23:00:59');
INSERT INTO `character_history` VALUES ('563', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-05-02 23:15:32');
INSERT INTO `character_history` VALUES ('564', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-05-02 23:26:02');
INSERT INTO `character_history` VALUES ('565', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-05-03 00:05:30');
INSERT INTO `character_history` VALUES ('566', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-03 19:36:25');
INSERT INTO `character_history` VALUES ('567', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-03 20:01:59');
INSERT INTO `character_history` VALUES ('568', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-03 20:07:26');
INSERT INTO `character_history` VALUES ('569', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-03 20:32:50');
INSERT INTO `character_history` VALUES ('570', '2', '1', '127.0.0.1', '4', '119', 'Будакс', '2013-05-04 22:06:46');
INSERT INTO `character_history` VALUES ('571', '2', '1', '127.0.0.1', '1', '119', 'Будакс', '2013-05-04 22:07:04');
INSERT INTO `character_history` VALUES ('572', '2', '1', '127.0.0.1', '2', '119', 'Будакс', '2013-05-04 22:25:39');
INSERT INTO `character_history` VALUES ('573', '2', '1', '127.0.0.1', '1', '119', 'Будакс', '2013-05-07 01:52:20');
INSERT INTO `character_history` VALUES ('574', '2', '1', '127.0.0.1', '2', '119', 'Будакс', '2013-05-07 01:54:17');
INSERT INTO `character_history` VALUES ('575', '2', '1', '127.0.0.1', '1', '119', 'Будакс', '2013-05-07 01:54:27');
INSERT INTO `character_history` VALUES ('576', '2', '1', '127.0.0.1', '2', '119', 'Будакс', '2013-05-07 01:58:30');
INSERT INTO `character_history` VALUES ('577', '2', '1', '127.0.0.1', '1', '119', 'Будакс', '2013-05-07 02:01:43');
INSERT INTO `character_history` VALUES ('578', '2', '1', 'bot', '1', '72', 'Мма', '2013-05-07 02:07:10');
INSERT INTO `character_history` VALUES ('579', '2', '1', 'bot', '1', '93', 'Mmoo', '2013-05-07 02:07:12');
INSERT INTO `character_history` VALUES ('580', '2', '1', 'bot', '1', '103', 'Пукпут', '2013-05-07 02:07:16');
INSERT INTO `character_history` VALUES ('581', '2', '1', 'bot', '1', '110', 'Pristi', '2013-05-07 02:07:20');
INSERT INTO `character_history` VALUES ('582', '2', '1', 'bot', '1', '116', 'Гнн', '2013-05-07 02:07:23');
INSERT INTO `character_history` VALUES ('583', '2', '1', 'bot', '1', '118', 'Warche', '2013-05-07 02:07:25');
INSERT INTO `character_history` VALUES ('584', '2', '1', 'bot', '2', '72', 'Мма', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('585', '2', '1', 'bot', '2', '93', 'Mmoo', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('586', '2', '1', 'bot', '2', '103', 'Пукпут', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('587', '2', '1', 'bot', '2', '118', 'Warche', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('588', '2', '1', 'bot', '2', '110', 'Pristi', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('589', '2', '1', 'bot', '2', '116', 'Гнн', '2013-05-07 02:08:34');
INSERT INTO `character_history` VALUES ('590', '2', '1', 'bot', '1', '72', 'Мма', '2013-05-07 02:09:53');
INSERT INTO `character_history` VALUES ('591', '2', '1', 'bot', '1', '93', 'Mmoo', '2013-05-07 02:09:54');
INSERT INTO `character_history` VALUES ('592', '2', '1', 'bot', '1', '103', 'Пукпут', '2013-05-07 02:09:58');
INSERT INTO `character_history` VALUES ('593', '2', '1', 'bot', '1', '110', 'Pristi', '2013-05-07 02:10:03');
INSERT INTO `character_history` VALUES ('594', '2', '1', 'bot', '1', '116', 'Гнн', '2013-05-07 02:10:03');
INSERT INTO `character_history` VALUES ('595', '2', '1', 'bot', '1', '118', 'Warche', '2013-05-07 02:10:03');
INSERT INTO `character_history` VALUES ('596', '2', '1', 'bot', '2', '93', 'Mmoo', '2013-05-07 02:11:26');
INSERT INTO `character_history` VALUES ('597', '2', '1', 'bot', '2', '116', 'Гнн', '2013-05-07 02:12:08');
INSERT INTO `character_history` VALUES ('598', '2', '1', 'bot', '2', '72', 'Мма', '2013-05-07 02:15:06');
INSERT INTO `character_history` VALUES ('599', '2', '1', 'bot', '2', '103', 'Пукпут', '2013-05-07 02:15:07');
INSERT INTO `character_history` VALUES ('600', '2', '1', 'bot', '2', '118', 'Warche', '2013-05-07 02:15:07');
INSERT INTO `character_history` VALUES ('601', '2', '1', 'bot', '2', '110', 'Pristi', '2013-05-07 02:15:07');
INSERT INTO `character_history` VALUES ('602', '2', '1', 'bot', '1', '72', 'Мма', '2013-05-07 02:15:55');
INSERT INTO `character_history` VALUES ('603', '2', '1', 'bot', '1', '93', 'Mmoo', '2013-05-07 02:15:56');
INSERT INTO `character_history` VALUES ('604', '2', '1', 'bot', '1', '103', 'Пукпут', '2013-05-07 02:16:00');
INSERT INTO `character_history` VALUES ('605', '2', '1', 'bot', '1', '110', 'Pristi', '2013-05-07 02:16:03');
INSERT INTO `character_history` VALUES ('606', '2', '1', 'bot', '1', '116', 'Гнн', '2013-05-07 02:16:04');
INSERT INTO `character_history` VALUES ('607', '2', '1', 'bot', '1', '118', 'Warche', '2013-05-07 02:16:04');
INSERT INTO `character_history` VALUES ('608', '2', '1', 'bot', '2', '118', 'Warche', '2013-05-07 02:16:12');
INSERT INTO `character_history` VALUES ('609', '2', '1', 'bot', '2', '72', 'Мма', '2013-05-07 02:16:21');
INSERT INTO `character_history` VALUES ('610', '2', '1', 'bot', '2', '93', 'Mmoo', '2013-05-07 02:16:21');
INSERT INTO `character_history` VALUES ('611', '2', '1', 'bot', '2', '103', 'Пукпут', '2013-05-07 02:16:21');
INSERT INTO `character_history` VALUES ('612', '2', '1', 'bot', '2', '110', 'Pristi', '2013-05-07 02:16:21');
INSERT INTO `character_history` VALUES ('613', '2', '1', 'bot', '2', '116', 'Гнн', '2013-05-07 02:16:21');
INSERT INTO `character_history` VALUES ('614', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-05-07 22:30:47');
INSERT INTO `character_history` VALUES ('615', '2', '1', 'bot', '1', '93', 'Mmoo', '2013-05-07 22:32:22');
INSERT INTO `character_history` VALUES ('616', '2', '1', 'bot', '2', '93', 'Mmoo', '2013-05-07 22:42:56');
INSERT INTO `character_history` VALUES ('617', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-05-07 23:03:42');
INSERT INTO `character_history` VALUES ('618', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-05-07 23:28:40');
INSERT INTO `character_history` VALUES ('619', '2', '1', '127.0.0.1', '4', '120', 'Бодра', '2013-05-08 17:18:00');
INSERT INTO `character_history` VALUES ('620', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 17:18:18');
INSERT INTO `character_history` VALUES ('621', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-08 17:19:02');
INSERT INTO `character_history` VALUES ('622', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 17:20:03');
INSERT INTO `character_history` VALUES ('623', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 17:44:17');
INSERT INTO `character_history` VALUES ('624', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 20:40:16');
INSERT INTO `character_history` VALUES ('625', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 20:45:52');
INSERT INTO `character_history` VALUES ('626', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-08 20:47:00');
INSERT INTO `character_history` VALUES ('627', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 23:12:31');
INSERT INTO `character_history` VALUES ('628', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-08 23:33:00');
INSERT INTO `character_history` VALUES ('629', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-08 23:37:35');
INSERT INTO `character_history` VALUES ('630', '2', '1', 'bot', '1', '110', 'Pristi', '2013-05-08 23:51:28');
INSERT INTO `character_history` VALUES ('631', '2', '1', 'bot', '2', '110', 'Pristi', '2013-05-08 23:53:30');
INSERT INTO `character_history` VALUES ('632', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-08 23:53:30');
INSERT INTO `character_history` VALUES ('633', '2', '1', '127.0.0.1', '1', '72', 'Мма', '2013-05-08 23:53:49');
INSERT INTO `character_history` VALUES ('634', '2', '1', 'bot', '1', '110', 'Pristi', '2013-05-08 23:56:08');
INSERT INTO `character_history` VALUES ('635', '2', '1', 'bot', '2', '110', 'Pristi', '2013-05-08 23:56:24');
INSERT INTO `character_history` VALUES ('636', '2', '1', '127.0.0.1', '2', '72', 'Мма', '2013-05-08 23:56:24');
INSERT INTO `character_history` VALUES ('637', '2', '1', '127.0.0.1', '1', '110', 'Pristi', '2013-05-08 23:56:33');
INSERT INTO `character_history` VALUES ('638', '2', '1', 'bot', '1', '103', 'Пукпут', '2013-05-08 23:57:29');
INSERT INTO `character_history` VALUES ('639', '2', '1', 'bot', '2', '103', 'Пукпут', '2013-05-09 00:14:05');
INSERT INTO `character_history` VALUES ('640', '2', '1', '127.0.0.1', '2', '110', 'Pristi', '2013-05-09 00:14:05');
INSERT INTO `character_history` VALUES ('641', '2', '1', '127.0.0.1', '1', '116', 'Гнн', '2013-05-09 22:00:34');
INSERT INTO `character_history` VALUES ('642', '2', '1', '127.0.0.1', '2', '116', 'Гнн', '2013-05-09 22:02:56');
INSERT INTO `character_history` VALUES ('643', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-09 22:13:11');
INSERT INTO `character_history` VALUES ('644', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-09 22:15:27');
INSERT INTO `character_history` VALUES ('645', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-09 22:15:34');
INSERT INTO `character_history` VALUES ('646', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-09 22:21:43');
INSERT INTO `character_history` VALUES ('647', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-09 22:21:50');
INSERT INTO `character_history` VALUES ('648', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-09 22:26:01');
INSERT INTO `character_history` VALUES ('649', '2', '1', '127.0.0.1', '4', '121', 'Tt', '2013-05-09 22:26:09');
INSERT INTO `character_history` VALUES ('650', '2', '1', '127.0.0.1', '1', '121', 'Tt', '2013-05-09 22:26:22');
INSERT INTO `character_history` VALUES ('651', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-12 21:42:48');
INSERT INTO `character_history` VALUES ('652', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-12 21:46:40');
INSERT INTO `character_history` VALUES ('653', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-05-15 00:59:31');
INSERT INTO `character_history` VALUES ('654', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-05-15 01:31:26');
INSERT INTO `character_history` VALUES ('655', '2', '1', '127.0.0.1', '4', '122', 'Pallogei', '2013-05-15 01:31:51');
INSERT INTO `character_history` VALUES ('656', '2', '1', '127.0.0.1', '1', '122', 'Pallogei', '2013-05-15 01:31:57');
INSERT INTO `character_history` VALUES ('657', '2', '1', '127.0.0.1', '2', '122', 'Pallogei', '2013-05-15 01:35:42');
INSERT INTO `character_history` VALUES ('658', '2', '1', '127.0.0.1', '1', '122', 'Pallogei', '2013-05-17 20:58:03');
INSERT INTO `character_history` VALUES ('659', '2', '1', '127.0.0.1', '2', '122', 'Pallogei', '2013-05-17 21:08:30');
INSERT INTO `character_history` VALUES ('660', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-18 18:07:07');
INSERT INTO `character_history` VALUES ('661', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-18 18:12:45');
INSERT INTO `character_history` VALUES ('662', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-19 13:14:02');
INSERT INTO `character_history` VALUES ('663', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-19 13:43:54');
INSERT INTO `character_history` VALUES ('664', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-19 13:48:03');
INSERT INTO `character_history` VALUES ('665', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 01:52:41');
INSERT INTO `character_history` VALUES ('666', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-20 01:53:19');
INSERT INTO `character_history` VALUES ('667', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 01:53:24');
INSERT INTO `character_history` VALUES ('668', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-20 01:57:27');
INSERT INTO `character_history` VALUES ('669', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 01:58:12');
INSERT INTO `character_history` VALUES ('670', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-20 01:58:20');
INSERT INTO `character_history` VALUES ('671', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 01:58:26');
INSERT INTO `character_history` VALUES ('672', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-20 02:05:16');
INSERT INTO `character_history` VALUES ('673', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 23:49:24');
INSERT INTO `character_history` VALUES ('674', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-20 23:50:33');
INSERT INTO `character_history` VALUES ('675', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-20 23:50:38');
INSERT INTO `character_history` VALUES ('676', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-21 00:26:58');
INSERT INTO `character_history` VALUES ('677', '2', '1', '127.0.0.1', '1', '122', 'Pallogei', '2013-05-21 23:30:57');
INSERT INTO `character_history` VALUES ('678', '2', '1', '127.0.0.1', '2', '122', 'Pallogei', '2013-05-22 00:01:17');
INSERT INTO `character_history` VALUES ('679', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-22 12:56:01');
INSERT INTO `character_history` VALUES ('680', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-22 13:07:49');
INSERT INTO `character_history` VALUES ('681', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-22 19:19:09');
INSERT INTO `character_history` VALUES ('682', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-22 19:20:22');
INSERT INTO `character_history` VALUES ('683', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-22 19:20:29');
INSERT INTO `character_history` VALUES ('684', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-22 19:34:25');
INSERT INTO `character_history` VALUES ('685', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-22 19:34:32');
INSERT INTO `character_history` VALUES ('686', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-22 19:34:39');
INSERT INTO `character_history` VALUES ('687', '2', '1', '127.0.0.1', '1', '93', 'Mmoo', '2013-05-22 19:34:44');
INSERT INTO `character_history` VALUES ('688', '2', '1', '127.0.0.1', '2', '93', 'Mmoo', '2013-05-22 19:37:53');
INSERT INTO `character_history` VALUES ('689', '2', '1', '192.168.1.4', '1', '122', 'Pallogei', '2013-05-23 01:09:59');
INSERT INTO `character_history` VALUES ('690', '2', '1', '192.168.1.4', '2', '122', 'Pallogei', '2013-05-23 01:35:42');
INSERT INTO `character_history` VALUES ('691', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 00:30:20');
INSERT INTO `character_history` VALUES ('692', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 00:35:02');
INSERT INTO `character_history` VALUES ('693', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 00:36:15');
INSERT INTO `character_history` VALUES ('694', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 00:37:49');
INSERT INTO `character_history` VALUES ('695', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 00:38:23');
INSERT INTO `character_history` VALUES ('696', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 00:43:02');
INSERT INTO `character_history` VALUES ('697', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 00:43:17');
INSERT INTO `character_history` VALUES ('698', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 00:46:13');
INSERT INTO `character_history` VALUES ('699', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 00:47:03');
INSERT INTO `character_history` VALUES ('700', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 00:58:27');
INSERT INTO `character_history` VALUES ('701', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 00:58:35');
INSERT INTO `character_history` VALUES ('702', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 00:59:06');
INSERT INTO `character_history` VALUES ('703', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 00:59:18');
INSERT INTO `character_history` VALUES ('704', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 00:59:29');
INSERT INTO `character_history` VALUES ('705', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 00:59:42');
INSERT INTO `character_history` VALUES ('706', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 00:59:59');
INSERT INTO `character_history` VALUES ('707', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 01:01:11');
INSERT INTO `character_history` VALUES ('708', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 01:01:20');
INSERT INTO `character_history` VALUES ('709', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 01:02:07');
INSERT INTO `character_history` VALUES ('710', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 01:14:10');
INSERT INTO `character_history` VALUES ('711', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 01:14:36');
INSERT INTO `character_history` VALUES ('712', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 01:16:12');
INSERT INTO `character_history` VALUES ('713', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 01:16:48');
INSERT INTO `character_history` VALUES ('714', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 01:18:09');
INSERT INTO `character_history` VALUES ('715', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 01:18:19');
INSERT INTO `character_history` VALUES ('716', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 01:27:42');
INSERT INTO `character_history` VALUES ('717', '6', '1', '178.127.100.87', '1', '32', 'Hero', '2013-05-28 01:27:53');
INSERT INTO `character_history` VALUES ('718', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 01:31:18');
INSERT INTO `character_history` VALUES ('719', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 01:31:24');
INSERT INTO `character_history` VALUES ('720', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 01:53:43');
INSERT INTO `character_history` VALUES ('721', '6', '1', '178.127.100.87', '2', '32', 'Hero', '2013-05-28 01:54:36');
INSERT INTO `character_history` VALUES ('722', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 14:42:42');
INSERT INTO `character_history` VALUES ('723', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 14:43:02');
INSERT INTO `character_history` VALUES ('724', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 14:48:22');
INSERT INTO `character_history` VALUES ('725', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 15:39:24');
INSERT INTO `character_history` VALUES ('726', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 15:40:30');
INSERT INTO `character_history` VALUES ('727', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 17:19:32');
INSERT INTO `character_history` VALUES ('728', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 18:31:08');
INSERT INTO `character_history` VALUES ('729', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 18:38:50');
INSERT INTO `character_history` VALUES ('730', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 18:56:10');
INSERT INTO `character_history` VALUES ('731', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 19:34:13');
INSERT INTO `character_history` VALUES ('732', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 19:46:39');
INSERT INTO `character_history` VALUES ('733', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 20:00:26');
INSERT INTO `character_history` VALUES ('734', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 20:05:21');
INSERT INTO `character_history` VALUES ('735', '6', '1', '37.44.116.151', '1', '54', 'Vxzgv', '2013-05-28 20:05:38');
INSERT INTO `character_history` VALUES ('736', '6', '1', '37.44.116.151', '2', '54', 'Vxzgv', '2013-05-28 20:11:06');
INSERT INTO `character_history` VALUES ('737', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 20:11:18');
INSERT INTO `character_history` VALUES ('738', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 20:17:38');
INSERT INTO `character_history` VALUES ('739', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 21:13:53');
INSERT INTO `character_history` VALUES ('740', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 21:14:09');
INSERT INTO `character_history` VALUES ('741', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 21:15:18');
INSERT INTO `character_history` VALUES ('742', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 21:17:55');
INSERT INTO `character_history` VALUES ('743', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 21:18:06');
INSERT INTO `character_history` VALUES ('744', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 21:18:22');
INSERT INTO `character_history` VALUES ('745', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 21:18:33');
INSERT INTO `character_history` VALUES ('746', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 21:19:50');
INSERT INTO `character_history` VALUES ('747', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 21:19:50');
INSERT INTO `character_history` VALUES ('748', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-28 21:21:36');
INSERT INTO `character_history` VALUES ('749', '6', '1', '37.44.116.151', '1', '32', 'Hero', '2013-05-28 21:22:13');
INSERT INTO `character_history` VALUES ('750', '3', '1', '192.168.1.4', '1', '42', 'Ёж', '2013-05-28 21:29:34');
INSERT INTO `character_history` VALUES ('751', '3', '1', '192.168.1.4', '2', '42', 'Ёж', '2013-05-28 21:36:00');
INSERT INTO `character_history` VALUES ('752', '6', '1', '37.44.116.151', '2', '32', 'Hero', '2013-05-28 21:41:13');
INSERT INTO `character_history` VALUES ('753', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-28 21:43:46');
INSERT INTO `character_history` VALUES ('754', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-29 00:23:10');
INSERT INTO `character_history` VALUES ('755', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-29 00:28:15');
INSERT INTO `character_history` VALUES ('756', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 00:28:41');
INSERT INTO `character_history` VALUES ('757', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 00:36:10');
INSERT INTO `character_history` VALUES ('758', '2', '1', '192.168.1.4', '2', '93', 'Mmoo', '2013-05-29 00:36:46');
INSERT INTO `character_history` VALUES ('759', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 00:37:03');
INSERT INTO `character_history` VALUES ('760', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 00:57:57');
INSERT INTO `character_history` VALUES ('761', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 01:10:43');
INSERT INTO `character_history` VALUES ('762', '2', '1', '192.168.1.4', '2', '93', 'Mmoo', '2013-05-29 01:13:28');
INSERT INTO `character_history` VALUES ('763', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 09:03:54');
INSERT INTO `character_history` VALUES ('764', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 17:55:38');
INSERT INTO `character_history` VALUES ('765', '2', '1', '192.168.1.4', '2', '93', 'Mmoo', '2013-05-29 17:56:59');
INSERT INTO `character_history` VALUES ('766', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 17:57:08');
INSERT INTO `character_history` VALUES ('767', '6', '1', '178.127.101.214', '1', '32', 'Hero', '2013-05-29 18:08:40');
INSERT INTO `character_history` VALUES ('768', '2', '1', '192.168.1.4', '2', '93', 'Mmoo', '2013-05-29 18:10:31');
INSERT INTO `character_history` VALUES ('769', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-29 18:10:50');
INSERT INTO `character_history` VALUES ('770', '13', '1', '178.127.101.214', '4', '123', 'Cvzxdbvgx', '2013-05-29 18:16:53');
INSERT INTO `character_history` VALUES ('771', '13', '1', '178.127.101.214', '1', '123', 'Cvzxdbvgx', '2013-05-29 18:17:17');
INSERT INTO `character_history` VALUES ('772', '13', '1', '178.127.101.214', '2', '123', 'Cvzxdbvgx', '2013-05-29 18:17:43');
INSERT INTO `character_history` VALUES ('773', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-29 18:47:52');
INSERT INTO `character_history` VALUES ('774', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-29 19:11:58');
INSERT INTO `character_history` VALUES ('775', '6', '1', '178.127.101.214', '2', '32', 'Hero', '2013-05-29 19:17:53');
INSERT INTO `character_history` VALUES ('776', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-29 19:17:53');
INSERT INTO `character_history` VALUES ('777', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-29 19:18:36');
INSERT INTO `character_history` VALUES ('778', '6', '1', '178.127.101.214', '1', '32', 'Hero', '2013-05-29 19:19:08');
INSERT INTO `character_history` VALUES ('779', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-29 19:26:01');
INSERT INTO `character_history` VALUES ('780', '2', '1', '192.168.1.4', '1', '93', 'Mmoo', '2013-05-29 19:26:11');
INSERT INTO `character_history` VALUES ('781', '6', '1', '178.127.101.214', '2', '32', 'Hero', '2013-05-29 19:38:12');
INSERT INTO `character_history` VALUES ('782', '13', '1', '178.127.101.214', '1', '123', 'Cvzxdbvgx', '2013-05-29 19:40:59');
INSERT INTO `character_history` VALUES ('783', '13', '1', '178.127.101.214', '2', '123', 'Cvzxdbvgx', '2013-05-29 19:47:03');
INSERT INTO `character_history` VALUES ('784', '6', '1', '178.127.101.214', '1', '32', 'Hero', '2013-05-29 19:47:19');
INSERT INTO `character_history` VALUES ('785', '2', '1', '192.168.1.4', '2', '93', 'Mmoo', '2013-05-29 19:49:04');
INSERT INTO `character_history` VALUES ('786', '15', '1', '178.123.226.114', '4', '124', 'War', '2013-05-29 19:50:00');
INSERT INTO `character_history` VALUES ('787', '15', '1', '178.123.226.114', '1', '124', 'War', '2013-05-29 19:50:21');
INSERT INTO `character_history` VALUES ('788', '15', '1', '178.123.226.114', '2', '124', 'War', '2013-05-29 19:50:56');
INSERT INTO `character_history` VALUES ('789', '14', '1', '192.168.1.4', '4', '125', 'Prostoprist', '2013-05-29 19:55:24');
INSERT INTO `character_history` VALUES ('790', '14', '1', '192.168.1.4', '1', '125', 'Prostoprist', '2013-05-29 19:55:32');
INSERT INTO `character_history` VALUES ('791', '14', '1', '192.168.1.4', '2', '125', 'Prostoprist', '2013-05-29 19:56:29');
INSERT INTO `character_history` VALUES ('792', '14', '1', '192.168.1.4', '4', '126', 'Ggyg', '2013-05-29 19:56:36');
INSERT INTO `character_history` VALUES ('793', '14', '1', '192.168.1.4', '1', '126', 'Ggyg', '2013-05-29 19:56:45');
INSERT INTO `character_history` VALUES ('794', '14', '1', '192.168.1.4', '2', '126', 'Ggyg', '2013-05-29 19:57:16');
INSERT INTO `character_history` VALUES ('795', '2', '1', '192.168.1.4', '3', '121', 'Tt', '2013-05-29 19:57:36');
INSERT INTO `character_history` VALUES ('796', '2', '1', '192.168.1.4', '4', '127', 'Апек', '2013-05-29 19:57:44');
INSERT INTO `character_history` VALUES ('797', '2', '1', '192.168.1.4', '1', '127', 'Апек', '2013-05-29 19:57:49');
INSERT INTO `character_history` VALUES ('798', '6', '1', '178.127.101.214', '2', '32', 'Hero', '2013-05-29 19:58:16');
INSERT INTO `character_history` VALUES ('799', '6', '1', '178.127.101.214', '3', '71', 'Выпар', '2013-05-29 19:58:37');
INSERT INTO `character_history` VALUES ('800', '6', '1', '178.127.101.214', '4', '128', 'Выпы', '2013-05-29 19:58:47');
INSERT INTO `character_history` VALUES ('801', '6', '1', '178.127.101.214', '1', '128', 'Выпы', '2013-05-29 19:58:55');
INSERT INTO `character_history` VALUES ('802', '6', '1', '178.127.101.214', '2', '128', 'Выпы', '2013-05-29 19:59:27');
INSERT INTO `character_history` VALUES ('803', '6', '1', '178.127.101.214', '1', '32', 'Hero', '2013-05-29 19:59:38');
INSERT INTO `character_history` VALUES ('804', '16', '1', '31.41.111.154', '4', '129', 'Найтноунейм', '2013-05-29 20:01:40');
INSERT INTO `character_history` VALUES ('805', '16', '1', '31.41.111.154', '1', '129', 'Найтноунейм', '2013-05-29 20:01:53');
INSERT INTO `character_history` VALUES ('806', '16', '1', '31.41.111.154', '2', '129', 'Найтноунейм', '2013-05-29 20:14:45');
INSERT INTO `character_history` VALUES ('807', '17', '1', '128.73.75.64', '4', '130', 'Кишкадрал', '2013-05-29 20:17:55');
INSERT INTO `character_history` VALUES ('808', '17', '1', '128.73.75.64', '1', '130', 'Кишкадрал', '2013-05-29 20:18:00');
INSERT INTO `character_history` VALUES ('809', '17', '1', '128.73.75.64', '2', '130', 'Кишкадрал', '2013-05-29 20:33:06');
INSERT INTO `character_history` VALUES ('810', '17', '1', '128.73.75.64', '1', '130', 'Кишкадрал', '2013-05-29 20:33:27');
INSERT INTO `character_history` VALUES ('811', '17', '1', '128.73.75.64', '2', '130', 'Кишкадрал', '2013-05-29 20:34:30');
INSERT INTO `character_history` VALUES ('812', '17', '1', '128.73.75.64', '4', '131', 'Fhkdfj', '2013-05-29 20:35:12');
INSERT INTO `character_history` VALUES ('813', '17', '1', '128.73.75.64', '1', '131', 'Fhkdfj', '2013-05-29 20:35:48');
INSERT INTO `character_history` VALUES ('814', '6', '1', '178.127.101.214', '2', '32', 'Hero', '2013-05-29 20:36:00');
INSERT INTO `character_history` VALUES ('815', '17', '1', '128.73.75.64', '2', '131', 'Fhkdfj', '2013-05-29 20:36:35');
INSERT INTO `character_history` VALUES ('816', '2', '1', '192.168.1.4', '2', '127', 'Апек', '2013-05-29 20:37:17');
INSERT INTO `character_history` VALUES ('817', '6', '1', '178.127.236.48', '1', '32', 'Hero', '2013-05-30 20:26:25');
INSERT INTO `character_history` VALUES ('818', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-30 20:26:36');
INSERT INTO `character_history` VALUES ('819', '9', '1', '95.83.108.122', '1', '69', 'Flippy', '2013-05-30 20:26:55');
INSERT INTO `character_history` VALUES ('820', '9', '1', '95.83.108.122', '2', '69', 'Flippy', '2013-05-30 20:35:43');
INSERT INTO `character_history` VALUES ('821', '9', '1', '95.83.108.122', '1', '69', 'Flippy', '2013-05-30 20:36:10');
INSERT INTO `character_history` VALUES ('822', '9', '1', '95.83.108.122', '2', '69', 'Flippy', '2013-05-30 21:02:14');
INSERT INTO `character_history` VALUES ('823', '1', '1', '192.168.1.4', '1', '12', 'Ука', '2013-05-30 21:12:06');
INSERT INTO `character_history` VALUES ('824', '1', '1', '192.168.1.4', '2', '12', 'Ука', '2013-05-30 21:12:20');
INSERT INTO `character_history` VALUES ('825', '1', '1', '192.168.1.4', '1', '30', 'Crashik', '2013-05-30 21:12:42');
INSERT INTO `character_history` VALUES ('826', '1', '1', '192.168.1.4', '2', '30', 'Crashik', '2013-05-30 21:13:03');
INSERT INTO `character_history` VALUES ('827', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-30 21:13:17');
INSERT INTO `character_history` VALUES ('828', '6', '1', '178.127.236.48', '2', '32', 'Hero', '2013-05-30 21:13:26');
INSERT INTO `character_history` VALUES ('829', '2', '1', '192.168.1.4', '1', '120', 'Бодра', '2013-05-30 21:16:33');
INSERT INTO `character_history` VALUES ('830', '2', '1', '192.168.1.4', '2', '120', 'Бодра', '2013-05-30 21:25:34');
INSERT INTO `character_history` VALUES ('831', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-06-01 14:52:57');
INSERT INTO `character_history` VALUES ('832', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-06-01 15:59:50');
INSERT INTO `character_history` VALUES ('833', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-06-01 16:12:06');
INSERT INTO `character_history` VALUES ('834', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-06-01 16:12:55');
INSERT INTO `character_history` VALUES ('835', '2', '1', '127.0.0.1', '1', '120', 'Бодра', '2013-06-01 16:16:32');
INSERT INTO `character_history` VALUES ('836', '2', '1', '127.0.0.1', '2', '120', 'Бодра', '2013-06-01 16:59:39');
INSERT INTO `character_history` VALUES ('837', '2', '1', '127.0.0.1', '3', '127', 'Апек', '2013-06-01 16:59:51');
INSERT INTO `character_history` VALUES ('838', '2', '1', '127.0.0.1', '4', '132', 'Уркенси', '2013-06-01 17:00:51');
INSERT INTO `character_history` VALUES ('839', '2', '1', '127.0.0.1', '1', '132', 'Уркенси', '2013-06-01 17:01:07');
INSERT INTO `character_history` VALUES ('840', '2', '1', '127.0.0.1', '2', '132', 'Уркенси', '2013-06-01 17:02:34');
INSERT INTO `character_history` VALUES ('841', '2', '1', '127.0.0.1', '3', '119', 'Будакс', '2013-06-01 17:03:14');
INSERT INTO `character_history` VALUES ('842', '2', '1', '127.0.0.1', '4', '133', 'Vfdvd', '2013-06-01 17:03:21');
INSERT INTO `character_history` VALUES ('843', '2', '1', '127.0.0.1', '1', '133', 'Vfdvd', '2013-06-01 17:03:28');
INSERT INTO `character_history` VALUES ('844', '2', '1', '127.0.0.1', '2', '133', 'Vfdvd', '2013-06-01 17:09:31');
INSERT INTO `character_history` VALUES ('845', '2', '1', '127.0.0.1', '1', '132', 'Уркенси', '2013-06-01 17:09:39');
INSERT INTO `character_history` VALUES ('846', '2', '1', '127.0.0.1', '2', '132', 'Уркенси', '2013-06-01 17:12:24');
INSERT INTO `character_history` VALUES ('847', '2', '1', '127.0.0.1', '3', '133', 'Vfdvd', '2013-06-01 17:12:34');
INSERT INTO `character_history` VALUES ('848', '2', '1', '127.0.0.1', '4', '134', 'Цуп', '2013-06-01 17:12:45');
INSERT INTO `character_history` VALUES ('849', '2', '1', '127.0.0.1', '1', '134', 'Цуп', '2013-06-01 17:12:54');
INSERT INTO `character_history` VALUES ('850', '2', '1', '127.0.0.1', '2', '134', 'Цуп', '2013-06-01 17:14:35');
INSERT INTO `character_history` VALUES ('851', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-06-01 17:16:19');
INSERT INTO `character_history` VALUES ('852', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-06-01 17:18:41');
INSERT INTO `character_history` VALUES ('853', '2', '1', '127.0.0.1', '1', '118', 'Warche', '2013-06-01 17:28:50');
INSERT INTO `character_history` VALUES ('854', '3', '1', '127.0.0.1', '1', '89', 'Арп', '2013-06-01 17:30:32');
INSERT INTO `character_history` VALUES ('855', '4', '1', '127.0.0.1', '1', '79', 'Fret', '2013-06-01 17:33:56');
INSERT INTO `character_history` VALUES ('856', '5', '1', '127.0.0.1', '4', '135', 'Hyuk', '2013-06-01 17:35:21');
INSERT INTO `character_history` VALUES ('857', '5', '1', '127.0.0.1', '1', '135', 'Hyuk', '2013-06-01 17:35:42');
INSERT INTO `character_history` VALUES ('858', '3', '1', '127.0.0.1', '2', '89', 'Арп', '2013-06-01 17:38:07');
INSERT INTO `character_history` VALUES ('859', '2', '1', '127.0.0.1', '2', '118', 'Warche', '2013-06-01 17:38:10');
INSERT INTO `character_history` VALUES ('860', '5', '1', '127.0.0.1', '2', '135', 'Hyuk', '2013-06-01 17:38:12');
INSERT INTO `character_history` VALUES ('861', '4', '1', '127.0.0.1', '2', '79', 'Fret', '2013-06-01 17:38:16');
INSERT INTO `character_history` VALUES ('862', '4', '1', '127.0.0.1', '1', '79', 'Fret', '2013-06-01 17:41:58');
INSERT INTO `character_history` VALUES ('863', '5', '1', '127.0.0.1', '1', '135', 'Hyuk', '2013-06-01 17:42:22');
INSERT INTO `character_history` VALUES ('864', '5', '1', '127.0.0.1', '2', '135', 'Hyuk', '2013-06-01 17:47:35');
INSERT INTO `character_history` VALUES ('865', '4', '1', '127.0.0.1', '2', '79', 'Fret', '2013-06-01 17:47:36');
INSERT INTO `character_history` VALUES ('866', '2', '1', '127.0.0.1', '4', '1', 'Бодра', '2013-06-01 17:56:01');
INSERT INTO `character_history` VALUES ('867', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 17:56:14');
INSERT INTO `character_history` VALUES ('868', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-01 17:57:31');
INSERT INTO `character_history` VALUES ('869', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 17:58:50');
INSERT INTO `character_history` VALUES ('870', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-01 17:59:05');
INSERT INTO `character_history` VALUES ('871', '2', '1', '127.0.0.1', '4', '2', 'Frrge', '2013-06-01 18:00:48');
INSERT INTO `character_history` VALUES ('872', '2', '1', '127.0.0.1', '1', '2', 'Frrge', '2013-06-01 18:00:53');
INSERT INTO `character_history` VALUES ('873', '2', '1', '127.0.0.1', '2', '2', 'Frrge', '2013-06-01 18:01:15');
INSERT INTO `character_history` VALUES ('874', '2', '1', '127.0.0.1', '4', '3', 'Dsgvd', '2013-06-01 18:01:27');
INSERT INTO `character_history` VALUES ('875', '2', '1', '127.0.0.1', '1', '3', 'Dsgvd', '2013-06-01 18:01:32');
INSERT INTO `character_history` VALUES ('876', '2', '1', '127.0.0.1', '2', '3', 'Dsgvd', '2013-06-01 18:01:54');
INSERT INTO `character_history` VALUES ('877', '2', '1', '127.0.0.1', '4', '4', 'Gergre', '2013-06-01 18:04:21');
INSERT INTO `character_history` VALUES ('878', '2', '1', '127.0.0.1', '1', '4', 'Gergre', '2013-06-01 18:04:29');
INSERT INTO `character_history` VALUES ('879', '2', '1', '127.0.0.1', '2', '4', 'Gergre', '2013-06-01 18:04:51');
INSERT INTO `character_history` VALUES ('880', '3', '1', '127.0.0.1', '4', '5', 'Geg', '2013-06-01 18:05:14');
INSERT INTO `character_history` VALUES ('881', '3', '1', '127.0.0.1', '1', '5', 'Geg', '2013-06-01 18:05:17');
INSERT INTO `character_history` VALUES ('882', '3', '1', '127.0.0.1', '2', '5', 'Geg', '2013-06-01 18:05:27');
INSERT INTO `character_history` VALUES ('883', '2', '1', '127.0.0.1', '4', '6', 'Ewwg', '2013-06-01 18:07:50');
INSERT INTO `character_history` VALUES ('884', '2', '1', '127.0.0.1', '1', '6', 'Ewwg', '2013-06-01 18:07:53');
INSERT INTO `character_history` VALUES ('885', '2', '1', '127.0.0.1', '2', '6', 'Ewwg', '2013-06-01 18:08:02');
INSERT INTO `character_history` VALUES ('886', '2', '1', '127.0.0.1', '3', '6', 'Ewwg', '2013-06-01 18:10:03');
INSERT INTO `character_history` VALUES ('887', '2', '1', '127.0.0.1', '3', '4', 'Gergre', '2013-06-01 18:10:09');
INSERT INTO `character_history` VALUES ('888', '2', '1', '127.0.0.1', '3', '3', 'Dsgvd', '2013-06-01 18:10:14');
INSERT INTO `character_history` VALUES ('889', '2', '1', '127.0.0.1', '3', '2', 'Frrge', '2013-06-01 18:10:17');
INSERT INTO `character_history` VALUES ('890', '2', '1', '127.0.0.1', '4', '7', 'Сзв', '2013-06-01 18:10:28');
INSERT INTO `character_history` VALUES ('891', '2', '1', '127.0.0.1', '1', '7', 'Сзв', '2013-06-01 18:10:31');
INSERT INTO `character_history` VALUES ('892', '2', '1', '127.0.0.1', '2', '7', 'Сзв', '2013-06-01 18:10:43');
INSERT INTO `character_history` VALUES ('893', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 18:10:51');
INSERT INTO `character_history` VALUES ('894', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 18:17:52');
INSERT INTO `character_history` VALUES ('895', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-01 18:18:21');
INSERT INTO `character_history` VALUES ('896', '2', '1', '127.0.0.1', '4', '8', 'Fs', '2013-06-01 18:18:31');
INSERT INTO `character_history` VALUES ('897', '2', '1', '127.0.0.1', '1', '8', 'Fs', '2013-06-01 18:18:35');
INSERT INTO `character_history` VALUES ('898', '2', '1', '127.0.0.1', '2', '8', 'Fs', '2013-06-01 18:18:52');
INSERT INTO `character_history` VALUES ('899', '2', '1', '127.0.0.1', '4', '9', 'Fggre', '2013-06-01 18:22:08');
INSERT INTO `character_history` VALUES ('900', '2', '1', '127.0.0.1', '1', '8', 'Fs', '2013-06-01 18:23:37');
INSERT INTO `character_history` VALUES ('901', '2', '1', '127.0.0.1', '2', '8', 'Fs', '2013-06-01 18:23:47');
INSERT INTO `character_history` VALUES ('902', '3', '1', '127.0.0.1', '1', '5', 'Geg', '2013-06-01 18:24:11');
INSERT INTO `character_history` VALUES ('903', '3', '1', '127.0.0.1', '2', '5', 'Geg', '2013-06-01 18:24:42');
INSERT INTO `character_history` VALUES ('904', '2', '1', '127.0.0.1', '4', '10', 'Uhg', '2013-06-01 18:32:42');
INSERT INTO `character_history` VALUES ('905', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-01 18:32:48');
INSERT INTO `character_history` VALUES ('906', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-01 18:33:30');
INSERT INTO `character_history` VALUES ('907', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 18:33:40');
INSERT INTO `character_history` VALUES ('908', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-01 19:40:44');
INSERT INTO `character_history` VALUES ('909', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 21:14:08');
INSERT INTO `character_history` VALUES ('910', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-01 21:29:06');
INSERT INTO `character_history` VALUES ('911', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-01 23:18:09');
INSERT INTO `character_history` VALUES ('912', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-02 00:03:50');
INSERT INTO `character_history` VALUES ('913', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-02 23:57:21');
INSERT INTO `character_history` VALUES ('914', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-03 00:26:28');
INSERT INTO `character_history` VALUES ('915', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-04 00:49:51');
INSERT INTO `character_history` VALUES ('916', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-04 00:50:48');
INSERT INTO `character_history` VALUES ('917', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-04 01:00:56');
INSERT INTO `character_history` VALUES ('918', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-04 01:01:11');
INSERT INTO `character_history` VALUES ('919', '4', '1', '127.0.0.1', '4', '11', 'Cdf', '2013-06-04 01:01:32');
INSERT INTO `character_history` VALUES ('920', '4', '1', '127.0.0.1', '1', '11', 'Cdf', '2013-06-04 01:01:41');
INSERT INTO `character_history` VALUES ('921', '4', '1', '127.0.0.1', '2', '11', 'Cdf', '2013-06-04 01:03:09');
INSERT INTO `character_history` VALUES ('922', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-04 01:03:29');
INSERT INTO `character_history` VALUES ('923', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-04 01:04:23');
INSERT INTO `character_history` VALUES ('924', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-04 01:09:09');
INSERT INTO `character_history` VALUES ('925', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-04 01:09:28');
INSERT INTO `character_history` VALUES ('926', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-04 01:14:10');
INSERT INTO `character_history` VALUES ('927', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-04 01:14:43');
INSERT INTO `character_history` VALUES ('928', '2', '1', '127.0.0.1', '1', '10', 'Uhg', '2013-06-04 11:23:22');
INSERT INTO `character_history` VALUES ('929', '2', '1', '127.0.0.1', '2', '10', 'Uhg', '2013-06-04 11:25:58');
INSERT INTO `character_history` VALUES ('930', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-04 22:24:06');
INSERT INTO `character_history` VALUES ('931', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-04 23:19:47');
INSERT INTO `character_history` VALUES ('932', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-04 23:22:51');
INSERT INTO `character_history` VALUES ('933', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-04 23:42:23');
INSERT INTO `character_history` VALUES ('934', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-05 15:35:03');
INSERT INTO `character_history` VALUES ('935', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-05 15:38:44');
INSERT INTO `character_history` VALUES ('936', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-05 16:10:19');
INSERT INTO `character_history` VALUES ('937', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-05 16:10:38');
INSERT INTO `character_history` VALUES ('938', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-06 02:22:36');
INSERT INTO `character_history` VALUES ('939', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-06 08:37:30');
INSERT INTO `character_history` VALUES ('940', '2', '1', '127.0.0.1', '4', '12', 'Ханти', '2013-06-06 13:30:51');
INSERT INTO `character_history` VALUES ('941', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-06 13:58:33');
INSERT INTO `character_history` VALUES ('942', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-06 14:20:39');
INSERT INTO `character_history` VALUES ('943', '2', '1', '127.0.0.1', '4', '13', 'Vfdv', '2013-06-06 14:20:50');
INSERT INTO `character_history` VALUES ('944', '2', '1', '127.0.0.1', '1', '13', 'Vfdv', '2013-06-06 14:20:58');
INSERT INTO `character_history` VALUES ('945', '2', '1', '127.0.0.1', '2', '13', 'Vfdv', '2013-06-06 14:22:50');
INSERT INTO `character_history` VALUES ('946', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-06 14:22:59');
INSERT INTO `character_history` VALUES ('947', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-06 14:54:09');
INSERT INTO `character_history` VALUES ('948', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-06 16:25:20');
INSERT INTO `character_history` VALUES ('949', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-06 16:29:49');
INSERT INTO `character_history` VALUES ('950', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-06 16:30:00');
INSERT INTO `character_history` VALUES ('951', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-06 16:34:33');
INSERT INTO `character_history` VALUES ('952', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-06 21:09:02');
INSERT INTO `character_history` VALUES ('953', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-06 22:46:19');
INSERT INTO `character_history` VALUES ('954', '2', '1', '127.0.0.1', '1', '1', 'Бодра', '2013-06-07 13:46:16');
INSERT INTO `character_history` VALUES ('955', '2', '1', '127.0.0.1', '2', '1', 'Бодра', '2013-06-07 13:47:25');
INSERT INTO `character_history` VALUES ('956', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-07 20:23:59');
INSERT INTO `character_history` VALUES ('957', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-07 20:24:28');
INSERT INTO `character_history` VALUES ('958', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-07 23:26:55');
INSERT INTO `character_history` VALUES ('959', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-07 23:28:40');
INSERT INTO `character_history` VALUES ('960', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-07 23:36:21');
INSERT INTO `character_history` VALUES ('961', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-07 23:46:33');
INSERT INTO `character_history` VALUES ('962', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-07 23:51:08');
INSERT INTO `character_history` VALUES ('963', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-07 23:58:38');
INSERT INTO `character_history` VALUES ('964', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 00:00:04');
INSERT INTO `character_history` VALUES ('965', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-08 00:47:20');
INSERT INTO `character_history` VALUES ('966', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 00:49:55');
INSERT INTO `character_history` VALUES ('967', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-08 01:22:01');
INSERT INTO `character_history` VALUES ('968', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 01:23:35');
INSERT INTO `character_history` VALUES ('969', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-08 01:28:14');
INSERT INTO `character_history` VALUES ('970', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 01:37:41');
INSERT INTO `character_history` VALUES ('971', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-08 02:08:15');
INSERT INTO `character_history` VALUES ('972', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 02:11:07');
INSERT INTO `character_history` VALUES ('973', '2', '1', '127.0.0.1', '4', '14', 'Errfe', '2013-06-08 02:11:21');
INSERT INTO `character_history` VALUES ('974', '2', '1', '127.0.0.1', '1', '14', 'Errfe', '2013-06-08 02:11:34');
INSERT INTO `character_history` VALUES ('975', '2', '1', '127.0.0.1', '2', '14', 'Errfe', '2013-06-08 02:16:10');
INSERT INTO `character_history` VALUES ('976', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-08 11:25:53');
INSERT INTO `character_history` VALUES ('977', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-08 11:45:58');
INSERT INTO `character_history` VALUES ('978', '2', '1', '127.0.0.1', '4', '15', 'Drupi', '2013-06-08 14:34:56');
INSERT INTO `character_history` VALUES ('979', '2', '1', '127.0.0.1', '4', '16', 'Druppi', '2013-06-08 14:35:09');
INSERT INTO `character_history` VALUES ('980', '2', '1', '127.0.0.1', '1', '16', 'Druppi', '2013-06-08 14:35:19');
INSERT INTO `character_history` VALUES ('981', '2', '1', '127.0.0.1', '2', '16', 'Druppi', '2013-06-08 14:42:51');
INSERT INTO `character_history` VALUES ('982', '2', '1', '127.0.0.1', '1', '16', 'Druppi', '2013-06-08 14:52:49');
INSERT INTO `character_history` VALUES ('983', '2', '1', '127.0.0.1', '2', '16', 'Druppi', '2013-06-08 14:54:46');
INSERT INTO `character_history` VALUES ('984', '2', '1', '127.0.0.1', '1', '16', 'Druppi', '2013-06-08 15:01:40');
INSERT INTO `character_history` VALUES ('985', '2', '1', '127.0.0.1', '2', '16', 'Druppi', '2013-06-08 15:02:46');
INSERT INTO `character_history` VALUES ('986', '2', '1', '127.0.0.1', '1', '16', 'Druppi', '2013-06-08 15:10:42');
INSERT INTO `character_history` VALUES ('987', '2', '1', '127.0.0.1', '2', '16', 'Druppi', '2013-06-08 15:12:04');
INSERT INTO `character_history` VALUES ('988', '2', '1', '127.0.0.1', '3', '16', 'Druppi', '2013-06-08 15:12:13');
INSERT INTO `character_history` VALUES ('989', '2', '1', '127.0.0.1', '3', '15', 'Drupi', '2013-06-08 15:12:29');
INSERT INTO `character_history` VALUES ('990', '2', '1', '127.0.0.1', '4', '17', 'Жупи', '2013-06-08 15:13:59');
INSERT INTO `character_history` VALUES ('991', '2', '1', '127.0.0.1', '1', '17', 'Жупи', '2013-06-08 15:14:04');
INSERT INTO `character_history` VALUES ('992', '2', '1', '127.0.0.1', '2', '17', 'Жупи', '2013-06-08 15:17:12');
INSERT INTO `character_history` VALUES ('993', '2', '1', '127.0.0.1', '4', '18', 'Дккашка', '2013-06-08 15:20:43');
INSERT INTO `character_history` VALUES ('994', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 15:21:14');
INSERT INTO `character_history` VALUES ('995', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 15:24:55');
INSERT INTO `character_history` VALUES ('996', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 15:48:51');
INSERT INTO `character_history` VALUES ('997', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 15:49:39');
INSERT INTO `character_history` VALUES ('998', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 15:55:07');
INSERT INTO `character_history` VALUES ('999', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 15:56:23');
INSERT INTO `character_history` VALUES ('1000', '3', '1', '127.0.0.1', '4', '19', 'Nodk', '2013-06-08 16:09:29');
INSERT INTO `character_history` VALUES ('1001', '3', '1', '127.0.0.1', '1', '19', 'Nodk', '2013-06-08 16:09:43');
INSERT INTO `character_history` VALUES ('1002', '3', '1', '127.0.0.1', '2', '19', 'Nodk', '2013-06-08 16:10:44');
INSERT INTO `character_history` VALUES ('1003', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 16:29:46');
INSERT INTO `character_history` VALUES ('1004', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 16:53:39');
INSERT INTO `character_history` VALUES ('1005', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 17:06:58');
INSERT INTO `character_history` VALUES ('1006', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 17:49:30');
INSERT INTO `character_history` VALUES ('1007', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 18:08:37');
INSERT INTO `character_history` VALUES ('1008', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 18:10:21');
INSERT INTO `character_history` VALUES ('1009', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-08 18:14:47');
INSERT INTO `character_history` VALUES ('1010', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-08 18:37:20');
INSERT INTO `character_history` VALUES ('1011', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-09 14:09:43');
INSERT INTO `character_history` VALUES ('1012', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-09 14:13:28');
INSERT INTO `character_history` VALUES ('1013', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-09 14:13:49');
INSERT INTO `character_history` VALUES ('1014', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-09 14:14:19');
INSERT INTO `character_history` VALUES ('1015', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-09 14:17:21');
INSERT INTO `character_history` VALUES ('1016', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-09 14:18:55');
INSERT INTO `character_history` VALUES ('1017', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-09 14:28:25');
INSERT INTO `character_history` VALUES ('1018', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-09 14:30:37');
INSERT INTO `character_history` VALUES ('1019', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-10 14:05:28');
INSERT INTO `character_history` VALUES ('1020', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-10 14:26:35');
INSERT INTO `character_history` VALUES ('1021', '2', '1', '127.0.0.1', '3', '17', 'Жупи', '2013-06-11 19:35:09');
INSERT INTO `character_history` VALUES ('1022', '2', '1', '127.0.0.1', '4', '20', 'Эльфи', '2013-06-11 19:35:36');
INSERT INTO `character_history` VALUES ('1023', '2', '1', '127.0.0.1', '1', '20', 'Эльфи', '2013-06-11 19:35:45');
INSERT INTO `character_history` VALUES ('1024', '2', '1', '127.0.0.1', '2', '20', 'Эльфи', '2013-06-11 19:51:08');
INSERT INTO `character_history` VALUES ('1025', '2', '1', '127.0.0.1', '1', '20', 'Эльфи', '2013-06-12 00:09:28');
INSERT INTO `character_history` VALUES ('1026', '2', '1', '127.0.0.1', '2', '20', 'Эльфи', '2013-06-12 00:10:24');
INSERT INTO `character_history` VALUES ('1027', '2', '1', '127.0.0.1', '1', '20', 'Эльфи', '2013-06-12 00:12:55');
INSERT INTO `character_history` VALUES ('1028', '2', '1', '127.0.0.1', '2', '20', 'Эльфи', '2013-06-12 00:13:09');
INSERT INTO `character_history` VALUES ('1029', '2', '1', '127.0.0.1', '3', '20', 'Эльфи', '2013-06-12 00:13:26');
INSERT INTO `character_history` VALUES ('1030', '2', '1', '127.0.0.1', '4', '21', 'Гпрнг', '2013-06-12 00:13:35');
INSERT INTO `character_history` VALUES ('1031', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 00:13:40');
INSERT INTO `character_history` VALUES ('1032', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 00:19:16');
INSERT INTO `character_history` VALUES ('1033', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 00:29:59');
INSERT INTO `character_history` VALUES ('1034', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 00:47:49');
INSERT INTO `character_history` VALUES ('1035', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 00:49:43');
INSERT INTO `character_history` VALUES ('1036', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 00:50:09');
INSERT INTO `character_history` VALUES ('1037', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 01:14:29');
INSERT INTO `character_history` VALUES ('1038', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 01:16:34');
INSERT INTO `character_history` VALUES ('1039', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 12:44:09');
INSERT INTO `character_history` VALUES ('1040', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 12:44:29');
INSERT INTO `character_history` VALUES ('1041', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 12:44:38');
INSERT INTO `character_history` VALUES ('1042', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 12:46:41');
INSERT INTO `character_history` VALUES ('1043', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 12:55:29');
INSERT INTO `character_history` VALUES ('1044', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 13:15:54');
INSERT INTO `character_history` VALUES ('1045', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 18:19:39');
INSERT INTO `character_history` VALUES ('1046', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 18:27:05');
INSERT INTO `character_history` VALUES ('1047', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 18:39:44');
INSERT INTO `character_history` VALUES ('1048', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 18:57:23');
INSERT INTO `character_history` VALUES ('1049', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 19:07:16');
INSERT INTO `character_history` VALUES ('1050', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 19:08:16');
INSERT INTO `character_history` VALUES ('1051', '2', '1', '127.0.0.1', '1', '9', 'Fggre', '2013-06-12 19:08:37');
INSERT INTO `character_history` VALUES ('1052', '2', '1', '127.0.0.1', '2', '9', 'Fggre', '2013-06-12 19:09:16');
INSERT INTO `character_history` VALUES ('1053', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 19:09:25');
INSERT INTO `character_history` VALUES ('1054', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 19:29:52');
INSERT INTO `character_history` VALUES ('1055', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 19:39:40');
INSERT INTO `character_history` VALUES ('1056', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 19:42:24');
INSERT INTO `character_history` VALUES ('1057', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 19:45:32');
INSERT INTO `character_history` VALUES ('1058', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 19:52:51');
INSERT INTO `character_history` VALUES ('1059', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-12 19:54:56');
INSERT INTO `character_history` VALUES ('1060', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-12 20:18:25');
INSERT INTO `character_history` VALUES ('1061', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-13 00:45:39');
INSERT INTO `character_history` VALUES ('1062', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-13 00:50:01');
INSERT INTO `character_history` VALUES ('1063', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-13 00:50:14');
INSERT INTO `character_history` VALUES ('1064', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-13 01:07:21');
INSERT INTO `character_history` VALUES ('1065', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-13 12:06:52');
INSERT INTO `character_history` VALUES ('1066', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-13 13:00:26');
INSERT INTO `character_history` VALUES ('1067', '2', '1', '127.0.0.1', '1', '12', 'Ханти', '2013-06-13 14:03:05');
INSERT INTO `character_history` VALUES ('1068', '2', '1', '127.0.0.1', '2', '12', 'Ханти', '2013-06-13 14:11:16');
INSERT INTO `character_history` VALUES ('1069', '2', '1', '127.0.0.1', '1', '14', 'Errfe', '2013-06-13 14:11:38');
INSERT INTO `character_history` VALUES ('1070', '2', '1', '127.0.0.1', '2', '14', 'Errfe', '2013-06-13 14:12:39');
INSERT INTO `character_history` VALUES ('1071', '2', '1', '127.0.0.1', '3', '14', 'Errfe', '2013-06-13 14:27:35');
INSERT INTO `character_history` VALUES ('1072', '2', '1', '127.0.0.1', '4', '22', 'Хант', '2013-06-13 14:27:57');
INSERT INTO `character_history` VALUES ('1073', '2', '1', '127.0.0.1', '1', '22', 'Хант', '2013-06-13 14:28:08');
INSERT INTO `character_history` VALUES ('1074', '2', '1', '127.0.0.1', '2', '22', 'Хант', '2013-06-13 14:30:03');
INSERT INTO `character_history` VALUES ('1075', '3', '1', '127.0.0.1', '1', '19', 'Nodk', '2013-06-13 14:30:25');
INSERT INTO `character_history` VALUES ('1076', '3', '1', '127.0.0.1', '2', '19', 'Nodk', '2013-06-13 14:30:39');
INSERT INTO `character_history` VALUES ('1077', '3', '1', '127.0.0.1', '1', '5', 'Geg', '2013-06-13 14:30:57');
INSERT INTO `character_history` VALUES ('1078', '3', '1', '127.0.0.1', '2', '5', 'Geg', '2013-06-13 14:32:13');
INSERT INTO `character_history` VALUES ('1079', '2', '1', '127.0.0.1', '3', '22', 'Хант', '2013-06-13 14:33:18');
INSERT INTO `character_history` VALUES ('1080', '2', '1', '127.0.0.1', '3', '12', 'Ханти', '2013-06-13 14:33:28');
INSERT INTO `character_history` VALUES ('1081', '2', '1', '127.0.0.1', '3', '1', 'Бодра', '2013-06-13 14:33:37');
INSERT INTO `character_history` VALUES ('1082', '2', '1', '127.0.0.1', '3', '7', 'Сзв', '2013-06-13 14:33:42');
INSERT INTO `character_history` VALUES ('1083', '2', '1', '127.0.0.1', '3', '8', 'Fs', '2013-06-13 14:33:46');
INSERT INTO `character_history` VALUES ('1084', '2', '1', '127.0.0.1', '3', '9', 'Fggre', '2013-06-13 14:33:50');
INSERT INTO `character_history` VALUES ('1085', '2', '1', '127.0.0.1', '3', '10', 'Uhg', '2013-06-13 14:33:53');
INSERT INTO `character_history` VALUES ('1086', '2', '1', '127.0.0.1', '3', '13', 'Vfdv', '2013-06-13 14:33:57');
INSERT INTO `character_history` VALUES ('1087', '2', '1', '127.0.0.1', '4', '23', 'Ханти', '2013-06-13 14:34:13');
INSERT INTO `character_history` VALUES ('1088', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-06-13 14:34:18');
INSERT INTO `character_history` VALUES ('1089', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-06-13 14:40:10');
INSERT INTO `character_history` VALUES ('1090', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-06-13 14:53:44');
INSERT INTO `character_history` VALUES ('1091', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-06-13 14:56:51');
INSERT INTO `character_history` VALUES ('1092', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 00:42:49');
INSERT INTO `character_history` VALUES ('1093', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-15 01:16:38');
INSERT INTO `character_history` VALUES ('1094', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 01:17:12');
INSERT INTO `character_history` VALUES ('1095', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-15 02:28:19');
INSERT INTO `character_history` VALUES ('1096', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 12:57:41');
INSERT INTO `character_history` VALUES ('1097', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-15 13:04:37');
INSERT INTO `character_history` VALUES ('1098', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 13:07:09');
INSERT INTO `character_history` VALUES ('1099', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-15 13:08:29');
INSERT INTO `character_history` VALUES ('1100', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 13:21:24');
INSERT INTO `character_history` VALUES ('1101', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 13:31:30');
INSERT INTO `character_history` VALUES ('1102', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-15 13:39:30');
INSERT INTO `character_history` VALUES ('1103', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-15 13:42:54');
INSERT INTO `character_history` VALUES ('1104', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-16 19:15:10');
INSERT INTO `character_history` VALUES ('1105', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-16 19:21:42');
INSERT INTO `character_history` VALUES ('1106', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-16 19:41:18');
INSERT INTO `character_history` VALUES ('1107', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-16 19:42:03');
INSERT INTO `character_history` VALUES ('1108', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-16 19:42:09');
INSERT INTO `character_history` VALUES ('1109', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-16 19:48:00');
INSERT INTO `character_history` VALUES ('1110', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-16 19:50:14');
INSERT INTO `character_history` VALUES ('1111', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-16 19:53:58');
INSERT INTO `character_history` VALUES ('1112', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-17 11:31:40');
INSERT INTO `character_history` VALUES ('1113', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-17 11:51:37');
INSERT INTO `character_history` VALUES ('1114', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-17 11:51:46');
INSERT INTO `character_history` VALUES ('1115', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-17 12:02:31');
INSERT INTO `character_history` VALUES ('1116', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-17 12:02:38');
INSERT INTO `character_history` VALUES ('1117', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-17 12:51:25');
INSERT INTO `character_history` VALUES ('1118', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-18 14:59:58');
INSERT INTO `character_history` VALUES ('1119', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-18 15:02:54');
INSERT INTO `character_history` VALUES ('1120', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-18 15:22:19');
INSERT INTO `character_history` VALUES ('1121', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-18 15:24:02');
INSERT INTO `character_history` VALUES ('1122', '2', '1', '127.0.0.1', '4', '24', 'Ирекр', '2013-06-18 15:27:08');
INSERT INTO `character_history` VALUES ('1123', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-18 16:41:52');
INSERT INTO `character_history` VALUES ('1124', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-18 18:48:22');
INSERT INTO `character_history` VALUES ('1125', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-18 23:49:57');
INSERT INTO `character_history` VALUES ('1126', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-19 00:34:04');
INSERT INTO `character_history` VALUES ('1127', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-19 00:38:01');
INSERT INTO `character_history` VALUES ('1128', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-19 00:56:47');
INSERT INTO `character_history` VALUES ('1129', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-19 00:58:41');
INSERT INTO `character_history` VALUES ('1130', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-19 01:43:37');
INSERT INTO `character_history` VALUES ('1131', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-19 01:44:07');
INSERT INTO `character_history` VALUES ('1132', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-19 13:39:02');
INSERT INTO `character_history` VALUES ('1133', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-19 13:44:19');
INSERT INTO `character_history` VALUES ('1134', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-20 01:08:26');
INSERT INTO `character_history` VALUES ('1135', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-20 01:16:08');
INSERT INTO `character_history` VALUES ('1136', '2', '1', '127.0.0.1', '1', '24', 'Ирекр', '2013-06-20 01:16:23');
INSERT INTO `character_history` VALUES ('1137', '2', '1', '127.0.0.1', '2', '24', 'Ирекр', '2013-06-20 01:30:08');
INSERT INTO `character_history` VALUES ('1138', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-20 17:27:40');
INSERT INTO `character_history` VALUES ('1139', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-20 17:31:51');
INSERT INTO `character_history` VALUES ('1140', '2', '1', '127.0.0.1', '1', '24', 'Ирекр', '2013-06-20 17:32:02');
INSERT INTO `character_history` VALUES ('1141', '2', '1', '127.0.0.1', '2', '24', 'Ирекр', '2013-06-20 17:33:15');
INSERT INTO `character_history` VALUES ('1142', '2', '1', '127.0.0.1', '4', '25', 'Frf', '2013-06-20 21:41:23');
INSERT INTO `character_history` VALUES ('1143', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-20 21:41:48');
INSERT INTO `character_history` VALUES ('1144', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-20 21:45:02');
INSERT INTO `character_history` VALUES ('1145', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-20 22:45:36');
INSERT INTO `character_history` VALUES ('1146', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-20 22:46:10');
INSERT INTO `character_history` VALUES ('1147', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 01:01:54');
INSERT INTO `character_history` VALUES ('1148', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 01:03:18');
INSERT INTO `character_history` VALUES ('1149', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 01:05:28');
INSERT INTO `character_history` VALUES ('1150', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 01:06:23');
INSERT INTO `character_history` VALUES ('1151', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 13:28:35');
INSERT INTO `character_history` VALUES ('1152', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 13:32:55');
INSERT INTO `character_history` VALUES ('1153', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 13:41:44');
INSERT INTO `character_history` VALUES ('1154', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 13:48:56');
INSERT INTO `character_history` VALUES ('1155', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 22:55:05');
INSERT INTO `character_history` VALUES ('1156', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 22:57:32');
INSERT INTO `character_history` VALUES ('1157', '2', '1', '127.0.0.1', '1', '25', 'Frf', '2013-06-21 23:09:44');
INSERT INTO `character_history` VALUES ('1158', '2', '1', '127.0.0.1', '2', '25', 'Frf', '2013-06-21 23:10:58');
INSERT INTO `character_history` VALUES ('1159', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-22 17:24:06');
INSERT INTO `character_history` VALUES ('1160', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-22 17:25:31');
INSERT INTO `character_history` VALUES ('1161', '2', '1', '127.0.0.1', '1', '21', 'Гпрнг', '2013-06-22 23:18:18');
INSERT INTO `character_history` VALUES ('1162', '2', '1', '127.0.0.1', '2', '21', 'Гпрнг', '2013-06-22 23:18:25');
INSERT INTO `character_history` VALUES ('1163', '2', '1', '127.0.0.1', '4', '26', 'Zookashka', '2013-06-22 23:49:13');
INSERT INTO `character_history` VALUES ('1164', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-22 23:49:35');
INSERT INTO `character_history` VALUES ('1165', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-22 23:53:28');
INSERT INTO `character_history` VALUES ('1166', '2', '1', '127.0.0.1', '4', '27', 'Zerrko', '2013-06-22 23:53:51');
INSERT INTO `character_history` VALUES ('1167', '2', '1', '127.0.0.1', '1', '27', 'Zerrko', '2013-06-22 23:54:17');
INSERT INTO `character_history` VALUES ('1168', '2', '1', '127.0.0.1', '2', '27', 'Zerrko', '2013-06-22 23:54:49');
INSERT INTO `character_history` VALUES ('1169', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-22 23:55:02');
INSERT INTO `character_history` VALUES ('1170', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-23 00:11:17');
INSERT INTO `character_history` VALUES ('1171', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 13:30:55');
INSERT INTO `character_history` VALUES ('1172', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 13:49:00');
INSERT INTO `character_history` VALUES ('1173', '2', '1', '127.0.0.1', '4', '28', 'Testbagmap', '2013-06-24 13:49:16');
INSERT INTO `character_history` VALUES ('1174', '2', '1', '127.0.0.1', '1', '28', 'Testbagmap', '2013-06-24 13:49:22');
INSERT INTO `character_history` VALUES ('1175', '2', '1', '127.0.0.1', '2', '28', 'Testbagmap', '2013-06-24 13:50:15');
INSERT INTO `character_history` VALUES ('1176', '2', '1', '127.0.0.1', '1', '28', 'Testbagmap', '2013-06-24 13:50:26');
INSERT INTO `character_history` VALUES ('1177', '2', '1', '127.0.0.1', '2', '28', 'Testbagmap', '2013-06-24 13:57:14');
INSERT INTO `character_history` VALUES ('1178', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 13:57:32');
INSERT INTO `character_history` VALUES ('1179', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 14:02:33');
INSERT INTO `character_history` VALUES ('1180', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 14:03:25');
INSERT INTO `character_history` VALUES ('1181', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 14:03:54');
INSERT INTO `character_history` VALUES ('1182', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 14:09:29');
INSERT INTO `character_history` VALUES ('1183', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 14:10:54');
INSERT INTO `character_history` VALUES ('1184', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 14:24:40');
INSERT INTO `character_history` VALUES ('1185', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 14:26:11');
INSERT INTO `character_history` VALUES ('1186', '2', '1', '127.0.0.1', '1', '24', 'Ирекр', '2013-06-24 14:26:25');
INSERT INTO `character_history` VALUES ('1187', '2', '1', '127.0.0.1', '2', '24', 'Ирекр', '2013-06-24 14:28:37');
INSERT INTO `character_history` VALUES ('1188', '2', '1', '127.0.0.1', '1', '24', 'Ирекр', '2013-06-24 14:40:51');
INSERT INTO `character_history` VALUES ('1189', '2', '1', '127.0.0.1', '2', '24', 'Ирекр', '2013-06-24 14:41:11');
INSERT INTO `character_history` VALUES ('1190', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 18:56:32');
INSERT INTO `character_history` VALUES ('1191', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 19:20:27');
INSERT INTO `character_history` VALUES ('1192', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 19:20:38');
INSERT INTO `character_history` VALUES ('1193', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 19:22:51');
INSERT INTO `character_history` VALUES ('1194', '2', '1', '127.0.0.1', '1', '26', 'Zookashka', '2013-06-24 19:24:24');
INSERT INTO `character_history` VALUES ('1195', '2', '1', '127.0.0.1', '2', '26', 'Zookashka', '2013-06-24 19:25:48');
INSERT INTO `character_history` VALUES ('1196', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-24 19:26:24');
INSERT INTO `character_history` VALUES ('1197', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-24 20:13:52');
INSERT INTO `character_history` VALUES ('1198', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-24 20:23:45');
INSERT INTO `character_history` VALUES ('1199', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-24 20:42:12');
INSERT INTO `character_history` VALUES ('1200', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-24 21:05:21');
INSERT INTO `character_history` VALUES ('1201', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-24 23:21:02');
INSERT INTO `character_history` VALUES ('1202', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-24 23:36:45');
INSERT INTO `character_history` VALUES ('1203', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 13:33:05');
INSERT INTO `character_history` VALUES ('1204', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 13:51:02');
INSERT INTO `character_history` VALUES ('1205', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 13:58:31');
INSERT INTO `character_history` VALUES ('1206', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:04:41');
INSERT INTO `character_history` VALUES ('1207', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:06:10');
INSERT INTO `character_history` VALUES ('1208', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:12:04');
INSERT INTO `character_history` VALUES ('1209', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:15:01');
INSERT INTO `character_history` VALUES ('1210', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:16:13');
INSERT INTO `character_history` VALUES ('1211', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:18:19');
INSERT INTO `character_history` VALUES ('1212', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:18:53');
INSERT INTO `character_history` VALUES ('1213', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:19:51');
INSERT INTO `character_history` VALUES ('1214', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:21:46');
INSERT INTO `character_history` VALUES ('1215', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:25:44');
INSERT INTO `character_history` VALUES ('1216', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 14:27:17');
INSERT INTO `character_history` VALUES ('1217', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 14:27:31');
INSERT INTO `character_history` VALUES ('1218', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 15:20:04');
INSERT INTO `character_history` VALUES ('1219', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 15:50:31');
INSERT INTO `character_history` VALUES ('1220', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 15:52:31');
INSERT INTO `character_history` VALUES ('1221', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 17:36:16');
INSERT INTO `character_history` VALUES ('1222', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 17:36:27');
INSERT INTO `character_history` VALUES ('1223', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 17:37:12');
INSERT INTO `character_history` VALUES ('1224', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 17:37:30');
INSERT INTO `character_history` VALUES ('1225', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 17:38:43');
INSERT INTO `character_history` VALUES ('1226', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 17:39:18');
INSERT INTO `character_history` VALUES ('1227', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 17:39:27');
INSERT INTO `character_history` VALUES ('1228', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 17:41:14');
INSERT INTO `character_history` VALUES ('1229', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 18:49:10');
INSERT INTO `character_history` VALUES ('1230', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 19:18:05');
INSERT INTO `character_history` VALUES ('1231', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-25 23:33:53');
INSERT INTO `character_history` VALUES ('1232', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-25 23:34:45');
INSERT INTO `character_history` VALUES ('1233', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 00:25:48');
INSERT INTO `character_history` VALUES ('1234', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 00:32:36');
INSERT INTO `character_history` VALUES ('1235', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 01:20:50');
INSERT INTO `character_history` VALUES ('1236', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 01:23:32');
INSERT INTO `character_history` VALUES ('1237', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 01:38:44');
INSERT INTO `character_history` VALUES ('1238', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 01:39:58');
INSERT INTO `character_history` VALUES ('1239', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 12:46:03');
INSERT INTO `character_history` VALUES ('1240', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 12:50:48');
INSERT INTO `character_history` VALUES ('1241', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 12:59:30');
INSERT INTO `character_history` VALUES ('1242', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 13:13:50');
INSERT INTO `character_history` VALUES ('1243', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 13:35:12');
INSERT INTO `character_history` VALUES ('1244', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 13:35:27');
INSERT INTO `character_history` VALUES ('1245', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 14:58:05');
INSERT INTO `character_history` VALUES ('1246', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 15:39:25');
INSERT INTO `character_history` VALUES ('1247', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 20:21:48');
INSERT INTO `character_history` VALUES ('1248', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 20:44:57');
INSERT INTO `character_history` VALUES ('1249', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 22:35:58');
INSERT INTO `character_history` VALUES ('1250', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 22:36:58');
INSERT INTO `character_history` VALUES ('1251', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 22:37:49');
INSERT INTO `character_history` VALUES ('1252', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 22:41:02');
INSERT INTO `character_history` VALUES ('1253', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 22:42:32');
INSERT INTO `character_history` VALUES ('1254', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-26 23:37:06');
INSERT INTO `character_history` VALUES ('1255', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-26 23:40:32');
INSERT INTO `character_history` VALUES ('1256', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 00:02:08');
INSERT INTO `character_history` VALUES ('1257', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 00:02:15');
INSERT INTO `character_history` VALUES ('1258', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 00:02:49');
INSERT INTO `character_history` VALUES ('1259', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 01:27:12');
INSERT INTO `character_history` VALUES ('1260', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 01:30:36');
INSERT INTO `character_history` VALUES ('1261', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 01:34:31');
INSERT INTO `character_history` VALUES ('1262', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 01:36:31');
INSERT INTO `character_history` VALUES ('1263', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 01:37:24');
INSERT INTO `character_history` VALUES ('1264', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 01:42:34');
INSERT INTO `character_history` VALUES ('1265', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 01:50:40');
INSERT INTO `character_history` VALUES ('1266', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 01:55:06');
INSERT INTO `character_history` VALUES ('1267', '2', '1', '127.0.0.1', '4', '29', 'Синячка', '2013-06-27 01:56:27');
INSERT INTO `character_history` VALUES ('1268', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-06-27 01:56:35');
INSERT INTO `character_history` VALUES ('1269', '2', '1', '127.0.0.1', '2', '29', 'Синячка', '2013-06-27 02:06:04');
INSERT INTO `character_history` VALUES ('1270', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-27 12:23:23');
INSERT INTO `character_history` VALUES ('1271', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-27 12:35:48');
INSERT INTO `character_history` VALUES ('1272', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-28 01:17:15');
INSERT INTO `character_history` VALUES ('1273', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-28 01:22:16');
INSERT INTO `character_history` VALUES ('1274', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-28 01:29:34');
INSERT INTO `character_history` VALUES ('1275', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-28 01:35:20');
INSERT INTO `character_history` VALUES ('1276', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-28 16:37:51');
INSERT INTO `character_history` VALUES ('1277', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-28 17:02:27');
INSERT INTO `character_history` VALUES ('1278', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-28 21:24:43');
INSERT INTO `character_history` VALUES ('1279', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-28 21:25:20');
INSERT INTO `character_history` VALUES ('1280', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-06-28 21:25:44');
INSERT INTO `character_history` VALUES ('1281', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-06-28 21:32:21');
INSERT INTO `character_history` VALUES ('1282', '2', '1', '127.0.0.1', '2', '29', 'Синячка', '2013-06-28 21:47:47');
INSERT INTO `character_history` VALUES ('1283', '2', '1', '127.0.0.1', '3', '27', 'Zerrko', '2013-06-29 11:27:40');
INSERT INTO `character_history` VALUES ('1284', '2', '1', '127.0.0.1', '3', '25', 'Frf', '2013-06-29 11:27:48');
INSERT INTO `character_history` VALUES ('1285', '2', '1', '127.0.0.1', '3', '24', 'Ирекр', '2013-06-29 11:27:59');
INSERT INTO `character_history` VALUES ('1286', '2', '1', '127.0.0.1', '3', '28', 'Testbagmap', '2013-06-29 11:28:08');
INSERT INTO `character_history` VALUES ('1287', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-06-29 11:28:54');
INSERT INTO `character_history` VALUES ('1288', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-06-29 11:29:39');
INSERT INTO `character_history` VALUES ('1289', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 18:11:44');
INSERT INTO `character_history` VALUES ('1290', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 18:12:27');
INSERT INTO `character_history` VALUES ('1291', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 20:29:59');
INSERT INTO `character_history` VALUES ('1292', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 20:39:39');
INSERT INTO `character_history` VALUES ('1293', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 20:46:30');
INSERT INTO `character_history` VALUES ('1294', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 20:46:58');
INSERT INTO `character_history` VALUES ('1295', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 20:57:33');
INSERT INTO `character_history` VALUES ('1296', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 20:57:53');
INSERT INTO `character_history` VALUES ('1297', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:00:21');
INSERT INTO `character_history` VALUES ('1298', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 21:02:29');
INSERT INTO `character_history` VALUES ('1299', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:04:22');
INSERT INTO `character_history` VALUES ('1300', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 21:05:07');
INSERT INTO `character_history` VALUES ('1301', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:06:46');
INSERT INTO `character_history` VALUES ('1302', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 21:07:06');
INSERT INTO `character_history` VALUES ('1303', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:21:23');
INSERT INTO `character_history` VALUES ('1304', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:46:11');
INSERT INTO `character_history` VALUES ('1305', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 21:46:28');
INSERT INTO `character_history` VALUES ('1306', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:51:57');
INSERT INTO `character_history` VALUES ('1307', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 21:52:18');
INSERT INTO `character_history` VALUES ('1308', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 21:53:43');
INSERT INTO `character_history` VALUES ('1309', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:04:41');
INSERT INTO `character_history` VALUES ('1310', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 22:05:14');
INSERT INTO `character_history` VALUES ('1311', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:07:07');
INSERT INTO `character_history` VALUES ('1312', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:10:07');
INSERT INTO `character_history` VALUES ('1313', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 22:10:36');
INSERT INTO `character_history` VALUES ('1314', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:13:25');
INSERT INTO `character_history` VALUES ('1315', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 22:13:39');
INSERT INTO `character_history` VALUES ('1316', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:17:21');
INSERT INTO `character_history` VALUES ('1317', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 22:17:30');
INSERT INTO `character_history` VALUES ('1318', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:21:00');
INSERT INTO `character_history` VALUES ('1319', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 22:41:48');
INSERT INTO `character_history` VALUES ('1320', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 22:43:06');
INSERT INTO `character_history` VALUES ('1321', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-29 23:16:06');
INSERT INTO `character_history` VALUES ('1322', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-29 23:22:00');
INSERT INTO `character_history` VALUES ('1323', '2', '1', '127.0.0.1', '4', '30', 'Нубафли', '2013-06-29 23:24:54');
INSERT INTO `character_history` VALUES ('1324', '2', '1', '127.0.0.1', '1', '30', 'Нубафли', '2013-06-29 23:25:08');
INSERT INTO `character_history` VALUES ('1325', '2', '1', '127.0.0.1', '2', '30', 'Нубафли', '2013-06-30 00:09:35');
INSERT INTO `character_history` VALUES ('1326', '2', '1', '127.0.0.1', '1', '30', 'Нубафли', '2013-06-30 00:14:56');
INSERT INTO `character_history` VALUES ('1327', '2', '1', '127.0.0.1', '2', '30', 'Нубафли', '2013-06-30 00:22:29');
INSERT INTO `character_history` VALUES ('1328', '2', '1', '127.0.0.1', '1', '30', 'Нубафли', '2013-06-30 00:24:45');
INSERT INTO `character_history` VALUES ('1329', '2', '1', '127.0.0.1', '2', '30', 'Нубафли', '2013-06-30 01:04:40');
INSERT INTO `character_history` VALUES ('1330', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-06-30 11:39:17');
INSERT INTO `character_history` VALUES ('1331', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-06-30 11:39:31');
INSERT INTO `character_history` VALUES ('1332', '2', '1', '127.0.0.1', '4', '31', 'Palka', '2013-06-30 11:39:47');
INSERT INTO `character_history` VALUES ('1333', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-06-30 11:39:55');
INSERT INTO `character_history` VALUES ('1334', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-06-30 11:40:43');
INSERT INTO `character_history` VALUES ('1335', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-06-30 16:21:46');
INSERT INTO `character_history` VALUES ('1336', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-06-30 16:22:29');
INSERT INTO `character_history` VALUES ('1337', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-06-30 16:23:24');
INSERT INTO `character_history` VALUES ('1338', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-06-30 16:25:48');
INSERT INTO `character_history` VALUES ('1339', '2', '1', '127.0.0.1', '1', '30', 'Нубафли', '2013-06-30 16:26:13');
INSERT INTO `character_history` VALUES ('1340', '2', '1', '127.0.0.1', '2', '30', 'Нубафли', '2013-06-30 16:48:41');
INSERT INTO `character_history` VALUES ('1341', '2', '1', '127.0.0.1', '4', '32', 'Анкинс', '2013-06-30 16:51:59');
INSERT INTO `character_history` VALUES ('1342', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-06-30 16:52:12');
INSERT INTO `character_history` VALUES ('1343', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-06-30 16:53:14');
INSERT INTO `character_history` VALUES ('1344', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-06-30 17:20:57');
INSERT INTO `character_history` VALUES ('1345', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-06-30 17:34:28');
INSERT INTO `character_history` VALUES ('1346', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-06-30 19:09:19');
INSERT INTO `character_history` VALUES ('1347', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-06-30 19:11:48');
INSERT INTO `character_history` VALUES ('1348', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 11:25:27');
INSERT INTO `character_history` VALUES ('1349', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 11:38:38');
INSERT INTO `character_history` VALUES ('1350', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 11:39:32');
INSERT INTO `character_history` VALUES ('1351', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 11:45:17');
INSERT INTO `character_history` VALUES ('1352', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 12:21:12');
INSERT INTO `character_history` VALUES ('1353', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 13:11:00');
INSERT INTO `character_history` VALUES ('1354', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 13:16:27');
INSERT INTO `character_history` VALUES ('1355', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 13:16:40');
INSERT INTO `character_history` VALUES ('1356', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 18:16:48');
INSERT INTO `character_history` VALUES ('1357', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 19:08:14');
INSERT INTO `character_history` VALUES ('1358', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 19:29:32');
INSERT INTO `character_history` VALUES ('1359', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 19:32:51');
INSERT INTO `character_history` VALUES ('1360', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-01 20:51:56');
INSERT INTO `character_history` VALUES ('1361', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-01 20:54:22');
INSERT INTO `character_history` VALUES ('1362', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 02:20:09');
INSERT INTO `character_history` VALUES ('1363', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 02:21:15');
INSERT INTO `character_history` VALUES ('1364', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 02:22:05');
INSERT INTO `character_history` VALUES ('1365', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 03:02:21');
INSERT INTO `character_history` VALUES ('1366', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 03:54:40');
INSERT INTO `character_history` VALUES ('1367', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 03:56:55');
INSERT INTO `character_history` VALUES ('1368', '2', '1', '127.0.0.1', '4', '33', 'Beta', '2013-07-02 03:57:09');
INSERT INTO `character_history` VALUES ('1369', '2', '1', '127.0.0.1', '1', '33', 'Beta', '2013-07-02 03:57:24');
INSERT INTO `character_history` VALUES ('1370', '2', '1', '127.0.0.1', '2', '33', 'Beta', '2013-07-02 04:02:29');
INSERT INTO `character_history` VALUES ('1371', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 13:46:06');
INSERT INTO `character_history` VALUES ('1372', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 13:52:43');
INSERT INTO `character_history` VALUES ('1373', '2', '1', '127.0.0.1', '1', '33', 'Beta', '2013-07-02 13:54:51');
INSERT INTO `character_history` VALUES ('1374', '2', '1', '127.0.0.1', '2', '33', 'Beta', '2013-07-02 13:55:31');
INSERT INTO `character_history` VALUES ('1375', '2', '1', '127.0.0.1', '3', '33', 'Beta', '2013-07-02 13:55:44');
INSERT INTO `character_history` VALUES ('1376', '2', '1', '127.0.0.1', '4', '34', 'Яшеф', '2013-07-02 13:55:56');
INSERT INTO `character_history` VALUES ('1377', '2', '1', '127.0.0.1', '1', '34', 'Яшеф', '2013-07-02 13:56:09');
INSERT INTO `character_history` VALUES ('1378', '2', '1', '127.0.0.1', '2', '34', 'Яшеф', '2013-07-02 13:59:05');
INSERT INTO `character_history` VALUES ('1379', '2', '1', '127.0.0.1', '4', '35', 'Grg', '2013-07-02 15:52:24');
INSERT INTO `character_history` VALUES ('1380', '2', '1', '127.0.0.1', '1', '35', 'Grg', '2013-07-02 15:52:44');
INSERT INTO `character_history` VALUES ('1381', '2', '1', '127.0.0.1', '2', '35', 'Grg', '2013-07-02 16:01:14');
INSERT INTO `character_history` VALUES ('1382', '2', '1', '127.0.0.1', '3', '35', 'Grg', '2013-07-02 16:12:15');
INSERT INTO `character_history` VALUES ('1383', '2', '1', '127.0.0.1', '3', '34', 'Яшеф', '2013-07-02 16:12:23');
INSERT INTO `character_history` VALUES ('1384', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 16:13:31');
INSERT INTO `character_history` VALUES ('1385', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 16:16:14');
INSERT INTO `character_history` VALUES ('1386', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 18:26:40');
INSERT INTO `character_history` VALUES ('1387', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 18:29:46');
INSERT INTO `character_history` VALUES ('1388', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 20:47:41');
INSERT INTO `character_history` VALUES ('1389', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 21:03:28');
INSERT INTO `character_history` VALUES ('1390', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-02 21:27:19');
INSERT INTO `character_history` VALUES ('1391', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-02 21:37:05');
INSERT INTO `character_history` VALUES ('1392', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-02 23:46:21');
INSERT INTO `character_history` VALUES ('1393', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-03 01:18:06');
INSERT INTO `character_history` VALUES ('1394', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-07-03 01:20:00');
INSERT INTO `character_history` VALUES ('1395', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-03 01:20:07');
INSERT INTO `character_history` VALUES ('1396', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 01:56:00');
INSERT INTO `character_history` VALUES ('1397', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 01:56:57');
INSERT INTO `character_history` VALUES ('1398', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 02:13:40');
INSERT INTO `character_history` VALUES ('1399', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 02:16:30');
INSERT INTO `character_history` VALUES ('1400', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 02:16:40');
INSERT INTO `character_history` VALUES ('1401', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 02:17:58');
INSERT INTO `character_history` VALUES ('1402', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 11:29:09');
INSERT INTO `character_history` VALUES ('1403', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 11:29:44');
INSERT INTO `character_history` VALUES ('1404', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 11:42:22');
INSERT INTO `character_history` VALUES ('1405', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 11:45:21');
INSERT INTO `character_history` VALUES ('1406', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 13:21:21');
INSERT INTO `character_history` VALUES ('1407', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 13:22:59');
INSERT INTO `character_history` VALUES ('1408', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 13:23:07');
INSERT INTO `character_history` VALUES ('1409', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 13:23:27');
INSERT INTO `character_history` VALUES ('1410', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 17:39:24');
INSERT INTO `character_history` VALUES ('1411', '2', '1', '127.0.0.1', '4', '33', 'Rerr', '2013-07-03 18:54:21');
INSERT INTO `character_history` VALUES ('1412', '2', '1', '127.0.0.1', '1', '33', 'Rerr', '2013-07-03 18:54:34');
INSERT INTO `character_history` VALUES ('1413', '2', '1', '127.0.0.1', '2', '33', 'Rerr', '2013-07-03 18:56:58');
INSERT INTO `character_history` VALUES ('1414', '2', '1', '127.0.0.1', '3', '33', 'Rerr', '2013-07-03 21:05:17');
INSERT INTO `character_history` VALUES ('1415', '2', '1', '127.0.0.1', '4', '34', 'Вцйа', '2013-07-03 21:05:23');
INSERT INTO `character_history` VALUES ('1416', '2', '1', '127.0.0.1', '1', '34', 'Вцйа', '2013-07-03 21:05:38');
INSERT INTO `character_history` VALUES ('1417', '2', '1', '127.0.0.1', '2', '34', 'Вцйа', '2013-07-03 21:09:27');
INSERT INTO `character_history` VALUES ('1418', '2', '1', '127.0.0.1', '1', '34', 'Вцйа', '2013-07-03 21:10:26');
INSERT INTO `character_history` VALUES ('1419', '2', '1', '127.0.0.1', '2', '34', 'Вцйа', '2013-07-03 21:10:32');
INSERT INTO `character_history` VALUES ('1420', '2', '1', '127.0.0.1', '3', '34', 'Вцйа', '2013-07-03 23:10:58');
INSERT INTO `character_history` VALUES ('1421', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-03 23:11:18');
INSERT INTO `character_history` VALUES ('1422', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-03 23:14:47');
INSERT INTO `character_history` VALUES ('1423', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-04 00:05:17');
INSERT INTO `character_history` VALUES ('1424', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-04 00:34:38');
INSERT INTO `character_history` VALUES ('1425', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-05 00:01:07');
INSERT INTO `character_history` VALUES ('1426', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-05 00:02:39');
INSERT INTO `character_history` VALUES ('1427', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-05 00:03:36');
INSERT INTO `character_history` VALUES ('1428', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-05 00:05:58');
INSERT INTO `character_history` VALUES ('1429', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-05 00:14:11');
INSERT INTO `character_history` VALUES ('1430', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-05 00:18:21');
INSERT INTO `character_history` VALUES ('1431', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-05 00:24:52');
INSERT INTO `character_history` VALUES ('1432', '3', '1', '127.0.0.1', '1', '19', 'Nodk', '2013-07-05 00:26:45');
INSERT INTO `character_history` VALUES ('1433', '3', '1', '127.0.0.1', '2', '19', 'Nodk', '2013-07-05 00:28:34');
INSERT INTO `character_history` VALUES ('1434', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-07-05 00:28:36');
INSERT INTO `character_history` VALUES ('1435', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-07-05 00:57:00');
INSERT INTO `character_history` VALUES ('1436', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-07-05 00:58:23');
INSERT INTO `character_history` VALUES ('1437', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-07-05 00:59:53');
INSERT INTO `character_history` VALUES ('1438', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-07-05 01:00:24');
INSERT INTO `character_history` VALUES ('1439', '2', '1', '127.0.0.1', '1', '31', 'Palka', '2013-07-05 01:05:11');
INSERT INTO `character_history` VALUES ('1440', '2', '1', '127.0.0.1', '2', '31', 'Palka', '2013-07-05 01:05:34');
INSERT INTO `character_history` VALUES ('1441', '2', '1', '127.0.0.1', '4', '33', 'Ff', '2013-07-05 01:05:41');
INSERT INTO `character_history` VALUES ('1442', '2', '1', '127.0.0.1', '1', '33', 'Ff', '2013-07-05 01:05:55');
INSERT INTO `character_history` VALUES ('1443', '2', '1', '127.0.0.1', '2', '33', 'Ff', '2013-07-05 01:07:22');
INSERT INTO `character_history` VALUES ('1444', '2', '1', '127.0.0.1', '3', '33', 'Ff', '2013-07-05 09:16:55');
INSERT INTO `character_history` VALUES ('1445', '2', '1', '127.0.0.1', '4', '34', 'Рр', '2013-07-05 09:17:01');
INSERT INTO `character_history` VALUES ('1446', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 09:17:21');
INSERT INTO `character_history` VALUES ('1447', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 09:18:41');
INSERT INTO `character_history` VALUES ('1448', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 09:21:13');
INSERT INTO `character_history` VALUES ('1449', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 09:21:45');
INSERT INTO `character_history` VALUES ('1450', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 14:20:35');
INSERT INTO `character_history` VALUES ('1451', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 14:21:04');
INSERT INTO `character_history` VALUES ('1452', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 14:23:36');
INSERT INTO `character_history` VALUES ('1453', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 14:25:25');
INSERT INTO `character_history` VALUES ('1454', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 19:19:30');
INSERT INTO `character_history` VALUES ('1455', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 19:40:21');
INSERT INTO `character_history` VALUES ('1456', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-05 20:33:30');
INSERT INTO `character_history` VALUES ('1457', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-05 20:33:59');
INSERT INTO `character_history` VALUES ('1458', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 00:01:09');
INSERT INTO `character_history` VALUES ('1459', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 00:31:13');
INSERT INTO `character_history` VALUES ('1460', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 14:26:14');
INSERT INTO `character_history` VALUES ('1461', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 14:28:05');
INSERT INTO `character_history` VALUES ('1462', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-06 14:29:49');
INSERT INTO `character_history` VALUES ('1463', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-06 14:30:32');
INSERT INTO `character_history` VALUES ('1464', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-06 14:32:10');
INSERT INTO `character_history` VALUES ('1465', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-06 14:32:43');
INSERT INTO `character_history` VALUES ('1466', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-07-06 18:19:33');
INSERT INTO `character_history` VALUES ('1467', '2', '1', '127.0.0.1', '2', '29', 'Синячка', '2013-07-06 18:22:46');
INSERT INTO `character_history` VALUES ('1468', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:25:51');
INSERT INTO `character_history` VALUES ('1469', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:26:32');
INSERT INTO `character_history` VALUES ('1470', '2', '1', '127.0.0.1', '4', '35', 'Dcf', '2013-07-06 18:28:31');
INSERT INTO `character_history` VALUES ('1471', '2', '1', '127.0.0.1', '1', '35', 'Dcf', '2013-07-06 18:28:52');
INSERT INTO `character_history` VALUES ('1472', '2', '1', '127.0.0.1', '2', '35', 'Dcf', '2013-07-06 18:29:35');
INSERT INTO `character_history` VALUES ('1473', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:29:56');
INSERT INTO `character_history` VALUES ('1474', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:31:06');
INSERT INTO `character_history` VALUES ('1475', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:31:19');
INSERT INTO `character_history` VALUES ('1476', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:31:31');
INSERT INTO `character_history` VALUES ('1477', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:31:42');
INSERT INTO `character_history` VALUES ('1478', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:32:46');
INSERT INTO `character_history` VALUES ('1479', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:33:35');
INSERT INTO `character_history` VALUES ('1480', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:33:45');
INSERT INTO `character_history` VALUES ('1481', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-07-06 18:33:59');
INSERT INTO `character_history` VALUES ('1482', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-07-06 18:35:32');
INSERT INTO `character_history` VALUES ('1483', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 18:37:17');
INSERT INTO `character_history` VALUES ('1484', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 18:37:27');
INSERT INTO `character_history` VALUES ('1485', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-07-06 18:37:39');
INSERT INTO `character_history` VALUES ('1486', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-07-06 18:41:38');
INSERT INTO `character_history` VALUES ('1487', '2', '1', '127.0.0.1', '1', '23', 'Ханти', '2013-07-06 21:48:17');
INSERT INTO `character_history` VALUES ('1488', '2', '1', '127.0.0.1', '2', '23', 'Ханти', '2013-07-06 21:48:58');
INSERT INTO `character_history` VALUES ('1489', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 22:01:24');
INSERT INTO `character_history` VALUES ('1490', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 22:17:20');
INSERT INTO `character_history` VALUES ('1491', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 23:18:48');
INSERT INTO `character_history` VALUES ('1492', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 23:20:12');
INSERT INTO `character_history` VALUES ('1493', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-06 23:49:43');
INSERT INTO `character_history` VALUES ('1494', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-06 23:50:36');
INSERT INTO `character_history` VALUES ('1495', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-07 11:00:22');
INSERT INTO `character_history` VALUES ('1496', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-07 11:40:42');
INSERT INTO `character_history` VALUES ('1497', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-07 11:59:58');
INSERT INTO `character_history` VALUES ('1498', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-07 12:00:44');
INSERT INTO `character_history` VALUES ('1499', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-07 12:00:53');
INSERT INTO `character_history` VALUES ('1500', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-07 12:02:29');
INSERT INTO `character_history` VALUES ('1501', '2', '1', '127.0.0.1', '1', '34', 'Рр', '2013-07-09 01:13:44');
INSERT INTO `character_history` VALUES ('1502', '2', '1', '127.0.0.1', '2', '34', 'Рр', '2013-07-09 01:14:17');
INSERT INTO `character_history` VALUES ('1503', '2', '1', '127.0.0.1', '3', '35', 'Dcf', '2013-07-09 14:45:19');
INSERT INTO `character_history` VALUES ('1504', '2', '1', '127.0.0.1', '4', '36', 'Уццук', '2013-07-09 14:45:33');
INSERT INTO `character_history` VALUES ('1505', '2', '1', '127.0.0.1', '1', '36', 'Уццук', '2013-07-09 18:03:49');
INSERT INTO `character_history` VALUES ('1506', '2', '1', '127.0.0.1', '2', '36', 'Уццук', '2013-07-09 18:05:59');
INSERT INTO `character_history` VALUES ('1507', '2', '1', '127.0.0.1', '1', '36', 'Уццук', '2013-07-09 18:47:19');
INSERT INTO `character_history` VALUES ('1508', '2', '1', '127.0.0.1', '2', '36', 'Уццук', '2013-07-09 18:49:16');
INSERT INTO `character_history` VALUES ('1509', '2', '1', '127.0.0.1', '1', '36', 'Уццук', '2013-07-10 00:03:59');
INSERT INTO `character_history` VALUES ('1510', '2', '1', '127.0.0.1', '2', '36', 'Уццук', '2013-07-10 00:04:53');
INSERT INTO `character_history` VALUES ('1511', '2', '1', '127.0.0.1', '3', '36', 'Уццук', '2013-07-10 00:05:08');
INSERT INTO `character_history` VALUES ('1512', '2', '1', '127.0.0.1', '4', '37', 'Укц', '2013-07-10 00:05:24');
INSERT INTO `character_history` VALUES ('1513', '2', '1', '127.0.0.1', '1', '37', 'Укц', '2013-07-10 00:05:30');
INSERT INTO `character_history` VALUES ('1514', '2', '1', '127.0.0.1', '2', '37', 'Укц', '2013-07-10 00:07:49');
INSERT INTO `character_history` VALUES ('1515', '2', '1', '127.0.0.1', '1', '37', 'Укц', '2013-07-10 00:46:20');
INSERT INTO `character_history` VALUES ('1516', '2', '1', '127.0.0.1', '2', '37', 'Укц', '2013-07-10 00:46:50');
INSERT INTO `character_history` VALUES ('1517', '2', '1', '127.0.0.1', '1', '37', 'Укц', '2013-07-10 00:48:29');
INSERT INTO `character_history` VALUES ('1518', '2', '1', '127.0.0.1', '2', '37', 'Укц', '2013-07-10 00:48:58');
INSERT INTO `character_history` VALUES ('1519', '2', '1', '127.0.0.1', '1', '37', 'Укц', '2013-07-10 00:51:33');
INSERT INTO `character_history` VALUES ('1520', '2', '1', '127.0.0.1', '2', '37', 'Укц', '2013-07-10 00:51:57');
INSERT INTO `character_history` VALUES ('1521', '2', '1', '127.0.0.1', '3', '37', 'Укц', '2013-07-10 00:53:02');
INSERT INTO `character_history` VALUES ('1522', '2', '1', '127.0.0.1', '4', '38', 'Цап', '2013-07-10 00:53:09');
INSERT INTO `character_history` VALUES ('1523', '2', '1', '127.0.0.1', '1', '38', 'Цап', '2013-07-10 00:55:16');
INSERT INTO `character_history` VALUES ('1524', '2', '1', '127.0.0.1', '2', '38', 'Цап', '2013-07-10 00:59:29');
INSERT INTO `character_history` VALUES ('1525', '2', '1', '127.0.0.1', '1', '38', 'Цап', '2013-07-10 01:02:58');
INSERT INTO `character_history` VALUES ('1526', '2', '1', '127.0.0.1', '2', '38', 'Цап', '2013-07-10 01:06:00');
INSERT INTO `character_history` VALUES ('1527', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-10 01:06:26');
INSERT INTO `character_history` VALUES ('1528', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-10 01:12:57');
INSERT INTO `character_history` VALUES ('1529', '2', '1', '127.0.0.1', '2', '32', 'Анкинс', '2013-07-10 01:14:40');
INSERT INTO `character_history` VALUES ('1530', '2', '1', '127.0.0.1', '1', '32', 'Анкинс', '2013-07-10 01:21:32');
INSERT INTO `character_history` VALUES ('1531', '2', '1', '127.0.0.1', '1', '38', 'Цап', '2013-07-11 01:38:42');
INSERT INTO `character_history` VALUES ('1532', '2', '1', '127.0.0.1', '2', '38', 'Цап', '2013-07-11 01:39:16');
INSERT INTO `character_history` VALUES ('1533', '2', '1', '127.0.0.1', '1', '38', 'Цап', '2013-07-11 01:42:50');
INSERT INTO `character_history` VALUES ('1534', '2', '1', '127.0.0.1', '2', '38', 'Цап', '2013-07-11 01:44:06');
INSERT INTO `character_history` VALUES ('1535', '2', '1', '127.0.0.1', '3', '38', 'Цап', '2013-07-11 02:06:20');
INSERT INTO `character_history` VALUES ('1536', '2', '1', '127.0.0.1', '3', '34', 'Рр', '2013-07-11 02:06:37');
INSERT INTO `character_history` VALUES ('1537', '2', '1', '127.0.0.1', '4', '39', 'Beta', '2013-07-11 02:06:57');
INSERT INTO `character_history` VALUES ('1538', '2', '1', '127.0.0.1', '1', '39', 'Beta', '2013-07-11 02:07:08');
INSERT INTO `character_history` VALUES ('1539', '2', '1', '127.0.0.1', '2', '39', 'Beta', '2013-07-11 02:18:59');
INSERT INTO `character_history` VALUES ('1540', '2', '1', '127.0.0.1', '1', '39', 'Beta', '2013-07-12 14:04:15');
INSERT INTO `character_history` VALUES ('1541', '2', '1', '127.0.0.1', '2', '39', 'Beta', '2013-07-12 14:06:18');
INSERT INTO `character_history` VALUES ('1542', '2', '1', '127.0.0.1', '1', '39', 'Beta', '2013-07-12 14:10:21');
INSERT INTO `character_history` VALUES ('1543', '2', '1', '127.0.0.1', '2', '39', 'Beta', '2013-07-12 14:11:18');
INSERT INTO `character_history` VALUES ('1544', '2', '1', '127.0.0.1', '1', '39', 'Beta', '2013-07-12 14:28:26');
INSERT INTO `character_history` VALUES ('1545', '2', '1', '127.0.0.1', '2', '39', 'Beta', '2013-07-12 14:29:10');
INSERT INTO `character_history` VALUES ('1546', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-13 18:44:02');
INSERT INTO `character_history` VALUES ('1547', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-13 18:47:34');
INSERT INTO `character_history` VALUES ('1548', '2', '1', '127.0.0.1', '4', '40', 'Trgg', '2013-07-13 18:51:36');
INSERT INTO `character_history` VALUES ('1549', '2', '1', '127.0.0.1', '1', '40', 'Trgg', '2013-07-13 18:51:48');
INSERT INTO `character_history` VALUES ('1550', '2', '1', '127.0.0.1', '2', '40', 'Trgg', '2013-07-13 18:55:37');
INSERT INTO `character_history` VALUES ('1551', '2', '1', '127.0.0.1', '1', '40', 'Trgg', '2013-07-13 19:00:46');
INSERT INTO `character_history` VALUES ('1552', '2', '1', '127.0.0.1', '2', '40', 'Trgg', '2013-07-13 19:13:35');
INSERT INTO `character_history` VALUES ('1553', '2', '1', '127.0.0.1', '1', '40', 'Trgg', '2013-07-13 22:40:19');
INSERT INTO `character_history` VALUES ('1554', '2', '1', '127.0.0.1', '2', '40', 'Trgg', '2013-07-13 22:43:01');
INSERT INTO `character_history` VALUES ('1555', '2', '1', '127.0.0.1', '1', '40', 'Trgg', '2013-07-13 22:47:30');
INSERT INTO `character_history` VALUES ('1556', '2', '1', '127.0.0.1', '2', '40', 'Trgg', '2013-07-13 23:12:10');
INSERT INTO `character_history` VALUES ('1557', '2', '1', '127.0.0.1', '3', '40', 'Trgg', '2013-07-13 23:46:20');
INSERT INTO `character_history` VALUES ('1558', '2', '1', '127.0.0.1', '3', '39', 'Beta', '2013-07-13 23:46:27');
INSERT INTO `character_history` VALUES ('1559', '2', '1', '127.0.0.1', '3', '32', 'Анкинс', '2013-07-13 23:46:33');
INSERT INTO `character_history` VALUES ('1560', '2', '1', '127.0.0.1', '3', '31', 'Palka', '2013-07-13 23:46:37');
INSERT INTO `character_history` VALUES ('1561', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-13 23:47:06');
INSERT INTO `character_history` VALUES ('1562', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-13 23:47:30');
INSERT INTO `character_history` VALUES ('1563', '2', '1', '127.0.0.1', '1', '18', 'Дккашка', '2013-07-13 23:48:57');
INSERT INTO `character_history` VALUES ('1564', '2', '1', '127.0.0.1', '2', '18', 'Дккашка', '2013-07-13 23:49:46');
INSERT INTO `character_history` VALUES ('1565', '2', '1', '127.0.0.1', '4', '41', 'Dwwd', '2013-07-13 23:50:34');
INSERT INTO `character_history` VALUES ('1566', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-13 23:50:55');
INSERT INTO `character_history` VALUES ('1567', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 00:01:01');
INSERT INTO `character_history` VALUES ('1568', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-14 00:25:05');
INSERT INTO `character_history` VALUES ('1569', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 00:29:20');
INSERT INTO `character_history` VALUES ('1570', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-14 12:07:02');
INSERT INTO `character_history` VALUES ('1571', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 12:28:25');
INSERT INTO `character_history` VALUES ('1572', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-14 13:11:40');
INSERT INTO `character_history` VALUES ('1573', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 13:19:13');
INSERT INTO `character_history` VALUES ('1574', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-14 13:19:21');
INSERT INTO `character_history` VALUES ('1575', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 13:22:49');
INSERT INTO `character_history` VALUES ('1576', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-07-14 13:29:22');
INSERT INTO `character_history` VALUES ('1577', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-07-14 13:31:13');
INSERT INTO `character_history` VALUES ('1578', '2', '1', '127.0.0.1', '4', '42', 'Gf', '2013-07-14 16:25:25');
INSERT INTO `character_history` VALUES ('1579', '2', '1', '127.0.0.1', '4', '43', 'Tftftt', '2013-07-14 16:25:36');
INSERT INTO `character_history` VALUES ('1580', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-14 16:46:05');
INSERT INTO `character_history` VALUES ('1581', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-14 16:46:44');
INSERT INTO `character_history` VALUES ('1582', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-14 17:01:41');
INSERT INTO `character_history` VALUES ('1583', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-14 17:07:17');
INSERT INTO `character_history` VALUES ('1584', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-14 17:35:54');
INSERT INTO `character_history` VALUES ('1585', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-14 17:37:05');
INSERT INTO `character_history` VALUES ('1586', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-15 17:37:24');
INSERT INTO `character_history` VALUES ('1587', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-15 17:43:29');
INSERT INTO `character_history` VALUES ('1588', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-15 23:35:24');
INSERT INTO `character_history` VALUES ('1589', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-15 23:36:33');
INSERT INTO `character_history` VALUES ('1590', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-16 23:06:06');
INSERT INTO `character_history` VALUES ('1591', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-16 23:09:19');
INSERT INTO `character_history` VALUES ('1592', '2', '1', '127.0.0.1', '1', '43', 'Tftftt', '2013-07-16 23:11:02');
INSERT INTO `character_history` VALUES ('1593', '2', '1', '127.0.0.1', '2', '43', 'Tftftt', '2013-07-16 23:11:45');
INSERT INTO `character_history` VALUES ('1594', '2', '1', '127.0.0.1', '4', '44', 'Yggy', '2013-07-20 16:26:47');
INSERT INTO `character_history` VALUES ('1595', '2', '1', '127.0.0.1', '1', '44', 'Yggy', '2013-07-20 16:27:22');
INSERT INTO `character_history` VALUES ('1596', '2', '1', '127.0.0.1', '2', '44', 'Yggy', '2013-07-20 16:28:33');
INSERT INTO `character_history` VALUES ('1597', '2', '1', '127.0.0.1', '3', '44', 'Yggy', '2013-07-20 16:42:42');
INSERT INTO `character_history` VALUES ('1598', '2', '1', '127.0.0.1', '3', '43', 'Tftftt', '2013-07-20 16:42:52');
INSERT INTO `character_history` VALUES ('1599', '2', '1', '127.0.0.1', '3', '42', 'Gf', '2013-07-20 16:43:04');
INSERT INTO `character_history` VALUES ('1600', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-07-20 16:43:56');
INSERT INTO `character_history` VALUES ('1601', '2', '1', '127.0.0.1', '2', '29', 'Синячка', '2013-07-20 16:48:50');
INSERT INTO `character_history` VALUES ('1602', '2', '1', '127.0.0.1', '1', '29', 'Синячка', '2013-07-20 16:56:00');
INSERT INTO `character_history` VALUES ('1603', '2', '1', '127.0.0.1', '2', '29', 'Синячка', '2013-07-20 17:00:04');
INSERT INTO `character_history` VALUES ('1604', '2', '1', '127.0.0.1', '4', '42', 'Hger', '2013-07-20 18:05:45');
INSERT INTO `character_history` VALUES ('1605', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-20 18:06:28');
INSERT INTO `character_history` VALUES ('1606', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-20 18:10:42');
INSERT INTO `character_history` VALUES ('1607', '2', '1', '127.0.0.1', '4', '43', 'Regrdg', '2013-07-20 18:20:51');
INSERT INTO `character_history` VALUES ('1608', '2', '1', '127.0.0.1', '1', '43', 'Regrdg', '2013-07-20 18:21:12');
INSERT INTO `character_history` VALUES ('1609', '2', '1', '127.0.0.1', '2', '43', 'Regrdg', '2013-07-20 18:24:09');
INSERT INTO `character_history` VALUES ('1610', '2', '1', '127.0.0.1', '1', '43', 'Regrdg', '2013-07-20 18:27:30');
INSERT INTO `character_history` VALUES ('1611', '2', '1', '127.0.0.1', '2', '43', 'Regrdg', '2013-07-20 18:38:45');
INSERT INTO `character_history` VALUES ('1612', '2', '1', '127.0.0.1', '4', '44', 'Neirodk', '2013-07-20 19:38:16');
INSERT INTO `character_history` VALUES ('1613', '2', '1', '127.0.0.1', '1', '44', 'Neirodk', '2013-07-20 19:38:41');
INSERT INTO `character_history` VALUES ('1614', '2', '1', '127.0.0.1', '2', '44', 'Neirodk', '2013-07-20 19:40:45');
INSERT INTO `character_history` VALUES ('1615', '2', '1', '127.0.0.1', '1', '44', 'Neirodk', '2013-07-20 19:42:09');
INSERT INTO `character_history` VALUES ('1616', '2', '1', '127.0.0.1', '2', '44', 'Neirodk', '2013-07-20 19:48:37');
INSERT INTO `character_history` VALUES ('1617', '2', '1', '127.0.0.1', '3', '21', 'Гпрнг', '2013-07-21 00:10:06');
INSERT INTO `character_history` VALUES ('1618', '2', '1', '127.0.0.1', '4', '45', 'Цувцау', '2013-07-21 00:10:19');
INSERT INTO `character_history` VALUES ('1619', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-07-21 00:10:46');
INSERT INTO `character_history` VALUES ('1620', '2', '1', '127.0.0.1', '2', '45', 'Цувцау', '2013-07-21 00:17:57');
INSERT INTO `character_history` VALUES ('1621', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-07-21 14:16:14');
INSERT INTO `character_history` VALUES ('1622', '2', '1', '127.0.0.1', '2', '45', 'Цувцау', '2013-07-21 14:16:52');
INSERT INTO `character_history` VALUES ('1623', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-07-21 14:27:47');
INSERT INTO `character_history` VALUES ('1624', '2', '1', '127.0.0.1', '2', '45', 'Цувцау', '2013-07-21 14:29:43');
INSERT INTO `character_history` VALUES ('1625', '2', '1', '127.0.0.1', '3', '23', 'Ханти', '2013-07-21 21:43:53');
INSERT INTO `character_history` VALUES ('1626', '2', '1', '127.0.0.1', '4', '46', 'Вв', '2013-07-21 21:44:25');
INSERT INTO `character_history` VALUES ('1627', '2', '1', '127.0.0.1', '3', '46', 'Вв', '2013-07-21 21:44:36');
INSERT INTO `character_history` VALUES ('1628', '2', '1', '127.0.0.1', '4', '46', 'Jghh', '2013-07-21 23:39:20');
INSERT INTO `character_history` VALUES ('1629', '2', '1', '127.0.0.1', '1', '46', 'Jghh', '2013-07-21 23:39:54');
INSERT INTO `character_history` VALUES ('1630', '2', '1', '127.0.0.1', '2', '46', 'Jghh', '2013-07-21 23:43:31');
INSERT INTO `character_history` VALUES ('1631', '2', '1', '127.0.0.1', '1', '46', 'Jghh', '2013-07-22 00:24:38');
INSERT INTO `character_history` VALUES ('1632', '2', '1', '127.0.0.1', '2', '46', 'Jghh', '2013-07-22 00:26:12');
INSERT INTO `character_history` VALUES ('1633', '2', '1', '127.0.0.1', '3', '46', 'Jghh', '2013-07-22 00:41:42');
INSERT INTO `character_history` VALUES ('1634', '2', '1', '127.0.0.1', '4', '47', 'Еаае', '2013-07-22 00:41:51');
INSERT INTO `character_history` VALUES ('1635', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-22 00:42:12');
INSERT INTO `character_history` VALUES ('1636', '2', '1', '127.0.0.1', '2', '47', 'Еаае', '2013-07-22 00:43:19');
INSERT INTO `character_history` VALUES ('1637', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-22 01:32:50');
INSERT INTO `character_history` VALUES ('1638', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-23 22:39:47');
INSERT INTO `character_history` VALUES ('1639', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-07-23 22:42:59');
INSERT INTO `character_history` VALUES ('1640', '2', '1', '127.0.0.1', '2', '45', 'Цувцау', '2013-07-23 22:43:33');
INSERT INTO `character_history` VALUES ('1641', '4', '1', '127.0.0.1', '4', '48', 'Rfg', '2013-07-23 22:44:24');
INSERT INTO `character_history` VALUES ('1642', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-23 22:44:32');
INSERT INTO `character_history` VALUES ('1643', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-23 22:55:07');
INSERT INTO `character_history` VALUES ('1644', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-24 00:22:01');
INSERT INTO `character_history` VALUES ('1645', '2', '1', '127.0.0.1', '2', '47', 'Еаае', '2013-07-24 00:22:04');
INSERT INTO `character_history` VALUES ('1646', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-24 00:22:53');
INSERT INTO `character_history` VALUES ('1647', '2', '1', '127.0.0.1', '2', '47', 'Еаае', '2013-07-24 00:23:53');
INSERT INTO `character_history` VALUES ('1648', '2', '1', '127.0.0.1', '3', '43', 'Regrdg', '2013-07-24 00:24:11');
INSERT INTO `character_history` VALUES ('1649', '2', '1', '127.0.0.1', '4', '49', 'Кака', '2013-07-24 00:24:20');
INSERT INTO `character_history` VALUES ('1650', '2', '1', '127.0.0.1', '1', '49', 'Кака', '2013-07-24 00:43:39');
INSERT INTO `character_history` VALUES ('1651', '2', '1', '127.0.0.1', '2', '49', 'Кака', '2013-07-24 00:45:18');
INSERT INTO `character_history` VALUES ('1652', '2', '1', '127.0.0.1', '3', '49', 'Кака', '2013-07-24 19:41:45');
INSERT INTO `character_history` VALUES ('1653', '2', '1', '127.0.0.1', '4', '49', 'Ermigood', '2013-07-24 20:14:25');
INSERT INTO `character_history` VALUES ('1654', '2', '1', '127.0.0.1', '1', '49', 'Ermigood', '2013-07-24 20:14:44');
INSERT INTO `character_history` VALUES ('1655', '2', '1', '127.0.0.1', '1', '49', 'Ermigood', '2013-07-24 20:30:26');
INSERT INTO `character_history` VALUES ('1656', '2', '1', '127.0.0.1', '2', '49', 'Ermigood', '2013-07-24 20:37:22');
INSERT INTO `character_history` VALUES ('1657', '2', '1', '127.0.0.1', '1', '49', 'Ermigood', '2013-07-24 20:41:33');
INSERT INTO `character_history` VALUES ('1658', '2', '1', '127.0.0.1', '2', '49', 'Ermigood', '2013-07-24 20:41:57');
INSERT INTO `character_history` VALUES ('1659', '2', '1', '127.0.0.1', '3', '49', 'Ermigood', '2013-07-24 20:47:34');
INSERT INTO `character_history` VALUES ('1660', '2', '1', '127.0.0.1', '4', '50', 'Всс', '2013-07-24 20:47:42');
INSERT INTO `character_history` VALUES ('1661', '2', '1', '127.0.0.1', '1', '50', 'Всс', '2013-07-24 20:47:46');
INSERT INTO `character_history` VALUES ('1662', '2', '1', '127.0.0.1', '3', '50', 'Всс', '2013-07-24 20:57:46');
INSERT INTO `character_history` VALUES ('1663', '2', '1', '127.0.0.1', '4', '51', 'Иуеф', '2013-07-24 20:57:56');
INSERT INTO `character_history` VALUES ('1664', '2', '1', '127.0.0.1', '1', '51', 'Иуеф', '2013-07-24 20:58:00');
INSERT INTO `character_history` VALUES ('1665', '2', '1', '127.0.0.1', '1', '51', 'Иуеф', '2013-07-24 21:03:23');
INSERT INTO `character_history` VALUES ('1666', '2', '1', '127.0.0.1', '2', '51', 'Иуеф', '2013-07-24 21:08:40');
INSERT INTO `character_history` VALUES ('1667', '3', '1', '127.0.0.1', '4', '52', 'Testts', '2013-07-24 23:28:31');
INSERT INTO `character_history` VALUES ('1668', '3', '1', '127.0.0.1', '1', '52', 'Testts', '2013-07-24 23:28:43');
INSERT INTO `character_history` VALUES ('1669', '3', '1', '127.0.0.1', '2', '52', 'Testts', '2013-07-24 23:31:22');
INSERT INTO `character_history` VALUES ('1670', '3', '1', '127.0.0.1', '4', '53', 'Rtehtr', '2013-07-24 23:52:08');
INSERT INTO `character_history` VALUES ('1671', '3', '1', '127.0.0.1', '1', '53', 'Rtehtr', '2013-07-24 23:52:13');
INSERT INTO `character_history` VALUES ('1672', '3', '1', '127.0.0.1', '2', '53', 'Rtehtr', '2013-07-25 00:48:36');
INSERT INTO `character_history` VALUES ('1673', '3', '1', '127.0.0.1', '4', '54', 'Tesyt', '2013-07-25 01:15:45');
INSERT INTO `character_history` VALUES ('1674', '3', '1', '127.0.0.1', '1', '54', 'Tesyt', '2013-07-25 01:16:04');
INSERT INTO `character_history` VALUES ('1675', '3', '1', '127.0.0.1', '2', '54', 'Tesyt', '2013-07-25 01:17:32');
INSERT INTO `character_history` VALUES ('1676', '3', '1', '127.0.0.1', '1', '53', 'Rtehtr', '2013-07-25 01:35:21');
INSERT INTO `character_history` VALUES ('1677', '3', '1', '127.0.0.1', '2', '53', 'Rtehtr', '2013-07-25 01:37:17');
INSERT INTO `character_history` VALUES ('1678', '3', '1', '127.0.0.1', '1', '53', 'Rtehtr', '2013-07-25 01:37:22');
INSERT INTO `character_history` VALUES ('1679', '3', '1', '127.0.0.1', '2', '53', 'Rtehtr', '2013-07-25 01:38:48');
INSERT INTO `character_history` VALUES ('1680', '3', '1', '127.0.0.1', '1', '53', 'Rtehtr', '2013-07-25 23:30:53');
INSERT INTO `character_history` VALUES ('1681', '3', '1', '127.0.0.1', '2', '53', 'Rtehtr', '2013-07-26 00:03:03');
INSERT INTO `character_history` VALUES ('1682', '2', '1', '127.0.0.1', '3', '51', 'Иуеф', '2013-07-27 18:00:56');
INSERT INTO `character_history` VALUES ('1683', '2', '1', '127.0.0.1', '4', '55', 'Palkas', '2013-07-27 18:01:21');
INSERT INTO `character_history` VALUES ('1684', '2', '1', '127.0.0.1', '1', '55', 'Palkas', '2013-07-27 18:01:32');
INSERT INTO `character_history` VALUES ('1685', '3', '1', '127.0.0.1', '4', '56', 'Refe', '2013-07-27 18:05:27');
INSERT INTO `character_history` VALUES ('1686', '3', '1', '127.0.0.1', '1', '56', 'Refe', '2013-07-27 18:05:35');
INSERT INTO `character_history` VALUES ('1687', '2', '1', '127.0.0.1', '2', '55', 'Palkas', '2013-07-27 18:09:48');
INSERT INTO `character_history` VALUES ('1688', '3', '1', '127.0.0.1', '2', '56', 'Refe', '2013-07-27 18:10:16');
INSERT INTO `character_history` VALUES ('1689', '3', '1', '127.0.0.1', '4', '57', 'Feew', '2013-07-27 18:32:04');
INSERT INTO `character_history` VALUES ('1690', '3', '1', '127.0.0.1', '1', '57', 'Feew', '2013-07-27 18:32:15');
INSERT INTO `character_history` VALUES ('1691', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 18:38:39');
INSERT INTO `character_history` VALUES ('1692', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 18:45:42');
INSERT INTO `character_history` VALUES ('1693', '3', '1', '127.0.0.1', '2', '57', 'Feew', '2013-07-27 18:45:47');
INSERT INTO `character_history` VALUES ('1694', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 18:47:44');
INSERT INTO `character_history` VALUES ('1695', '3', '1', '127.0.0.1', '1', '57', 'Feew', '2013-07-27 18:47:48');
INSERT INTO `character_history` VALUES ('1696', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-27 18:57:28');
INSERT INTO `character_history` VALUES ('1697', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:04:21');
INSERT INTO `character_history` VALUES ('1698', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-27 19:04:28');
INSERT INTO `character_history` VALUES ('1699', '4', '1', '127.0.0.1', '4', '58', 'Rrd', '2013-07-27 19:05:36');
INSERT INTO `character_history` VALUES ('1700', '4', '1', '127.0.0.1', '1', '58', 'Rrd', '2013-07-27 19:05:44');
INSERT INTO `character_history` VALUES ('1701', '3', '1', '127.0.0.1', '2', '57', 'Feew', '2013-07-27 19:07:37');
INSERT INTO `character_history` VALUES ('1702', '10', '1', '127.0.0.1', '4', '59', 'Tftt', '2013-07-27 19:08:15');
INSERT INTO `character_history` VALUES ('1703', '10', '1', '127.0.0.1', '1', '59', 'Tftt', '2013-07-27 19:08:27');
INSERT INTO `character_history` VALUES ('1704', '4', '1', '127.0.0.1', '2', '58', 'Rrd', '2013-07-27 19:08:57');
INSERT INTO `character_history` VALUES ('1705', '10', '1', '127.0.0.1', '2', '59', 'Tftt', '2013-07-27 19:08:59');
INSERT INTO `character_history` VALUES ('1706', '10', '1', '127.0.0.1', '1', '59', 'Tftt', '2013-07-27 19:11:56');
INSERT INTO `character_history` VALUES ('1707', '3', '1', '127.0.0.1', '1', '57', 'Feew', '2013-07-27 19:13:37');
INSERT INTO `character_history` VALUES ('1708', '10', '1', '127.0.0.1', '2', '59', 'Tftt', '2013-07-27 19:14:57');
INSERT INTO `character_history` VALUES ('1709', '10', '1', '127.0.0.1', '1', '59', 'Tftt', '2013-07-27 19:15:59');
INSERT INTO `character_history` VALUES ('1710', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-27 19:20:41');
INSERT INTO `character_history` VALUES ('1711', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-27 19:21:48');
INSERT INTO `character_history` VALUES ('1712', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 19:23:25');
INSERT INTO `character_history` VALUES ('1713', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:26:31');
INSERT INTO `character_history` VALUES ('1714', '3', '1', '127.0.0.1', '2', '57', 'Feew', '2013-07-27 19:26:34');
INSERT INTO `character_history` VALUES ('1715', '10', '1', '127.0.0.1', '2', '59', 'Tftt', '2013-07-27 19:26:37');
INSERT INTO `character_history` VALUES ('1716', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 19:32:31');
INSERT INTO `character_history` VALUES ('1717', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:32:46');
INSERT INTO `character_history` VALUES ('1718', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 19:35:09');
INSERT INTO `character_history` VALUES ('1719', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:35:52');
INSERT INTO `character_history` VALUES ('1720', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 19:37:03');
INSERT INTO `character_history` VALUES ('1721', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-27 19:42:51');
INSERT INTO `character_history` VALUES ('1722', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-27 19:43:32');
INSERT INTO `character_history` VALUES ('1723', '10', '1', '127.0.0.1', '1', '59', 'Tftt', '2013-07-27 19:43:47');
INSERT INTO `character_history` VALUES ('1724', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:44:12');
INSERT INTO `character_history` VALUES ('1725', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 19:44:27');
INSERT INTO `character_history` VALUES ('1726', '3', '1', '127.0.0.1', '1', '56', 'Refe', '2013-07-27 19:44:45');
INSERT INTO `character_history` VALUES ('1727', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 19:50:18');
INSERT INTO `character_history` VALUES ('1728', '10', '1', '127.0.0.1', '2', '59', 'Tftt', '2013-07-27 19:50:23');
INSERT INTO `character_history` VALUES ('1729', '3', '1', '127.0.0.1', '2', '56', 'Refe', '2013-07-27 19:50:25');
INSERT INTO `character_history` VALUES ('1730', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 21:57:17');
INSERT INTO `character_history` VALUES ('1731', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 21:59:15');
INSERT INTO `character_history` VALUES ('1732', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 22:13:44');
INSERT INTO `character_history` VALUES ('1733', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 22:36:08');
INSERT INTO `character_history` VALUES ('1734', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 22:43:01');
INSERT INTO `character_history` VALUES ('1735', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-27 23:18:58');
INSERT INTO `character_history` VALUES ('1736', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-27 23:22:18');
INSERT INTO `character_history` VALUES ('1737', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-28 00:05:27');
INSERT INTO `character_history` VALUES ('1738', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-29 00:45:00');
INSERT INTO `character_history` VALUES ('1739', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-31 00:20:53');
INSERT INTO `character_history` VALUES ('1740', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-31 00:23:32');
INSERT INTO `character_history` VALUES ('1741', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-31 00:24:06');
INSERT INTO `character_history` VALUES ('1742', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-31 00:29:42');
INSERT INTO `character_history` VALUES ('1743', '4', '1', '127.0.0.1', '1', '48', 'Rfg', '2013-07-31 00:30:22');
INSERT INTO `character_history` VALUES ('1744', '4', '1', '127.0.0.1', '2', '48', 'Rfg', '2013-07-31 00:32:03');
INSERT INTO `character_history` VALUES ('1745', '4', '1', '127.0.0.1', '4', '60', 'Ggr', '2013-07-31 00:52:13');
INSERT INTO `character_history` VALUES ('1746', '4', '1', '127.0.0.1', '1', '60', 'Ggr', '2013-07-31 00:52:26');
INSERT INTO `character_history` VALUES ('1747', '4', '1', '127.0.0.1', '2', '60', 'Ggr', '2013-07-31 00:56:55');
INSERT INTO `character_history` VALUES ('1748', '4', '1', '127.0.0.1', '4', '61', 'Ffrref', '2013-07-31 00:58:24');
INSERT INTO `character_history` VALUES ('1749', '4', '1', '127.0.0.1', '1', '61', 'Ffrref', '2013-07-31 00:58:32');
INSERT INTO `character_history` VALUES ('1750', '4', '1', '127.0.0.1', '2', '61', 'Ffrref', '2013-07-31 01:03:27');
INSERT INTO `character_history` VALUES ('1751', '4', '1', '127.0.0.1', '1', '61', 'Ffrref', '2013-07-31 14:23:29');
INSERT INTO `character_history` VALUES ('1752', '4', '1', '127.0.0.1', '2', '61', 'Ffrref', '2013-07-31 14:24:50');
INSERT INTO `character_history` VALUES ('1753', '4', '1', '127.0.0.1', '1', '61', 'Ffrref', '2013-07-31 14:33:31');
INSERT INTO `character_history` VALUES ('1754', '4', '1', '127.0.0.1', '2', '61', 'Ffrref', '2013-07-31 14:34:29');
INSERT INTO `character_history` VALUES ('1755', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-07-31 22:47:29');
INSERT INTO `character_history` VALUES ('1756', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-07-31 22:48:15');
INSERT INTO `character_history` VALUES ('1757', '2', '1', '127.0.0.1', '1', '47', 'Еаае', '2013-07-31 22:55:56');
INSERT INTO `character_history` VALUES ('1758', '2', '1', '127.0.0.1', '2', '47', 'Еаае', '2013-07-31 22:57:54');
INSERT INTO `character_history` VALUES ('1759', '3', '1', '127.0.0.1', '1', '57', 'Feew', '2013-07-31 23:05:06');
INSERT INTO `character_history` VALUES ('1760', '3', '1', '127.0.0.1', '2', '57', 'Feew', '2013-07-31 23:06:16');
INSERT INTO `character_history` VALUES ('1761', '2', '1', '127.0.0.1', '1', '55', 'Palkas', '2013-07-31 23:24:34');
INSERT INTO `character_history` VALUES ('1762', '2', '1', '127.0.0.1', '2', '55', 'Palkas', '2013-07-31 23:25:20');
INSERT INTO `character_history` VALUES ('1763', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-07-31 23:25:45');
INSERT INTO `character_history` VALUES ('1764', '2', '1', '127.0.0.1', '2', '45', 'Цувцау', '2013-07-31 23:30:49');
INSERT INTO `character_history` VALUES ('1765', '3', '1', '127.0.0.1', '1', '57', 'Feew', '2013-08-01 14:22:37');
INSERT INTO `character_history` VALUES ('1766', '3', '1', '127.0.0.1', '2', '57', 'Feew', '2013-08-01 14:23:21');
INSERT INTO `character_history` VALUES ('1767', '2', '1', '127.0.0.1', '1', '44', 'Neirodk', '2013-08-01 14:25:15');
INSERT INTO `character_history` VALUES ('1768', '2', '1', '127.0.0.1', '2', '44', 'Neirodk', '2013-08-01 14:26:09');
INSERT INTO `character_history` VALUES ('1769', '2', '1', '127.0.0.1', '1', '41', 'Dwwd', '2013-08-01 14:30:19');
INSERT INTO `character_history` VALUES ('1770', '2', '1', '127.0.0.1', '2', '41', 'Dwwd', '2013-08-01 14:31:06');
INSERT INTO `character_history` VALUES ('1771', '2', '1', '127.0.0.1', '1', '30', 'Нубафли', '2013-08-01 19:20:24');
INSERT INTO `character_history` VALUES ('1772', '2', '1', '127.0.0.1', '2', '30', 'Нубафли', '2013-08-01 19:20:49');
INSERT INTO `character_history` VALUES ('1773', '3', '1', '127.0.0.1', '1', '56', 'Refe', '2013-08-01 19:26:34');
INSERT INTO `character_history` VALUES ('1774', '3', '1', '127.0.0.1', '2', '56', 'Refe', '2013-08-01 19:27:18');
INSERT INTO `character_history` VALUES ('1775', '3', '1', '127.0.0.1', '1', '54', 'Tesyt', '2013-08-01 19:32:30');
INSERT INTO `character_history` VALUES ('1776', '3', '1', '127.0.0.1', '2', '54', 'Tesyt', '2013-08-01 19:33:10');
INSERT INTO `character_history` VALUES ('1777', '3', '1', '127.0.0.1', '1', '53', 'Rtehtr', '2013-08-01 19:45:59');
INSERT INTO `character_history` VALUES ('1778', '3', '1', '127.0.0.1', '2', '53', 'Rtehtr', '2013-08-01 19:47:11');
INSERT INTO `character_history` VALUES ('1779', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-01 20:10:42');
INSERT INTO `character_history` VALUES ('1780', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-01 20:12:07');
INSERT INTO `character_history` VALUES ('1781', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-01 20:13:55');
INSERT INTO `character_history` VALUES ('1782', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-01 20:16:09');
INSERT INTO `character_history` VALUES ('1783', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-01 20:22:29');
INSERT INTO `character_history` VALUES ('1784', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-01 20:23:03');
INSERT INTO `character_history` VALUES ('1785', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-01 20:40:09');
INSERT INTO `character_history` VALUES ('1786', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-01 20:40:40');
INSERT INTO `character_history` VALUES ('1787', '3', '1', '127.0.0.1', '4', '62', 'Nedovar', '2013-08-01 20:55:11');
INSERT INTO `character_history` VALUES ('1788', '3', '1', '127.0.0.1', '1', '62', 'Nedovar', '2013-08-01 20:55:30');
INSERT INTO `character_history` VALUES ('1789', '3', '1', '127.0.0.1', '2', '62', 'Nedovar', '2013-08-01 20:58:31');
INSERT INTO `character_history` VALUES ('1790', '3', '1', '127.0.0.1', '1', '62', 'Nedovar', '2013-08-01 21:09:23');
INSERT INTO `character_history` VALUES ('1791', '3', '1', '127.0.0.1', '2', '62', 'Nedovar', '2013-08-01 21:23:49');
INSERT INTO `character_history` VALUES ('1792', '2', '1', '127.0.0.1', '1', '44', 'Neirodk', '2013-08-01 23:26:40');
INSERT INTO `character_history` VALUES ('1793', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-01 23:34:43');
INSERT INTO `character_history` VALUES ('1794', '2', '1', '127.0.0.1', '1', '45', 'Цувцау', '2013-08-01 23:46:37');
INSERT INTO `character_history` VALUES ('1795', '2', '1', '127.0.0.1', '3', '55', 'Palkas', '2013-08-02 00:02:07');
INSERT INTO `character_history` VALUES ('1796', '2', '1', '127.0.0.1', '4', '63', 'Впмав', '2013-08-02 00:02:18');
INSERT INTO `character_history` VALUES ('1797', '2', '1', '127.0.0.1', '1', '63', 'Впмав', '2013-08-02 00:02:36');
INSERT INTO `character_history` VALUES ('1798', '2', '1', '127.0.0.1', '2', '63', 'Впмав', '2013-08-02 00:04:39');
INSERT INTO `character_history` VALUES ('1799', '2', '1', '127.0.0.1', '1', '63', 'Впмав', '2013-08-02 00:09:12');
INSERT INTO `character_history` VALUES ('1800', '2', '1', '127.0.0.1', '3', '63', 'Впмав', '2013-08-02 00:22:28');
INSERT INTO `character_history` VALUES ('1801', '2', '1', '127.0.0.1', '4', '64', 'Нрн', '2013-08-02 00:22:40');
INSERT INTO `character_history` VALUES ('1802', '2', '1', '127.0.0.1', '1', '64', 'Нрн', '2013-08-02 00:22:49');
INSERT INTO `character_history` VALUES ('1803', '2', '1', '127.0.0.1', '2', '64', 'Нрн', '2013-08-02 00:25:38');
INSERT INTO `character_history` VALUES ('1804', '2', '1', '127.0.0.1', '1', '64', 'Нрн', '2013-08-02 00:29:57');
INSERT INTO `character_history` VALUES ('1805', '2', '1', '127.0.0.1', '2', '64', 'Нрн', '2013-08-02 00:31:23');
INSERT INTO `character_history` VALUES ('1806', '2', '1', '127.0.0.1', '1', '64', 'Нрн', '2013-08-02 00:33:50');
INSERT INTO `character_history` VALUES ('1807', '2', '1', '127.0.0.1', '2', '64', 'Нрн', '2013-08-02 00:35:49');
INSERT INTO `character_history` VALUES ('1808', '2', '1', '127.0.0.1', '3', '64', 'Нрн', '2013-08-02 14:29:11');
INSERT INTO `character_history` VALUES ('1809', '2', '1', '127.0.0.1', '4', '65', 'Еек', '2013-08-02 14:29:19');
INSERT INTO `character_history` VALUES ('1810', '2', '1', '127.0.0.1', '1', '65', 'Еек', '2013-08-02 14:29:50');
INSERT INTO `character_history` VALUES ('1811', '2', '1', '127.0.0.1', '2', '65', 'Еек', '2013-08-02 14:34:04');
INSERT INTO `character_history` VALUES ('1812', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-02 22:02:25');
INSERT INTO `character_history` VALUES ('1813', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-02 22:09:38');
INSERT INTO `character_history` VALUES ('1814', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-02 22:12:07');
INSERT INTO `character_history` VALUES ('1815', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-02 22:13:24');
INSERT INTO `character_history` VALUES ('1816', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-02 22:19:55');
INSERT INTO `character_history` VALUES ('1817', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-02 22:34:53');
INSERT INTO `character_history` VALUES ('1818', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-03 00:19:14');
INSERT INTO `character_history` VALUES ('1819', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-03 00:36:36');
INSERT INTO `character_history` VALUES ('1820', '2', '1', '127.0.0.1', '1', '44', 'Neirodk', '2013-08-03 14:11:58');
INSERT INTO `character_history` VALUES ('1821', '2', '1', '127.0.0.1', '2', '44', 'Neirodk', '2013-08-03 14:15:30');
INSERT INTO `character_history` VALUES ('1822', '2', '1', '127.0.0.1', '1', '42', 'Hger', '2013-08-03 14:24:44');
INSERT INTO `character_history` VALUES ('1823', '2', '1', '127.0.0.1', '2', '42', 'Hger', '2013-08-03 14:26:15');
INSERT INTO `character_history` VALUES ('1824', '2', '1', '127.0.0.1', '3', '65', 'Еек', '2013-08-03 14:40:13');
INSERT INTO `character_history` VALUES ('1825', '2', '1', '127.0.0.1', '4', '66', 'Palkin', '2013-08-03 14:40:31');
INSERT INTO `character_history` VALUES ('1826', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-03 14:40:47');
INSERT INTO `character_history` VALUES ('1827', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-03 14:51:48');
INSERT INTO `character_history` VALUES ('1828', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-03 14:55:38');
INSERT INTO `character_history` VALUES ('1829', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-03 15:04:29');
INSERT INTO `character_history` VALUES ('1830', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-03 15:33:30');
INSERT INTO `character_history` VALUES ('1831', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-03 15:34:10');
INSERT INTO `character_history` VALUES ('1832', '2', '1', '127.0.0.1', '3', '47', 'Еаае', '2013-08-03 22:01:04');
INSERT INTO `character_history` VALUES ('1833', '2', '1', '127.0.0.1', '4', '67', 'Аак', '2013-08-03 22:01:20');
INSERT INTO `character_history` VALUES ('1834', '2', '1', '127.0.0.1', '1', '67', 'Аак', '2013-08-03 22:01:39');
INSERT INTO `character_history` VALUES ('1835', '2', '1', '127.0.0.1', '2', '67', 'Аак', '2013-08-03 22:04:56');
INSERT INTO `character_history` VALUES ('1836', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-03 22:22:37');
INSERT INTO `character_history` VALUES ('1837', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-03 22:31:26');
INSERT INTO `character_history` VALUES ('1838', '2', '1', '127.0.0.1', '3', '67', 'Аак', '2013-08-04 00:57:23');
INSERT INTO `character_history` VALUES ('1839', '2', '1', '127.0.0.1', '4', '68', 'Локи', '2013-08-04 00:57:41');
INSERT INTO `character_history` VALUES ('1840', '2', '1', '127.0.0.1', '1', '68', 'Локи', '2013-08-04 00:58:18');
INSERT INTO `character_history` VALUES ('1841', '2', '1', '127.0.0.1', '2', '68', 'Локи', '2013-08-04 01:02:32');
INSERT INTO `character_history` VALUES ('1842', '2', '1', '127.0.0.1', '1', '68', 'Локи', '2013-08-04 02:23:10');
INSERT INTO `character_history` VALUES ('1843', '2', '1', '127.0.0.1', '2', '68', 'Локи', '2013-08-04 02:25:00');
INSERT INTO `character_history` VALUES ('1844', '2', '1', '127.0.0.1', '1', '68', 'Локи', '2013-08-04 02:34:34');
INSERT INTO `character_history` VALUES ('1845', '2', '1', '127.0.0.1', '2', '68', 'Локи', '2013-08-04 02:38:57');
INSERT INTO `character_history` VALUES ('1846', '2', '1', '127.0.0.1', '1', '68', 'Локи', '2013-08-04 14:11:17');
INSERT INTO `character_history` VALUES ('1847', '2', '1', '127.0.0.1', '2', '68', 'Локи', '2013-08-04 14:12:56');
INSERT INTO `character_history` VALUES ('1848', '2', '1', '127.0.0.1', '3', '68', 'Локи', '2013-08-04 14:18:33');
INSERT INTO `character_history` VALUES ('1849', '2', '1', '127.0.0.1', '4', '69', 'Екпк', '2013-08-04 14:19:03');
INSERT INTO `character_history` VALUES ('1850', '2', '1', '127.0.0.1', '1', '69', 'Екпк', '2013-08-04 14:19:21');
INSERT INTO `character_history` VALUES ('1851', '2', '1', '127.0.0.1', '2', '69', 'Екпк', '2013-08-04 14:22:47');
INSERT INTO `character_history` VALUES ('1852', '2', '1', '127.0.0.1', '1', '69', 'Екпк', '2013-08-04 16:32:40');
INSERT INTO `character_history` VALUES ('1853', '2', '1', '127.0.0.1', '2', '69', 'Екпк', '2013-08-04 16:37:19');
INSERT INTO `character_history` VALUES ('1854', '2', '1', '127.0.0.1', '1', '69', 'Екпк', '2013-08-04 16:43:54');
INSERT INTO `character_history` VALUES ('1855', '2', '1', '127.0.0.1', '2', '69', 'Екпк', '2013-08-04 16:44:42');
INSERT INTO `character_history` VALUES ('1856', '2', '1', '127.0.0.1', '1', '69', 'Екпк', '2013-08-04 16:45:31');
INSERT INTO `character_history` VALUES ('1857', '2', '1', '127.0.0.1', '2', '69', 'Екпк', '2013-08-04 16:47:37');
INSERT INTO `character_history` VALUES ('1858', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-04 16:54:23');
INSERT INTO `character_history` VALUES ('1859', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-04 16:56:02');
INSERT INTO `character_history` VALUES ('1860', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-04 17:13:09');
INSERT INTO `character_history` VALUES ('1861', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-04 17:13:41');
INSERT INTO `character_history` VALUES ('1862', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-04 17:18:49');
INSERT INTO `character_history` VALUES ('1863', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-04 17:19:35');
INSERT INTO `character_history` VALUES ('1864', '2', '1', '127.0.0.1', '1', '66', 'Palkin', '2013-08-04 17:23:57');
INSERT INTO `character_history` VALUES ('1865', '2', '1', '127.0.0.1', '2', '66', 'Palkin', '2013-08-04 17:26:24');
INSERT INTO `character_history` VALUES ('1866', '4', '1', '127.0.0.1', '4', '70', 'Woww', '2013-08-05 00:38:59');
INSERT INTO `character_history` VALUES ('1867', '4', '1', '127.0.0.1', '1', '70', 'Woww', '2013-08-05 00:39:21');
INSERT INTO `character_history` VALUES ('1868', '4', '1', '127.0.0.1', '2', '70', 'Woww', '2013-08-05 00:43:18');

-- ----------------------------
-- Table structure for `hacked`
-- ----------------------------
DROP TABLE IF EXISTS `hacked`;
CREATE TABLE `hacked` (
  `charname` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hacked
-- ----------------------------

-- ----------------------------
-- Table structure for `ip2nation`
-- ----------------------------
DROP TABLE IF EXISTS `ip2nation`;
CREATE TABLE `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ip2nation
-- ----------------------------

-- ----------------------------
-- Table structure for `ip2nationcountries`
-- ----------------------------
DROP TABLE IF EXISTS `ip2nationcountries`;
CREATE TABLE `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ip2nationcountries
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_banned`
-- ----------------------------
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- ----------------------------
-- Records of ip_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `lagreports`
-- ----------------------------
DROP TABLE IF EXISTS `lagreports`;
CREATE TABLE `lagreports` (
  `account` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lagreports
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_account_groups`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_account_groups`;
CREATE TABLE `rbac_account_groups` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `groupId` int(10) unsigned NOT NULL COMMENT 'Group id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`groupId`,`realmId`),
  KEY `fk__rbac_account_groups__rbac_groups` (`groupId`),
  CONSTRAINT `fk__rbac_account_groups__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_groups__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Group relation';

-- ----------------------------
-- Records of rbac_account_groups
-- ----------------------------
INSERT INTO `rbac_account_groups` VALUES ('1', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('2', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('3', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('4', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('5', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('6', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('7', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('8', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('9', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('10', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('11', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('12', '1', '-1');
INSERT INTO `rbac_account_groups` VALUES ('2', '2', '-1');
INSERT INTO `rbac_account_groups` VALUES ('3', '2', '1');
INSERT INTO `rbac_account_groups` VALUES ('6', '2', '-1');
INSERT INTO `rbac_account_groups` VALUES ('9', '2', '-1');
INSERT INTO `rbac_account_groups` VALUES ('11', '2', '-1');
INSERT INTO `rbac_account_groups` VALUES ('12', '2', '-1');
INSERT INTO `rbac_account_groups` VALUES ('2', '3', '-1');
INSERT INTO `rbac_account_groups` VALUES ('3', '3', '1');
INSERT INTO `rbac_account_groups` VALUES ('6', '3', '-1');
INSERT INTO `rbac_account_groups` VALUES ('9', '3', '-1');
INSERT INTO `rbac_account_groups` VALUES ('11', '3', '-1');
INSERT INTO `rbac_account_groups` VALUES ('12', '3', '-1');
INSERT INTO `rbac_account_groups` VALUES ('2', '4', '-1');
INSERT INTO `rbac_account_groups` VALUES ('3', '4', '1');
INSERT INTO `rbac_account_groups` VALUES ('6', '4', '-1');
INSERT INTO `rbac_account_groups` VALUES ('9', '4', '-1');
INSERT INTO `rbac_account_groups` VALUES ('11', '4', '-1');
INSERT INTO `rbac_account_groups` VALUES ('12', '4', '-1');

-- ----------------------------
-- Table structure for `rbac_account_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_account_permissions`;
CREATE TABLE `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

-- ----------------------------
-- Records of rbac_account_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_account_roles`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_account_roles`;
CREATE TABLE `rbac_account_roles` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`roleId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_roles` (`roleId`),
  CONSTRAINT `fk__rbac_account_roles__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Role relation';

-- ----------------------------
-- Records of rbac_account_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_groups`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_groups`;
CREATE TABLE `rbac_groups` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Group id',
  `name` varchar(50) NOT NULL COMMENT 'Group name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group List';

-- ----------------------------
-- Records of rbac_groups
-- ----------------------------
INSERT INTO `rbac_groups` VALUES ('1', 'Player');
INSERT INTO `rbac_groups` VALUES ('2', 'Moderator');
INSERT INTO `rbac_groups` VALUES ('3', 'GameMaster');
INSERT INTO `rbac_groups` VALUES ('4', 'Administrator');

-- ----------------------------
-- Table structure for `rbac_group_roles`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_group_roles`;
CREATE TABLE `rbac_group_roles` (
  `groupId` int(10) unsigned NOT NULL COMMENT 'group id',
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  PRIMARY KEY (`groupId`,`roleId`),
  KEY `fk__rbac_group_roles__rbac_roles` (`roleId`),
  CONSTRAINT `fk__rbac_group_roles__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_group_roles__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group Role relation';

-- ----------------------------
-- Records of rbac_group_roles
-- ----------------------------
INSERT INTO `rbac_group_roles` VALUES ('1', '1');
INSERT INTO `rbac_group_roles` VALUES ('2', '2');
INSERT INTO `rbac_group_roles` VALUES ('3', '3');
INSERT INTO `rbac_group_roles` VALUES ('4', '4');
INSERT INTO `rbac_group_roles` VALUES ('2', '5');
INSERT INTO `rbac_group_roles` VALUES ('1', '6');
INSERT INTO `rbac_group_roles` VALUES ('1', '7');
INSERT INTO `rbac_group_roles` VALUES ('2', '8');
INSERT INTO `rbac_group_roles` VALUES ('3', '8');
INSERT INTO `rbac_group_roles` VALUES ('4', '8');
INSERT INTO `rbac_group_roles` VALUES ('2', '9');
INSERT INTO `rbac_group_roles` VALUES ('3', '9');
INSERT INTO `rbac_group_roles` VALUES ('4', '9');
INSERT INTO `rbac_group_roles` VALUES ('2', '10');
INSERT INTO `rbac_group_roles` VALUES ('3', '10');
INSERT INTO `rbac_group_roles` VALUES ('4', '10');
INSERT INTO `rbac_group_roles` VALUES ('2', '11');
INSERT INTO `rbac_group_roles` VALUES ('3', '11');
INSERT INTO `rbac_group_roles` VALUES ('4', '11');
INSERT INTO `rbac_group_roles` VALUES ('2', '12');
INSERT INTO `rbac_group_roles` VALUES ('3', '12');
INSERT INTO `rbac_group_roles` VALUES ('4', '12');
INSERT INTO `rbac_group_roles` VALUES ('1', '13');
INSERT INTO `rbac_group_roles` VALUES ('2', '13');
INSERT INTO `rbac_group_roles` VALUES ('3', '13');
INSERT INTO `rbac_group_roles` VALUES ('4', '13');
INSERT INTO `rbac_group_roles` VALUES ('2', '14');
INSERT INTO `rbac_group_roles` VALUES ('3', '14');
INSERT INTO `rbac_group_roles` VALUES ('4', '14');
INSERT INTO `rbac_group_roles` VALUES ('2', '15');
INSERT INTO `rbac_group_roles` VALUES ('3', '15');
INSERT INTO `rbac_group_roles` VALUES ('4', '15');
INSERT INTO `rbac_group_roles` VALUES ('2', '16');
INSERT INTO `rbac_group_roles` VALUES ('3', '16');
INSERT INTO `rbac_group_roles` VALUES ('4', '16');
INSERT INTO `rbac_group_roles` VALUES ('2', '17');
INSERT INTO `rbac_group_roles` VALUES ('3', '17');
INSERT INTO `rbac_group_roles` VALUES ('4', '17');
INSERT INTO `rbac_group_roles` VALUES ('4', '18');
INSERT INTO `rbac_group_roles` VALUES ('1', '19');
INSERT INTO `rbac_group_roles` VALUES ('2', '19');
INSERT INTO `rbac_group_roles` VALUES ('3', '19');
INSERT INTO `rbac_group_roles` VALUES ('4', '19');
INSERT INTO `rbac_group_roles` VALUES ('2', '20');
INSERT INTO `rbac_group_roles` VALUES ('3', '20');
INSERT INTO `rbac_group_roles` VALUES ('4', '20');
INSERT INTO `rbac_group_roles` VALUES ('2', '21');
INSERT INTO `rbac_group_roles` VALUES ('3', '21');
INSERT INTO `rbac_group_roles` VALUES ('4', '21');
INSERT INTO `rbac_group_roles` VALUES ('2', '22');
INSERT INTO `rbac_group_roles` VALUES ('3', '22');
INSERT INTO `rbac_group_roles` VALUES ('4', '22');
INSERT INTO `rbac_group_roles` VALUES ('4', '23');
INSERT INTO `rbac_group_roles` VALUES ('2', '24');
INSERT INTO `rbac_group_roles` VALUES ('3', '24');
INSERT INTO `rbac_group_roles` VALUES ('4', '24');
INSERT INTO `rbac_group_roles` VALUES ('2', '25');
INSERT INTO `rbac_group_roles` VALUES ('3', '25');
INSERT INTO `rbac_group_roles` VALUES ('4', '25');
INSERT INTO `rbac_group_roles` VALUES ('2', '26');
INSERT INTO `rbac_group_roles` VALUES ('3', '26');
INSERT INTO `rbac_group_roles` VALUES ('4', '26');
INSERT INTO `rbac_group_roles` VALUES ('2', '27');
INSERT INTO `rbac_group_roles` VALUES ('3', '27');
INSERT INTO `rbac_group_roles` VALUES ('4', '27');
INSERT INTO `rbac_group_roles` VALUES ('1', '28');
INSERT INTO `rbac_group_roles` VALUES ('2', '28');
INSERT INTO `rbac_group_roles` VALUES ('3', '28');
INSERT INTO `rbac_group_roles` VALUES ('4', '28');
INSERT INTO `rbac_group_roles` VALUES ('2', '29');
INSERT INTO `rbac_group_roles` VALUES ('3', '29');
INSERT INTO `rbac_group_roles` VALUES ('4', '29');
INSERT INTO `rbac_group_roles` VALUES ('1', '30');
INSERT INTO `rbac_group_roles` VALUES ('2', '30');
INSERT INTO `rbac_group_roles` VALUES ('3', '30');
INSERT INTO `rbac_group_roles` VALUES ('4', '30');
INSERT INTO `rbac_group_roles` VALUES ('2', '32');
INSERT INTO `rbac_group_roles` VALUES ('3', '32');
INSERT INTO `rbac_group_roles` VALUES ('4', '32');
INSERT INTO `rbac_group_roles` VALUES ('1', '35');
INSERT INTO `rbac_group_roles` VALUES ('2', '35');
INSERT INTO `rbac_group_roles` VALUES ('3', '35');
INSERT INTO `rbac_group_roles` VALUES ('4', '35');
INSERT INTO `rbac_group_roles` VALUES ('1', '36');
INSERT INTO `rbac_group_roles` VALUES ('2', '36');
INSERT INTO `rbac_group_roles` VALUES ('3', '36');
INSERT INTO `rbac_group_roles` VALUES ('4', '36');
INSERT INTO `rbac_group_roles` VALUES ('2', '37');
INSERT INTO `rbac_group_roles` VALUES ('3', '37');
INSERT INTO `rbac_group_roles` VALUES ('4', '37');
INSERT INTO `rbac_group_roles` VALUES ('2', '38');
INSERT INTO `rbac_group_roles` VALUES ('3', '38');
INSERT INTO `rbac_group_roles` VALUES ('4', '38');
INSERT INTO `rbac_group_roles` VALUES ('3', '39');
INSERT INTO `rbac_group_roles` VALUES ('4', '39');

-- ----------------------------
-- Table structure for `rbac_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_permissions`;
CREATE TABLE `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- ----------------------------
-- Records of rbac_permissions
-- ----------------------------
INSERT INTO `rbac_permissions` VALUES ('1', 'Instant logout');
INSERT INTO `rbac_permissions` VALUES ('2', 'Skip Queue');
INSERT INTO `rbac_permissions` VALUES ('3', 'Join Normal Battleground');
INSERT INTO `rbac_permissions` VALUES ('4', 'Join Random Battleground');
INSERT INTO `rbac_permissions` VALUES ('5', 'Join Arenas');
INSERT INTO `rbac_permissions` VALUES ('6', 'Join Dungeon Finder');
INSERT INTO `rbac_permissions` VALUES ('7', 'Player Commands (Temporal till commands moved to rbac)');
INSERT INTO `rbac_permissions` VALUES ('8', 'Moderator Commands (Temporal till commands moved to rbac)');
INSERT INTO `rbac_permissions` VALUES ('9', 'GameMaster Commands (Temporal till commands moved to rbac)');
INSERT INTO `rbac_permissions` VALUES ('10', 'Administrator Commands (Temporal till commands moved to rbac)');
INSERT INTO `rbac_permissions` VALUES ('11', 'Log GM trades');
INSERT INTO `rbac_permissions` VALUES ('13', 'Skip Instance required bosses check');
INSERT INTO `rbac_permissions` VALUES ('14', 'Skips character creation team mask check');
INSERT INTO `rbac_permissions` VALUES ('15', 'Skips character creation class mask check');
INSERT INTO `rbac_permissions` VALUES ('16', 'Skips character creation race mask check');
INSERT INTO `rbac_permissions` VALUES ('17', 'Skips character creation reserved name check');
INSERT INTO `rbac_permissions` VALUES ('18', 'Skips character creation heroic min level check');
INSERT INTO `rbac_permissions` VALUES ('19', 'Skips needed requirements to use channel check');
INSERT INTO `rbac_permissions` VALUES ('20', 'Skip disable map check');
INSERT INTO `rbac_permissions` VALUES ('21', 'Skip reset talents when used more than allowed check');
INSERT INTO `rbac_permissions` VALUES ('22', 'Skip spam chat check');
INSERT INTO `rbac_permissions` VALUES ('23', 'Skip over-speed ping check');
INSERT INTO `rbac_permissions` VALUES ('24', 'Creation of two side faction characters in same account');
INSERT INTO `rbac_permissions` VALUES ('25', 'Allow say chat between factions');
INSERT INTO `rbac_permissions` VALUES ('26', 'Allow channel chat between factions');
INSERT INTO `rbac_permissions` VALUES ('27', 'Two side mail interaction');
INSERT INTO `rbac_permissions` VALUES ('28', 'See two side who list');
INSERT INTO `rbac_permissions` VALUES ('29', 'Add friends of other faction');
INSERT INTO `rbac_permissions` VALUES ('30', 'Save character without delay with .save command');
INSERT INTO `rbac_permissions` VALUES ('31', 'Use params with .unstuck command');
INSERT INTO `rbac_permissions` VALUES ('32', 'Can be assigned tickets with .assign ticket command');
INSERT INTO `rbac_permissions` VALUES ('33', 'Notify if a command was not found');
INSERT INTO `rbac_permissions` VALUES ('34', 'Check if should appear in list using .gm ingame command');
INSERT INTO `rbac_permissions` VALUES ('35', 'See all security levels with who command');
INSERT INTO `rbac_permissions` VALUES ('36', 'Filter whispers');
INSERT INTO `rbac_permissions` VALUES ('37', 'Use staff badge in chat');
INSERT INTO `rbac_permissions` VALUES ('38', 'Resurrect with full Health Points');
INSERT INTO `rbac_permissions` VALUES ('39', 'Restore saved gm setting states');
INSERT INTO `rbac_permissions` VALUES ('40', 'Allows to add a gm to friend list');
INSERT INTO `rbac_permissions` VALUES ('41', 'Use Config option START_GM_LEVEL to assign new character level');
INSERT INTO `rbac_permissions` VALUES ('42', 'Allows to use CMSG_WORLD_TELEPORT opcode');
INSERT INTO `rbac_permissions` VALUES ('43', 'Allows to use CMSG_WHOIS opcode');
INSERT INTO `rbac_permissions` VALUES ('44', 'Receive global GM messages/texts');
INSERT INTO `rbac_permissions` VALUES ('45', 'Join channels without announce');
INSERT INTO `rbac_permissions` VALUES ('46', 'Change channel settings without being channel moderator');
INSERT INTO `rbac_permissions` VALUES ('47', 'Enables lower security than target check');
INSERT INTO `rbac_permissions` VALUES ('48', 'Enable IP, Last Login and EMail output in pinfo');

-- ----------------------------
-- Table structure for `rbac_roles`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_roles`;
CREATE TABLE `rbac_roles` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role id',
  `name` varchar(70) NOT NULL COMMENT 'Role name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles List';

-- ----------------------------
-- Records of rbac_roles
-- ----------------------------
INSERT INTO `rbac_roles` VALUES ('1', 'Player Commands');
INSERT INTO `rbac_roles` VALUES ('2', 'Moderator Commands');
INSERT INTO `rbac_roles` VALUES ('3', 'GameMaster Commands');
INSERT INTO `rbac_roles` VALUES ('4', 'Administrator Commands');
INSERT INTO `rbac_roles` VALUES ('5', 'Quick Login/Logout');
INSERT INTO `rbac_roles` VALUES ('6', 'Use Battleground/Arenas');
INSERT INTO `rbac_roles` VALUES ('7', 'Use Dungeon Finder');
INSERT INTO `rbac_roles` VALUES ('8', 'Log GM trades');
INSERT INTO `rbac_roles` VALUES ('9', 'Skip Instance required bosses check');
INSERT INTO `rbac_roles` VALUES ('10', 'Ticket management');
INSERT INTO `rbac_roles` VALUES ('11', 'Instant .save');
INSERT INTO `rbac_roles` VALUES ('12', 'Allow params with .unstuck');
INSERT INTO `rbac_roles` VALUES ('13', 'Full HP after resurrect');
INSERT INTO `rbac_roles` VALUES ('14', 'Appear in GM ingame list');
INSERT INTO `rbac_roles` VALUES ('15', 'Use staff badge in chat');
INSERT INTO `rbac_roles` VALUES ('16', 'Receive global GM messages/texts');
INSERT INTO `rbac_roles` VALUES ('17', 'Skip over-speed ping check');
INSERT INTO `rbac_roles` VALUES ('18', 'Allows Admin Opcodes');
INSERT INTO `rbac_roles` VALUES ('19', 'Two side mail interaction');
INSERT INTO `rbac_roles` VALUES ('20', 'Notify if a command was not found');
INSERT INTO `rbac_roles` VALUES ('21', 'Enables lower security than target check');
INSERT INTO `rbac_roles` VALUES ('22', 'Skip disable map check');
INSERT INTO `rbac_roles` VALUES ('23', 'Skip reset talents when used more than allowed check');
INSERT INTO `rbac_roles` VALUES ('24', 'Skip spam chat check');
INSERT INTO `rbac_roles` VALUES ('25', 'Restore saved gm setting states');
INSERT INTO `rbac_roles` VALUES ('26', 'Use Config option START_GM_LEVEL to assign new character level');
INSERT INTO `rbac_roles` VALUES ('27', 'Skips needed requirements to use channel check');
INSERT INTO `rbac_roles` VALUES ('28', 'Allow say chat between factions');
INSERT INTO `rbac_roles` VALUES ('29', 'Filter whispers');
INSERT INTO `rbac_roles` VALUES ('30', 'Allow channel chat between factions');
INSERT INTO `rbac_roles` VALUES ('31', 'Join channels without announce');
INSERT INTO `rbac_roles` VALUES ('32', 'Change channel settings without being channel moderator');
INSERT INTO `rbac_roles` VALUES ('35', 'See two side who list');
INSERT INTO `rbac_roles` VALUES ('36', 'Add friends of other faction');
INSERT INTO `rbac_roles` VALUES ('37', 'See all security levels with who command');
INSERT INTO `rbac_roles` VALUES ('38', 'Allows to add a gm to friend list');
INSERT INTO `rbac_roles` VALUES ('39', 'Enable IP, Last Login and EMail output in pinfo');

-- ----------------------------
-- Table structure for `rbac_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_permissions`;
CREATE TABLE `rbac_role_permissions` (
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk__role_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__role_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__role_permissions__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Role Permission relation';

-- ----------------------------
-- Records of rbac_role_permissions
-- ----------------------------
INSERT INTO `rbac_role_permissions` VALUES ('5', '1');
INSERT INTO `rbac_role_permissions` VALUES ('5', '2');
INSERT INTO `rbac_role_permissions` VALUES ('6', '3');
INSERT INTO `rbac_role_permissions` VALUES ('6', '4');
INSERT INTO `rbac_role_permissions` VALUES ('6', '5');
INSERT INTO `rbac_role_permissions` VALUES ('7', '6');
INSERT INTO `rbac_role_permissions` VALUES ('1', '7');
INSERT INTO `rbac_role_permissions` VALUES ('2', '8');
INSERT INTO `rbac_role_permissions` VALUES ('3', '9');
INSERT INTO `rbac_role_permissions` VALUES ('4', '10');
INSERT INTO `rbac_role_permissions` VALUES ('8', '11');
INSERT INTO `rbac_role_permissions` VALUES ('9', '13');
INSERT INTO `rbac_role_permissions` VALUES ('17', '23');
INSERT INTO `rbac_role_permissions` VALUES ('19', '27');
INSERT INTO `rbac_role_permissions` VALUES ('10', '32');
INSERT INTO `rbac_role_permissions` VALUES ('16', '44');
INSERT INTO `rbac_role_permissions` VALUES ('39', '48');

-- ----------------------------
-- Table structure for `rbac_security_level_groups`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_security_level_groups`;
CREATE TABLE `rbac_security_level_groups` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `groupId` int(10) unsigned NOT NULL COMMENT 'group id',
  PRIMARY KEY (`secId`,`groupId`),
  KEY `fk__rbac_security_level_groups__rbac_groups` (`groupId`),
  CONSTRAINT `fk__rbac_security_level_groups__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default groups to assign when an account is set gm level';

-- ----------------------------
-- Records of rbac_security_level_groups
-- ----------------------------
INSERT INTO `rbac_security_level_groups` VALUES ('0', '1');
INSERT INTO `rbac_security_level_groups` VALUES ('1', '1');
INSERT INTO `rbac_security_level_groups` VALUES ('2', '1');
INSERT INTO `rbac_security_level_groups` VALUES ('3', '1');
INSERT INTO `rbac_security_level_groups` VALUES ('1', '2');
INSERT INTO `rbac_security_level_groups` VALUES ('2', '2');
INSERT INTO `rbac_security_level_groups` VALUES ('3', '2');
INSERT INTO `rbac_security_level_groups` VALUES ('2', '3');
INSERT INTO `rbac_security_level_groups` VALUES ('3', '3');
INSERT INTO `rbac_security_level_groups` VALUES ('3', '4');

-- ----------------------------
-- Table structure for `realmcharacters`
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- ----------------------------
-- Records of realmcharacters
-- ----------------------------
INSERT INTO `realmcharacters` VALUES ('1', '1', '7');
INSERT INTO `realmcharacters` VALUES ('1', '2', '10');
INSERT INTO `realmcharacters` VALUES ('1', '3', '8');
INSERT INTO `realmcharacters` VALUES ('1', '4', '6');
INSERT INTO `realmcharacters` VALUES ('1', '5', '1');
INSERT INTO `realmcharacters` VALUES ('1', '6', '10');
INSERT INTO `realmcharacters` VALUES ('1', '7', '0');
INSERT INTO `realmcharacters` VALUES ('1', '8', '0');
INSERT INTO `realmcharacters` VALUES ('1', '9', '1');
INSERT INTO `realmcharacters` VALUES ('1', '10', '1');
INSERT INTO `realmcharacters` VALUES ('1', '11', '2');
INSERT INTO `realmcharacters` VALUES ('1', '12', '1');
INSERT INTO `realmcharacters` VALUES ('1', '13', '1');
INSERT INTO `realmcharacters` VALUES ('1', '14', '2');
INSERT INTO `realmcharacters` VALUES ('1', '15', '1');
INSERT INTO `realmcharacters` VALUES ('1', '16', '1');
INSERT INTO `realmcharacters` VALUES ('1', '17', '2');
INSERT INTO `realmcharacters` VALUES ('2', '2', '10');
INSERT INTO `realmcharacters` VALUES ('2', '6', '0');
INSERT INTO `realmcharacters` VALUES ('2', '7', '0');
INSERT INTO `realmcharacters` VALUES ('2', '8', '0');
INSERT INTO `realmcharacters` VALUES ('2', '9', '0');
INSERT INTO `realmcharacters` VALUES ('2', '10', '0');
INSERT INTO `realmcharacters` VALUES ('2', '11', '0');
INSERT INTO `realmcharacters` VALUES ('2', '12', '0');

-- ----------------------------
-- Table structure for `realmlist`
-- ----------------------------
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- ----------------------------
-- Records of realmlist
-- ----------------------------
INSERT INTO `realmlist` VALUES ('2', 'Урквиль', '127.0.0.1', '0.0.0.0', '255.255.255.0', '8085', '0', '0', '1', '0', '0', '12340');

-- ----------------------------
-- Table structure for `uptime`
-- ----------------------------
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- ----------------------------
-- Records of uptime
-- ----------------------------
INSERT INTO `uptime` VALUES ('1', '1352134613', '6602', '0', 'TrinityCore rev. 2012-11-04 23:57:29 +0400 (9699954a2c0d) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352142151', '2415', '0', 'TrinityCore rev. 2012-11-04 23:57:29 +0400 (9699954a2c0d) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352148260', '0', '0', 'TrinityCore rev. 2012-11-05 23:40:32 +0400 (5c2395c59a2e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352149696', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352313739', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352323266', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352323487', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352323834', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352323943', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352324091', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352370345', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352395724', '2408', '1', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352398766', '0', '0', 'TrinityCore rev. 2012-11-06 00:53:56 +0400 (1d5b2912d82e+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352483757', '612', '1', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352484464', '0', '0', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352485944', '0', '0', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352486339', '0', '0', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352486601', '601', '1', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352487420', '0', '0', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352487751', '12000', '1', 'TrinityCore rev. 2012-11-09 21:49:07 +0400 (81075fe9bd18) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352504267', '24609', '1', 'TrinityCore rev. 2012-11-10 02:37:13 +0400 (56fcd3a91bee) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352541844', '2407', '1', 'TrinityCore rev. 2012-11-10 02:37:13 +0400 (56fcd3a91bee) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352547533', '3011', '1', 'TrinityCore rev. 2012-11-10 14:58:20 +0400 (66272aaf3da9) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352552100', '2406', '1', 'TrinityCore rev. 2012-11-10 14:58:20 +0400 (66272aaf3da9) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352554858', '605', '1', 'TrinityCore rev. 2012-11-10 14:58:20 +0400 (66272aaf3da9) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352556373', '0', '0', 'TrinityCore rev. 2012-11-10 17:57:47 +0400 (c609713fbd71+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352556481', '16800', '1', 'TrinityCore rev. 2012-11-10 17:57:47 +0400 (c609713fbd71+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352611860', '0', '0', 'TrinityCore rev. 2012-11-10 23:47:54 +0400 (450ad1ac8f8a) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352612313', '12600', '1', 'TrinityCore rev. 2012-11-10 23:47:54 +0400 (450ad1ac8f8a) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352625162', '612', '1', 'TrinityCore rev. 2012-11-10 23:47:54 +0400 (450ad1ac8f8a) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352628771', '0', '0', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352629376', '12001', '1', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352641513', '0', '0', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352642234', '0', '0', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352642919', '0', '0', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352654015', '0', '0', 'TrinityCore rev. 2012-11-11 13:58:20 +0400 (081ec07c44a4) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352664441', '34207', '1', 'TrinityCore rev. 2012-11-11 22:36:56 +0400 (464b788b591c+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352726675', '0', '0', 'TrinityCore rev. 2012-11-11 22:36:56 +0400 (464b788b591c+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352737542', '0', '0', 'TrinityCore rev. 2012-11-11 22:36:56 +0400 (464b788b591c+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352897482', '0', '0', 'TrinityCore rev. 2012-11-11 22:36:56 +0400 (464b788b591c+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1352897870', '0', '0', 'TrinityCore rev. 2012-11-11 22:36:56 +0400 (464b788b591c+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353056289', '610', '1', 'TrinityCore rev. 2012-11-16 10:39:12 +0400 (49355d59ab85+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353057324', '0', '0', 'TrinityCore rev. 2012-11-16 10:39:12 +0400 (49355d59ab85+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353087496', '0', '0', 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353087817', '601', '0', 'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353177218', '0', '0', 'TrinityCore rev. 2012-11-17 22:11:24 +0400 (373459958dde) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353177666', '0', '0', 'TrinityCore rev. 2012-11-17 22:11:24 +0400 (373459958dde) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353237295', '609', '1', 'TrinityCore rev. 2012-11-17 22:46:24 +0400 (3cdf049c6377) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353238027', '601', '1', 'TrinityCore rev. 2012-11-17 22:46:24 +0400 (3cdf049c6377) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353239244', '0', '0', 'TrinityCore rev. 2012-11-17 22:46:24 +0400 (3cdf049c6377) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1353271566', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353271889', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353328162', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353330033', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353389847', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353681649', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353681798', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353681821', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353779367', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353791997', '31209', '1', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353828962', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353829202', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353833538', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353834856', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353861745', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353861849', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353862209', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353862477', '0', '0', 'TrinityCore rev. 2012-11-18 23:31:04 +0400 (2072e5924f40+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353881995', '0', '0', 'TrinityCore rev. 2012-11-26 00:54:57 +0400 (89da51dd54fc+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353882109', '601', '1', 'TrinityCore rev. 2012-11-26 00:54:57 +0400 (89da51dd54fc+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353882853', '0', '0', 'TrinityCore rev. 2012-11-26 00:54:57 +0400 (89da51dd54fc+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353957887', '0', '0', 'TrinityCore rev. 2012-11-26 22:54:48 +0400 (400758a0d2d3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353958259', '0', '0', 'TrinityCore rev. 2012-11-26 22:54:48 +0400 (400758a0d2d3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353958565', '0', '0', 'TrinityCore rev. 2012-11-26 22:54:48 +0400 (400758a0d2d3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1353958745', '61800', '0', 'TrinityCore rev. 2012-11-26 22:54:48 +0400 (400758a0d2d3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354034341', '615', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354035939', '0', '0', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354196440', '0', '0', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354197278', '0', '0', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354197892', '601', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354199215', '0', '0', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354199498', '601', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354200320', '0', '0', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354200538', '601', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354201365', '1201', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354202701', '1200', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354204160', '21000', '1', 'TrinityCore rev. 2012-11-27 18:25:10 +0400 (6d6dcd3bbdf8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354228873', '0', '0', 'TrinityCore rev. 2012-11-30 02:23:08 +0400 (ad564467e586+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354229317', '1800', '1', 'TrinityCore rev. 2012-11-30 02:23:08 +0400 (ad564467e586+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354308550', '2411', '1', 'TrinityCore rev. 2012-12-01 00:42:21 +0400 (4de2e27cf046+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354312272', '0', '0', 'TrinityCore rev. 2012-12-01 00:42:21 +0400 (4de2e27cf046+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354350117', '0', '0', 'TrinityCore rev. 2012-12-01 00:42:21 +0400 (4de2e27cf046+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354353895', '0', '0', 'TrinityCore rev. 2012-12-01 00:42:21 +0400 (4de2e27cf046+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354389317', '3613', '1', 'TrinityCore rev. 2012-12-01 20:19:32 +0400 (d2ef6530dd14+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354459654', '617', '1', 'TrinityCore rev. 2012-12-01 20:19:32 +0400 (d2ef6530dd14+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354545842', '0', '0', 'TrinityCore rev. 2012-12-02 23:24:32 +0400 (29cc8e21b2b8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354545969', '0', '0', 'TrinityCore rev. 2012-12-02 23:24:32 +0400 (29cc8e21b2b8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354546240', '0', '0', 'TrinityCore rev. 2012-12-02 23:24:32 +0400 (29cc8e21b2b8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354546597', '0', '0', 'TrinityCore rev. 2012-12-02 23:24:32 +0400 (29cc8e21b2b8+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354554016', '613', '1', 'TrinityCore rev. 2012-12-03 19:14:08 +0400 (c4fbf84a53b7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354555382', '1806', '0', 'TrinityCore rev. 2012-12-03 19:14:08 +0400 (c4fbf84a53b7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354557290', '3001', '1', 'TrinityCore rev. 2012-12-03 19:14:08 +0400 (c4fbf84a53b7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354560829', '608', '1', 'TrinityCore rev. 2012-12-03 19:14:08 +0400 (c4fbf84a53b7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354562018', '0', '0', 'TrinityCore rev. 2012-12-03 19:14:08 +0400 (c4fbf84a53b7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354566600', '32401', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354599601', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354646577', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354646638', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354647365', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354647878', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354647932', '1800', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354654480', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354654519', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354654717', '33001', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354689336', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354689944', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354690384', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354690718', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354690840', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354692642', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354692864', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354693055', '1800', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354719837', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354721557', '600', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354722751', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354722883', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354723591', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354724073', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354738357', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354739118', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354740115', '34800', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354745273', '1213', '1', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354747121', '0', '0', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354747418', '0', '0', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354747710', '1200', '1', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354749396', '600', '1', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354750409', '0', '0', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354750814', '21000', '1', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354772009', '0', '0', 'TrinityCore rev. 2012-12-06 00:23:27 +0400 (5901d98b13c0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354796339', '1217', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354797643', '1207', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354799417', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354799656', '0', '0', 'TrinityCore rev. 2012-12-06 16:13:57 +0400 (108667f6d0b1) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354800117', '600', '0', 'TrinityCore rev. 2012-12-06 16:13:57 +0400 (108667f6d0b1) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354800666', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354800994', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354801241', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354803686', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354803738', '1200', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354810940', '1201', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354812677', '624', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354813995', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354814143', '1201', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354815740', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354815997', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354816117', '601', '1', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354826451', '2409', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354830792', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354830986', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354831266', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354831785', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354831941', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354832048', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354884615', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354884675', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354885102', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354885586', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354903635', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354906605', '1206', '1', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354908117', '58802', '1', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354975864', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354976146', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354976665', '601', '1', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354979222', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354979459', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354995803', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354995949', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354996371', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354997041', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354997648', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1354998194', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355060956', '0', '0', 'TrinityCore rev. 2012-12-06 18:13:54 +0400 (42b9fe7ce60d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355075670', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355075827', '1200', '1', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355077629', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355078144', '1200', '1', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355154800', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355155212', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355155519', '600', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355163974', '604', '1', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355164632', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355165249', '2401', '1', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355241732', '3018', '1', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355245149', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355245281', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355248978', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355514423', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355514474', '0', '0', 'TrinityCore rev. 2012-12-09 19:31:59 +0400 (db330386dab7+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355522312', '0', '0', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355522808', '1200', '1', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355568605', '0', '0', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355568886', '0', '0', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355578481', '609', '1', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355579366', '1801', '1', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355581415', '601', '1', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355590562', '0', '0', 'TrinityCore rev. 2012-12-15 01:36:15 +0400 (c68697e18e02+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355599264', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355599467', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355648577', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355649157', '6001', '1', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355655300', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355656587', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355656641', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355657020', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355657202', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355657539', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355657618', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355657853', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355664224', '6001', '1', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355671281', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355671532', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355672317', '0', '0', 'TrinityCore rev. 2012-12-15 11:55:49 +0400 (76a8eb66cfe3+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355690133', '0', '0', 'TrinityCore rev. 2012-12-16 23:34:11 +0400 (9039b76b102e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355690338', '0', '0', 'TrinityCore rev. 2012-12-16 23:34:11 +0400 (9039b76b102e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355691949', '2401', '0', 'TrinityCore rev. 2012-12-16 23:34:11 +0400 (9039b76b102e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355748208', '614', '1', 'TrinityCore rev. 2012-12-16 23:34:11 +0400 (9039b76b102e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355763489', '0', '0', 'TrinityCore rev. 2012-12-17 20:47:55 +0400 (dfd52132b3d2) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355764324', '1201', '0', 'TrinityCore rev. 2012-12-17 20:47:55 +0400 (dfd52132b3d2) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355780241', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355783586', '612', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355855754', '1809', '2', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355857633', '1206', '1', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355863744', '64231', '2', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355925780', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355935078', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355935519', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355935769', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355935847', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355936067', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355939958', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355940440', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355940706', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355942850', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355943579', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355944905', '1207', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355949602', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355950165', '601', '1', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1355954320', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355954505', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355954974', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355956343', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355956800', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355956878', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355957065', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355957161', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355957294', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355957738', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355957999', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355958390', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355958546', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1355958725', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356011933', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356012135', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356012916', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356013243', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356013948', '0', '0', 'TrinityCore rev. 2012-12-18 00:43:45 +0400 (cedf57b484bf) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356015798', '12604', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356028537', '2407', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356031434', '7801', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356039340', '600', '1', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356040182', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356040804', '0', '0', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356040934', '5400', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356046167', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356046544', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356046669', '47409', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356100659', '15001', '3', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356115922', '1805', '2', 'TrinityCore rev. 2012-12-19 21:47:58 +0400 (57e4b3e3f1f0+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356118335', '3615', '2', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356122774', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356123217', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356123286', '600', '1', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356124454', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356125215', '70800', '2', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356196331', '1211', '1', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356197903', '62401', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356198760', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356260868', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356260957', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356261261', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356261651', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356261821', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356262346', '601', '1', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356263135', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356263577', '13210', '3', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356277012', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356277479', '4809', '2', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356282924', '13803', '2', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356334494', '7806', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356359399', '15007', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356374834', '604', '1', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356376221', '601', '1', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356377663', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356380101', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356381294', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356381881', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356385957', '601', '1', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356386670', '2400', '1', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356413765', '15601', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356447453', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356450438', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356452620', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356453080', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356457626', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356457669', '1211', '1', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356459630', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356532495', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356533466', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356534429', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356535063', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356539867', '1812', '2', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356542265', '88201', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356631654', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356726411', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356775999', '600', '1', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356780946', '600', '1', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356781769', '0', '0', 'TrinityCore rev. 2012-12-25 20:06:58 +0400 (9a52c5dd5463+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356823261', '0', '0', 'TrinityCore rev. 2012-12-30 01:23:20 +0400 (d8d56f25dc5a+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356824766', '0', '0', 'TrinityCore rev. 2012-12-30 01:23:20 +0400 (d8d56f25dc5a+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356824835', '601', '1', 'TrinityCore rev. 2012-12-30 01:23:20 +0400 (d8d56f25dc5a+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1356885818', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356946561', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356946923', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356947083', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356947191', '2400', '1', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356962104', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356963889', '9601', '1', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356980463', '3600', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356989659', '601', '1', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356990778', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1356991245', '14401', '1', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357027271', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357069606', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357070784', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357071733', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357072257', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357072968', '0', '0', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357073295', '601', '1', 'TrinityCore rev. 2012-12-30 11:32:47 +0400 (97bc9bba1ee1+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357158415', '0', '0', 'TrinityCore rev. 2013-01-02 00:56:31 +0400 (260bf95b123e+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357410572', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357470529', '1208', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357473278', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357474817', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357474935', '602', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357482891', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357483173', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357483642', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357483775', '1201', '1', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357487350', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357487516', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357488555', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357489221', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357494507', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357494876', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357495464', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357496040', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357496275', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357497162', '601', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357498148', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357498486', '0', '0', 'TrinityCore rev. 2013-01-04 20:49:40 +0400 (d6c95748c468+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357848230', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357991859', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357996485', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357997023', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1357999170', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358023458', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358030330', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358030723', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358032218', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1358032941', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1358033329', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1358034223', '0', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1358063298', '616', '0', 'TrinityCore rev. 2013-01-06 21:04:03 +0400 (4da2b88eed63+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358102592', '618', '1', 'TrinityCore rev. 2013-01-13 22:17:00 +0400 (aab25ffbb1c8+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358107621', '1201', '2', 'TrinityCore rev. 2013-01-13 22:17:00 +0400 (aab25ffbb1c8+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358252390', '0', '0', 'TrinityCore rev. 2013-01-15 01:35:04 +0400 (6314dd23d299+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358263570', '629', '1', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358354238', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358354417', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358355396', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358452914', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1358453523', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358454091', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358456570', '0', '0', 'TrinityCore rev. 2013-01-15 18:36:19 +0400 (8a04b06b2c53+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358582331', '0', '0', 'TrinityCore rev. 2013-01-19 10:31:43 +0400 (b0f7766db488+) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358645738', '0', '0', 'TrinityCore rev. 2013-01-20 01:14:13 +0300 (874fe8a6d83e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358689809', '0', '0', 'TrinityCore rev. 2013-01-20 01:14:13 +0300 (874fe8a6d83e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358690415', '2429', '1', 'TrinityCore rev. 2013-01-20 01:14:13 +0300 (874fe8a6d83e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358701261', '0', '0', 'TrinityCore rev. 2013-01-20 17:59:06 +0300 (ac97812b617c+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358701384', '601', '1', 'TrinityCore rev. 2013-01-20 17:59:06 +0300 (ac97812b617c+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358705551', '611', '1', 'TrinityCore rev. 2013-01-20 20:48:41 +0300 (70ac5754df87+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1358971257', '1808', '1', 'TrinityCore rev. 2013-01-22 23:03:09 +0300 (4dd02690bd32) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1359119760', '1216', '1', 'TrinityCore rev. 2013-01-25 15:12:22 +0300 (aac44e5db4ee+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359121274', '0', '0', 'TrinityCore rev. 2013-01-25 15:12:22 +0300 (aac44e5db4ee+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359122440', '0', '0', 'TrinityCore rev. 2013-01-25 15:12:22 +0300 (aac44e5db4ee+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359124210', '617', '1', 'TrinityCore rev. 2013-01-25 15:12:22 +0300 (aac44e5db4ee+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359142190', '616', '1', 'TrinityCore rev. 2013-01-25 21:51:58 +0300 (15fb840903ef) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359220187', '608', '1', 'TrinityCore rev. 2013-01-25 21:51:58 +0300 (15fb840903ef) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359224232', '0', '0', 'TrinityCore rev. 2013-01-26 17:43:20 +0300 (5384c33c7069+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359224581', '600', '1', 'TrinityCore rev. 2013-01-26 17:43:20 +0300 (5384c33c7069+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359284415', '0', '0', 'TrinityCore rev. 2013-01-27 10:26:26 +0300 (48f26fd5a76f+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359312383', '0', '0', 'TrinityCore rev. 2013-01-27 10:26:26 +0300 (48f26fd5a76f+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359312415', '0', '0', 'TrinityCore rev. 2013-01-27 10:26:26 +0300 (48f26fd5a76f+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359318471', '57609', '0', 'TrinityCore rev. 2013-01-27 22:00:55 +0300 (c6018dceccfe) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359667217', '3024', '0', 'TrinityCore rev. 2013-01-30 22:51:25 +0300 (b329204765f2+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359830041', '0', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359831966', '1201', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359837933', '0', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359838304', '0', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359838582', '0', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359838940', '3601', '2', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359869498', '15601', '0', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1359887052', '33002', '1', 'TrinityCore rev. 2013-02-02 20:41:54 +0300 (ffe836598ee9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360001267', '0', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360002606', '0', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360087203', '10813', '3', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360151159', '3609', '3', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360155031', '0', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360155322', '18600', '3', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360174166', '0', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360177010', '0', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360181416', '1809', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360238657', '15601', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360254896', '608', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360255536', '2401', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360258621', '5401', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360264602', '2406', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360267496', '604', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360268336', '1802', '1', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360333681', '19207', '0', 'TrinityCore rev. 2013-02-04 19:17:35 +0300 (59a7d3bebd26+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360361260', '55224', '1', 'TrinityCore rev. 2013-02-08 23:57:12 +0300 (30702fb0d557+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360438955', '609', '0', 'TrinityCore rev. 2013-02-09 01:03:47 +0300 (11a5cdfa748e) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360439697', '0', '0', 'TrinityCore rev. 2013-02-09 01:03:47 +0300 (11a5cdfa748e) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360522148', '1214', '1', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360523849', '0', '0', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360524285', '0', '0', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360524458', '0', '0', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360524747', '1801', '1', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360527357', '601', '1', 'TrinityCore rev. 2013-02-10 00:21:06 +0300 (eefb0e6ec857+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360529082', '608', '1', 'TrinityCore rev. 2013-02-10 21:47:10 +0300 (6a5617ba90bf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360605444', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360614103', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360615530', '612', '1', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360616485', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360674633', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360675798', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360675975', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360676398', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360683011', '4813', '1', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360758582', '0', '0', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360759153', '1200', '1', 'TrinityCore rev. 2013-02-10 23:57:24 +0300 (017f527343b5+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360776509', '615', '1', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360792080', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360792602', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360869850', '601', '1', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360943270', '0', '0', 'TrinityCore rev. 2013-02-14 17:56:08 +0100 (7f0149e2d1c1+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1360943604', '0', '0', 'TrinityCore rev. 2013-02-14 17:56:08 +0100 (7f0149e2d1c1+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1360944216', '608', '1', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360944934', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360954353', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360955491', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1360956122', '0', '0', 'TrinityCore rev. 2013-02-14 17:56:08 +0100 (7f0149e2d1c1+) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1360963642', '0', '0', 'TrinityCore rev. 2013-02-13 15:53:31 +0300 (71c528d6d624+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361209435', '2415', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361215310', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361543711', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361544308', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361565385', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361565521', '1200', '1', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361567185', '601', '1', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361567920', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361604632', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361622279', '0', '0', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361622965', '4200', '1', 'TrinityCore rev. 2013-02-18 19:44:52 +0300 (3660e6973e8d) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361636610', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361636858', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361637850', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361638559', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361638865', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361640948', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361641797', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361730239', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361730445', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361730728', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361730925', '0', '0', 'TrinityCore rev. 2013-02-23 18:03:18 +0300 (4512c625465e+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361798832', '0', '0', 'TrinityCore rev. 2013-02-24 21:21:15 +0300 (9eb96ca4b2a4) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361798953', '601', '1', 'TrinityCore rev. 2013-02-24 21:21:15 +0300 (9eb96ca4b2a4) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361804989', '1201', '1', 'TrinityCore rev. 2013-02-24 21:21:15 +0300 (9eb96ca4b2a4) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361810249', '0', '0', 'TrinityCore rev. 2013-02-25 18:42:08 +0300 (e3a54e615cf9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361810381', '4201', '0', 'TrinityCore rev. 2013-02-25 18:42:08 +0300 (e3a54e615cf9) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361971624', '0', '0', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361986237', '619', '1', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1361988104', '0', '0', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362077595', '614', '0', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362078359', '3001', '1', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362134415', '0', '0', 'TrinityCore rev. 2013-02-27 15:34:01 +0300 (70243b506ddf+) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362300544', '0', '0', 'TrinityCore rev. 4eed1e5c512e 2013-03-01 13:38:26 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362324696', '626', '1', 'TrinityCore rev. 4eed1e5c512e+ 2013-03-01 13:38:26 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362326572', '1210', '0', 'TrinityCore rev. 1346def52fd2 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362329800', '600', '0', 'TrinityCore rev. 1346def52fd2 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362340960', '616', '1', 'TrinityCore rev. 1346def52fd2+ 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362343911', '0', '0', 'TrinityCore rev. 1346def52fd2+ 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362343962', '0', '0', 'TrinityCore rev. 1346def52fd2+ 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362344053', '0', '0', 'TrinityCore rev. 1346def52fd2+ 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362344783', '0', '0', 'TrinityCore rev. 1346def52fd2+ 2013-03-03 18:52:29 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362598813', '619', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362599941', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362600125', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362600260', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362600596', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362603412', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362605013', '0', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362605110', '4200', '0', 'TrinityCore rev. 166b3f776e38 2013-03-04 22:49:07 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362682500', '0', '0', 'TrinityCore rev. 7d6fabe8822d 2013-03-07 21:23:16 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362683232', '0', '0', 'TrinityCore rev. 7d6fabe8822d 2013-03-07 21:23:16 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362749996', '0', '0', 'TrinityCore rev. 06018ea6fc0f 2013-03-08 09:25:32 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362759364', '0', '0', 'TrinityCore rev. 06018ea6fc0f 2013-03-08 09:25:32 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1362819536', '0', '0', 'TrinityCore rev. 7014ce71b94e 2013-03-09 11:46:40 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363107548', '0', '0', 'TrinityCore rev. 3f6714ac36b3 2013-03-12 01:29:42 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363112613', '1212', '0', 'TrinityCore rev. 3f6714ac36b3 2013-03-12 01:29:42 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363116921', '610', '1', 'TrinityCore rev. 3f6714ac36b3 2013-03-12 01:29:42 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363117650', '0', '0', 'TrinityCore rev. 3f6714ac36b3 2013-03-12 01:29:42 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363117857', '0', '0', 'TrinityCore rev. 3f6714ac36b3 2013-03-12 01:29:42 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363638405', '0', '0', 'TrinityCore rev. 6c4b34cc5200 2013-03-18 13:39:28 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363710671', '606', '0', 'TrinityCore rev. 6c4b34cc5200 2013-03-18 13:39:28 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363756259', '0', '0', 'TrinityCore rev. 6c4b34cc5200 2013-03-18 13:39:28 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1363891246', '1215', '1', 'TrinityCore rev. 6c4b34cc5200 2013-03-18 13:39:28 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364139122', '0', '0', 'TrinityCore rev. 765fe5682a39+ 2013-03-23 01:01:06 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364240379', '0', '0', 'TrinityCore rev. 74028a531a4b+ 2013-03-25 21:45:27 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364241430', '0', '0', 'TrinityCore rev. 74028a531a4b+ 2013-03-25 21:45:27 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364575598', '0', '0', 'TrinityCore rev. b0604616cbef+ 2013-03-27 18:32:08 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364630260', '0', '0', 'TrinityCore rev. a988ab6c9b01+ 2013-03-29 19:28:04 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364630369', '0', '0', 'TrinityCore rev. a988ab6c9b01+ 2013-03-29 19:28:04 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364748235', '0', '0', 'TrinityCore rev. c8614e90731d 2013-03-31 12:46:21 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364752809', '0', '0', 'TrinityCore rev. c8614e90731d 2013-03-31 12:46:21 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364843223', '613', '0', 'TrinityCore rev. c8614e90731d 2013-03-31 12:46:21 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1364844147', '4201', '1', 'TrinityCore rev. c8614e90731d 2013-03-31 12:46:21 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365097887', '0', '0', 'TrinityCore rev. 26b9be25b32d 2013-04-04 21:26:57 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365154009', '0', '0', 'TrinityCore rev. 26b9be25b32d 2013-04-04 21:26:57 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365180876', '1816', '2', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365188398', '1207', '1', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365236279', '0', '0', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365236991', '0', '0', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365237198', '2402', '1', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365247320', '610', '1', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365263551', '0', '0', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365264585', '4210', '0', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365272730', '0', '0', 'TrinityCore rev. 1211ea4fe535 2013-04-05 13:32:49 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365275860', '3012', '1', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365326367', '0', '0', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365326782', '600', '1', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365439745', '0', '0', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365447074', '0', '0', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365448134', '0', '0', 'TrinityCore rev. b52206520654+ 2013-04-06 12:26:54 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365451031', '0', '0', 'TrinityCore rev. c9fd1c08c305 2013-04-08 23:35:10 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365451209', '1201', '1', 'TrinityCore rev. c9fd1c08c305 2013-04-08 23:35:10 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365452553', '0', '0', 'TrinityCore rev. c9fd1c08c305 2013-04-08 23:35:10 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365535228', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365536519', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365536617', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365536997', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365537165', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365537437', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365538005', '0', '0', 'TrinityCore rev. 04f619fec60c+ 2013-04-09 22:17:03 +0400 (mmaps branch) (Win32, Release)');
INSERT INTO `uptime` VALUES ('1', '1365538096', '0', '0', 'TrinityCore rev. c9fd1c08c305 2013-04-08 23:35:10 +0400 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365703190', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365704120', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365705466', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365709863', '4804', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365793694', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365793747', '41402', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365835878', '607', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365842132', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365842388', '37800', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365882412', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365883267', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365883501', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1365884166', '33469', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366003510', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366056920', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366057507', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366126860', '0', '0', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366139239', '2410', '1', 'TrinityCore rev. fb0af0faa90f+ 2013-04-11 20:28:45 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366228411', '33613', '1', 'TrinityCore rev. d0114aca64c0+ 2013-04-17 12:48:40 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366306369', '0', '0', 'TrinityCore rev. d0114aca64c0+ 2013-04-17 12:48:40 +0300 (master branch) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366403518', '0', '0', 'TrinityCore rev. d0114aca64c0+ 2013-04-17 12:48:40 +0300 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366463592', '0', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366475264', '0', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366481798', '40206', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366523617', '1204', '1', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366548231', '0', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366548354', '9603', '1', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366558410', '0', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366558582', '0', '0', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366558829', '1200', '1', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366573829', '2400', '1', 'TrinityCore rev. 5e2d3ac20909+ 2013-04-20 12:50:59 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366652240', '0', '0', 'TrinityCore rev. 5bb3e36b1b37+ 2013-04-22 20:28:54 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366652681', '2400', '1', 'TrinityCore rev. 5bb3e36b1b37+ 2013-04-22 20:28:54 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366800464', '0', '0', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366817622', '603', '0', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366885041', '0', '0', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366914894', '4204', '1', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366919330', '1205', '1', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366921217', '0', '0', 'TrinityCore rev. e3efcdfde162+ 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366922929', '612', '1', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1366924605', '0', '0', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367032758', '612', '1', 'TrinityCore rev. e3efcdfde162 2013-04-24 14:29:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367064296', '0', '0', 'TrinityCore rev. 148338b86b7a+ 2013-04-26 22:18:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367080437', '632', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367082630', '1249', '3', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367129004', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367131148', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367135819', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367137366', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367137475', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367169158', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367169518', '600', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367171312', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367171670', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367172103', '0', '0', 'TrinityCore rev. 543c4e4b604f+ 2013-04-27 20:05:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367258355', '1210', '1', 'TrinityCore rev. 07e6f8022cbf+ 2013-04-29 14:26:58 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367260114', '0', '0', 'TrinityCore rev. 07e6f8022cbf+ 2013-04-29 14:26:58 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367260828', '0', '0', 'TrinityCore rev. 07e6f8022cbf+ 2013-04-29 14:26:58 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367263455', '612', '1', 'TrinityCore rev. dc73c7d97555+ 2013-04-28 11:59:50 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367264977', '31209', '1', 'TrinityCore rev. dc73c7d97555+ 2013-04-28 11:59:50 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367434775', '0', '0', 'TrinityCore rev. f9bfcc66bf58 2013-04-30 19:38:10 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367437482', '30000', '1', 'TrinityCore rev. f9bfcc66bf58 2013-04-30 19:38:10 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367520768', '0', '0', 'TrinityCore rev. b411fbdf24f1 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367520937', '0', '0', 'TrinityCore rev. b411fbdf24f1 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367520973', '1200', '1', 'TrinityCore rev. b411fbdf24f1 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367522739', '13201', '1', 'TrinityCore rev. b411fbdf24f1 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367593557', '0', '0', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367595207', '1801', '1', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367597117', '1201', '1', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367690451', '1209', '1', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367859538', '0', '0', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367860455', '0', '0', 'TrinityCore rev. b411fbdf24f1+ 2013-05-02 22:40:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367861294', '0', '0', 'TrinityCore rev. d30d7b6c2312+ 2013-05-05 22:15:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367861438', '601', '0', 'TrinityCore rev. d30d7b6c2312+ 2013-05-05 22:15:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367877035', '0', '0', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367877621', '601', '7', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367951376', '1208', '2', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1367953162', '1209', '1', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368018829', '0', '0', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368019166', '600', '1', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368019986', '1800', '1', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368031080', '0', '0', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368031492', '0', '0', 'TrinityCore rev. 37ef745f80ce 2013-05-07 01:07:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368039529', '0', '0', 'TrinityCore rev. 7799f54d7b88+ 2013-05-08 00:21:03 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368039902', '1200', '1', 'TrinityCore rev. 7799f54d7b88+ 2013-05-08 00:21:03 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368041771', '1801', '2', 'TrinityCore rev. 7799f54d7b88+ 2013-05-08 00:21:03 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368122032', '0', '0', 'TrinityCore rev. 46a7eacc7459 2013-05-09 21:25:23 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368122162', '0', '0', 'TrinityCore rev. 46a7eacc7459 2013-05-09 21:25:23 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368122999', '1200', '1', 'TrinityCore rev. 46a7eacc7459 2013-05-09 21:25:23 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368380328', '614', '1', 'TrinityCore rev. d0c183436f11 2013-05-12 00:26:51 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368565048', '1815', '1', 'TrinityCore rev. 4850bc12b4be+ 2013-05-14 23:10:08 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368626620', '0', '0', 'TrinityCore rev. 4850bc12b4be+ 2013-05-14 23:10:08 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368628042', '601', '0', 'TrinityCore rev. 4850bc12b4be+ 2013-05-14 23:10:08 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368809795', '43212', '1', 'TrinityCore rev. 4850bc12b4be+ 2013-05-14 23:10:08 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368885884', '0', '0', 'TrinityCore rev. 4850bc12b4be+ 2013-05-14 23:10:08 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368953713', '0', '0', 'TrinityCore rev. 9d81972e2240+ 2013-05-15 00:18:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368954057', '0', '0', 'TrinityCore rev. 9d81972e2240+ 2013-05-15 00:18:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368954706', '605', '1', 'TrinityCore rev. 9d81972e2240+ 2013-05-15 00:18:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1368956525', '0', '0', 'TrinityCore rev. 91819159b698+ 2013-05-19 13:33:17 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369000289', '614', '1', 'TrinityCore rev. 3129d9b669ba+ 2013-05-20 01:35:39 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369070594', '0', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369078018', '604', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369079322', '1800', '1', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369110104', '0', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369156683', '0', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369157504', '0', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369160618', '601', '0', 'TrinityCore rev. c419ce87fea2+ 2013-05-20 20:40:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369163350', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369164220', '1813', '1', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369212867', '602', '1', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369215348', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369235897', '601', '1', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369237103', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369238712', '2401', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369256682', '1819', '1', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369686491', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369686694', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369686857', '0', '0', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369686966', '600', '1', 'TrinityCore rev. 56bbee3a7f4f+ 2013-05-20 23:23:26 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369688067', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369688143', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369688289', '3000', '2', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369737721', '18021', '2', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369755775', '5405', '2', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369761622', '10805', '3', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369772567', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369773054', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369773276', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369773551', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369774610', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369774844', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369775272', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369775380', '28201', '1', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369803723', '1208', '1', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369805768', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369806313', '15000', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369823208', '601', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369823993', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369824322', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369824338', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369824647', '15600', '3', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369840686', '4204', '3', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369846181', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369853215', '0', '0', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1369931030', '6602', '3', 'TrinityCore rev. f133cb55fea4 2013-05-25 13:27:22 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370079097', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370083431', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370083816', '4204', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370088663', '3608', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370093094', '609', '3', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370094040', '608', '2', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370094775', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370094823', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370095101', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370095432', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370095639', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370095771', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370096242', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370096495', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370096583', '0', '0', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370097125', '3600', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370101287', '7203', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370113610', '34805', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370202911', '2415', '1', 'TrinityCore rev. a5e7bf761f78 2013-06-01 10:33:28 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370292414', '687', '1', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370293525', '0', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370293926', '0', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370293971', '0', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370326279', '0', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370327179', '601', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370328519', '0', '0', 'TrinityCore rev. 95822c7d8f68 2013-06-04 00:24:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370330353', '43210', '1', 'TrinityCore rev. df5a90e49863 2013-06-04 10:42:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370373662', '1212', '1', 'TrinityCore rev. df5a90e49863 2013-06-04 10:42:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370375162', '0', '0', 'TrinityCore rev. df5a90e49863 2013-06-04 10:42:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370379833', '0', '0', 'TrinityCore rev. df5a90e49863 2013-06-04 10:42:27 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370381321', '0', '0', 'TrinityCore rev. 43956b5b81c7 2013-06-05 00:54:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370431745', '0', '0', 'TrinityCore rev. 43956b5b81c7 2013-06-05 00:54:35 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370434090', '0', '0', 'TrinityCore rev. 3f5084ba61dc 2013-06-05 15:45:25 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370470842', '36013', '1', 'TrinityCore rev. 8aa71a93a1a8+ 2013-06-06 01:31:18 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370510262', '5411', '1', 'TrinityCore rev. 2d6be4010eab 2013-06-06 12:20:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370521206', '613', '1', 'TrinityCore rev. 2d6be4010eab+ 2013-06-06 12:20:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370538356', '6627', '1', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370598208', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370622137', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370633158', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370633617', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370633730', '601', '1', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370634584', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370635063', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370637981', '1202', '1', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370640038', '0', '0', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370640418', '601', '1', 'TrinityCore rev. 60b977a83c68+ 2013-06-06 16:35:09 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370642762', '610', '1', 'TrinityCore rev. cce478c33b38+ 2013-06-06 18:07:06 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370676265', '1202', '1', 'TrinityCore rev. cce478c33b38+ 2013-06-06 18:07:06 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370687343', '1240', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370688703', '606', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370689788', '1801', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370692025', '0', '0', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370692438', '601', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370693310', '601', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370694524', '1201', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370696732', '3003', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370700434', '0', '0', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370700839', '65401', '1', 'TrinityCore rev. cc6e59f49e16 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370772457', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370772961', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370773544', '601', '1', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370806664', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370807755', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370808154', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370809062', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370810138', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370810516', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370810630', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370810956', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370811402', '0', '0', 'TrinityCore rev. cc6e59f49e16+ 2013-06-08 13:44:52 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370852092', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370852407', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370852574', '5401', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370858500', '4821', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370889722', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370964564', '1815', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370979957', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370981135', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370981546', '600', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370982434', '1200', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370983740', '601', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1370985187', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371026543', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371027200', '6001', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371046509', '2408', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371049504', '1203', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371051311', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371051878', '1800', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371069540', '1205', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371110620', '3014', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371117709', '600', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371119176', '601', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371120553', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371128119', '22201', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371156448', '2401', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371241696', '6608', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371286443', '615', '1', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371287120', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371287867', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371288551', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371288834', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371335853', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371386096', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371387438', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371387687', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371393651', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371394062', '1801', '1', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371397160', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371397725', '0', '0', 'TrinityCore rev. 2a0cb5f9dec7+ 2013-06-10 01:08:53 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371425433', '0', '0', 'TrinityCore rev. 5935bdf2aa01+ 2013-06-17 01:16:48 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371453836', '4810', '1', 'TrinityCore rev. 5935bdf2aa01+ 2013-06-17 01:16:48 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371495959', '0', '0', 'TrinityCore rev. 5935bdf2aa01+ 2013-06-17 01:16:48 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371496540', '1800', '0', 'TrinityCore rev. 5935bdf2aa01+ 2013-06-17 01:16:48 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371503271', '0', '0', 'TrinityCore rev. 5935bdf2aa01+ 2013-06-17 01:16:48 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371513210', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371513272', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371544939', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371548207', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371548303', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371550607', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371552514', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371552616', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371553134', '1801', '1', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371555522', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371556555', '1800', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371558793', '27601', '1', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371586838', '1202', '1', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371588820', '1801', '1', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371591460', '0', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371630956', '3602', '0', 'TrinityCore rev. c7c0e40e99c5+ 2013-06-17 03:21:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371675455', '2415', '1', 'TrinityCore rev. 09972c1ec307+ 2013-06-19 12:28:32 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371733449', '0', '0', 'TrinityCore rev. 8795c34539e1+ 2013-06-20 15:22:37 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371734300', '0', '0', 'TrinityCore rev. 8795c34539e1+ 2013-06-20 15:22:37 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371734718', '601', '1', 'TrinityCore rev. 8795c34539e1+ 2013-06-20 15:22:37 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371749912', '3016', '1', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371753755', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371761746', '622', '1', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371806749', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371807577', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371840808', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371841688', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371907381', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371928628', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1371930362', '1201', '1', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372011567', '1816', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372013627', '0', '0', 'TrinityCore rev. 22547315658b+ 2013-06-20 20:44:21 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372064900', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372065185', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372065368', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372065950', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372066081', '1801', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372068454', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372069349', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372070400', '7201', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372084897', '2404', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372087423', '3001', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372090988', '601', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372092108', '1201', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372097158', '0', '0', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372101040', '3610', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372152545', '1215', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372154272', '4801', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372160876', '6635', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372171526', '1810', '1', 'TrinityCore rev. 2dbf9dd5e336+ 2013-06-24 11:17:01 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372188659', '1820', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372191823', '623', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372195114', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372196102', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372236146', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372237064', '1218', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372239084', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372244195', '2406', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372261953', '613', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372263503', '1223', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372271648', '3602', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372275577', '1203', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372279403', '602', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372281902', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372282433', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372283339', '601', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372321298', '618', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372360426', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372362962', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372367077', '613', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372367753', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372368420', '33001', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372422519', '1813', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372440202', '0', '0', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372440710', '601', '1', 'TrinityCore rev. fdc281a4bf47+ 2013-06-24 13:06:45 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372490713', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372513389', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372514658', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372514698', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372514745', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372514974', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372515372', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372523261', '615', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372524311', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372524932', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372525153', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372525418', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372525551', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372526428', '1203', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372527914', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372528070', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372528260', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372528380', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372528985', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372529062', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372529364', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372529575', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372529803', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372530008', '600', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372530756', '601', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372532635', '3601', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372536846', '3001', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372577885', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372594795', '1812', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372598383', '601', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372604811', '620', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372630516', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372661832', '3615', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372666501', '3008', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372670132', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372688069', '3017', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372692479', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372697360', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372716996', '6036', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372723447', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372758130', '614', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372758819', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372765643', '637', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372766922', '2406', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372775023', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372783568', '621', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372785956', '600', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372794326', '1809', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372799777', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372801972', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372803025', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372836395', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372837040', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372843093', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372858667', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372863021', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372863179', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372867850', '624', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372868641', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372869636', '601', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372870965', '601', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372878048', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372878511', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372881606', '3014', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372958998', '9019', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372968798', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372969433', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1372971011', '1231', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373001145', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373001600', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373019445', '1230', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373037209', '1244', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373041877', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373054362', '1810', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373106335', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373120268', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373120689', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373120869', '600', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373132562', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373133634', '604', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373138161', '1208', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373139995', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373180294', '2401', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373183700', '0', '0', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373317945', '2424', '1', 'TrinityCore rev. 884813b8ca08+ 2013-06-29 10:12:55 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373366636', '0', '0', 'TrinityCore rev. 2bc4ef5de2cf+ 2013-07-09 14:28:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373366860', '0', '0', 'TrinityCore rev. 2bc4ef5de2cf+ 2013-07-09 14:28:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373378476', '0', '0', 'TrinityCore rev. 2bc4ef5de2cf+ 2013-07-09 14:28:12 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373381042', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373400007', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373402661', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373402883', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373403062', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373403146', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373403748', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373404159', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373404854', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373492252', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373492510', '601', '1', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373493817', '600', '1', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373623289', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373623773', '0', '0', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373624761', '27001', '1', 'TrinityCore rev. 1405964e56ee 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373726349', '1831', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373737455', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373740639', '1826', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373744454', '1213', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373746880', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373787128', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373788552', '1802', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373792905', '610', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373794077', '3001', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373803380', '609', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373804221', '2401', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373806868', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373808914', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373818285', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373895216', '13813', '1', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373916818', '0', '0', 'TrinityCore rev. 1405964e56ee+ 2013-07-09 18:21:44 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1373996562', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374001466', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374001808', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374321212', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374323121', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374324089', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374324718', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374325597', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374328758', '1207', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374330330', '618', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374334607', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374334886', '13802', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374350762', '612', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374401619', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374402341', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374428190', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374435142', '702', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374438088', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374439055', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374442221', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374601755', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374602456', '1814', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374604938', '608', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374610849', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374611377', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374611800', '604', '1', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374680453', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374681748', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374682373', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374683374', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374683869', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374684153', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374685007', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374685369', '0', '0', 'TrinityCore rev. 6d85a905b63a+ 2013-07-14 11:54:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374693478', '609', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374695434', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374695483', '3001', '1', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374700416', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374701622', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374701967', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374780377', '1810', '1', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374931352', '0', '0', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374932993', '0', '0', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374933524', '600', '2', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374935446', '615', '2', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374936392', '1209', '3', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374937835', '629', '3', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1374938871', '0', '0', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374939196', '601', '2', 'TrinityCore rev. 2adb7668ee23+ 2013-07-24 21:30:13 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374947695', '0', '0', 'TrinityCore rev. 0535778b99d6 2013-07-27 20:04:07 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1374948644', '6600', '1', 'TrinityCore rev. 0535778b99d6 2013-07-27 20:04:07 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375007804', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1375008122', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1375008250', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1375041990', '0', '0', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375042237', '2404', '1', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375046281', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1375110971', '0', '0', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375112722', '625', '0', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375113687', '0', '0', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375113950', '601', '0', 'TrinityCore rev. 70447da9a4f5+ 2013-07-27 14:22:54 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375115249', '0', '0', 'TrinityCore rev. 95528249bed1+ 2013-07-28 23:57:22 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375115574', '0', '0', 'TrinityCore rev. 95528249bed1+ 2013-07-28 23:57:22 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375118411', '601', '0', 'TrinityCore rev. 95528249bed1+ 2013-07-28 23:57:22 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375215521', '1217', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375217391', '48606', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375266523', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375266714', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375296338', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375296876', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375297385', '3024', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375352373', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375352455', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375352951', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375370349', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375370706', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375371035', '601', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375371889', '1200', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375373324', '618', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375374033', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375375006', '1200', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375376900', '601', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375385099', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375385591', '609', '1', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375386345', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375387145', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375387681', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375388498', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375388932', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375389160', '0', '0', 'TrinityCore rev. 29034c05d097 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375439211', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('1', '1375466393', '613', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375467519', '3609', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375474150', '0', '0', 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1375474509', '1209', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375524597', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375525362', '608', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375526203', '607', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375527149', '607', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375529180', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375552676', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375553882', '609', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375563320', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375568525', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375569210', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375610953', '608', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375619456', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375620181', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375620752', '600', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375621833', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375622132', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375622472', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375622503', '0', '0', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('1', '1375648627', '614', '1', 'TrinityCore rev. 29034c05d097+ 2013-07-30 19:55:29 +0400 (master branch) (Win64, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1354907969', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('2', '1355856084', '0', '0', 'TrinityCore rev. 2012-12-06 09:38:39 +0400 (5876d741a84b) (Win32, RelWithDebInfo)');
INSERT INTO `uptime` VALUES ('2', '1356046274', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356046317', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356262612', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356262752', '0', '0', 'TrinityCore rev. 2012-12-20 02:03:53 +0400 (e0a4ea4062e9+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356712536', '5074', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356719961', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, MinSizeRel)');
INSERT INTO `uptime` VALUES ('2', '1356720080', '0', '0', 'TrinityCore rev. 2012-12-22 17:01:55 +0400 (3bffdbde5eb6+) (Win32, MinSizeRel)');

-- ----------------------------
-- Table structure for `vipek2`
-- ----------------------------
DROP TABLE IF EXISTS `vipek2`;
CREATE TABLE `vipek2` (
  `account` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vipek2
-- ----------------------------
