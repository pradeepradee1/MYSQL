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

*/



SELECT * from ps_customers

SELECT * from ps_orders


SELECT a.*
FROM ps_customers a
JOIN ps_orders b 
ON a.customer_id = b.customer_id
GROUP BY a.customer_id, a.customer_name, a.customer_email
HAVING SUM(CASE WHEN b.status = 'Delivered' THEN 1 ELSE 0 END) = 0;