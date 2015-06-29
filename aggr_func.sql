/* count */
select count(ship_name), count(capacity), count(additional_info) from ships;
select count(*) from empty_tbl;
select count(empty_col) from empty_tbl;
select count(last_name), count(distinct last_name), count(all last_name) from employees;
select * from employees order by last_name;
select last_name, count(last_name) over () from employees;

/* sum */
select * from ships;
select sum(capacity), sum(length(ship_name)) from ships;

/* min, max */
select min(last_name), max(last_name) from employees;

/* avg */
select * from ships;
select avg(capacity), round(avg(capacity)) from ships;

/* median */
create table test_median(a number(3));
insert into test_median values(1);
insert into test_median values(5);
insert into test_median values(3);

select * from test_median order by a;
select median(a), avg(a) from test_median;

/* rank */
select rank(9) within group (order by a) from test_median;

/* first, last */
select * from user_tables;
select * from projects;
select max(project_cost) keep (dense_rank first order by days),
       min(project_cost) keep (dense_rank first order by days),
       avg(project_cost) keep (dense_rank first order by days) from projects;
       
select max(project_cost),
       min(project_cost),
       avg(project_cost) from projects
       where
       days = min(days); -- group function is not allowed here
       
select max(project_cost) keep (dense_rank last order by days),
       min(project_cost) keep (dense_rank last order by days),
       avg(project_cost) keep (dense_rank last order by days) from projects;