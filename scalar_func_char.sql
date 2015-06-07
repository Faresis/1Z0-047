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

/* trim */
select trim(trailing '-' from '--------Seven thousand------------') from dual;
select trim(leading '-' from '--------Seven thousand------------') from dual;
select trim('-' from '--------Seven thousand------------') from dual;
select trim('                Seven thousand                  ') from dual;
select trim(trailing from '                Seven thousand                  ') from dual;
select trim(leading from '                Seven thousand                  ') from dual;

/* length */
SELECT LENGTH('Supercalifragilisticexpialidocious') FROM DUAL;

/* instr */
SELECT INSTR('Mississippi','is',1,2) FROM DUAL;
SELECT INSTR('Mississippi','is') FROM DUAL;
SELECT INSTR('Mississippi','i',-1) FROM DUAL;
SELECT INSTR('Mississippi','i',-1, 2) FROM DUAL;

/* substr */
SELECT SUBSTR('Name: MARK KENNEDY', 7) FROM DUAL;
SELECT SUBSTR('Name: MARK KENNEDY', 7, 4) FROM DUAL;
SELECT SUBSTR('Name: MARK KENNEDY', -7) FROM DUAL;
SELECT SUBSTR('Name: MARK KENNEDY', -7, 3) FROM DUAL;
SELECT SUBSTR('Name: MARK KENNEDY', -17, 25) FROM DUAL;

/* soundex */
SELECT SOUNDEX('Worthington'), SOUNDEX('Worthen') FROM DUAL;
SELECT SOUNDEX('Yellow'), SOUNDEX('Hello') FROM DUAL;