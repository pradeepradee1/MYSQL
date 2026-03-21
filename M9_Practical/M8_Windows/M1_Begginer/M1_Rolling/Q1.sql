/*
Problem :
Calculate the date wise rolling average of amazon sales


Sample Input :

sales_date   | sales_amount
-------------|--------------
2022-08-18   | 200
2022-08-19   | 300
2022-08-21   | 500
2022-08-22   | 600
2022-08-25   | 800


Sample Output :

sales_date   | sales_amount | rolling_avg
-------------|--------------|-------------
2022-08-18   | 200          | 200.00
2022-08-19   | 300          | 250.00
2022-08-21   | 500          | 333.33
2022-08-22   | 600          | 400.00
2022-08-25   | 800          | 480.00

*/

CREATE or replace TABLE amazon_sales_data (
    sales_date DATE,
    sales_amount INT
);

INSERT INTO amazon_sales_data (sales_date, sales_amount) VALUES
('2022-08-21', 500),
('2022-08-22', 600),
('2022-08-19', 300),
('2022-08-18', 200),
('2022-08-25', 800);


SELECT 
       *,
       AVG(sales_amount) OVER(ORDER BY sales_date) AS rolling_avg
FROM 
       amazon_sales_data;

