/* data dictionary tables description */
select * from dictionary;

desc dictionary;

select table_name, comments
from dictionary
where upper(comments) like '%INDEX%'
order by table_name;

/* user tables */
select * from user_tables;

/* user table columns */
select * from user_tab_columns;

/* all tables */
select * from all_tables;

/* user constraints */
select * from user_constraints;
select constraint_name, constraint_type, r_constraint_name, status, search_condition
from user_constraints
where table_name = 'CRUISES';

/* user constraint columns */
select * from user_cons_columns;

/* user synonyms */
select * from user_synonyms;

/* user catalog */
select * from user_catalog;
select * from cat;
select distinct(table_type) from user_catalog;

select table_type, count(*)
from user_catalog
group by table_type;

/* user column privileges */
select * from user_col_privs;

/* user dependencies */
select * from user_dependencies;

/* user errors */
select * from user_errors;

/* user indexes */
select * from user_indexes;

/* user indexes columns */
select * from user_ind_columns;

/* user objects */
select * from user_objects;
select * from obj;
select * from obj where status = 'INVALID' order by object_name;

/* user sequences */
select * from user_sequences;

/* all objects */
select * from all_objects where object_name = 'DB_FILES';

/* user synonyms */
select * from user_synonyms;

/* all synonyms */
select * from all_synonyms;

/* grants on objects owned by user */
select * from user_tab_privs;

/* user views */
select * from user_views;
select text from user_views where view_name = 'VW_EMPLOYEES';

/* comments */

/* all objects comments */
select * from all_tab_comments;
select distinct table_type from all_tab_comments;

/* all column comments */
select * from all_col_comments;
select * from all_col_comments where owner='MYKOLA';

/* user synonyms details */
select '*TABLE: ' || table_name, comments
from all_tab_comments
where owner = 'SYS'
and table_name = 'USER_SYNONYMS'
union
select 'COL: ' || column_name, comments
from all_col_comments
where owner = 'SYS'
and table_name = 'USER_SYNONYMS';

/* creating comments */
comment on table vw_employees is 'employees view';
comment on table employees is 'employees table';
comment on column employees.employee_id is 'employee internal id';

select '*TABLE: ' || table_name, comments
from all_tab_comments
where owner = 'MYKOLA'
and table_name = 'EMPLOYEES'
union
select 'COL: ' || column_name, comments
from all_col_comments
where owner = 'MYKOLA'
and table_name = 'EMPLOYEES';

select '*TABLE: ' || table_name, comments
from all_tab_comments
where owner = 'MYKOLA'
and table_name = 'VW_EMPLOYEES'
union
select 'COL: ' || column_name, comments
from all_col_comments
where owner = 'MYKOLA'
and table_name = 'VW_EMPLOYEES';

/* views for privileges */
select * from user_sys_privs;
select * from user_tab_privs;
select * from user_role_privs;
select * from role_sys_privs;
select * from role_tab_privs;
select * from session_privs;