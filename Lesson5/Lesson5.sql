CREATE TABLE Patients (
    ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	FirstName NVARCHAR(20) NULL,
	LastName  NVARCHAR(20) NOT NULL,
	SSN UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	Email AS CONCAT(UPPER(SUBSTRING(FirstName, 1,1)), LOWER(SUBSTRING(LastName, 1,3)),'@mail.com'),
	Temp FLOAT NOT NULL CHECK (Temp> 0 AND Temp<=45),
	CreatedDate DATETIME NOT NULL DEFAULT GETDATE()
)
GO

select * from [dbo].[Patients]
delete [dbo].[Patients]

INSERT INTO dbo.Patients  (FirstName, LastName, Temp)
VALUES 
('Wartian', 'Koskitalo', 38.5),
('Wellington', 'Importadora', 37),
(NULL, 'Importadora', 37.45),
--('Wellington', NULL, 37),
('Paula', 'Parente', 12),  
--('Patricio', 'Simpson', 0 ),
('Ernst', 'Handel', 45.0),	
('Roland',  'Mendel', 26)  
--('Maison',  'Dewey', 68), 
--(NULL,  'Dewey', 68) 
--('Wellington', 'Importadora', 37),


ALTER TABLE dbo.Patients
ADD TempType AS 
    CASE WHEN Temp < 38 THEN '< 38°C'
	     WHEN Temp >= 38 THEN '>= 38°C'
	END 




CREATE VIEW dbo.vInFahrenheit 
AS SELECT FirstName, LastName, Temp,
CAST((([dbo].[Patients].Temp * 9/5) +32) AS NVARCHAR) AS InFahrenheit  
--SELECT CONVERT(Temp * 9/5+32, float ) AS InFahrenheit
--SELECT TRY_CONVERT(((Temp * 9/5) +32), '') AS InFahrenheit
FROM [dbo].[Patients]

--select * from dbo.vInFahrenheit 
--DROP VIEW dbo.vInFahrenheit 



DECLARE @tCelcius FLOAT,  @tFahrenheit FLOAT
SET @tCelcius = 36.6
SET @tFahrenheit = ((@TCelcius  * 9/5) +32)
SELECT @tCelcius, @tFahrenheit
PRINT 'Temperature in Celcius' + STR(@tCelcius, 5) + '°C';
PRINT 'Temperature in Fahrenheit ' + STR(@tFahrenheit, 5) + ' °F';


DECLARE  @tCelcius1 FLOAT
SET @tCelcius1 = 37.9
SELECT CAST((( @tCelcius1* 9/5) +32) AS NVARCHAR) AS InFahrenheit;




DECLARE @d DATETIME, @num INT
SET @d = DATEADD(DAY, - DATEPART(DAY, GETDATE()) + 1, CONVERT(DATE, GETDATE()))
SET @num = DATEPART (DW, DATEADD (DAY, 1, EOMONTH(GETDATE (), -1)))
SELECT @d AS first_day, @num AS num,
        CASE WHEN @num <= 5 
                   THEN @d
              ELSE 7-@num+1 
END

