DROP TABLE IF EXISTS `boss_history`;
CREATE TABLE `boss_history` (
  `Guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `GuildId` int(10) NOT NULL,
  `CreatureEntry` int(10) NOT NULL,
  `CreatureName` varchar(255) NOT NULL,
  `KillerCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `KillTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `KillData` longtext NOT NULL,
  `MapRaid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `MapId` smallint(6) unsigned NOT NULL DEFAULT '0',
  `MapName` varchar(255) NOT NULL,
  `MapSpawnMode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MapMaxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
