# IP : Get the orgin and destination of customers



/*
# OP : 

	1		 Del		Blr
	2		 Mum	   Kol
*/



select * from flights a




select 
	a.cid,
	a.origin,
	a.Destination
from 
	flights a
inner join flights b on a.origin = b.Destination
