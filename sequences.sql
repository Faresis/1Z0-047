create sequence seq_cyc_neg maxvalue -1 cycle;  --minvalue is required to be less than maxvalue
create sequence seq_cyc_nomax cycle;  -- ascending sequences must specify  maxvalue
create sequence seq_cyc_nomin_desc increment by -1 cycle; -- descending sequences must specify minvalue

/* will cycle from -1 to -10 */
create sequence seq_cyc_from_1_desc minvalue -10 increment by -1 cycle nocache;
select seq_cyc_from_1_desc.nextval from dual;

create sequence seq_cyc_from_1_asc maxvalue 10 cycle nocache;
select seq_cyc_from_1_asc.nextval from dual;

create sequence seq_nocyc_from_1_asc maxvalue 10;
/*
 * After maxvalue is reached exception will be thrown as far as maxvalue is
 * violated. For nocycle sequences. Which is a default option.
 */
select seq_nocyc_from_1_asc.nextval from dual;

/* maxvalue is less than minvalue */
create sequence seq_cyc_desc_less_max minvalue -10 maxvalue -15 increment by -1 cycle nocache;
create sequence seq_cyc_asc_less_max minvalue 1 maxvalue -5 cycle nocache;

create sequence seq_cyc_from_5_asc start with 5 maxvalue 10 cycle nocache;
select seq_cyc_from_5_asc.nextval from dual;

drop sequence seq_not_in_range_1;
/* start with not in range */
create sequence seq_not_in_range_1 maxvalue 10 cycle nocache start with -3;
create sequence seq_not_in_range_2 maxvalue 10 cycle nocache start with 11;
/* 
 * Oracle allows creation of sequences with start value greater than maxvalue by 1.
 * But actually count will start with minvalue.
 */
create sequence seq_not_in_range_3 maxvalue 10 cycle nocache start with 11;
select seq_not_in_range_3.nextval from dual;
