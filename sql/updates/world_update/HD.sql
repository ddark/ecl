INSERT INTO spell_script_names (spell_id, ScriptName) VALUES (-54049, 'spell_warl_shadow_bite');

SET @NPCENTRY := 16;
INSERT INTO `creature_template_outfits` (`entry`, `race`, `gender`, `skin`, `face`, `hair`, `haircolor`, `facialhair`, `head`, `shoulders`, `body`, `chest`, `waist`, `legs`, `feet`, `wrists`, `hands`, `back`, `tabard`)
VALUES (@NPCENTRY, 11, 1, 14, 4, 10, 3, 5, 31286, 43617, 0, 26267, 26270, 26272, 0, 0, 43698, 0, 0);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`)
VALUES (@NPCENTRY, 1, 32946, 32945, 0);

CREATE TABLE IF NOT EXISTS `creature_template_outfits` (
  `entry` INT(10) UNSIGNED NOT NULL,
  `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 for male, 1 for female',
  `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `face` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `hair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `haircolor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `facialhair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `head` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `shoulders` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `body` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `chest` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `waist` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `legs` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `feet` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `wrists` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `hands` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `back` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `tabard` INT(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 