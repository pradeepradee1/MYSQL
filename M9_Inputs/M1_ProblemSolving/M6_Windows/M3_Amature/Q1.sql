/*

Find the top 3 best-selling products

Find the top 3 best-selling products in each category with their total sales and percentage contribution


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
    FROM 
        products_123 p
    JOIN 
        transactions_123 t 
    ON 
        p.product_id = t.product_id
    GROUP BY 
        p.category, p.product_name
),
category_totals AS (
    SELECT 
        category,
        SUM(total_sales) AS category_total
    FROM 
        product_sales
    GROUP BY 
        category
),
ranked AS (
    SELECT 
        ps.category,
        ps.product_name,
        ps.total_sales,
        ROUND((ps.total_sales / ct.category_total) * 100, 2) AS percentage_contribution,
        RANK() OVER (PARTITION BY ps.category ORDER BY ps.total_sales DESC) AS rnk
    FROM 
        product_sales ps
    JOIN 
        category_totals ct 
    ON 
        ps.category = ct.category
)
SELECT 
    category,
    product_name,
    total_sales,
    percentage_contribution
FROM 
    ranked
WHERE 
    rnk <= 3
ORDER BY 
    category, total_sales DESC;

