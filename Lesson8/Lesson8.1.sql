
/*IF (OBJECT_ID('CSV_Export') IS NOT NULL) DROP TABLE dbo.CSV_Export;

CREATE TABLE CSV_Export (
	first_name NVARCHAR(50),
	last_name NVARCHAR(50)
)

BULK INSERT dbo.CSV_Export
FROM 'C:\Users\Anastasia\Downloads\data.csv'
WITH (fieldterminator = ',', rowterminator = '\n');*/

IF (OBJECT_ID('last_Export') IS NOT NULL) DROP TABLE dbo.last_Export;

CREATE TABLE last_Export (
	--first_name NVARCHAR(50),
	last_name NVARCHAR(50)
)

BULK INSERT dbo.last_Export
FROM 'C:\Users\Anastasia\Downloads\last.csv'
WITH (fieldterminator = ',', rowterminator = '\n');


SELECT [dbo].[name_Export].[first_name] as FisrtnName,
       [dbo].[last_Export].last_name as LastName

FROM [dbo].[name_Export] CROSS JOIN [dbo].[last_Export];






--DROP TABLE  dbo.CSV_Export