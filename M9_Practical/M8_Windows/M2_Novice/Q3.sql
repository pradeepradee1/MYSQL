/*

Rank cities by their population density, 

population density = population / area_sq_mi


Sample Input :

city_id | city_name       | state       | population | area_sq_mi
--------|-----------------|-------------|------------|-----------
1       | New York City   | New York    | 8398748    | 468.9
2       | Los Angeles     | California  | 3990456    | 503.0
3       | Chicago         | Illinois    | 2705994    | 234.0
4       | Houston         | Texas       | 2325502    | 599.6
5       | Phoenix         | Arizona     | 1660272    | 517.6



Sample Output :

city_name       | state      | population_density | rank
----------------|------------|--------------------|------
New York City   | New York   | 17910.00           | 1
Chicago         | Illinois   | 11564.10           | 2
Los Angeles     | California | 7933.31            | 3
Houston         | Texas      | 3878.15            | 4
Phoenix         | Arizona    | 3208.32            | 5

*/

/*


CREATE or replace TABLE cities ( 
 city_id INT, 
 city_name VARCHAR(50), 
 state VARCHAR(50), 
 population INT, 
 area_sq_mi INT 
); 


INSERT INTO cities (city_id, city_name, state, population, area_sq_mi) 
VALUES (1, 'New York City', 'New York', 8398748, 468.9), 
 (2, 'Los Angeles', 'California', 3990456, 503.0), 
 (3, 'Chicago', 'Illinois', 2705994, 234.0), 
 (4, 'Houston', 'Texas', 2325502, 599.6), 
 (5, 'Phoenix', 'Arizona', 1660272, 517.6); 

*/

SELECT 
    city_name,
    state,
    ROUND(population * 1.0 / area_sq_mi, 2) AS population_density,
    RANK() OVER (ORDER BY population * 1.0 / area_sq_mi DESC) AS rank
FROM cities
ORDER BY rank;