/*

Materialized view :

                1) A Materialized View is a precomputed, stored result of a query
                2) It is physically stored like a table.
                3) Unlike a regular view (It doesn't store data, saved SQL query and fetches fresh data each time), 
                4) This improves performance, especially for complex aggregations or joins.

*/

-- Materialized View
CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(amount) AS total_sales
FROM sales
GROUP BY DATE_TRUNC('month', order_date);
