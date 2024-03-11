/*
Question : report the movies id with odd-numbered and a desctiption that is not boring



OP:
		
		1	War	great 	3D				9
		5	House card	Interesting		9



*/

select * from pdcinema


select 
	* 
from 
	pdcinema
where id%2 <>0 and description <> 'boring'
order by rating desc