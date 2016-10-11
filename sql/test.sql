UPDATE `creature_template` SET `scale` = 0.5 WHERE (entry = 400417);

DELETE FROM `spell_proc_event` WHERE `entry` IN (71642,71611);
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`CoolDown`) VALUES (71611, 0, 0, 0, 0, 0, 0, procEx|131072, 0, 0, 0); -- Trauma normal
INSERT INTO `spell_proc_event` (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`CoolDown`) VALUES (71642, 0, 0, 0, 0, 0, 0, procEx|131072, 0, 0, 0); -- Trauma heroic

