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