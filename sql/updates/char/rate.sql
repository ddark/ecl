
DROP TABLE IF EXISTS `character_base_rate_xp`;
CREATE TABLE `character_base_rate_xp` (
  `guid` int(11) unsigned NOT NULL,
  `rate` int(11) unsigned NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

