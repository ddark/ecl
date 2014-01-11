

-- Loot chests
UPDATE `gameobject_template` SET `flags` = `flags` &~ 16 WHERE `entry` IN (195324, 195323, 195375, 195374, 195710, 195709);
