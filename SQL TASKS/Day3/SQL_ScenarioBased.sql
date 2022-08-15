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
--Query 
Select Distinct(Gender),count(Gender) from Studentdetails group by Gender

--8
--Query
Select cd.c_name, count(cr.RegisterNo) from Coursedetails cd, CourseRegistration cr where cd.cid=cr.cid group By c_name Order By c_name desc

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
Select REVERSE(name),UPPER(location) from studentdetails

--11 Query
Create view [Details] as
Select ProductName,Quantity,OrderNumber From Product p join orderitem oi on p.id=oi.productid 
join order o on o.id=oi.orderid

--12 Query
Select C_name from coursedetails cd join courseregistration cr on cd.c_id=cr.c_id join
studetdetails sd on sd.registerno=cr.registerno where name='Nisha'