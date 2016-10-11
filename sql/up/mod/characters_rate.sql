
DROP TABLE IF EXISTS `character_rate`;
CREATE TABLE `character_rate` (
  `guid` int(11) unsigned NOT NULL,
  `rate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `account_rate`;
CREATE TABLE `account_rate` (
  `id` int(11) unsigned NOT NULL,
  `rate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;