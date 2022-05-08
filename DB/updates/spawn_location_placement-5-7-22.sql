ALTER TABLE `spawn_location_placement` ADD COLUMN `lvl_override` INT NOT NULL DEFAULT '0' AFTER `instance_id`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `hp_override` INT NOT NULL DEFAULT '0' AFTER `lvl_override`;
ALTER TABLE `spawn_location_placement` ADD COLUMN `mp_override` INT NOT NULL DEFAULT '0' AFTER `hp_override`;
