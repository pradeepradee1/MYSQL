#Question:

#Calculate the total amount recived in cash and recived in online for each merchant


/*
Output like this

For ex :        
            merchant    cash_amount     online_amount
                m1          250             500
                m2          0               550
                m3          600             0
                m5          0               200

*/

select * from transactions;


select 
    payment_mode,merchant_id,sum(amount)
from 
    transactions
group by 
    payment_mode,merchant_id


select 
    merchant_id,
    if (payment_mode = 'CASH'  , sum(amount),0) as cash_amount,
    if (payment_mode = 'ONLINE', sum(amount),0) as online_amount
from 
    transactions 
group by 
    merchant_id;



#This is Correct and match it with requirement

select 
    merchant_id,
    sum(if (payment_mode = 'CASH'  , amount,0)) as cash_amount,
    sum(if (payment_mode = 'ONLINE', amount,0)) as online_amount
from 
    transactions 
group by 
    merchant_id;

#(OR)

select 
    merchant_id,
    sum(case when payment_mode = 'CASH' then amount else 0 end) as cash_amount,
    sum(case when payment_mode = 'ONLINE' then amount else 0 end) as online_amount
from 
    transactions 
group by 
    merchant_id;


-----------------------------------------------------------------------------------------------------------------------



#Question2:

#Calculate the total amount recived in cash and recived in online for each merchant and each day

select * from transactions1;


/*
Output like this

For ex :        
             trx_date   merchant_id   cashamount   onlineamount
             
            2022-04-02      m1          150             500
            2022-04-03      m1          700             0
            2022-04-03      m2          0               450
            2022-04-05      m2          0               100
            2022-04-05      m5          0               200

*/



select 
    *,
    sum(if(payment_mode = 'CASH',amount,0)) as cashamount1,
    sum(if(payment_mode != 'CASH',amount,0)) as onlineamount1   
from 
    transactions1
group by merchant_id , trx_date 