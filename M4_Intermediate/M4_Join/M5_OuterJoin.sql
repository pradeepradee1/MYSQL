/*
OuterJoin
		
			1) Left  Join 
								: all the data from left table and only matched data from right table.
			2) Right Join 
								: all the data from right table and only matched data from left table.
			3) Full join 
								: matched data from both the tables
								: unmatched data from left tables
								: unmatched data from right tables
*/


#syntax:
select col1, col2,
from 
table_1 [left join / right join / full join] table_2
ON table1.pk=table2.fk;

#Left join
SELECT owners.owner_id , owners.owner, tools.tool
FROM `owners`
LEFT JOIN `tools` ON `owners`.`owner_id` = `tools`.`owner_id`

#Right Join
SELECT owners.owner_id,`owners`.`owner`, tools.tool
FROM `owners`
RIGHT JOIN `tools` ON `owners`.`owner_id` = `tools`.`owner_id`


