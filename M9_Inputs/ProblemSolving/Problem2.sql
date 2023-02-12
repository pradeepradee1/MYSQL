#Question2:

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

create table transactions
(
    trx_date date,
    merchant_id varchar(10),
    amount int,
    payment_mode varchar(10)
);

insert into transactions values('2022-04-02','m1',150,'CASH');
insert into transactions values('2022-04-02','m1',500,'ONLINE');
insert into transactions values('2022-04-03','m2',450,'ONLINE');
insert into transactions values('2022-04-03','m1',100,'CASH');
insert into transactions values('2022-04-03','m3',600,'CASH');
insert into transactions values('2022-04-05','m5',200,'ONLINE');
insert into transactions values('2022-04-05','m2',100,'ONLINE');

select * from transactions;


select 
payment_mode,merchant_id,sum(amount)
from transactions
group by payment_mode,merchant_id


#This is Correct and match it with requirement
select merchant_id,
       sum(case when payment_mode = 'CASH' then amount else 0 end) as cash_amount,
       sum(case when payment_mode = 'ONLINE' then amount else 0 end) as online_amount
from transactions 
group by merchant_id;

