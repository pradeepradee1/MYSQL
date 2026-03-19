/*

find all missing customer IDs in the range between 1 and the maximum customer_id present 
in the table.

Input :

customer_id
-----------
1
2
3
5
7
8
10


Output :

missing_customer_id
--------------------
4
6
9
*/

CREATE or replace TABLE Customers 
(
 customer_id INT
);

INSERT INTO Customers (customer_id)
VALUES (1), (2), (3), (5), (7), (8), (10);




with recursive all_customer as (
	  select min(customer_id) as minimum, max(customer_id) as maximum from Customers
	  union all
	  select minimum + 1,maximum from all_customer where minimum + 1 <= maximum
)
select 
	a.minimum
from 
	all_customer a left join Customers b on a.minimum = b.customer_id 
where b.customer_id is null

 (or)


WITH RECURSIVE All_IDs AS (
    SELECT 1 AS customer_id
    UNION ALL
    SELECT customer_id + 1 FROM All_IDs
    WHERE customer_id + 1 <= (SELECT MAX(customer_id) FROM Customers)
)
SELECT customer_id
FROM All_IDs
WHERE customer_id NOT IN (SELECT customer_id FROM Customers)
ORDER BY customer_id;

