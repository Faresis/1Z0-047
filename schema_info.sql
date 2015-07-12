/* current user tables */
select * from user_tables;

/* column comments */
select * from user_col_comments;

/* list all user constraints */
select * from user_cons_columns where table_name='EMPLOYEES';

/* list constraint details  */
select * from user_constraints where constraint_name = 'SHIPS_PORTS_FK';
select * from user_constraints where constraint_name = 'SYS_C007044';
select * from user_constraints where constraint_name = 'SHIP_PK';

/* tables accesible to the current user */
SELECT * from SYS.ALL_TABLES;

/* currently logged user */
select sys_context('userenv', 'current_schema') curr_schema from dual;

/* all columns of specific type */
SELECT OWNER, TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM DBA_TAB_COLUMNS
WHERE DATA_TYPE LIKE '%NUMBER%'
and OWNER LIKE '%MYKOLA%'
ORDER BY OWNER, TABLE_NAME, COLUMN_NAME;