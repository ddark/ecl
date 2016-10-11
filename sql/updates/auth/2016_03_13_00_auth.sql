DELETE FROM `rbac_permissions` WHERE `id` BETWEEN 837 AND 843;
INSERT INTO `rbac_permissions` (`id`,`name`) VALUES
(837, 'Command: anticheat'),
(838, 'Command: anticheat global'),
(839, 'Command: anticheat player'),
(840, 'Command: anticheat handle'),
(841, 'Command: anticheat jail'),
(842, 'Command: anticheat warn');
-- On delete cascade, no delete needed for this table
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(197,837),
(196,838),
(197,839),
(196,840),
(197,841),
(197,842);
