CREATE TABLE `character_claim_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `char_id` int(10) unsigned DEFAULT 0,
  `item_id` int(10) unsigned DEFAULT 0,
  `max_claim` int(10) unsigned DEFAULT 0,
  `curr_claim` int(10) unsigned DEFAULT 0,
  `one_per_char` int(11) unsigned DEFAULT 0,
  `last_claim` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `claim_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `max_claim` int(11) NOT NULL DEFAULT 0,
  `one_per_char` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `claim_items` (`id`, `item_id`, `max_claim`, `one_per_char`) VALUES
	(1, 1, 10, 0),
	(2, 60606, 10, 0),
	(3, 22461, 10, 0),
	(4, 20628, 10, 0),
	(5, 20614, 10, 0),
	(6, 47077, 10, 0);
