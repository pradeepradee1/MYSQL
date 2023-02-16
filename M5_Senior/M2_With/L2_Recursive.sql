#recursive
--- Write a Query to generate numbers from 1 to 10 in SQL

with recursive generate_numbers as   
(
  select 1 as n -- Ancher Query (Starting Point)
  union 
  select n+1 from generate_numbers where n<10 -- generate_numbers is rescursice call 
) 
select * from generate_numbers;

/*

select 1 
union
select 1+1 from generate_numbers where n<10

union
select 2+1 from generate_numbers where n<10

union
select 3+1 from generate_numbers where n<10

*/

/*

s1={a,b,c,d}
s2={x,y,z,c,b}

#Union 
{a,b,c,d,x,y,z}

*/