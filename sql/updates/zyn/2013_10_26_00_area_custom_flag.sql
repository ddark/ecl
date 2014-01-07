DROP TABLE IF EXISTS `area_custom_flag`;
CREATE TABLE `area_custom_flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flag` tinyint(3) unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `radius` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
