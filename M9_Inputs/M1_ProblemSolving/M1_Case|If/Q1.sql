# Questions	1	:
/*
					 8
					/ \
				   /   \
				  /     \
				 5	     9
				/ \     / \
			   1   4   2   3

We need to define (or) classification the node 
		
		for ex : 8 			is  root node
				 5,9		are Inner node
				 1,4,2,3    are leaf node




*/

/*
Here steps:	define inner node from the leaf node
		
Input Table		:	  node    parent  
						5       8       
						9		8		
						4		5      
						2       9	
						1       5	
						3       9      
						8       Null   


Output Table	:	  node    parent   classfication
						5       8        inner
						9		8		 inner
						4		5        leaf
						2       9		 leaf
						1       5		 leaf
						3       9        leaf
						8       Null     root			


*/



create table tree
(
    node int,
    parent int
);
	
insert into tree values (5,8),(9,8),(4,5),(2,9),(1,5),(3,9),(8,null);

select * from tree;

select node,
       CASE
            when node not in (select distinct parent from tree where parent is not null) then 'LEAF'
            when parent is null then 'ROOT'
            else 'INNER'
       END as node_type
from tree;


