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

cid		fid  	origin	 Destination
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


SELECT
    cid,
    MIN(origin) AS start_city,
    MAX(destination) AS end_city
FROM flights
WHERE origin NOT IN (SELECT destination FROM flights)
   OR destination NOT IN (SELECT origin FROM flights)
GROUP BY cid;
