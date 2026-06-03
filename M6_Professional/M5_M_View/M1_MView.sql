/*

Materialized view :

                IT is a database object
                It is a physically table
                It is stored result of a query

          How data is getting  refresh?
                Needs manual intervention to refresh the data  from table
                
                It is Performance Optimization techniques
                
                It is used for performance
                
*/

-- Materialized View
CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(amount) AS total_sales
FROM sales
GROUP BY DATE_TRUNC('month', order_date);
