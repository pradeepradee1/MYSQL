/*
Given a Customers table, write a query to find all missing customer IDs in the range between 1 and the maximum customer_id present in the table.

*/


CREATE TABLE Customers (
 customer_id INT
);

-- Sample Data:
INSERT INTO Customers (customer_id)
VALUES (1), (2), (3), (5), (7), (8), (10);


WITH All_IDs AS (
 SELECT n AS customer_id
 FROM (
 SELECT @row := @row + 1 AS n
 FROM (SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0) t1,
 (SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0) t2,
 (SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0 UNION ALL SELECT 0) t3,
 (SELECT @row := 0) r
 ) numbers
 WHERE n BETWEEN 1 AND (SELECT MAX(customer_id) FROM Customers)
)
SELECT 
 customer_id
FROM 
 All_IDs
WHERE 
 customer_id NOT IN (SELECT customer_id FROM Customers)
ORDER BY 
 customer_id;
