Create or replace table  Temp1 (name varchar(50), product_id int, units int);

insert into Temp1 (name, product_id, units) values ('LCHouse1', '1', '1');
insert into Temp1 (name, product_id, units) values ('LCHouse1', '2', '10');
insert into Temp1 (name, product_id, units) values ('LCHouse1', '3', '5');
insert into Temp1 (name, product_id, units) values ('LCHouse2', '1', '2');
insert into Temp1 (name, product_id, units) values ('LCHouse2', '2', '2');
insert into Temp1 (name, product_id, units) values ('LCHouse3', '4', '1');

Create or replace table  Temp2 (product_id int, product_name varchar(50), Width int,Length int,Height int);

insert into Temp2 (product_id, product_name, Width, Length, Height) values ('1', 'LC-TV', '5', '50', '40');
insert into Temp2 (product_id, product_name, Width, Length, Height) values ('2', 'LC-KeyChain', '5', '5', '5');
insert into Temp2 (product_id, product_name, Width, Length, Height) values ('3', 'LC-Phone', '2', '10', '10');
insert into Temp2 (product_id, product_name, Width, Length, Height) values ('4', 'LC-T-Shirt', '4', '10', '20');


select * from Temp1;
select * from Temp2;



#Question : How much cubic of volume does the inventry occupy in each warehouse ?

#Note : 
#		Volume = Consumed ex :  cylinder (gas cylinder) consume volume of gas 
#						  ex :  Sump
#		Area   = Space	  ex :  10 * 10 feet space in 100 square feet area


/*
	Area Of Circle	:   πr2	
	
	Area Of Square	:	a*a

*/


/*

Volume of Cylinder		:   V = πr2h  ( Area Of Circle: πr2	)

Volume of Cube			:	V = a * a * a (Area of square : a*a)

Volume of Rectangular 	:   V = l × w × h	
	 				


*/


/*
| name     | product_id | units |
| -------- | ---------: | ----: |
| LCHouse1 |          1 |     1 |
| LCHouse1 |          2 |    10 |
| LCHouse1 |          3 |     5 |
| LCHouse2 |          1 |     2 |
| LCHouse2 |          2 |     2 |
| LCHouse3 |          4 |     1 |

| product_id | product_name | width | length | height |
| ---------: | ------------ | ----: | -----: | -----: |
|          1 | LC-TV        |     5 |     50 |     40 |
|          2 | LC-KeyChain  |     5 |      5 |      5 |
|          3 | LC-Phone     |     2 |     10 |     10 |
|          4 | LC-T-Shirt   |     4 |     10 |     20 |


Output:		
		 Name        Volume	
		LCHouse1	 12250
		LCHouse2	 20250
		LCHouse3	 800
*/

select
	w.name ,
	sum(w.units),
	sum(w.units * (p.Width * p.`Length` * p.Height)) as volume
from 
	Warehouse w
inner join Products p on w.product_id = p.product_id 
group by w.name 
