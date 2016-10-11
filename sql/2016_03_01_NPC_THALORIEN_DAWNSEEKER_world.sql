-- Thalorien Dawnseeker's Remains
SET @ENTRY := 37552;

UPDATE `creature_template` SET `faction`=1770 WHERE `entry`=@ENTRY;


-- Phase
DELETE FROM `spell_area` WHERE `spell`=70193;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
('70193', '4075', '24535', '0', '0', '0', '2', '1', '8', '11'),
('70193', '4075', '24563', '0', '0', '0', '2', '1', '8', '11');

SET @CGUID := 600009;

DELETE FROM `creature` WHERE `guid`=@CGUID;
