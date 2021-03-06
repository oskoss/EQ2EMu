alter table spells add column can_fizzle tinyint(1) not null default '1';

alter table items add column no_buy_back tinyint(1) unsigned not null default 0;

alter table character_items add column no_sale tinyint(1) unsigned not null default 0;

insert into commands set type=0,command='frombroker',subcommand='',handler=527;