INSERT INTO `ruleset_details` (`id`, `ruleset_id`, `rule_category`, `rule_type`, `rule_value`, `description`) VALUES (89, 1, 'R_World', 'StartingZoneLanguages', '0', 'Use starting_zone when calculating starting languages. 0 off, 1 on.');

CREATE TABLE IF NOT EXISTS `starting_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `race` int(11) NOT NULL DEFAULT 0,
  `starting_city` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;


INSERT INTO `starting_languages` (`id`, `race`, `starting_city`, `language_id`, `notes`) VALUES
	(1, 0, 0, 1, 'Race:Barbarian Speaks:Halasian'),
	(2, 1, 0, 2, 'Race:DARK ELF Speaks: Thexian'),
	(3, 3, 0, 3, 'Race:DWARF Speaks:Dwarven'),
	(4, 3, 0, 4, 'Race:ERUDITE Speaks:Erudian'),
	(5, 4, 0, 5, 'Race:FROGLOK Speaks:Guktan'),
	(6, 5, 0, 6, 'Race:GNOME Speaks:Gnomish'),
	(7, 6, 0, 7, 'Race:HALF ELF Speaks:Ayr\'Dal'),
	(8, 7, 0, 8, 'Race:HALFLING Speaks:Stout'),
	(9, 8, 0, 9, 'Race:HIGH ELF Speaks:Koada\'Dal'),
	(10, 9, 0, 0, 'Race:HUMAN Regular Server Common, PVP Good Antonican, PVP Evil Lucanic, Exile Argot)'),
	(11, 10, 0, 12, 'Race:IKSAR Speaks:Sebilisian'),
	(12, 11, 0, 13, 'Race:KERRA Speaks:Kerran'),
	(13, 12, 0, 14, 'Race:OGRE Speaks:Oggish'),
	(14, 13, 0, 26, 'Race:RATONGA Speaks:Ratongan'),
	(15, 14, 0, 15, 'Race:TROLL Speaks:Ykeshan'),
	(16, 15, 0, 16, 'Race:WOOD ELF  Speaks:Feir\'Dal'),
	(17, 16, 0, 35, 'Race:FAE Speaks:Faerlie'),
	(18, 17, 0, 2, 'Race:ARASAI Speaks:Thexian'),
	(19, 18, 0, 36, 'Race:SARNAK Speaks:Gorwish'),
	(20, 19, 0, 0, 'Race:VAMPIRE Speaks:Common'),
	(21, 20, 0, 0, 'Race:AERAKYN Speaks:Common'),
	(22, 0, 8, 32, 'Any race, starts in haven (exile), speaks argot'),
	(23, 0, 8, 12, 'Make sure we can add multiple');