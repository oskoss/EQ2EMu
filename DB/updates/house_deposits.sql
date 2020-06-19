update commands set handler=518 where command='house_deposit';
CREATE TABLE `character_house_deposits` (
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `house_id` int(10) unsigned NOT NULL DEFAULT 0,
  `instance_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) not null default '',
  `amount` bigint unsigned NOT NULL DEFAULT 0,
  `last_amount` bigint unsigned NOT NULL DEFAULT 0,
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `last_status` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;