/*
Index : 
		Index is a database object
		It optimize the performance while retrieve the data from table (read performance)
		
		It works like normal index in books
		It locate records quickly without scanning the entire table
		
		Most indexes use a B-tree structure 
		Which used in filtering (where), joining (join), and sorting (order by).
		
Types Of Index:
				1)	Simple
				2) 	Composite

*/

/*
Notes :
		Too many indexes = slow writes.
		No indexes = slow reads.
		Balance is key.
*/


/*
1) Simple Index:

				create index <idx_name> on table_name(colname);

*/

# create an index on table emp on the column sal?

create index idx_sal on emp(sal);

/*
2) Composite Index:
				
				create index <idx_name> on table_name(col1 ,col2,....);
*/

# create an index on prod_dtls on the columns cost,comp_code?


create index idx_prod_cost_comp_code on prod_dtls(cost,comp_code);


#Adding a Index
ALTER TABLE stack 
ADD INDEX `stack_index` (id_user)

#Adding composite (Multiple) Index
ALTER TABLE stack 
ADD INDEX `stack_index` (id_user,mod_id);

#Drop
ALTER TABLE stack 
Drop INDEX `stack_index`

