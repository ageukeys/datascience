use AdventureWorks2017
SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables 
		where table_catalog = 'AdventureWorks2017' 
		and table_schema = 'Sales';
SELECT * FROM HumanResources.EmployeePayHistory;
SELECT * FROM Sales.SalesOrderHeaderSalesReason;
SELECT * FROM Sales.SalesPerson;
SELECT * FROM Production.Illustration;
SELECT * FROM Production.Location;
SELECT * FROM Sales.SalesPersonQuotaHistory;
SELECT * FROM Sales.Customer;
SELECT * FROM Production.Product;
SELECT count(*) FROM Production.Product WHERE ListPrice > 0.00;
SELECT 
	Name as Nome, color, ListPrice, SafetyStockLevel, 
	ISNULL (CONVERT( VARCHAR(10), SellStartDate),'NO DATE') AS SellStartDate,
	ISNULL (CONVERT( VARCHAR(10),SellEndDate),'NO DATE') AS SellEndDate, 
	ISNULL (CONVERT( VARCHAR(10),ModifiedDate),'NO DATE') AS ModifiedDate
FROM 
	Production.Product WHERE ListPrice > 0.00 ORDER BY SafetyStockLevel ASC;

	--=========================================================================================
	--==========Created DW=============

