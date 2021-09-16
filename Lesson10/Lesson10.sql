
SELECT *
FROM [Production].[WorkOrder]


/*SELECT distinct year, month, 
   SUM(OrderQty) over(partition by year) as sum1
FROM 
   (SELECT ProductID, OrderQty, 
       DATENAME(mm, StartDate) as month, DATEPART(yy, StartDate) as year
    FROM [Production].[WorkOrder]) AS tmp
*/


USE AdventureWorks2017;  
GO 
SELECT Year, [12] AS December, [1] AS January, [2] AS February
FROM 
    (SELECT OrderQty,  DATEPART(mm, StartDate) AS month, DATEPART(yy, StartDate) AS year
     FROM Production.WorkOrder) AS p
PIVOT
    (SUM(OrderQty)
     FOR Month IN ([12], [1], [2])) AS pvt
ORDER BY YEAR

