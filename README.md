# CP363-Assignment-5-

This is the source code for a database I created using phpMyAdmin for my CP363- Database I course at Wilfrid Laurier University in the fall of 2024.  

This database was created in Boyce-Codd Normal Form, which ensures that:
1) Each table has a primary key.
2) Every attribute is functionally dependent on the whole primary key and nothing else.
3) There are no transitive dependencies.

The following tables are in this clothing store's database:

Customers
------------
CustomerID char(10)
IsMember tinyint(1)

Employees 
----------
EmployeeID int 
EmployeeSIN int 
FirstName varchar(50)
LastName varchar(50)
Position varchar(50)
Salary decimal(10,2)
HireDate datetime

ItemCategory 
-------------
CategoryID int 
CategoryName varchar(100)
CategoryType char(1)

Items 
-----------
ItemID int 
ItemName varchar(50)
Price decimal(10,2) 
CategoryID int 
Size char(3)
Color varchar(50)
Description longtext

Members 
------------
MemberID int
CustomerID char(10)
MembershipStartDate date 
MembershipEndDate date
FirstName varchar(50) 
LastName varchar(50) 
Email varchar(100)
Phone varchar(20)

Purchases
----------
PurchaseID int
CustomerID char(10) 
ItemID int
EmployeeID int
PurchaseDate datetime 
Quantity int 
TotalPrice decimal(10,2) 




