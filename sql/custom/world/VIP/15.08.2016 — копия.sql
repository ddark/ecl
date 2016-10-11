-- VIP
-- Check VIP

-- Disable VIP Command
DELETE FROM `trinity_string` WHERE entry = 11111;
INSERT INTO `trinity_string` VALUES
(11111,'Сommand disable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Команда отключена.');	

-- VIP Error
DELETE FROM `trinity_string` WHERE entry = 11112;
INSERT INTO `trinity_string` VALUES
(11112,'error',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Произошла ошибка.');

-- VIP BG
DELETE FROM `trinity_string` WHERE entry = 11113;
INSERT INTO `trinity_string` VALUES
(11113,'You can not use this command on Battleground or the arena!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не можете использовать данную команду на поле боя или на арене!');

-- VIP Stealth
DELETE FROM `trinity_string` WHERE entry = 11114;
INSERT INTO `trinity_string` VALUES
(11114,'You can not use this command in stealth mode!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы не можете использовать данную команду в режиме незаметности!');


-- Vip Change race
DELETE FROM `trinity_string` WHERE entry = 11116;
INSERT INTO `trinity_string` VALUES
(11116,'Race Change will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Смена расы будет предложена при следующем входе в игровой мир!');

-- Vip customize
DELETE FROM `trinity_string` WHERE entry = 11117;
INSERT INTO `trinity_string` VALUES
(11117,'Character customize will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Смена внешности персонажа будет предложена при следующем входе в игровой мир!');

-- Vip group
DELETE FROM `trinity_string` WHERE entry = 11118;
INSERT INTO `trinity_string` VALUES
(11118,'You must be in the group',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы должны находится в группе!');
