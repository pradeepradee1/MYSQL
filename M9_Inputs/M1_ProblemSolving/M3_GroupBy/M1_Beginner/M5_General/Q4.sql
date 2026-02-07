/*

From the purchase history, find users who bought at least one ‘Shirt’ AND one ‘Pant’.

*/

CREATE or replace TABLE Temp (
 user_id INT,
 product_name VARCHAR(100)
);

INSERT INTO Temp VALUES
(1, 'Shirt'),
(1, 'Pant'),
(1, 'Shoes'),
(2, 'Shirt'),
(3, 'Pant'),
(4, 'Pant'),
(4, 'Shirt'),
(5, 'Shoes');

select * from Temp 

SELECT
    user_id
FROM 
    purchases
WHERE product_name IN ('Shirt', 'Pant')
GROUP BY 
    user_id
HAVING COUNT(DISTINCT product_name) = 2;
