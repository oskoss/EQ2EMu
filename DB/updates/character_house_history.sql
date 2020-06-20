CREATE TABLE `character_house_history` (
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `house_id` int(10) unsigned NOT NULL DEFAULT 0,
  `instance_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) not null default '',
  `reason` varchar(64) not null default '',
  `amount` bigint unsigned NOT NULL DEFAULT 0,
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `pos_flag` tinyint(1) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;