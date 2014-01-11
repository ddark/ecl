SET @NPC = 50000;

DELETE FROM `creature_template` WHERE `entry` = @NPC;
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `faction_A`, `faction_H`, `npcflag`, `unit_class`, `type`, `ScriptName`) VALUES
(@NPC, '10913', 'Eye', 'Arena watcher', '35', '35', '1', '1', '7', 'npc_arena_watcher');

DELETE FROM `creature_text` WHERE `entry` = @NPC;
INSERT INTO `creature_text` (`entry`, `groupid`, `text`, `type`, `comment`) VALUES
(@NPC, '0', 'Sorry matches at the moment there is no', '15', 'ArenaWatcher'),
(@NPC, '1', 'The match has been completed', '15', 'ArenaWatcher'),
(@NPC, '2', 'Target is offline', '15', 'ArenaWatcher'),
(@NPC, '3', 'Target not in arena', '15', 'ArenaWatcher'),
(@NPC, '4', 'Target is GameMaster', '15', 'ArenaWatcher');

DELETE FROM `locales_creature_text` WHERE `entry` = @NPC;
INSERT INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc8`) VALUES
(@NPC, '0', '0', 'В данный момент матчей нет'),
(@NPC, '1', '0', 'Матч уже завершен'),
(@NPC, '2', '0', 'Игрок не в сети'),
(@NPC, '3', '0', 'Игрок не на арене'),
(@NPC, '4', '0', 'Нельзя следить за игровым мастером');

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 11200 AND 11203;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
('11200', 'Watch the match 2x2 (now games: %u)', 'Смотреть матч 2х2 (сейчас игр: %u)'),
('11201', 'Watch the match 3x3 (now games: %u)', 'Смотреть матч 3х3 (сейчас игр: %u)'),
('11202', 'Watch the match 5x5 (now games: %u)', 'Смотреть матч 5х5 (сейчас игр: %u)'),
('11203', 'Follow player', 'Следить за игроком');