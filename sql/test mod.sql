
DROP TABLE IF EXISTS `world_custom_reward_pvp`;
CREATE TABLE `world_custom_reward_pvp` (
`id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_type_is_battleground` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_type_is_arena` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_zone_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_map_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_target_race_mask` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_target_class_mask` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_self_race_mask` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_self_class_mask` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_target_guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_self_guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_target_guild_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`req_self_guild_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_money_gold` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_honor` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_item_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_buff` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_group` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_rep_faction_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`reward_rep_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
`disabled` mediumint(8) unsigned NOT NULL DEFAULT '0',
`Comment` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;