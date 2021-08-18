--������ �� ���� ������ AdventureWorks2017 ��������� ������:

-- 1) ������� ��� ������� �� ������� Sales.SalesTerritory.

SELECT *
FROM Sales.SalesTerritory

-- 2)������� ������� TerritoryID � Name �� ������� Sales.SalesTerritory.
SELECT TerritoryID, Name
FROM Sales.SalesTerritory


-- 3) ������� ��� ������, ������� ���������� ��� ����� �� Person.Person � LastName = �Norman�.
SELECT *
FROM Person.Person
WHERE LastName = 'Norman'

-- 4) ������� ��� ������ �� Person.Person, ��� EmailPromotion �� ����� 2. 
SELECT *
FROM Person.Person
WHERE EmailPromotion != 2

--5) ������� ���������� PersonType ���������� ��� ����� �� Person.Person � LastName 
--   ������������ � ����� � ��� �� ���������� 1 � EmailPromotion.  

SELECT COUNT (PersonType) AS PersonTypeInCommonWith
FROM Person.Person
WHERE LastName LIKE 'M%' 
-- OR EmailPromotion NOT LIKE '%1%'
   OR EmailPromotion !=1


-- 6) ������� ������ 3 ����������� ����������� �� Sales.SpecialOffer � ����������� DiscountPct, 
--    ������� �������� ����������� � 2013-01-01 �� 2014-01-01.

SELECT TOP 3* 
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'
ORDER BY DiscountPct DESC


-- 7)����� ����� ����������� ��� � ����� ������������ ������ �������� �� Production.Product.

SELECT MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product

-- 8) ����� ����� ����������� ��� � ����� ������������ ������ �������� 
--    ��� ������ ������������ ProductSubcategoryID �� Production.Product. 

SELECT ProductSubcategoryID, MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product
GROUP BY ProductSubcategoryID


-- 9) ����� ����� ����������� ��� � ����� ������������ ������ �������� ��� ������ 
--    ������������ ProductSubcategoryID �� Production.Product, ��� ���� �������� ���������(Color).

SELECT ProductSubcategoryID, Color, MIN(Weight) AS min_weight, MAX(Size) AS max_size
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color, ProductSubcategoryID