CREATE DATABASE DWH_Project ;  

use Staging; 
USE DWH_Project ;

Select * FROM Sales_Order; 

-- Membuat Fact Table Sales Order -- 
drop table DimStatusOrder ; 

create table FactSalesOrder( OrderID int PRIMARY KEY NOT NULL,
							CustomerID int NOT NULL,
							ProductID int NOT NULL,
							Quantity int NOT NULL, 
							Amount int NOT NULL,
							StatusID int NOT NULL, 
							OrderDate date NOT NULL); 

-- Membuat Table Dimension -- 

CREATE TABLE DimCustomer(CustomerID INT Primary Key Not Null,
						CustomerName varchar(50) NOT NULL ,  
						Age int NOT NULL, 
						Gender varchar(50) NOT NULL , 
						City Varchar(50) NOT NULL,
						NoHP varchar(50) NOT NULL); 

CREATE TABLE DimProduct(ProductID INT Primary Key Not Null, 
						ProductName varchar(255) NOT NULL, 
						ProductCategory varchar(255) NOT NULL, 
						ProductUnitPrice INT); 

CREATE TABLE DimStatusOrder(StatusID INT Primary Key Not Null, 
						StatusOrder varchar(255) NOT NULL, 
						StatusOrderDesc varchar(255)NOT NULL); 

-- Membuat Foreign Key menggunakan Alter Table -- 

ALTER TABLE FactSalesOrder ADD CONSTRAINT FK_Product FOREIGN KEY (ProductID) References DimProduct(ProductID) ;
ALTER TABLE FactSalesOrder ADD CONSTRAINT FK_Status FOREIGN KEY (StatusID) References DimStatusOrder(StatusID) ;
ALTER TABLE FactSalesOrder ADD CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) References DimCustomer(CustomerID) ;

-- ---------------------------------------- --     

-- Create Stored Procedure -- 

CREATE PROCEDURE Summary_Order_Status @StatusID INT 
AS BEGIN
Select  a.OrderID, b.CustomerName, c.ProductName, a.Quantity, d.StatusOrder
from FactSalesOrder as a
JOIN Dimcustomer b on a.CustomerID = b.CustomerID
JOIN DimProduct as c on a.ProductID = c.ProductID
JOIN DimStatusOrder as d on a.StatusID = d.StatusID
WHERE d.StatusID = @StatusID ; 
END ; 

EXEC Summary_Order_Status @StatusID = 1 ; 


Select * FROM DimCustomer ;