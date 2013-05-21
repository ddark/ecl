-- ----------------------------
-- Table structure for `world_instance`
-- ----------------------------
DROP TABLE IF EXISTS `world_instance`;
CREATE TABLE `world_instance` (
  `InstanceId` int(10) NOT NULL,
  `InstanceLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstanceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
