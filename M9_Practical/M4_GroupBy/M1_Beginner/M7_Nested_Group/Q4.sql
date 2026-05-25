/*
Q: 
Find Difference Between no. of apples amd no. of orranges sold each day


Sample Output:

		2020-05-01	apples	2
		2020-05-02	apples	0
		2020-05-03	apples	20
		2020-05-04	apples	-1



*/




CREATE or replace TABLE Temp (sale_date date,fruit ENUM ('apples','oranges')NULL, sold_num int);

desc Temp


-- CREATE TABLE fruit_baskets( AS ENUM ('apples','oranges'));

-- Create table If Not Exists Temp (sale_date date, fruit fruit_baskets, sold_num int);

insert into Temp (sale_date, fruit, sold_num) values ('2020-05-01', 'apples', 10);
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-01', 'oranges', '8');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-02', 'apples', '15');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-02', 'oranges', '15');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-03', 'apples', '20');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-03', 'oranges', '0');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-04', 'apples', '15');
insert into Temp (sale_date, fruit, sold_num) values ('2020-05-04', 'oranges', '16');



select * from Temp


select 
	sale_date,
	fruit,
	max(sold_num) - min(sold_num) as diff
from 
	Temp
group by 
	sale_date 


# Right Approach
select 
	*,
	sum(if(fruit="apples",sold_num,0))  - sum(if(fruit="oranges",sold_num,0)) as difference
from 
	Temp
group by sale_date



select 
	 sale_date ,
	 diff
from 
	(
		select *,sold_num - lead(sold_num,1) over(PARTITION by sale_date) as diff from Temp
	) tmp 
where fruit = 'apples'
order by sale_date
