/*

For each stock, replace every NULL price with the most recent available non-NULL price from a previous date.

*/

/*

| DateKey    | StockName | Price |
| ---------- | --------- | ----- |
| 2025-08-19 | Infosys   | 1400  |
| 2025-08-20 | Infosys   | NULL  |
| 2025-08-21 | Infosys   | 1450  |
| 2025-08-22 | Infosys   | NULL  |
| 2025-08-23 | Infosys   | NULL  |
| 2025-08-24 | Infosys   | NULL  |
| 2025-08-19 | Reliance  | 2300  |
| 2025-08-20 | Reliance  | NULL  |


Output :

| DateKey    | StockName | Price |
| ---------- | --------- | ----- |
| 2025-08-19 | Infosys   | 1400  |
| 2025-08-20 | Infosys   | 1400  |
| 2025-08-21 | Infosys   | 1450  |
| 2025-08-22 | Infosys   | 1450  |
| 2025-08-23 | Infosys   | 1450  |
| 2025-08-24 | Infosys   | 1450  |
| 2025-08-19 | Reliance  | 2300  |
| 2025-08-20 | Reliance  | 2300  |


*/

Create or replace table Stocks(Datekey date,StockName varchar (50),Price int) 



insert into Stocks values 
('2025-08-19','Infosys',1400), 
('2025-08-20','Infosys',null), 
('2025-08-21','Infosys',1450), 
('2025-08-22','Infosys',null), 
('2025-08-23','Infosys',null), 
('2025-08-23','Infosys',null), 
('2025-08-19','Reliance',2300), 
('2025-08-20','Reliance',null)




WITH cte AS
(
    SELECT *,COUNT(price) OVER (PARTITION BY StockName ORDER BY DateKey) AS grp
    FROM Stocks
)
SELECT
    DateKey,
    StockName,
    MAX(price) OVER (PARTITION BY StockName, grp) AS Filled_Price
FROM cte
ORDER BY StockName, DateKey;
