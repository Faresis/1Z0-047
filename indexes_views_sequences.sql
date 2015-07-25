/* create view */
select * from employees;
select employee_id, last_name, first_name, middle_initial from employees;
create or replace view vw_employees as
      select last_name, first_name, middle_initial from employees;
desc vw_employees;
select * from vw_employees;
select first_name || ' ' || last_name "employee"
from vw_employees;
create or replace view vw_employees (lname, fname, mname, full_name) as
      select last_name, first_name, middle_initial, first_name || ' ' || last_name from employees;
create or replace view vw_employees as
      select last_name, first_name, middle_initial, first_name || ' ' || last_name full_name from employees;
      
alter table employees
  rename column f_name to first_name;
  
alter view vw_employees compile;

/* update view */
select * from vw_employees;
update vw_employees set fname = 'Joee' where fname='Joe';
delete vw_employees where lname is null;


/* inline views */
select * from
  (select * from dual);
select * from cruise_orders;
select * from ships;
select rownum, ship_id, ship_name, capacity
from (select ship_id, ship_name, capacity from ships order by capacity)
where rownum <= 3;

/* sequences */
select seq_ship_id.nextval from dual;
select seq_ship_id.currval from dual;

/* indexes */
select table_name, index_name
from user_indexes
where table_name = 'SHIPS';
select * from ships;