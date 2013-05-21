/*
Navicat MySQL Data Transfer

Source Server         : trinity
Source Server Version : 50153
Source Host           : localhost:3306
Source Database       : world4

Target Server Type    : MYSQL
Target Server Version : 50153
File Encoding         : 65001

Date: 2012-04-20 00:28:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `custom_npc_tele_destination`
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL DEFAULT '',
  `pos_X` float NOT NULL DEFAULT '0',
  `pos_Y` float NOT NULL DEFAULT '0',
  `pos_Z` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cost` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_npc_tele_destination
-- ----------------------------
INSERT INTO custom_npc_tele_destination VALUES ('1', 'Альтеракская долина-[10 голд]', '883.187', '-489.375', '96.7618', '30', '3.06932', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('2', 'Альтеракская долина-[10 голд]', '-818.155', '-623.043', '54.0884', '30', '2.1', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('3', 'Низина Арати-[10 голд]', '686.053', '683.165', '-12.9149', '529', '0.18', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('4', 'Низина Арати-[10 голд]', '1308.68', '1306.03', '-9.0107', '529', '3.91285', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('5', 'Черный храм-[20 голд]', '-3610.72', '324.988', '37.4', '530', '3.28298', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('6', 'Непроглядная Пучина-[10 голд]', '4254.58', '664.74', '-29.04', '1', '1.97', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('7', 'Глубины Черной горы-[20 голд]', '-7301.03', '-913.19', '165.37', '0', '0.08', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('8', 'Вершина Черной горы-[20 голд]', '-7535.43', '-1212.04', '285.45', '0', '5.29', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('9', 'Логово Крыла Тьмы-[10 голд]', '-7665.55', '-1102.49', '400.679', '469', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('10', 'Пещеры Времени-[10 голд]', '-8173.66', '-4746.36', '33.8423', '1', '4.93989', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('11', 'Круг Крови-[10 голд]', '2839.44', '5930.17', '11.1002', '530', '3.16284', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('12', 'Резервуар Кривого Клыка-[10 голд]', '517.288', '6976.28', '32.0072', '530', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('13', 'Дарнас-[10 голд]', '9947.52', '2482.73', '1316.21', '1', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('14', 'Забытый Город-[20 голд]', '-3982.47', '1127.79', '161.02', '1', '0.05', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('15', 'Экзодар-[10 голд]', '-4073.03', '-12020.4', '-1.47', '530', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('16', 'Око Бури-[10 голд]', '2487.72', '1609.12', '1224.64', '566', '3.35671', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('17', 'Око Бури-[10 голд]', '1843.73', '1529.77', '1224.43', '566', '0.297579', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('18', 'Златоземье-[10 голд]', '-9464', '62', '56', '0', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('19', 'Логово Груула-[10 голд]', '3539.01', '5082.36', '1.69107', '530', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('20', 'Арена Гурубаши-[10 голд]', '-13261.3', '168.294', '35.0792', '0', '1.00688', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('21', 'Цитадель Адского пламени-[10 голд]', '-305.816', '3056.4', '-2.47318', '530', '2.01', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('22', 'Стальгорн-[10 голд]', '-4924.07', '-951.95', '501.55', '0', '5.4', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('23', 'Остров Кель-Данас-[15 голд]', '12947.4', '-6893.31', '5.68398', '530', '3.09154', '0', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('24', 'Каражан-[10 голд]', '-11118.8', '-2010.84', '47.0807', '0', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('25', 'Мародон-[10 голд]', '-1433.33', '2955.34', '96.21', '1', '4.82', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('26', 'Огненные Недра-[10 голд]', '1121.45', '-454.317', '-101.33', '230', '3.5', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('27', 'Проклятый лес-[10 голд]', '3125.18', '-3748.02', '136.049', '0', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('28', 'Логово Ониксии-[10 голд]', '-4707.44', '-3726.82', '54.6723', '1', '3.8', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('29', 'Оргриммар-[30 голд]', '1552.5', '-4420.66', '8.94802', '1', '0', '0', '300000');
INSERT INTO custom_npc_tele_destination VALUES ('30', 'Колючий холм-[30 голд]', '315.721', '-4743.4', '10.4867', '1', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('31', 'Курганы Иглошкурых-[15 голд]', '-4645.08', '-2470.85', '85.53', '1', '4.39', '0', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('32', 'Лабиринты Иглошкурых-[15 голд]', '-4484.04', '-1739.4', '86.47', '1', '1.23', '0', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('33', 'Круг испытаний-[10 голд]', '-1999.94', '6581.71', '11.32', '530', '2.3', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('34', 'Врата Анкиража-[20 голд]', '-8409.03', '1498.83', '27.3615', '1', '2.49757', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('35', 'Некроситет-[20 голд]', '1219.01', '-2604.66', '85.61', '0', '0.5', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('36', 'Крепость Тёмного клыка-[10 голд]', '-254.47', '1524.68', '76.89', '0', '1.56', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('37', 'Шаттрат-[20 голд]', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('38', 'Луносвет-[50 голд]', '9338.74', '-7277.27', '13.7895', '530', '0', '0', '500000');
INSERT INTO custom_npc_tele_destination VALUES ('39', 'Штормград-[10 голд]', '-8960.14', '516.266', '96.3568', '0', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('40', 'Стратхольм-[10 голд]', '3263.54', '-3379.46', '143.59', '0', '0', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('41', 'Крепость Бурь-[10 голд]', '3089.58', '1399.05', '187.653', '530', '4.79407', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('42', 'Храм Анкиража-[20 голд]', '-8245.84', '1983.74', '129.072', '1', '0.936195', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('43', 'Мёртвые копи-[10 голд]', '-11212', '1658.58', '25.67', '0', '1.45', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('44', 'Забытый город (Ристалище)-[20 голд]', '-3761.49', '1133.43', '132.083', '1', '4.57259', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('45', 'Монастырь Алого Ордена-[20 голд]', '2843.89', '-693.74', '139.32', '0', '5.11', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('46', 'Затонувший храм-[20 голд]', '-10346.9', '-3851.9', '-43.41', '0', '6.09', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('47', 'Пещеры стенаний-[20 голд]', '-722.53', '-2226.3', '16.94', '1', '2.71', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('48', 'Громовой утёс-[10 голд]', '-1290', '147.034', '129.682', '1', '4.919', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('49', 'Ульдаман-[10 голд]', '-6119.7', '-2957.3', '204.11', '0', '0.03', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('50', 'Подгород-[20 голд]', '1819.71', '238.79', '60.5321', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('51', 'Ущелье песни войны-[10 голд]', '930.851', '1431.57', '345.537', '489', '0.015704', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('52', 'Ущелье песни войны-[10 голд]', '1525.95', '1481.66', '352.001', '489', '3.20756', '0', '100000');
INSERT INTO custom_npc_tele_destination VALUES ('53', 'Зул-Аман-[20 голд]', '6846.95', '-7954.5', '170.028', '530', '4.61501', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('54', 'Зул-Фаррак-[20 голд]', '-6839.39', '-2911.03', '8.87', '1', '0.41', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('55', 'Зул-Гуруб-[20 голд]', '-11916.7', '-1212.82', '92.2868', '0', '4.6095', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('56', 'Борейская тундра-[15 голд]', '2232.93', '5135.5', '5.344', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('57', 'Ревущий Фьорд-[15 голд]', '592.33', '-5095.5', '6', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('58', 'Драконий погост-[15 голд]', '2994', '-431', '124', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('59', 'Седые холмы-[15 голд]', '3264', '-4587.4', '305', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('60', 'Зул-Драк-[15 голд]', '5443.19', '-1244.5', '249', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('61', 'Низина Шолазар-[15 голд]', '4679.54', '5534.24', '30', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('62', 'Лес Хрустальной песни-[15 голд]', '5626.61', '692.057', '155.459', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('63', 'Грозовая гряда-[15 голд]', '6950.2', '-1639.9', '811', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('64', 'Ледяная корона-[15 голд]', '6603.49', '2456.42', '481', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('65', 'Даларан-[15 голд]', '5780.27', '700.56', '650', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('66', 'ОЛО-[15 голд]', '4928.43', '3341.9', '377', '571', '0', '58', '150000');
INSERT INTO custom_npc_tele_destination VALUES ('67', 'п-ов. Адского Пламени-[20 голд]', '-690.622', '2688.11', '94.1671', '530', '2.34', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('68', 'Долина призрачной луны-[20 голд]', '-3532.44', '500.731', '23.3438', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('69', 'Лес Террокар-[20 голд]', '-2000.47', '4451.54', '8.37917', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('70', 'Шаттрат-[20 голд]', '-1850.21', '5435.82', '-10.9614', '530', '3.40391', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('71', 'Зангартопь-[20 голд]', '-54.8621', '5813.44', '20.6059', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('72', 'Награнд-[20 голд]', '-1145.95', '8182.35', '3.60249', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('73', 'Пустоверть-[20 голд]', '3830.23', '3426.5', '88.6145', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('74', 'Острогорье-[20 голд]', '2960.62', '5467.75', '143.896', '530', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('75', 'Тернистая долина-[20 голд]', '-12644.3', '-377.411', '10.1021', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('76', 'Выженные земли-[20 голд]', '-11182.5', '-3016.67', '7.42235', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('77', 'Красногорье-[20 голд]', '-9283.38', '-2238.21', '63.524', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('78', 'Нагорье Арати-[20 голд]', '-1240.68', '-2510.14', '21.6129', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('79', 'Тирисфальские Леса-[20 голд]', '2036.64', '163.509', '33.87', '0', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('80', 'Силитус-[20 голд]', '-7426.87', '1005.31', '1.13359', '1', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('81', 'Когтиcтые горы-[20 голд]', '1570.92', '1031.52', '137.959', '1', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('82', 'Танарис-[20 голд]', '-7113.23', '-3768.11', '8.45362', '1', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('83', 'Фералас-[20 голд]', '-4841.19', '1309.44', '81.3937', '1', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('84', 'Зимние ключи-[20 голд]', '6762.07', '-4422.07', '763.286', '1', '0', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('85', 'ter-[20 голд]', '16225.1', '16404', '-64.38', '1', '2.73395', '0', '200000');
INSERT INTO custom_npc_tele_destination VALUES ('86', 'gilneas', '-1086.49', '1579.65', '54.1667', '0', '6.25949', '0', '0');
INSERT INTO custom_npc_tele_destination VALUES ('87', 'ferma', '-10736.7', '2445', '7.52215', '1', '0.520511', '0', '0');
INSERT INTO custom_npc_tele_destination VALUES ('88', 'ostrova', '-11829.6', '-4751.03', '6.23073', '1', '6.21876', '0', '0');
INSERT INTO custom_npc_tele_destination VALUES ('89', 'horde', '5162.26', '-1467.71', '1347.32', '1', '0', '0', '0');
INSERT INTO custom_npc_tele_destination VALUES ('90', 'alliance', '4648.3', '-3718.05', '949.974', '1', '4.88515', '0', '0');
INSERT INTO custom_npc_tele_destination VALUES ('91', 'склепчик', '-11214.5', '-1658.85', '-22.4455', '0', '4.71683', '0', '0');
