update commands set handler=286 where command='title' and subcommand='list';
update commands set handler=287 where command='title' and subcommand='setprefix';
update commands set handler=288 where command='title' and subcommand='setsuffix';
update commands set handler=289 where command='title' and subcommand='fix';

alter table character_details modify column prefix_title int(10) not null default -1;
alter table character_details modify column suffix_title int(10) not null default -1;
