/*

Question :

        What is output of joins ?




| product_id | price | price_date |
| ---------- | ----- | ---------- |
| 1          | 100   | 2025-01-01 |
| 1          | 120   | 2025-02-01 |
| 1          | 150   | 2025-03-01 |
| 2          | 200   | 2025-01-15 |
| 2          | 250   | 2025-02-10 |
| 3          | 300   | 2025-01-01 |


| order_id | order_date | product_id |
| -------- | ---------- | ---------- |
| 101      | 2025-01-10 | 1          |
| 102      | 2025-02-15 | 1          |
| 103      | 2025-03-05 | 1          |
| 104      | 2025-02-05 | 2          |
| 105      | 2025-03-01 | 2          |
| 106      | 2025-01-20 | 3          |

*/


CREATE or replace TABLE products5 (
    product_id INT,
    price INT,
    price_date DATE
);

CREATE or replace TABLE orders7 (
    order_id INT,
    order_date DATE,
    product_id INT
);

INSERT INTO products5 
(product_id, price, price_date) 
VALUES
(1, 100, DATE '2025-01-01'),
(1, 120, DATE '2025-02-01'),
(1, 150, DATE '2025-03-01'),
(2, 200, DATE '2025-01-15'),
(2, 250, DATE '2025-02-10'),
(3, 300, DATE '2025-01-01');

INSERT INTO orders7 
(order_id, order_date, product_id) 
VALUES
(101, DATE '2025-01-10', 1),   -- price = 100
(102, DATE '2025-02-15', 1),   -- price = 120
(103, DATE '2025-03-05', 1),   -- price = 150
(104, DATE '2025-02-05', 2),   -- price = 200
(105, DATE '2025-03-01', 2),   -- price = 250
(106, DATE '2025-01-20', 3);   -- price = 300



