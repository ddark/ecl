DROP TABLE IF EXISTS `character_model`;
CREATE TABLE `character_model` (
  `guid` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `size` float unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;