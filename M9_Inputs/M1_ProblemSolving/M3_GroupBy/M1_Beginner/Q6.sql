

# Question :

# Group by and get the maximum count in group

# Note :
# 		 Nested group code using the while


#Sample Output :
			
				CID 	payment_check_method
				100				12


select * from Check1;



Select CID,max(cnt) from
(select 
	CID,
	Payment_Mehtod,
	CASE 
		when Payment_Mehtod  in ("CASH","Cash_method") then 1
		when Payment_Mehtod = "Cheque" then 2
		when Payment_Mehtod in ("Digital","Digital_Method") then 3
		when Payment_Mehtod = "online" then 4
	END as classify,
	count(*) as cnt
from 
	Check1
group by classify
) tmp

