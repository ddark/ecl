DELETE FROM `creature_template` WHERE `entry` = 100124;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`,
`modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`,
`faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`,
`baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`,
`trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`,
`resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`,
`spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`,
`Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`,
`RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`)
VALUES
('100124', '0', '0', '0', '0', '0', '22750', '0', '0', '0', 'Tournament test', '', '', '0', '80', '80', '2', '35', '35', '1', '0', '0', '1', '0',
'315', '473', '0', '118', '1', '1500', '1500', '1', '0', '0', '0', '0', '0', '0', '0', '252', '378', '94', '7', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0',
'0', '1', '0', '0', '0', 'npc_tournaments_organizer', '12340');

-- ----------------------------
-- Table structure for `world_tournaments`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournaments`;
CREATE TABLE `world_tournaments` (
  `entry` int(11) NOT NULL,
  `level` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time_limit` int(11) NOT NULL DEFAULT '0',
  `say_start` int(11) unsigned NOT NULL DEFAULT '0',
  `say_win` int(11) unsigned NOT NULL DEFAULT '0',
  `say_lose` int(10) unsigned NOT NULL DEFAULT '0',
  `chest_id` int(10) unsigned NOT NULL DEFAULT '0',
  `point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `req_quest_id` int(10) unsigned NOT NULL DEFAULT '0',
  `kill_credit` int(10) unsigned NOT NULL DEFAULT '0',
  `menu_string` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`entry`,`level`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournaments
-- ----------------------------
INSERT INTO `world_tournaments` VALUES ('100124', '1', '30000', '0', '0', '0', '2850', '1', '0', '0', '0', 'Npc 100124, level 1, limit 30 sec.');
INSERT INTO `world_tournaments` VALUES ('100124', '2', '20000', '0', '0', '0', '3715', '1', '0', '0', '0', 'Npc 100124, level 2, limit 20 sec.');

-- ----------------------------
-- Table structure for `world_tournament_points`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournament_points`;
CREATE TABLE `world_tournament_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournament_points
-- ----------------------------
INSERT INTO `world_tournament_points` VALUES ('1', '0', '-13218', '249', '22', '1.34', 'Gurubashi Enter');
INSERT INTO `world_tournament_points` VALUES ('2', '0', '-13205', '275', '22', '4.37', 'Gurubashi Center');

-- ----------------------------
-- Table structure for `world_tournament_creature`
-- ----------------------------
DROP TABLE IF EXISTS `world_tournament_creature`;
CREATE TABLE `world_tournament_creature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tournament_entry` int(10) unsigned NOT NULL DEFAULT '0',
  `tournament_level` int(10) unsigned NOT NULL DEFAULT '0',
  `entry` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `from_point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_point_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of world_tournament_creature
-- ----------------------------
INSERT INTO `world_tournament_creature` VALUES ('1', '100124', '1', '15931', '1', '1', '2', '0', 'Tour. 100124, level 1, npc: Grobbulus');
INSERT INTO `world_tournament_creature` VALUES ('2', '100124', '2', '6', '1', '1', '2', '0', 'Tour. 100124, level 2, npc: Kobold');
