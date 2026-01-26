/*
# Question :

# get the maximum count in Payment_Mehtod method

# Note :
# 		 Nested group by clause code using the case (elif) statement
*/


-- mydb.check1 definition

CREATE TABLE `Temp` (
  `CID` int(11) DEFAULT NULL,
  `Month` varchar(50) DEFAULT NULL,
  `Payment_Mehtod` varchar(80) DEFAULT NULL
) 


INSERT INTO Temp (CID, `Month`, Payment_Mehtod) VALUES
(100, 'OCT_2024', 'Cash_method'),
(100, 'NOV_2024', 'Cash_method'),
(100, 'DEC_2024', 'Cash_method'),
(100, 'JAN_2025', 'Cash'),
(100, 'FEB_2025', 'cash'),
(101, 'OCT_2024', 'Digital'),
(101, 'NOV_2024', 'Cash'),
(101, 'DEC_2024', 'Cash'),
(101, 'JAN_2025', 'Cash'),
(101, 'FEB_2025', 'online'),
(102, 'OCT_2024', 'Online'),
(102, 'NOV_2024', 'Online'),
(102, 'DEC_2024', 'Online'),
(102, 'JAN_2025', 'Online'),
(102, 'FEB_2025', 'Online'),
(103, 'OCT_2024', 'Cheque'),
(103, 'NOV_2024', 'Cheque'),
(103, 'DEC_2024', 'Cheque'),
(103, 'JAN_2025', 'Online'),
(103, 'FEB_2025', 'cheque'),
(104, 'OCT_2024', 'Online'),
(104, 'NOV_2024', 'Digital_Method'),
(104, 'DEC_2024', 'Digital_Method'),
(104, 'JAN_2025', 'Digital_Method'),
(104, 'FEB_2025', 'Digital_Method'),
(105, 'OCT_2024', 'Online'),
(105, 'NOV_2024', 'Online'),
(105, 'DEC_2024', 'Digital'),
(105, 'JAN_2025', 'Online'),
(105, 'FEB_2025', 'Online');

/*

#Sample Output :
			
				CID 	payment_check_method
				100				12
*/

select * from Temp;



Select CID,max(cnt) from
(select 
	CID,
	Payment_Mehtod,
	CASE 
		when Payment_Mehtod  in ("CASH","Cash_method") then 1
		when Payment_Mehtod = "Cheque" then 2
		when Payment_Mehtod in ("Digital","Digital_Method") then 3
		when Payment_Mehtod = "online" then 4
	END as classify,
	count(*) as cnt
from 
	Temp
group by classify
) tmp

