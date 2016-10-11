--
UPDATE `quest_template` SET `AllowableRaces`=32 WHERE `ID`=748;

UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID`=364;
UPDATE `quest_template` SET `AllowableRaces`=0 WHERE `ID` IN (364, 3901);

UPDATE `quest_template` SET `AllowableRaces`=0 WHERE `ID` IN (367, 368, 369, 492);
--
DELETE FROM `gameobject_template` WHERE `entry` IN (181290);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES
(181290,6,0,'Midsummer Bonfire Spawn Trap','','','',0,0,1,0,0,0,28784,0,0,-1,0,0,0,0,0,0,'','',0);
--
UPDATE `quest_request_items` SET `CompletionText`="Did you find the Syndicate Shadow Mages, and collect from them the blood?" WHERE `ID`=1066;

UPDATE `quest_request_items` SET CompletionText="Did you secure the books? They need to be kept out of the wrong hands." WHERE ID = 14356;
UPDATE `quest_offer_reward` SET RewardText="Good, $C. You've done well. I'll keep these safe from prying eyes; the last thing we need is a strong Shadow Council rising up again.$B$BCheck back with me in the future; there's always something that needs doing around here, apparently, and I might need another able body." WHERE ID = 14356;

UPDATE `page_text` SET `Text`="Supervisor Fizsprocket, please find enclosed a list of the equipment you have requisitioned, approved by President Razdunk.$B$BHe has asked me to remind and to emphasize to you of the Venture Company's vested interest in setting up operations throughout Kalimdor. Our drilling and mining outposts in the Barrens have proven profitable and efficient, but we still await sufficient production numbers from Mulgore, your jurisdiction.$B$BThe advisory board understands the difficulties in establishing" WHERE `ID`=352;
UPDATE `page_text` SET `Text`="a large scale operation so close to the tauren homeland, but do not feel that they pose a large impediment to our overall business plan in the area.$B$BWe are pleased to hear that mining has begun in the mineral rich plains of Mulgore. Because of this the board has approved your equipment request. In addition to mining, we feel that Mulgore also has much to offer in the way of lumber, thus you will also be provided with several of our newest model shredders and raw materials to construct a mill.", `NextPageID`=0 WHERE `ID`=353;
DELETE FROM `page_text` WHERE ID = 354;

UPDATE `page_text` SET `Text`="Deathstalker Mission Report$B$BAgents: Rane Yorick, Quinn Yorick, Erland McKree$B$BPrimary mission: perform reconnaissance through northern silverpine, and determine threat levels of wildlife and Scourge." WHERE `ID`=380;
UPDATE `page_text` SET `Text`="Agents commenced sweep, finding significant worg presence.  Recommend hunting squads dispatched to reduce this threat.$B$BUndead gnolls were found at the farm steading dubbed The Dead Field.  Their purpose at the farm is not known, though their movements and level of readiness suggest imminent military action.  In the time they were observed, no notable leaders were found among the gnolls.  It is assumed they await the arrival of leadership or reinforcements." WHERE `ID`=381;
UPDATE `page_text` SET `Text`="Continuing the sweep, our agents were detained at Ivar's farm.  Ivar, most of his family and his workers had succumbed to the Scourge and become its minions.$B$BOur agents were attacked and although successful in defeating their ambushers, they sustained serious injuries, particularly agent Quinn." WHERE `ID`=382;
UPDATE `page_text` SET `Text`="A defensive position was taken in Ivar's old house, and while Rane kept watch for future attacks, Erland continued the reconnaissance mission.$B$BErland was then pinned by Worgs in a northern orchard, only escaping with the aid of another Forsaken agent.  That agent is the bearer of this report." WHERE `ID`=383;
UPDATE `page_text` SET `Text`="It should be noted here that this report bearer was instrumental in not only the success of our mission, but also in the defeat of Ivar the Foul, the rescue of Erland, and the deliverance of this report.$B$BWe extend our gratitude, and recommend that command acknowledges this individual with awards befitting such meritorious conduct as was displayed in the field.$B$B-Deathstalker Rane Yorick,$BMission Leader" WHERE `ID`=386;

UPDATE `page_text` SET `NextPageID`=571, `Text`="The Bleeding Sparrow: Manifest$B$B(20) barrels rum. Destination: Theramore$B(50) sacks flour. Destination: Theramore$B(2) crates assorted gnome tools. Destination: Ratchet$B(30) bolts cotton cloth. Destination: Theramore$B(4) crates spices. Destination: Theramore$B(3) passengers. Destination: Theramore" WHERE `ID`=527;
UPDATE `page_text` SET `NextPageID`=0, `Text`="Captain,$B$BI wish you fortune in your journeys. Regrettably, fortune did not favor our first abduction attempt.$B$BWhen our team made contact with the target in the Stormwind/Ironforge tunnels, they found only a decoy.  It appears he showed more wisdom than we accredited him.$B$BBut our second plan is already in motion.  Defias agents are prepared to intercept the target as he approaches Theramore.  Soon Stormwind will feel our bite all too keenly..$B$B-M" WHERE `ID`=571;
--
UPDATE `creature_template` SET `mechanic_immune_mask`= mechanic_immune_mask
|1 -- CHARM
|2 -- DISORIENTED
|4 -- DISARM
|8 -- DISTRACT
|16 -- FEAR
|32 -- GRIP
|64 -- ROOT
|256 -- SILENCE
|512 -- SLEEP
|1024 -- SNARE
|2048 -- STUN
|4096 -- FREEZE
|8192 -- KNOCKOUT
|65536 -- POLYMORPH
|131072 -- BANISH
|524288 -- SHACKLE
|4194304 -- TURN
|8388608 -- HORROR
|67108864 -- DAZE
|536870912 -- SAPPED
WHERE `entry` IN
-- Utgarde Keep
(23953,30748, -- Prince Keleseth
27390,31680, -- Skarvald the Constructor
27389,31657, -- Dalronn the Controller
23954,31673, -- Ingvar the Plunderer

-- The Nexus
26731,30510, -- Grand Magus Telestra
26763,30529, -- Anomalus
26794,30532, -- Ormorok the Tree-Shaper
26723,30540, -- Keristrasza
26796,30398, -- Commander Stoutbeard
26798,30397, -- Commander Kolurg

-- Azjol-Nerub
28684,31612, -- Krik'thir the Gatewatcher
28921,31611, -- Hadronox
29120,31610, -- Anub'arak

-- Ahn'kahet: The Old Kingdom
29309,31456, -- Elder Nadox
29308,31469, -- Prince Taldaram
29310,31465, -- Jedoga Shadowseeker
29311,31464, -- Herald Volazj
30258,31463, -- Amanitar

-- Drak'Tharon Keep
26630,31362, -- Trollgore
26631,31350, -- Novos the Summoner
27483,31349, -- King Dred
26632,31360, -- The Prophet Tharon'ja

-- The Violet Hold
29315,31507, -- Erekem
29316,31510, -- Moragg
29313,31508, -- Ichoron
29266,31511, -- Xevozz
29312,31509, -- Lavanthor
29314,31512, -- Zuramat the Obliterator
31134,31506, -- Cyanigosa

-- Gundrak
29304,31370, -- Slad'ran
29307,31365, -- Drakkari Colossus
29573,31367, -- Drakkari Elemental
29305,30530, -- Moorabi
29306,31368, -- Gal'darah
29932, -- Eck the Ferocious

-- Halls of Stone
27975,31384, -- Maiden of Grief
27977,31381, -- Krystallus
27978,31386, -- Sjonnir The Ironshaper

-- The Culling of Stratholme
26529,31211, -- Meathook
26530,31212, -- Salramm the Fleshcrafter
26532,31215, -- Chrono-Lord Epoch
26533,31217, -- Mal'Ganis
32273,32313, -- Infinite Corruptor

-- Halls of Lightning
28586,31533, -- General Bjarngrim
28587,31536, -- Volkhan
28546,31537, -- Ionar
28923,31538, -- Loken

-- The Oculus
27654,31558, -- Drakos the Interrogator
27447,31559, -- Varos Cloudstrider
27655,31560, -- Mage-Lord Urom
27656,31561, -- Ley-Guardian Eregos

-- Utgarde Pinnacle
26668,30810, -- Svala Sorrowgrave
26687,30774, -- Gortok Palehoof
26693,30807, -- Skadi the Ruthless
26861,30788, -- King Ymiron

-- The Forge of Souls
36497,36498); -- Bronjahm
-- "Plucky" Johnson (Magus Tirth's assistant) in quest 1950 "Get the Scoop":
UPDATE `creature_template` SET `gossip_menu_id`= 231, `AIName`= 'SmartAI', `ScriptName`= '' WHERE `entry`= 6626;
UPDATE `creature_template` SET `gossip_menu_id`= 0, `AIName`= '' WHERE `entry`= 6666;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6626,6666) AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6626,0,0,1,22,0,100,0, 22,0,0,0,11, 9192, 2,0,0,0,0,1,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 22 - Cast "Plucky" Resumes Human Form'),
(6626,0,1,2,61,0,100,0,  0,0,0,0, 5,    3, 0,0,0,0,0,1,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 22 - Play Emote 3'),
(6626,0,2,0,61,0,100,0,  0,0,0,0,11, 9220, 2,0,0,0,0,1,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 22 - Cast "Plucky" Resumes Chicken Form'),
(6626,0,3,4,22,0,100,0,  7,0,0,0,11, 9192, 2,0,0,0,0,1,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 7 - Cast "Plucky" Resumes Human Form'),
(6626,0,4,5,61,0,100,0,  0,0,0,0,82,    1, 0,0,0,0,0,1,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 7 - Add npcflags Gossip'),
(6626,0,5,0,61,0,100,0,  0,0,0,0,69,    0, 0,0,0,0,0,7,0,0,0,0,0,0,0,'"Plucky" Johnson - Received Emote 7 - Move To Invoker'),
(6626,0,6,7,62,0,100,0,231,0,0,0,72,    0, 0,0,0,0,0,7,0,0,0,0,0,0,0,'"Plucky" Johnson\'s Human Form - On Gossip Option 0 Selected - Close Gossip'),
(6626,0,7,0,61,0,100,0,  0,0,0,0,15, 1950, 0,0,0,0,0,7,0,0,0,0,0,0,0,'"Plucky" Johnson\'s Human Form - On Gossip Option 0 Selected - Credit Quest 1950');
-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 8207;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(8207, 0, 0, 'I need a new phase disruptor, Professor.', 18635,1,1,0,0,0,0,'',0);

-- Migrate NPC to use SmartAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 20907;

-- Create SmartAI for Dabiri
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 20907);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(20907,0, 0, 1, 62, 0, 100, 0, 8207, 0,0,0, 85, 35780, 0,0,0,0,0, 7, 0,0,0,0,0,0,0, "Professor Dabiri - On Gossip Option 0 Selected - Invoker Cast 'Summon Phase Disruptor'"),
(20907,0, 1, 0, 61, 0, 100, 0,    0, 0,0,0, 72,     0, 0,0,0,0,0, 7, 0,0,0,0,0,0,0, 'Professor Dabiri - On Linked Actions - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8207;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8207,0,0,0,2,0,29778,1,0,1,0,'','Professor Dabiri - Show gossip option 0 if player does not have item 29778 in inventory'),
(15,8207,0,0,0,9,0,10438,0,0,0,0,'','Professor Dabiri - Show gossip option 0 if player has accepted quest 10438');
-- 
UPDATE  `creature_template` SET `type_flags`=0 WHERE `entry` IN (33557,33555,33553,33556,33554,33657,33653,33307,33310,33650);
--
DELETE FROM `creature_template_addon` WHERE `entry`= 29403; -- Onslaught Gryphon
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29403, 0, 0, 0, 1, 0, 54422); -- add aura 'Flying' to Onslaught Gryphon
DELETE FROM `creature_queststarter` WHERE `quest`IN(8143,8144);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(14905, 8143),
(14905, 8144);

DELETE FROM `creature_questender` WHERE `quest`IN(8143,8144);
INSERT INTO `creature_questender` (`id`, `quest`) VALUES
(14905, 8143),
(14905, 8144);

UPDATE `quest_template` SET `AllowableRaces`=0 WHERE  `ID`=8144;
-- Add missing world.command from auth.rbac_permissions
DELETE FROM `command` WHERE `permission` IN (200,201,221,232,256,257,264,273,277,301,305,306,307,308,309,310,311,312,315,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,341,342,345,348,349,358,395,397,418,419,430,451,463,464,483,580,594,601,632,657,671,729,731,747,749,750,754,755,756,757,761,765,767,771,778);
INSERT INTO `command` (`name`, `permission`, `help`) VALUES 
('rbac', 200, 'Syntax: bf $subcommand\n Type .rbac to see a list of possible subcommands\n or .help bf $subcommand to see info on the subcommand.'),
('rbac account', 201, 'Syntax: rbac account $subcommand\n Type .rbac account to see a list of possible subcommands\n or .help rbac account $subcommand to see info on the subcommand.'),
('account lock', 221, 'Syntax: .account lock [on|off]\n\n Allow login from account only from current used IP or remove this requirement.'),
('arena', 232, 'Syntax: arena $subcommand\n Type .arena to see a list of possible subcommands\n or .help arena $subcommand to see info on the subcommand.'),
('unban playeraccount', 256, 'Syntax: '),
('bf', 257, 'Syntax: bf $subcommand\n Type .bf to see a list of possible subcommands\n or .help bf $subcommand to see info on the subcommand.'),
('account set sec', 264, 'Syntax: '),
('character', 273, 'Syntax: character $subcommand\n Type .character to see a list of possible subcommands\n or .help character $subcommand to see info on the subcommand.'),
('character deleted', 277, 'Syntax: character deleted $subcommand\n Type .character deleted to see a list of possible subcommands\n or .help character deleted $subcommand to see info on the subcommand.'),
('debug anim', 301, 'Syntax: '),
('debug entervehicle', 305, 'Syntax: '),
('debug getitemstate', 306, 'Syntax: '),
('debug getitemvalue', 307, 'Syntax: '),
('debug getvalue', 308, 'Syntax: '),
('debug hostil', 309, 'Syntax: '),
('debug itemexpire', 310, 'Syntax: '),
('debug lootrecipient', 311, 'Syntax: '),
('debug los', 312, 'Syntax: '),
('debug play', 315, 'Syntax: '),
('debug send', 319, 'Syntax: '),
('debug send buyerror', 320, 'Syntax: '),
('debug send channelnotify', 321, 'Syntax: '),
('debug send chatmessage', 322, 'Syntax: '),
('debug send equiperror', 323, 'Syntax: '),
('debug send largepacket', 324, 'Syntax: '),
('debug send opcode', 325, 'Syntax: '),
('debug send qinvalidmsg', 326, 'Syntax: '),
('debug send qpartymsg', 327, 'Syntax: '),
('debug send sellerror', 328, 'Syntax: '),
('debug send setphaseshift', 329, 'Syntax: '),
('debug send spellfail', 330, 'Syntax: '),
('debug setaurastate', 331, 'Syntax: '),
('debug setbit', 332, 'Syntax: '),
('debug setitemvalue', 333, 'Syntax: '),
('debug setvalue', 334, 'Syntax: '),
('debug setvid', 335, 'Syntax: '),
('debug spawnvehicle', 336, 'Syntax: '),
('debug threat', 337, 'Syntax: '),
('debug update', 338, 'Syntax: '),
('debug uws', 339, 'Syntax: '),
('deserter', 341, 'Syntax: deserter $subcommand\n Type .deserter to see a list of possible subcommands\n or .help deserter $subcommand to see info on the subcommand.'),
('deserter bg', 342, 'Syntax: '),
('deserter instance', 345, 'Syntax: '),
('disable', 348, 'Syntax: disable $subcommand\n Type .disable to see a list of possible subcommands\n or .help disable $subcommand to see info on the subcommand.'),
('disable add', 349, 'Syntax: '),
('disable remove', 358, 'Syntax: '),
('gobject set', 395, 'Syntax: '),
('gobject set state', 397, 'Syntax: '),
('learn all', 418, 'Syntax: '),
('learn all my', 419, 'Syntax: '),
('lfg', 430, 'Syntax: lfg $subcommand\n Type .lfg to see a list of possible subcommands\n or .help lfg $subcommand to see info on the subcommand.'),
('lookup player', 451, 'Syntax: '),
('channel', 463, 'Syntax: channel $subcommand\n Type .channel to see a list of possible subcommands\n or .help channel $subcommand to see info on the subcommand.'),
('channel set', 464, 'Syntax: '),
('send', 483, 'Syntax: send $subcommand\n Type .send to see a list of possible subcommands\n or .help send $subcommand to see info on the subcommand.'),
('npc set', 580, 'Syntax: '),
('npc near', 594, 'Syntax: '),
('npc tame', 601, 'Syntax: '),
('mutehistory', 632, 'Syntax: '),
('reload locales_achievement_reward', 657, 'Syntax: '),
('reload npc_spellclick_spells', 671, 'Syntax: '),
('server set', 729, 'Syntax: '),
('server set difftime', 731, 'Syntax: '),
('ticket complete', 747, 'Syntax: '),
('ticket escalate', 749, 'Syntax: '),
('ticket escalatedlist', 750, 'Syntax: '),
('ticket response', 754, 'Syntax: '),
('ticket response append', 755, 'Syntax: '),
('ticket response appendln', 756, 'Syntax: '),
('ticket togglesystem', 757, 'Syntax: '),
('titles', 761, 'Syntax: '),
('titles set', 765, 'Syntax: '),
('wp', 767, 'Syntax: wp $subcommand\n Type .wp to see a list of possible subcommands\n or .help wp $subcommand to see info on the subcommand.'),
('wp modify', 771, 'Syntax: '),
('ahbot', 778, 'Syntax: ahbot $subcommand\n Type .ahbot to see a list of possible subcommands\n or .help ahbot $subcommand to see info on the subcommand.');
--
DELETE FROM `gameobject` WHERE `guid`=5537;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `spawntimesecs`, `state`) VALUES
(5537,4090,530,-2518.51001,7360.100098,10.6223,120,1);
--
UPDATE `quest_template_addon` SET `PrevQuestId`=0 WHERE `id`=9409;
UPDATE `quest_template_addon` SET `PrevQuestId`=9409 WHERE `id`=9371;
UPDATE `quest_template_addon` SET `ExclusiveGroup`=9280 WHERE `ID` IN (9280, 9369);
UPDATE `quest_template` SET `RewardNextQuest`=9409 WHERE `ID`=9280;
--
DELETE FROM `skill_fishing_base_level` WHERE `entry` IN (4100,4987);
INSERT INTO `skill_fishing_base_level` (`entry`, `skill`) VALUES
(4987, 480),
(4100, 450);
-- Creature entry 20243, Scrapped Fel Reaver, Quest "It's a Fel Reaver, But with Heart"
SET @FEL := 20243; -- Scrapped Fel Reaver
SET @Zaxxis := 20287; -- Zaxxis Ambusher

DELETE FROM `creature_text` WHERE `entry` = @FEL;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@FEL,0,0,"The %s's mechanical heart begins to beat softly.",16,0,100,0,0,0,18271,0,"Scrapped Fel Reaver - Zapped Emote");

DELETE FROM `smart_scripts` WHERE `entryorguid` = @FEL AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FEL,0, 0,1,  8, 0,100,0, 35282,     0,     0,     0, 19,    256,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Remove Flags Immune To Players"),
(@FEL,0, 1,2, 61, 0,100,0,     0,     0,     0,     0,  1,      0, 1000,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Say Line 0"),
(@FEL,0, 2,0, 61, 0,100,0,     0,     0,     0,     0, 18, 131076,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Set Flags Disable Movement & Pacified"),
(@FEL,0, 3,0,  0, 0,100,0,  2000,  2000, 30000, 30000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2547.08, 3982.24, 131.39, 2.01, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 4,0,  0, 0,100,0, 17000, 17000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.70, 3975.96, 130.40, 1.58, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 5,0,  0, 0,100,0, 32000, 32000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2506.46, 4008.93, 133.80, 6.19, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 6,0,  0, 0,100,0, 60000, 60000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.30, 4027.11, 135.50, 4.30, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 7,0,  6, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Just Died - Kill Target"),
(@FEL,0, 8,0,  7, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Evade - Kill Target"),
(@FEL,0, 9,0, 11, 0,100,0,     0,     0,     0,     0, 75,  39311,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Respawn - Add Aura 'Scrapped Fel Reaver Transform'");

-- Creature entry 20287, Zaxxis Ambusher
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @Zaxxis;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Zaxxis AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Zaxxis,0, 0,0, 54, 0,100,0, 0,0,0,0, 49, 0,0,0,0,0,0, 21, 85, 0,0,0,0,0,0, 'Zaxxis Ambusher - On Just Summoned - Start Attacking');
--
SET @CGUID := 87945; -- 15 required
SET @OGUID := 64102; -- 15 required

-- Set Earthen Ring Elder ID: 26221 friendly to both factions
UPDATE `creature_template` SET `faction`=35 WHERE `entry`=26221;
DELETE FROM `creature_queststarter` WHERE `id` IN (26221,25975,25324);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+14;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@CGUID, 25866, 1, 1, 1, 0, 0, 3886.6, 771.658, 5.00204, 3.78625, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+1, 25866, 1, 1, 1, 0, 0, 3873.34, 786.567, 3.15877, 1.19364, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+2, 25866, 1, 1, 1, 0, 0, 3886.25, 820.325, 1.23753, 1.74656, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+3, 25866, 1, 1, 1, 0, 0, 3922.2, 795.453, 9.05771, 3.07546, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+4, 25863, 1, 1, 1, 0, 0, 3956.09, 767.42, 7.88992, 5.17483, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+5, 25863, 1, 1, 1, 0, 0, 3988.96, 790.529, 6.19678, 0.208762, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+6, 25863, 1, 1, 1, 0, 0, 3899.13, 764.193, 6.01616, 5.62487, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+7, 25863, 1, 1, 1, 0, 0, 3923.53, 840.173, 2.29151, 2.07879, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+8, 25924, 1, 1, 1, 0, 0, 3916.05, 783.268, 9.0577, 0.717698, 300, 0, 0, 44, 0, 0, 0, 0, 0),
(@CGUID+9, 25866, 1, 1, 1, 0, 0, 3900.86, 799.587, 7.80664, 1.37978, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+10, 25866, 1, 1, 1, 0, 0, 3950.07, 846.313, 7.9843, 4.16433, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+11, 25866, 1, 1, 1, 0, 0, 3982.71, 816.306, 8.04045, 4.0481, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+12, 25866, 1, 1, 1, 0, 0, 3918.32, 760.473, 7.77712, 1.94087, 300, 30, 0, 42, 0, 1, 0, 0, 0),
(@CGUID+13, 25863, 1, 1, 1, 0, 0, 3922.62, 811.827, 7.79205, 2.56369, 300, 0, 0, 42, 0, 0, 0, 0, 0),
(@CGUID+14, 25949, 1, 1, 1, 0, 0, 4196.1, 1172.44, 6.68073, 0.688985, 300, 0, 0, 486, 1357, 0, 0, 0, 0);
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+14;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID, 187989, 1, 1, 1, 3955.77, 862.105, 0.1785, 3.93579, 0, 0, 0.922187, -0.386745, 300, 0, 1),
(@OGUID+1, 187989, 1, 1, 1, 3880.54, 795.812, 2.67948, 0.589994, 0, 0, 0.290737, 0.956803, 300, 0, 1),
(@OGUID+2, 187989, 1, 1, 1, 3923.8, 748.779, 8.05033, 2.67052, 0, 0, 0.972389, 0.233364, 300, 0, 1),
(@OGUID+3, 187989, 1, 1, 1, 3959.24, 760.694, 6.12531, 2.76477, 0, 0, 0.982303, 0.1873, 300, 0, 1),
(@OGUID+4, 187989, 1, 1, 1, 3998.39, 815.017, 4.22604, 3.56744, 0, 0, 0.977417, -0.21132, 300, 0, 1),
(@OGUID+5, 187989, 1, 1, 1, 3953.32, 808.406, 9.07383, 0.295474, 0, 0, 0.1472, 0.989107, 300, 0, 1),
(@OGUID+6, 187989, 1, 1, 1, 3944.4, 817.924, 9.05937, 2.23541, 0, 0, 0.899098, 0.437748, 300, 0, 1),
(@OGUID+7, 187918, 1, 1, 1, 3891.73, 795.127, 7.70466, 3.57844, 0, 0, 0.97624, -0.216691, 300, 0, 1),
(@OGUID+8, 187918, 1, 1, 1, 3928.2, 818.467, 8.38597, 0.711076, 0, 0, 0.348095, 0.937459, 300, 0, 1),
(@OGUID+9, 187918, 1, 1, 1, 3956.23, 854.015, 7.9829, 1.18232, 0, 0, 0.557323, 0.830296, 300, 0, 1),
(@OGUID+10, 187918, 1, 1, 1, 3988.24, 819.46, 8.01849, 5.47452, 0, 0, 0.393407, -0.919365, 300, 0, 1),
(@OGUID+11, 187918, 1, 1, 1, 3923.81, 758.498, 7.77727, 4.57321, 0, 0, 0.754564, -0.656226, 300, 0, 1),
(@OGUID+12, 187918, 1, 1, 1, 3947.51, 812.939, 9.06439, 0.920322, 0, 0, 0.444092, 0.895981, 300, 0, 1),
(@OGUID+13, 187989, 1, 1, 1, 3924.28, 779.525, 9.05821, 2.43535, 0, 0, 0.938298, 0.345828, 300, 0, 1),
(@OGUID+14, 187989, 1, 1, 1, 3912.78, 792.797, 9.05821, 2.43771, 0, 0, 0.938704, 0.344723, 300, 0, 1);
-- SAI and loot for Twilight Firesworn, Twilight Flameguard and Twilight Speaker Viktor
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (25863,25924,25866);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25863,0,0,0,0,0,100,0,0,1000,7000,7500,11,20793,0,0,0,0,0,2,0,0,0,0,0,0,0,'Firesworn - IC - Cast spell Fireball on victim'),
(25863,0,1,0,4,0,100,0,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,'Firesworn - On aggro - Cast fire shield on self'),
(25863,0,2,0,4,0,100,0,0,0,0,0,1,0,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Firesworn - On aggro - Say Text 0'),
(25924,0,0,0,0,0,100,0,0,1000,7000,7500,11,20793,0,0,0,0,0,2,0,0,0,0,0,0,0,'Speaker Viktor - IC - Cast spell Fireball on victim'),
(25924,0,1,0,4,0,100,0,0,0,0,0,1,0,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Speaker Viktor - On aggro - Say Text 0'),
(25866,0,0,0,4,0,100,0,0,0,0,0,1,0,1000,0,0,0,0,1,0,0,0,0,0,0,0,'Flameguard - On aggro - Say Text 0');
UPDATE `creature_template` SET `lootid`=25866,`AIName`= 'SmartAI' WHERE `entry`=25866;
UPDATE `creature_template` SET `lootid`=25863,`unit_class`=8,`AIName`= 'SmartAI' WHERE `entry`=25863;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`lootid` =25924,`unit_class`=8 WHERE `entry`=25924;
DELETE FROM `creature_loot_template` WHERE `entry`IN (25866,25863,25924);
INSERT INTO `creature_loot_template` VALUES
(25866,35277,0,100,1,1,0,1,1,'Twilight Correspondence'),
(25863,35277,0,100,1,1,0,1,1,'Twilight Correspondence'),
(25924,35277,0,100,1,1,0,1,1,'Twilight Correspondence');
-- Add SAI for quest "Unusual activity"
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (26534,25324);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (26534,25324);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26534,0,0,0,1,0,100,1,6000,10000,0,0,12,25324,3,60000,0,0,0,23,0,0,0,0,0,0,0,'Totem - On event update - Summon guide'),
(25324,0,0,0,54,0,100,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Earthen ring Guide - On just summonned - Follow Totem'),
(25324,0,1,0,64,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,1,0,0,0,0,0,0,0,'Earthen ring Guide - On gossip hello - Say text 0');
-- Earthen Ring Guide text
DELETE FROM `creature_text` WHERE `entry` IN (25324,25863,25924,25866);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(25324,0,1,'What is it you need?',12,0,100,1,1500,0,'Earthen ring guide',25739),
(25324,0,2,'Have you discovered something?',12,0,100,1,1500,0,'Earthen ring guide',25740),
(25324,0,3,'The elemental spirits are restless...',12,0,100,1,1500,0,'Earthen ring guide',25741),
(25863,0,0,'You are not allowed to interfere!',12,0,100,1,1500,0,'Twilight Firesworn',25098),
(25924,0,0,'Our vision will be realized!',12,0,100,1,1500,0,'Twilight Speaker Viktor',25099),
(25866,0,0,'The elements will crush you!',12,0,100,1,1500,0,'Twilight Speaker Viktor',25100);
-- SAI for Briatha
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=25949;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=25949;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=2594900;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25949,0,0,0,10,0,100,0,1,20,40000,40000,80,2594900,2,0,0,0,0,1,0,0,0,0,0,0,0,'Briatha - OOC LOS - Call Timed ActionList'),
(2594900,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Briatha - Action list - Talk0'),
(2594900,9,1,0,0,0,100,0,6000,6000,0,0,1,0,4000,0,0,0,0,9,25951,0,15,0,0,0,0,'Emissary - Action list - Say text 0'),
(2594900,9,2,0,0,0,100,0,6000,6000,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Briatha - Action list - Say text 1'),
(2594900,9,3,0,0,0,100,0,6000,6000,0,0,1,1,4000,0,0,0,0,9,25951,0,15,0,0,0,0,'Emissary - Action list - Say text 1'),
(2594900,9,4,0,0,0,100,0,6000,6000,0,0,1,2,3500,0,0,0,0,1,0,0,0,0,0,0,0,'Briatha - Action list - Say text 2'),
(2594900,9,5,0,0,0,100,0,0,0,0,0,11,46375,0,0,0,0,0,1,0,0,0,0,0,0,0,'Briatha - Action list - Cast spell quest credit');
-- Briatha and Heretic Emissary text
DELETE FROM `creature_text` WHERE `entry` IN (25949,25951);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(25949,0,0,'These stones should be the last of them. Our coordination with Neptulon''s forces will be impeccable.',12,0,100,1,0,0,'Briatha',25123),
(25949,1,0,'And your own preparations? Will the Frost Lord have a path to the portal?',12,0,100,1,0,0,'Briatha',25126),
(25949,2,0,'The ritual in Coilfang will bring Ahune through once he is fully prepared, and the resulting clash between Firelord and Frostlord will rend the foundations of this world. Our ultimate goals are in reach at last....',12,0,100,1,0,0,'Briatha',25128),
(25951,0,0,'Yess. The Tidehunter will be pleased at this development. The Firelord\'s hold will weaken.',12,0,100,1,0,0,'Heretic Emissary',25124),
(25951,1,0,'Skar\'this has informed us well. We have worked our way into the slave pens and await your cryomancerss.',12,0,100,1,0,0,'Heretic Emissary',25127);

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+1 AND `eventEntry`=1;
INSERT INTO `game_event_creature` SELECT 1, creature.guid FROM `creature` WHERE creature.guid BETWEEN @CGUID+0 AND @CGUID+14;
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+1 AND `eventEntry`=1;
INSERT INTO `game_event_gameobject` SELECT 1, gameobject.guid FROM `gameobject` WHERE gameobject.guid BETWEEN @OGUID+0 AND @OGUID+14;
--
DELETE FROM `creature_queststarter` WHERE `quest` IN (615, 8551);
UPDATE `quest_template` SET `AllowableRaces`=0 WHERE `ID`=614;
--
SET @OGUID := 6409;
DELETE FROM `gameobject` WHERE `guid` IN (@OGUID+0,@OGUID+1,@OGUID+2,@OGUID+3);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@OGUID+0,193988,615,3,1,3246.47,515.266,58.6196,1.54789,0,0,0.698963,0.715158,-300,0,1),
(@OGUID+1,193988,615,3,1,3154.78,515.889,90.9767,3.18872,0,0,0.999722,-0.0235612,-300,0,1),
(@OGUID+2,193988,615,3,1,3216.13,648.325,87.0783,0.693027,0,0,0.339621,0.940562,-300,0,1),
(@OGUID+3,193988,615,3,1,3383.81,532.522,96.971,3.43866,0,0,0.988989,-0.147986,-300,0,1);
SET @CGUID:= 145427; -- 69 GUIDs required
SET @OGUID:= 73587; -- 13 GUIDs required
SET @OG_PORTAL:= 193206;
SET @OG_TELEPORTSPELL:= 59064;
SET @UCTELEPORTSPELL:= 59439;
SET @HORDE_BUILDING1:= 193219;
SET @HORDE_BUILDING2:= 193217;
SET @HORDE_BUILDING3:= 193218;
SET @HORDE_BUILDING4:= 193216;
SET @HORDE_BUILDING5:= 193215;
SET @REFUGEE1:= 31437;
SET @REFUGEE2:= 31467;
SET @MOUNTEDORC:= 31564; -- mounted on frostwolf
SET @MOUNTEDORC2:= 31563; -- mounted on brown wolf
SET @KORKRONGUARDS:= 31417; -- guards within thrall building
SET @NPC_GRYSHKA:= 31433;
SET @NPC_OVERLORD_RUNTHAK:= 31431;
SET @NPC_OLVIA:= 31425;
SET @NPC_SANA:= 31429;
SET @NPC_FELIKA:= 31427;
SET @NPC_THUNG:= 31430;
SET @NPC_KAJA:= 31423;
SET @NPC_GAMON:= 31424;
SET @NPC_COMMONER:= 31434;
SET @NPC_THRALL:= 31412;
SET @PORTAL_STORMWIND:= 31640;
SET @NPC_SYLVANAS:= 31419;
SET @NPC_JAINA:= 31418;
SET @UC_THRALL:= 31650;
SET @UC_SYLVANAS:= 31651;
SET @VOLJIN:= 31649;
SET @UCPORTAL:= 193425; -- orgrimmar

UPDATE `creature` SET `PhaseMask` = 65 WHERE `GUID` IN (6565, 10351, 3390, 3387, 10450, 8526, 6564, 8522, 6560, 11792, 7395, 6557, 6548, 3373, 3372, 6550, 6555, 3371, 6552, 6556, 6551, 3378, 7396, 3380, 3376, 3379, 3375, 6553);
UPDATE `creature_template` SET `unit_flags` = 788 WHERE `entry` = @NPC_GAMON;
UPDATE `creature_template` SET `ScriptName` = 'npc_overlord_runthak_orgrimmar' WHERE `entry` = @NPC_OVERLORD_RUNTHAK;
UPDATE `creature_template` SET `ScriptName` = 'npc_thrall_herald_of_war' WHERE `entry` = @NPC_THRALL;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @NPC_SYLVANAS;
UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` = @NPC_JAINA;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC_SYLVANAS;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC_SYLVANAS, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas - on reset - set byte kneel'),
(@NPC_SYLVANAS, 0, 1, 0, 34, 0, 100, 0, 8, 2, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sylvanas - on movement inform - set byte kneel');

DELETE FROM `areatrigger_scripts` WHERE `entry` = 5279;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(5279, "areatrigger_orgrimmar_herald_of_war");

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_GRYSHKA, @NPC_OLVIA, @NPC_FELIKA, @NPC_THUNG, @NPC_SANA, @NPC_KAJA, @NPC_OVERLORD_RUNTHAK, @NPC_THRALL, @NPC_SYLVANAS, @NPC_JAINA);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@NPC_GRYSHKA, 0, 0, "When can we reopen our shops? I'm losing gold here!", 12, 0, 100, 0, 0, 0, 32237, 0, "inkeeper gryshka - herald of war"),
(@NPC_GRYSHKA, 1, 0, "This is an outrage!", 12, 0, 100, 0, 0, 0, 32238, 0, "inkeeper gryshka - herald of war"),

(@NPC_OLVIA, 0, 0, "Where is the Warchief?", 12, 0, 100, 0, 0, 0, 32236, 0, "olvia - herald of war"),
(@NPC_OLVIA, 1, 0, "What are all these Forsaken doing here?", 12, 0, 100, 0, 0, 0, 32233, 0, "olvia - herald of war"),

(@NPC_FELIKA, 0, 0, "What is going on?", 12, 0, 100, 0, 0, 0, 45914, 0, "felika - herald of war"),
(@NPC_FELIKA, 1, 0, "This is an outrage!", 12, 0, 100, 0, 0, 0, 46620, 0, "felika - herald of war"),

(@NPC_THUNG, 0, 0, "What is going on?", 12, 0, 100, 0, 0, 0, 32232, 0, "auctioneer thathung - herald of war"),

(@NPC_KAJA, 0, 0, "Why is Thrall allowing this to happen to our city?", 12, 0, 100, 0, 0, 0, 32239, 0, "Kaja - herald of war"),

(@NPC_SANA, 0, 0, "We demand answers!", 12, 0, 100, 0, 0, 0, 32235, 0, "Sana - herald of war"),

(@NPC_OVERLORD_RUNTHAK, 0, 0, "SILENCE!", 12, 0, 100, 0, 0, 0, 32240, 0, "Overlord runthak - herald of war"),
(@NPC_OVERLORD_RUNTHAK, 1, 0, "We are on the brink of all out war with the Alliance!", 12, 0, 100, 0, 0, 0, 32241, 0, "Overlord runthak - herald of war"),
(@NPC_OVERLORD_RUNTHAK, 2, 0, "Tragic events have unfolded in Northrend. The Warchief is doing all that he can to keep us safe.", 12, 0, 100, 0, 0, 0, 32242, 0, "Overlord runthak - herald of war"),
(@NPC_OVERLORD_RUNTHAK, 3, 0, "All services and shops are to remain closed until further notice! That is all!", 12, 0, 100, 0, 0, 0, 32243, 0, "Overlord runthak - herald of war"),

(@NPC_THRALL, 0, 0, "Kor'kron, stand down!", 12, 0, 100, 0, 0, 16222, 32286, 0, "Thrall - herald of war"),
(@NPC_THRALL, 1, 0, "Jaina...", 12, 0, 100, 0, 0, 16223, 32287, 0, "Thrall - herald of war"),
(@NPC_THRALL, 2, 0, "Jaina, what happened at the Wrathgate. It was a betrayal from within...", 12, 0, 100, 0, 0, 16224, 32289, 0, "Thrall - herald of war"),
(@NPC_THRALL, 3, 0, "The Horde has lost the Undercity.", 12, 0, 100, 1, 0, 16225, 32292, 0, "Thrall - herald of war"),
(@NPC_THRALL, 4, 0, "We now prepare to lay siege to the city and bring the perpetrators of this unforgivable crime to justice.", 12, 0, 100, 378, 0, 16226, 32293, 0, "Thrall - herald of war"),
(@NPC_THRALL, 5, 0, "If we are forced into a conflict, the Lich King will destroy our divided forces in Northrend.", 12, 0, 100, 378, 0, 16227, 32294, 0, "Thrall - herald of war"),
(@NPC_THRALL, 6, 0, "We will make this right, Jaina. Tell your king all that you have learned here.", 12, 0, 100, 378, 0, 16228, 32295, 0, "Thrall - herald of war"),
(@NPC_THRALL, 7, 0, "Kor'kron, prepare transport to the Undercity.", 12, 0, 100, 378, 0, 16229, 32300, 0, "Thrall - herald of war"),

(@NPC_SYLVANAS, 0, 0, "Lady Proudmoore, the Warchief speaks the truth. This subterfuge was set in motion by Varimathras and Grand Apothecary Putress. It was not the Horde's doing.", 12, 0, 100, 0, 0, 16315, 32290, 0, "Sylvanas - herald of war"),
(@NPC_SYLVANAS, 1, 0, "As the combined Horde and Alliance forces began their assault upon the Wrath Gate, an uprising broke out in the Undercity. Varimathras and hordes of his demonic brethren attacked. Hundreds of my people were slain in the coup. I barely managed to escape with my life.", 12, 0, 100, 0, 0, 16316, 32291, 0, "Sylvanas - herald of war"),

(@NPC_JAINA, 0, 0, "Thrall, what has happened? The King is preparing for war...", 12, 0, 100, 0, 0, 16129, 32288, 0, "Jaina - herald of war"),
(@NPC_JAINA, 1, 0, "I will deliver this information to King Wrynn, Thrall, but...", 12, 0, 100, 378, 0, 16130, 32296, 0, "Jaina - herald of war"),
(@NPC_JAINA, 2, 0, "Bolvar was like a brother to him. In the King's absence, Bolvar kept the Alliance united. He found strength for our people in our darkest hours. He watched over Anduin, raising him as his own.", 12, 0, 100, 378, 0, 16131, 32297, 0, "Jaina - herald of war"),
(@NPC_JAINA, 3, 0, "I fear that the rage will consume him, Thrall. I remain hopeful that reason will prevail, but we must prepare for the worst... for war.", 12, 0, 100, 378, 0, 16132, 32298, 0, "Jaina - herald of war"),
(@NPC_JAINA, 4, 0, "Farewell, Warchief. I pray that the next time we meet it will be as allies.", 12, 0, 100, 0, 0, 16133, 32299, 0, "Jaina - herald of war");

DELETE FROM `gameobject` WHERE `id` IN (@OG_PORTAL, @HORDE_BUILDING5, @HORDE_BUILDING4, @HORDE_BUILDING2, @HORDE_BUILDING3, @UCPORTAL);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID, @OG_PORTAL, 571, 3537, 4129, 1, 1, 2830.01, 6179.37, 84.66, 4.16, 0, 0, 0.715875, -0.698228, 120, 100, 1, 0),
(@OGUID + 1, @HORDE_BUILDING5, 1, 14, 14, 1, 64, 1339.00, -4413.98, 27.25, 2.29, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 2, @HORDE_BUILDING5, 1, 1637, 1637, 1, 64, 1508.90, -4429.49, 21.95, 6.13, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 3, @HORDE_BUILDING4, 1, 14, 14, 1, 64, 1290.05, -4417.47, 26.61, 0.72, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 4, @HORDE_BUILDING4, 1, 14, 14, 1, 64, 1346.67, -4343.90, 27.23, 4.48, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 5, @HORDE_BUILDING2, 1, 14, 14, 1, 64, 1376.69, -4355.44, 26.24, 1.15, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 6, @HORDE_BUILDING2, 1, 1637, 1637, 1, 64, 1437.96, -4365.91, 25.46, 0.41, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 7, @HORDE_BUILDING3, 1, 1637, 1637, 1, 64, 1425.65, -4356.49, 25.46, 4.84, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 8, @HORDE_BUILDING3, 1, 1637, 1637, 1, 64, 1441.50, -4432.17, 25.46, 0.05, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 9, @HORDE_BUILDING2, 1, 1637, 1637, 1, 64, 1429.12, -4423.08, 25.46, 3.28, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 10, @HORDE_BUILDING4, 1, 1637, 1637, 1, 64, 1501.42, -4392.46, 22.69, 4.83, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 11, @UCPORTAL, 1, 1637, 1637, 1, 64, 1912.070923, -4151.778809, 40.637005, 1.635784, 0, 0, 0, 0, 600, 0, 1, 0),
(@OGUID + 12, @UCPORTAL, 1, 1637, 1637, 1, 64, 1931.545288, -4149.240723, 40.600616, 1.804645, 0, 0, 0, 0, 600, 0, 1, 0);

DELETE FROM `creature` WHERE `GUID` BETWEEN @CGUID AND @CGUID + 68;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1313.62, -4504.06, 22.9198, 1.60753, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 1, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1317.69, -4499.57, 25.0943, 1.60753, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 2, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1310.69, -4504.17, 22.2043, 1.60753, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 3, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1311.13, -4518.5, 22.2047, 1.55255, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting

(@CGUID + 4, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1345.48, -4419.18, 27.4299, 2.28297, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 5, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1343.1, -4411.76, 27.6054, 2.31831, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 6, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1338.59, -4416.07, 27.143, 2.25548, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting

(@CGUID + 7, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1348.62, -4339.38, 27.2402, 5.19288, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 8, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1344.26, -4341.66, 27.2953, 5.19288, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting

(@CGUID + 9, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1373.44, -4354.1, 26.3845, 4.51351, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 10, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1377.47, -4355.02, 26.2234, 4.48603, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),

(@CGUID + 11, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1426.94, -4355.01, 25.4626, 4.82374, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(@CGUID + 12, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1439.5, -4368.21, 25.4626, 3.35504, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(@CGUID + 13, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1423.99, -4355.34, 25.4626, 4.82374, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 14, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1438.59, -4363.16, 25.4626, 3.44536, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),

(@CGUID + 15, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1442.41, -4382.73, 28.0943, 3.24115, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 16, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1418.21, -4354.67, 28.1022, 4.91012, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping

(@CGUID + 17, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1425.6, -4423.85, 25.4629, 6.16282, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 18, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1428.84, -4420.12, 25.4629, 6.16282, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 19, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1440.43, -4431.69, 25.4629, 1.87456, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 20, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1428.35, -4424.18, 25.4629, 6.16282, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 21, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1425.12, -4421.19, 25.4629, 6.16282, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 22, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1444.34, -4433.12, 25.4629, 1.87456, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting

(@CGUID + 23, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1506.86, -4436.01, 23.113, 1.97747, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 24, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1503.98, -4392.84, 21.9971, 5.36252, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 25, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1499.08, -4393.03, 23.3294, 5.3154, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 26, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1513.89, -4429.5, 20.4131, 1.76542, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 27, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1508.19, -4430.54, 22.2681, 1.89108, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 28, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1499.22, -4387.96, 23.339, 5.07193, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 29, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1503.9, -4386.66, 22.0753, 5.31148, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 30, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1512.58, -4435.7, 21.1882, 1.85966, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping

(@CGUID + 31, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1345.22, -4407.99, 27.9504, 1.99711, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sleeping
(@CGUID + 32, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1336.65, -4409.31, 27.3459, 1.86359, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 33, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1290.52, -4419.55, 26.6016, 1.35857, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 34, @REFUGEE1, 1, 14, 14, 1, 64, 0, 0, 1286.92, -4415.25, 26.5606, 1.23683, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(@CGUID + 35, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1287.15, -4418.59, 26.5876, 1.29181, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0), -- sitting
(@CGUID + 36, @REFUGEE2, 1, 14, 14, 1, 64, 0, 0, 1294.74, -4416.27, 26.6432, 3.06289, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),

(@CGUID + 37, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1655.2, -4416.18, 16.7609, 3.19012, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 38, @REFUGEE1, 1, 1637, 1637, 1, 64, 0, 0, 1550.75, -4411.13, 9.02373, 3.24117, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 39, @REFUGEE2, 1, 1637, 1637, 1, 64, 0, 0, 1588.68, -4440.77, 5.6737, 2.90345, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0),
(@CGUID + 40, @NPC_THRALL, 1, 1637, 1637, 1, 64, 0, 0, 1913.81, -4127.87, 43.23, 0.147480, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(@CGUID + 41, @NPC_SYLVANAS, 1, 1637, 1637, 1, 64, 0, 0, 1920.589233, -4130.980469, 43.090080, 1.741838, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(@CGUID + 42, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1944.779541, -4136.510254, 41.157078, 3.683755, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),
(@CGUID + 43, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1938.338501, -4215.597168, 42.321674, 3.534525, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),
(@CGUID + 44, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1926.85, -4134.75, 40.6305, 4.6753, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),
(@CGUID + 45, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1913.69, -4135.14, 40.6359, 4.79468, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),
(@CGUID + 46, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1913.99, -4122.2, 43.2624, 4.84964, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),
(@CGUID + 47, @KORKRONGUARDS, 1, 1637, 1637, 1, 64, 0, 1, 1925.71, -4121.88, 43.2014, 4.73577, 300, 0, 0, 63000, 0, 0, 0, 0, 0, 0),

(@CGUID + 48, @MOUNTEDORC, 1, 1637, 1637, 1, 64, 0, 0, 1527.04, -4398.42, 14.4175, 3.54668, 300, 0, 0, 31905, 0, 2, 0, 0, 0, 0),
(@CGUID + 49, @MOUNTEDORC, 1, 1637, 1637, 1, 64, 0, 0, 1434.51, -4399.44, 25.4631, 1.64601, 300, 0, 0, 31905, 0, 2, 0, 0, 0, 0),

(@CGUID + 50, @MOUNTEDORC2, 1, 14, 14, 1, 64, 0, 1, 1370.59, -4377.64, 26.0629, 3.47206, 300, 0, 0, 42540, 0, 2, 0, 0, 0, 0),
(@CGUID + 51, @MOUNTEDORC2, 1, 1637, 1637, 1, 64, 0, 1, 1539.24, -4435.88, 12.4312, 1.64208, 300, 0, 0, 42540, 0, 2, 0, 0, 0, 0),

(@CGUID + 52, @NPC_GAMON, 1, 1637, 1637, 1, 64, 0, 0, 1596.91, -4398.47, 7.63585, 0.605362, 300, 0, 0, 247, 0, 0, 0, 0, 0, 0),
(@CGUID + 53, @NPC_OLVIA, 1, 1637, 1637, 1, 64, 0, 1, 1599.6, -4399.69, 8.52417, 0.687829, 300, 0, 0, 2769, 0, 0, 0, 0, 0, 0),
(@CGUID + 54, @NPC_KAJA, 1, 1637, 1637, 1, 64, 0, 1, 1598.06, -4400.97, 7.78653, 0.687829, 300, 0, 0, 1003, 0, 0, 0, 0, 0, 0),
(@CGUID + 55, @NPC_FELIKA, 1, 1637, 1637, 1, 64, 0, 1, 1601.15, -4401.67, 9.1794, 0.801712, 300, 0, 0, 1003, 0, 0, 0, 0, 0, 0),
(@CGUID + 56, @NPC_SANA, 1, 1637, 1637, 1, 64, 0, 0, 1598.94, -4397.32, 8.49337, 0.664267, 300, 0, 0, 1003, 0, 0, 0, 0, 0, 0),
(@CGUID + 57, @NPC_GRYSHKA, 1, 1637, 1637, 1, 64, 0, 1, 1597.02, -4395.84, 8.61465, 0.664267, 300, 0, 0, 1003, 0, 0, 0, 0, 0, 0),
(@CGUID + 58, @NPC_THUNG, 1, 1637, 1637, 1, 64, 0, 0, 1594.9, -4395.75, 8.23313, 0.664267, 300, 0, 0, 126, 0, 0, 0, 0, 0, 0),
(@CGUID + 59, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1596.92, -4404.38, 7.44287, 0.664267, 300, 0, 0, 1395, 0, 0, 0, 0, 0, 0),
(@CGUID + 60, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1599.55, -4403.68, 8.18324, 0.664267, 300, 0, 0, 2292, 0, 0, 0, 0, 0, 0),
(@CGUID + 61, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1595.14, -4402.1, 6.89729, 0.664267, 300, 0, 0, 1110, 0, 0, 0, 0, 0, 0),
(@CGUID + 62, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1594.08, -4399.7, 6.717, 0.664267, 300, 0, 0, 955, 0, 0, 0, 0, 0, 0),
(@CGUID + 63, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1592.45, -4397.61, 7.12726, 0.664267, 300, 0, 0, 247, 0, 0, 0, 0, 0, 0),
(@CGUID + 64, @NPC_COMMONER, 1, 1637, 1637, 1, 64, 0, 0, 1592.86, -4394.45, 7.90426, 0.218946, 300, 0, 0, 71, 0, 0, 0, 0, 0, 0),
(@CGUID + 65, @NPC_OVERLORD_RUNTHAK, 1, 1637, 1637, 1, 64, 0, 1, 1606.09, -4396.1, 10.1268, 3.7446, 300, 0, 0, 48832, 0, 0, 0, 0, 0, 0),
(@CGUID + 66, @UC_SYLVANAS, 0, 85, 153, 1, 64, 0, 1, 1943.76, 237.566, 44.276, 3.09834, 300, 0, 0, 6972500, 0, 0, 0, 0, 0, 0),
(@CGUID + 67, @VOLJIN, 0, 85, 153, 1, 64, 0, 1, 1944.09, 245.315, 44.2522, 3.09834, 300, 0, 0, 3585186, 0, 0, 0, 134217728, 0, 0),
(@CGUID + 68, @UC_THRALL, 0, 85, 153, 1, 64, 0, 1, 1943.59, 233.699, 44.3204, 3.09834, 300, 0, 0, 7925544, 0, 0, 0, 134217728, 0, 0);

-- pathing is pure guess, there is no sniff of this event. Seen lots of videos and everybody ignores those fuckers ;[
DELETE FROM `waypoint_data` WHERE `id` IN ((@CGUID + 37) * 10, (@CGUID + 38) * 10, (@CGUID + 39) * 10, @CGUID * 10, (@CGUID + 2) * 10, (@CGUID + 1) * 10, (@CGUID + 51) * 10, (@CGUID + 49) * 10, (@CGUID + 48) * 10, (@CGUID + 50) * 10, (@CGUID + 65) * 10, (@CGUID + 40) * 10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
((@CGUID + 37) * 10, 1, 1636.727661, -4419.891113, 15.754716, 3.374689, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 2, 1597.315430, -4436.729004, 6.685284, 3.547476, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 3, 1532.198364, -4418.569824, 12.707468, 2.803703, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 4, 1439.670654, -4423.134277, 25.462461, 3.070738, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 5, 1428.224976, -4366.074707, 25.462461, 1.739488, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 6, 1359.062012, -4372.103516, 26.125994, 3.259234, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 7, 1301.137085, -4391.241699, 26.268190, 3.479145, 0, 0, 0, 100, 0),
((@CGUID + 37) * 10, 8, 1359.062012, -4372.103516, 26.125994, 3.259234, 0, 0, 0, 100, 0), -- 6
((@CGUID + 37) * 10, 9, 1428.224976, -4366.074707, 25.462461, 1.739488, 0, 0, 0, 100, 0), -- 5
((@CGUID + 37) * 10, 10, 1439.670654, -4423.134277, 25.462461, 3.070738, 0, 0, 0, 100, 0), -- 4
((@CGUID + 37) * 10, 11, 1532.198364, -4418.569824, 12.707468, 2.803703, 0, 0, 0, 100, 0), -- 3
((@CGUID + 37) * 10, 12, 1597.315430, -4436.729004, 6.685284, 3.547476, 0, 0, 0, 100, 0), -- 2
((@CGUID + 37) * 10, 13, 1636.727661, -4419.891113, 15.754716, 3.374689, 0, 0, 0, 100, 0), -- 1
((@CGUID + 37) * 10, 14, 1661.776733, -4411.652832, 17.281466, 0.494632, 0, 0, 0, 100, 0),

((@CGUID + 38) * 10, 1, 1510.770508, -4415.110840, 19.337944, 3.245882, 0, 0, 0, 100, 0),
((@CGUID + 38) * 10, 2, 1440.086914, -4422.711426, 25.462467, 3.249809, 0, 0, 0, 100, 0),
((@CGUID + 38) * 10, 3, 1424.909790, -4370.168457, 25.462467, 2.820196, 0, 0, 0, 100, 0),
((@CGUID + 38) * 10, 4, 1360.981689, -4377.626953, 26.084114, 3.323637, 0, 0, 0, 100, 0),
((@CGUID + 38) * 10, 5, 1341.317139, -4405.867188, 27.853329, 4.383916, 0, 0, 0, 100, 0),
((@CGUID + 38) * 10, 6, 1312.769043, -4491.074707, 22.622589, 4.560626, 3000, 0, 0, 100, 0),
((@CGUID + 38) * 10, 7, 1341.317139, -4405.867188, 27.853329, 4.383916, 0, 0, 0, 100, 0), -- 5
((@CGUID + 38) * 10, 8, 1360.981689, -4377.626953, 26.084114, 3.323637, 0, 0, 0, 100, 0), -- 4
((@CGUID + 38) * 10, 9, 1424.909790, -4370.168457, 25.462467, 2.820196, 0, 0, 0, 100, 0), -- 3
((@CGUID + 38) * 10, 10, 1440.086914, -4422.711426, 25.462467, 3.249809, 0, 0, 0, 100, 0), -- 2
((@CGUID + 38) * 10, 11, 1510.770508, -4415.110840, 19.337944, 3.245882, 0, 0, 0, 100, 0), -- 1

((@CGUID + 39) * 10, 1, 1519.227173, -4420.032715, 17.018894, 2.832764, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 2, 1504.174561, -4397.063477, 21.904577, 1.835307, 4000, 0, 0, 100, 0),
((@CGUID + 39) * 10, 3, 1475.047607, -4416.577637, 25.462658, 3.688848, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 4, 1432.220093, -4422.998535, 25.462658, 3.321281, 2500, 0, 0, 100, 0),
((@CGUID + 39) * 10, 5, 1427.358276, -4369.822754, 25.462658, 1.896568, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 6, 1378.408691, -4357.613281, 26.151247, 2.623062, 3000, 0, 0, 100, 0),
((@CGUID + 39) * 10, 7, 1352.227661, -4360.893066, 26.748661, 1.684511, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 8, 1348.345459, -4345.072754, 27.216478, 1.818029, 2000, 0, 0, 100, 0),
((@CGUID + 39) * 10, 9, 1362.780273, -4367.947266, 26.153179, 5.547090, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 10, 1424.892334, -4363.779785, 25.462536, 0.076789, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 11, 1449.072754, -4425.893555, 25.462536, 5.519594, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 12, 1496.059570, -4419.106445, 23.187777, 0.163175, 0, 0, 0, 100, 0),
((@CGUID + 39) * 10, 13, 1564.113159, -4412.110352, 7.560035, 0.171029, 0, 0, 0, 100, 0),

(@CGUID * 10, 1, 1314.228394, -4472.458496, 23.983208, 1.540771, 0, 0, 0, 100, 0),
(@CGUID * 10, 2, 1315.020996, -4391.339355, 26.246040, 1.591822, 0, 0, 0, 100, 0),
(@CGUID * 10, 3, 1381.445679, -4373.530762, 26.022976, 0.193814, 0, 0, 0, 100, 0),
(@CGUID * 10, 4, 1425.371216, -4371.731445, 25.462433, 5.196810, 0, 0, 0, 100, 0),
(@CGUID * 10, 5, 1437.288330, -4423.067383, 25.462433, 5.133973, 0, 0, 0, 100, 0),
(@CGUID * 10, 6, 1488.331787, -4418.357422, 24.094090, 0.166324, 0, 0, 0, 100, 0),
(@CGUID * 10, 7, 1599.124756, -4407.760742, 7.388023, 0.376025, 10000, 0, 0, 100, 0),
(@CGUID * 10, 8, 1488.331787, -4418.357422, 24.094090, 0.166324, 0, 0, 0, 100, 0), -- 6
(@CGUID * 10, 9, 1437.288330, -4423.067383, 25.462433, 5.133973, 0, 0, 0, 100, 0), -- 5
(@CGUID * 10, 10, 1425.371216, -4371.731445, 25.462433, 5.196810, 0, 0, 0, 100, 0), -- 4
(@CGUID * 10, 11, 1381.445679, -4373.530762, 26.022976, 0.193814, 0, 0, 0, 100, 0), -- 3
(@CGUID * 10, 12, 1315.020996, -4391.339355, 26.246040, 1.591822, 0, 0, 0, 100, 0), -- 2
(@CGUID * 10, 13, 1314.228394, -4472.458496, 23.983208, 1.540771, 0, 0, 0, 100, 0),

((@CGUID + 2) * 10, 1, 1311.382813, -4472.563477, 24.082273, 1.557264, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 2, 1314.851563, -4387.514160, 26.244619, 1.616169, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 3, 1381.291992, -4370.146484, 26.023146, 1.616169, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 4, 1429.167358, -4371.299805, 25.462433, 4.840226, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 5, 1438.546509, -4419.699707, 25.462433, 6.037951, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 6, 1488.069946, -4415.084961, 23.924955, 0.084631, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 7, 1594.640869, -4406.261719, 6.956670,0.752219, 10500, 0, 0, 100, 0),
((@CGUID + 2) * 10, 8, 1488.069946, -4415.084961, 23.924955, 0.084631, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 9, 1438.546509, -4419.699707, 25.462433, 6.037951, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 10, 1429.167358, -4371.299805, 25.462433, 4.840226, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 11, 1381.291992, -4370.146484, 26.023146, 1.616169, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 12, 1314.851563, -4387.514160, 26.244619, 1.616169, 0, 0, 0, 100, 0),
((@CGUID + 2) * 10, 13, 1311.382813, -4472.563477, 24.082273, 1.557264, 0, 0, 0, 100, 0),

((@CGUID + 1) * 10, 1, 1324.306641, -4474.051758, 25.471981, 1.623239, 1000, 0, 0, 100, 0),
((@CGUID + 1) * 10, 2, 1294.313599, -4423.655762, 26.651222, 2.200507, 2000, 0, 0, 100, 0),
((@CGUID + 1) * 10, 3, 1336.517456, -4413.115723, 27.156092, 0.119199, 2000, 0, 0, 100, 0),
((@CGUID + 1) * 10, 4, 1350.187622, -4346.205078, 27.194891, 1.474011, 2000, 0, 0, 100, 0),
((@CGUID + 1) * 10, 5, 1325.687866, -4406.854980, 27.066034, 4.489942, 0, 0, 0, 100, 0),
((@CGUID + 1) * 10, 6, 1312.286133, -4514.444336, 22.207296, 4.427111, 3000, 0, 0, 100, 0),

((@CGUID + 48) * 10, 1, 1503.223022, -4413.273926, 21.462757, 3.743015, 0, 0, 0, 100, 0),
((@CGUID + 48) * 10, 2, 1551.767456, -4439.213867, 10.344376, 5.917779, 0, 0, 0, 100, 0),
((@CGUID + 48) * 10, 3, 1571.801270, -4415.120605, 7.094321, 0.950135, 0, 0, 0, 100, 0),
((@CGUID + 48) * 10, 4, 1530.485962, -4394.278809, 14.629207, 2.725135, 0, 0, 0, 100, 0),

((@CGUID + 49) * 10, 1, 1428.319946, -4368.334961, 25.462538, 1.801508, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 2, 1379.236084, -4371.864258, 26.023857, 3.317327, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 3, 1317.712158, -4389.084473, 26.241236, 3.439064, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 4, 1312.412354, -4495.200684, 22.253731, 4.683920, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 5, 1317.712158, -4389.084473, 26.241236, 3.439064, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 6, 1379.236084, -4371.864258, 26.023857, 3.317327, 0, 0, 0, 100, 0),
((@CGUID + 49) * 10, 7, 1428.319946, -4368.334961, 25.462538, 1.801508, 0, 0, 0, 100, 0),

((@CGUID + 50) * 10, 1, 1350.657959, -4349.023926, 27.158371, 2.154161, 2000, 0, 0, 100, 0),
((@CGUID + 50) * 10, 2, 1328.607300, -4387.384277, 26.224094, 3.992004, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 3, 1298.629150, -4412.804688, 26.687563, 3.768165, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 4, 1292.821533, -4392.992188, 26.284231, 1.781106, 4000, 0, 0, 100, 0),
((@CGUID + 50) * 10, 5, 1379.779419, -4372.537598, 26.023079, 0.182821, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 6, 1423.772461, -4367.567871, 25.462664, 0.061084, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 7, 1438.552124, -4420.987793, 25.462664, 4.926629, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 8, 1524.945923, -4410.342285, 14.457470, 0.163185, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 9, 1582.459229, -4406.155273, 6.063486, 0.602228, 10000, 0, 0, 100, 0),
((@CGUID + 50) * 10, 10, 1524.945923, -4410.342285, 14.457470, 0.163185, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 11, 1438.552124, -4420.987793, 25.462664, 4.926629, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 12, 1423.772461, -4367.567871, 25.462664, 0.061084, 0, 0, 0, 100, 0),
((@CGUID + 50) * 10, 13, 1379.779419, -4372.537598, 26.023079, 0.182821, 0, 0, 0, 100, 0),

((@CGUID + 51) * 10, 1, 1535.931396, -4416.078125, 11.668506, 1.755966, 0, 0, 0, 100, 0),
((@CGUID + 51) * 10, 2, 1580.108887, -4405.557617, 5.750760, 0.267636, 0, 0, 0, 100, 0),
((@CGUID + 51) * 10, 3, 1651.950684, -4417.000488, 16.760706, 6.232729, 0, 0, 0, 100, 0),
((@CGUID + 51) * 10, 4, 1556.471802, -4436.006348, 8.810843, 3.083283, 0, 0, 0, 100, 0),

((@CGUID + 65) * 10, 1, 1601.677856, -4390.092773, 10.024803, 3.693547, 0, 0, 0, 100, 0),
((@CGUID + 65) * 10, 2, 1607.239624, -4397.162109, 10.247937, 2.237402, 0, 0, 0, 100, 0),

((@CGUID + 40) * 10, 1, 1923.388672, -4126.897949, 43.180893, 6.057603, 0, 0, 0, 100, 0),
((@CGUID + 40) * 10, 2, 1916.156494, -4127.158691, 43.197136, 3.186971, 0, 0, 0, 100, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID + 4, @CGUID + 6, @CGUID + 8, @CGUID + 10, @CGUID + 11 , @CGUID + 12, @CGUID + 14, @CGUID + 18, @CGUID + 19, @CGUID + 21, @CGUID + 22, @CGUID + 23, @CGUID + 25, @CGUID + 27, @CGUID + 29, @CGUID + 32, @CGUID + 5, @CGUID + 7, @CGUID + 9, @CGUID + 13, @CGUID + 15, @CGUID + 16, @CGUID + 17, @CGUID + 20, @CGUID + 24, @CGUID + 26, @CGUID + 28, @CGUID + 30, @CGUID + 31, @CGUID + 35, @CGUID + 33, @CGUID + 34, @CGUID + 3);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
-- sitting
(@CGUID + 4, 0, 0, 1, 0, 0, ""),
(@CGUID + 6, 0, 0, 1, 0, 0, ""),
(@CGUID + 8, 0, 0, 1, 0, 0, ""),
(@CGUID + 10, 0, 0, 1, 0, 0, ""),
(@CGUID + 11, 0, 0, 1, 0, 0, ""),
(@CGUID + 12, 0, 0, 1, 0, 0, ""),
(@CGUID + 14, 0, 0, 1, 0, 0, ""),
(@CGUID + 18, 0, 0, 1, 0, 0, ""),
(@CGUID + 19, 0, 0, 1, 0, 0, ""),
(@CGUID + 21, 0, 0, 1, 0, 0, ""),
(@CGUID + 22, 0, 0, 1, 0, 0, ""),
(@CGUID + 23, 0, 0, 1, 0, 0, ""),
(@CGUID + 25, 0, 0, 1, 0, 0, ""),
(@CGUID + 27, 0, 0, 1, 0, 0, ""),
(@CGUID + 29, 0, 0, 1, 0, 0, ""),
(@CGUID + 32, 0, 0, 1, 0, 0, ""),
(@CGUID + 35, 0, 0, 1, 0, 0, ""),
(@CGUID + 33, 0, 0, 1, 0, 0, ""),
(@CGUID + 3, 0, 0, 1, 0, 0, ""),

-- sleeping
(@CGUID + 5, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 7, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 9, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 13, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 15, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 16, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 17, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 20, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 24, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 26, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 28, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 30, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 31, 0, 0, 3, 0, 0, "42648"),
(@CGUID + 34, 0, 0, 3, 0, 0, "42648");

-- pathing and mounts
DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID + 37, @CGUID + 38, @CGUID + 39, @CGUID, @CGUID + 2, @CGUID + 1, @CGUID + 51, @CGUID + 48, @CGUID + 49, @CGUID + 50);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@CGUID + 37, (@CGUID + 37) * 10, 0, 0, 0, 0, ""),
(@CGUID + 38, (@CGUID + 38) * 10, 0, 0, 0, 0, ""),
(@CGUID + 39, (@CGUID + 39) * 10, 0, 0, 0, 0, ""),
(@CGUID, @CGUID * 10, 0, 0, 0, 0, ""),
(@CGUID + 2, (@CGUID + 2) * 10, 0, 0, 0, 0, ""),
(@CGUID + 1, (@CGUID + 1) * 10, 0, 0, 0, 0, ""),
(@CGUID + 51, (@CGUID + 51) * 10, 29283, 0, 0, 0, ""),
(@CGUID + 50, (@CGUID + 50) * 10, 29283, 0, 0, 0, ""),
(@CGUID + 48, (@CGUID + 48) * 10, 29260, 0, 0, 0, ""),
(@CGUID + 49, (@CGUID + 49) * 10, 29260, 0, 0, 0, "");

DELETE FROM `gameobject_addon` WHERE `guid` IN (@OGUID, @OGUID + 11, @OGUID + 12);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`) VALUES
(@OGUID, 7, 1000),
(@OGUID + 11, 7, 1000),
(@OGUID + 12, 7, 1000);

DELETE FROM `spell_area` WHERE `spell` IN (60943, 59062);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(60943, 4129, 13257, 13257, 0, 690, 2, 1, 2, 2),
(59062, 14, 13257, 13267, 0, 690, 2, 1, 66, 11),
(59062, 1637, 13257, 13267, 0, 690, 2, 1, 66, 11),
(60943, 1637, 13266, 0, 0, 690, 2, 1, 2, 0),

(59062, 85, 13257, 13267, 0, 690, 2, 1, 64, 11), -- tirisfal glades
(59062, 1497, 13257, 13267, 0, 690, 2, 1, 64, 11); -- undercity

DELETE FROM `spell_script_names` WHERE `spell_id` IN (@OG_TELEPORTSPELL, @UCTELEPORTSPELL);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@OG_TELEPORTSPELL, 'spell_59064_59439_portals'),
(@UCTELEPORTSPELL, 'spell_59064_59439_portals');

-- Its not sniff verified, if anyone got any info about it, you're more than welcome to correct it
DELETE FROM `spell_target_position` WHERE `ID` IN (58419, 59448);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`) VALUES
(58419, 0, 1, 1336.34, -4374.32, 26.19, 0.09, 0),
(59448, 0, 0, 1962.69, 235.92, 39.77, 3.09, 0);
--
DELETE FROM creature_template_addon WHERE `entry` IN (26514);
INSERT INTO creature_template_addon (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(26514, 0, 0, 0, 1, 0, '29266');
--
DELETE FROM `creature_template_addon` WHERE `entry`=24783;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(24783, 0, 0, 0, 1, 0, 43775);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry`=44422;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,44422,0,0,30,0,186946,5,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'"),
(13,1,44422,0,0,31,0,5,186946,0,0,0,0,'',"Spell 'Scavenge' target GameObject 'Fjord Hawk Egg'");
--
DELETE FROM `item_loot_template` WHERE `Entry` IN (50301,54218);
INSERT INTO `item_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(50301,46779,0,36.36,0,1,1,50,50,'Landro\'s Pet Box, Path of Cenarius'),
(50301,35223,0,36.36,0,1,1,50,50,'Landro\'s Pet Box, Papa Hummel\'s Old-Fashioned Pet Biscuit'),
(50301,45047,0,27.28,0,1,1,50,50,'Landro\'s Pet Box, Sandbox Tiger'),
(50301,32588,0,0.45,0,1,2,1,1,'Landro\'s Pet Box, Banana Charm'),
(50301,38050,0,0.45,0,1,2,1,1,'Landro\'s Pet Box, Soul-Trader Beacon'),
(50301,34493,0,0.10,0,1,2,1,1,'Landro\'s Pet Box, Dragon Kite'),
(54218,46779,0,36.36,0,1,1,50,50,'Landro\'s Gift Box, Path of Cenarius'),
(54218,35223,0,36.36,0,1,1,50,50,'Landro\'s Gift Box, Papa Hummel\'s Old-Fashioned Pet Biscuit'),
(54218,45047,0,27.28,0,1,1,50,50,'Landro\'s Gift Box, Sandbox Tiger'),
(54218,23720,0,0.50,0,1,2,1,1,'Landro\'s Gift Box, Riding Turtle'),
(54218,49284,0,0.30,0,1,2,1,1,'Landro\'s Gift Box, Reins of the Swift Spectral Tiger'),
(54218,49283,0,0.30,0,1,2,1,1,'Landro\'s Gift Box, Reins of the Spectral Tiger'),
(54218,49286,0,0.30,0,1,2,1,1,'Landro\'s Gift Box, X-51 Nether-Rocket X-TREME'),
(54218,49285,0,0.10,0,1,2,1,1,'Landro\'s Gift Box, X-51 Nether-Rocket'),
(54218,49282,0,0.20,0,1,2,1,1,'Landro\'s Gift Box, Big Battle Bear');
-- delete frogger spawn locations from `creature`, move them to `creature_summon_groups`
SET @FROGGER = 16027;
DELETE FROM `creature` WHERE `id` = @FROGGER;
DELETE FROM `creature_summon_groups` WHERE `summonerId`=533 AND `summonerType`=2;
INSERT INTO `creature_summon_groups` (`summonerType`,`summonerId`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(2,533,0,@FROGGER,3175.281,-3134.764,293.4368,4.244924,3,7500),
(2,533,1,@FROGGER,3154.581,-3126.18 ,293.5911,4.430199,3,7500),
(2,533,2,@FROGGER,3128.622,-3119.604,293.4113,4.738929,3,7500);
DELETE FROM `waypoint_data` WHERE `id` BETWEEN @FROGGER*10+0 AND @FROGGER*10+2;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@FROGGER*10+0,1,3158.253,-3163.889,293.3027),
(@FROGGER*10+1,1,3145.881,-3158.563,293.3215),
(@FROGGER*10+2,1,3130.79 ,-3156.624,293.3239);
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN -76313 AND -76311 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@FROGGER AND `source_type`=0 AND `id` BETWEEN 2 AND 5;
UPDATE `creature_template` SET `unit_flags`=(`unit_flags`|256) WHERE `entry`=@FROGGER;
