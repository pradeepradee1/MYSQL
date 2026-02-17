/*
	Sequences : 
				It is a data base object.
				It is used generate the unique interger records of the table for primary keys.

*/

/*

Note : 
	Sequence will generate the unique value
	Priymary Key will identfiy the unique value

*/
use mydb

create sequence srno1;


--		CURRVAL = Display current value of the sequence
--		NEXTVAL = Display nextvalue of sequence



select srno1.currval from dual;

select srno1.nextval from dual;
