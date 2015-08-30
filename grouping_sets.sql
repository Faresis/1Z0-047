select * from ship_cabins;

/* sum of sq_ft per room style/type category */
select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by room_style, room_type
order by room_style, room_type;

/* totals and subtotals are added */
select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by rollup (room_style, room_type)
order by room_style, room_type;

/* window column added */
select window, room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by window, rollup (room_style, room_type)
order by window, room_style, room_type;

/* cube example */
select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by cube (room_style, room_type)
order by room_style, room_type;

/* grouping function */
select grouping(room_type), room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by rollup (room_style, room_type)
order by room_style, room_type;

select grouping(room_style), grouping(room_type), room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by cube (room_style, room_type)
order by room_style, room_type;

/* grouping sets */
/* same as cube */
select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by grouping sets ((room_style, room_type), (room_style), (room_type), null)
order by room_style, room_type;

/* same as rollup  */
select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by grouping sets ((room_style, room_type), (room_style), null)
order by room_style, room_type;

select room_style, room_type, round(sum(sq_ft),0) sum_sq_ft
from ship_cabins
group by grouping sets ((room_style, room_type), null)
order by room_style, room_type;