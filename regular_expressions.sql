select regexp_substr('123 Maple Avenue', '[a-z]') adress from dual;
select regexp_substr('123 Maple Avenue', '[A-Za-z]') adress from dual;
select regexp_substr('123 Maple Avenue', '[a-z]', 1, 1, 'i') adress from dual;
select regexp_substr('123 Maple Avenue', '[A-Za-z]+') adress from dual;
select regexp_substr('123 Maple Avenue', '[[:alpha:]]+') adress from dual;
select regexp_substr('123 Maple Avenue', '[:alpha:]+') adress from dual;
select regexp_substr('123 Maple Avenue', '[[:alpha:]]+', 1, 2) adress from dual;
select regexp_substr('123 Maple Avenue', '[[:alnum:]]+') adress from dual;

create table order_addresses
(
order_adress_id number primary key,
adress varchar2(50) not null
);
create sequence seq_order_adress_id;
alter table order_addresses drop column zip_code;
insert into order_addresses values(seq_order_adress_id.nextval, 'Tulsa, OK 74103');
insert into order_addresses values(seq_order_adress_id.nextval, 'Bugscuffle, TN 37183');
insert into order_addresses values(seq_order_adress_id.nextval, 'Issaquah, WA 98027');
insert into order_addresses values(seq_order_adress_id.nextval, 'Santa Barbara, CA 93109');
insert into order_addresses values(seq_order_adress_id.nextval, 'Havre De Grace, MD 21078');
insert into order_addresses values(seq_order_adress_id.nextval, 'Ronks, PA 17572');
insert into order_addresses values(seq_order_adress_id.nextval, 'Weeki Wachee, FL 34607');
insert into order_addresses values(seq_order_adress_id.nextval, 'Kalamazoo, MI 49001');
insert into order_addresses values(seq_order_adress_id.nextval, 'Little Egg Harbor Township, NJ 08087');
insert into order_addresses values(seq_order_adress_id.nextval, 'Pumpkin Centre, OK 74451');
insert into order_addresses values(seq_order_adress_id.nextval, 'Woonsocket, RI 02895');

select adress, regexp_substr(adress, '[[:digit:]]+') zip_code from order_addresses;
select regexp_substr('123 Maple Avenue', 'Maple') from dual;
select regexp_substr('she sells sea shells down by the seashore', 's[eashor]+e') result from dual;
select regexp_substr('she sells sea shells down by the seashore', 's(eashor)+e') result from dual;
select regexp_substr('she sells sea shells down by the seashore', '[[:alpha:]]+(shore)') result from dual;
select regexp_substr('she sells sea shells down by the seashore', '[[:alpha:]]+shore') result from dual;
select adress, regexp_substr(adress, '(TN|MD|OK)') state from order_addresses;
select regexp_substr('Help desk: (212) 555-1212', '([[:digit:]]+)') area_code from dual;
select regexp_substr('Help desk: (212) 555-1212', '\([[:digit:]]+\)') area_code from dual;
select adress, regexp_substr(adress, '[TBH][[:alpha:]]+') name from order_addresses;
select regexp_substr('BMW-Oracle;Trimaran;February 2010', '[^;]+', 1, 2) from dual;
select adress, regexp_substr(adress, '[37]$') name from order_addresses;

select regexp_replace('Chapter 1 ................... I am Born', '[.]+', '-') TOC from dual;
select regexp_replace('And then he said *&% so I replied with $@($@', '[!@#$%^&*()]','-') prime_time from dual;
select regexp_replace('And then he said *&% so I replied with $@($@', '[!@#$%^&*()]+','-') prime_time from dual;
select regexp_replace('and    in   conclusion, 2/3rds  of our    revenue ', '( ){2,}', ' ') text_line from dual;
select adress, regexp_replace(adress, '(^[[:alpha:]]+)', 'CITY') THE_STRING from order_addresses;
select adress, regexp_replace(adress, '(^[[:alpha:] ]+)', 'CITY') THE_STRING from order_addresses;
select adress, regexp_replace(adress, '(^[[:alpha:] ]+), ([[:alpha:]]{2}) ([[:digit:]]{5})', '\3 \2 \1') THE_STRING from order_addresses;
select adress, regexp_replace(adress, '(^[[:alpha:] ]+), ([[:alpha:]]{2}) ([[:digit:]]{5})', '\3 \2 - "\1"') THE_STRING from order_addresses;