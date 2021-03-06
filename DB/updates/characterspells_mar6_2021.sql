CREATE TABLE character_spell_effects (
  name varchar(64) not null default '',
  caster_char_id int(10) unsigned NOT NULL DEFAULT 0,
  target_char_id int(10) unsigned NOT NULL DEFAULT 0,
  target_type tinyint(3) unsigned NOT NULL DEFAULT 0,
  db_effect_type tinyint(3) unsigned NOT NULL DEFAULT 0,
  spell_id int(10) unsigned NOT NULL DEFAULT 0,
  effect_slot int(10) unsigned NOT NULL DEFAULT 0,
  slot_pos int(10) unsigned NOT NULL DEFAULT 0,
  icon smallint(5) unsigned NOT NULL DEFAULT 0,
  icon_backdrop smallint(5) unsigned NOT NULL DEFAULT 0,
  conc_used tinyint(3) unsigned NOT NULL DEFAULT 0,
  tier tinyint(3) unsigned NOT NULL DEFAULT 0,
  total_time float unsigned NOT NULL DEFAULT 0,
  expire_timestamp int(10) unsigned NOT NULL DEFAULT 0,
  lua_file text not null default '',
  custom_spell tinyint(3) unsigned NOT NULL DEFAULT 0,
  charid int(10) unsigned NOT NULL DEFAULT 0,
  damage_remaining int(10) unsigned NOT NULL DEFAULT 0,
  effect_bitmask int(10) unsigned NOT NULL DEFAULT 0,
  num_triggers smallint(5) unsigned NOT NULL DEFAULT 0,
  had_triggers tinyint(3) unsigned NOT NULL DEFAULT 0,
  cancel_after_triggers tinyint(3) unsigned NOT NULL DEFAULT 0,
  crit tinyint(3) unsigned NOT NULL DEFAULT 0,
  last_spellattack_hit tinyint(3) unsigned NOT NULL DEFAULT 0,
  interrupted tinyint(3) unsigned NOT NULL DEFAULT 0,
  resisted tinyint(3) unsigned NOT NULL DEFAULT 0,
  custom_function text not null default 'notset'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE character_spell_effect_targets (
  caster_char_id int(10) unsigned NOT NULL DEFAULT 0,
  target_char_id int(10) unsigned NOT NULL DEFAULT 0,
  target_type tinyint(3) unsigned NOT NULL DEFAULT 0,
  db_effect_type tinyint(3) unsigned NOT NULL DEFAULT 0,
  spell_id int(10) unsigned NOT NULL DEFAULT 0,
  effect_slot int(10) unsigned NOT NULL DEFAULT 0,
  slot_pos int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
