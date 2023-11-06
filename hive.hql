use hive_database;
drop table update;
drop table history;
drop table new_records;

create table update as select new.* from old join new on old.id = new.id;


create table new_record as select new.* from old RIGHT JOIN new on old.id = new.id where old.id is null;


create table history as select old.* from old LEFT JOIN new on old.id = new.id where new.id is null;


insert overwrite table old select * from update UNION select * from new_record UNION select * from history;
select * from old;
