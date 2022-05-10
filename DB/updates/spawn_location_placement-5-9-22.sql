ALTER TABLE `spawn_location_placement` ADD COLUMN `lvl_override` INT NOT NULL DEFAULT '0' AFTER `instance_id`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `hp_override` INT NOT NULL DEFAULT '0' AFTER `lvl_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `mp_override` INT NOT NULL DEFAULT '0' AFTER `hp_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `str_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `mp_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `sta_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `str_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `wis_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `sta_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `int_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `wis_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `agi_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `int_override`;
ALTER TABLE `spawn_location_placement`
	ADD COLUMN `heat_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `agi_override`,
	ADD COLUMN `cold_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `heat_override`,
	ADD COLUMN `magic_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `cold_override`,
	ADD COLUMN `mental_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `magic_override`,
	ADD COLUMN `divine_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `mental_override`,
	ADD COLUMN `disease_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `divine_override`,
	ADD COLUMN `poison_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `disease_override`,
	ADD COLUMN `difficulty_override` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `poison_override`;