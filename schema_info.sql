/* current user tables */
select * from user_tables;

/* list all user constraints */
select * from user_cons_columns where table_name='SHIPS';

/* list constraint details  */
select * from user_constraints where constraint_name = 'SHIPS_PORTS_FK';
select * from user_constraints where constraint_name = 'SHIP_PK';

/* tables accesible to the current user */
SELECT * from SYS.ALL_TABLES;

/* currently logged user */
select sys_context('userenv', 'current_schema') curr_schema from dual;