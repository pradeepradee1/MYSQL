Questions:

# Real time in CUB

#Task : Take average of balance that only the active cusotmer of contributed in month of year

select *  from trans_table




-----------------------------------------------------

#Note : This will include the null values

select 
cid,
month_name,
sum(total_balance) as total_year_sum_balance
from 
trans_table
-- where total_balance is not null
group by cid
having count(*) = 12




select 
cid,
month_name,
sum(total_balance) as total_year_sum_balance
from 
trans_table
where total_balance is not null
group by cid
having count(*) = 12


