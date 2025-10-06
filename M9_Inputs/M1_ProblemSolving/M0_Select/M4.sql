/*

Questions : Your task is to calculates the percentage contribution of each product's sales relative to the 
total sales of that store

data = [
    ("S1", "P1", 100), 
    ("S1", "P2", 200),
    ("S1", "P3", 300), 
    ("S2", "P1", 400),
    ("S2", "P2", 100), 
    ("S2", "P3", 500)
]


*/



SELECT
    store,
    product,
    sales,
    ROUND(sales * 100.0  / SUM(sales) OVER(PARTITION BY store), 2) AS pct_contribution
FROM sales_data;

