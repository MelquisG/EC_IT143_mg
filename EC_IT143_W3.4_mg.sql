/*****************************************************************************************************************
NAME:    AdventureWorks Assignment Script
PURPOSE: Answer my selected 8 questions using the AdventureWorks sample database.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/12/2026   Melquicedec  1. Answer script for AdventureWorks Q1-Q8 using SQL formatting standards.


RUNTIME: 
0m 5s

NOTES: 
This script contains SQL statements addressing the selected questions from assignment 3.3
 
******************************************************************************************************************/

-- Author:Augustine Foday Kargbo
-- Q1: What is the number of employees that are currently working at AdventureWorks?
-- A1: This statement counts the number of current employees in the HumanResources.Employee table where CurrentFlag is set to 1.

SELECT 
    COUNT(*) AS CurrentEmployeeCount
FROM HumanResources.Employee
WHERE CurrentFlag = 1;

-- Author: Roland Kabongo Kayenga
-- Q2: Which product has the highest standard cost?
-- A2: The statement below retrieves the product name and standard cost for the product with the highest standard cost.

SELECT TOP 1 
    Name,
    StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

-- Author: Sylivia Amongin
-- Q3: I want to reward our top sales people. Which five salespeople have the highest year-to-date sales, and what are their names and territories?
-- A3: This statement joins SalesPerson with Person for names and SalesTerritory for territory names, sorting by SalesYTD descending to find the top 5.

SELECT TOP 5 
    p.FirstName,
    p.LastName,
    sp.SalesYTD,
    st.Name AS TerritoryName
FROM Sales.SalesPerson AS sp
JOIN Person.Person AS p
    ON sp.BusinessEntityID = p.BusinessEntityID
LEFT JOIN Sales.SalesTerritory AS st
    ON sp.TerritoryID = st.TerritoryID
ORDER BY sp.SalesYTD DESC;

-- Author: Melquicedec Gonzalez
-- Q4: We are reviewing our pricing strategies. Which specific bicycle models have a standard cost greater than one thousand dollars and are currently active for sale?
-- A4: The answer statment filters products belonging to the Bikes category, with a standard cost greater than $1,000 and SellEndDate IS NULL, which means that is active for sale.

SELECT DISTINCT 
    pm.Name AS ModelName,
    p.Name AS ProductName,
    p.StandardCost,
    p.SellStartDate
FROM Production.Product AS p
LEFT JOIN Production.ProductModel AS pm
    ON p.ProductModelID = pm.ProductModelID
JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Bikes'
    AND p.StandardCost > 1000
    AND p.SellEndDate IS NULL;


-- Author: Melquicedec Gonzalez
-- Q5: Our executive team is planning a promotional campaign targeting our most loyal corporate clients. I want a report showing the total order quantities and combined purchase amounts for each store customer during the fiscal year 2013?
-- A5: This statement will join Customer, Store, SalesOrderHeader, and SalesOrderDetail, filtering for Fiscal Year 2013 (July 1, 2012 to June 30, 2013) to aggregate quantities and purchase totals for each store.

SELECT 
    s.BusinessEntityID AS StoreID,
    s.Name AS StoreName,
    SUM(sod.OrderQty) AS TotalOrderQuantity,
    SUM(sod.LineTotal) AS CombinedPurchaseAmount
FROM Sales.Customer AS c
JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID
JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.OrderDate >= '2012-07-01'
    AND soh.OrderDate < '2013-07-01'
GROUP BY 
    s.BusinessEntityID,
    s.Name
ORDER BY CombinedPurchaseAmount DESC;

-- Author: Samuel Anto
-- Q6: Adventure Works is reviewing its customer retention strategy and wants to identify customers who have made repeat purchases. Which customers placed more than five orders between 2012 and 2013? Please provide their names, customer IDs, total orders, and total spending to help management identify valuable customers.
-- A6: The query below groups by customer and name, filtering orders placed between 2012 and 2013 with an order count greater than 5, and calculates total orders and total spending.

SELECT 
    c.CustomerID,
    p.FirstName,
    p.LastName,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpending
FROM Sales.Customer AS c
JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
WHERE soh.OrderDate >= '2012-01-01'
    AND soh.OrderDate <= '2013-12-31 23:59:59'
GROUP BY 
    c.CustomerID,
    p.FirstName,
    p.LastName
HAVING COUNT(soh.SalesOrderID) > 5
ORDER BY 
    TotalOrders DESC,
    TotalSpending DESC;

-- Author: Jose Roberto Martinez Cabrera
-- Q7: Which columns in the Production.Product table allow NULL values, and what data type is each of those columns? Please list the column names alphabetically.
-- A7: The query below queries INFORMATION_SCHEMA.COLUMNS for the Product table in the Production schema where IS_NULLABLE = 'YES', ordered alphabetically by column name.

SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
    AND TABLE_NAME = 'Product'
    AND IS_NULLABLE = 'YES'
ORDER BY COLUMN_NAME ASC;

-- Author: Roland Kabongo Kayenga
-- Q8: Using INFORMATION_SCHEMA.COLUMNS, which Adventure Works tables contain a column named Product ID?
-- A8: The query below searches INFORMATION_SCHEMA.COLUMNS across the database for columns named 'ProductID' to find all matching tables.

SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
ORDER BY 
    TABLE_SCHEMA,
    TABLE_NAME;