# Questions	1	: Decision Tree Classifier
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


Output Table	:	  node     classfication
						5          	inner
						9	 		inner
						4		   	leaf
						2     	 	leaf
						1     	 	leaf
						3           leaf
						8          	root			


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


