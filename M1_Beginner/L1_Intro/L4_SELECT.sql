USE mydatabase


#SELECT ALL THE COLUMNS
SELECT * FROM stack;
SELECT * FROM CAR c 
SELECT stack.* FROM stack JOIN CAR  ON stack.id = CAR.car_id 

#SELECT BY COLUMN NAMES
SELECT id FROM stack

#SELECT BY COLUMN NAMES AS ALIAS
SELECT name AS val FROM stack;
SELECT name val FROM stack;

#NOTE:
#(Note: AS is syntactically optional.)



