create table test (
test_id number primary key,
test_name varchar2(10)
);

insert into test values(1, 'first');
insert into test values(2, null);
insert into test values(3, 'second');
insert into test values(4, 'third');

select * from test;
select * from test where test_name not in ('first');
select * from test where test_name not in ('ddd');
drop table test;