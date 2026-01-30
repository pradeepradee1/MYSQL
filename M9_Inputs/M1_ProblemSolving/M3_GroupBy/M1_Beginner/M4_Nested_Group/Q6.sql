/*

Question : We need to find the Net balance

Input : 

| txn_id | user_id | type   | amount |
| ------ | ------- | ------ | ------ |
| 1      | U1      | CREDIT | 1000   |
| 2      | U1      | DEBIT  | 200    |
| 3      | U1      | DEBIT  | 300    |
| 4      | U2      | CREDIT | 1500   |
| 5      | U2      | DEBIT  | 500    |



Excepted Output :

| user_id | net_balance |
| ------- | ----------- |
| U1      | 500.00      |
| U2      | 1000.00     |



*/


CREATE or replace TABLE Temp (
    txn_id INT,
    user_id VARCHAR(10),
    type ENUM('CREDIT', 'DEBIT'),
    amount DECIMAL(10,2)
);


INSERT INTO Temp (txn_id, user_id, type, amount)
VALUES
(1, 'U1', 'CREDIT', 1000),
(2, 'U1', 'DEBIT', 200),
(3, 'U1', 'DEBIT', 300),
(4, 'U2', 'CREDIT', 1500),
(5, 'U2', 'DEBIT', 500);


SELECT 
    user_id,
    SUM(CASE 
	    	 WHEN type = 'CREDIT' THEN amount 
             WHEN type = 'DEBIT' THEN -amount 
             ELSE 0 
        END) AS net_balance
FROM 
    transactions3
GROUP BY 
    user_id;

/*

It is working like this

a-=1 or a=a-amount


hashmap = {}

for row in Temp:
    if row.type == 'CREDIT':
        value = row.amount
    elif row.type == 'DEBIT':
        value = -row.amount
    else:
        value = 0

    if row.user_id not in hashmap:
        hashmap[row.user_id] = 0

    hashmap[row.user_id] += value

return hashmap



*/