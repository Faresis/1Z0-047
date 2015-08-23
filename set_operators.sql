create table contact_emails (
contact_email_id number primary key,
status varchar2(10),
email_address varchar2(40)
);
create sequence seq_contact_emails_id;

insert into contact_emails values(seq_contact_emails_id.nextval, 'Opt Out', 'bubblegum@tlivecar.com');
insert into contact_emails values(seq_contact_emails_id.nextval, 'Valid', 'nora@astann.com');
insert into contact_emails values(seq_contact_emails_id.nextval, 'Valid', 'watcher@foursigma.org');

create table online_subscribers (
online_subscriber_id number primary key,
email varchar2(40)
);
create sequence seq_online_subscribers_id;

insert into online_subscribers values(seq_online_subscribers_id.nextval, 'pendicott77@kasteelinc.com');
insert into online_subscribers values(seq_online_subscribers_id.nextval, 'watcher@foursigma.org');
insert into online_subscribers values(seq_online_subscribers_id.nextval, 'hardingpal@ckofca.com');

select * from contact_emails;
select * from online_subscribers;

/* includes id columns */
select contact_email_id, email_address
from contact_emails
where status = 'Valid'
union
select online_subscriber_id, email
from online_subscribers;

/* 
 * Same query without id columns.
 * This one will provide only distinct
 * values from both queries
 */
select email_address
from contact_emails
where status = 'Valid'
union
select email
from online_subscribers;

/*
 * union all will select all values
 * from both queries despite duplication
 */
select email_address
from contact_emails
where status = 'Valid'
union all
select email
from online_subscribers;

/*
 * intersect will select only rows
 * that are present in both queries
 */
select email_address
from contact_emails
where status = 'Valid'
intersect
select email
from online_subscribers;

/*
 * minus will select rows from the first query
 * that are not present in the second one
 */
select email_address
from contact_emails
where status = 'Valid'
minus
select email
from online_subscribers;

select email
from online_subscribers
union all
select email_address
from contact_emails
where status = 'Valid'
minus
select 'watcher@foursigma.org' from dual
union
select 'watcher@foursigma.org' from dual
intersect
(
  select 'nora@astann.com' from dual
  union all
  select 'pendicott77@kasteelinc.com' from dual
);

/* order rows */
-- by position
select contact_email_id, email_address
from contact_emails
where status = 'Valid'
union all
select online_subscriber_id, email
from online_subscribers
order by 2;

-- by name
select contact_email_id, email_address
from contact_emails
where status = 'Valid'
union all
select online_subscriber_id, email
from online_subscribers
order by contact_email_id;

-- by synonym
select contact_email_id id, email_address
from contact_emails
where status = 'Valid'
union all
select online_subscriber_id, email
from online_subscribers
order by id;

-- inner order by
-- will cause an exception
select contact_email_id id, email_address
from contact_emails
where status = 'Valid'
order by id
union all
select online_subscriber_id, email
from online_subscribers
order by id;