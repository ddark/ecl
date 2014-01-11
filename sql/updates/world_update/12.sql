-- Implement Fast Arena Start
DELETE FROM `gameobject_template` WHERE `entry` = 42000;
INSERT INTO `gameobject_template`(`entry`, `type`, `displayId`, `name`, `IconName`, `size`, `ScriptName`, `WDBVerified`) VALUES (42000, 10, 327, 'Faster Start', 'PVP' , 1, 'fast_arena_start', 12340);

-- Fix Sylvanas Music Box
DELETE FROM spell_script_names WHERE spell_id = 73331;
INSERT INTO spell_script_names VALUES ('73331', 'spell_item_sylvanas_music_box');

DELETE FROM `creature_template` WHERE (`entry`=97015);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES (97015, 0, 0, 0, 0, 0, 30859, 30987, 30861, 30862, 'Recuperador de Anillos del Veredicto Cin?reo', 'H?blale si has perdido tu anillo', '', 0, 80, 80, 2, 35, 35, 1, 1, 1.14286, 1, 1, 422, 586, 0, 642, 7.5, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 345, 509, 103, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 75, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 'npc_icc_rep_rings', 12340);
UPDATE creature_template SET npcflag=1, gossip_menu_id=61001 WHERE entry=97015;
DELETE FROM gossip_menu WHERE entry=61001;
INSERT INTO gossip_menu VALUES (61001,537006);
DELETE FROM npc_text WHERE id=537006;
INSERT INTO npc_text (id, text0_0) VALUES (537006,'?Has perdido el anillo obtenido con la reputaci?n de El Veredicto Cin?reo?$B$BAqu? podr?s obtener de nuevo el anillo que ten?as de acuerdo con tu nivel de reputaci?n.$B$BSi despu?s de recuperarlo y subir m?s reputaci?n no te ofrecen las misiones de intercambio, borra el anillo que tienes y vuelve a hablar conmigo.$B$BYo te suministrar? otro.');