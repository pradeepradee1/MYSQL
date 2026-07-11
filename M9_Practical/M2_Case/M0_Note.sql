/*

1)

Use condition properly 
if and case are not same

Check if condition how it is working
    If (True , this one , not here)
 
Check Case 
    Case
        When condition then ""
        When condition then ""
        else ""
    end

*/

/*

2)
select 
    merchant_id,
    sum(case when payment_mode = 'CASH' then amount else 0 end) as cash_amount,
    sum(case when payment_mode = 'ONLINE' then amount else 0 end) as online_amount
from 
    Temp 



*) If i use two case statement then, OP column will be two 

Ex: 

select cash_amount, online_amount from tab



*) If i use Single case statement then, OP column will be one 

SELECT 
    user_id,
    SUM(CASE WHEN type = 'CREDIT' THEN amount WHEN type = 'DEBIT' THEN -amount ELSE 0 END) AS net_balance 
FROM  
transactions3

Ex :

select net_balance from tab

*/