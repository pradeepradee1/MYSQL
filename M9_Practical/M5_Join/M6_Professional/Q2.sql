/*

Write an SQL query to combine transactions between the same pair of entities, regardless of order.

Input :

| Col1 | Col2 | Amount |
| ---- | ---- | ------ |
| A    | B    | 100    |
| B    | A    | 40     |
| A    | C    | 30     |
| NULL | A    | 25     |
| A    | NULL | 30     |
| C    | A    | 15     |


Output :

| Col1 | Col2 | Total_Amount |
| ---- | ---- | ------------ |
| A    | B    | 140          |
| A    | C    | 45           |
| NULL | A    | 25           |
| A    | NULL | 30           |


*/


CREATE or replace TABLE transactions (
 Col1 VARCHAR(10),
 Col2 VARCHAR(10),
 Amount INT
);

INSERT INTO transactions (Col1, Col2, Amount) VALUES 
('A', 'B', 100), 
('B', 'A', 40), 
('A', 'C', 30), 
(NULL, 'A', 25), 
('A', NULL, 30), 
('C', 'A', 15);


SELECT 
    t1.Col1,
    t1.Col2,
    t1.Amount + COALESCE(t2.Amount,0) AS Total_Amount
FROM transactions t1
LEFT JOIN transactions t2
ON t1.Col1 = t2.Col2
AND t1.Col2 = t2.Col1
AND t1.Col1 IS NOT NULL
AND t1.Col2 IS NOT NULL
AND t1.Col1 < t1.Col2;

