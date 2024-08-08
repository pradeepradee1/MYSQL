#Questions:
#Get the unique customers:

select * from Check1

select 
	Month,
	count(distinct CID)  as unique_customers
from 
	Check1
group by Month 