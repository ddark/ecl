SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `world_auction`
-- ----------------------------
DROP TABLE IF EXISTS `world_auction`;
CREATE TABLE `world_auction` (
  `ItemId` int(10) unsigned NOT NULL,
  `ItemCount` int(10) unsigned NOT NULL,
  `ItemStack` int(10) unsigned NOT NULL,
  `StartBind` int(10) unsigned NOT NULL,
  `BuyOut` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
