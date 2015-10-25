create table employee_chart(
employee_id number primary key,
title varchar2(20) not null,
reports_to number not null references employee_chart (employee_id)
);

alter table employee_chart
  modify reports_to null;

create sequence seq_employee_chart_id;

select * from employee_chart;
insert into employee_chart values(seq_employee_chart_id.nextval, 'CEO', null);
insert into employee_chart values(seq_employee_chart_id.nextval, 'VP', 1);
insert into employee_chart values(seq_employee_chart_id.nextval, 'SVP', 1);
insert into employee_chart values(seq_employee_chart_id.nextval, 'CFO', 1);
insert into employee_chart values(seq_employee_chart_id.nextval, 'Director 1', 2);
insert into employee_chart values(seq_employee_chart_id.nextval, 'Director 2', 2);
insert into employee_chart values(seq_employee_chart_id.nextval, 'Director 3', 3);
insert into employee_chart values(seq_employee_chart_id.nextval, 'Director 4', 3);
insert into employee_chart values(seq_employee_chart_id.nextval, 'Manager 1', 6);

/* 
   Hierarchical retrieval starting with employee id = 1 and going through all 
   employees that have reports_to equals to the current employee_id.
*/
select level, employee_id, title
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id;

/* Without prior. Will not trigger hierarchical retrieval. No error appears. */
select level, employee_id, title
from employee_chart
start with employee_id = 1
connect by reports_to = employee_id;

/* Formatting output example. */
select level, employee_id, lpad(' ', level*2) || title title
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id;

/* 
   Prior in select statement.
   Prior statement in select clause allows to refer columns from the parent row.
*/
select level, employee_id id, prior employee_id "parent id", reports_to, lpad(' ', level*2) || title title, prior title "parent title"
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id;

/* Moving from the bottom of hierarchy to the top. */
select level, employee_id, lpad(' ', level*2) || title title
from employee_chart
start with employee_id = 9
connect by prior reports_to = employee_id;

/*
   Prior statement in reverse direction.
   Prior statement in select clause allows to refer columns from the child row.
*/
select level, employee_id, lpad(' ', level*2) || title title, prior title "child title", prior employee_id "child id", reports_to
from employee_chart
start with employee_id = 9
connect by prior reports_to = employee_id;

/* Order by in hierarchical query */

/* Usage of the pure order by will ignore parent-child relationships. */
select level, employee_id, lpad(' ', level*2) || title title_formatted
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id
order by title;

/* Usage of the order by siblings will consider parent-child relationships. */
select level, employee_id, lpad(' ', level*2) || title title_formatted
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id
order siblings by title;

/*
   sys_connect_by_path allows to access specific column through all the
   hierarchy.
*/
select level, employee_id, title, sys_connect_by_path(title, '/') path
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id;

/*
   connect_by_root allows to access specific column of the root row.
*/
select level, employee_id, title, connect_by_root title as ancestor
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id;

/* exclude branches from the tree */
/*
  In case when some condition in CONNECT BY clause filters any row
  all sub rows of that rows are also filtered.
  So using this approach we can exclude whole branches.
*/
select level, employee_id, lpad(' ', level*2) || title title
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id
and employee_id <> 3;

select level, employee_id, lpad(' ', level*2) || title title
from employee_chart
start with employee_id = 1
connect by reports_to = prior employee_id
and title <> 'SVP';