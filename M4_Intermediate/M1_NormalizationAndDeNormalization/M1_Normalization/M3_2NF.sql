#2NF 
use mydb;

SELECT * from Second_2NF ;
SELECT * from Second_2NF_1 ;
SELECT * from Second_2NF_2 ;

/*
2NF:
	1) Table Has to be follow 1st NF
	2) In the Table should not have partial dependency,
	   attributes are fully dependent on the prymary key of the table,

*/



/*
	What is Dependency ?
				Dependency = functional dependency = all columns are dependent on one primary key
	
	What is partial dependency?
				when there are 2 or more primary keys in one table (candidate key)
				any attribute depends only on a part of candidate key
	EX:
		In the Second_2NF_2 Table , marks is dependent on sub_id ,marks is dependent on stud_id 
		But teacher depends on the sub_id ,teacher doesn't depends in the stud_id ,
		hence teacher is partily dependency, since teacher depends only on a part od candidate key

*/

