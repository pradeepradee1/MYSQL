# Questions : Get the orgin and destination of customers



/*
# OP : 

	1		 Del		Blr
	2		 Mum	   Kol
*/



select * from flights a

SELECT DISTINCT a.CustomerID,
       a.Origin AS Origin,
       b.Destination AS Final_Destination
FROM problemsolving2_table a
JOIN problemsolving2_table b
  ON a.CustomerID = b.CustomerID
WHERE a.Origin NOT IN (SELECT Destination FROM problemsolving2_table WHERE CustomerID = a.CustomerID)
  AND b.Destination NOT IN (SELECT Origin FROM problemsolving2_table WHERE CustomerID = b.CustomerID);


#Wrong Approch 
select 
	a.cid,
	a.origin,
	a.Destination
from 
	flights a
inner join flights b on a.origin = b.Destination
