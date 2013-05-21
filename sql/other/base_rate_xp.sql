/* ============== characters ============== 

DROP TABLE IF EXISTS `character_base_rate_xp`;
CREATE TABLE `character_base_rate_xp` (
  `guid` int(11) unsigned NOT NULL,
  `rate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

*/

/* ============== world ============== */

SET @NPC_ENTRY = 50001;
SET @GOSSIP_MENU_ID = 50001;
SET @QUEST_ID = 30000;
SET @CREATURE_GUID_START = 250000;
SET @SMART_ACTION_SET_RATE = 108;
SET @CONDITION_BASE_RATE_XP = 39;
SET @QUEST_FLAGS_SHARABLE = 8;
SET @QUEST_FLAGS_AUTO_ACCEPT = 524288;
SET @QUEST_FLAGS_NO_MONEY_FROM_XP = 256;
SET @QUEST_FLAGS = @QUEST_FLAGS_SHARABLE + @QUEST_FLAGS_AUTO_ACCEPT + @QUEST_FLAGS_NO_MONEY_FROM_XP;
SET @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE = 5;
SET @CONDITION_SOURCE_TYPE_GOSSIP_MENU = 15;
SET @ITEM_LOOT_ID = 41426;
SET @ITEM_BIG_BLIZZARD_BEAR = 43599;
SET @ITEM_BABY_BLIZZARD_BEAR = 44819;
SET @ITEM_EMBLEM_OF_TRIUMPH = 47241;
SET @ITEM_EMBLEM_OF_FROST = 49426;


DELETE FROM `creature_template` WHERE `entry` = @NPC_ENTRY;
INSERT INTO `creature_template`
(`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`,
`name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`,
`rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`,
`dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`,
`type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`,
`spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`,
`InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`,
`questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(@NPC_ENTRY , '0', '0', '0', '0', '0', '16587', '0', '0', '0', '<Rate XP changer>', '', '', @GOSSIP_MENU_ID, '1', '1', '0', '35', '35', '3', '1', '1.14286',
'2.5', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0',
'0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '0', '3', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0',
'0', '0', '1', '0', '0', '', '1');

DELETE FROM `locales_creature` WHERE `entry` = @NPC_ENTRY;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`,
`subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`, `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`) VALUES
(@NPC_ENTRY, '', '', '', '', '', '', '', 'Рейты опыта', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


DELETE FROM `creature_involvedrelation` WHERE `id` = @NPC_ENTRY OR `quest` = @QUEST_ID;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (@NPC_ENTRY, @QUEST_ID);

DELETE FROM `creature_questrelation` WHERE `id` = @NPC_ENTRY OR `quest` = @QUEST_ID;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (@NPC_ENTRY, @QUEST_ID);

DELETE FROM `gossip_menu_option` WHERE `menu_id` = @GOSSIP_MENU_ID;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`,
`box_coded`, `box_money`, `box_text`) VALUES
(@GOSSIP_MENU_ID, 0, 0, '<Rate XP set x1>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x1>'),
(@GOSSIP_MENU_ID, 1, 0, '<Rate XP set x5>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x5>'),
(@GOSSIP_MENU_ID, 2, 0, '<Rate XP set x10>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x10>'),
(@GOSSIP_MENU_ID, 3, 0, '<Rate XP set x25>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x25>'),
(@GOSSIP_MENU_ID, 4, 0, '<Rate XP set x50>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x50>'),
(@GOSSIP_MENU_ID, 5, 0, '<Rate XP set x100>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x100>'),
(@GOSSIP_MENU_ID, 6, 0, '<Rate XP set x500>', 1, 1, 0, 0, 0, 0, '<confirm rate xp set x500>');

DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = @GOSSIP_MENU_ID;
INSERT INTO `locales_gossip_menu_option`
(`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`,
`option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`,
`box_text_loc7`, `box_text_loc8`) VALUES
(@GOSSIP_MENU_ID, 0,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Оставить x1 (Blizzlike)',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x1?'),
(@GOSSIP_MENU_ID, 1,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x5',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x5?'),
(@GOSSIP_MENU_ID, 2,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x10',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x10?'),
(@GOSSIP_MENU_ID, 3,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x25',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x25?'),
(@GOSSIP_MENU_ID, 4,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x50',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x50?'),
(@GOSSIP_MENU_ID, 5,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x100',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x100?'),
(@GOSSIP_MENU_ID, 6,
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Установить множитель (рейт) опыта на x500',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вы уверены, что хотите играть с множителем (рейтом) опыта x500?');


DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC_ENTRY AND `source_type` = 0;
INSERT INTO `smart_scripts`
(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`,
`event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`,
`target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC_ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: gossip close'),
(@NPC_ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, @NPC_ENTRY, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: kill credit for quests'),
(@NPC_ENTRY, 0, 4, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 0, 0, 0, @SMART_ACTION_SET_RATE, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x1'),
(@NPC_ENTRY, 0, 5, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 1, 0, 0, @SMART_ACTION_SET_RATE, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x5'),
(@NPC_ENTRY, 0, 6, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 2, 0, 0, @SMART_ACTION_SET_RATE, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x10'),
(@NPC_ENTRY, 0, 7, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 3, 0, 0, @SMART_ACTION_SET_RATE, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x25'),
(@NPC_ENTRY, 0, 8, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 4, 0, 0, @SMART_ACTION_SET_RATE, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x50'),
(@NPC_ENTRY, 0, 9, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 5, 0, 0, @SMART_ACTION_SET_RATE, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x100'),
(@NPC_ENTRY, 0, 10, 1, 62, 0, 100, 0, @GOSSIP_MENU_ID, 6, 0, 0, @SMART_ACTION_SET_RATE, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'action: rate set x500');

DELETE FROM `quest_template` WHERE `Id` = @QUEST_ID;
INSERT INTO `quest_template`
(`Id`, `Method`, `Level`, `MinLevel`, `MaxLevel`, `ZoneOrSort`, `Type`, `SuggestedPlayers`, `LimitTime`, `RequiredClasses`, `RequiredRaces`, `RequiredSkillId`,
`RequiredSkillPoints`, `RequiredFactionId1`, `RequiredFactionId2`, `RequiredFactionValue1`, `RequiredFactionValue2`, `RequiredMinRepFaction`,
`RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestIdChain`, `RewardXPId`,
`RewardOrRequiredMoney`, `RewardMoneyMaxLevel`, `RewardSpell`, `RewardSpellCast`, `RewardHonor`, `RewardHonorMultiplier`, `RewardMailTemplateId`,
`RewardMailDelay`, `SourceItemId`, `SourceItemCount`, `SourceSpellId`, `Flags`, `SpecialFlags`, `RewardTitleId`, `RequiredPlayerKills`, `RewardTalents`,
`RewardArenaPoints`, `RewardItemId1`, `RewardItemId2`, `RewardItemId3`, `RewardItemId4`, `RewardItemCount1`, `RewardItemCount2`, `RewardItemCount3`,
`RewardItemCount4`, `RewardChoiceItemId1`, `RewardChoiceItemId2`, `RewardChoiceItemId3`, `RewardChoiceItemId4`, `RewardChoiceItemId5`, `RewardChoiceItemId6`,
`RewardChoiceItemCount1`, `RewardChoiceItemCount2`, `RewardChoiceItemCount3`, `RewardChoiceItemCount4`, `RewardChoiceItemCount5`, `RewardChoiceItemCount6`,
`RewardFactionId1`, `RewardFactionId2`, `RewardFactionId3`, `RewardFactionId4`, `RewardFactionId5`, `RewardFactionValueId1`, `RewardFactionValueId2`,
`RewardFactionValueId3`, `RewardFactionValueId4`, `RewardFactionValueId5`, `RewardFactionValueIdOverride1`, `RewardFactionValueIdOverride2`,
`RewardFactionValueIdOverride3`, `RewardFactionValueIdOverride4`, `RewardFactionValueIdOverride5`, `PointMapId`, `PointX`, `PointY`, `PointOption`, `Title`,
`Objectives`, `Details`, `EndText`, `OfferRewardText`, `RequestItemsText`, `CompletedText`, `RequiredNpcOrGo1`, `RequiredNpcOrGo2`, `RequiredNpcOrGo3`,
`RequiredNpcOrGo4`, `RequiredNpcOrGoCount1`, `RequiredNpcOrGoCount2`, `RequiredNpcOrGoCount3`, `RequiredNpcOrGoCount4`, `RequiredSourceItemId1`,
`RequiredSourceItemId2`, `RequiredSourceItemId3`, `RequiredSourceItemId4`, `RequiredSourceItemCount1`, `RequiredSourceItemCount2`, `RequiredSourceItemCount3`,
`RequiredSourceItemCount4`, `RequiredItemId1`, `RequiredItemId2`, `RequiredItemId3`, `RequiredItemId4`, `RequiredItemId5`, `RequiredItemId6`, `RequiredItemCount1`,
`RequiredItemCount2`, `RequiredItemCount3`, `RequiredItemCount4`, `RequiredItemCount5`, `RequiredItemCount6`, `RequiredSpellCast1`, `RequiredSpellCast2`,
`RequiredSpellCast3`, `RequiredSpellCast4`, `Unknown0`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `DetailsEmote1`, `DetailsEmote2`,
`DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `EmoteOnIncomplete`, `EmoteOnComplete`,
`OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`,
`OfferRewardEmoteDelay4`, `WDBVerified`) VALUES 
(@QUEST_ID, 2, -1, 1, 0, -284, 82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @QUEST_FLAGS, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '',
'', '', '', '', '', @NPC_ENTRY, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

DELETE FROM `locales_quest` WHERE `Id` = @QUEST_ID;
INSERT INTO `locales_quest`
(`Id`, `Title_loc1`, `Title_loc2`, `Title_loc3`, `Title_loc4`, `Title_loc5`, `Title_loc6`, `Title_loc7`, `Title_loc8`, `Details_loc1`, `Details_loc2`,
`Details_loc3`, `Details_loc4`, `Details_loc5`, `Details_loc6`, `Details_loc7`, `Details_loc8`, `Objectives_loc1`, `Objectives_loc2`, `Objectives_loc3`,
`Objectives_loc4`, `Objectives_loc5`, `Objectives_loc6`, `Objectives_loc7`, `Objectives_loc8`, `OfferRewardText_loc1`, `OfferRewardText_loc2`, `OfferRewardText_loc3`,
`OfferRewardText_loc4`, `OfferRewardText_loc5`, `OfferRewardText_loc6`, `OfferRewardText_loc7`, `OfferRewardText_loc8`, `RequestItemsText_loc1`,
`RequestItemsText_loc2`, `RequestItemsText_loc3`, `RequestItemsText_loc4`, `RequestItemsText_loc5`, `RequestItemsText_loc6`, `RequestItemsText_loc7`,
`RequestItemsText_loc8`, `EndText_loc1`, `EndText_loc2`, `EndText_loc3`, `EndText_loc4`, `EndText_loc5`, `EndText_loc6`, `EndText_loc7`, `EndText_loc8`,
`CompletedText_loc1`, `CompletedText_loc2`, `CompletedText_loc3`, `CompletedText_loc4`, `CompletedText_loc5`, `CompletedText_loc6`, `CompletedText_loc7`,
`CompletedText_loc8`, `ObjectiveText1_loc1`, `ObjectiveText1_loc2`, `ObjectiveText1_loc3`, `ObjectiveText1_loc4`, `ObjectiveText1_loc5`, `ObjectiveText1_loc6`,
`ObjectiveText1_loc7`, `ObjectiveText1_loc8`, `ObjectiveText2_loc1`, `ObjectiveText2_loc2`, `ObjectiveText2_loc3`, `ObjectiveText2_loc4`, `ObjectiveText2_loc5`,
`ObjectiveText2_loc6`, `ObjectiveText2_loc7`, `ObjectiveText2_loc8`, `ObjectiveText3_loc1`, `ObjectiveText3_loc2`, `ObjectiveText3_loc3`, `ObjectiveText3_loc4`,
`ObjectiveText3_loc5`, `ObjectiveText3_loc6`, `ObjectiveText3_loc7`, `ObjectiveText3_loc8`, `ObjectiveText4_loc1`, `ObjectiveText4_loc2`, `ObjectiveText4_loc3`,
`ObjectiveText4_loc4`, `ObjectiveText4_loc5`, `ObjectiveText4_loc6`, `ObjectiveText4_loc7`, `ObjectiveText4_loc8`) VALUES
(@QUEST_ID,
/* Title */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Добро пожаловать на Сервер',
/* Details */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Привет, $N! Спасибо, что выбрал наш сервер. Первым делом предлагаем тебе выбрать удобные рейт (множитель) опыта.$B$B Здесь, мы считаем, что прокачка — весело, но не для всех. Многие игроки уже не раз проходили этот долгий путь. Просто поставить высокие множителм опыта — не решение, потому что некоторые игроки любят близ-лайк, поэтому мы оставляем этот выбор за вами. Хотите прокачки - выбирайте x1, а если хотите побыстрее добаться до 80 уровня - ставьте x500.',
/* Objectives */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Выберите множитель опыта',
/* OfferRewardText */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вот и все! Теперь эти настройки сохранятся за вашим персонажем!',
/* RequestItemsTex */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Выберите множители опыта, которые подходят вам!',
/* EndText */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, '',
/* CompletedText */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, '',
/* ObjectiveText1 */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Изменить множитель опыта',
/* ObjectiveText2 */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
/* ObjectiveText3 */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
/* ObjectiveText4 */
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = @CONDITION_SOURCE_TYPE_GOSSIP_MENU AND `SourceGroup` = @GOSSIP_MENU_ID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 0, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 1, 0, 0, 0, 0, '', 'not display'),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 1, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 5, 0, 0, 0, 0, '', NULL),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 2, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 10, 0, 0, 0, 0, '', NULL),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 3, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 25, 0, 0, 0, 0, '', NULL),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 4, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 50, 0, 0, 0, 0, '', NULL),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 5, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 100, 0, 0, 0, 0, '', NULL),
(@CONDITION_SOURCE_TYPE_GOSSIP_MENU, @GOSSIP_MENU_ID, 6, 0, 0, @CONDITION_BASE_RATE_XP, 0, 0, 500, 0, 0, 0, 0, '', NULL);

DELETE FROM `creature` WHERE `guid` BETWEEN @CREATURE_GUID_START AND @CREATURE_GUID_START + 7 OR `id` = @NPC_ENTRY;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`,
`spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@CREATURE_GUID_START, @NPC_ENTRY, 0, 1, 1, 0, 0, -8906.45, -129.298, 81.0463, 2.96898, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 1, @NPC_ENTRY, 0, 1, 1, 0, 0, -6235.57, 346.435, 383.682, 4.95281, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 2, @NPC_ENTRY, 1, 1, 1, 0, 0, 10325.7, 821.847, 1326.42, 2.53509, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 3, @NPC_ENTRY, 530, 1, 1, 0, 0, -3966.51, -13899.9, 98.5182, 3.06827, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 4, @NPC_ENTRY, 1, 1, 1, 0, 0, -590.122, -4222.83, 38.3034, 3.68897, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 5, @NPC_ENTRY, 0, 1, 1, 0, 0, 1704.57, 1664.84, 132.145, 4.14071, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 6, @NPC_ENTRY, 1, 1, 1, 0, 0, -2882.42, -234.735, 53.9166, 3.88798, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CREATURE_GUID_START + 7, @NPC_ENTRY, 530, 1, 1, 0, 0, 10344.5, -6346.36, 31.3845, 6.06907, 300, 0, 0, 42, 0, 0, 0, 0, 0);

-- cleanup
DELETE FROM `item_loot_template`
WHERE 	`entry` = @ITEM_LOOT_ID
	AND `item` IN (@ITEM_BIG_BLIZZARD_BEAR, @ITEM_BABY_BLIZZARD_BEAR, @ITEM_EMBLEM_OF_TRIUMPH, @ITEM_EMBLEM_OF_FROST);

INSERT INTO `item_loot_template`
(`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(@ITEM_LOOT_ID, @ITEM_BIG_BLIZZARD_BEAR, 100, 1, 0, 1, 1),
(@ITEM_LOOT_ID, @ITEM_BABY_BLIZZARD_BEAR, 100, 1, 0, 1, 1),
(@ITEM_LOOT_ID, @ITEM_EMBLEM_OF_TRIUMPH, 100, 1, 0, 50, 50),
(@ITEM_LOOT_ID, @ITEM_EMBLEM_OF_FROST, 100, 1, 0, 50, 50);

DELETE FROM `conditions`
WHERE	`SourceTypeOrReferenceId` = @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE
	AND `SourceGroup` = @ITEM_LOOT_ID
	AND `SourceEntry` IN (@ITEM_BIG_BLIZZARD_BEAR, @ITEM_BABY_BLIZZARD_BEAR, @ITEM_EMBLEM_OF_TRIUMPH, @ITEM_EMBLEM_OF_FROST);

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_LOOT_ID, @ITEM_BIG_BLIZZARD_BEAR, 0, 0, @CONDITION_BASE_RATE_XP, 0, 1, 1, 0, 0, 0, 0, '', 'Big Blizzard Bear (if rate x1)'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_LOOT_ID, @ITEM_BABY_BLIZZARD_BEAR, 0, 0, @CONDITION_BASE_RATE_XP, 0, 5, 5, 0, 0, 0, 0, '', 'Baby Blizzard Bear (if rate x5)'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_LOOT_ID, @ITEM_EMBLEM_OF_TRIUMPH, 0, 0, @CONDITION_BASE_RATE_XP, 0, 5, 5, 0, 0, 0, 0, '', 'Emblem of Triumph (if rate x5)'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_LOOT_ID, @ITEM_EMBLEM_OF_FROST, 0, 0, @CONDITION_BASE_RATE_XP, 0, 1, 1, 0, 0, 0, 0, '', 'Emblem of Frost (if rate x1)');