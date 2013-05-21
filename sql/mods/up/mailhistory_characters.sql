DROP TABLE IF EXISTS `world_mail`;
CREATE TABLE `world_mail` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `template_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sender` int(10) unsigned NOT NULL DEFAULT '0',
  `receiver` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` longtext NOT NULL,
  `body` longtext NOT NULL,
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `cod` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
ALTER TABLE `world_mail`
MODIFY COLUMN `log_id`  int(11) UNSIGNED NOT NULL AUTO_INCREMENT FIRST ;
