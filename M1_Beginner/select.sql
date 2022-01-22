

CREATE TABLE `CAR` 
(
`car_id` INT UNSIGNED NOT NULL PRIMARY KEY,
`name` VARCHAR(20),
`price` DECIMAL(8,2)
);

INSERT INTO CAR (`car_id` , `name` , `price` ) VALUES (1,'AUDI A2' , '2000');
INSERT INTO CAR (`car_id` , `name` , `price` ) VALUES (2,'AUDI A2' , '1000');
INSERT INTO CAR (`car_id` , `name` , `price` ) VALUES (3,'AUDI A3' , '5000');
INSERT INTO CAR (`car_id` , `name` , `price` ) VALUES (4,'AUDI A4' , '7000');


CREATE TABLE `stack` 
(
`id` INT UNSIGNED NOT NULL PRIMARY KEY,
`name` VARCHAR(20),
`password`  VARCHAR(20)
);


INSERT INTO stack (`id` , `name` , `password` ) VALUES (1,'Foo' , 'hoddengem');
INSERT INTO stack (`id` , `name` , `password` ) VALUES (2,'baa' , 'verysecret');

select * from `CAR`
select * from stack

1) DISTINCT

select DISTINCT name , price from CAR


2) all Columns (*)

select c.* from CAR c join mytable m on (c.car_id=m.id)

3) select by column name

SELECT id from stack s 

4) select with LIKE (%)

select * from stack s WHERE name LIKE "%Fo%"
select * from stack s WHERE name LIKE "b%"
select * from stack s WHERE name LIKE "%o"


5) select with CASE or IF 

5.1) CASE 

SELECT 
	c.price ,
	CASE when c.price >=2000 then 'Pass' ELSE 'Fail' END as 'REMARK'
FROM 
CAR c

5.2) IF

select
c.price,
if (c.price >=2000,'Pass','Fail') AS 'REMARK'
FROM 
CAR c 

6) select with ALIAS(AS)

select 
name as LABEL
FROM 
CAR c 

select 
name LABEL
FROM 
CAR c 

7) select with limit

select 
*
FROM 
CAR c 
limit 2


select 
*
FROM 
CAR c 
limit 2,1


8) select with between

select
*
FROM 
CAR c 
where c.price BETWEEN 2000 and 5000

9) select with where

SELECT 
*
FROM CAR c 
where c.price = 2000 AND c.name ='AUDI A2'

10 ) select with LIKE(_)

select
*
FROM 
stack s 
where s.name LIKE 'ba_'



