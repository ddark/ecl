--reverting
UPDATE `creature_template` SET `ScriptName`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `ScriptName`='npc_raging_ghoul' WHERE `entry`=36940;
UPDATE `creature_template` SET `ScriptName`='npc_risen_witch_doctor' WHERE `entry`=36941;
UPDATE `creature_template` SET `ScriptName`='npc_spiritual_reflection' WHERE `entry`=37068;
UPDATE `creature_template` SET `ScriptName`='npc_jaina_or_sylvanas_hor' WHERE `entry` IN (37221,37223);
UPDATE `creature_template` SET `ScriptName`='boss_falric' WHERE `entry`=38112;
UPDATE `creature_template` SET `ScriptName`='boss_marwyn' WHERE `entry`=38113;
UPDATE `creature_template` SET `ScriptName`='npc_phantom_mage' WHERE `entry`=38172;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_footman' WHERE `entry`=38173;
UPDATE `creature_template` SET `ScriptName`='npc_ghostly_priest' WHERE `entry`=38175;
UPDATE `creature_template` SET `ScriptName`='npc_tortured_rifleman' WHERE `entry`=38176;
UPDATE `creature_template` SET `ScriptName`='npc_shadowy_mercenary' WHERE `entry`=38177;
UPDATE `creature_template` SET `ScriptName`='npc_phantom_hallucination' WHERE `entry`=38567;
UPDATE `creature_template` SET `Scriptname`='npc_jaina_or_sylvanas_escape_hor' WHERE `entry` IN (36955,37554);
UPDATE `creature_template` SET `Scriptname`='' WHERE `entry`=36954;
UPDATE `areatrigger_scripts` SET `ScriptName`='at_hor_waves_restarter' WHERE `entry`=5697;
INSERT INTO `areatrigger_scripts` VALUES ('5605', 'at_shadow_throne');
UPDATE `areatrigger_scripts` SET `ScriptName`='at_hor_intro_start' WHERE `entry`=5632;
UPDATE `instance_template` SET `script`='instance_halls_of_reflection' WHERE `map`=668;
DELETE FROM `gameobject_template` WHERE `entry` = 500001;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=72830;
UPDATE `creature_template` SET `Scriptname`='npc_abon' WHERE `entry`=37069;
DELETE FROM `script_waypoint` WHERE `entry` IN(36955,37554,37226);
DELETE FROM `gameobject` WHERE `map` = 668 AND (`guid` BETWEEN 400100 AND 400109);
DELETE FROM `areatrigger_scripts` WHERE `entry`=5740;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (69708,70194,69784,70224,70225,69768,69767);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 3, 69708, 0, 0, 31, 0, 3, 36954, 0, 0, 0, 0, '', 'Spell Ice Prison only hits Lich King'),
(13, 3, 70194, 0, 0, 31, 0, 3, 36954, 0, 0, 0, 0, '', 'Spell Dark Binding only hits Lich King'),
(13, 1, 69784, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Spell Destroy Wall only hits Ice Wall Target'),
(13, 1, 70224, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Spell Destroy Wall only hits Ice Wall Target'),
(13, 1, 70225, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Spell Destroy Wall only hits Ice Wall Target'),
(13, 1, 69768, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Spell Summon Ice Wall only hits Ice Wall Target'),
(13, 5, 69767, 0, 0, 31, 0, 3, 37014, 0, 0, 0, 0, '', 'Spell Summon Ice Wall only hits Ice Wall Target');

REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (36955, 0, 0, 0, 0, 0, 30867, 0, 0, 0, 'Lady Jaina Proudmoore', 289, '', 10909, 80, 80, 2, 1770, 1770, 2, 1, 1.14286, 0.8, 1, 346, 499, 0, 287, 7.5, 0, 0, 8, 33088, 0, 8, 0, 0, 0, 0, 0, 315, 468, 69, 7, 262144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 69708, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 500, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_jaina_or_sylvanas_escape_hor', 12340);
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (37554, 0, 0, 0, 0, 0, 30776, 0, 0, 0, 'Lady Sylvanas Windrunner', 289, '', 10909, 80, 80, 2, 1770, 1770, 2, 0.888888, 0.99206, 0.8, 1, 346, 499, 0, 287, 7.5, 1000, 0, 8, 33088, 0, 8, 0, 0, 0, 0, 0, 315, 468, 69, 7, 262144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 500, 100, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_jaina_or_sylvanas_escape_hor', 12340);
DELETE FROM `creature` WHERE `id`=36723;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(202301, 36723, 668, 3, 2, 0, 0, 5415.54, 2117.84, 707.778, 3.94444, 604800, 0, 0, 0, 0, 0, 0, 0, 0),
(400003, 36723, 668, 3, 1, 0, 0, 5415.54, 2117.84, 707.778, 3.94444, 604800, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 32832 WHERE `entry` = 36723;