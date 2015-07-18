/* single row subqueries */
select * from employees;
select * from ships;
alter table employees
  add ship_id number references ships(ship_id);
update employees set ship_id = 3;
update employees set ship_id = 1 where first_name = 'Al';
update employees set ship_id = 1 where employee_id in (1,6);

select ship_id from employees where last_name = 'Smith' and first_name = 'Al';
select employee_id, last_name, first_name from employees where ship_id = 1 and not (last_name = 'Smith' and first_name = 'Al');
select employee_id, last_name, first_name from employees where ship_id = (
  select ship_id from employees where last_name = 'Smith' and first_name = 'Al'
)
and not (last_name = 'Smith' and first_name = 'Al');

select employee_id, last_name, first_name from employees where ship_id = (
  select ship_id from employees where last_name = 'Smith'
)
and not (last_name = 'Smith' and first_name = 'Al');

/* multi row subqueries */
select ship_id,employee_id, last_name, first_name from employees where ship_id in (
  select ship_id from employees where last_name = 'Smith'
)
and not (last_name = 'Smith' and first_name = 'Al');

select * from ship_cabins;
select * from ship_cabins where sq_ft > any (select sq_ft from ship_cabins where room_style = 'Stateroom');

/* multi column subquery */
select * from employees;
select employee_id from employees where (first_name, last_name) in
      (select first_name, last_name from employees where last_name like 'W%');

/* scalar subqueries */
select * from vendors;
select vendor_name,
       (select first_name from employees where employee_id = 4) as client
from vendors
order by vendor_name;
desc employees;
select * from ships;
select * from employees;
insert into employees(employee_id, ship_id) values (seq_employee_id.nextval, (select ship_id from ships where ship_name='Codd Champion'));

/* correlated subqueries */
select main.ship_cabin_id, main.room_style, main.room_number, main.sq_ft
from ship_cabins main
where main.sq_ft > (select avg(sq_ft)
                    from ship_cabins
                    where room_style = main.room_style)
order by main.room_number;

select room_style, avg(sq_ft)
from ship_cabins
group by room_style;

/* exists */
select port_id, port_name
from ports
where exists (select * from ships where port_id = home_port_id);

/* with */
with
  port_bookings as (
    select port_id, port_name, count(ship_id) ct
    from ports, ships
    where port_id = home_port_id
    group by port_id, port_name
  ),
  densest_port as (
    select max(ct) max_ct from port_bookings
  )
select port_name
from port_bookings
where ct = (select max_ct from densest_port);

with
  port_bookings as (
    select port_id, port_name, count(ship_id) ct
    from ports, ships
    where port_id = home_port_id
    group by port_id, port_name
  ),
  densest_port as (
    select max(ct) max_ct from port_bookings
  )
select port_name
from port_bookings
join densest_port on max_ct = ct;