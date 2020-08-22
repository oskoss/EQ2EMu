alter table items change column flags2_256 no_salvage tinyint(3) not null default '0';
alter table items change column flags_16384 no_transmute tinyint(3) not null default '0';