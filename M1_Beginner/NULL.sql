CREATE TABLE `CAR2` 
(
`car_id` INT UNSIGNED NOT NULL PRIMARY KEY,
`name` VARCHAR(20),
`group` VARCHAR(20)
);


INSERT INTO CAR2 (`car_id` , `name` , `group` ) VALUES (1,'AUDI A2' , '2000');
INSERT INTO CAR2 (`car_id` , `name` ) VALUES (2,'AUDI A2' );
INSERT INTO CAR2 (`car_id` , `name` , `group` ) VALUES (3,'AUDI A3' , '5000');
INSERT INTO CAR2 (`car_id` , `name`  ) VALUES (4,'AUDI A4' );


SELECT 
*
FROM 
CAR2 c 
where c.`group` is NULL 