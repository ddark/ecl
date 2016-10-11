
-- Rbac vip account
DELETE FROM `rbac_permissions` WHERE `Id` IN (1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020);
INSERT INTO `rbac_permissions` VALUES
('1000', 'Vip'),
('1001', 'Vip debuff'),
('1002', 'Vip bank'),
('1003', 'Vip repair'),
('1004', 'Vip resettalents'),
('1005', 'Vip taxa'),
('1006', 'Vip home'),
('1007', 'Vip capital'),
('1008', 'Vip mail'),
('1009', 'Vip changerace'),
('1010', 'Vip customize'),
('1011', 'Vip appear'),
('1012', 'Vip map'),
('1013', 'Vip buffs'),
('1014', 'Vip arena'),
('1015', 'Vip warsong'),
('1016', 'Vip arathi'),
('1017', 'Vip eye'),
('1018', 'Vip alterac'),
('1019', 'Vip teles'),
('1020', 'Vip qcomplete');

DELETE FROM `rbac_linked_permissions` WHERE `linkedId` IN (1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020);
INSERT INTO `rbac_linked_permissions` VALUES
('195','1000'),
('195','1001'),
('195','1002'),
('195','1003'),
('195','1004'),
('195','1005'),
('195','1006'),
('195','1007'),
('195','1008'),
('195','1009'),
('195','1010'),
('195','1011'),
('195','1012'),
('195','1013'),
('195','1014'),
('195','1015'),
('195','1016'),
('195','1017'),
('195','1018'),
('195','1019'),
('195','1020');