/*1.Examine the data in the Production.UnitMeasure table. 
Check to see if there is a UnitMeasureCode starting with the letter 'T'. 
How many different codes are there? Insert the following dataset into the table:
TT1, Test 1, September 9, 2020
TT2 test 2 getdate ()
CHECK IN UnitMeasureCode starting with the letter 'T'. 
*/

SELECT *
FROM Production.UnitMeasure

SELECT UnitMeasureCode
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

SELECT COUNT(DISTINCT UnitMeasureCode) 
FROM Production.UnitMeasure 

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate) 
VALUES ('TT1', 'Test1', '2020-09-09T00:00:00.000'),
       ('TT2', 'Test2', GETDATE())


/*
USE [AdventureWorks2017]
SELECT * FROM [Production].[UnitMeasure]
DELETE [Production].[UnitMeasure]
WHERE [Production].[UnitMeasure].[UnitMeasureCode] = 'TT2'
*/


/* 2
*/

SELECT [Production].[UnitMeasure].UnitMeasureCode, [Production].[UnitMeasure].Name, [Production].[UnitMeasure].ModifiedDate
INTO Production.UnitMeasureTest1
FROM Production.UnitMeasure
WHERE [Production].[UnitMeasure].UnitMeasureCode = ('TT1') 
           OR [Production].[UnitMeasure].UnitMeasureCode = ('TT2')
		      OR [Production].[UnitMeasure].UnitMeasureCode <= 'CAN'

/* 3
*/

UPDATE  [Production].[UnitMeasureTest1]
	SET UnitMeasureCode = ('TTT'); 

/* 4
*/
SELECT * 
FROM Production.UnitMeasureTest1

TRUNCATE TABLE Production.UnitMeasureTest1

/* 5
*/

SELECT *
FROM [Sales].[SalesOrderDetail]


SELECT [SalesOrderID], [LineTotal],
       MAX(LineTotal) OVER (PARTITION BY SalesOrderID) AS Max_LT,
	   MIN(LineTotal) OVER (PARTITION BY SalesOrderID) AS Min_LT,
	   AVG(LineTotal) OVER (PARTITION BY SalesOrderID) AS Avg_LT
FROM [Sales].[SalesOrderDetail]
WHERE [SalesOrderID] IN (43659, 43664)


/* 6
*/


SELECT  [BusinessEntityID], [FirstName], [LastName], SalesYTD,
    ROW_NUMBER() OVER (ORDER BY SalesYTD DESC ) AS "Row Number",  
    RANK() OVER (ORDER BY SalesYTD DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY SalesYTD DESC) AS "Dense Rank" ,
	UPPER(LEFT(LastName, 3))+'login'+(SELECT TerritoryGroup)  AS Login 
FROM [Sales].[vSalesPerson]
ORDER BY SalesYTD DESC

SELECT  [BusinessEntityID], [FirstName], [LastName], [SalesLastYear],
    ROW_NUMBER() OVER (ORDER BY [SalesLastYear] DESC ) AS "Row Number",  
    RANK() OVER (ORDER BY [SalesLastYear] DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY [SalesLastYear] DESC) AS "Dense Rank" 
FROM [Sales].[vSalesPerson]
ORDER BY [SalesLastYear] DESC
