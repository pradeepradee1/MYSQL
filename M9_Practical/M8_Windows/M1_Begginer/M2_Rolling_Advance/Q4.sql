/*

Total amount spent by that user in the last 3 calendar days (including current day)


Sample Input :

| transaction_id | user_id | transaction_date | amount |
| -------------- | ------- | ---------------- | ------ |
| 1              | 101     | 2025-08-01       | 100    |
| 2              | 101     | 2025-08-02       | 150    |
| 3              | 101     | 2025-08-03       | 200    |
| 4              | 101     | 2025-08-05       | 180    |
| 5              | 101     | 2025-08-06       | 90     |
| 6              | 101     | 2025-08-07       | 300    |
| 7              | 102     | 2025-08-01       | 80     |
| 8              | 102     | 2025-08-03       | 75     |
| 9              | 102     | 2025-08-04       | 95     |
| 10             | 102     | 2025-08-07       | 130    |

Excepeted output :

| user_id | transaction_date | amount | last_3_days_sum |
| ------- | ---------------- | ------ | --------------- |
| 101     | 2025-08-01       | 100    | 100             |
| 101     | 2025-08-02       | 150    | 250             |
| 101     | 2025-08-03       | 200    | 450             |
| 101     | 2025-08-05       | 180    | 380             |
| 101     | 2025-08-06       | 90     | 270             |
| 101     | 2025-08-07       | 300    | 570             |
| 102     | 2025-08-01       | 80     | 80              |
| 102     | 2025-08-03       | 75     | 155             |
| 102     | 2025-08-04       | 95     | 170             |
| 102     | 2025-08-07       | 130    | 130             |





*/

CREATE or replace TABLE transactions (
    transaction_id INT,
    user_id INT,
    transaction_date DATE,
    amount INT
);


INSERT INTO transactions (transaction_id, user_id, transaction_date, amount) VALUES
(1, 101, '2025-08-01', 100),
(2, 101, '2025-08-02', 150),
(3, 101, '2025-08-03', 200),
(4, 101, '2025-08-05', 180),
(5, 101, '2025-08-06', 90),
(6, 101, '2025-08-07', 300),
(7, 102, '2025-08-01', 80),
(8, 102, '2025-08-03', 75),
(9, 102, '2025-08-04', 95),
(10, 102, '2025-08-07', 130);



SELECT 
    user_id,
    transaction_date,
    amount,
    SUM(amount) OVER (PARTITION BY user_id ORDER BY transaction_date
        RANGE BETWEEN INTERVAL '2' DAY PRECEDING AND CURRENT ROW
    ) AS last_3_days_sum
FROM transactions

