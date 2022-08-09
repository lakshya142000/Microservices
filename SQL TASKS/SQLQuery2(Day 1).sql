--1 Query
Select * From EMP where ename like 'A%'
--2 Query
select * from EMP where mgr_id is null
--3 Query
Select ename, empno,sal from EMP where sal  between 1200 and 1400
--4 Query
Select sal as oldsal, sal+(0.10*sal) as newsal from EMP where deptno=20
--5 Query
Select count(*) as ClerkCount from EMP where job='CLERK'
--6 Query 
Select (Select avg(sal) from EMP where job='CLERK') as Clerkavg,
		(Select avg(sal) from EMP where job='SALESMAN') as SALESMANavg,
		(Select avg(sal) from EMP where job='MANAGER') as MANAGERavg
		from EMP
--7 Query
Select * from EMP where sal=(Select max(sal) from EMP) or sal=(Select min(sal) from EMP)
--8 Query
Select * From DEPT where deptno=40
--9 Query
Select ename,sal from EMP where job='ANALYST' and sal>=1200 and deptno=20 order by ename
--10 Query
--11 Query
Select ename,sal from EMP where ename='MILER' or ename='SMITH'
--12 Query
Select ename From EMP where ename like 'A%' or ename like 'M%'
--13 Query
Select ename , sal*12 as YearlySal from EMP where ename='SMITH'
--14 Query
Select ename,sal from EMP where sal not between 1500 and 2850