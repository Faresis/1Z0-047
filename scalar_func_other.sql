/* NVL */
SELECT NVL(NULL,0) FIRST_ANSWER,
14+NULL-4 SECOND_ANSWER,
14+NVL(NULL,0)-4 THIRD_ANSWER,
NVL(null, null)
FROM
DUAL;

/* decode */
SELECT ST, DECODE(ST,
                     'CA', 'California',
                     'IL','Illinois',
                     'NY','New York',
                     NULL, 'No state',
                     'TX', 33,
                     'Other') AS DECODED_STATE
FROM
ADRESSES
ORDER BY DECODED_STATE;

SELECT ST, DECODE(ST, NULL,'This is NULL',
                      ST) AS DECODED_STATE,
       NVL(ST, 'This is NULL')
FROM
ADRESSES
ORDER BY DECODED_STATE;

/* case when */
SELECT CASE 'option1'
       WHEN 'option1' THEN 'found it'
       WHEN 'option2' THEN 'did not find it'
       END AS "Answer"
FROM DUAL;

select case null
       when null then 'THIS IS NULL'
       else 'NOT null'
       end as "Answer case",
       decode(null, null, 'THIS IS NULL', 'NOT null') as "Answer decode"
from dual;

select st,
       case nvl(st, 'NULL')
       when 'NULL' then 'No state'
       when 'IL' then 'Illinois'
       when 'CA' then 'California'
       when 'NY' then 'New York'
       else 'Other'
       end as state
from adresses
order by state;

select st,
       case
       when st is null then 'No state'
       when st = 'IL' then 'Illinois'
       when st = 'CA' then 'California'
       when st = 'NY' then 'New York'
       else 'Other'
       end as STATE
from adresses
order by state;

select ship_name, capacity,
       case capacity
       when 2052 then 'MEDIUM'
       when 2974 then 'LARGE'
       end as "SIZE"
from ships;

create table scores(
score_recid number constraint score_recid_pk primary key,
test_score number not null,
updated_test_score number not null
);
insert into scores values (1, 95, 95);
insert into scores values (2, 55, 75);
insert into scores values (3, 83, 83);

select * from scores;
select * from scores order by score_recid;
select * from scores where rownum < 2 order by score_recid;
select * from ( select * from scores order by score_recid ) where rownum < 2;
select * from scores where rownum < 2 order by score_recid desc;

/* nullif */
select test_score,
       updated_test_score,
       nullif(updated_test_score, test_score) diff
from scores
where nullif(updated_test_score, test_score) is not null;