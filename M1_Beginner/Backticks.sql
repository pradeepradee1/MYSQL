CREATE TABLE `CAR1` 
(
`car_id` INT UNSIGNED NOT NULL PRIMARY KEY,
`name` VARCHAR(20),
`group` VARCHAR(20)
);


INSERT INTO CAR1 (`car_id` , `name` , `group` ) VALUES (1,'AUDI A2' , '2000');
INSERT INTO CAR1 (`car_id` , `name` , `group` ) VALUES (2,'AUDI A2' , '1000');
INSERT INTO CAR1 (`car_id` , `name` , `group` ) VALUES (3,'AUDI A3' , '5000');
INSERT INTO CAR1 (`car_id` , `name` , `group` ) VALUES (4,'AUDI A4' , '7000');


SELECT 
c.car_id ,
c.name ,
c.group
FROM 
CAR1 c 


SELECT 
c.`car_id` ,
c.`name` ,
c.`group`
FROM 
CAR1 c 


