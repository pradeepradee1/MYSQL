/*


Find the top 3 best-selling products in each category with their total sales and percentage contribution


Sample Input :

| product_id | product_name | category    |
| ---------- | ------------ | ----------- |
| 101        | Laptop       | Electronics |
| 102        | Phone        | Electronics |
| 103        | Desk         | Furniture   |
| 104        | Chair        | Furniture   |
| 105        | Book         | Books       |

| transaction_id | product_id | quantity | price_per_unit |
| -------------- | ---------- | -------- | -------------- |
| 1              | 101        | 10       | 1000           |
| 2              | 102        | 20       | 500            |
| 3              | 103        | 5        | 200            |
| 4              | 104        | 15       | 150            |
| 5              | 105        | 50       | 20             |
| 6              | 102        | 10       | 500            |
| 7              | 101        | 5        | 1000           |
| 8              | 103        | 10       | 200            |
| 9              | 104        | 20       | 150            |
| 10             | 105        | 30       | 20             |


Expected Output :


| category    | product_name | total_sales | percentage |
| ----------- | ------------ | ----------- | ---------- |
| Electronics | Laptop       | 15000       | 50%        |
| Electronics | Phone        | 15000       | 50%        |
| Furniture   | Chair        | 5250        | 63.64%     |
| Furniture   | Desk         | 3000        | 36.36%     |
| Books       | Book         | 1600        | 100%       |


*/

CREATE TABLE products_123 (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO products_123 VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Phone', 'Electronics'),
(103, 'Desk', 'Furniture'),
(104, 'Chair', 'Furniture'),
(105, 'Book', 'Books');

CREATE TABLE transactions_123 (
    transaction_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2)
);

INSERT INTO transactions_123 VALUES
(1, 101, 10, 1000),
(2, 102, 20, 500),
(3, 103, 5, 200),
(4, 104, 15, 150),
(5, 105, 50, 20),
(6, 102, 10, 500),
(7, 101, 5, 1000),
(8, 103, 10, 200),
(9, 104, 20, 150),
(10, 105, 30, 20);



WITH product_sales AS (
    SELECT 
        p.category,
        p.product_name,
        SUM(t.quantity * t.price_per_unit) AS total_sales
    FROM transactions_123 t
    JOIN products_123 p
        ON t.product_id = p.product_id
    GROUP BY p.category, p.product_name
),
ranked AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS rn,
        SUM(total_sales) OVER (PARTITION BY category) AS category_total
    FROM product_sales
)

SELECT 
    category,
    product_name,
    total_sales,
    ROUND((total_sales * 100.0) / category_total, 2) AS percentage
FROM ranked
WHERE rn <= 3
ORDER BY category, total_sales DESC;
