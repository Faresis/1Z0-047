create table adresses (
adress_id number constraint adress_id_pk primary key,
street_adress varchar2(35),
city varchar2(20) not null,
st varchar2(2),
country varchar2(15) not null);

create sequence seq_adress_id;

insert into adresses values (seq_adress_id.nextval, '350 Oracle Parkway', 'Redwood City', 'CA', 'USA');
insert into adresses values (seq_adress_id.nextval, '1600 Amphitheatre Parkway', 'Mountain View', 'CA', 'USA');
insert into adresses values (seq_adress_id.nextval, '1 Dell Way', 'Round Rock', 'TX', 'USA');
insert into adresses values (seq_adress_id.nextval, '29 E Ohio St', 'Chicago', 'IL', 'USA');
insert into adresses values (seq_adress_id.nextval, '5788 Roswell Rd NE', 'Atlanta', 'GA', 'USA');
insert into adresses values (seq_adress_id.nextval, '10103 100 St Nw', 'Edmonton', 'AB', 'Canada');
insert into adresses values (seq_adress_id.nextval, '1221 Avenue of the Americas', 'New York', 'NY', 'USA');
insert into adresses values (seq_adress_id.nextval, '239 Baker Street', 'London', '', 'UK');
insert into adresses values (seq_adress_id.nextval, '1 rue des Carrieres', 'Quebec City', 'QC', 'Canada');
insert into adresses values (seq_adress_id.nextval, '2041 S Harbor Blvd', 'Anaheim', 'CA', 'USA');
insert into adresses values (seq_adress_id.nextval, '600 N Michigan Ave', 'Chicago', 'IL', 'USA');
insert into adresses values (seq_adress_id.nextval, '1515 Sheridan Rd', 'Wilmette', 'IL', 'USA');


select * from ADRESSES order by st;
select * from ADRESSES order by st, city;
select * from adresses order by st asc;
select * from adresses order by st desc;
select * from adresses order by st asc, city desc;
select * from adresses order by st, city desc;


create table projects(
project_id number constraint project_id_pk primary key,
ship_id number not null,
project_name varchar2(20),
project_cost number not null,
days number not null,
constraint ship_id_fk foreign key (ship_id) references ships (ship_id)
);
create sequence seq_project_id;
alter table projects modify project_name  varchar2(35);
select * from projects;

select *  from projects;
insert into projects values (seq_project_id.nextval, 3, 'Hull Cleaning', 340000, 20);
insert into projects values (seq_project_id.nextval, 3, 'Deck Resurfacing', 964000, 10);
insert into projects values (seq_project_id.nextval, 4, 'Lifeboat Inspection', 12000, 3);
insert into projects values (seq_project_id.nextval, 1, 'Clean Pools', 370000, 5);
insert into projects values (seq_project_id.nextval, 1, 'Replace Lobby Carpeting', 137000, 5);
insert into projects values (seq_project_id.nextval, 1, 'Major Engine Service', 837000, 15);

commit;

select * order by project_cost/days;
select projects.*, project_cost/days from projects order by project_cost/days;
select projects.*, project_cost/days as per_day_cost from projects order by per_day_cost;
select projects.*, project_cost/days "Cost Per Day" from projects order by "Cost Per Day";
select projects.*, project_cost/days "Cost Per Day" from projects order by 4;
select projects.*, project_cost/days "Cost Per Day" from projects order by ship_id, 5, "Cost Per Day";
select projects.*, project_cost/days "Cost Per Day" from projects order by ship_id, 5, "Cost Per Day" desc;
