/*
1) Use regexp instead of LIKE
*/

#Like
SELECT 
	* 
FROM 
	regualr_emp 
where 
	ename like 'pr____p' or ename like 'v%' or ename like 'a_k' or ename like 'x%s'


#Regexp
SELECT * FROM regualr_emp 
where ename regexp 'p$|^v|a*k|x[a-z]{10}s'


/*
Join
2) Always order join from largest tables to smallest table
*/

select 
	*
From
	LargeTable 
Join
	SmallTable
on SmallTable.id = LargeTable.id

/*
Group By
3) Always group by the attribute with the largest number of unique entites
*/

select 
	*
From 
	Table  
group by  
	itemid,sub_cateory,main_cateory  


/*
4) Avoid SubQuery in where clause instead With clause
*/ 

#Avoid
select 
	*
From 
	Table 
where 
	itemid in (select itemid from table2)


#Use
with t2 as (select itemid from table2)
select  
	sum(price)
from 
	table as t1
join 
	t2 on t1.id = t2.id 

/*
5) Use Max instead of Rank 
*/

select 
	id ,max(prdate)
from 
	table1
group by 
	1

/*
6) Avoid unions
7) Use approx_distinct instead of count(distinct) for large data 
	# This is not supported in MYSQL
*/
