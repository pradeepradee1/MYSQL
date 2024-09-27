#Clause
#Select

USE mydb

#Note:

#SQL Statements are not case senstive
#we can write like this

SELECT * FROM CAR;
select * from car;
Select * From Car;

#SELECT ALL THE COLUMNS
SELECT * FROM stack;
SELECT * FROM car c;
SELECT stack.* FROM stack JOIN car  ON stack.id_user  = car.car_id 

#SELECT BY COLUMN NAMES
SELECT id_user FROM stack

#SELECT BY COLUMN NAMES AS ALIAS
SELECT username AS val FROM stack;
SELECT username val FROM stack;

#NOTE:
#(Note: AS is syntactically optional.)

#Note:
#SQL Statements are separated into multiple lines

select
*
from
emp

#We can't do like this
#sel * from emp
#select * from em
p


