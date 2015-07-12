select * from ports;
select * from ships;
create sequence seq_port_id;

alter table ships
  modify home_port_id number NULL;
insert into ports values(seq_port_id.nextval, 'KIY', 'UA', 100);
insert into ports values(seq_port_id.nextval, 'OD', 'UA', 41);

insert into ships values(seq_ship_id.nextval, 'UA Crystal', 1, null, null);
insert into ships values(seq_ship_id.nextval, 'UA Elegance', 3, null, null);
insert into ships values(seq_ship_id.nextval, 'UA Champ', null, null, null);
insert into ships values(seq_ship_id.nextval, 'UA Victorious', 3, null, null);
insert into ships values(seq_ship_id.nextval, 'UA Grandeur', 2, null, null);
insert into ships values(seq_ship_id.nextval, 'UA Prince', 2, null, null);
commit;

/* inner join */
select ship_id, ship_name, port_name
from ships 
inner join ports on home_port_id = port_id
order by ship_id;

select ship_id, ship_name, port_name
from ships 
join ports on home_port_id = port_id
order by ship_id;

/* left outer join */
select ship_id, ship_name, port_name
from ships
left outer join ports on home_port_id = port_id
order by ship_id;

select ship_id, ship_name, port_name
from ships
left join ports on home_port_id = port_id
order by ship_id;

/* right outer join */
select ship_id, ship_name, port_name
from ships
right outer join ports on home_port_id = port_id
order by ship_id;

select ship_id, ship_name, port_name
from ships
right join ports on home_port_id = port_id
order by ship_id;

/* full outer join */
select ship_id, ship_name, port_name
from ships
full outer join ports on home_port_id = port_id
order by ship_id;

select ship_id, ship_name, port_name
from ships
full join ports on home_port_id = port_id
order by ship_id; 

/* multiplication */
select ship_id, ship_name, port_name
from ships, ports
order by ship_id;

/* natural joins */
select * from employees;
select * from adresses;
alter table employees
  add adress_id number references adresses(adress_id);
update employees set adress_id = employee_id;

select adress_id, employees.employee_id, employees.last_name, adresses.street_adress
from employees natural join adresses;

select employees.adress_id, employees.employee_id, employees.last_name, adresses.street_adress
from employees natural join adresses;

/* using keyword */
update employees set adress_id = '' where adress_id in (4,5);

select adress_id, employee_id, last_name, street_adress
from employees left join adresses
using (adress_id);

select adress_id, employee_id, last_name, street_adress
from employees right join adresses
using (adress_id);

select adress_id, employee_id, last_name, street_adress
from employees full join adresses
using (adress_id);

select employees.adress_id, employee_id, last_name, street_adress
from employees left join adresses
using (adress_id);

/* non equijoins */
create table grading(
grading_id number constraint graiding_id_pk primary key,
grade varchar2(1),
score_min number,
score_max number
);
create sequence seq_grading_id;
insert into grading values(seq_grading_id.nextval, 'A', 90, 100);
insert into grading values(seq_grading_id.nextval, 'B', 80, 89);
insert into grading values(seq_grading_id.nextval, 'C', 70, 79);
insert into grading values(seq_grading_id.nextval, 'D', 60, 69);
insert into grading values(seq_grading_id.nextval, 'E', 50, 59);
commit;
select * from scores;
select score_recid, test_score, grade
from scores join grading
    on test_score between score_min and score_max;
    
/* self join */
create table positions(
position_id number constraint position_id_pk primary key,
position varchar2(20),
reports_to number constraint reports_to_fk references positions(position_id)
);
create sequence seq_position_id;
insert into positions values(seq_position_id.nextval, 'Capitan', '');
insert into positions values(seq_position_id.nextval, 'Director', 1);
insert into positions values(seq_position_id.nextval, 'Manager', 2);
insert into positions values(seq_position_id.nextval, 'Crew Chief', 2);
update positions set reports_to = 2 where position = 'Crew Chief';
insert into positions values(seq_position_id.nextval, 'Crew', 4);
commit;
select * from positions;

select main.position_id, main.position, boss.position boss
from positions main left join positions boss on main.reports_to = boss.position_id
order by 1;