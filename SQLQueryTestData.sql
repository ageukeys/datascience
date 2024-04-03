--create database TestData;

--use TestData


CREATE TABLE dbo.Products
(
	ProductID INT PRIMARY KEY NOT NULL,
	ProductName VARCHAR(25) NOT NULL,
	Price MONEY NULL,
	ProductDdescription TEXT NULL
)

GO


INSERT dbo.Products (ProductID, ProductName, Price, ProductDdescription)
VALUES(1,'Clamp',12.48,'Worbench clamp')
GO


INSERT dbo.Products (ProductName, ProductID, Price, ProductDdescription)
VALUES('Screwdriver',50,12.48,'Flat head')
GO

INSERT dbo.Products 
VALUES(75,'Tire Bar',null,'Tool for changing tires.')
GO

INSERT dbo.Products (ProductID, ProductName, Price)
VALUES(3000,'Screwdriver',.52)
GO

UPDATE dbo.Products
	SET	ProductName = 'Flat Head Screwdriver' 
	WHERE ProductID = 50
GO

SELECT ProductID, ProductName, Price, ProductDdescription FROM Products

SELECT * FROM Products

SELECT ProductName, Price 
FROM dbo.Products
GO

SELECT * FROM dbo.Products WHERE ProductID < 60 
GO

SELECT * FROM dbo.Products WHERE ProductID > 60 
GO
SELECT ProductName,  Price FROM Products
SELECT ProductName,  Price * 1.07 FROM Products


---============================================

--CRIANDO VIEWS

--=============================================

CREATE VIEW vw_Names
	AS
	SELECT ProductName, Price FROM Products;
GO

SELECT * FROM vw_Names

--=============================================
--CRIANDO PROCEDURES
--=============================================

CREATE PROCEDURE pr_Names @VarPrice MONEY
	AS
	BEGIN
		PRINT 'product less than' + CAST(@VarPrice AS VARCHAR(10));
		SELECT ProductName, Price FROM vw_Names
			WHERE Price < @VarPrice;
	END
GO

EXECUTE pr_Names 10.00
GO