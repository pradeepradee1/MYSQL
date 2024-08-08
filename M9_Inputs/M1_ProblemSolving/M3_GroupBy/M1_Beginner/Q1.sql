Questions:

#Task : Take the average of balance


select *  from trans_table






---------------------------------------------------


select 
	cid,month_name,avg(total_balance)
from 
	trans_table
group by 
	cid

# Note :
# Here average is doing explict the NULL values 

# For ex :

# 650 / 4 = 162.5
# 2300 / 12 = 191.1

