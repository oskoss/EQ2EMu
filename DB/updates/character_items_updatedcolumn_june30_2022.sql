alter table character_items add column last_saved timestamp default current_timestamp on update current_timestamp;
alter table character_items add column created timestamp default current_timestamp;
