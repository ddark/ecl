ALTER TABLE `world_battleground`
CHANGE COLUMN `BattleIsRate` `BattleIsRated`  tinyint(1) UNSIGNED NOT NULL DEFAULT 0 AFTER `BattleIsArena`;