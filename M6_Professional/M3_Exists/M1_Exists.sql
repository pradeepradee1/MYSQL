/*

Exists :

        *) It is a conditional operator
        *) It will be using in a subquery 
        *) check any records exists or not


*/


SELECT 
*
from 
dept d 
where exists (select * from emp e)


SELECT 
*
from 
dept d 
where exists (select * from emp e where e.dno=d.dno)

SELECT 
*
from 
dept d 
where not exists (select * from emp e where e.dno=d.dno)


select 
c.*
from 
customers c 
left join orders o on c.customer_id  = o.order_id 
where o.customer_id is not null and c.customer_name = 'Shashank' ;



select 
c.*
from 
customers c 
where EXISTS 
(select order_id from orders o where c.customer_id  = o.order_id and c.customer_name = 'Shashank') ;
