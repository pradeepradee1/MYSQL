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


