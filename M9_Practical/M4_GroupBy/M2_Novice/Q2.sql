/*

Write a SQL query to return only the unique city pairs and their distance, eliminating duplicate routes that 
appear in reverse order.


Sample Input :


| start_location | end_location | distance |
| -------------- | ------------ | -------- |
| Delhi          | Mumbai       | 1400     |
| Mumbai         | Delhi        | 1400     |
| Chennai        | Bangalore    | 350      |
| Bangalore      | Chennai      | 350      |
| Delhi          | Pune         | 1500     |
| Pune           | Delhi        | 1500     |
| Mumbai         | Goa          | 600      |


Expected Output:

| source    | destination | distance |
| --------- | ----------- | -------- |
| Bangalore | Chennai     | 350      |
| Delhi     | Mumbai      | 1400     |
| Delhi     | Pune        | 1500     |
| Goa       | Mumbai      | 600      |



*/



CREATE or replace TABLE travel_routes (
    start_location VARCHAR(50),
    end_location   VARCHAR(50),
    distance       INT
);


INSERT INTO travel_routes VALUES
('Delhi', 'Mumbai', 1400),
('Mumbai', 'Delhi', 1400),
('Chennai', 'Bangalore', 350),
('Bangalore', 'Chennai', 350),
('Delhi', 'Pune', 1500),
('Pune', 'Delhi', 1500),
('Mumbai', 'Goa', 600);



SELECT
       LEAST(start_location, end_location) AS source,
       GREATEST(start_location, end_location) AS destination,
       MIN(distance) AS distance
FROM travel_routes
GROUP BY
       LEAST(start_location, end_location),
       GREATEST(start_location, end_location);