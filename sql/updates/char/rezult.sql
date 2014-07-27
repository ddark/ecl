DROP TABLE IF EXISTS `account_achievement`;
CREATE TABLE `account_achievement` (
  `id` int(10) unsigned NOT NULL,
  `achievement` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `account_achievement_progress`;
CREATE TABLE `account_achievement_progress` (
  `id` int(10) unsigned NOT NULL,
  `criteria` int(10) unsigned NOT NULL,
  `counter` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;DELETE FROM `account_achievement`;

INSERT INTO `account_achievement`
SELECT      `c`.`account`,
            `a`.`achievement`,
            `a`.`date`
FROM        `character_achievement` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`achievement`;

DELETE FROM `account_achievement_progress`;

INSERT INTO `account_achievement_progress`
SELECT      `c`.`account`,
            `a`.`criteria`,
            MAX(`a`.`counter`), /* can SUM() */
            `a`.`date`
FROM        `character_achievement_progress` `a`,
            `characters` `c`
GROUP BY    `c`.`account`,
            `a`.`criteria`;-- ----------------------------
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
ALTER TABLE `world_battleground`
CHANGE COLUMN `BattleIsRate` `BattleIsRated`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 AFTER `BattleIsArena`;DROP TABLE IF EXISTS `boss_history`;
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
DROP TABLE IF EXISTS `character_model`;
CREATE TABLE `character_model` (
  `guid` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `size` float unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;CREATE TABLE IF NOT EXISTS `custom_transmogrification` (
  `GUID` int(10) unsigned NOT NULL DEFAULT '0',
  `FakeEntry` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='version 3.0';
CREATE TABLE `custom_transmogrifications` (
	`GUID` INT(10) UNSIGNED NOT NULL COMMENT 'Item guidLow',
	`FakeEntry` INT(10) UNSIGNED NOT NULL COMMENT 'Item entry',
	`Owner` INT(10) UNSIGNED NOT NULL COMMENT 'Player guidLow',
	PRIMARY KEY (`GUID`)
)
COMMENT='version 4.0'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB;
REPLACE INTO `mail` (`id`, `messageType`, `stationery`, `mailTemplateId`, `sender`, `receiver`, `subject`, `body`, `has_items`, `expire_time`, `deliver_time`, `money`, `cod`, `checked`) VALUES (60003, 0, 41, 0, 0, 0, 'Money For You!', NULL, 0, 0, 0, 4294967295, 0, 1);
DROP TABLE IF EXISTS `character_npcbot`;
CREATE TABLE `character_npcbot` (
  `owner` int(10) default NULL,
  `entry` int(10) default NULL,
  `race` tinyint(3) default NULL,
  `class` tinyint(3) default NULL,
  `istank` tinyint(3) default NULL,
  PRIMARY KEY  (`owner`,`entry`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `world_instance`
-- ----------------------------
DROP TABLE IF EXISTS `world_instance`;
CREATE TABLE `world_instance` (
  `InstanceId` int(10) NOT NULL,
  `InstanceLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`InstanceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;DROP TABLE IF EXISTS `mail_external`;
CREATE TABLE `mail_external` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receiver` int(10) unsigned NOT NULL,
  `subject` varchar(200) NOT NULL DEFAULT 'Support Message',
  `message` varchar(200) NOT NULL DEFAULT '',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `item` int(10) unsigned NOT NULL DEFAULT '0',
  `item_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;-- ----------------------------
-- Table structure for `character_friend_chat`
-- ----------------------------
DROP TABLE IF EXISTS `character_friend_chat`;
CREATE TABLE `character_friend_chat` (
  `guid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;DROP TABLE IF EXISTS `world_mail`;
CREATE TABLE `world_mail` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `template_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sender` int(10) unsigned NOT NULL DEFAULT '0',
  `receiver` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` longtext NOT NULL,
  `body` longtext NOT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `cod` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE `world_mail`
MODIFY COLUMN `log_id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT FIRST ;
-- ----------------------------
-- Table structure for `character_multikill`
-- ----------------------------
DROP TABLE IF EXISTS `character_multikill`;
CREATE TABLE `character_multikill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of character_multikill
-- ----------------------------
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
