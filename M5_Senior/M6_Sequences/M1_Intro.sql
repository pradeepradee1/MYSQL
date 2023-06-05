/*
	Sequences : 
				It is a data base object which is used to generate sequential integers 
					with the specified interval value.
				Generally the sequences are used to generate primary key values.

*/

use mydb

create sequence srno1;


--		CURRVAL = Display current value of the sequence
--		NEXTVAL = Display nextvalue of sequence



select srno1.currval from dual;

select srno1.nextval from dual;