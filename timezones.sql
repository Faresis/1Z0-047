/* database timezone and session timezone */
select DBTIMEZONE, SESSIONTIMEZONE from dual;

/* current system timestamp with timezone */
select systimestamp from dual;

/* list  available timezones */
SELECT TZABBREV, TZNAME FROM V$TIMEZONE_NAMES ORDER BY TZABBREV, TZNAME;

/* current date/timestamp in the session timezone */
select sysdate, current_date, current_timestamp from dual;
select to_char(current_date,'DD-MON-YY HH24:MI:SS'), to_char(sysdate,'DD-MON-YY HH24:MI:SS') from dual;

/* timestamp in the session timezone. First return timestamp with timezone second just a timestamp */
select current_timestamp, localtimestamp from dual;

/* new_time */
SELECT TO_CHAR(
NEW_TIME(
TO_DATE('1983-JAN-03 14:30:56','RRRR-MON-DD HH24:MI:SS'),
'AST',
'HST')
,'DD-MON-RR HH:MI:SS') NEW_DATE
FROM
DUAL;