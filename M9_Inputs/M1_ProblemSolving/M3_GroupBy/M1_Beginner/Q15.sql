/*

Q : Count distinct users per day from a log table


| user\_id | log\_date  |
| -------- | ---------- |
| 1        | 2025-03-01 |
| 2        | 2025-03-01 |
| 1        | 2025-03-01 |
| 3        | 2025-03-02 |
| 2        | 2025-03-02 |
| 2        | 2025-03-02 |

OP as 


+----------+------------------+
| log_date | distinct_user_count |
+----------+------------------+
|2025-03-01| 2                |
|2025-03-02| 2                |
+----------+------------------+


*/


SELECT
    log_date,
    COUNT(DISTINCT user_id) AS distinct_user_count
FROM user_logs
GROUP BY log_date
ORDER BY log_date;

