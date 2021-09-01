USE [AdventureWorks2017];
GO

--creating procedure

CREATE PROCEDURE UpdateNationalIDNumber
       @BusinessEntityID INT,
       @NationalIDNumber NVARCHAR(50)
       AS
       UPDATE [HumanResources].[Employee] 
       SET [NationalIDNumber]= @NationalIDNumber
       WHERE [BusinessEntityID] = @BusinessEntityID

--change NationalIDNumber

EXEC dbo.UpdateNationalIDNumber 15, 879341111

--Select

SELECT [BusinessEntityID], [NationalIDNumber]
FROM [HumanResources].[Employee]
WHERE [BusinessEntityID] = 15