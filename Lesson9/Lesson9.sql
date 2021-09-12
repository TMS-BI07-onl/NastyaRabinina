------------LOCATION--------------------------------------

IF (OBJECT_ID('location') IS NOT NULL) DROP TABLE dbo.Locations;

CREATE TABLE Locations (
    ID INT CONSTRAINT PK_Location_Id PRIMARY KEY IDENTITY NOT NULL,
	LocationName NVARCHAR(50) NOT NULL,
	Country NVARCHAR(50) NOT NULL
)

BULK INSERT dbo.Locations
FROM 'C:\Users\Anastasia\Downloads\location.csv'
WITH (fieldterminator = ',', rowterminator = '\n');

------------------------JUDGE-------------------------------------
IF (OBJECT_ID('judge') IS NOT NULL) DROP TABLE dbo.Judge;

CREATE TABLE Judge (
    ID INT CONSTRAINT PK_Judge_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	CompetitionID INT NOT NULL,
	Rank NVARCHAR(20),
	SwimStyle NVARCHAR(30)
	--,CONSTRAINT FK_Judge_To_Competition FOREIGN KEY (CompetitionId)  REFERENCES Competition (Id)
)

BULK INSERT dbo.Judge
FROM 'C:\Users\Anastasia\Downloads\judge.csv'
WITH (fieldterminator = ',', rowterminator = '\n');

-----------------------TRAINER--------------------------------------

IF (OBJECT_ID('trainer') IS NOT NULL) DROP TABLE dbo.trainer;

CREATE TABLE Trainer (
    ID INT CONSTRAINT PK_Trainer_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	Rank NVARCHAR(10)
)

BULK INSERT dbo.trainer
FROM 'C:\Users\Anastasia\Downloads\trainer.csv'
WITH (fieldterminator = ',', rowterminator = '\n');

-------------------------SWIMMER--------------------------------------
IF (OBJECT_ID('swimmer') IS NOT NULL) DROP TABLE dbo.Swimmer;

CREATE TABLE Swimmer (
    ID INT CONSTRAINT PK_Swimmer_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	BirthDate DATE,
	Gender NVARCHAR(10) NOT NULL,
	Rank NVARCHAR(10),
	TrainerID INT NOT NULL
	,CONSTRAINT FK_Swimmer_To_Trainer FOREIGN KEY (TrainerId)  REFERENCES Trainer (Id) 
)

BULK INSERT dbo.Swimmer
FROM 'C:\Users\Anastasia\Downloads\swimmer8.csv'
WITH (fieldterminator = ',', rowterminator = '\n');

--ALTER TABLE Swimmer
--ALTER COLUMN Gender NVARCHAR(10);
select *
from [dbo].[Swimmer]



------------------------------COMPETITION---------------------------------------
IF (OBJECT_ID('competition') IS NOT NULL) DROP TABLE [dbo].[Competition];

CREATE TABLE Competition (
	ID INT CONSTRAINT PK_Competition_Id PRIMARY KEY IDENTITY NOT NULL,
	SwimmerID INT NOT NULL,
	LocationID INT NOT NULL,
	JudgeID INT NOT NULL,
	ResultTime FLOAT NOT NULL,
	Date DATE NOT NULL,
	--EndDate DATETIME,
	CONSTRAINT FK_Competition_To_Swimmer FOREIGN KEY (SwimmerId)  REFERENCES Swimmer (Id),
	CONSTRAINT FK_Competition_To_Location FOREIGN KEY (LocationId)  REFERENCES Locations (Id),
	CONSTRAINT FK_Competition_To_Judge FOREIGN KEY (JudgeId)  REFERENCES Judge (Id)

)

BULK INSERT dbo.Competition
FROM 'C:\Users\Anastasia\Downloads\competition.csv'
WITH (fieldterminator = ',', rowterminator = '\n');





ALTER TABLE [dbo].[Judge]
   ADD CONSTRAINT FK_Judge_To_Competition FOREIGN KEY (CompetitionId)  REFERENCES Competition (Id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;


