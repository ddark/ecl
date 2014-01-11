-- -------------------------------------------------------- 
-- 2013_10_26_00_area_custom_flag.sql 
-- -------------------------------------------------------- 
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
 
 
-- -------------------------------------------------------- 
-- 2013_20_27_00_player_bonus_stats.sql 
-- -------------------------------------------------------- 
CREATE TABLE `player_bonus_stats` (
	`race` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`class` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`str` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
	`agi` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
	`inte` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
	`sta` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
	`spi` SMALLINT(5) UNSIGNED NULL DEFAULT '0',
	PRIMARY KEY (`race`, `class`, `level`)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1; 
 
-- -------------------------------------------------------- 
-- _MERGED.sql 
-- -------------------------------------------------------- 
 
 
