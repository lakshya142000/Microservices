create DataBase SQL_assignments
use SQL_assignments

Create Table DEPT(
	deptno int primary key,
	dname Varchar(20),
	loc Varchar(20)
	) 

Create Table EMP (empno int primary key,
	ename Varchar(20),
	job Varchar(20),
	mgr_id int,
	hiredate  Varchar(30), 
	sal int,
	comm int,
	deptno int references DEPT(deptno)
	)

Insert into DEPT Values(10, 'ACCOUNTING' ,'NEW YORK'),
	(20 ,'RESEARCH', 'DALLAS'),
	(30 ,'SALES', 'CHICAGO' )




Insert into EMP(empno, ename, job, mgr_id,hiredate,sal,deptno)  Values(7369,'SMITH', 'CLERK',7902,'17-DEC-80', 800,20)
Select * From EMP