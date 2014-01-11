-- ----------------------------
-- Table structure for `world_battleground`
-- ----------------------------
DROP TABLE IF EXISTS `world_battleground`;
CREATE TABLE `world_battleground` (
  `BattleId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `MapId` smallint(5) NOT NULL DEFAULT '-1',
  `BattleTypeId` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `BattleBracket` tinyint(2) NOT NULL DEFAULT '0',
  `BattleLevelMin` tinyint(3) NOT NULL DEFAULT '0',
  `BattleLevelMax` tinyint(3) NOT NULL DEFAULT '0',
  `BattleIsArena` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `BattleIsRated` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `BattleTime` int(10) unsigned NOT NULL DEFAULT '0',
  `WinnerTeam` tinyint(3) NOT NULL DEFAULT '-1',
  `WinnerArenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `LooserArenaTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  `WinnerGuildId` int(10) unsigned NOT NULL DEFAULT '0',
  `LooserGuildId` int(10) unsigned NOT NULL DEFAULT '0',
  `WinnerCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `WinnerData` longtext NOT NULL,
  `LooserCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LooserData` longtext NOT NULL,
  `BattleDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BattleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
