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
    s.cid,
    s.origin,
    e.destination
FROM
(
    SELECT cid, origin
    FROM flights f
    WHERE NOT EXISTS (
        SELECT 1 
        FROM flights 
        WHERE cid = f.cid
        AND destination = f.origin
    )
) s
JOIN
(
    SELECT cid, destination
    FROM flights f
    WHERE NOT EXISTS (
        SELECT 1 
        FROM flights 
        WHERE cid = f.cid
        AND origin = f.destination
    )
) e
ON s.cid = e.cid;