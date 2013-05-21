SET @ITEM_ID = 9537;
SET @ITEM_QUALITY = 6;
SET @ITEM_PROTO_FLAG_OPENABLE = 4;
SET @ITEM_PROTO_FLAG_GIFT = 1024;
SET @ITEM_FLAGS = @ITEM_PROTO_FLAG_OPENABLE + @ITEM_PROTO_FLAG_GIFT;
SET @CONDITION_CLASS_MASK = 15;
SET @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE = 5;

DELETE FROM `item_template` WHERE `entry` = @ITEM_ID;
INSERT INTO `item_template`
(`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`,
`BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`,
`RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`,
`maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`,
`stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`,
`stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`,
`ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`,
`nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`,
`spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`,
`spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`,
`spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`,
`spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`,
`spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`,
`PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`,
`itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`,
`socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`,
`ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`,
`maxMoneyLoot`, `flagsCustom`, `WDBVerified`) VALUES
(@ITEM_ID, 15, 0, -1, 'Starter pack', 18499, @ITEM_QUALITY, @ITEM_FLAGS, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, NULL, 0, -1, 0, -1, 0, 0,
NULL, 0, -1, 0, -1, 0, 0, NULL, 0, -1, 0, -1, 0, 0, NULL, 0, -1, 0, -1, 0, 0, NULL, 0, -1, 0, -1, 0, '', 0, 0, 0, 0, 0, -1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1);

DELETE FROM `locales_item` WHERE `entry` = @ITEM_ID;
INSERT INTO `locales_item`
(`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`, `description_loc1`,
`description_loc2`, `description_loc3`, `description_loc4`, `description_loc5`, `description_loc6`, `description_loc7`,
`description_loc8`) VALUES
(@ITEM_ID,
'', '', '', '', '', '', '', 'Стартовый набор',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


DELETE FROM `playercreateinfo_item` WHERE `itemid` = @ITEM_ID;
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES (0, 0, @ITEM_ID, 1);

SET @LOOT_GROUP = 1; -- if 0 then all item else one item

DELETE FROM `item_loot_template` WHERE `entry` = @ITEM_ID;
INSERT INTO `item_loot_template`
(`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(@ITEM_ID, 42943, 0, 1, @LOOT_GROUP, 1, 1), 	-- Bloodied Arcanite Reaper (Warrior)
-- (@ITEM_ID, 44099, 0, 1, @LOOT_GROUP, 1, 1), 	-- Strengthened Stockade Pauldrons (Warrior, Paladin)
(@ITEM_ID, 48677, 0, 1, @LOOT_GROUP, 1, 1), 	-- Champion's Deathdealer Breastplate (Hunter)
(@ITEM_ID, 42944, 0, 1, @LOOT_GROUP, 2, 2), 	-- Balanced Heartseeker (Rogue x2)
(@ITEM_ID, 42946, 0, 1, @LOOT_GROUP, 1, 1), 	-- Charmed Ancient Bone Bow (Rogue, Hunter, Warrior)
(@ITEM_ID, 42947, 0, 1, @LOOT_GROUP, 1, 1), 	-- Dignified Headmaster's Charge (Priest, Shaman, Mage, Warlock, Druid)
(@ITEM_ID, 42949, 0, 1, @LOOT_GROUP, 1, 1), 	-- Polished Spaulders of Valor (Warrior, Paladin)
(@ITEM_ID, 42950, 0, 1, @LOOT_GROUP, 1, 1), 	-- Champion Herod's Shoulder (Hunter)
(@ITEM_ID, 42951, 0, 1, @LOOT_GROUP, 1, 1), 	-- Mystical Pauldrons of Elements (Shaman)
(@ITEM_ID, 42952, 0, 1, @LOOT_GROUP, 1, 1), 	-- Stained Shadowcraft Spaulders (Rogue)
(@ITEM_ID, 42984, 0, 1, @LOOT_GROUP, 1, 1), 	-- Preened Ironfeather Shoulders (Druid)
(@ITEM_ID, 42985, 0, 1, @LOOT_GROUP, 1, 1), 	-- Tattered Dreadmist Mantle (Priest, Mage, Warlock)
(@ITEM_ID, 42991, 0, 1, @LOOT_GROUP, 1, 1), 	-- Swift Hand of Justice (All)
(@ITEM_ID, 42992, 0, 1, @LOOT_GROUP, 1, 1), 	-- Discerning Eye of the Beast (Priest, Shaman, Mage, Warlock, Druid, Hunter, Paladin)
(@ITEM_ID, 48683, 0, 1, @LOOT_GROUP, 1, 1), 	-- Mystical Vest of Elements (Shaman)
(@ITEM_ID, 48685, 0, 1, @LOOT_GROUP, 1, 1), 	-- Polished Breastplate of Valor (Warrior, Paladin)
(@ITEM_ID, 48687, 0, 1, @LOOT_GROUP, 1, 1), 	-- Preened Ironfeather Breastplate (Druid)
(@ITEM_ID, 48689, 0, 1, @LOOT_GROUP, 1, 1), 	-- Stained Shadowcraft Tunic (Rogue)
(@ITEM_ID, 48691, 0, 1, @LOOT_GROUP, 1, 1), 	-- Tattered Dreadmist Robe (Priest, Mage, Warlock)
(@ITEM_ID, 50255, 0, 1, @LOOT_GROUP, 1, 1), 	-- Dread Pirate Ring (All)
(@ITEM_ID, 44092, 0, 1, @LOOT_GROUP, 1, 1), 	-- Reforged Truesilver Champion
(@ITEM_ID, 858, 100, 1, 0, 10, 10), 			-- Lesser Healing Potion (All x10)
(@ITEM_ID, 2455, 100, 1, 0, 10, 10), 			-- Minor Mana Potion (All x10)
(@ITEM_ID, 2459, 100, 1, 0, 5, 5); 				-- Swiftness Potion (All x5)

SET @CLASS_WARRIOR = 1;
SET @CLASS_PALADIN = 2;
SET @CLASS_HUNTER = 4;
SET @CLASS_ROGUE = 8;
SET @CLASS_PRIEST = 16;
SET @CLASS_DEATH_KNIGHT = 32;
SET @CLASS_SHAMAN = 64;
SET @CLASS_MAGE = 128;
SET @CLASS_WARLOCK = 256;
SET @CLASS_DRUID = 1024;
SET @CLASS_PLATE = @CLASS_WARRIOR + @CLASS_PALADIN + @CLASS_DEATH_KNIGHT;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE AND `SourceGroup` = @ITEM_ID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42943, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_WARRIOR + @CLASS_DEATH_KNIGHT, 0, 0, 0, 0, 0, '', 'Bloodied Arcanite Reaper'),
-- (@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 44099, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', 'Strengthened Stockade Pauldrons'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48677, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Champion's Deathdealer Breastplate"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42944, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', 'Balanced Heartseeker'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42946, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE + @CLASS_HUNTER + @CLASS_WARRIOR, 0, 0, 0, 0, 0, '', 'Charmed Ancient Bone Bow'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42947, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PRIEST + @CLASS_SHAMAN + @CLASS_MAGE + @CLASS_WARLOCK + @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Dignified Headmaster's Charge"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42949, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', 'Polished Spaulders of Valor'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42950, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Champion Herod's Shoulder"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42951, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', 'Mystical Pauldrons of Elements'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42952, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', 'Stained Shadowcraft Spaulders'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42984, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', 'Preened Ironfeather Shoulders'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42985, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PRIEST + @CLASS_MAGE + @CLASS_WARLOCK, 0, 0, 0, 0, 0, '', 'Tattered Dreadmist Mantle'),
-- skip all (@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42991, 0, 0, @CONDITION_CLASS_MASK, 0, classMask, 0, 0, 0, 0, 0, '', 'Swift Hand of Justice'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42992, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PRIEST + @CLASS_SHAMAN + @CLASS_MAGE + @CLASS_WARLOCK + @CLASS_DRUID + @CLASS_HUNTER + @CLASS_PALADIN, 0, 0, 0, 0, 0, '', 'Discerning Eye of the Beast'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48683, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', 'Mystical Vest of Elements'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48685, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', 'Polished Breastplate of Valor'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48687, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', 'Preened Ironfeather Breastplate'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48689, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', 'Stained Shadowcraft Tunic'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 48691, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PRIEST + @CLASS_MAGE + @CLASS_WARLOCK, 0, 0, 0, 0, 0, '', 'Tattered Dreadmist Robe'),
-- skip all (@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 50255, 0, 0, @CONDITION_CLASS_MASK, 0, classMask, 0, 0, 0, 0, 0, '', 'Dread Pirate Ring'),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 44092, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PALADIN, 0, 0, 0, 0, 0, '', 'Reforged Truesilver Champion');