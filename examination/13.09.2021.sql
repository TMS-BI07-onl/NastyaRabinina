1) Ќайдите людей и их номера телефонов, код города которых начинаетс€ на  4 и заканчиваетс€ на 5.
( таблицы Person.PersonPhone,) 

SELECT *
--from Person.PersonPhone
from  Person.Person

SELECT Person.PersonPhone.PhoneNumber,Person.Person.FirstName,Person.Person.LastName
FROM [Person].[Person] p
JOIN [Person].[PersonPhone] pp ON p.BusinessEntityID= pp.BusinessEntityID
WHERE  Person.PersonPhone.PhoneNumber LIKE '4_5%'

2) ќтнести каждого человека из [HumanResources].[Employee] в свою возрастную категорию:
Adolescence: 17-20
Adults: 21-59
Elderly: 60-75
Senile: 76-90

SELECT FirstName, LastName,
    CASE WHEN DATEDIFF(year, BirthDate, GETDATE()) BETWEEN 17 AND 20 THEN 'Adolescence'
	     WHEN DATEDIFF(year, BirthDate, GETDATE()) <=59 THEN 'Adults'
		 WHEN DATEDIFF(year, BirthDate, GETDATE()) <=75 THEN 'Elderly'
		 WHEN DATEDIFF(year, BirthDate, GETDATE()) <=90 THEN 'Sentile'
    END
	AS Category
FROM [HumanResources].[Employee] h
JOIN [Person].[Person] pp
ON h.BusinessEntityID=pp.BusinessEntityID;


3) ¬ывести самый дорогой продукт дл€ каждого цвета из [Production].[Product]

SELECT  [ProductID], [Name], [Color], ListPrice
FROM [Production].[Product]
WHERE(
  SELECT MAX(ListPrice) as MaxPrice
  FROM [Production].[Product]
  GROUP BY Color)


CREATE TABLE Pupil (
    ID INT CONSTRAINT PK_Pupil_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	BirthDate DATE,
	Gender NVARCHAR(1) NOT NULL,
	Class INT NOT NULL,
	TeacherID INT NOT NULL,
	SchoolID INT NOT NULL
)

CREATE TABLE Teacher (
    ID INT CONSTRAINT PK_Teacher_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	Gender NVARCHAR(1) NOT NULL,
	Class INT NOT NULL,
	SchoolID INT NOT NULL
)

CREATE TABLE Class (
    ID INT CONSTRAINT PK_Class_Id PRIMARY KEY IDENTITY NOT NULL,
	Number INT NOT NULL,
	Letter NVARCHAR(2) NOT NULL,
	Direction NVARCHAR(20) NOT NULL UNIQUE, 
)

CREATE TABLE Subject (
    ID INT CONSTRAINT PK_Subject_Id PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Cabinet (
    ID INT CONSTRAINT PK_Cabinet_Id PRIMARY KEY IDENTITY NOT NULL,
	Number INT NOT NULL,
	Name NVARCHAR(50) NOT NULL
)

CREATE TABLE School (
    ID INT CONSTRAINT PK_School_Id PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Adress NVARCHAR(50) NOT NULL
)

CREATE TABLE Parents (
    ID INT CONSTRAINT PK_Parent_Id PRIMARY KEY IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PassportNumber NVARCHAR(20) NOT NULL UNIQUE, 
	Gender NVARCHAR(1) NOT NULL,
	Adress NVARCHAR(50) NOT NULL
	TelNum INT NOT NULL,
	SchoolID INT NOT NULL
)