/*
Index : 
		Index is a table like object which maintains ordered data of the column physically.
		It reduces number of comparisons to make, to fetch the required data. It fastens the search as much as fast. It occupies physical disk space.
*/


/*
Index contains 2 parts : 
						 1) Data part
						 2) Address part (ROWID)

*/

/*
	ROWID is a pseudo column / virtual column. It contains Physical address of each record.
	We can access the values of rowid , but we cannot modify them.
*/

/*
	This (ROWID) address is a combination of the following.

		{fileno,datablock_no,record_no}

		This first data block of a table is indicated with 0.
		And the first record in each data block is indicated with 0.
