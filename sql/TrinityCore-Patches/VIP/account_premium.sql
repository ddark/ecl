CREATE TABLE IF NOT EXISTS `auth`.`account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` int(4) NOT NULL DEFAULT '0',
  `unsetdate` int(4) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `setdate` (`setdate`),
  KEY `unsetdate` (`unsetdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `auth`.`rbac_permissions` (`id`, `name`) VALUES
(999, 'Command: vip');

INSERT INTO `auth`.`rbac_linked_permissions` (`id`, `linkedId`) VALUES
(195, 999);

INSERT INTO `world`.`command` (`name`, `permission`, `help`) VALUES
('vip bank', 999, 'Syntax: .vip bank'),
('vip mail', 999, 'Syntax: .vip mail');