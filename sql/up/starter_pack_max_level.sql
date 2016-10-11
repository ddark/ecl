SET @ITEM_ID = 20486;
SET @ITEM_REWARD_MAX_LEVEL = 41426;
SET @ITEM_QUALITY = 6;
SET @ITEM_PROTO_FLAG_OPENABLE = 4;
SET @ITEM_PROTO_FLAG_GIFT = 1024;
SET @ITEM_FLAGS = @ITEM_PROTO_FLAG_OPENABLE + @ITEM_PROTO_FLAG_GIFT;
SET @CONDITION_CLASS_MASK = 15;
SET @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE = 5;

-- cleanup
DELETE FROM `item_loot_template` WHERE `entry` = @ITEM_REWARD_MAX_LEVEL AND `item` = @ITEM_ID;

INSERT INTO `item_loot_template`
(`entry`, `item`, `Chance`, `lootmode`, `groupid`, `MinCount`, `MaxCount`) VALUES
(@ITEM_REWARD_MAX_LEVEL, @ITEM_ID, 100, 1, 0, 1, 1);

DELETE FROM `playercreateinfo_item` WHERE `itemid` = @ITEM_ID;
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES (0, 0, @ITEM_ID, 1);

DELETE FROM `item_template` WHERE `entry` = @ITEM_ID;
INSERT INTO `item_template`
(`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`,
`BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`,
`RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`,
`maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`,
`stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`,
`stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`,
`ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`,
`nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`,
`PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`,
`itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`,
`socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`,
`ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`,
`maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(@ITEM_ID, 15, 0, -1, 'Starter pack for max level', 26420, @ITEM_QUALITY, @ITEM_FLAGS, 0, 1, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0,
0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, '', 0, 0, 0, 0, 0, -1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1);

DELETE FROM `locales_item` WHERE `entry` = @ITEM_ID;
INSERT INTO `locales_item`
(`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`, `description_loc1`,
`description_loc2`, `description_loc3`, `description_loc4`, `description_loc5`, `description_loc6`, `description_loc7`,
`description_loc8`) VALUES
(@ITEM_ID,
'', '', '', '', '', '', '', 'Стартовый набор для максимального уровня',
NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `item_loot_template` WHERE `entry` = @ITEM_ID;
INSERT INTO `item_loot_template`
(`entry`, `item`, `Chance`, `lootmode`, `groupid`, `MinCount`, `MaxCount`) VALUES
(@ITEM_ID, 43829, 100, 1, 0, 1, 1), -- Crusader's Locket (Melee)
(@ITEM_ID, 43837, 100, 1, 0, 1, 1), -- Softly Glowing Orb (Caster)
(@ITEM_ID, 43836, 100, 1, 0, 1, 1), -- Thorny Rose Brooch (All)
(@ITEM_ID, 43880, 100, 1, 0, 1, 1), -- Fair Touch of the Crusader (Priest, Mage, Warlock)
(@ITEM_ID, 43883, 100, 1, 0, 1, 1), -- Arete's Command (Warrior, Paladin, Death Knight, Hunter)
(@ITEM_ID, 43834, 100, 1, 0, 1, 1), -- Staff of Redeemed Souls (Priest, Mage, Warlock, Druid, Shaman)
(@ITEM_ID, 43874, 100, 1, 0, 2, 2), -- Lady Nightswood's Engagement Ring (Caster)
(@ITEM_ID, 42864, 100, 1, 0, 2, 2), -- Frozen Mood Ring (Melee)
(@ITEM_ID, 42848, 100, 1, 0, 2, 2), -- Razor-Sharp Icicle (Rogue)
(@ITEM_ID, 39135, 100, 1, 0, 1, 1), -- Wyrmstalker's Bow (Hunter, Rogue, Warrior)
(@ITEM_ID, 42793, 100, 1, 0, 1, 1), -- Locket of Snowcrest (Caster)
(@ITEM_ID, 42808, 100, 1, 0, 1, 1), -- Bouldercrag's Pendant (Melee)
(@ITEM_ID, 43861, 100, 1, 0, 1, 1), -- Bone Witch's Drape (Caster)
(@ITEM_ID, 43924, 100, 1, 0, 1, 1), -- Illskar's Greatcloak (Warrior, Paladin)
(@ITEM_ID, 43889, 100, 1, 0, 1, 1), -- Hulking Abomination Hide Cloak (Rogue, Hunter)
-- (Priest, Mage, Warlock)
(@ITEM_ID, 42787, 100, 1, 0, 1, 1), -- Ironwool Bindings
(@ITEM_ID, 42790, 100, 1, 0, 1, 1), -- K3 Surgeon's Gloves
(@ITEM_ID, 43872, 100, 1, 0, 1, 1), -- Weeping Mantle
(@ITEM_ID, 39814, 100, 1, 0, 1, 1), -- Slippers of the Broken Front
(@ITEM_ID, 42785, 100, 1, 0, 1, 1), -- Mammoth Sinew Cinch
(@ITEM_ID, 42849, 100, 1, 0, 1, 1), -- Flowing Valkyrion Robes
(@ITEM_ID, 42795, 100, 1, 0, 1, 1), -- Leggings of Renewed Hope
(@ITEM_ID, 43859, 100, 1, 0, 1, 1), -- Shadow Vault Cowl
-- (druid)
(@ITEM_ID, 42865, 100, 1, 0, 1, 1), -- Frost Hardened Bracers
(@ITEM_ID, 42866, 100, 1, 0, 1, 1), -- Fur-Lined Mittens
(@ITEM_ID, 42800, 100, 1, 0, 1, 1), -- Gale-Wind Guard
(@ITEM_ID, 42798, 100, 1, 0, 1, 1), -- Mammoth Hide Galoshes
(@ITEM_ID, 39402, 100, 1, 0, 1, 1), -- Binding of the Ancient Keeper
(@ITEM_ID, 42870, 100, 1, 0, 1, 1), -- Hibernal Chestguard
(@ITEM_ID, 39413, 100, 1, 0, 1, 1), -- Hydrafang Breeches
(@ITEM_ID, 43905, 100, 1, 0, 1, 1), -- Fur-Lined Helm
-- (rogue)
(@ITEM_ID, 39038, 100, 1, 0, 1, 1), -- Fleshwerk Wristguards
(@ITEM_ID, 39414, 100, 1, 0, 1, 1), -- Gilly's Strangulation Gauntlets
(@ITEM_ID, 42805, 100, 1, 0, 1, 1), -- Njormeld's Pauldrons
(@ITEM_ID, 39035, 100, 1, 0, 1, 1), -- Glacier-Walker's Mukluks
(@ITEM_ID, 42802, 100, 1, 0, 1, 1), -- Hardened Whipping Belt
(@ITEM_ID, 39036, 100, 1, 0, 1, 1), -- Hulking Horror Tunic
(@ITEM_ID, 42867, 100, 1, 0, 1, 1), -- Cured Proto-Drake Leggings
(@ITEM_ID, 42872, 100, 1, 0, 1, 1), -- Proto-Drake Cover
-- (hunter)
(@ITEM_ID, 43980, 100, 1, 0, 1, 1), -- Thane's Restraints
(@ITEM_ID, 43933, 100, 1, 0, 1, 1), -- Gauntlets of Urgency
(@ITEM_ID, 42887, 100, 1, 0, 1, 1), -- Pauldrons of the Ascent
(@ITEM_ID, 39441, 100, 1, 0, 1, 1), -- Treads of Bound Life
(@ITEM_ID, 43841, 100, 1, 0, 1, 1), -- Argent Girdle
(@ITEM_ID, 42813, 100, 1, 0, 1, 1), -- Chestplate of the Northern Ranger
(@ITEM_ID, 42817, 100, 1, 0, 1, 1), -- Reforged Chain Leggings
(@ITEM_ID, 42895, 100, 1, 0, 1, 1), -- Scaled Jormungar Protector
-- (shaman)
(@ITEM_ID, 42888, 100, 1, 0, 1, 1), -- Summit Bracers
(@ITEM_ID, 39444, 100, 1, 0, 1, 1), -- Keeper's Touch
(@ITEM_ID, 42820, 100, 1, 0, 1, 1), -- Mantle of Bouldercrag
(@ITEM_ID, 39439, 100, 1, 0, 1, 1), -- Skeleton Smashers
(@ITEM_ID, 42814, 100, 1, 0, 1, 1), -- Broken Chastity Belt
(@ITEM_ID, 43935, 100, 1, 0, 1, 1), -- Links of the Battlemender
(@ITEM_ID, 42890, 100, 1, 0, 1, 1), -- Proto-Scale Pants
(@ITEM_ID, 42810, 100, 1, 0, 1, 1), -- Wooly Cowl
-- (warrior, paladin, death knight)
(@ITEM_ID, 39104, 100, 1, 0, 1, 1), -- Hardened Bone Wrist Protectors
(@ITEM_ID, 39459, 100, 1, 0, 1, 1), -- Preservative-Stained Gauntlets
(@ITEM_ID, 39888, 100, 1, 0, 1, 1), -- Scourgebane Pauldrons
(@ITEM_ID, 42833, 100, 1, 0, 1, 1), -- Jawbreakers
(@ITEM_ID, 42882, 100, 1, 0, 1, 1), -- Thorim's Grasp
(@ITEM_ID, 43939, 100, 1, 0, 1, 1), -- Breastplate of Splattered Blood
(@ITEM_ID, 43845, 100, 1, 0, 1, 1), -- Legplates of Dominion
(@ITEM_ID, 42879, 100, 1, 0, 1, 1); -- Crown of Hyldnir

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
SET @CLASS_MAGIC = @CLASS_PRIEST + @CLASS_SHAMAN + @CLASS_MAGE + @CLASS_WARLOCK + @CLASS_DRUID;
SET @CLASS_CLOTHER = @CLASS_PRIEST + @CLASS_MAGE + @CLASS_WARLOCK;
SET @CLASS_PHYSIC = @CLASS_WARRIOR + @CLASS_PALADIN + @CLASS_HUNTER + @CLASS_ROGUE + @CLASS_DEATH_KNIGHT;
SET @CLASS_PLATE = @CLASS_WARRIOR + @CLASS_PALADIN + @CLASS_DEATH_KNIGHT;
SET @CLASS_MELEE = @CLASS_WARRIOR + @CLASS_PALADIN + @CLASS_ROGUE + @CLASS_DEATH_KNIGHT;
SET @CLASS_RANGE = @CLASS_WARRIOR + @CLASS_ROGUE + @CLASS_HUNTER;


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = @CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE AND `SourceGroup` = @ITEM_ID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`,
`ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43829, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MELEE, 0, 0, 0, 0, 0, '', "Crusader's Locket (Melee)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43837, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MAGIC, 0, 0, 0, 0, 0, '', "Softly Glowing Orb (Caster)"),
-- (@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43836, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ALL, 0, 0, 0, 0, 0, '', "Thorny Rose Brooch (All)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43880, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Fair Touch of the Crusader (Priest, Mage, Warlock)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43883, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PHYSIC, 0, 0, 0, 0, 0, '', "Arete's Command (Warrior, Paladin, Death Knight, Hunter)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43834, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MAGIC, 0, 0, 0, 0, 0, '', "Staff of Redeemed Souls (Priest, Mage, Warlock, Druid, Shaman)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43874, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MAGIC, 0, 0, 0, 0, 0, '', "Lady Nightswood's Engagement Ring (Caster)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42864, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PHYSIC, 0, 0, 0, 0, 0, '', "Frozen Mood Ring (Melee)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42848, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Razor-Sharp Icicle (Rogue)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39135, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_RANGE, 0, 0, 0, 0, 0, '', "Wyrmstalker's Bow (Hunter, Rogue, Warrior)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42793, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MAGIC, 0, 0, 0, 0, 0, '', "Locket of Snowcrest (Caster)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42808, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PHYSIC, 0, 0, 0, 0, 0, '', "Bouldercrag's Pendant (Melee)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43861, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_MAGIC, 0, 0, 0, 0, 0, '', "Bone Witch's Drape (Caster)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43924, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Illskar's Greatcloak (Warrior, Paladin)"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43889, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE + @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Hulking Abomination Hide Cloak (Rogue, Hunter)"),
-- (Priest, Mage, Warlock)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42787, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Ironwool Bindings"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42790, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "K3 Surgeon's Gloves"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43872, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Weeping Mantle"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39814, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Slippers of the Broken Front"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42785, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Mammoth Sinew Cinch"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42849, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Flowing Valkyrion Robes"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42795, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Leggings of Renewed Hope"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43859, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_CLOTHER, 0, 0, 0, 0, 0, '', "Shadow Vault Cowl"),
-- (druid)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42865, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Frost Hardened Bracers"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42866, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Fur-Lined Mittens"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42800, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Gale-Wind Guard"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42798, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Mammoth Hide Galoshes"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39402, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Binding of the Ancient Keeper"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42870, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Hibernal Chestguard"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39413, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Hydrafang Breeches"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43905, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_DRUID, 0, 0, 0, 0, 0, '', "Fur-Lined Helm"),
-- (rogue)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39038, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Fleshwerk Wristguards"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39414, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Gilly's Strangulation Gauntlets"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42805, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Njormeld's Pauldrons"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39035, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Glacier-Walker's Mukluks"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42802, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Hardened Whipping Belt"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39036, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Hulking Horror Tunic"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42867, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Cured Proto-Drake Leggings"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42872, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_ROGUE, 0, 0, 0, 0, 0, '', "Proto-Drake Cover"),
-- (hunter)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43980, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Thane's Restraints"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43933, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Gauntlets of Urgency"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42887, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Pauldrons of the Ascent"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39441, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Treads of Bound Life"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43841, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Argent Girdle"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42813, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Chestplate of the Northern Ranger"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42817, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Reforged Chain Leggings"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42895, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_HUNTER, 0, 0, 0, 0, 0, '', "Scaled Jormungar Protector"),
-- (shaman)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42888, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Summit Bracers"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39444, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Keeper's Touch"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42820, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Mantle of Bouldercrag"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39439, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Skeleton Smashers"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42814, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Broken Chastity Belt"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43935, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Links of the Battlemender"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42890, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Proto-Scale Pants"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42810, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_SHAMAN, 0, 0, 0, 0, 0, '', "Wooly Cowl"),
-- (warrior, paladin, death knight)
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39104, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Hardened Bone Wrist Protectors"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39459, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Preservative-Stained Gauntlets"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 39888, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Scourgebane Pauldrons"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42833, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Jawbreakers"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42882, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Thorim's Grasp"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43939, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Breastplate of Splattered Blood"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 43845, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Legplates of Dominion"),
(@CONDITION_SOURCE_TYPE_ITEM_LOOT_TEMPLATE, @ITEM_ID, 42879, 0, 0, @CONDITION_CLASS_MASK, 0, @CLASS_PLATE, 0, 0, 0, 0, 0, '', "Crown of Hyldnir");