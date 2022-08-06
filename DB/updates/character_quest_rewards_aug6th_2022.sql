CREATE TABLE `character_quest_rewards` (
  `char_id` int(10) unsigned NOT NULL default 0,
  `quest_id` int(10) unsigned NOT NULL default 0,
  `indexed` int(10) unsigned NOT NULL default 0,
  `is_temporary` tinyint(3) unsigned NOT NULL default 0,
  `is_collection` tinyint(3) unsigned NOT NULL default 0,
  `has_displayed` tinyint(3) unsigned NOT NULL default 0,
  `tmp_coin` bigint unsigned NOT NULL DEFAULT 0,
  `tmp_status` int(10) unsigned NOT NULL default 0,
  `description` text not null default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `character_quest_temporary_rewards` (
  `char_id` int(10) unsigned NOT NULL default 0,
  `quest_id` int(10) unsigned NOT NULL default 0,
  `item_id` int(10) unsigned NOT NULL default 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;