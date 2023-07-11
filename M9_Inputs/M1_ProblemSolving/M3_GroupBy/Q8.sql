CREATE or replace TABLE spSales (sale_date date,fruit ENUM ('apples','oranges')NULL, sold_num int);

desc spSales


-- CREATE TABLE fruit_baskets( AS ENUM ('apples','oranges'));

-- Create table If Not Exists spSales (sale_date date, fruit fruit_baskets, sold_num int);

insert into spSales (sale_date, fruit, sold_num) values ('2020-05-01', 'apples', 10);
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-01', 'oranges', '8');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-02', 'apples', '15');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-02', 'oranges', '15');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-03', 'apples', '20');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-03', 'oranges', '0');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-04', 'apples', '15');
insert into spSales (sale_date, fruit, sold_num) values ('2020-05-04', 'oranges', '16');


/*

Q: Find Difference Between no. of apples amd no. of orranges sold each day

OP:

		2020-05-01	apples	2
		2020-05-02	apples	0
		2020-05-03	apples	20
		2020-05-04	apples	1



*/



select 
	sale_date,
	fruit,
	max(sold_num) - min(sold_num) as diff
from 
	spSales
group by 
	sale_date 




select 
	 sale_date ,
	 diff
from 
	(
		select *,sold_num - lead(sold_num,1)
		over(PARTITION by sale_date) as diff from spSales
	) tmp 
where fruit = 'apples'
order by sale_date
