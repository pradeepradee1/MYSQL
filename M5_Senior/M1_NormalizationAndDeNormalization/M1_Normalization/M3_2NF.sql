#2NF 
use mydb;

SELECT * from Second_2NF ;
SELECT * from Second_2NF_1 ;
SELECT * from Second_2NF_2 ;

/*
2NF:
	1) Table Has to be follow 1st NF
	2) It Should not have any partial dependency

*/



/*	
	What is partial dependency?
		Non Primary Key attributes should depend on the complete candiate key

	EX:
		In the Second_2NF_2 Table , marks is dependent on sub_id ,marks is dependent on stud_id 
		But teacher depends on the sub_id ,teacher doesn't depends in the stud_id ,
		hence teacher is partily dependency, since teacher depends only on a part od candidate key

*/

