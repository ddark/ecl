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
-- Table structure for `character_rate`
-- ----------------------------
DROP TABLE IF EXISTS `character_rate`;
CREATE TABLE `character_rate` (
  `guid` int(11) NOT NULL,
  `rate` float NOT NULL DEFAULT '1',
  `insert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;