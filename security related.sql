-- Passing Data to Stored Procedures
go
CREATE PROCEDURE ProductCategorty
  (@categoryname NVARCHAR(35))
AS
SELECT p.Pname,c.CategoryName, p.UnitPrice
  FROM dbo.Product as p, dbo.Category as c
  WHERE c.CatId=p.CatId and c.CategoryName = @categoryname;
go

-- To execute
exec ProductCategorty 'Laptop'




----drop procedure ProductCategort;


select * from Category

--encypt the database schema object 
create procedure allCust
	as
	select * from Customer;
	return
	go
	
					exec allCust;
	

----encrypting a procedure
alter procedure allCust
	with encryption
	as
		select * from Customer;


sp_helptext allCust


--drop procedure allCust


----Full Audit

USE LemonBusinessDB;
CREATE TABLE dbo.Audit (
  AuditID UNIQUEIDENTIFIER RowGUIDCol  NOT NULL 
    CONSTRAINT DF_Audit_AuditID DEFAULT (NEWID())
    CONSTRAINT PK_Audit PRIMARY KEY NONCLUSTERED (AuditID),
  AuditDate DATETIME NOT NULL,
  SysUser VARCHAR(50) NOT NULL,
  Application VARCHAR(50) NOT NULL,
  TableName VARCHAR(50)NOT NULL,
  Operation CHAR(10) NOT NULL, 	
  PrimaryKey VARCHAR(50) NOT NULL,
  RowDescription VARCHAR(50) NULL,
  SecondaryRow VARCHAR(50) NULL,
  [Column] VARCHAR(50) NOT NULL,
  OldValue VARCHAR(50) NULL,
  NewValue VARCHAR(50) NULL
)

--drop table Audit

CREATE TRIGGER BankAccountAudit
ON dbo.BankAccount
AFTER Insert, Update
NOT FOR REPLICATION
AS
DECLARE @Operation CHAR(10)

IF EXISTS(SELECT * FROM Deleted)
 SET @Operation = 'Update'
ELSE 
 SET @Operation = 'Insert'
IF UPDATE(BankBranchName) 
    INSERT dbo.Audit 
      (AuditDate, SysUser, Application, TableName, Operation, 
       PrimaryKey, RowDescription, SecondaryRow, [Column], 
       OldValue, NewValue) 
      SELECT GetDate(), suser_sname(), APP_NAME(), 'BankAccount', @Operation,
          Inserted.AccNo, Inserted.BankBranchName, NULL, 'AccNo',Deleted.BankBranchName,Inserted.BankBranchName
        FROM Inserted,Deleted
   else if UPDATE(AccountBalance)  
		INSERT dbo.Audit 
      (AuditDate, SysUser, Application, TableName, Operation, 
       PrimaryKey, RowDescription, SecondaryRow, [Column], 
       OldValue, NewValue) 
       SELECT GetDate(), suser_sname(), APP_NAME(), 'BankAccount', @Operation,
          Inserted.AccNo, Inserted.BankBranchName, NULL, 'AccNo',Deleted.AccountBalance,Inserted.AccountBalance
        FROM Inserted,Deleted

--drop trigger BankAccountAudit;

update BankAccount set
 AccountBalance=AccountBalance+200 where AccNo 'A001';
select * from BankAccount
update BankAccount set BankBranchName='Town' where AccNo='A001';

	 
select * from   Audit;  

--delete from Audit;

/* transction */
begin

update BankAccount 
set AccountBalance=AccountBalance-150
where AccNo='A001'
insert into WithDrawal (AccNo,CustId,WithDrawalAmount)
values('A001','c001',150);

update BankAccount set AccountBalance=AccountBalance+150
where AccNo='A002'
insert into Deposite (AccNo,CustId,AmountDeposited)
values('A002','c002',150)

commit tran






SELECT * from sys.server_principals 


-- SQL Server Logins
EXEC sp_addlogin 'uestc', '123', 'LemonBusinessDB'
EXEC sp_addlogin 'Sam', '123', 'LemonBusinessDB'


EXEC sp_helplogins

SELECT Name, SID 
  FROM sys.server_principals 
 
-- Updating a Password
EXEC sp_password 'myoldpassword', 'mynewpassword', 'Sam'

-- Removing a Login
EXEC sp_droplogin 'Sam'

-- Setting the default db
EXEC sp_defaultdb 'Sam', 'LemonBusinessDB'

----------------------------------------------------------
-- Database Security

-- Guest Logins
EXEC sp_adduser 'Guest'


-- Granting Access Using T-SQL Code
USE LemonBusinessDB

EXEC sp_grantdbaccess 'Gate_PC\sa', '123'

EXEC sp_revokedbaccess 'LRN'

-- Fixed Database Roles

EXEC sp_addsrvrolemember  'gate-PC\uestc', 'sysadmin'

-- Droppign a user from a server fixed role

EXEC sp_dropsrvrolemember  'gate-PC\uestc', 'sysadmin'

SELECT pm.name, pr.name 
  FROM sys.server_principals pm
    JOIN sys.server_role_members rm
      ON pm.Principal_ID = rm.member_principal_id
    JOIN sys.server_principals pr
      ON pr.Principal_ID = rm.role_principal_id


-- Testing conflicting database roles 
EXEC sp_addlogin 'Joe'
USE master
EXEC sp_grantdbaccess 'Joe'

-----------------------------------------------------------
-- Object Security
-- Setting Object Permissions
USE LemonBusinessDB
GRANT Select ON BankAccount TO Joe

GRANT All ON BankAccount TO Public

GRANT Select ON Withdrawal to Joe WITH GRANT OPTION

GRANT Select, Update ON Deposite to Guest

REVOKE All ON BankAccount FROM Public

DENY Select ON BankAccount TO Joe, Public









-- Managing Standard Roles

EXEC sp_addrole 'Manager'

EXEC sp_droprole 'Manager'

EXEC sp_addrolemember 'Manager', Joe

EXEC sp_dropRoleMember  'Manager', Joe


-- Ownership

EXEC sp_changeobjectowner Customer, Joe
