insert into commands set type=1,command='reload',subcommand='voiceovers',required_status=100,handler=532;
CREATE TABLE `voiceovers` (
  `type_id` tinyint(3) unsigned NOT NULL default 0,
  `id` int(10) unsigned NOT NULL default 0,
  `indexed` smallint(5) unsigned NOT NULL default 0,
  `mp3_string` text not null default '',
  `text_string` text not null default '',
  `emote_string` text not null default '',
  `key1` int(10) unsigned NOT NULL default 0,
  `key2` int(10) unsigned NOT NULL default 0,
  `garbled` tinyint(3) unsigned NOT NULL default 0,
  `garble_link_id` tinyint(3) unsigned NOT NULL default 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;