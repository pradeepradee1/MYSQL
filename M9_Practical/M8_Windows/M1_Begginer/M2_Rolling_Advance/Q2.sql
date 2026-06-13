/*

calculate the 7-day moving average of customer payments, 


sale_date   | amount_paid
------------|-------------
2024-10-01  | 150
2024-10-02  | 200
2024-10-03  | 120
2024-10-04  | 250
2024-10-05  | 180
2024-10-06  | 220
2024-10-07  | 300
2024-10-08  | 250


Sample Output :

sale_date   | amount_paid | moving_avg_7_days
------------|-------------|-------------------
2024-10-01  | 150         | 150.00
2024-10-02  | 200         | 175.00
2024-10-03  | 120         | 156.67
2024-10-04  | 250         | 180.00
2024-10-05  | 180         | 180.00
2024-10-06  | 220         | 186.67
2024-10-07  | 300         | 202.86   -- avg of 7 days
2024-10-08  | 250         | 217.14   -- (Oct 2 → Oct 8)

*/

CREATE or replace TABLE daily_sales (
 sale_date DATE,
 amount_paid DECIMAL(10, 2)
);

INSERT INTO daily_sales (sale_date, amount_paid) VALUES
('2024-10-01', 150.00),
('2024-10-02', 200.00),
('2024-10-03', 120.00),
('2024-10-04', 250.00),
('2024-10-05', 180.00),
('2024-10-06', 220.00),
('2024-10-07', 300.00),
('2024-10-08', 250.00);



SELECT 
 sale_date,
 ROUND(AVG(amount_paid) OVER (ORDER BY sale_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM daily_sales
ORDER BY sale_date;
