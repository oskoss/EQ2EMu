alter table transporters add column flight_path_id int(10) unsigned not null default 0;
alter table transporters modify column transport_type ENUM('Zone','Location','Generic Transport','Flight') default 'Zone';
alter table transporters add column mount_id int(10) unsigned not null default 0;
alter table transporters add column mount_red_color smallint(5) unsigned not null default 255;
alter table transporters add column mount_green_color smallint(5) unsigned not null default 255;
alter table transporters add column mount_blue_color smallint(5) unsigned not null default 255;