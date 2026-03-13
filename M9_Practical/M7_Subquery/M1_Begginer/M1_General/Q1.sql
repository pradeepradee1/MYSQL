/*

Question :
what is maximum count of Payment_Mehtod ?

	(or)

find the dominant / consistent payment method ?

*/


-- mydb.check1 definition

CREATE or replace TABLE `Temp` (
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

Expected Output :

	Payment_Mehtod		count
		Online			  12

*/

select * from Temp;



Select Payment_Method_Clean,count(*) from
(SELECT 
    CID,
    Month,
    CASE 
        WHEN LOWER(Payment_Mehtod) LIKE '%cash%' THEN 'Cash'
        WHEN LOWER(Payment_Mehtod) LIKE '%online%' THEN 'Online'
        WHEN LOWER(Payment_Mehtod) LIKE '%digital%' THEN 'Digital'
        WHEN LOWER(Payment_Mehtod) LIKE '%cheque%' THEN 'Cheque'
    END AS Payment_Method_Clean
FROM Temp
) tmp 
group by Payment_Method_Clean
order by count(*) desc
limit 1
