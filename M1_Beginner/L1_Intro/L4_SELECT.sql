#Clause
#Select

USE mydb


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



