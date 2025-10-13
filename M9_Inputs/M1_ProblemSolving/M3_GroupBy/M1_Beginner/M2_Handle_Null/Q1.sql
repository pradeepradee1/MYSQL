/*

Questions:

#Task : Take the average of balance


select *  from trans_table

*/





---------------------------------------------------

/*

See the difference Count (*) vs Count (1) vs Count (Coulmn name) In SQL

Note : This is aggregations functions it will same as rest of the functions

*/





select 
	cid,month_name,avg(total_balance)
from 
	trans_table
group by 
	cid

# Note :
# Aggregate function will excllude the NULL values 
# Here average is doing explict the NULL values 

# For ex :

# 650 / 4 = 162.5
# 2300 / 12 = 191.1

