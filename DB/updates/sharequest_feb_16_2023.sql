update commands set handler=533 where command='share_quest';
alter table quests add column shareable_flag int(10) unsigned not null default 0;
alter table quests add column deleteable tinyint(3) unsigned not null default 1;
