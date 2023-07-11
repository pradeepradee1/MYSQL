Create table If Not Exists cinema (seat_id SERIAL primary key, free bool);

insert into cinema (seat_id, free) values ('1', '1');
insert into cinema (seat_id, free) values ('2', '0');
insert into cinema (seat_id, free) values ('3', '1');
insert into cinema (seat_id, free) values ('4', '1');
insert into cinema (seat_id, free) values ('6', '1');

/*
we need find consecutive available sets 

OutPut : 
			seat_id
				3
				4

*/


SELECT 
distinct a.seat_id
from cinema a
join cinema b on abs(a.seat_id - b.seat_id) = 1 and a.free = true and b.free = true
order by a.seat_id;
