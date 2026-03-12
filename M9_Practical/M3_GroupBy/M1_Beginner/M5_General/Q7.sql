/*

Write an SQL query to find the cheapest flight cost for each origin–destination pair.

id | origin | destination | cost
---+--------+-------------+------
1  | A     | B            | 100
2  | B     | C            | 150
3  | A     | C            | 300
4  | C     | A            | 200
5  | B     | A            | 120

*/

CREATE TABLE flights (
    id INT,
    origin VARCHAR(10),
    destination VARCHAR(10),
    cost INT
);

INSERT INTO flights VALUES
(1,'A','B',100),
(2,'B','C',150),
(3,'A','C',300),
(4,'C','A',200),
(5,'B','A',120);


SELECT 
    origin,
    destination,
    MIN(cost) AS cheapest_cost
FROM flights
GROUP BY origin, destination;

/* 
Problem 2 : 

complete flight row with the cheapest cost. 
*/

SELECT *
FROM flights f
WHERE cost = (
    SELECT MIN(cost)
    FROM flights
    WHERE origin = f.origin
    AND destination = f.destination
);