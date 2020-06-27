alter table log_messages add column name text default null;
alter table log_messages add column version text default null;
alter table log_messages modify column log_type text not null default '';