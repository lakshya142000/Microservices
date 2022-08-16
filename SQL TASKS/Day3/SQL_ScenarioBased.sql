--1
Create table Book(
id int primary key,
title varchar(30),
author varchar(30),
isbn bigint unique,
published_date datetime)

insert into book values(1,'My First SQL book','Mary Parker',981483029127,'2012-02-22 12:08:17')
insert into book values(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45')
insert into book values(3,'My Third SQL book','Cary Flint',523120967812,'2015-10-18 14:05:44')


Select * from Book where author  like '%er'

--2

Create Table Reviews(
id int,
book_id int references Book(id),
reviewer_name varchar(30),
content varchar(30),
rating int,
published_date datetime)

insert into Reviews values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11')
insert into Reviews values(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12')
insert into Reviews values(3,2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

Select b.title,b.author,r.reviewer_name from Book b, Reviews r where b.id=r.book_id

--3
Select reviewer_name,count(reviewer_name) as review_count from Reviews  group by reviewer_name having count(reviewer_name)>1

--4 
Create table customer (
id int ,name varchar(30),age int,address varchar(30),salary float)

insert into customer values(1,'Ramesh',32,'Ahmedabad',2000.00)
insert into customer values(2,'Khilan',25,'Delhi',1500.00)
insert into customer values(3,'Kaushik',23,'Kota',2000.00)
insert into customer values(4,'Chaitali',25,'Mumbai',6500.00)
insert into customer values(5,'Hardik',27,'Bhopal',8500.00)
insert into customer values(6,'Komal',22,'MP',4500.00)
insert into customer values(7,'Muffy',24,'Indore',10000.00)

select * from customer where address like'%o%'

--5
Create table orders(
oid int , date datetime,customer_id int ,amount int)

insert into orders values(102,'2009-10-08 00:00:00',3,3000)
insert into orders values(100,'2009-10-08 00:00:00',3,1500)
insert into orders values(101,'2009-11-20 00:00:00',2,1560)
insert into orders values(103,'2008-05-20 00:00:00',4,2060)

select date ,count(customer_id) as cust_count from orders group by date

--6
Create table Employee (
id int ,name varchar(30),age int,address varchar(30),salary float)

insert into Employee values(1,'Ramesh',32,'Ahmedabad',2000.00)
insert into Employee values(2,'Khilan',25,'Delhi',1500.00)
insert into Employee values(3,'Kaushik',23,'Kota',2000.00)
insert into Employee values(4,'Chaitali',25,'Mumbai',6500.00)
insert into Employee values(5,'Hardik',27,'Bhopal',8500.00)
insert into Employee(id,name,age,address) values(6,'Komal',22,'MP')
insert into Employee(id,name,age,address)  values(7,'Muffy',24,'Indore')

Select Lower(name) from Employee where salary is null

--7
create table StudentDetails(
       registerNo int primary key,
	   studName varchar(30),
	   age int,
	   qualification varchar(30),
	   mobileNo bigint,
	   mail_id varchar(30),
	   loc varchar(30),
	   gender varchar(6)
)

insert into StudentDetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

Select Distinct(Gender),count(Gender) from Studentdetails group by Gender

--8
create table CourseDetails(
       cId varchar(30) primary key,
	   cName varchar(30),
	   startDate date,
	   endDate date,
	   fee float
)

insert into CourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

create table CourseRegistration(
	registerNo int references StudentDetails(registerNo),
	cId varchar(30) references CourseDetails(cId),
	batch varchar(30)
	primary key(registerNo,cId)
)

insert into CourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

Select cd.cname, count(cr.RegisterNo) as studentCount from Coursedetails cd, CourseRegistration cr where cd.cid=cr.cid group By cname Order By cname desc

--9 
Create Table Customer2 (Cutomer_id int, First_name varchar(30),Last_name Varchar(30))
insert into Customer2 values(1,'George','Washington')
insert into Customer2 values(2,'John','Adams')
insert into Customer2 values(3,'Thomas','Jefferson')
insert into Customer2 values(4,'James','Madison')
insert into Customer2 values(5,'James','Monroe')

Create table order1 (order_id int ,order_date date,amount float,customer_id int)

insert into order1 values(1,'07/04/1776',234.56,1)
insert into order1 values(2,'03/14/1760',78.50,3)
insert into order1 values(3,'05/23/1784',124.00,2)
insert into order1 values(4,'09/03/1790',65.50,3)


Select c.First_name,c.Last_name,count(o.customer_id) from customer2 c ,order1 o where c.Cutomer_id=o.customer_id group by c.First_name,c.Last_name
having count(o.customer_id)=2

--10 Query
Select REVERSE(studName),UPPER(loc) from studentdetails

--11 Query
Create view [Details] as
Select ProductName,Quantity,OrderNumber From Product p join orderitem oi on p.id=oi.productid 
join order o on o.id=oi.orderid

--12 Query
Select Cname from coursedetails cd join courseregistration cr on cd.cid=cr.cid join
StudentDetails sd on sd.registerNo=cr.registerno where studname='Nisha'
