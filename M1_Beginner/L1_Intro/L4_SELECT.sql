#Clause
#Select

USE mydb


#SELECT ALL THE COLUMNS
SELECT * FROM stack;
SELECT * FROM car c;
SELECT stack.* FROM stack JOIN car  ON stack.stack_id  = car.car_id 

#SELECT BY COLUMN NAMES
SELECT stack_id FROM stack

#SELECT BY COLUMN NAMES AS ALIAS
SELECT name AS val FROM stack;
SELECT name val FROM stack;

#NOTE:
#(Note: AS is syntactically optional.)



