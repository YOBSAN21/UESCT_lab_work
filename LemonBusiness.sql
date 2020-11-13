--create database
create database [Lemon Business]
--remove database
drop database [Lemon Business]

--create database with no space
CREATE DATABASE [LemonBusiness];
use LemonBusiness;

--rename the database
   EXEC sp_renamedb 'LemonBusiness', 'LemonBusinessDB';
 -- To create tables
 use LemonBusinessDB;
 Create table Customer(CustID varchar(10) primary key, CustFullName varchar(20) not null,Gender varchar(6), 
 Birthdate date, CustPhoneAddr Varchar(13) unique,HomeAddress varchar(50) not null);

 Create table BankAccount(AccNo varchar(10) primary key, 
			 CustId varchar(10) foreign key references Customer(CustId),
			AccountBalance float not null check(AccountBalance>50),BankBranchName varchar(20),
			CreatedDate date default getdate());

create table WithDrawal (WithDrawId int identity(1,1) primary key,
			AccNo varchar(10) foreign key references BankAccount(AccNo),
			CustId varchar(10) foreign key references Customer(CustId),
			WithDrawalAmount float not null check(WithDrawalAmount>0),
			WithDrawalDate date default getdate());

create table Deposite (DepositId int identity(1,10)primary key,
			AccNo varchar(10) foreign key references BankAccount(AccNo),
			CustId varchar(10) foreign key references Customer(CustId),
			AmountDeposited float not null check(AmountDeposited>0),
			DateDeposited date default getdate());

Create Table Category(CatId varchar(10) primary key, CategoryName varchar(20) unique,
					CategoryStatus varchar(1) default 0, CreatedDate date default getdate(),
					CatDescription varchar(100));

create table Product(PId varchar(10) primary key, Pname varchar(20) not null,
					CatId varchar(10) foreign key references Category(CatId),
					 UnitPrice float,ProductImage varchar(50),ProdStatus varchar(1),
					 datecreated date default getdate(),
					  PDescription varchar(100));

create table ProductDetail(PDetailId int identity(1,2) primary key,
						   PId varchar(10) foreign key references Product(PId),
						   Color varchar(10), Size varchar(10),
						   DetailImage varchar(50),
						   PDetailStatus varchar(1));
Create table ProductOrder(OrderId varchar(10) primary key, PId varchar(10) foreign key
							references Product(PId),CustId varchar(10) foreign key references
							Customer(CustId), OrderQty int, 
							TotalPrice float, OrderDate date default getdate(),
							OrderSatatus varchar(10));
--drop table ProductOrder;
 Create table Payment(PaymentCode int identity(0,100) primary key,
						OrderId varchar(10) foreign key references ProductOrder(OrderId),
						CustId varchar(10) foreign key references Customer(CustId), 
						AccNo varchar(10) foreign key references BankAccount(AccNo), 
						AmountPaid float not null check(AmountPaid>0),						
						DatePaid date default getdate());
--drop table Payment;

--To see the structure of the database sql server management studio 

--To see the structure of the a table
sp_help payment;



---Inserting Data in to the tables
Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c001','Getinet Yilma','M','1982-03-03','8612598562300','Old PhD 400-200-101');

Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c002','Geda','M','2002-03-03','8612598562311','Old PhD 400-200-1009');

Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c003','Tadiyos','M','2000-03-03','8612598000300','Masters Dorm 400-111-101');

Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c004','Mihilat','F','2000-03-03','8612598112300','Old PhD 400-200-101');

Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c005','Fisseha','M','1988-03-03','8612500562300','Old PhD 400-200-102');

Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c006','Bruk','M','2002-03-10','8612500062300','Old PhD 400-200-101');
Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c010','Almaz','F','2002-03-10','8012500062300','Old PhD 400-200-101');
Insert into Customer(CustID,CustFullName,Gender,Birthdate,CustPhoneAddr,HomeAddress) 
values('c0011','Chaltu','F','2002-03-10','8612505862300','New PhD 400-200-101');

Select * from Customer;

Insert into BankAccount(AccNo, CustId,AccountBalance ,BankBranchName ,CreatedDate)
values('A001','c001',5000,'Commercial Street','2019-01-01');


--multiple rows once
Insert into BankAccount(AccNo, CustId,AccountBalance ,BankBranchName ,CreatedDate)
values('A002','c002',5000,'Commercial Street','2019-01-01'),
('A003','c003',6000,'Commercial Street','2019-01-01'),
('A004','c004',6000,'Commercial Street','2019-01-01'),
('A005','c005',6000,'Commercial Street','2019-01-01'),
('A006','c006',6000,'Commercial Street','2019-01-01')




Insert into WithDrawal (WithDrawId ,AccNo ,CustId ,WithDrawalAmount,WithDrawalDate) values();


Insert into Deposite (DepositId ,AccNo ,CustId ,AmountDeposited,DateDeposite)values();


Insert into Category(CatId,CategoryName,CategoryStatus,CreatedDate,CatDescription) 
values('Cat007','blazers','1','2019-04-26','Mens Fashio'),
	  ('Cat002','Casual Shoes','1','2019-04-26','For Summer'),
	  ('Cat003','Smart Phone','1','2019-04-26','All IoS'),
	  ('Cat004','Kids Cloth','1','2019-04-26','Autumn and Summer'),
	  ('Cat005','Laptop','1','2019-04-26','All brand'),
	  ('Cat006','Kitchen Utencils','1','2019-04-26','Cookers and Plates')

Select * from Category;
Insert into Product(PId ,Pname,CatId,UnitPrice,ProductImage,ProdStatus,datecreated,PDescription)
values('p001','Blazer','Cat007',200,'Not set','1','2019-04-16','For Fashion')

Insert into Product(PId ,Pname,CatId,UnitPrice,ProductImage,ProdStatus,datecreated,PDescription)
values('p007','Shoes','Cat002',200,'Not set','1','2019-04-16','For Fashion'),
	  ('p002','Shoe','Cat002',200,'Not set','1','2019-04-16','For Fashion'),
	  ('p003','Iphone x','Cat003',200,'Not set','1','2019-04-16','Not Set'),
	  ('p004','T-Shirt','Cat004',120,'Not set','1','2019-04-16','Summer'),
	  ('p005','Hp Pro i5','Cat005',1500,'Not set','1','2019-04-16','Midium duty use'),
	  ('p006','Pressure Cooker','Cat006',100,'Not set','1','2019-04-16','Rice Cooker')
--select * from Product;

--brandname, model, manufacturerdetail

Insert into ProductOrder(OrderId,PId,CustId,OrderQty,TotalPrice,OrderDate,OrderSatatus) 
values('Or001','p002','c001',1,250,'2019-02-03','1'),
	  ('Or002','p004','c001',1,250,'2019-02-03','1'),
      ('Or003','p003','c001',1,1250,'2019-02-03','1'),
      ('Or004','p005','c001',1,3250,'2019-02-03','1'),
      ('Or005','p007','c001',1,250,'2019-02-03','1'),
      ('Or006','p002','c001',1,250,'2019-02-03','1')

Insert into ProductOrder(OrderId,PId,CustId,OrderQty,TotalPrice,OrderDate,OrderSatatus) 
values('Or007','p005','c003',1,20,'2019-02-03','1'),
	  ('Or008','p005','c003',1,250,'2019-02-03','1'),
      ('Or009','p005','c003',1,150,'2019-02-03','1'),	  
	   ('Or010','p005','c004',1,250,'2019-02-03','1'),
      ('Or011','p005','c004',1,150,'2019-02-03','1'),
	   ('Or012','p005','c005',1,250,'2019-02-03','1'),
      ('Or013','p005','c005',1,150,'2019-02-03','1')

--select * from ProductOrder;

Insert into Payment(OrderId ,CustId, AccNo , AmountPaid)
values('Or001','c001','A001',300),
	  ('Or002','c001','A001',300),
	  ('Or003','c001','A001',2300),
	  ('Or004','c001','A001',300),
	  ('Or005','c001','A001',300),
	  ('Or006','c001','A001',300)
select * from Payment;

--To see the structure of the table
Sp_help Payment;

--SQL Query
select * from Customer;
select Customer.* from Customer;
Select Customer.CustFullName as "Customer Full Name" from Customer;
	--select with where condition,like, between
select getdate() as 'Today';
select * from Customer where Customer.Birthdate between  '1980-02-02' and getdate();
Select BankAccount.AccountBalance from BankAccount where AccountBalance between 3500 and 5000;
select * from Customer where HomeAddress like 'O%'
select * from Customer where HomeAddress like '%PhD%'
select * from Customer where CustFullName like '[a-l]%'

--select sum, average, max , min and top
select *from BankAccount;
update BankAccount set BankBranchName='Paradise' where AccNo='A001';
update BankAccount set BankBranchName='Paradise' where AccNo='A002';
update BankAccount set BankBranchName='Xipu' where AccNo='A004';
update BankAccount set BankBranchName='Xipu' where AccNo='A005';
select *from BankAccount;
select max(accountBalance),min(accountBalance),sum(accountBalance), avg(accountBalance) from BankAccount;
	--select from multiple table

Select Accno,c.CustFullName, ba.AccountBalance, ba.BankBranchName 
from BankAccount as ba, Customer as c where ba.CustId=c.CustID

--like,between, in, group by, order by etc
	  
Select Accno,c.CustFullName, ba.AccountBalance, ba.BankBranchName 
from BankAccount as ba, Customer as c where ba.CustId=c.CustID order by ba.BankBranchName;
	
--Joins
select * from Customer inner join BankAccount on BankAccount.custid=customer.custid;
select * from Customer,BankAccount where BankAccount.custid=customer.custid;

select * from Customer left outer join BankAccount on BankAccount.custid=customer.custid;
select * from Customer right outer join BankAccount on BankAccount.custid=customer.custid;
select * from Customer Full outer join BankAccount on BankAccount.custid=customer.custid;
select * from Customer  cross join BankAccount ;

--Create View, procedure
create view FemaleCustomers
as
select * from Customer where Gender='F'


--drop view FemaleCustomers;
--select * from FemaleCustomers;


create procedure FemaleCustomers
as
select * from Customer where Gender='F'
return


--drop procedure FemaleCustomers;
--exec FemaleCustomers












--Permission

GRANT Select ON BankAccount TO usergate

GRANT All ON BankAccount TO Public

GRANT Select ON Withdrawal to Joe WITH GRANT OPTION

GRANT Select, Update ON Deposite to Guest

REVOKE All ON BankAccount FROM Public

DENY Select ON BankAccount TO Joe, Public
