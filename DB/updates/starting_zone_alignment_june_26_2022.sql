alter table starting_zones add column start_alignment tinyint(3) signed not null default 0;
update starting_zones set start_alignment = 1 where choice = 1 or choice = 4 or choice = 32;
alter table characters add column alignment tinyint(3) signed not null default 0;