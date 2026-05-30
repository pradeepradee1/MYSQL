/*

Question :
Customers who placed at least one order but never received a delivered order


CREATE or replace TABLE ps_customers (
    customer_id INT,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100)
);


INSERT INTO ps_customers (customer_id, customer_name, customer_email) VALUES
(1,'Shashank','abc@gmail.com'),
(2,'Rahul','aaa@gmail.com'),
(3,'Ajay','klm@gmail.com'),
(4,'Nitin','poc@gmail.com'),
(5,'Naveen','mnc@gmail.com');


CREATE or replace TABLE ps_orders (
    order_id INT,
    customer_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(50)
);

INSERT INTO ps_orders (order_id, customer_id, amount, status) VALUES
(101,1,550.0,'Delivered'),
(102,2,350.0,'Delivered'),
(103,1,220.0,'Cancelled'),
(104,3,660.0,'Delivered'),
(105,3,300.0,'Delivered');


Input :

| customer_id | customer_name | customer_email                        |
| ----------- | ------------- | ------------------------------------- |
| 1           | Shashank      | [abc@gmail.com](mailto:abc@gmail.com) |
| 2           | Rahul         | [aaa@gmail.com](mailto:aaa@gmail.com) |
| 3           | Ajay          | [klm@gmail.com](mailto:klm@gmail.com) |
| 4           | Nitin         | [poc@gmail.com](mailto:poc@gmail.com) |
| 5           | Naveen        | [mnc@gmail.com](mailto:mnc@gmail.com) |


| order_id | customer_id | amount | status    |
| -------- | ----------- | ------ | --------- |
| 101      | 1           | 550    | Delivered |
| 102      | 2           | 350    | Delivered |
| 103      | 1           | 220    | Cancelled |
| 104      | 3           | 660    | Delivered |
| 105      | 3           | 300    | Delivered |
| 106      | 4           | 200    | Cancelled |
| 107      | 4           | 150    | Cancelled |

Output :

| customer_id | customer_name |
| ----------- | ------------- |
| 4           | Nitin         |


*/



SELECT * from ps_customers

SELECT * from ps_orders

SELECT 
c.customer_id,
c.customer_name
FROM 
    ps_customers c 
JOIN ps_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id,c.customer_name
HAVING COUNT(*) = SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END);
