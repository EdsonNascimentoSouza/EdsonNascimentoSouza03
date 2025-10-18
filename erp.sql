create database erp_db;
use erp_db;

Create table Categories(
categoryID INT primary key auto_increment,
Categoryname varchar(255) NOT NULL,
Description TEXT
);
select * from categories;


-- Table Categories
-- ---------------------------------------
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Categories.csv"
INTO TABLE Categories
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;                -- Ignora a linha de cabeçalhocategories

-- Customers 
-- --------------------
Create table Customers(
CustomersID INT primary key auto_increment,
CustomerName varchar(255),
ContactName varchar(255),
address varchar(255),
city varchar(255),
postalCode varchar(255), 
country varchar(255)
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv"
INTO TABLE Customers
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;                -- Ignora a linha de cabeçalhocategories
select * from Customers;

-- Employee
-- --------------------------------------
-- EmployeeID;LastName;FirstName;BirthDate;Photo;Notes

Create table Employees(
EmployeeID INT primary key,
LastName varchar(255),
FirstName varchar(255),
BirthDate varchar (255),
Photo varchar (255),
Notes text(255)
);
select * from Employees;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Employees.csv"
INTO TABLE Employees
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS                -- Ignora a linha de cabeçalhocategories
(EmployeeID,LastName,FirstName,@BirthDate,Photo,Notes)
set birthDate = str_to_date(@birthDate,"%d/%m/%Y");
select * from Employees;

-- OrderDetail
-- ------------------------------
Create table OrderDetail(
OrderDetailID INT primary key,
OrderID int,
ProductID int,
Quantity int

);
select * from OrderDetail;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/OrderDetails.csv"
INTO TABLE OrderDetail
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;                -- Ignora a linha de cabeçalhocategories

select * from OrderDetail;

-- Orders
-- -----------------------------------------------------

Create table Orders (
OrderID INT primary key,
CustomerID int,
EmployeeID int,
OrderDate varchar (255), 
ShipperID int

);
select * from Orders;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv"
INTO TABLE Orders
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS              -- Ignora a linha de cabeçalhocategories
(OrderID,CustomerID,EmployeeID,@OrderDate,ShipperID)
set OrderDate = str_to_date(@OrderDate,"%d/%m/%Y");
select * from Orders;


-- Products
-- -----------------------------------------------------

Create table Products (
ProductID varchar (255) primary key,
ProductNameID varchar (255),
SupplierID varchar (255),
CategoryID varchar (255), 
Unit int,
Price int

);
select * from Products;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Products.csv"
INTO TABLE Products
FIELDS TERMINATED BY ';'      -- Campos separados por vírgula
ENCLOSED BY ''                -- Não há delimitador de texto (aspas)
LINES TERMINATED BY '\n'
IGNORE 1 ROWS             -- Ignora a linha de cabeçalhocategories
(ProductID,ProductName,SupplierID,CategoryID,Unit,@Price)
set Price = replace(@Price,",",".");
select * from Products;