-- -------------------------------------------------------- 
-- 2013_07_17_00_world_version.sql 
-- -------------------------------------------------------- 
UPDATE `version` SET `db_version`='TDB 335.52', `cache_id`=52 LIMIT 1;
 
 
-- -------------------------------------------------------- 
-- 2013_07_17_01_world_conditions.sql 
-- -------------------------------------------------------- 
-- Gossip Menu Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=21;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,21,518,0,0,27,0,10,3,0,0,'','Gossip text requires level 10 or higher'),
(14,21,519,0,0,27,0,10,2,0,0,'','Gossip text requires lower than level 10');
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=21;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,21,0,0,0,27,0,10,3,0,0,'','Gossip Option requires level 10 or higher'),
(15,21,1,0,0,9,0,6981,0,0,0,'','Gossip Option requires quest not complete');
 
 
-- -------------------------------------------------------- 
-- 2013_07_17_02_world_gossip.sql 
-- -------------------------------------------------------- 
-- Add SAI for Royal Historian Archesonus Quest 3702
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry`=8879;
DELETE FROM `smart_scripts` WHERE `entryorguid`=8879 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(8879, 0, 0, 1, 62, 0, 100, 0, 1563, 0, 0, 0, 15, 3702, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Royal Historian Archesonus - Gossip Option 0 - Complete quest 3702'),
(8879, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Royal Historian Archesonus - Gossip Option 0 - Close Gossip');
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1562,1563,1564,1565);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1562,2238), (1563,2239), (1564,2237), (1565,2236);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1561,1562,1563,1564,1565);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(1561,0,0, 'I am ready, Historian Archesonus.',1,1,1565),
(1562,0,0, 'Unbelievable! How dare they??',1,1,1563),
(1563,0,0, 'Of course I will help!',1,1,0),
(1564,0,0, 'Interesting, continue please.',1,1,1562),
(1565,0,0, 'That is tragic. How did this happen?',1,1,1564);
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1561;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1561,0,0,0,9,0,3702,0,0,0,'','Gossip Option requires quest taken');
 
 
-- -------------------------------------------------------- 
-- 2013_07_17_03_world_gossip.sql 
-- -------------------------------------------------------- 
-- Captain Vanessa Beltis
UPDATE `creature_template` SET `gossip_menu_id`=1641 WHERE `entry`=8380;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1641);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1641,2293);

-- Franclorn Forgewright 8888
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1664,1665,1666);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(1664,2316), (1665,2317), (1666,2318);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1663,1664,1665);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(1663,0,0, 'Amazing! I''ve never spoken to a ghost. I wish to learn!',1,1,1664),
(1664,0,0, 'Continue please.',1,1,1665),
(1665,0,0, 'Fascinating. Please, tell me more.',1,1,1666);

-- Ribbly Screwspigot
UPDATE `creature_template` SET `gossip_menu_id`=1970 WHERE `entry`=9543;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (1970);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1970,2643);

-- Arei "npc has two text, possible scripting required"
UPDATE `creature_template` SET `gossip_menu_id`=2063 WHERE `entry`=9598;
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (2063);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (2063,2726), (2063,2809);

-- Add SAI for Un'Goro Crystal Pylon Quests 4285, 4287, 4288
UPDATE `gameobject_template` SET `AIName`= 'SmartGameObjectAI',`ScriptName`= '' WHERE `entry` IN (164955,164957,164956);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (164955,164957,164956) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(164955, 1, 0, 0, 62, 0, 100, 0, 2177, 0, 0, 0, 15, 4285, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Northern Crystal Pylon - Gossip Option 0 - Complete quest 4285'),
(164957, 1, 0, 0, 62, 0, 100, 0, 2178, 0, 0, 0, 15, 4287, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Eastern Crystal Pylon - Gossip Option 0 - Complete quest 4287'),
(164956, 1, 0, 0, 62, 0, 100, 0, 2179, 0, 0, 0, 15, 4288, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Western Crystal Pylon - Gossip Option 0 - Complete quest 4288');
-- Gossip Menu
DELETE FROM `gossip_menu` WHERE `entry` IN (2177,2178,2179,2180,2181,2182);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2177,2810),(2177,2933),(2178,2810),(2178,2933),(2179,2810),(2179,2933),(2180,2811),(2181,2812),(2182,2813);
-- Gossip Options
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (2177,2178,2179);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(2177,0,0, 'I want to examine this pylon.',1,1,2181),
(2178,0,0, 'I want to examine this pylon.',1,1,2180),
(2179,0,0, 'I want to examine this pylon.',1,1,2182);
-- Gossip Options Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (2177,2178,2179);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,2177,0,0,0,9,0,4285,0,0,0,'','Gossip Option requires quest not complete'),
(15,2178,0,0,0,9,0,4287,0,0,0,'','Gossip Option requires quest not complete'),
(15,2179,0,0,0,9,0,4288,0,0,0,'','Gossip Option requires quest not complete');
 
 
-- -------------------------------------------------------- 
-- 2013_07_17_04_world_spell_script_names.sql 
-- -------------------------------------------------------- 
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_clone' WHERE `ScriptName`='spell_generic_clone';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_clone_weapon' WHERE `ScriptName`='spell_generic_clone_weapon';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_30pct_count_pct_from_max_hp' WHERE `ScriptName`='spell_gen_touch_the_nightmare';
UPDATE `spell_script_names` SET `ScriptName`='spell_gen_creature_permanent_feign_death' WHERE `ScriptName`='spell_creature_permanent_feign_death';
 
 
-- -------------------------------------------------------- 
-- 2013_07_18_00_world_conditions.sql 
-- -------------------------------------------------------- 
-- Fix There's Something About the Squire
UPDATE `conditions` SET `ConditionTarget`=1 WHERE  `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=63126  AND `ConditionTypeOrReference`=9;
 
 
-- -------------------------------------------------------- 
-- 2013_07_18_01_world_koralon.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_script_names` WHERE `spell_id` IN (66725,68161,66808,68160,66765,67333,66809,67331);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(66725, 'spell_koralon_meteor_fists'),
(68161, 'spell_koralon_meteor_fists'),
(66808, 'spell_flame_warder_meteor_fists'),
(68160, 'spell_flame_warder_meteor_fists'),
(66765, 'spell_koralon_meteor_fists_damage'),
(67333, 'spell_koralon_meteor_fists_damage'),
(66809, 'spell_koralon_meteor_fists_damage'),
(67331, 'spell_koralon_meteor_fists_damage');

DELETE FROM `spell_proc_event` WHERE `entry` IN (66808,68160);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(66808,0,0,0,0,0,0x4,0,0,0,0),
(68160,0,0,0,0,0,0x4,0,0,0,0);
 
 
-- -------------------------------------------------------- 
-- 2013_07_18_02_world_spell_script_names.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_script_names` WHERE `spell_id` IN (69051,69023,69048);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(69051, 'spell_devourer_of_souls_mirrored_soul'),
(69023, 'spell_devourer_of_souls_mirrored_soul_proc'),
(69048, 'spell_devourer_of_souls_mirrored_soul_target_selector');
 
 
-- -------------------------------------------------------- 
-- 2013_07_18_02_world_the_flesh_giant_slayer.sql 
-- -------------------------------------------------------- 
-- TEXT INSERTS
DELETE FROM `creature_text` WHERE `entry` IN (31301, 31428, 31306);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(31301, 0, 0, "You dare to think you have thwarted my will? That you have broken my plans?", 12, 0, 100, 25, 0, 0, "LK SAY 1"),
(31301, 1, 0, "You have accomplished nothing!", 12, 0, 100, 22, 0, 0, "LK SAY 2"),
(31301, 2, 0, "Your feeble resistance has only hastened your doom.", 12, 0, 100, 25, 0, 0, "LK SAY 3"),
(31301, 3, 0, "So spout your platitudes and flail until you are spent. In the end, you will be mine, and Morbidus will be the harbinger of your death!", 12, 0, 100, 22, 0, 0, "LK SAY 4"),
(31301, 4, 0, "Morbidus, show them what happens to those who defy the will of their king!", 12, 0, 100, 25, 0, 0, "LK SAY 5"),
(31428, 0, 0, "You will pay for what you've done! For the Argent Crusade!", 12, 0, 100, 0, 0, 0, "OLAKIN SAY 1"),
(31306, 0, 0, "Knights of the Ebon Blade, prepare for battle!", 12, 0, 100, 1, 0, 0, 'DHAKAR SAY 1');

-- ScriptName Updates
UPDATE `creature_template` SET `ScriptName`='npc_margrave_dhakar' WHERE `entry`=31306;
UPDATE `creature_template` SET `ScriptName`='npc_morbidus' WHERE `entry`=30698;

-- Template updates
UPDATE `creature_template` SET `faction_A`=2102, `faction_H`=2102, `exp`=2, `minlevel`=80, `maxlevel`=80, `unit_flags`=`unit_flags`|832, `speed_run`=0.99206, `VehicleId`=271 WHERE `entry`=30698; -- Morbidus
UPDATE `creature_template` SET `faction_A`=1770, `faction_H`=1770, `npcflag`=`npcflag`|1, `gossip_menu_id`=10060 WHERE `entry`=31306; -- Margrave Dhakar

UPDATE `creature_model_info` SET `bounding_radius`=0.465,`combat_reach`=7.5,`gender`=0 WHERE `modelid`=31176; -- Morbidus
UPDATE `creature_model_info` SET `bounding_radius`=0.3825,`combat_reach`=1.875,`gender`=0 WHERE `modelid`=27558; -- Margrave Dhakar

DELETE FROM `creature_template_addon` WHERE `entry` IN (30698, 31306);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30698,0,0,1,0, NULL), -- Morbidus
(31306,0,0,1,0, NULL); -- Margrave Dhakar
 
 
-- -------------------------------------------------------- 
-- 2013_07_18_03_world_equipment.sql 
-- -------------------------------------------------------- 
-- equipment for Margrave Dhakar
DELETE FROM `creature_equip_template` WHERE `entry` = 31306;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(31306, 1, 41371, 0, 0);
 
 
-- -------------------------------------------------------- 
-- 2013_07_19_00_world_misc.sql 
-- -------------------------------------------------------- 
ALTER TABLE `gameobject` CHANGE `phaseMask` `phaseMask` int(10) unsigned NOT NULL DEFAULT '1';
ALTER TABLE `creature` CHANGE `phaseMask` `phaseMask` int(10) unsigned NOT NULL DEFAULT '1';
 
 
-- -------------------------------------------------------- 
-- 2013_07_20_00_world_gameobject.sql 
-- -------------------------------------------------------- 
-- DTK instance entrance portals
DELETE FROM `gameobject` WHERE `guid`=151225;
SET @OGUID  := 6120; -- (need 3)
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+2;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192585,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1),
(@OGUID+1,192776,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1),
(@OGUID+2,192775,571,1,1,4774.532,-2020.723,232.3105,-1.579522,0,0,0.9999905,0.004363241,120,255,1);

-- Gundrak south instance entrance portals
SET @OGUID  := 5287; -- (need 2)
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+1;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,192635,571,1,1,6700.195,-4662.38,446.7864,3.909541,0,0,0.3746067,0.9271838,120,255,1),
(@OGUID+1,192170,571,1,1,6700.195,-4662.38,446.7864,3.909541,0,0,0.3746067,0.9271838,120,255,1);
 
 
-- -------------------------------------------------------- 
-- 2013_07_20_01_world_misc.sql 
-- -------------------------------------------------------- 
/*
 # Collection of Feedback-PatchFixes / 20.07.2013
 #
 # Including sql codestyle updates and check for accuracy. (one by one)
 # by FireEmerald / Thx @DDuarte for the base pull request.
 #
 # Including:
 # DB/Spell: Update: Correct Spell Power Coefficient (107.43%) for Tranquility | by lendan (@6232)
 # DB/LOS: Add: Ignore LOS for Ignite Horde Siege Engine | by dr-j (@6718)
 # DB/SmartAI: Update: Correct casted spell by Defias Rogue Wizard | by Rochet2 (@9976)
 # DB/Quest: Fix: Bloody Imp-ossible! (10924) | by Kirkhammett (@10276)
 # DB/Quest: Fix: Mistcaller Yngvar (14102) / Add missing event script and conditions. | (@3563)
 # DB/SmartAI: Update: Give quest credit for The Ring of Blood: The Final Challenge (9977) | by JunkyBulgaria (@7724)
 # DB/Waypoints: Add: Missing waypoints for Mmmrrrggglll | by Hobbilis (@9602)
 # DB/Conditions: Add: Missing conditions for Displacing Temporal Rift | by FireEmerald
*/

-- DB/Spell: Update: Correct Spell Power Coefficient (107.43%) for Tranquility | by lendan (@6232)
SET @SPELL          := 44203; -- Tranquility

UPDATE `spell_bonus_data` SET `direct_bonus` = 1.0743 WHERE `entry` = @SPELL;

-- DB/Quest: Fix: A Dire Situation (10506) | by Rohlik & Exodius (@6283)
SET @WOLF           := 20058; -- Bloodmaul Dire Wolf
SET @SPELL_INVIS    := 18950; -- Invisibility and Stealth Detection
SET @WOLF_TRIGGER   := 21176; -- Bloodmaul Dire Wolf Trigger
SET @SPELL_POWDER   := 36310; -- Rina's Diminution Powder

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @WOLF;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @WOLF;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @WOLF AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@WOLF, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 75, @SPELL_INVIS, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bloodmaul Dire Wolf - On spawn - Add Invisibility and Stealth Detection Aura on self');

DELETE FROM `event_scripts` WHERE `id` = 13584;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`) VALUES
(13584, 2, 8, @WOLF_TRIGGER);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL_POWDER;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,@SPELL_POWDER,0,31,1,3,@WOLF,0,0,0,'', 'Rina''s Diminution Powder can be used only on Bloodmaul Dire Wolf');

-- DB/LOS: Add: Ignore LOS for Ignite Horde Siege Engine | by dr-j (@6718)
SET @IGNITE         := 32979; -- Ignite Horde Siege Engine

DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = @IGNITE;
INSERT INTO `disables`(`sourceType`,`entry`,`flags`,`comment`) VALUES
(0,@IGNITE,64,'Ignore LOS on Ignite Horde Siege Engine');

-- DB/SmartAI: Update: Correct casted spell by Defias Rogue Wizard | by Rochet2 (@9976)
SET @WIZARD         :=   474; -- Rogue Wizard
SET @SPELL          := 13322; -- Frostbolt

UPDATE `smart_scripts` SET `action_param2`= @SPELL WHERE `entryorguid` = @WIZARD AND `source_type` = 0 AND `id` = 0 AND `link` = 0;

-- DB/Quest: Fix: Bloody Imp-ossible! (10924) | by Kirkhammett (@10276)
SET @CHASER         := 18884; -- Warp Chaser
SET @ZEPPIT         := 22484; -- Zeppit
SET @SPELL_INVIS    := 32942; -- Phasing Invisibility
SET @SPELL_CHARGE   := 37417; -- Warp Charge
SET @SPELL_BITE     := 32739; -- Venomous Bite
SET @SPELL_BLOOD    := 39244; -- Gather Warp Chaser Blood

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @CHASER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @CHASER;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @CHASER;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CHASER,0,0,0,11,0,100,0,0,0,0,0,11,@SPELL_INVIS,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Warp Chaser - On Spawn - Cast Phasing Invisibility'),
(@CHASER,0,1,0,0,0,100,0,500,2000,7000,15000,11,@SPELL_CHARGE,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Warp Chaser - In Combat - Cast Charge'),
(@CHASER,0,2,0,0,0,100,0,3000,5000,10000,15000,11,@SPELL_BITE,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Warp Chaser - In Combat - Cast Venomous Bite'),
(@CHASER,0,3,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@ZEPPIT,10,0,0,0,0,0, 'Warp Chaser - On Death - Set Data on Zeppit');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @ZEPPIT;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @ZEPPIT;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @ZEPPIT;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ZEPPIT,0,0,0,38,0,100,0,1,1,0,0,11,@SPELL_BLOOD,0,0,0,0,0,21,10,0,0,0,0,0,0, 'Zeppit - On Data Set - Cast on Master');

-- DB/Quest: Fix: Mistcaller Yngvar (14102) / Add missing event script and conditions. | (@3563)
SET @ENTRY          := 34965; -- Mistcaller Yngvar
SET @SPELL          := 66621; -- Summon the Mistcaller
SET @QUEST          := 14102; -- Mistcaller Yngvar (Quest)

DELETE FROM `event_scripts` WHERE `id` = 21997 AND `command` = 10;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(21997, 2, 10, @ENTRY, 120000, 0, 10181.96, 1183.417, 76.12115, 5.934119);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, @SPELL, 0, 0, 29, @ENTRY, 40, 0, 1, 0, "Cant use Mistcallers Charm within 40 yards of Yngvar"),
(17, 0, @SPELL, 0, 0, 28, @QUEST, 0, 0, 1, 0, "Cant use Mistcallers Charm, if player has quest objective completed, but not yet rewarded.");

-- DB/SmartAI: Update: Give quest credit for The Ring of Blood: The Final Challenge (9977) | by JunkyBulgaria (@7724)
SET @MOGOR  := 18069; -- Mogor <Hero of the Warmaul>
SET @QUEST  :=  9977; -- The Ring of Blood: The Final Challenge

DELETE FROM `smart_scripts` WHERE `entryorguid` = @MOGOR AND `source_type` = 0 AND `id` = 14;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@MOGOR, 0, 14, 0, 6, 0, 100, 1, 0, 0, 0, 0, 15, @QUEST, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'Mogor - On Death - Give Quest Credit');

-- DB/Waypoints: Add: Missing waypoints for Mmmrrrggglll | by Hobbilis (@9602)
SET @MURLOC         :=  15937; -- Mmmrrrggglll
SET @GUID           :=  41792;
SET @PATH           := 417920;

-- Set creature location
UPDATE `creature` SET `MovementType`=2,`position_x`=8869.872,`position_y`=-5775.960,`position_z`=0.405, `spawnDist`=0, `currentwaypoint`=1 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@GUID, @PATH, 1);

-- Waypoint Data
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 8880.688, -5754.608, 0.25531, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 8873.341, -5735.012, 0.43308, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 8862.790, -5722.625, 0.42263, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 8846.429, -5720.661, 0.49396, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 8836.920, -5726.737, 0.83736, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 8828.789, -5743.622, 0.82590, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 8818.041, -5755.890, 0.64673, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 8804.548, -5762.792, 0.51199, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 8791.789, -5762.271, 0.45083, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 8777.225, -5753.970, 0.55571, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 8776.860, -5738.229, 0.61609, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 8785.234, -5722.790, 0.75764, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 8786.402, -5701.790, 0.67103, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 8771.277, -5696.080, 0.67596, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 8758.604, -5694.220, 0.55669, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 8746.010, -5704.514, 0.50786, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 8735.815, -5722.942, 0.94607, 0, 0, 0, 0, 100, 0),
(@PATH, 18, 8720.269, -5730.856, 0.89406, 0, 0, 0, 0, 100, 0),
(@PATH, 19, 8706.965, -5730.076, 0.77437, 0, 0, 0, 0, 100, 0),
(@PATH, 20, 8693.575, -5720.971, 0.86999, 0, 0, 0, 0, 100, 0),
(@PATH, 21, 8679.183, -5710.540, 1.10842, 0, 0, 0, 0, 100, 0),
(@PATH, 22, 8656.022, -5704.337, 1.80973, 0, 0, 0, 0, 100, 0),
(@PATH, 23, 8640.976, -5691.507, 0.47690, 0, 0, 0, 0, 100, 0),
(@PATH, 24, 8635.418, -5689.706, 0.53144, 0, 0, 0, 0, 100, 0),
(@PATH, 25, 8620.438, -5687.679, 0.86486, 0, 0, 0, 0, 100, 0),
(@PATH, 26, 8601.687, -5688.443, 0.49338, 1.930, 36000, 0, 0, 100, 0),
(@PATH, 27, 8619.985, -5679.970, 0.75128, 0, 0, 0, 0, 100, 0),
(@PATH, 28, 8635.668, -5671.577, 0.53144, 0, 0, 0, 0, 100, 0),
(@PATH, 29, 8648.297, -5670.150, 0.49488, 0, 0, 0, 0, 100, 0),
(@PATH, 30, 8664.989, -5679.421, 0.55752, 0, 0, 0, 0, 100, 0),
(@PATH, 31, 8679.183, -5710.540, 1.10842, 0, 0, 0, 0, 100, 0),
(@PATH, 32, 8693.575, -5720.971, 0.86999, 0, 0, 0, 0, 100, 0),
(@PATH, 33, 8706.965, -5730.076, 0.77437, 0, 0, 0, 0, 100, 0),
(@PATH, 34, 8721.716, -5745.012, 0.62278, 0, 0, 0, 0, 100, 0),
(@PATH, 35, 8735.529, -5753.923, 1.24721, 0, 0, 0, 0, 100, 0),
(@PATH, 36, 8767.193, -5758.179, 0.50536, 0, 0, 0, 0, 100, 0),
(@PATH, 37, 8791.789, -5762.271, 0.45083, 0, 0, 0, 0, 100, 0),
(@PATH, 38, 8804.548, -5762.792, 0.51199, 0, 0, 0, 0, 100, 0),
(@PATH, 39, 8818.041, -5755.890, 0.64673, 0, 0, 0, 0, 100, 0),
(@PATH, 40, 8828.789, -5743.622, 0.82590, 0, 0, 0, 0, 100, 0),
(@PATH, 41, 8836.920, -5726.737, 0.83736, 0, 0, 0, 0, 100, 0),
(@PATH, 42, 8846.429, -5720.661, 0.49396, 0, 0, 0, 0, 100, 0),
(@PATH, 43, 8873.341, -5735.012, 0.43308, 0, 0, 0, 0, 100, 0),
(@PATH, 44, 8880.688, -5754.608, 0.25531, 6.105, 60000, 0, 0, 100, 0);

-- DB/Conditions: Add: Missing conditions for Displacing Temporal Rift | by FireEmerald
SET @PARASITE       := 10717; -- Temporal Parasite
SET @SPELL          := 16613; -- Displacing Temporal Rift
SET @QUEST          :=  4971; -- A Matter of Time

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = @SPELL;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, comment ) VALUES
(17, 0, @SPELL, 0, 0, 29, @PARASITE, 100, 0, 1, 0, "Cant use Temporal Displacer within 100 yards of Temporal Parasite"),
(17, 0, @SPELL, 0, 0, 28, @QUEST, 0, 0, 1, 0, "Cant use Temporal Displacer, if player has quest objective completed, but not yet rewarded");
 
 
-- -------------------------------------------------------- 
-- 2013_07_23_00_world_misc.sql 
-- -------------------------------------------------------- 
UPDATE `gameobject_template` SET `flags`=48, `ScriptName`='go_activation_crystal' WHERE `entry`=193611;

UPDATE `creature_template` SET `flags_extra`=130, `ScriptName`='npc_violet_hold_arcane_sphere' WHERE `entry`=30837;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=57930;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 57930, 0, 0, 32, 0, 16, 0, 0, 1, 0, 0, '', 'Spell Arcane Lightning hit players');
 
 
-- -------------------------------------------------------- 
-- 2013_07_23_02_world_creature_template.sql 
-- -------------------------------------------------------- 
UPDATE `creature_template` SET `InhabitType` = 5 WHERE `entry` = 10184;
 
 
-- -------------------------------------------------------- 
-- 2013_07_24_00_world_spell_script_names.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_script_names` WHERE `spell_id` IN (63310,50421,23780,33896,37594,37705,23551,23552,23572);
INSERT INTO `spell_script_names`(`spell_id`, `ScriptName`) VALUES
(63310,'spell_warl_glyph_of_shadowflame'),
(50421,'spell_dk_scent_of_blood'),
(23780,'spell_item_aegis_of_preservation'),
(33896,'spell_item_desperate_defense'),
(37594,'spell_pri_item_greater_heal_refund'),
(37705,'spell_pal_item_healing_discount'),
(23551,'spell_sha_item_lightning_shield'),
(23552,'spell_sha_item_lightning_shield_trigger'),
(23572,'spell_sha_item_mana_surge');
 
 
-- -------------------------------------------------------- 
-- 2013_07_24_01_world_spell_ranks_335.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_ranks` WHERE `first_spell_id` IN (
5923,
5952,
9452,
9453,
9799,
11069,
11070,
11071,
11078,
11083,
11094,
11095,
11100,
11103,
11108,
11115,
11119,
11124,
11151,
11160,
11170,
11175,
11180,
11185,
11189,
11190,
11207,
11210,
11213,
11222,
11232,
11237,
11242,
11247,
11252,
11255,
12163,
12281,
12282,
12284,
12285,
12286,
12287,
12289,
12290,
12295,
12297,
12298,
12299,
12300,
12301,
12308,
12311,
12312,
12313,
12317,
12318,
12319,
12320,
12321,
12322,
12324,
12329,
12700,
12797,
12834,
12862,
13705,
13706,
13709,
13712,
13713,
13715,
13732,
13733,
13741,
13742,
13743,
13754,
13958,
13960,
13975,
13976,
13981,
13983,
14057,
14076,
14079,
14082,
14113,
14128,
14138,
14144,
14156,
14158,
14162,
14165,
14168,
14171,
14174,
14179,
14186,
14520,
14521,
14522,
14523,
14531,
14747,
14748,
14749,
14750,
14889,
14892,
14898,
14901,
14908,
14909,
14910,
14911,
14912,
14913,
15058,
15257,
15259,
15260,
15270,
15273,
15274,
15275,
15318,
15337,
15392,
16035,
16038,
16039,
16040,
16043,
16086,
16089,
16173,
16176,
16178,
16179,
16180,
16181,
16182,
16184,
16187,
16194,
16252,
16254,
16255,
16256,
16258,
16259,
16261,
16262,
16266,
16462,
16487,
16493,
16513,
16538,
16578,
16757,
16814,
16819,
16821,
16833,
16836,
16845,
16850,
16858,
16880,
16896,
16909,
16929,
16934,
16940,
16942,
16947,
16966,
16972,
16998,
17002,
17003,
17050,
17056,
17063,
17069,
17074,
17104,
17106,
17111,
17118,
17123,
17322,
17485,
17778,
17783,
17788,
17793,
17804,
17810,
17815,
17917,
17927,
17954,
17959,
18094,
18096,
18119,
18126,
18135,
18174,
18179,
18182,
18213,
18218,
18271,
18427,
18459,
18462,
18530,
18551,
18692,
18694,
18697,
18703,
18705,
18709,
18731,
18754,
18767,
18769,
18827,
19159,
19168,
19184,
19255,
19286,
19290,
19295,
19370,
19376,
19407,
19416,
19421,
19426,
19454,
19461,
19464,
19485,
19498,
19507,
19549,
19552,
19559,
19572,
19578,
19583,
19590,
19598,
19609,
19616,
19621,
20042,
20049,
20060,
20096,
20101,
20111,
20117,
20127,
20138,
20143,
20174,
20177,
20196,
20205,
20210,
20224,
20234,
20237,
20244,
20254,
20257,
20262,
20335,
20359,
20468,
20487,
20500,
20502,
20504,
23584,
23785,
24443,
24968,
25956,
26022,
27789,
27811,
27839,
27900,
28574,
28996,
28999,
29062,
29074,
29082,
29140,
29187,
29192,
29206,
29438,
29441,
29447,
29590,
29593,
29598,
29721,
29723,
29759,
29787,
29834,
29836,
29888,
30054,
30060,
30143,
30160,
30242,
30288,
30293,
30299,
30319,
30664,
30672,
30675,
30802,
30812,
30816,
30864,
30867,
30872,
30881,
30892,
30894,
30902,
30919,
31122,
31124,
31130,
31208,
31211,
31216,
31221,
31226,
31228,
31234,
31244,
31380,
31569,
31571,
31574,
31579,
31584,
31638,
31641,
31656,
31667,
31670,
31674,
31679,
31682,
31785,
31822,
31825,
31828,
31833,
31837,
31844,
31848,
31850,
31858,
31866,
31871,
31876,
31879,
32043,
32381,
32385,
32477,
33142,
33150,
33158,
33167,
33186,
33191,
33201,
33213,
33221,
33589,
33592,
33597,
33600,
33603,
33851,
33853,
33859,
33872,
33879,
33881,
33886,
34151,
34293,
34297,
34453,
34455,
34462,
34466,
34475,
34482,
34485,
34491,
34494,
34497,
34500,
34506,
34753,
34908,
34935,
34948,
34950,
35029,
35100,
35104,
35363,
35446,
35541,
35578,
35691,
37116,
44378,
44394,
44397,
44400,
44404,
44442,
44445,
44449,
44543,
44546,
44557,
44566,
44745,
45234,
46854,
46859,
46865,
46867,
46908,
46910,
46913,
46945,
46951,
47195,
47198,
47201,
47220,
47230,
47236,
47245,
47258,
47266,
47294,
47507,
47509,
47516,
47535,
47558,
47562,
47569,
47573,
47580,
47586,
48384,
48389,
48409,
48411,
48432,
48483,
48488,
48492,
48496,
48506,
48516,
48532,
48535,
48539,
48962,
48963,
48965,
48977,
48978,
48979,
48985,
48987,
48988,
48997,
49004,
49006,
49013,
49015,
49018,
49023,
49024,
49027,
49032,
49036,
49042,
49137,
49140,
49145,
49146,
49149,
49175,
49182,
49186,
49188,
49189,
49200,
49202,
49208,
49217,
49219,
49220,
49223,
49224,
49226,
49455,
49467,
49471,
49588,
50040,
50117,
50187,
50365,
50384,
50391,
50685,
50880,
51099,
51123,
51179,
51459,
51466,
51468,
51474,
51480,
51483,
51521,
51523,
51525,
51528,
51554,
51556,
51560,
51562,
51625,
51627,
51632,
51634,
51664,
51672,
51682,
51685,
51692,
51698,
51708,
51745,
51883,
52234,
52783,
52795,
53137,
53175,
53178,
53180,
53182,
53186,
53203,
53215,
53221,
53228,
53234,
53241,
53252,
53256,
53262,
53290,
53295,
53298,
53302,
53375,
53379,
53380,
53409,
53427,
53450,
53481,
53483,
53486,
53501,
53511,
53514,
53527,
53551,
53554,
53556,
53569,
53583,
53590,
53620,
53660,
53671,
53695,
53709,
53754,
54037,
54117,
54347,
54639,
54747,
55061,
55091,
55107,
55129,
55620,
55666,
56314,
56333,
56339,
56342,
56636,
56927,
57470,
57810,
57849,
57873,
57878,
58414,
58872,
59088,
61154,
61216,
61680,
61682,
61686,
61689,
62097,
62758,
62759,
62764,
62905,
63117,
63156,
63349,
63370,
63373,
63410,
63504,
63534,
63625,
63646,
63730,
64127,
64353,
65661,
66799);
 
 
-- -------------------------------------------------------- 
-- 2013_07_24_02_world_trinity_strings.sql 
-- -------------------------------------------------------- 
DELETE FROM `trinity_string` WHERE entry = 850;
INSERT INTO `trinity_string` (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(850, '├─ Rank: %s (ID: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
 
 
-- -------------------------------------------------------- 
-- 2013_07_24_03_world_spell_proc_event_335.sql 
-- -------------------------------------------------------- 
ALTER TABLE `spell_proc_event`   
  CHANGE `entry` `entry` MEDIUMINT(8) DEFAULT 0  NOT NULL;

DELETE FROM `spell_proc_event` WHERE `entry` IN (
325,
905,
945,
8134,
8494,
8495,
10191,
10192,
10193,
10431,
10432,
11120,
12487,
12488,
12574,
12575,
12576,
12577,
12598,
12668,
12724,
12725,
12726,
12727,
12799,
12812,
12813,
12814,
12815,
12846,
12847,
12848,
12849,
12867,
12872,
12873,
12958,
12967,
12968,
12969,
12970,
12971,
12972,
12973,
12974,
13867,
14070,
14071,
14160,
14161,
14190,
14193,
14194,
14195,
14318,
14319,
14320,
14321,
14322,
14774,
15338,
15362,
15363,
16196,
16198,
16235,
16240,
16277,
16278,
16279,
16280,
16281,
16282,
16283,
16284,
16489,
16492,
16544,
16923,
16924,
16954,
16961,
17107,
17108,
17796,
17801,
17802,
17803,
18073,
18095,
18120,
19387,
19388,
19573,
20056,
20057,
20179,
20180,
20181,
20182,
20212,
20213,
20214,
20215,
20235,
20336,
20337,
20501,
20927,
20928,
23695,
24398,
25296,
25469,
25472,
25988,
27044,
27131,
27179,
27815,
27816,
28592,
28593,
29075,
29076,
29179,
29180,
29444,
29594,
29838,
30295,
30296,
30301,
30302,
30678,
30679,
30705,
30883,
30884,
30885,
30886,
31126,
31245,
31570,
31572,
31657,
31658,
31835,
31836,
31872,
31877,
31878,
32387,
32392,
32393,
32394,
32593,
32594,
33145,
33146,
33154,
33192,
33193,
33736,
33882,
33883,
34498,
34499,
34502,
34503,
34859,
34860,
34916,
34917,
34938,
34939,
34954,
35102,
35550,
35551,
35552,
35553,
43019,
43020,
44443,
44446,
44448,
44469,
44470,
44471,
44472,
44560,
44561,
45243,
45244,
46855,
46914,
46915,
46949,
47196,
47197,
47202,
47203,
47204,
47205,
47246,
47247,
47259,
47260,
47264,
47265,
47511,
47515,
47517,
47570,
47581,
47582,
48110,
48111,
48112,
48113,
48159,
48160,
48484,
48485,
48499,
48500,
48510,
48511,
48521,
48525,
48544,
48545,
48951,
48952,
49280,
49281,
49283,
49284,
49503,
49504,
49508,
49509,
49529,
49530,
49599,
49627,
49628,
49654,
49655,
50033,
50034,
50115,
50884,
50885,
50886,
50887,
51462,
51463,
51464,
51465,
51478,
51479,
51522,
51524,
51557,
51558,
51563,
51564,
51565,
51566,
51626,
51628,
51629,
51635,
51636,
51665,
51667,
51668,
51669,
51674,
51679,
51696,
51989,
52004,
52005,
52007,
52008,
52129,
52131,
52134,
52136,
52138,
52797,
52798,
52799,
52800,
53179,
53216,
53217,
53222,
53224,
53232,
53237,
53238,
53259,
53260,
53291,
53292,
53376,
53381,
53382,
53488,
53502,
53503,
53530,
53552,
53553,
53576,
53673,
53696,
53710,
53711,
54151,
54154,
54155,
54637,
54638,
54749,
55667,
56343,
56344,
56611,
56612,
56613,
56614,
56637,
56638,
56822,
56834,
56835,
57472,
57880,
57881,
57960,
58874,
59057,
59089,
61345,
61346,
61847,
62765,
63158,
63245,
63374,
63733,
63737,
64129,
66191,
66192,
66814,
66815,
66816,
66817);

DELETE FROM `spell_proc_event` WHERE `entry` IN (
324,
974,
1463,
5952,
9799,
11095,
11119,
11180,
11185,
11213,
11255,
12281,
12289,
12298,
12311,
12319,
12797,
12834,
12966,
13165,
13754,
13983,
14156,
14186,
14531,
14892,
15337,
16086,
16176,
16180,
16256,
16257,
16487,
16850,
16880,
16952,
16958,
17106,
17793,
18094,
18096,
18119,
19184,
19572,
20049,
20177,
20210,
20234,
20335,
20500,
20925,
27811,
29074,
29441,
29593,
29834,
30160,
30293,
30299,
30675,
30701,
30881,
31124,
31244,
31569,
31571,
31656,
31833,
31871,
31876,
32385,
33076,
33142,
33150,
33191,
33881,
34497,
34500,
34753,
34914,
34935,
34950,
35100,
35541,
41635,
44442,
44445,
44449,
44557,
45234,
46854,
46867,
46913,
46945,
47195,
47201,
47245,
47258,
47263,
47509,
47516,
47569,
47580,
48483,
48496,
48506,
48516,
48539,
48988,
49004,
49018,
49149,
49188,
49208,
49217,
49219,
49223,
49467,
50880,
51459,
51474,
51521,
51523,
51556,
51562,
51625,
51627,
51634,
51664,
51672,
51692,
51940,
52127,
52795,
53178,
53215,
53221,
53228,
53234,
53256,
53290,
53375,
53380,
53486,
53501,
53527,
53551,
53569,
53671,
53695,
53709,
54639,
54747,
55666,
56342,
56636,
57470,
57878,
58872,
59088,
61846,
62764,
63156,
63373,
63730,
64127,
65661,
66799,
-324,
-974,
-1463,
-5952,
-9799,
-11095,
-11119,
-11180,
-11185,
-11213,
-11255,
-12281,
-12289,
-12298,
-12311,
-12319,
-12797,
-12834,
-12966,
-13165,
-13754,
-13983,
-14156,
-14186,
-14531,
-14892,
-15337,
-16086,
-16176,
-16180,
-16256,
-16257,
-16487,
-16850,
-16880,
-16952,
-16958,
-17106,
-17793,
-18094,
-18096,
-18119,
-19184,
-19572,
-20049,
-20177,
-20210,
-20234,
-20335,
-20500,
-20925,
-27811,
-29074,
-29441,
-29593,
-29834,
-30160,
-30293,
-30299,
-30675,
-30701,
-30881,
-31124,
-31244,
-31569,
-31571,
-31656,
-31833,
-31871,
-31876,
-32385,
-33076,
-33142,
-33150,
-33191,
-33881,
-34497,
-34500,
-34753,
-34914,
-34935,
-34950,
-35100,
-35541,
-41635,
-44442,
-44445,
-44449,
-44557,
-45234,
-46854,
-46867,
-46913,
-46945,
-47195,
-47201,
-47245,
-47258,
-47263,
-47509,
-47516,
-47569,
-47580,
-48483,
-48496,
-48506,
-48516,
-48539,
-48988,
-49004,
-49018,
-49149,
-49188,
-49208,
-49217,
-49219,
-49223,
-49467,
-50880,
-51459,
-51474,
-51521,
-51523,
-51556,
-51562,
-51625,
-51627,
-51634,
-51664,
-51672,
-51692,
-51940,
-52127,
-52795,
-53178,
-53215,
-53221,
-53228,
-53234,
-53256,
-53290,
-53375,
-53380,
-53486,
-53501,
-53527,
-53551,
-53569,
-53671,
-53695,
-53709,
-54639,
-54747,
-55666,
-56342,
-56636,
-57470,
-57878,
-58872,
-59088,
-61846,
-62764,
-63156,
-63373,
-63730,
-64127,
-65661,
-66799);

INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(-324,0,0,0,0,0,0,0,0,0,3),
(-974,0,0,0,0,0,139944,0,0,0,3),
(-1463,0,0,0,0,0,0,1024,0,0,0),
(-5952,0,8,0,1,0,0,0,0,0,0),
(-9799,0,0,0,0,0,0,2,0,0,0),
(-11095,0,3,16,0,0,0,0,0,0,0),
(-11119,4,3,0,0,0,0,2,0,0,0),
(-11180,16,3,0,0,0,0,0,0,0,0),
(-11185,0,3,128,0,0,327680,0,0,0,0),
(-11213,0,3,0,0,0,0,0,0,0,0),
(-11255,0,3,16384,0,0,0,0,0,0,0),
(-12281,0,4,2858419268,4194565,0,0,0,0,0,6),
(-12289,0,4,2,0,0,0,0,0,0,0),
(-12298,0,0,0,0,0,0,112,0,0,0),
(-12311,0,4,2048,1,0,0,0,0,0,0),
(-12319,0,0,0,0,0,0,2,0,0,0),
(-12797,0,4,1024,0,0,0,0,0,0,0),
(-12834,0,0,0,0,0,0,2,0,0,0),
(-12966,0,0,0,0,0,0,65536,0,0,0),
(-13165,0,0,0,0,0,64,0,0,0,0),
(-13754,0,8,16,0,0,0,0,0,0,0),
(-13983,0,0,0,0,0,0,24,0,0,0),
(-14156,0,8,4063232,8,0,0,0,0,0,0),
(-14186,0,8,1082131720,6,0,0,2,0,0,1),
(-14531,0,0,0,0,0,0,2,0,0,0),
(-14892,0,6,268443136,65540,0,0,2,0,0,0),
(-15337,0,6,8396800,2,0,0,2,0,0,0),
(-16086,4,11,0,262144,0,196608,0,0,0,0),
(-16176,0,11,448,0,16,0,2,0,0,0),
(-16180,0,11,448,0,16,0,2,0,100,0),
(-16256,0,0,0,0,0,0,2,0,0,0),
(-16257,0,0,0,0,0,0,65536,0,0,0),
(-16487,0,0,0,0,0,0,2,0,0,0),
(-16850,0,7,4,0,0,0,0,0,0,0),
(-16880,72,7,103,58720258,0,0,2,0,0,0),
(-16952,0,7,233472,1024,262144,0,2,0,0,0),
(-16958,0,0,0,0,0,0,2,0,0,0),
(-17106,0,7,524288,0,0,0,0,0,0,0),
(-17793,0,5,1,0,0,0,0,0,0,0),
(-18094,0,5,10,0,0,0,0,0,0,0),
(-18096,0,5,256,8388608,0,0,2,0,0,0),
(-18119,0,5,0,8388608,0,0,0,0,0,0),
(-19184,0,9,16,8192,0,0,0,0,0,0),
(-19572,0,9,8388608,0,0,16384,0,0,0,0),
(-20049,0,0,0,0,0,0,2,0,0,0),
(-20177,0,0,0,0,0,0,67,0,0,0),
(-20210,0,10,3221225472,65536,0,0,2,0,0,0),
(-20234,0,10,32768,0,0,0,0,0,0,0),
(-20335,0,10,8388608,0,8,16,0,0,100,0),
(-20500,0,4,268435456,0,0,0,0,0,0,0),
(-20925,0,0,0,0,0,0,64,0,0,0),
(-27811,0,0,0,0,0,0,2,0,0,0),
(-29074,20,3,0,0,0,0,2,0,0,0),
(-29441,0,0,0,0,0,0,8,0,0,1),
(-29593,0,0,0,0,0,0,112,0,0,0),
(-29834,0,0,0,0,0,0,65536,0,0,0),
(-30160,0,0,0,0,0,0,2,0,0,0),
(-30293,0,5,897,8519872,0,0,0,0,0,0),
(-30299,126,0,0,0,0,0,0,0,0,0),
(-30675,0,11,3,0,0,0,0,0,0,0),
(-30701,28,0,0,0,0,664232,0,0,100,0),
(-30881,0,0,0,0,0,0,0,0,0,30),
(-31124,0,8,16777222,0,0,0,0,0,0,0),
(-31244,0,8,4063232,9,0,0,52,0,0,0),
(-31569,0,3,65536,0,0,0,0,0,0,0),
(-31571,0,3,0,34,0,16384,0,0,0,0),
(-31656,4,3,134217728,0,0,0,0,0,0,0),
(-31833,0,10,2147483648,0,0,0,0,0,0,0),
(-31871,0,10,16,0,0,16384,0,0,0,0),
(-31876,0,10,8388608,0,0,0,262144,0,0,0),
(-32385,0,5,1,262144,0,0,0,0,0,0),
(-33076,0,0,0,0,0,664232,0,0,0,0),
(-33142,0,0,0,0,0,0,2,0,0,0),
(-33150,0,0,0,0,0,0,2,0,0,0),
(-33191,0,6,32768,1024,64,0,0,0,0,0),
(-33881,0,0,0,0,0,0,2,0,0,0),
(-34497,0,0,0,0,0,0,2,0,0,0),
(-34500,0,0,0,0,0,0,2,0,0,0),
(-34753,0,6,6144,4,4096,0,2,0,0,0),
(-34914,0,6,8192,0,0,0,0,0,0,0),
(-34935,0,0,0,0,0,0,0,0,0,8),
(-34950,0,0,0,0,0,0,2,0,0,0),
(-35100,0,9,4096,0,1,0,0,0,0,0),
(-35541,0,0,0,0,0,8388608,0,0,0,0),
(-41635,0,0,0,0,0,664232,0,0,0,0),
(-44442,0,3,8388608,64,0,0,65536,0,0,1),
(-44445,0,3,19,69632,0,0,0,0,0,0),
(-44449,0,3,551686775,102472,0,0,2,0,0,0),
(-44557,0,3,32,0,0,0,0,0,0,0),
(-45234,0,0,0,0,0,0,2,0,0,0),
(-46854,0,0,0,0,0,0,2,0,0,0),
(-46867,0,0,0,0,0,0,2,0,0,0),
(-46913,0,4,64,1028,0,0,262144,0,0,0),
(-46945,0,4,0,65536,0,0,0,0,0,0),
(-47195,0,5,2,0,0,0,0,0,0,0),
(-47201,0,5,16393,262144,0,0,0,0,0,0),
(-47245,0,5,2,0,0,0,1,0,0,0),
(-47258,0,5,0,8388608,0,0,65536,0,0,0),
(-47263,32,5,0,0,0,0,2,0,0,20),
(-47509,0,0,0,0,0,0,2,0,0,0),
(-47516,0,6,6144,65536,0,0,0,0,0,0),
(-47569,0,6,16384,0,0,16384,0,0,0,0),
(-47580,0,6,0,0,64,0,65536,0,0,0),
(-48483,0,7,34816,1088,0,0,0,0,0,0),
(-48496,0,7,96,33554434,0,0,2,0,0,0),
(-48506,0,7,5,0,0,0,0,0,0,0),
(-48516,0,7,5,0,0,0,2,0,0,30),
(-48539,0,7,16,67108864,0,262144,0,0,0,0),
(-48988,0,0,0,0,0,0,2,0,0,0),
(-49004,0,0,0,0,0,0,51,0,0,0),
(-49018,0,15,20971520,0,0,0,0,0,0,0),
(-49149,0,15,6,131074,0,0,0,0,0,0),
(-49188,0,15,0,131072,0,0,0,0,0,0),
(-49208,0,15,4194304,65536,0,0,0,0,0,0),
(-49217,0,15,0,0,2,0,0,0,0,1),
(-49219,0,0,0,0,0,4,0,0,0,0),
(-49223,0,15,17,134348800,0,0,0,0,0,0),
(-49467,0,15,16,131072,0,0,0,0,0,0),
(-50880,0,15,0,67108864,0,0,0,0,0,0),
(-51459,0,0,0,0,0,4,0,0,0,0),
(-51474,0,0,0,0,0,0,65536,0,0,0),
(-51521,0,11,0,16777216,0,0,0,0,0,0),
(-51523,0,11,0,1,0,65536,0,0,50,0),
(-51556,0,11,192,0,16,0,2,0,0,0),
(-51562,0,11,256,0,16,0,0,0,0,0),
(-51625,0,8,268476416,0,0,0,0,0,0,0),
(-51627,0,0,0,0,0,0,112,0,0,0),
(-51634,0,0,0,0,0,0,2,0,0,0),
(-51664,0,8,131072,8,0,0,0,0,0,0),
(-51672,0,0,0,0,0,0,16,0,0,1),
(-51692,0,8,516,0,0,0,0,0,0,0),
(-51940,0,0,0,0,0,0,0,0,20,0),
(-52127,0,0,0,0,0,0,0,0,0,3),
(-52795,0,6,1,0,0,0,0,0,0,0),
(-53178,0,9,0,268435456,0,65536,0,0,100,0),
(-53215,0,9,1,0,0,0,0,0,0,0),
(-53221,0,9,0,1,0,0,0,0,0,0),
(-53228,0,9,32,16777216,0,0,0,0,0,0),
(-53234,0,9,131072,1,1,0,2,0,0,0),
(-53256,0,9,2048,8388609,0,0,2,0,0,0),
(-53290,0,9,2048,1,512,0,2,0,0,0),
(-53375,0,10,0,8192,0,1024,0,0,0,6),
(-53380,0,10,8388608,163840,0,0,262146,0,0,0),
(-53486,0,10,8388608,163840,0,0,262146,0,0,0),
(-53501,0,0,0,0,0,0,2,0,0,0),
(-53527,1,10,0,0,4,1024,1,0,100,0),
(-53551,0,10,4096,0,0,0,0,0,0,0),
(-53569,0,10,1075838976,65536,0,0,0,0,0,0),
(-53671,0,10,8388608,0,0,0,0,0,0,0),
(-53695,0,10,8388608,0,8,16,0,0,0,0),
(-53709,2,10,16384,0,0,0,0,0,0,0),
(-54639,0,15,4194304,65536,0,0,0,0,0,0),
(-54747,0,0,0,0,0,0,65536,0,0,0),
(-55666,0,15,1,134217728,0,0,0,0,0,0),
(-56342,0,9,24,134217728,147456,0,0,0,0,22),
(-56636,0,4,32,0,0,0,262144,0,0,6),
(-57470,0,6,1,0,0,0,0,0,0,0),
(-57878,0,0,0,0,0,0,16,0,0,0),
(-58872,0,0,0,0,0,0,270403,0,0,0),
(-59088,0,4,0,2,0,1024,0,0,0,0),
(-61846,0,0,0,0,0,64,0,0,0,0),
(-62764,0,9,0,268435456,0,65536,0,0,100,0),
(-63156,0,5,1,192,0,0,0,0,0,0),
(-63373,0,11,2147483648,0,0,65536,0,0,0,0),
(-63730,0,6,2048,4,0,0,0,0,0,0),
(-64127,0,6,1,1,0,0,0,0,0,0),
(-65661,0,15,4194321,537001988,0,16,0,0,100,0),
(-66799,0,15,4194304,0,0,0,0,0,0,0);
 
 
-- -------------------------------------------------------- 
-- 2013_07_25_00_world_spell_script_names.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_warl_banish',
'spell_dru_enrage',
'spell_pri_mana_burn',
'spell_pri_guardian_spirit',
'spell_dk_improved_blood_presence',
'spell_dk_improved_frost_presence',
'spell_dk_improved_unholy_presence',
'spell_dk_presence'
);

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(-710,  'spell_warl_banish'),
(5229,  'spell_dru_enrage'),
(8129,  'spell_pri_mana_burn'),
(47788, 'spell_pri_guardian_spirit'),
(-50365,'spell_dk_improved_blood_presence'),
(-50384,'spell_dk_improved_frost_presence'),
(-50391,'spell_dk_improved_unholy_presence'),
(48266, 'spell_dk_presence'),
(48263, 'spell_dk_presence'),
(48265, 'spell_dk_presence');
 
 
-- -------------------------------------------------------- 
-- 2013_07_25_01_world_conditions.sql 
-- -------------------------------------------------------- 
-- Fix gossip condition for Bat Handler Camille <Bat Handler>
UPDATE `conditions` SET `ConditionTypeOrReference`=28 WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8894 AND `SourceEntry`=0 AND `ConditionValue1`=11229;
 
 
-- -------------------------------------------------------- 
-- 2013_07_27_00_world_spell_script_names.sql 
-- -------------------------------------------------------- 
DELETE FROM `spell_script_names` WHERE `spell_id` IN (31821,64364,-20254,-20138,31869,-53379,63510,63514,63531);
INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(31821, 'spell_pal_aura_mastery'),
(64364, 'spell_pal_aura_mastery_immune'),
(-20254,'spell_pal_improved_concentraction_aura'),
(-20138,'spell_pal_improved_devotion_aura'),
(31869, 'spell_pal_sanctified_retribution'),
(-53379,'spell_pal_swift_retribution'),
(63510, 'spell_pal_improved_concentraction_aura_effect'),
(63514, 'spell_pal_improved_devotion_aura_effect'),
(63531, 'spell_pal_sanctified_retribution_effect');
 
 
-- -------------------------------------------------------- 
-- 2013_07_28_00_world_gameobjects.sql 
-- -------------------------------------------------------- 
SET @OGUID := 76732; -- Discarded Soul Crystal & Aura Trap Blue Short (cosmetic)

DELETE FROM `gameobject` WHERE `id` IN (195344, 195346, 193984);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID, 195344, 571, 1, 1, 7830.25, 2497.806, 402.5372, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+1, 195346, 571, 1, 1, 7830.25, 2497.806, 402.5372, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+2, 195344, 571, 1, 1, 7796.588, 2463.793, 393.2891, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+3, 195346, 571, 1, 1, 7796.588, 2463.793, 393.2891, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+4, 195344, 571, 1, 1, 7845.074, 2444.608, 400.5993, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+5, 195346, 571, 1, 1, 7845.074, 2444.608, 400.5993, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+6, 195344, 571, 1, 1, 7888.031, 2486.691, 412.1846, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+7, 195346, 571, 1, 1, 7888.031, 2486.691, 412.1846, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+8, 195344, 571, 1, 1, 7890.981, 2435.66, 407.6983, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: 0)
(@OGUID+9, 195346, 571, 1, 1, 7890.981, 2435.66, 407.6983, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: 0)
(@OGUID+10, 195344, 571, 1, 1, 7879.325, 2381.498, 395.9927, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+11, 195346, 571, 1, 1, 7879.325, 2381.498, 395.9927, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+12, 195344, 571, 1, 1, 7772.191, 2523.408, 397.5526, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+13, 195346, 571, 1, 1, 7772.191, 2523.408, 397.5526, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+14, 195344, 571, 1, 1, 7792.491, 2552.295, 404.7368, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+15, 195346, 571, 1, 1, 7792.491, 2552.295, 404.7368, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+16, 195344, 571, 1, 1, 7813.522, 2376.698, 383.7577, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+17, 195346, 571, 1, 1, 7813.522, 2376.698, 383.7577, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+18, 195344, 571, 1, 1, 7912.719, 2361.585, 403.3483, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+19, 195346, 571, 1, 1, 7912.719, 2361.585, 403.3483, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+20, 195344, 571, 1, 1, 7887.583, 2323.535, 389.2969, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+21, 195346, 571, 1, 1, 7887.583, 2323.535, 389.2969, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+22, 195344, 571, 1, 1, 7779.922, 2417.377, 384.4348, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+23, 195346, 571, 1, 1, 7779.922, 2417.377, 384.4348, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+24, 195344, 571, 1, 1, 7912.483, 2277.05, 387.8716, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+25, 195346, 571, 1, 1, 7912.483, 2277.05, 387.8716, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+26, 195344, 571, 1, 1, 7843.852, 2334.658, 382.3897, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+27, 195346, 571, 1, 1, 7843.852, 2334.658, 382.3897, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+28, 195344, 571, 1, 1, 7863.498, 2231.648, 375.1721, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+29, 195346, 571, 1, 1, 7863.498, 2231.648, 375.1721, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+30, 195344, 571, 1, 1, 7829.741, 2296.035, 378.0592, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+31, 195346, 571, 1, 1, 7829.741, 2296.035, 378.0592, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+32, 195344, 571, 1, 1, 7746.049, 2372.997, 376.3941, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+33, 195346, 571, 1, 1, 7746.049, 2372.997, 376.3941, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+34, 195344, 571, 1, 1, 7760.765, 2331.149, 374.8048, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+35, 195346, 571, 1, 1, 7760.765, 2331.149, 374.8048, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+36, 195344, 571, 1, 1, 7788.99, 2255.302, 371.7061, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+37, 195346, 571, 1, 1, 7788.99, 2255.302, 371.7061, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+38, 195344, 571, 1, 1, 7820.729, 2238.01, 372.7758, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+39, 195346, 571, 1, 1, 7820.729, 2238.01, 372.7758, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+40, 193984, 571, 1, 1, 7647.473, 2055.554, 599.3989, 6.003934, 0, 0, 0, 1, 120, 255, 1), -- Alliance Banner (Area: The Valley of Fallen Heroes)
(@OGUID+41, 195344, 571, 1, 1, 7745.684, 2289.906, 371.991, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+42, 195346, 571, 1, 1, 7745.684, 2289.906, 371.991, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+43, 195344, 571, 1, 1, 7696.855, 2372.087, 374.5795, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+44, 195346, 571, 1, 1, 7696.855, 2372.087, 374.5795, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+45, 195344, 571, 1, 1, 7710.979, 2338.505, 373.0223, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+46, 195346, 571, 1, 1, 7710.979, 2338.505, 373.0223, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+47, 195344, 571, 1, 1, 7750.775, 2420.458, 380.734, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+48, 195346, 571, 1, 1, 7750.775, 2420.458, 380.734, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+49, 195344, 571, 1, 1, 7651.209, 2394.108, 374.7194, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+50, 195346, 571, 1, 1, 7651.209, 2394.108, 374.7194, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+51, 195344, 571, 1, 1, 7694.101, 2306.049, 370.4156, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+52, 195346, 571, 1, 1, 7694.101, 2306.049, 370.4156, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+53, 195344, 571, 1, 1, 7603.735, 2402.665, 377.1989, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+54, 195346, 571, 1, 1, 7603.735, 2402.665, 377.1989, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+55, 195344, 571, 1, 1, 7632.563, 2369.054, 376.1918, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+56, 195346, 571, 1, 1, 7632.563, 2369.054, 376.1918, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+57, 195346, 571, 1, 1, 7568.995, 2373.521, 377.0721, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+58, 195344, 571, 1, 1, 7568.995, 2373.521, 377.0721, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+59, 195344, 571, 1, 1, 7628.762, 2434.55, 377.8682, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+60, 195346, 571, 1, 1, 7628.762, 2434.55, 377.8682, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+61, 195346, 571, 1, 1, 7569.211, 2434.028, 382.9506, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+62, 195344, 571, 1, 1, 7569.211, 2434.028, 382.9506, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+63, 195344, 571, 1, 1, 7590.309, 2308.01, 376.7488, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+64, 195346, 571, 1, 1, 7590.309, 2308.01, 376.7488, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+65, 195344, 571, 1, 1, 7542.194, 2323.882, 378.2228, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+66, 195346, 571, 1, 1, 7542.194, 2323.882, 378.2228, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+67, 195344, 571, 1, 1, 7505.332, 2363.399, 378.0511, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+68, 195346, 571, 1, 1, 7505.332, 2363.399, 378.0511, 0, 0, 0, 0, 1, 120, 255, 1), -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
(@OGUID+69, 195344, 571, 1, 1, 7453.913, 2355.877, 380.0355, 0, 0, 0, 0, 1, 120, 255, 1), -- Discarded Soul Crystal (Area: The Valley of Fallen Heroes)
(@OGUID+70, 195346, 571, 1, 1, 7453.913, 2355.877, 380.0355, 0, 0, 0, 0, 1, 120, 255, 1); -- Aura Trap Blue Short (Area: The Valley of Fallen Heroes)
 
 
-- -------------------------------------------------------- 
-- 2013_07_28_01_world_sai.sql 
-- -------------------------------------------------------- 
-- Fix quest 14107: The Fate Of The Fallen
-- Add SmartAI for Fallen Hero's Spirit

SET @ENTRY := 32149;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE creature_id = @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 0, 0, 8, 0, 100, 1, 66719, 0, 0, 0, 80, @ENTRY*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - On Spellhit Blessing of Peace - Run script'),
(@ENTRY*100, 9, 0, 0, 0, 0, 100, 0, 100, 100, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Turn to Invoker'),
(@ENTRY*100, 9, 1, 0, 0, 0, 100, 0, 100, 100, 0, 0, 33, 35055, 0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Give Quest Credit'),
(@ENTRY*100, 9, 2, 0, 0, 0, 100, 0, 100, 100, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Set Faction'),
(@ENTRY*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Say 0'),
(@ENTRY*100, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Fallen Hero''s Spirit - Script - Despawn');

-- Creature text for Fallen Hero's Spirit
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY, 0, 0, 'It was awful... I dreamt I was fighting against my friends.', 12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 1, 'I''m so tired. Just let me rest for a moment.',               12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 2, 'I can''t hear the screams anymore. Is this the end?',         12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 3, 'At last... now I can rest.',                                  12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit'),
(@ENTRY, 0, 4, 'My nightmare, is it finally over?',                           12, 0, 100, 1, 0, 0, 'Fallen Hero''s Spirit');
 
 
-- -------------------------------------------------------- 
-- 2013_07_29_00_world_drak_tharon_keep.sql 
-- -------------------------------------------------------- 
UPDATE `instance_template` SET `script`="instance_drak_tharon_keep" WHERE `map`=600;
UPDATE `creature_template` SET `ScriptName`="boss_king_dred" WHERE `entry`=27483;
 
 
-- -------------------------------------------------------- 
-- 2013_07_29_01_world_spelldifficulty_dbc.sql 
-- -------------------------------------------------------- 
DELETE FROM `spelldifficulty_dbc` WHERE `id` = 48849;
INSERT INTO `spelldifficulty_dbc` (`id`, `spellid0`, `spellid1`) VALUES
(48849, 48849, 59422);
 
 
-- -------------------------------------------------------- 
-- _MERGED.sql 
-- -------------------------------------------------------- 
 
 
