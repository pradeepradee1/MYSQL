/*
	Sequences : 
				It is a data base object.
				It is identify the unique records of the table

*/

use mydb

create sequence srno1;


--		CURRVAL = Display current value of the sequence
--		NEXTVAL = Display nextvalue of sequence



select srno1.currval from dual;

select srno1.nextval from dual;
