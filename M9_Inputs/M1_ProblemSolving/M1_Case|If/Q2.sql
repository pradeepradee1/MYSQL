Create table If Not Exists Accountssp (account_id int, income int);

insert into Accountssp (account_id, income) values ('3', '108939');
insert into Accountssp (account_id, income) values ('2', '12747');
insert into Accountssp (account_id, income) values ('8', '87709');
insert into Accountssp (account_id, income) values ('6', '91796');

select * from Accountssp

/*
OutPut:
		LowSalary		1
		AverageSalary	0
		HighSalary		3

*/

select 'LowSalary' as category , count(*) as Accountssp from Accountssp where income < 20000
union 
select 'AverageSalary' as category , count(*) as Accountssp from Accountssp where income > 20000 and income <=50000
union
select 'HighSalary' as category , count(*) as Accountssp from Accountssp where income >=50000
