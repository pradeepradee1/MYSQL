# IP : Get the orgin and destination of customers



/*
# OP : 

   cid		Orgin  destination
	1		 Hyd		Blr
	2		 Agra	    Kol
*/


select 
	a.cid,
	a.origin,
	a.Destination
from 
	flights a
inner join flights b on a.origin = b.Destination
