UPDATE creature_template SET AIName='SmartAI' WHERE entry=24786;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=24786 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24786, 0, 0, 1, 8, 0, 100, 0, 44454, 0, 0, 0, 11, 44456, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reef Bull - On Spell Hit - Cast Spell'),
(24786, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reef Bull - On Spell Hit - Despawn');

UPDATE creature_template SET ScriptName='npc_attracted_reef_bull' WHERE entry=24804;

DELETE FROM spell_script_names WHERE spell_id=21014;
INSERT INTO spell_script_names VALUES (21014, 'spell_anuniaqs_net');

DELETE FROM `item_loot_template` WHERE `entry` = 54210;
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(54218, 1, 100, 1, 50, -424242, 1),
(54218, 2, 1, 1, 1, -424243, 1);
 
DELETE FROM `reference_loot_template` WHERE `entry` IN (424242, 424243);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(424242, 35223, 0, 1, 50, 50, 50),
(424242, 45047, 0, 1, 50, 50, 50),
(424242, 46779, 0, 1, 50, 50, 50),
(424243, 23720, 0, 1, 1, 1, 1),
(424243, 49284, 0, 1, 1, 1, 1),
(424243, 49283, 0, 1, 1, 1, 1),
(424243, 49286, 0, 1, 1, 1, 1),
(424243, 49285, 0, 1, 1, 1, 1),
(424243, 49282, 0, 1, 1, 1, 1);

-- Update loot ids for(Ymirjar Deathbringer,Ymirjar Flamebearer,Ymirjar Skycaller,Ymirjar Wrathbringer,Stonespine Gargoyle) - Same as other ICC 5man hc trash
UPDATE `creature_template` SET `lootid`=100001 WHERE `entry` IN (37641,37642,37643,37644,37622);
DELETE FROM `creature_loot_template` WHERE `entry` IN (37641,37642,37643,37644,37622);
-- New Battered Hilt Ref
DELETE FROM `reference_loot_template` WHERE `entry`=35075;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(35075, 50379, 0, 1, 1, 1, 1), -- Alliance
(35075, 50380, 0, 1, 1, 1, 1); -- Horde
-- Conditions for Battered hilt drop
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=10 AND `SourceGroup`=35075;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(10, 35075, 50379, 0, 0, 6, 0, 469, 0, 0, 0, 0, '', 'Battered Hilt Must Be Alliance'),
(10, 35075, 50380, 0, 0, 6, 0, 67, 0, 0, 0, 0, '', 'Battered Hilt Must Be Horde');
-- Add new ref to ICC 5man hc Trash Ref (0.08 percent is average of values on wowhead 4.16/52)
DELETE FROM `reference_loot_template` WHERE `entry`=35073 AND `item`=9 AND `mincountOrRef`=-35075;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(35073, 9, 0.08, 1, 0, -35075, 1);

DELETE FROM `creature_text` WHERE `entry` IN (33562, 33559, 33558, 33564, 33561, 33382, 33383, 33384, 33306, 33285, 33739, 33738, 33747, 33743, 33740, 33746, 33748, 33744, 33745, 33749);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(33383, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Aggro 1'),
(33383, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Aggro 2'),
(33383, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Aggro 3'),
(33383, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Aggro 4'),
(33383, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Defeated 1'),
(33383, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Defeated 2'),
(33383, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Defeated 3'),
(33383, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Defeated 4'),
(33383, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Victory 1'),
(33383, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Victory 2'),
(33383, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Victory 3'),
(33383, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Valiant Victory 4'),
(33384, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Aggro 1'),
(33384, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Aggro 2'),
(33384, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Aggro 3'),
(33384, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Aggro 4'),
(33384, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Defeated 1'),
(33384, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Defeated 2'),
(33384, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Defeated 3'),
(33384, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Defeated 4'),
(33384, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Victory 1'),
(33384, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Victory 2'),
(33384, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Victory 3'),
(33384, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Undercity Valiant Victory 4'),
(33306, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Aggro 1'),
(33306, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Aggro 2'),
(33306, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Aggro 3'),
(33306, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Aggro 4'),
(33306, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Defeated 1'),
(33306, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Defeated 2'),
(33306, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Defeated 3'),
(33306, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Defeated 4'),
(33306, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Victory 1'),
(33306, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Victory 2'),
(33306, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Victory 3'),
(33306, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Valiant Victory 4'),
(33285, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Aggro 1'),
(33285, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Aggro 2'),
(33285, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Aggro 3'),
(33285, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Aggro 4'),
(33285, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Defeated 1'),
(33285, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Defeated 2'),
(33285, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Defeated 3'),
(33285, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Defeated 4'),
(33285, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Victory 1'),
(33285, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Victory 2'),
(33285, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Victory 3'),
(33285, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Senjin Valiant Victory 4'),
(33382, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Aggro 1'),
(33382, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Aggro 2'),
(33382, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Aggro 3'),
(33382, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Aggro 4'),
(33382, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Defeated 1'),
(33382, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Defeated 2'),
(33382, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Defeated 3'),
(33382, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Defeated 4'),
(33382, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Victory 1'),
(33382, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Victory 2'),
(33382, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Victory 3'),
(33382, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Silvermoon Valiant Victory 4'),
(33559, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Aggro 1'),
(33559, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Aggro 2'),
(33559, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Aggro 3'),
(33559, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Aggro 4'),
(33559, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Defeated 1'),
(33559, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Defeated 2'),
(33559, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Defeated 3'),
(33559, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Defeated 4'),
(33559, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Victory 1'),
(33559, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Victory 2'),
(33559, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Victory 3'),
(33559, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Darnassus Valiant Victory 4'),
(33558, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Aggro 1'),
(33558, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Aggro 2'),
(33558, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Aggro 3'),
(33558, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Aggro 4'),
(33558, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Defeated 1'),
(33558, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Defeated 2'),
(33558, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Defeated 3'),
(33558, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Defeated 4'),
(33558, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Victory 1'),
(33558, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Victory 2'),
(33558, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Victory 3'),
(33558, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Valiant Victory 4'),
(33564, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Aggro 1'),
(33564, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Aggro 2'),
(33564, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Aggro 3'),
(33564, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Aggro 4'),
(33564, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Defeated 1'),
(33564, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Defeated 2'),
(33564, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Defeated 3'),
(33564, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Defeated 4'),
(33564, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Victory 1'),
(33564, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Victory 2'),
(33564, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Victory 3'),
(33564, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Ironforge Valiant Victory 4'),
(33561, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Aggro 1'),
(33561, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Aggro 2'),
(33561, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Aggro 3'),
(33561, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Aggro 4'),
(33561, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Defeated 1'),
(33561, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Defeated 2'),
(33561, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Defeated 3'),
(33561, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Defeated 4'),
(33561, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Victory 1'),
(33561, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Victory 2'),
(33561, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Victory 3'),
(33561, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Stormwind Valiant Victory 4'),
(33562, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Aggro 1'),
(33562, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Aggro 2'),
(33562, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Aggro 3'),
(33562, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Aggro 4'),
(33562, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Defeated 1'),
(33562, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Defeated 2'),
(33562, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Defeated 3'),
(33562, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Defeated 4'),
(33562, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Victory 1'),
(33562, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Victory 2'),
(33562, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Victory 3'),
(33562, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Exodar Valiant Victory 4'),
(33748, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Aggro 1'),
(33748, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Aggro 2'),
(33748, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Aggro 3'),
(33748, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Aggro 4'),
(33748, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Defeated 1'),
(33748, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Defeated 2'),
(33748, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Defeated 3'),
(33748, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Defeated 4'),
(33748, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Victory 1'),
(33748, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Victory 2'),
(33748, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Victory 3'),
(33748, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Thunder Bluff Champion Victory 4'),
(33749, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Aggro 1'),
(33749, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Aggro 2'),
(33749, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Aggro 3'),
(33749, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Aggro 4'),
(33749, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Defeated 1'),
(33749, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Defeated 2'),
(33749, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Defeated 3'),
(33749, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Defeated 4'),
(33749, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Victory 1'),
(33749, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Victory 2'),
(33749, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Undercity Champion Victory 3'),
(33749, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Undercity Champion Victory 4'),
(33744, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Aggro 1'),
(33744, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Aggro 2'),
(33744, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Aggro 3'),
(33744, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Aggro 4'),
(33744, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Defeated 1'),
(33744, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Defeated 2'),
(33744, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Defeated 3'),
(33744, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Defeated 4'),
(33744, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Victory 1'),
(33744, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Victory 2'),
(33744, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Victory 3'),
(33744, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Orgrimmar Champion Victory 4'),
(33745, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Aggro 1'),
(33745, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Aggro 2'),
(33745, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Aggro 3'),
(33745, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Aggro 4'),
(33745, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Defeated 1'),
(33745, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Defeated 2'),
(33745, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Defeated 3'),
(33745, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Defeated 4'),
(33745, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Victory 1'),
(33745, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Victory 2'),
(33745, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Senjin Champion Victory 3'),
(33745, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Senjin Champion Victory 4'),
(33746, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Aggro 1'),
(33746, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Aggro 2'),
(33746, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Aggro 3'),
(33746, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Aggro 4'),
(33746, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Defeated 1'),
(33746, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Defeated 2'),
(33746, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Defeated 3'),
(33746, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Defeated 4'),
(33746, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Victory 1'),
(33746, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Victory 2'),
(33746, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Victory 3'),
(33746, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Silvermoon Champion Victory 4'),
(33738, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Aggro 1'),
(33738, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Aggro 2'),
(33738, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Aggro 3'),
(33738, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Aggro 4'),
(33738, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Defeated 1'),
(33738, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Defeated 2'),
(33738, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Defeated 3'),
(33738, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Defeated 4'),
(33738, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Victory 1'),
(33738, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Victory 2'),
(33738, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Victory 3'),
(33738, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Darnassus Champion Victory 4'),
(33740, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Aggro 1'),
(33740, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Aggro 2'),
(33740, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Aggro 3'),
(33740, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Aggro 4'),
(33740, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Defeated 1'),
(33740, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Defeated 2'),
(33740, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Defeated 3'),
(33740, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Defeated 4'),
(33740, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Victory 1'),
(33740, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Victory 2'),
(33740, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Victory 3'),
(33740, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Champion Victory 4'),
(33743, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Aggro 1'),
(33743, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Aggro 2'),
(33743, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Aggro 3'),
(33743, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Aggro 4'),
(33743, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Defeated 1'),
(33743, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Defeated 2'),
(33743, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Defeated 3'),
(33743, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Defeated 4'),
(33743, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Victory 1'),
(33743, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Victory 2'),
(33743, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Victory 3'),
(33743, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Ironforge Champion Victory 4'),
(33747, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Aggro 1'),
(33747, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Aggro 2'),
(33747, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Aggro 3'),
(33747, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Aggro 4'),
(33747, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Defeated 1'),
(33747, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Defeated 2'),
(33747, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Defeated 3'),
(33747, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Defeated 4'),
(33747, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Victory 1'),
(33747, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Victory 2'),
(33747, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Victory 3'),
(33747, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Stormwind Champion Victory 4'),
(33739, 0, 0, 'Prepare yourself!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Aggro 1'),
(33739, 0, 1, 'Ready yourself!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Aggro 2'),
(33739, 0, 2, 'On your guard!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Aggro 3'),
(33739, 0, 3, 'Let it begin!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Aggro 4'),
(33739, 1, 0, 'I have been defeated.  Good fight!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Defeated 1'),
(33739, 1, 1, 'I yield to you.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Defeated 2'),
(33739, 1, 2, 'It would seem I underestimated your skills.  Well done.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Defeated 3'),
(33739, 1, 3, 'That was a well fought battle.  I yield to you.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Defeated 4'),
(33739, 2, 0, 'I have won.  Better luck another time, friend.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Victory 1'),
(33739, 2, 1, 'I am afraid you will need more practice to defeat me.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Victory 2'),
(33739, 2, 2, 'It seems you still need more practice.  Perhaps another time.', 12, 0, 100, 0, 0, 0, 'Exodar Champion Victory 3'),
(33739, 2, 3, 'Victory is mine!', 12, 0, 100, 0, 0, 0, 'Exodar Champion Victory 4');

-- Elder Harkek
SET @ENTRY := 28138;
SET @GOSSIP := 9741;
-- Add missing Gossip menu options (YTDB)
DELETE FROM `gossip_menu_option` WHERE `menu_id` = @GOSSIP AND `id` IN(2,3);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 2, 0, 'I need to find Dajik, do you have his worn chalk?', 1, 1, 0, 0, 0, 0, ''),
(@GOSSIP, 3, 0, 'I need to find Zepik, do you have his hunting horn?', 1, 1, 0, 0, 0, 0, '');
-- Add conditions for Elder Harkek Gossip
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = @GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @GOSSIP, 1, 0, 0, 2, 0, 38619, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Goregek''s Shackles'),
(15, @GOSSIP, 1, 0, 0, 9, 0, 12529, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if palyer Has Taken Quest The Ape Hunter''s Slave'),
(15, @GOSSIP, 1, 0, 2, 2, 0, 38619, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Goregek''s Shackles'),
(15, @GOSSIP, 1, 0, 2, 8, 0, 12529, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if palyer Has Rewarded Quest The Ape Hunter''s Slave'),
(15, @GOSSIP, 2, 0, 0, 2, 0, 38621, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajik''s Worn Chalk'),
(15, @GOSSIP, 2, 0, 0, 9, 0, 12534, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Sapphire Queen'),
(15, @GOSSIP, 2, 0, 1, 2, 0, 38621, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajik''s Worn Chalk'),
(15, @GOSSIP, 2, 0, 1, 9, 0, 12533, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest The Wasp Hunter''s Apprentice'),
(15, @GOSSIP, 2, 0, 2, 2, 0, 38621, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajik''s Worn Chalk'),
(15, @GOSSIP, 2, 0, 2, 8, 0, 12534, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Sapphire Queen'),
(15, @GOSSIP, 2, 0, 3, 2, 0, 38621, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Dajik''s Worn Chalk'),
(15, @GOSSIP, 2, 0, 3, 8, 0, 12533, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has Rewarded Quest The Wasp Hunter''s Apprentice'),
(15, @GOSSIP, 3, 0, 0, 2, 0, 38512, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepik''s Hunting Horn'),
(15, @GOSSIP, 3, 0, 0, 9, 0, 12536, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has Taken Quest A Rough Ride'),
(15, @GOSSIP, 3, 0, 1, 2, 0, 38512, 1, 0, 1, 0, '', 'Elder Harkek - Show Gossip if player doesn''t already have Zepik''s Hunting Horn'),
(15, @GOSSIP, 3, 0, 1, 8, 0, 12536, 0, 0, 0, 0, '', 'Elder Harkek - Show Gossip if player Has been Rewarded Quest A Rough Ride');
-- Add SmartAI Elder Harkek
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `id`  IN (4,5,6,7);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 4, 7, 62, 0, 100, 0, @GOSSIP, 1, 0, 0, 11, 52542, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On gossip selction 1 - Cast Forceitem Goregek'),
(@ENTRY, 0, 5, 7, 62, 0, 100, 0, @GOSSIP, 2, 0, 0, 11, 52544, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On gossip selction 2 - Cast Forceitem Dajik'),
(@ENTRY, 0, 6, 7, 62, 0, 100, 0, @GOSSIP, 3, 0, 0, 11, 52545, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On gossip selction 3 - Cast Forceitem Zepik'),
(@ENTRY, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Elder Harkek - On link - close gossip');
-- Update Quest template To give item Dajik''s Worn Chalk when starting The Wasp Hunter's Apprentice and Zepik's Hunting Horn on a rough ride
UPDATE `quest_template` SET `SourceSpellId`=52545 WHERE `Id`=12536;
UPDATE `quest_template` SET `SourceSpellId`=52544 WHERE `Id`=12533;

-- Nerub'ar Broodkeeper
SET @ENTRY1 := 36725;
SET @SOURCETYPE1 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY1 AND `source_type`=@SOURCETYPE1;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY1 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY1,@SOURCETYPE1,1,0,0,0,100,0,3000,4000,2000,3000,11,70965,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Nerub'Ar Broodkeeper Crypt Scarabs"),
(@ENTRY1,@SOURCETYPE1,2,0,0,0,100,0,7000,8000,15000,16000,11,70980,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Nerub'Ar Brookeeper Web Wrap"),
(@ENTRY1,@SOURCETYPE1,3,0,2,0,100,0,70,71,20000,21000,11,71020,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Nerub'Ar Broodkeeper Dark Mending");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY1 AND `source_type`=@SOURCETYPE1;
 
-- Servant of the Throne
SET @ENTRY2 := 36724;
SET @SOURCETYPE2 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2 AND `source_type`=@SOURCETYPE2;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY2 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY2,@SOURCETYPE2,0,0,0,0,100,0,1000,3000,3000,5000,11,71029,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Servant of the Throne Blast");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY2 AND `source_type`=@SOURCETYPE2;
 
-- Deathbound Ward
SET @ENTRY3 := 37007;
SET @SOURCETYPE3 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY3 AND `source_type`=@SOURCETYPE3;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY3 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY3,@SOURCETYPE3,0,0,0,0,100,30,13000,15000,20000,21000,11,71022,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathbound Ward Disrupting Shout"),
(@ENTRY3,@SOURCETYPE3,1,0,0,0,100,30,1000,2000,1000,2000,11,71021,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathbound Ward Saber Lash");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY3 AND `source_type`=@SOURCETYPE3;
 
-- Ancient Skeletal Soldier
SET @ENTRY4 := 37012;
SET @SOURCETYPE4 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY4 AND `source_type`=@SOURCETYPE4;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY4 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY4,@SOURCETYPE4,0,0,0,0,100,30,1000,2000,7000,8000,11,70964,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ancient Skeletal Soldier");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY4 AND `source_type`=@SOURCETYPE4;
 
-- Deathspeaker Attendant
SET @ENTRY5 := 36811;
SET @SOURCETYPE5 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY5 AND `source_type`=@SOURCETYPE5;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY5 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY5,@SOURCETYPE5,0,0,0,0,100,0,1000,2000,2000,3000,11,69387,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Attendant Shadow Bolt"),
(@ENTRY5,@SOURCETYPE5,1,0,0,0,100,0,5000,6000,6000,7000,11,69355,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Attendant Shadow Nova");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY5 AND `source_type`=@SOURCETYPE5;
 
-- Deathspeaker Disciple
SET @ENTRY6 := 36807;
SET @SOURCETYPE6 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY6 AND `source_type`=@SOURCETYPE6;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY6 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY6,@SOURCETYPE6,0,0,0,0,100,0,1000,2000,2000,3000,11,69387,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Disciple Shadow Bolt"),
(@ENTRY6,@SOURCETYPE6,1,0,2,0,100,0,70,71,20000,21000,11,69389,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Disciple Shadow Mend"),
(@ENTRY6,@SOURCETYPE6,2,0,0,0,100,0,4000,5000,18000,19000,11,69391,1,0,0,0,0,16,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Disciple Dark Blessing ");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY6 AND `source_type`=@SOURCETYPE6;
 
-- Deathspeaker High Priest
SET @ENTRY7 := 36829;
SET @SOURCETYPE7 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY7 AND `source_type`=@SOURCETYPE7;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY7 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY7,@SOURCETYPE7,0,0,4,0,100,30,0,0,0,0,11,69491,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC High Priest Aura of Darkness"),
(@ENTRY7,@SOURCETYPE7,1,0,0,0,100,30,1000,20000,1000,20000,11,69483,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC High Priest Dark Reckoning");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY7 AND `source_type`=@SOURCETYPE7;
 
-- Deathspeaker Servant
SET @ENTRY8 := 36805;
SET @SOURCETYPE8 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY8 AND `source_type`=@SOURCETYPE8;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY8 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY8,@SOURCETYPE8,0,0,0,0,100,0,1000,2000,2500,3500,11,69576,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Attendant Chaos Bolt"),
(@ENTRY8,@SOURCETYPE8,1,0,0,0,100,0,5000,6000,15000,20000,11,69405,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Attendant Consuming Shadows"),
(@ENTRY8,@SOURCETYPE8,2,0,0,0,100,0,7000,8000,19000,20000,11,69404,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Attendant Curse of Agony");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY8 AND `source_type`=@SOURCETYPE8;
 
-- Deathspeaker Zealot
SET @ENTRY9 := 36808;
SET @SOURCETYPE9 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY9 AND `source_type`=@SOURCETYPE9;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY9 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY9,@SOURCETYPE9,0,0,0,0,100,30,1000,2000,1000,2000,11,69492,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Deathspeaker Zealot Shadow Cleave");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY9 AND `source_type`=@SOURCETYPE9;
 
-- Val'kyr Herald
SET @ENTRY10 := 37098;
SET @SOURCETYPE10 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY10 AND `source_type`=@SOURCETYPE10;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY10 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY10,@SOURCETYPE10,0,0,0,0,100,0,5000,7000,15000,17000,11,71906,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Val'Kyr Herald Severed Essence");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY10 AND `source_type`=@SOURCETYPE10;
 
-- Blighted Abomination
SET @ENTRY11 := 37022;
SET @SOURCETYPE11 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY11 AND `source_type`=@SOURCETYPE11;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY11 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY11,@SOURCETYPE11,0,0,0,0,100,0,1000,2000,1000,2000,11,40504,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Blighted Abomination Cleave"),
(@ENTRY11,@SOURCETYPE11,1,0,0,0,100,0,8000,10000,17000,19000,11,71150,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Blighted Abomination Plague Cloud"),
(@ENTRY11,@SOURCETYPE11,2,0,0,0,100,0,0,2000,10000,12000,11,71140,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Blighted Abomination");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY11 AND `source_type`=@SOURCETYPE11;
 
-- Vengeful Fleshreaper
SET @ENTRY12 := 37038;
SET @SOURCETYPE12 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY12 AND `source_type`=@SOURCETYPE12;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY12 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY12,@SOURCETYPE12,0,0,0,0,100,0,2000,5000,15000,17000,11,71164,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Vengeful Fleshreaper Face Maul");

-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY12 AND `source_type`=@SOURCETYPE12;
 
-- Plague Scientist
SET @ENTRY13 := 37023;
SET @SOURCETYPE13 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY13 AND `source_type`=@SOURCETYPE13;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY13 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY13,@SOURCETYPE13,0,0,0,0,100,0,2000,3000,23000,24000,11,71103,0,0,0,0,0,6,0,0,0,0.0,0.0,0.0,0.0,"ICC Plague Scientist Combobulating Spray"),
(@ENTRY13,@SOURCETYPE13,1,0,0,0,100,0,5000,6000,5000,6000,11,73079,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Plague Scientist Plague Blast");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY13 AND `source_type`=@SOURCETYPE13;
 
-- Pustulating Horror
SET @ENTRY14 := 10404;
SET @SOURCETYPE14 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY14 AND `source_type`=@SOURCETYPE14;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY14 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY14,@SOURCETYPE14,0,0,0,0,100,0,2000,3000,16000,20000,11,71089,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Pustulating Horror Bubbling Pus"),
(@ENTRY14,@SOURCETYPE14,1,0,2,0,100,0,10,11,0,30000,11,71088,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Pustulating Horror Blight Bomb");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY14 AND `source_type`=@SOURCETYPE14;
 
-- Decaying Colossus
SET @ENTRY15 := 36880;
SET @SOURCETYPE15 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY15 AND `source_type`=@SOURCETYPE15;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY15 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY15,@SOURCETYPE15,0,0,0,0,100,0,5000,6000,21000,22000,11,71114,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Decaying Colossus Massive Stomp");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY15 AND `source_type`=@SOURCETYPE15;
 
-- Darkfallen Archmage
SET @ENTRY16 := 37664;
SET @SOURCETYPE16 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY16 AND `source_type`=@SOURCETYPE16;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY16 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY16,@SOURCETYPE16,0,0,0,0,100,0,1000,3000,33000,34000,11,70408,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Archmage Amplify Damage"),
(@ENTRY16,@SOURCETYPE16,1,0,0,0,100,0,5000,6000,20000,21000,11,70407,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Archmage Blast Wave"),
(@ENTRY16,@SOURCETYPE16,2,0,0,0,100,0,2000,3000,3000,4000,11,70409,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Archmage Fireball"),
(@ENTRY16,@SOURCETYPE16,3,0,0,0,100,0,7000,8000,23000,24000,11,70410,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Archmage Polymorph");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY16 AND `source_type`=@SOURCETYPE16;
 
-- Darkfallen Blood Knight
SET @ENTRY17 := 37595;
SET @SOURCETYPE17 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY17 AND `source_type`=@SOURCETYPE17;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY17 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY17,@SOURCETYPE17,0,0,0,0,100,0,2000,3000,25000,26000,11,70451,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Bloodknight Blood Mirror"),
(@ENTRY17,@SOURCETYPE17,1,0,0,0,100,0,1000,2000,1000,2000,11,70437,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Bloodknight Unholy Strike"),
(@ENTRY17,@SOURCETYPE17,2,0,4,0,100,0,0,0,0,0,11,71736,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Bloodknight Vampiric Aura");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY17 AND `source_type`=@SOURCETYPE17;
 
-- Darkfallen Noble
SET @ENTRY18 := 37663;
SET @SOURCETYPE18 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY18 AND `source_type`=@SOURCETYPE18;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY18 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY18,@SOURCETYPE18,0,0,0,0,100,0,3000,4000,15000,16000,11,70645,1,0,0,0,0,6,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Noble Chains of Shadow"),
(@ENTRY18,@SOURCETYPe18,1,0,0,0,100,0,1000,2000,2000,3000,11,72960,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Noble Shadow Bolt");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY18 AND `source_type`=@SOURCETYPE18;
 
-- Darkfallen Advisor
SET @ENTRY19 := 37571;
SET @SOURCETYPE19 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY19 AND `source_type`=@SOURCETYPE19;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY19 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY19,@SOURCETYPE19,0,0,0,0,100,0,3000,4000,10000,11000,11,72057,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Advisor Lich Slap"),
(@ENTRY19,@SOURCETYPE19,1,0,0,0,100,0,10000,11000,22000,23000,11,72065,1,0,0,0,0,16,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Advisor Shroud of Protection"),
(@ENTRY19,@SOURCETYPE19,2,0,0,0,100,0,14000,15000,23000,24000,11,72066,1,0,0,0,0,16,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Advisor Shroud of Spell Warding");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY19 AND `source_type`=@SOURCETYPE19;
 
-- Darkfallen Tactician
SET @ENTRY20 := 37666;
SET @SOURCETYPE20 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY20 AND `source_type`=@SOURCETYPE20;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY20 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY20,@SOURCETYPE20,0,0,0,0,100,0,1000,2000,20000,21000,11,70431,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Tactician Shadowstep"),
(@ENTRY02,@SOURCETYPE20,1,0,0,0,100,0,3000,4000,20000,21000,11,70432,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Tactician Blood Sap"),
(@ENTRY20,@SOURCETYPE20,2,0,0,0,100,0,1000,2000,1000,2000,11,70437,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Tactician Unholy Strike");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY20 AND `source_type`=@SOURCETYPE20;
 
-- Darkfallen Lieutenant
SET @ENTRY21 := 37665;
SET @SOURCETYPE21 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY21 AND `source_type`=@SOURCETYPE21;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY21 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY21,@SOURCETYPE21,0,0,0,0,100,0,2000,3000,20000,21000,11,70423,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Lieutenant Vampiric Curse"),
(@ENTRY21,@SOURCETYPE21,1,0,0,0,100,0,1000,2000,12000,13000,11,70435,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Lieutant Rend Flesh");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY21 AND `source_type`=@SOURCETYPE21;
 
-- Darkfallen Commander
SET @ENTRY22 := 37662;
SET @SOURCETYPE22 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY22 AND `source_type`=@SOURCETYPE22;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY22 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY22,@SOURCETYPE22,0,0,0,0,100,0,1000,2000,30000,31000,11,70750,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Commander Battle Shout"),
(@ENTRY22,@SOURCETYPE22,1,0,0,0,100,0,3000,4000,10000,11000,11,70449,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Darkfallen Vampire Rush");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY22 AND `source_type`=@SOURCETYPE22;
 
-- Ymirjar Huntress
SET @ENTRY23 := 37134;
SET @SOURCETYPE23 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY23 AND `source_type`=@SOURCETYPE23;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY23 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY23,@SOURCETYPE23,0,0,0,0,100,0,0,2000,30000,31000,11,71249,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Huntress Ice Trap"),
(@ENTRY23,@SOURCETYPE23,1,0,0,0,100,0,7000,8000,23000,24000,11,71252,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Huntress Volley"),
(@ENTRY23,@SOURCETYPE23,2,0,0,0,100,0,4000,5000,18000,19000,11,71251,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Huntress Rapid Shot");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY23 AND `source_type`=@SOURCETYPE23;
 
-- Ymirjar Warlord
SET @ENTRY24 := 37133;
SET @SOURCETYPE24 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY24 AND `source_type`=@SOURCETYPE24;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY24 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY24,@SOURCETYPE24,0,0,0,0,100,0,3000,4000,10000,11000,11,41056,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Warlord Whirlwind");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY24 AND `source_type`=@SOURCETYPE24;
 
-- Ymirjar Battle-Maiden
SET @ENTRY25 := 37132;
SET @SOURCETYPE25 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY25 AND `source_type`=@SOURCETYPE25;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY25 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY25,@SOURCETYPE25,0,0,0,0,100,0,1000,2000,15000,16000,11,71258,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Battle-Maiden Adrenaline Rush"),
(@ENTRY25,@SOURCETYPE25,1,0,0,0,100,0,2000,3000,3000,4000,11,71257,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Battle-Maiden Barbaric Strike");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY25 AND `source_type`=@SOURCETYPE25;
 
-- Ymirjar Deathbringer
SET @ENTRY26 := 38125;
SET @SOURCETYPE26 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY26 AND `source_type`=@SOURCETYPE26;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY26 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY26,@SOURCETYPE26,0,2,0,0,100,0,4000,5000,13000,14000,11,71298,1,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Deathbringer Banish"),
(@ENTRY26,@SOURCETYPE26,1,2,0,0,100,0,6000,7000,25000,26000,11,71299,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Deathbringer Death's Embrace"),
(@ENTRY26,@SOURCETYPE26,2,0,0,0,100,0,1000,2000,2000,3000,11,71296,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Deathbringer Shadow Bolt ");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY26 AND `source_type`=@SOURCETYPE26;
 
-- Ymirjar Frostbinder
SET @ENTRY27 := 37127;
SET @SOURCETYPE27 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY27 AND `source_type`=@SOURCETYPE27;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY27 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY27,@SOURCETYPE27,0,0,0,0,100,0,1000,2000,30000,31000,11,71270,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Frostbinder Arctic Chill"),
(@ENTRY27,@SOURCETYPE27,1,0,0,0,100,0,7000,8000,20000,21000,11,71306,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Ymirjar Frostbinder Twisted Winds");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY27 AND `source_type`=@SOURCETYPE27;
 
-- Frostwarden Handler
SET @ENTRY28 := 37531;
SET @SOURCETYPE28 := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY28 AND `source_type`=@SOURCETYPE28;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY28 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY28,@SOURCETYPE28,0,0,0,0,100,0,3000,4000,16000,18000,11,71337,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"ICC Frostwarden Handler Concussive Shock"),
(@ENTRY28,@SOURCETYPE28,1,0,0,0,100,0,1000,2000,10000,11000,11,71357,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"ICC Frostwarden Handler Order Whelp");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY28 AND `source_type`=@SOURCETYPE28;

-- Here are some modifications to the actual spiders and the backup
UPDATE creature
SET position_z='4'
WHERE ID='36725'
-- UPDATE creature SET position_z='80' WHERE ID='36725'
 
 
-- Here are the trigger implementations in creature and creature_template table
-- Replace XXXXX with what value you want in your creature_template
 
SET @ENTRY := 314365;
SET @SOURCETYPE := 0;
 
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags)
VALUES(@ENTRY*100+1, @ENTRY, 631, 3, 1, 0, 0, -220.382, 2177.07, 37.9852, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+2, @ENTRY, 631, 3, 1, 0, 0, -220.382, 2245.79, 37.9852, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+3, @ENTRY, 631, 3, 1, 0, 0, -250.402 , 2202.06 , 42.5644, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+4, @ENTRY, 631, 3, 1, 0, 0, -250.402 , 2219.13, 42.5644, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+5, @ENTRY, 631, 3, 1, 0, 0, -211.498 , 2219.28 , 35.2236, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+6, @ENTRY, 631, 3, 1, 0, 0, -211.498 , 2202.06, 35.2236, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+7, @ENTRY, 631, 3, 1, 0, 0, -310.327, 2202.06, 42.0143, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0),
(@ENTRY*100+8, @ENTRY, 631, 3, 1, 0, 0, -310.327, 2219.13, 42.0143, 0.855211, 86400, 0, 0, 99999999, 9999999, 0, 0, 0, 0);
-- DELETE FROM creature WHERE `id`=@ENTRY
 
INSERT INTO Creature_template
VALUES (@ENTRY, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'NerubAr Trigger', '', '', 0, 1, 1, 0, 14, 14, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 33554432, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 1, 1000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2147483647, 0, '', 0);
-- DELETE FROM creature_template WHERE `entry`=@ENTRY
 
-- Here is the SAI for the trigger, after finishing it's purpose it will kill itself and it will respawn just like other mobs, after 1 hour
 
-- NerubAr Trigger
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,12,36725,7,300000,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"nerub aggro"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,3000,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"trigger die");
-- DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;

UPDATE  `gameobject_template` SET  `data0` =  '59096' WHERE  `entry` =193772; -- Dal to WG portal, correct spell
DELETE FROM spell_target_position WHERE id IN ('59096', '58632', '58633');
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
('59096', '571', '5325.06', '2843.36', '409.285', '3.20278'),
('58632', '571', '5097.79', '2180.29', '365.61', '2.41'),
('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

DELETE FROM `creature_loot_template` WHERE `entry` IN (36497,36498,36502,37677,36494,37613,36476,37627,36658,36938,38112,38599,38113,38603) AND `item`=43228;
INSERT INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(36497,43228,100,1,0,4,4), -- Bronjahm normal/heroic
(36498,43228,100,1,0,4,4),
(36502,43228,100,1,0,4,4), -- Devourer normal/heroic
(37677,43228,100,1,0,4,4),
(36494,43228,100,1,0,4,4), -- Garfrost normal/heroic
(37613,43228,100,1,0,4,4),
(36476,43228,100,1,0,4,4), -- Ick normal/heroic
(37627,43228,100,1,0,4,4),
(36658,43228,100,1,0,4,4), -- Scourgelord normal/heroic
(36938,43228,100,1,0,4,4),
(38112,43228,100,1,0,4,4), -- Falric normal/heroic
(38599,43228,100,1,0,4,4),
(38113,43228,100,1,0,4,4), -- Marwyn normal/heroic
(38603,43228,100,1,0,4,4);

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (27985,27993) AND `item`=43228;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES -- LK chest HoR
(27985,43228,100,1,0,4,4),
(27993,43228,100,1,0,4,4);

DELETE FROM `conditions` WHERE `SourceGroup` IN (36497,36498,36502,37677,36494,37613,36476,37627,36658,36938,38112,38599,38113,38603,27985,27993) AND `SourceEntry`=43228;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1,36497,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36498,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36502,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,37677,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36494,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,37613,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36476,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,37627,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36658,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,36938,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,38112,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,38599,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,38113,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(1,38603,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(4,27985,43228,0,0,1,0,57940,0,0,0,0,'', NULL),
(4,27993,43228,0,0,1,0,57940,0,0,0,0,'', NULL);

-- ARGENT SQUIRE/GRUNTLING
-- Gossip flag
UPDATE creature_template SET npcflag = 129, gossip_menu_id = 50000, ScriptName = 'npc_argent_pet', `IconName` =  'Speak' WHERE entry = 33238;
UPDATE creature_template SET npcflag = 129, gossip_menu_id = 50001, ScriptName = 'npc_argent_pet', `IconName` =  'Speak' WHERE entry = 33239;

DELETE FROM gossip_menu WHERE entry IN (50000, 50001);
INSERT INTO gossip_menu VALUES
(50000, 14324),
(50001, 14372);

DELETE FROM spell_linked_spell WHERE spell_effect = 67401;
INSERT INTO spell_linked_spell VALUES
(-67368, 67401, 0, "Argent Squire - Bank"),
(-67377, 67401, 0, "Argent Squire - Shop"),
(-67376, 67401, 0, "Argent Squire - Mail");

DELETE FROM npc_vendor WHERE entry IN (33238, 33239);
INSERT INTO npc_vendor VALUES
-- Squire
(33238, 0, 3775, 0, 0, 0),
(33238, 0, 5237, 0, 0, 0),
(33238, 0, 5565, 0, 0, 0),
(33238, 0, 16583, 0, 0, 0),
(33238, 0, 17020, 0, 0, 0),
(33238, 0, 17030, 0, 0, 0),
(33238, 0, 17031, 0, 0, 0),
(33238, 0, 17032, 0, 0, 0),
(33238, 0, 17033, 0, 0, 0),
(33238, 0, 21177, 0, 0, 0),
(33238, 0, 37201, 0, 0, 0),
(33238, 0, 41584, 0, 0, 0),
(33238, 0, 41586, 0, 0, 0),
(33238, 0, 43231, 0, 0, 0),
(33238, 0, 43233, 0, 0, 0),
(33238, 0, 43235, 0, 0, 0),
(33238, 0, 43237, 0, 0, 0),
(33238, 0, 44605, 0, 0, 0),
(33238, 0, 44614, 0, 0, 0),
(33238, 0, 44615, 0, 0, 0),

(33238, 0, 33449, 0, 0, 0),
(33238, 0, 33451, 0, 0, 0),
(33238, 0, 33454, 0, 0, 0),
(33238, 0, 33443, 0, 0, 0),
(33238, 0, 35949, 0, 0, 0),
(33238, 0, 35952, 0, 0, 0),
(33238, 0, 35953, 0, 0, 0),
(33238, 0, 35951, 0, 0, 0),
(33238, 0, 35948, 0, 0, 0),
(33238, 0, 35950, 0, 0, 0),

-- Gruntling
(33239, 0, 3775, 0, 0, 0),
(33239, 0, 5237, 0, 0, 0),
(33239, 0, 5565, 0, 0, 0),
(33239, 0, 16583, 0, 0, 0),
(33239, 0, 17020, 0, 0, 0),
(33239, 0, 17030, 0, 0, 0),
(33239, 0, 17031, 0, 0, 0),
(33239, 0, 17032, 0, 0, 0),
(33239, 0, 17033, 0, 0, 0),
(33239, 0, 21177, 0, 0, 0),
(33239, 0, 37201, 0, 0, 0),
(33239, 0, 41584, 0, 0, 0),
(33239, 0, 41586, 0, 0, 0),
(33239, 0, 43231, 0, 0, 0),
(33239, 0, 43233, 0, 0, 0),
(33239, 0, 43235, 0, 0, 0),
(33239, 0, 43237, 0, 0, 0),
(33239, 0, 44605, 0, 0, 0),
(33239, 0, 44614, 0, 0, 0),
(33239, 0, 44615, 0, 0, 0),

(33239, 0, 33449, 0, 0, 0),
(33239, 0, 33451, 0, 0, 0),
(33239, 0, 33454, 0, 0, 0),
(33239, 0, 33443, 0, 0, 0),
(33239, 0, 35949, 0, 0, 0),
(33239, 0, 35952, 0, 0, 0),
(33239, 0, 35953, 0, 0, 0),
(33239, 0, 35951, 0, 0, 0),
(33239, 0, 35948, 0, 0, 0),
(33239, 0, 35950, 0, 0, 0);


UPDATE `creature_template` SET `modelid1` = 25455, `modelid2` = 0, `unit_flags` = 33555202, `flags_extra` = 129, `ScriptName` = 'npc_sindragosas_ward' WHERE `entry` = 37503;
DELETE FROM `creature` WHERE `id` = 37503;
INSERT INTO `creature` (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(37503, 631, 15, 1, 0, 0, 4181.54, 2551.65, 211.033, 4.72777, 604800, 0, 0, 27890000, 8516000, 0, 0, 0, 0);
UPDATE `gameobject` SET `state` = 0 WHERE `id` = 201373;
DELETE FROM `areatrigger_scripts` WHERE `entry` = 5623;
INSERT INTO `areatrigger_scripts` (entry, ScriptName) VALUES
(5623, 'at_icc_start_sindragosa_gauntlet');
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `exp` = 2, `faction_A` = 21, `faction_H` = 21, `mechanic_immune_mask` = 8388624 WHERE `entry` IN (37228, 37229, 37232, 37501, 37502, 38197, 38198, 38362, 38134, 38137);
UPDATE `creature_template` SET `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 7.5, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` IN (37228, 37229);
UPDATE `creature_template` SET `mindmg` = 422, `maxdmg` = 586, `attackpower` = 642, `dmg_multiplier` = 13, `lootid` = 100002, `minrangedmg` = 345, `maxrangedmg` = 509, `rangedattackpower` = 103 WHERE `entry` IN (38134, 38137);
UPDATE `creature_template` SET `dmg_multiplier` = 2 WHERE `entry` = 38362;
UPDATE `creature_template` SET `difficulty_entry_1` = 38134 WHERE `entry` = 37228;
UPDATE `creature_template` SET `difficulty_entry_1` = 38137 WHERE `entry` = 37229;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (37228, 37229, 37501, 37502);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (37228, 37229, 37501, 37502) AND `source_type` = 0;	
INSERT INTO `smart_scripts` (entryorguid, source_type, id, link, event_type, event_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action_type, action_param1, action_param2, action_param3, action_param4, action_param5, action_param6, target_type, target_param1, target_param2, target_param3, target_x, target_y, target_z, target_o, comment) VALUES
-- Frostwarden Warrior: 37228 / 38134
(37228, 0, 0, 0, 0, 0, 100, 30, 5000, 15000, 10000, 25000, 11, 71323, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Warrior - Cast Frostblade'),
(37228, 0, 1, 0, 6, 0, 100, 30, 0, 0, 0, 0, 11, 71203, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Warrior - Cast Soul Feast On Death'),
-- Frostwarden Sorceress: 37229 / 38137
(37229, 0, 0, 0, 0, 0, 100, 20, 15000, 20000, 20000, 25000, 11, 71331, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Sorceress - Cast Ice Tomb (25 man only)'),
(37229, 0, 1, 0, 0, 0, 100, 30, 10000, 15000, 10000, 20000, 11, 71320, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Sorceress - Cast Frost Nova'),
(37229, 0, 2, 0, 0, 0, 100, 30, 3000, 5000, 3000, 4000, 11, 71318, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Sorceress - Cast Frostbolt'),
(37229, 0, 3, 0, 6, 0, 100, 30, 0, 0, 0, 0, 11, 71203, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Frostwarden Sorceress - Cast Soul Feast On Death'),
-- Nerub'ar Champion: 37501 / 38197
(37501, 0, 0, 0, 0, 0, 100, 30, 3000, 5000, 10000, 15000, 11, 71801, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nerub\'ar Champion - Cast Rush'),
(37501, 0, 1, 0, 6, 0, 100, 30, 0, 0, 0, 0, 11, 71203, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nerub\'ar Champion - Cast Soul Feast On Death'),
-- Nerub'ar Webweaver: 37502 / 38198
(37502, 0, 0, 0, 0, 0, 100, 30, 3000, 5000, 10000, 15000, 11, 71326, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Nerub\'ar Webweaver - Cast Crypt Scarabs'),	
(37502, 0, 1, 0, 0, 0, 100, 30, 10000, 15000, 10000, 20000, 11, 71327, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Nerub\'ar Webweaver - Cast Web'),
(37502, 0, 2, 0, 6, 0, 100, 30, 0, 0, 0, 0, 11, 71203, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Nerub\'ar Webweaver - Cast Soul Feast On Death');
