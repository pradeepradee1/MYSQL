/*


Input Table:

entity_id   | property  | value 
----------  |---------- |------- 
1           | name      | Alice 
1           | age       | 30 
2           | name      | Bob 
2           | age       | 28 



Expected Output:

entity_id  name     age 
1          Alice     30 
2          Bob       28 

*/


CREATE or replace TABLE Temp (
    entity_id INT,
    property VARCHAR(50),
    value VARCHAR(50)
);

INSERT INTO Temp (entity_id, property, value)
VALUES
(1, 'name', 'Alice'),
(1, 'age', '30'),
(2, 'name', 'Bob'),
(2, 'age', '28');




SELECT 
    entity_id,
    MAX(CASE WHEN property = 'name' THEN value END) AS name,
    MAX(CASE WHEN property = 'age'  THEN value END) AS age
FROM Temp
GROUP BY entity_id;

/* Using PIVOT */
/* Not in-built functions MYSQL */ 

SELECT 
    entity_id,
    [name],
    [age]
FROM (
    SELECT entity_id, property, value
    FROM Temp
) src
PIVOT (
    MAX(value) FOR property IN ([name], [age])
) p;

