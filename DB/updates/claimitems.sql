CREATE TABLE IF NOT EXISTS `character_claim_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(10) unsigned DEFAULT 0,
  `item_id` int(10) unsigned DEFAULT 0,
  `max_claim` int(10) unsigned DEFAULT 0,
  `curr_claim` int(10) unsigned DEFAULT 0,
  `one_per_char` int(11) unsigned DEFAULT 0,
  `last_claim` bigint(20) unsigned DEFAULT 0,
  `veteran_reward_time` bigint(20) unsigned DEFAULT 0 COMMENT 'account age in seconds',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `claim_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `max_claim` int(11) NOT NULL DEFAULT 0,
  `one_per_char` int(10) unsigned DEFAULT 0,
  `veteran_reward_time` bigint(20) unsigned DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;


INSERT INTO `claim_items` (`id`, `item_id`, `max_claim`, `one_per_char`, `veteran_reward_time`, `comment`) VALUES
	(1, 1, 10, 0, 0, NULL),
	(2, 60606, 10, 0, 0, NULL),
	(3, 22461, 10, 0, 0, NULL),
	(4, 20628, 10, 0, 0, NULL),
	(5, 20614, 10, 0, 0, NULL),
	(6, 20612, 10, 0, 86400, '1 day'),
	(7, 22513, 10, 0, 2630000, '1 month'),
	(8, 22514, 10, 0, 604800, '1 week'),
	(9, 22515, 10, 0, 31536000, '1 year'),
	(10, 22516, 10, 0, 47340000, '18 month'),
	(11, 22517, 10, 0, 63072000, '2 year'),
	(12, 22518, 10, 0, 7890000, '3 month'),
	(13, 22519, 10, 0, 94608000, '3 year'),
	(14, 22520, 10, 0, 126144000, '4 year'),
	(15, 22521, 10, 0, 157680000, '5 year'),
	(16, 22522, 10, 0, 15780000, '6 month'),
	(17, 22523, 10, 0, 189216000, '6 year'),
	(18, 22524, 10, 0, 252288000, '8 year');
