create table ship_cabins (
  ship_cabin_id number primary key,
  ship_id number not null references ships (ship_id),
  room_number varchar2(5),
  room_style varchar2(10),
  room_type varchar2(20),
  window varchar2(10),
  guests number,
  sq_ft number,
  balcony_sq_ft number
);

create sequence seq_ship_cabin_id;
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 102, 'Suite', 'Standard', 'Ocean', 4, 533);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 103, 'Stateroom', 'Standard', 'Ocean', 2, 160);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 104, 'Suite', 'Standard', 'None', 4, 533);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 105, 'Stateroom', 'Standard', 'Ocean', 3, 205);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 106, 'Suite', 'Standard', 'None', 6, 586);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 107, 'Suite', 'Royal', 'Ocean', 5, 1524);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 108, 'Stateroom', 'Large', 'None', 2, 211);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 109, 'Stateroom', 'Standard', 'None', 2, 180);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 110, 'Stateroom', 'Large', 'None', 2, 225);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 702, 'Suite', 'Presidental', 'None', 5, 1142);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 703, 'Suite', 'Royal', 'Ocean', 5, 1745);
insert into ship_cabins(ship_cabin_id, ship_id, room_number, room_style, room_type, window, guests, sq_ft)
  values(seq_ship_cabin_id.nextval, 1, 704, 'Suite', 'Skyloft', 'Ocean', 8, 722);
  
commit;

select * from ship_cabins;
select ship_cabin_id, room_number, room_style, room_type, window, guests, sq_ft from ship_cabins where ship_id = 1;
select round(avg(sq_ft),2) from ship_cabins where ship_id = 1;
select round(avg(sq_ft),2) from ship_cabins where ship_id = 1 and room_style = 'Stateroom';
select round(avg(sq_ft),2) from ship_cabins where ship_id = 1 and room_style = 'Suite';
select room_style, round(avg(sq_ft),2) from ship_cabins where ship_id = 1 group by room_style;
select room_style, round(avg(sq_ft),2) "Average SQ FR", min(guests) "Minimum # of guests", count(ship_cabin_id) "Total # of cabins"
       from ship_cabins where ship_id = 1
       group by room_style
       order by room_style;
select room_style,
       room_type,
       to_char(round(avg(sq_ft),1), '999,999.99') "Average SQ FT",
       max(guests) "Maximum # of guests",
       count(ship_cabin_id) "Total # of cabins"
from ship_cabins
where ship_id = 1
group by room_style, room_type
order by 2 desc;
select distinct room_style, room_type from ship_cabins;
select room_style, room_type from ship_cabins group by room_style, room_type;
select room_style, room_type from ship_cabins;
select room_style, count(guests) from ship_cabins;
SELECT ROOM_STYLE, ROOM_TYPE, MAX(SQ_FT) FROM SHIP_CABINS WHERE SHIP_ID = 1 GROUP BY ROOM_STYLE, ROOM_TYPE;
SELECT ROOM_STYLE, ROOM_TYPE, avg(MAX(SQ_FT)) FROM SHIP_CABINS WHERE SHIP_ID = 1 GROUP BY ROOM_STYLE, ROOM_TYPE;
SELECT avg(MAX(SQ_FT)) FROM SHIP_CABINS WHERE SHIP_ID = 1 GROUP BY ROOM_STYLE, ROOM_TYPE;
SELECT avg(SQ_FT) FROM SHIP_CABINS WHERE SHIP_ID = 1;
SELECT COUNT(AVG(MAX(SQ_FT))) FROM SHIP_CABINS WHERE SHIP_ID = 1 GROUP BY ROOM_STYLE, ROOM_TYPE;
SELECT round(AVG(MAX(SQ_FT))) FROM SHIP_CABINS WHERE SHIP_ID = 1 GROUP BY ROOM_STYLE, ROOM_TYPE;
-- group functions are not allowed in group by clause
select max(sq_ft) from ship_cabins group by max(sq_ft);
-- scalar functiona are allowed in group by clause
select to_char(sq_ft, '999,999.99') from ship_cabins group by to_char(sq_ft, '999,999.99');

/* having */
SELECT ROOM_STYLE, ROOM_TYPE, TO_CHAR(MIN(SQ_FT),'9,999') "Min"
FROM SHIP_CABINS
WHERE SHIP_ID = 1
GROUP BY ROOM_STYLE, ROOM_TYPE
HAVING ROOM_TYPE IN ('Standard', 'Large') OR MIN(SQ_FT) > 1200
ORDER BY 3;