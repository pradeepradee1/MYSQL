/*

As a restaurant owner evaluating potential expansion, it’s essential to analyze customer spending trends over time. 
Write an SQL query to calculate the 7-day moving average of customer payments, helping identify peak spending patterns 
and low-demand days. 
The average, average_amount, should be rounded to two decimal places for clarity.

*/

CREATE TABLE daily_sales (
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

/*I’ve shared the explanation and query; however, I recommend trying to solve it on your own first.
You can refer to the query afterward.
*/

SELECT 
 sale_date,
 ROUND(AVG(amount_paid) OVER (
 ORDER BY sale_date 
 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
 ), 2) AS average_amount
FROM daily_sales
ORDER BY sale_date;
