--1 Query
Select e.ename,e.empno,e.sal,m.mgr_id,m.ename as managerName from EMP e, EMP m where e.mgr_id=m.empno
--2 Query
Select ename,sal from EMP where sal>1000
--3 Query
Select ename , sal from EMP where ename!='JAMES'
--4 Query
Select ename , sal from EMP where ename like 'S%'
--5 Query
Select ename , sal from EMP where ename like '%A%'
--6 Query
Select ename , sal from EMP where ename like '__L%'
--7 Query
Select ename,sal/30 as DailySal from EMP where ename='JONES'
--8 Query
Select Sum(Sal)as TotalMonthlySal from emp
--9 Query
Select avg(sal*12) as AvgAnnual from emp
--10 Query
select ename, job ,sal,deptno from emp where job !='SALESMAN' and deptno!=30
--11 Query
Select distinct deptno from Emp
--12 query
Select ename as Employee,sal as 'Monthly Salary' from emp where sal>1500 and deptno=10 or deptno=30
--13 Query
select ename, job ,sal from emp where job in ('MANAGER','ANALYST') and Sal not in (1000,3000,5000)
--14 Query
Select e.ename,m.sal,e.comm from EMP e,emp m where e.comm>m.sal+m.sal*.10 and e.empno=m.empno
--15 Query
Select ename from emp where ename like'%LL%' and deptno in (30) or mgr_id=7782
--17 Query
select d.dname,e.ename from EMP e full outer join DEPT d on e.deptno=d.deptno  order by d.dname, e.ename desc
--18 Query
Select DATEDIFF(year,(Select hiredate from emp where ename= 'MILLER'),(Select convert (varchar,GetDATE (),1))) As 'Miller Exp'
