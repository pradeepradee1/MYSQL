/*

find all missing customer IDs in the range between 1 and the maximum customer_id present 
in the table.

*/

CREATE or replace TABLE Customers 
(
 customer_id INT
);

INSERT INTO Customers (customer_id)
VALUES (1), (2), (3), (5), (7), (8), (10);




WITH RECURSIVE All_IDs AS (
    SELECT 1 AS customer_id
    UNION ALL
    SELECT customer_id + 1
    FROM All_IDs
    WHERE customer_id + 1 <= (SELECT MAX(customer_id) FROM Customers)
)
SELECT customer_id
FROM All_IDs
WHERE customer_id NOT IN (SELECT customer_id FROM Customers)
ORDER BY customer_id;

