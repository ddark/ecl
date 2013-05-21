DROP TABLE IF EXISTS `world_coded`;
CREATE TABLE `world_coded` (
  `CodeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CodeData` varchar(255) NOT NULL,
  `CodeStart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CodeEnd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `MailSubject` varchar(200) NOT NULL,
  `MailText` varchar(200) NOT NULL,
  `MailMoney` int(10) NOT NULL DEFAULT '0',
  `MaxCountForCharacter` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxCountForAccount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxCountTotal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `world_coded_history`;
CREATE TABLE `world_coded_history` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CodeId` int(10) unsigned NOT NULL DEFAULT '0',
  `CharacterGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `AccountId` int(10) unsigned NOT NULL DEFAULT '0',
  `TimeActivated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `world_coded_items`;
CREATE TABLE `world_coded_items` (
  `CodeId` int(11) NOT NULL,
  `ItemId` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemCount` smallint(10) unsigned NOT NULL DEFAULT '1',
  `ItemClassMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemRaceMask` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CodeId`,`ItemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `world_coded`
ADD COLUMN `Comment`  varchar(255) NOT NULL AFTER `MaxCountTotal`;
ALTER TABLE `world_coded_items`
ADD COLUMN `Comment`  varchar(255) NOT NULL AFTER `ItemRaceMask`;
ALTER TABLE `world_coded_history`
ADD COLUMN `SessionIp`  varchar(32) NOT NULL AFTER `AccountId`;
