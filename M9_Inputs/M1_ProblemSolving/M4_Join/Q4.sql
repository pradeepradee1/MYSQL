Create table If Not Exists cinema (seat_id SERIAL primary key, free bool);

insert into cinema (seat_id, free) values ('1', '1');
insert into cinema (seat_id, free) values ('2', '0');
insert into cinema (seat_id, free) values ('3', '1');
insert into cinema (seat_id, free) values ('4', '1');
insert into cinema (seat_id, free) values ('6', '1');

/*
we need find consecutive available sets 

Here 0 = Occupied
	 1 = Free

OutPut : 
			seat_id
				3
				4

*/


select * from cinema

#Approach
select 
	seat_id,
	if( (seat_id+1 - IFNULL(lead(seat_id) over(order by seat_id),0) ) = 0 , seat_id , 0) as availseart,
	if( (seat_id-1 - IFNULL(lag(seat_id) over(order by seat_id),0) ) = 0 , seat_id , 0) as availseart
from 
	cinema
where `free` is TRUE 

#Approach
select 
-- 	*,
	seat_id,
	if( (seat_id+1 - IFNULL(lead(seat_id) over(order by seat_id),0) ) = 0 , concat_ws(",",seat_id , lead(seat_id) over(order by seat_id)) , null) as availseart
from 
	cinema
where `free` is TRUE 

#Approach
select 
	if(lag(seat_id) over(order by seat_id) is null , 0 , 
	if (seat_id - lag(seat_id) over(order by seat_id) = 1 , CONCAT_WS(",",seat_id,lag(seat_id) over(order by seat_id)),"NotSequence"  )
	) as sequences_check
from 
	cinema
where free != 0


SELECT 
distinct a.seat_id
from cinema a
join cinema b on abs(a.seat_id - b.seat_id) = 1 and a.free = true and b.free = true
order by a.seat_id;
