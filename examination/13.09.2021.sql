1) Ќайдите людей и их номера телефонов, код города которых начинаетс€ на  4 и заканчиваетс€ на 5.
( таблицы Person.PersonPhone,) 

SELECT *
--from Person.PersonPhone
from  Person.Person

SELECT Person.PersonPhone.PhoneNumber,Person.Person.FirstName,Person.Person.LastName
FROM [Person].[Person], [Person].[PersonPhone]
WHERE  Person.PersonPhone.PhoneNumber LIKE '4_5%'

2) ќтнести каждого человека из [HumanResources].[Employee] в свою возрастную категорию:
Adolescence: 17-20
Adults: 21-59
Elderly: 60-75
Senile: 76-90



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
	,CONSTRAINT FK_Pupil_To_Teacher FOREIGN KEY (TeacherId)  REFERENCES Teacher (Id)
	,CONSTRAINT FK_Pupil_To_School FOREIGN KEY (SchoolId)  REFERENCES School (Id)
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


