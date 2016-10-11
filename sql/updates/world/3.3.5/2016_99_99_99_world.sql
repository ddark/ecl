<<<<<<< HEAD
UPDATE `creature_template` SET `ScriptName`='npc_pit_of_saron_icicle' WHERE `entry`=36847;
DELETE FROM `creature` WHERE `id`=32780 AND `guid` IN (202016,202240,201907,201923,202162,202021,202194,202235,202241,202020,202272,202169,202189,202262,202220,202245,202234,202219,202226,201933,202106,202123,201832,202025,202252,202039,202224,202274,202052,202133,202267,201966,202005,202066,202116,202153,202201,201896,202138,202218,201913,202004,201995,202178,202268,202280,202040,202176,201979,202090,202134,202154,202243,201895,202073,202195,202251,202167,202064,201972,201993,202117,201891,201812,201929,202012,202173,202092,202247,202136,201925,202239);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=12994 AND `type`=18;
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_pos_ice_shards';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(70827, 'spell_pos_ice_shards');

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5580,5581);
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(5580, 'at_pit_cavern_entrance'),
(5581, 'at_pit_cavern_end');

DELETE FROM `creature_text` WHERE `entry`=36794 AND `groupid`=3;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(36794,3,0,'Rimefang, trap them within the tunnel! BURY THEM ALIVE!',14,0,100,0,0,16757,36714,1,'SAY');
=======
SET @ENTRY := 2031;
DELETE FROM `trinity_string` WHERE `entry` BETWEEN @ENTRY AND @ENTRY+14;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(@ENTRY+0,  'The anticheat system has reported that you may be cheating. You will be monitored to confirm if this is accurate.'),
(@ENTRY+1,  'The anticheat system is disabled.'),
(@ENTRY+2,  'The anticheat system is now enabled!'),
(@ENTRY+3,  'The anticheat system is now disabled!'),
(@ENTRY+4,  'Information about player %s'),
(@ENTRY+5,  'Average: %f || Total Reports: %u'),
(@ENTRY+6,  'Speed Reports: %u || Fly Reports: %u || Jump Reports: %u'),
(@ENTRY+7,  'Walk on Water Reports: %u || Teleport to Plane Reports: %u'),
(@ENTRY+8,  'Climb Reports: %u'),
(@ENTRY+9,  '|cFFFFFC00[AC] |cffffffff|Hplayer:%s|h[%s]|h|r|cFF00FFFF Possible cheater!|r'),
(@ENTRY+10, '============================='),
(@ENTRY+11, 'Players with the lowest averages:'),
(@ENTRY+12, 'Player: %s Average: %f Total Reports: %u'),
(@ENTRY+13, 'Players with the most reports:'),
(@ENTRY+14, 'Player: %s Total Reports: %u Average: %f');

DELETE FROM `command` WHERE `permission` BETWEEN 837 AND 842;
INSERT INTO `command` (`name`, `permission`, `help`) VALUES
('anticheat', 837, 'Syntax: .anticheat $subcommand\nType .anticheat to see the list of possible subcommands or .help anticheat $subcommand to see info on subcommands'),
('anticheat global', 838, 'Syntax: .anticheat global\n\nShows top 3 global anticheat stadistics'),
('anticheat player', 839, 'Syntax: .anticheat player [$name]\n\nShows anticheat stadistics for player $name or selected player if not provided'),
('anticheat handle', 840, 'Syntax: .anticheat handle on|off\n\nEnables/disables AC system'),
('anticheat jail', 841, 'Syntax: .anticheat jail [$name]\n\nSends GM and player $name (or selected player if not provided) to Jail for interrogation, also freezes player in place'),
('anticheat warn', 842, 'Syntax: .anticheat warn [$name]\n\nSends a ''friendly'' warning to player $name (or selected player if not provided)');
>>>>>>> 9c7ab97318970dcbb24c2533aa6f58e513b13f2c
