/*

Write an SQL query to find the cheapest cost between each origin–destination pair, 
considering both direct flights and two-leg connections.

id | origin | destination | cost
---+--------+-------------+------
1  | A      | B           | 100
2  | B      | C           | 150
3  | A      | C           | 300
4  | C      | A           | 200
5  | B      | A           | 120

1️⃣ Direct flight
2️⃣ Two-leg connection (A → B → C)

*/
CREATE TABLE flights (
    id INT,
    origin VARCHAR(5),
    destination VARCHAR(5),
    cost INT
);

INSERT INTO flights VALUES
(1,'A','B',100),
(2,'B','C',150),
(3,'A','C',300),
(4,'C','A',200),
(5,'B','A',120);



WITH direct_flights AS (
    SELECT origin, destination, cost
    FROM flights
),

two_leg_flights AS (
    SELECT 
        f1.origin,
        f2.destination,
        f1.cost + f2.cost AS cost
    FROM flights f1
    JOIN flights f2
        ON f1.destination = f2.origin
)

SELECT 
    origin,
    destination,
    MIN(cost) AS cheapest_cost
FROM (
    SELECT * FROM direct_flights
    UNION ALL
    SELECT * FROM two_leg_flights
) all_routes
GROUP BY origin, destination
ORDER BY origin, destination;