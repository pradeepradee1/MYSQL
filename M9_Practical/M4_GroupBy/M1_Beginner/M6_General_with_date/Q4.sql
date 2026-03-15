/*

 How would you find a user’s first purchase date and 
 calculate days since then ?

*/

/*
CREATE or replace TABLE purchases1 (
    user_id INT,
    purchase_id INT,
    purchase_date DATE,
    amount DECIMAL
);

INSERT INTO purchases1 (user_id, purchase_id, purchase_date, amount) VALUES
(1, 101, '2025-01-01', 100),
(1, 102, '2025-01-05', 200),
(2, 103, '2025-01-03', 150),
(2, 104, '2025-01-10', 300),
(3, 105, '2025-01-07', 250);

*/

SELECT 
    user_id,
    MIN(purchase_date) AS first_purchase_date,
    CURRENT_DATE - MIN(purchase_date) AS days_since_first_purchase
FROM 
    purchases1
GROUP BY 
    user_id
ORDER BY 
    user_id;
