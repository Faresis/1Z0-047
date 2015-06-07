select sysdate from dual;
/* upper, lower  */
select upper('ROBERT'), upper('McLean'), upper('bryant') from dual;
select lower('ROBERT'), lower('McLean'), lower('bryant') from dual;
/* initcap */
select initcap('ROBERT'), initcap('McLean'), initcap('bryant') from dual;
SELECT INITCAP('napoleon'), INITCAP('RED O''BRIEN'), INITCAP('McDonald''s') FROM DUAL;
/* concat */
select concat('Hello, ', 'world!') from dual;
select 'Hello, ' || 'world!' || '- Hi there!' from dual;
/* lpad, rpad */
select rpad('Chapter One - I Am Born',40,'.') from dual;
select rpad('Chapter One - I Am Born',8,'.') from dual;
select lpad('Chapter One - I Am Born',40,'.') from dual;
select lpad('Chapter One - I Am Born',8,'.') from dual;
/* ltrim, rtrim */
select rtrim('Seven thousand--------', '-') from dual;
select ltrim('------Seven thousand', '-') from dual;
select ltrim('              Seven thousand') from dual;
select rtrim('Seven thousand              ') from dual;
