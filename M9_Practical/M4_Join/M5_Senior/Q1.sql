
/*
Questions : Get the orgin and destination of customers


CREATE TABLE `flights` (
  `cid` varchar(512) DEFAULT NULL,
  `fid` varchar(512) DEFAULT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `Destination` varchar(512) DEFAULT NULL
) 

INSERT INTO flights (cid, fid, origin, Destination) 
VALUES
(1, 'f1', 'Del',  'Hyd'),
(1, 'f2', 'Hyd',  'Blr'),
(2, 'f3', 'Mum',  'Agra'),
(2, 'f4', 'Agra', 'Kol');


Input :

cid 	fid  	origin	 Destination
1	  	f1		Del			  Hyd
1	  	f2		Hyd			  Blr
2	  	f3		Mum			  Agra
2	  	f4		Agra		  Kol


*/


/*
# OP : 

	1		 Del		  Blr
	2		 Mum	    Kol

*/



select * from flights a


/* Inner Join */

select 
	a.origin,
	b.Destination
from 
	flights a
inner join flights b  ON a.cid = b.cid
where a.origin not in (select Destination from flights)
and b.Destination not in (select origin from flights) 



/*  This is CROSS Join */

SELECT
    f1.cid,
    f1.origin AS start_city,
    f2.destination AS end_city
FROM flights f1
CROSS JOIN flights f2
  ON f1.cid = f2.cid
WHERE f1.origin NOT IN (SELECT destination FROM flights)
  AND f2.destination NOT IN (SELECT origin FROM flights);




/* Alternative Approach */

SELECT
    cid,
    MIN(origin) AS start_city,
    MAX(destination) AS end_city
FROM flights
WHERE origin NOT IN (SELECT destination FROM flights)
   OR destination NOT IN (SELECT origin FROM flights)
GROUP BY cid;
