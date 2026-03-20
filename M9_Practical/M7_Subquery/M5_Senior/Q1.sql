/*
Questions :

            find the missing order IDs.



| order\_id |
| --------- |
| 101       |
| 102       |
| 104       |
| 105       |
| 107       |


OP : 

103
106


*/

/*

CREATE or replace TABLE orders_5 (
    order_id INT
);


INSERT INTO orders_5 (order_id) VALUES
(101),
(102),
(104),
(105),
(107);

*/

with recursive all_id as 
(
   select min(order_id) as min_id from orders_5
   union all 
   select min_id+1 from all_id where min_id < (select max(order_id) from orders_5)
)
select 
 a.min_id
from 
all_id a left join orders_5 b on a.min_id = b.order_id 
where b.order_id is null



