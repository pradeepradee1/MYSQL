#Question : Classify the node values


/*


Node   Parnet    Classify
5	    8	        inner
9	    8	        inner
4    	5	        Leaf
2	    9	        Leaf
1	    5	        Leaf
3	    9	        Leaf
8	  NULL	        Root

OP 

Node    Classify
5	      inner
9	      inner
4	      Leaf
2	      Leaf
1	      Leaf
3	      Leaf
8		  Root

*/
#Query


CREATE or replace TABLE Temp (
    node INT,
    parent INT
);


INSERT INTO Temp (node, parent, classify) VALUES
(5, 8),
(9, 8),
(4, 5),
(2, 9),
(1, 5),
(3, 9),
(8, NULL);


SELECT 
    t.id,
    t.name,
    t.parent_id,
    CASE 
        WHEN t.parent_id IS NULL THEN 'Root'
        WHEN t.id NOT IN (SELECT DISTINCT parent_id FROM tree WHERE parent_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS Temp
FROM tree t;
