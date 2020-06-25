alter table transporters add column expansion_flag int(10) unsigned not null default 0;
alter table transporters add column min_client_version int(10) unsigned not null default 0;
alter table transporters add column max_client_version int(10) unsigned not null default 0;
