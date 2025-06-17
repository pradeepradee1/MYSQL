| id | parent\_id  |
| -- | ----------  |
| 1  | NULL        |
| 2  | 1           |
| 3  | 1 		   |	        
| 4  | 2           |
| 5  | 2           |




| id | parent\_id | name    
| -- | ---------- | ------- 
| 1  | NULL       | Root    
| 2  | 1          | Branch1 
| 3  | 1          | Branch2 
| 4  | 2          | Leaf1   
| 5  | 2          | Leaf2   




#Query

SELECT 
    t.id,
    t.name,
    t.parent_id,
    CASE 
        WHEN t.parent_id IS NULL THEN 'Root'
        WHEN t.id NOT IN (SELECT DISTINCT parent_id FROM tree WHERE parent_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS node_type
FROM tree t;
