/*

CREATE TABLE Temp (
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


*/

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

