--1) AVG

			select avg(sal) as AvgCostOfProduct from emp
			
			select avg(sal) as AvgCostOfProduct from emp
			where ename  like 'A';



--2) COUNT

			select count(dno) from emp where dno is not null;
			
			-- Count Of Records
			
			select count(*) from emp where dno=10;


--3) MAX

			select max(sal) from emp where ename='A';
			
			-- select * from emp where sal=max(sal);-----WRONG
			
			select * from emp where sal IN(select max(sal) from emp);


--4) MIN

			select * from emp where sal IN(select min(sal) from emp);


--5) SUM

			select sum(sal) from emp;


