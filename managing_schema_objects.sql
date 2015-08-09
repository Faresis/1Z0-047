/* add column */
select * from cruise_orders;
create table cruise_orders (
cruise_order_id number,
sales_rep_id number
);
alter table cruise_orders add (order_date varchar2(20));
alter table cruise_orders add order_date1 varchar2(20);
alter table cruise_orders
  add (weather_code number(2) default 0);
alter table cruise_orders drop column weather_code;
/* add two columns in the same statement */
alter table cruise_orders
  add (weather_code number(2) default 0,
       travel_agency varchar2(27) not null);

select * from cruise_orders;
insert into cruise_orders values (1, 1, sysdate, sysdate, 0, 'tez tour');
commit;

/* creating not null column when rows in table are present */
alter table cruise_orders
  add first_time_customer varchar2(5)
    not null;
    -- will fail if rows are present
    
/* creating not null column with default value when rows are present */
alter table cruise_orders
  add first_time_customer varchar2(5)
    default 'Yes'
      not null;
      -- will succeed in any case
      
/* modify columns */
select * from cruise_orders;
desc cruise_orders;
/* columns should be empty to succeed */
alter table cruise_orders modify order_date date;
/* adding not null constraint for the column */
alter table cruise_orders modify order_date not null;
/* removing no null constraint for the column */
alter table cruise_orders modify order_date null;
/* extending column data width */
alter table cruise_orders modify order_date varchar2(35);
alter table cruise_orders modify order_date constraint nn_order_date not null;

/* renaming columns */
alter table cruise_orders rename column order_date to date_of_the_order;
desc cruise_orders;

/* drop columns and set columns unused */
alter table cruise_orders drop column order_date1;
desc cruise_orders;
alter table cruise_orders add order_date1 date default sysdate not null;
alter table cruise_orders add order_date2 date default sysdate not null;
alter table cruise_orders drop (order_date1, order_date2);

/* dropping constrained column */
alter table cruise_orders add ord_num varchar2(10);
alter table cruise_orders
  add constraint unique_ord_num unique(ord_num);
create table cruise_orders_notes (
note_id number primary key,
ord_num varchar2(10) constraint fk_ord_num references cruise_orders(ord_num)
);

alter table cruise_orders drop (ord_num);
  -- will fail due to fk present
alter table cruise_orders drop (ord_num) cascade constraints;
  -- will force all child fk constraints to be deleted
  
/* set column as unused */
alter table cruise_orders add ord_num varchar2(10) constraint un_ord_num unique;
alter table cruise_orders_notes add constraint fk_ord_num foreign key (ord_num) references cruise_orders(ord_num);
alter table cruise_orders set unused column ord_num;
  -- will fail due to fk present
alter table cruise_orders set unused column ord_num cascade constraints;
  -- will force all child fk constraints to be deleted
  
alter table cruise_orders add (usless_column1 varchar2(10), usless_column2 varchar2(10));
alter table cruise_orders set unused (usless_column1, usless_column2);
desc cruise_orders;

/* all tables with unused columns */
select * from user_unused_col_tabs;
alter table cruise_orders drop unused columns;

/* creating constraints */
drop table cruise_orders;
create table cruise_orders(
  cruise_order_id number,
  sales_agent_id number,
  order_date date,
  confirmation_date date
);

/* inline primary key specification */
alter table cruise_orders modify cruise_order_id primary key;
desc cruise_orders;
alter table cruise_orders drop primary key;

/* inline primary key with constriant name specification */
alter table cruise_orders modify cruise_order_id constraint pk_order_id primary key;
desc cruise_orders;
alter table cruise_orders drop primary key;

/* out of line primary key definition with constraint name specification */
alter table cruise_orders
  add constraint pk_order_id primary key (cruise_order_id);
desc cruise_orders;
/* dropping primary key by type */
alter table cruise_orders drop primary key;
/* dropping primary key by name */
alter table cruise_orders drop constraint pk_order_id;

/* out of line primary key definition */
alter table cruise_orders
  add primary key (cruise_order_id);
desc cruise_orders;
alter table cruise_orders drop primary key;

/* defining not null constraints */
alter table cruise_orders modify sales_agent_id not null;
alter table cruise_orders modify sales_agent_id null;
alter table cruise_orders modify sales_agent_id constraint nn_agent_id not null;
alter table cruise_orders modify sales_agent_id null;
-- all of the above will succeed because of inline syntax

alter table cruise_orders add constraint nn_agent_id not null (sales_agent_id);
-- this will fail because of out of line syntax which is not applicable for not null

/* dropping unique constraint by type */
select * from cruise_orders;
alter table cruise_orders add unique(cruise_order_id, sales_agent_id);
alter table cruise_orders drop unique(cruise_order_id, sales_agent_id);

/* dropping unique constraint by name */
alter table cruise_orders add constraint uq_cruise_order unique(cruise_order_id, sales_agent_id);
alter table cruise_orders drop constraint uq_cruise_order;

/* disabling constraints */
select * from ports;
select * from ships;
select * from user_constraints where table_name = 'SHIPS';
delete from ports where port_id = 1;
alter table ships disable constraint ships_ports_fk;
alter table ships enable constraint ships_ports_fk;
alter table ships modify constraint ships_ports_fk disable;
alter table ships modify constraint ships_ports_fk enable;

alter table ports disable primary key;
-- this one will faild due to child constraint present
alter table ports disable primary key cascade;
-- this one will disable all childs together with requested constraint
alter table ports modify primary key enable;
select * from user_constraints where table_name = 'SHIPS';
-- child constraints should be enabled separately
alter table ships modify constraint ships_ports_fk enable;

/* validate and novalidate constraints */
alter table ports disable primary key cascade;
delete ports where port_id = 1;
commit;
alter table ports modify primary key enable;
alter table ships enable constraint ships_ports_fk;
-- same as
alter table ships enable validate constraint ships_ports_fk;
-- will fail for the same reason 'parent keys not found'
alter table ships enable novalidate constraint ships_ports_fk;
-- succeeds but remain orphans in the child table
select * from ships where not exists (select 1 from ports where port_id = home_port_id);
-- displays orphans
insert into ships values (seq_ship_id.nextval, 'Fail', 1, null, null);
-- constraint will not allow new orphans to be added
insert into ports values(1, 'DP', 'UA', 35);
alter table ships enable validate constraint ships_ports_fk;
-- now it works ok having all parent rows present
select * from user_indexes where table_name='PORTS';
alter table ports disable validate primary key cascade;
-- this one will disable all childs and will drop related pk index
alter table ports enable primary key;
-- while primary key is enabled appropriate index will be restored
alter table ships enable constraint ships_ports_fk;

/* drop table and cascade constraints */
drop table ports;
-- this one will fail due to existing child constraints
drop table ports cascade constraints;
-- this one will first disable all dependent constraint and then delete the table
select * from ports;
flashback table ports to before drop;
alter table ships
  add constraint ships_ports_fk
    foreign key(home_port_id) references ports(port_id);

/* delete and on delete */
alter table ships drop constraint ships_ports_fk;
alter table ships
  add constraint ships_ports_fk
    foreign key(home_port_id) references ports(port_id) on delete cascade;
select * from ports;
select * from ships;
delete ports where port_id = 3;
-- will delete all child rows in ships table implicitly

alter table ships drop constraint ships_ports_fk;
alter table ships
  add constraint ships_ports_fk
    foreign key(home_port_id) references ports(port_id) on delete set null;
select * from ports;
select * from ships;
delete ports where port_id = 1;
-- will set to null dependent column in ships table implicitly

/* deferred */
alter table ships drop constraint ships_ports_fk;
alter table ships
  add constraint ships_ports_fk
    foreign key(home_port_id) references ports(port_id) deferrable;
    
set constraint ships_ports_fk deferred;
-- this allows us to temporarily forget about the constraint till commit
delete ports where port_id = 1;
select * from ships join ports on port_id = home_port_id;
-- we have no port_id = 1 records here
select * from ships;
-- while orphans are present here. let's try to commit.
commit;
-- commit fails due to constraint violaiton

/* renaming constraints */
alter table ships
  rename constraint ships_ports_fk to ship_to_port_fk;
select * from user_constraints where table_name = 'SHIPS';

/* using index */
create table invoices (
invoice_id number primary key using index ( create index ix_invoice_id on invoices(invoice_id) ),
charge number not null
);
create index ix_func_based_invoice on invoices(round(charge));
select * from invoices where round(charge) > 0;
--  create and use function based index