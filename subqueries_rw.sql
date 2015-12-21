create table test (
test_id number primary key,
test_name varchar2(10)
);
insert into test values(1, 'first');
insert into test values(2, 'second');
insert into test values(3, 'third');
insert into test values(4, null);
insert into test values(5, 'fourth');
commit;
select * from test;
/* like requires single row subquery */
select * from test where test_name like (select test_name from test where test_id > 2);

/* like, equals and others requires a single column single row subquery */
select * from test where test_name like (select test_id, test_name from test where test_id = 2);
select * from test where test_name = (select test_id, test_name from test where test_id = 2);
select * from test where test_name like (select '%f%', '%s%' from dual);

select * from test where test_name like (select '%s%' from dual);
select * from test where test_name like (select '%f%' from dual);