/*

Write a query to rank cities by their population density, 
with the city with the highest population density being ranked 1. 

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
    ROW_NUMBER() OVER(ORDER BY population/area_sq_mi DESC) AS density_rank 
FROM 
    cities
ORDER BY density_rank;
