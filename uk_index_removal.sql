create table test_uk (
id number primary key,
code varchar2(5),
pos number not null,
constraint pos_uk unique(pos)
);

select * from user_constraints where table_name = 'TEST_UK';
select * from user_indexes where table_name = 'TEST_UK';

alter table test_uk drop constraint pos_uk;

select * from user_constraints where table_name = 'TEST_UK';
select * from user_indexes where table_name = 'TEST_UK';

alter table test_uk add constraint pos_uk unique(pos) deferrable initially deferred;

select * from user_constraints where table_name = 'TEST_UK';
select * from user_indexes where table_name = 'TEST_UK';

alter table test_uk drop constraint pos_uk;

select * from user_constraints where table_name = 'TEST_UK';
select * from user_indexes where table_name = 'TEST_UK';

alter table test_uk add constraint pos_uk unique(pos) deferrable;

select * from user_constraints where table_name = 'TEST_UK';
select * from user_indexes where table_name = 'TEST_UK';

drop table test_uk;