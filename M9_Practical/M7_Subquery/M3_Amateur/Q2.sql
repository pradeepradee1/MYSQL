/*

Write an SQL query to find the cheapest cost between each origin–destination pair, 
considering both direct flights and two-leg connections.

Note : consider a is chennai , b is delhi , c is kashmir

*) Direct flight
*) Two leg :
    You go from A → B → C instead of directly A → C (direct flight)
    First flight: A → B
    Second flight: B → C
    Tow leg : A → B + B → C = A → C

*) All possible combinations

From A :

        A → B + B → C = A → C (100 + 150 = 250)

        A → B + B → A = A → A (100 + 120 = 220)

        A → C + C → A = A → A (300 + 200 = 500)

From B :

        B → C + C → A = B → A (150 + 200 = 350)

        B → A + A → B = B → B (120 + 100 = 220)

        B → A + A → C = B → C (120 + 300 = 420)

From C

        C → A + A → B = C → B (200 + 100 = 300)

        C → A + A → C = C → C (200 + 300 = 500)

Input :

id | origin | destination | cost
---+--------+-------------+------
1  | A      | B           | 100
2  | B      | C           | 150
3  | A      | C           | 300
4  | C      | A           | 200
5  | B      | A           | 120


Output :

| origin | destination | min_cost |
| ------ | ----------- | -------- | 
    A	        A	        220
    A	        B	        100
    A	        C	        300
    B	        A	        120
    B	        B	        220
    B	        C	        150
    C	        A	        200
    C	        C	        350



*/
CREATE or replace TABLE flights (
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

